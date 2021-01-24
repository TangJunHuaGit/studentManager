<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分配角色</title>

    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/font/dtreefont.css">
    <script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
</head>
<body>
<ul id="functionTree" class="dtree" data-id="0" data-value="001"></ul>
<div class="layui-form-item">
    <div class="layui-input-block">
        <button type="submit" class="layui-btn" lay-submit="" lay-filter="add-submit">立即提交</button>
    </div>
</div>
</body>
<script type="text/javascript">
    layui.extend({
        dtree: '${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['dtree', 'layer', 'jquery', 'form'], function () {
        var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery, form = layui.form;
        form.render();
        var roleId = getQueryVariable("roleId");//获取界面穿的id
        //最开始进来已拥有的菜单权限，
        let hasFunctions = [];
        // 初始化树
        var DTreeNode = dtree.render({
            elem: "#functionTree",
            url: "${ctx}/sysFunction/loadTreeFunction.action?roleId=" + roleId,
            checkbar: true,
            checkbarType: "all",
            initLevel: 2,
            menubar: true,
            response: {treeId: "functionId", parentId: 'functionParentId', title: "functionName"},
            menubarFun: {
                remove: function (checkbarNodes) { // 必须将该方法实现了，节点才会真正的从后台删除哦
                    return true;
                }
            },
            success: function (data, obj) {
            },
            complete: function (XMLHttpRequest, textStatus) {
                hasFunctions = dtree.getCheckbarNodesParam("functionTree");
            }
        });

        // 绑定节点点击
        dtree.on("node('functionTree')", function (obj) {
            var nodeId = obj.param.nodeId;
            DTreeNode.clickNodeCheckbar(nodeId);// 点击节点选中复选框
        });
        form.on('submit(add-submit)', () => {
            //拿到已拥有的权限ids
            let arr1 = hasFunctions.map(item => item.nodeId);
            //修改后的数组
            let updateData = dtree.getCheckbarNodesParam("functionTree");
            //修改后权限ids
            let arr2 = updateData.map(item => item.nodeId);
            // 1、先取出两个数组相同的元素
            let eqItems = [];
            arr2.forEach(item2 => {
                arr1.forEach(item1 => {
                    if (item1 === item2) {
                        eqItems.push(item1)
                    }
                });
            });
            // 2、在用相同元素和arr1判断 取出被删掉的数据
            let delItems = getArrDifference(arr1, eqItems);
            delItems = delItems.map(item => Number(item));
            let addItems = getArrDifference(arr2, eqItems);
            addItems = addItems.map(item => Number(item));
            let params = {addIds: JSON.stringify(addItems), delIds: JSON.stringify(delItems), roleId: roleId};
            $.post("${ctx}/sysRole/sourceAllot.action", params, (data) => {
                if (data.code === 200) {
                    var index = parent.layer.getFrameIndex(window.name);
                    layer.msg(data.describe);
                    setTimeout(function () {
                        parent.layer.close(index);
                        parent.layui.table.reload('roleList');
                    }, 500)
                }
            });
            return false;
        });
        //获取对象中发生变化的对象
        function getArrDifference(arr1, arr2) {
            return arr1.concat(arr2).filter((v, i, arr) => arr.indexOf(v) === arr.lastIndexOf(v));
        }
        //获取界面传参的方法
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] === variable) {
                    return pair[1];
                }
            }
            return false;
        }
    });
</script>
</html>

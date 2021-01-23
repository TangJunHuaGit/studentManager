<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>权限管理</title>
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
          media="all"/>
    <link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css"
          media="all"/>
    <script type="application/javascript" >
        var userPermission = '${currentUserPermission}';
        var permissionObj = JSON.parse(userPermission);
        var add = false;
        var batchDel = false;
        var edit = false;
        var del = false;
    </script>
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" id="searchForm" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">角色名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="functionName" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" autocomplete="off" placeholder="yyyy-MM-dd HH:mm:ss"
                       class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <a class="layui-btn search_btn">查询</a>
        <button type="reset" class="layui-btn layui-btn-warm">清空</button>
    </div>
</form>
<table id="menuList" lay-filter="menuList" class="menuList"></table>
<!--表格工具条-->
<script type="text/html" id="tableToolBar">
    {{# layui.each(permissionObj, function(index, item){ }}
        {{# if(item.functionCode == 'addMenu'){ }}
            {{# add = true}}
        {{# } }}
        {{# if(item.functionCode == 'batchDeleteMenu'){ }}
            {{# batchDel = true}}
        {{# } }}
    {{#  }); }}
    {{# if(add){ }}
        <a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
    {{#} }}
    {{# if(batchDel){ }}
        <a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
    {{#} }}
</script>
<!--操作-->
<script type="text/html" id="tableToolBarLine">
    {{# layui.each(permissionObj, function(index, item){ }}
        {{# if(item.functionCode == 'updateMenuByMenuId'){ }}
            {{# edit = true}}
        {{# } }}
        {{# if(item.functionCode == 'deleteMenu'){ }}
            {{# del = true}}
        {{# } }}
    {{#  }); }}
    {{# if(edit){ }}
        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    {{# } }}
    {{# if(del){ }}
        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } }}
    <%--        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>--%>
    <%--    {{#  } }}--%>

</script>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
</body>
<script type="text/javascript">
    var tableIns;
    layui.use(['form', 'layer', 'table', 'laydate'], function () {
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            laydate = layui.laydate,
            table = layui.table;
        laydate.render({
            elem: "#startTime"
            , type: 'datetime'
        })
        laydate.render({
            elem: "#endTime"
            , type: 'datetime'
        })
        tableIns = table.render({
            id: "menuList",
            elem: '#menuList'
            , url: "${ctx}/sysFunction/loadAllMenu.action"
            , height: 'full-200'
            , cellMinWidth: 80
            , page: true
            , limit: 50
            , toolbar: '#tableToolBar'
            , cols: [[
                {type: 'checkbox'}
                , {field: 'id', title: 'id', sort: true, hide: true}
                , {field: 'title', title: '菜单名称'}
                , {field: 'remark', title: '备注', sort: true}
                , {field: 'state', title: 'state', sort: true, align: 'center', hide: true}
                , {field: 'href', title: '地址', sort: true, align: 'center'}
                , {field: 'functionOrderNum', title: '排序', sort: true, align: 'center'}
                , {fixed: 'right', title: '操作', width: 165, align: 'center', toolbar: '#tableToolBarLine'}
            ]]
            , done: function (res, curr, count) {
                if (curr > 1 && res.data.length === 0) {
                    curr = curr - 1;
                    table.reload('menuList', {
                        page: {
                            curr: curr
                        },
                        where: null,
                    });
                }
            }
        });
        //查询
        $(".search_btn").click(function () {
            var params = $("#searchForm").serialize();
            table.reload('menuList', {
                url: '${ctx}/sysFunction/loadAllMenu.action?' + params
            });
        });
        //监听头工具栏事件
        table.on('toolbar(menuList)', function (obj) {
            switch (obj.event) {
                case 'add':
                    toAddMenu();
                    break;
                case 'batchDel':
                    batchDeleteMenu();
                    break;
            }
            ;
        });
        table.on('tool(menuList)', function (obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                , layEvent = obj.event; //获得 lay-event 对应的值
            var functionId = obj.data.id; //得到id
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url: "${ctx}/sysRole/updateRoleStateByRoleId.action",
                        type: 'POST',
                        async: true,    //或false,是否异步
                        data: {functionId: functionId},
                        timeout: 5000,    //超时时间
                        dataType: 'json',
                        success: function (data) {
                            layer.msg(data.msg);
                            tableIns.reload();
                        }
                    });
                });
            } else if (layEvent === 'edit') {
                toUpdateMenu(functionId);
            }
        });

        //批量删除
        function batchDeleteMenu() {
            //得到当前表格里面的checkbox的选中对象集合
            var checkStatus = table.checkStatus('menuList'),//选中状态
                data = checkStatus.data;//选中的对象集
            var ids = new Array();
            if (data.length > 0) {
                for (var i in data) {
                    ids.push(data[i].roleId);
                }
                layer.confirm('确定删除选中的角色？', {icon: 3, title: '提示信息'}, function (index) {
                    $.post("${ctx}/sysRole/updateRoleStateByRoleIds.action?ids=" + ids, function (data) {
                        layer.msg(data.msg);
                        setTimeout(function () {
                            tableIns.reload();
                            //关闭提示框
                            layer.close(index);
                        }, 500)
                    })
                })
            } else {
                layer.msg("请选择需要删除的角色");
            }
        }

        //打开  添加菜单
        function toAddMenu() {
            var index = layui.layer.open({
                title: "添加菜单",
                type: 2,//ifream层
                area: ["500px", "500px"],
                content: "${ctx }/menuManager/addMenu.action",
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回角色列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
        }

        function toUpdateMenu(functionId) {
            var index = layui.layer.open({
                title: "修改角色",
                type: 2,//ifream层n
                area: ["500px", "400px"],
                content: "${ctx}/menuManager/updateMenu.action?functionId=" + functionId,
                success: function (layero, index) {
                    setTimeout(function () {
                        layui.layer.tips('点击此处返回菜单列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    }, 500)
                }
            });
        }
    });
</script>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资源分配</title>

    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css">
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/font/dtreefont.css">
    <script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
</head>
<body>
    <ul id="demoTree" class="dtree" data-id="0" data-value="001"></ul>
</body>
<script type="text/javascript">
    layui.extend({
        dtree: '${ctx}/resources/layuiadmin/dtree/layui_ext/dtree/dtree'   // {/}的意思即代表采用自有路径，即不跟随 base 路径
    }).use(['dtree','layer','jquery'], function(){
        var dtree = layui.dtree, layer = layui.layer, $ = layui.jquery;

        var roleId = getQueryVariable("roleId");//获取界面穿的id
        // 初始化树
        dtree.render({
            elem: "#demoTree",
            url: "${ctx}/sysFunction/loadTreeFunction.action?roleId="+roleId,
            checkbar: true,
            checkbarType: "all",
            initLevel: 2,
            menubar:true,
            response:{treeId:"functionId",parentId:1,title:"functionName"},
            menubarFun: {
                remove: function(checkbarNodes){ // 必须将该方法实现了，节点才会真正的从后台删除哦
                    return true;
                }
            }
        });

        // 绑定节点点击
        dtree.on("node('demoTree')" ,function(obj){
            layer.msg(JSON.stringify(obj.param));
        });

        //获取界面传参的方法
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] === variable){return pair[1];}
            }
            return false;
        }
    });
</script>
</html>

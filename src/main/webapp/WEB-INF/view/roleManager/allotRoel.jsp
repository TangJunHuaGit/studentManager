<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
          media="all" />
    <link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css"
          media="all" />

</head>
<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" id="searchForm" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" >用户名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="roleName"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime"  placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" autocomplete="off"  placeholder="yyyy-MM-dd HH:mm:ss" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <a class="layui-btn search_btn" >查询</a>
        <button type="reset" class="layui-btn layui-btn-warm">清空</button>
    </div>
</form>
<table id="roleUserList" lay-filter="roleUserList" class="roleUserList"></table>

<!--表格工具条-->
<script type="text/html" id="tableToolBar">
    <a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
    <a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
</script>
<!--操作-->
<script type="text/html" id="tableToolBarLine">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
</body>
<script type="text/javascript">
    var tableIns;
    layui.use(['form','layer','table','laydate'],function(){
        var form = layui.form,
            layer = parent.layer === undefined ? layui.layer : top.layer,
            $ = layui.jquery,
            laydate=layui.laydate,
            table = layui.table;
        var roleId = getQueryVariable("roleId");//获取界面穿的id
        laydate.render({
            elem:"#startTime"
            ,type: 'datetime'
        })
        laydate.render({
            elem:"#endTime"
            ,type: 'datetime'
        })
        tableIns = table.render({
            id:"roleUserList",
            elem: '#roleUserList'
            ,url: "${ctx}/sysRole/loadUsersByRoleId.action?roleId="+roleId
            ,height: 'full-200'
            ,cellMinWidth: 80
            ,page: true
            ,limit: 10
            ,toolbar: '#tableToolBar'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'userId', title: 'userId', sort: true,hide:true}
                ,{field:'userName', title: '用户名称'}
                ,{field:'remark', title: '备注', sort: true}
                ,{field:'state', title: 'state', sort: true, align: 'center',hide:true}
                ,{fixed: 'right',title: '操作',width: 185, align:'center', toolbar: '#tableToolBarLine'}
            ]]
            ,done: function (res, curr, count) {
                if (curr > 1 && res.data.length === 0) {
                    curr = curr - 1;
                    table.reload('roleUserList', {
                        page: {
                            curr: curr
                        },
                        where: null,
                    });
                }
            }
        });
        //查询
        $(".search_btn").click(function(){
            var params=$("#searchForm").serialize();
            table.reload('roleUserList', {
                url: '${ctx}/sysRole/loadUsersByRoleId.action?roleId='+roleId+'&'+params
            });
        });
        //监听头工具栏事件
        table.on('toolbar(roleUserList)', function(obj){
            switch(obj.event){
                case 'add':
                    toAddUser();
                    break;
                case 'batchDel':
                    batchDeleteRole();
                    break;
            };
        });
        table.on('tool(roleUserList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值

            var userId = obj.data.userId; //得到id
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:"${ctx}/sysRole/deleteRoleUser.action",
                        type:'POST',
                        async:true,    //或false,是否异步
                        data:{roleId:roleId,userId:userId},
                        timeout:5000,    //超时时间
                        dataType:'json',
                        success:function(data){
                            layer.msg(data.msg);
                            tableIns.reload();
                        }
                    });
                });
            }
        });
        //批量删除
        function batchDeleteRole(){
            //得到当前表格里面的checkbox的选中对象集合
            var checkStatus = table.checkStatus('roleUserList'),//选中状态
                data = checkStatus.data;//选中的对象集
            var ids = new Array();
            if(data.length > 0) {
                for (var i in data) {
                    ids.push(data[i].roleId);
                }
                layer.confirm('确定删除选中的用户？', {icon: 3, title: '提示信息'}, function (index) {
                    $.post("${ctx}/sysRole/updateRoleStateByRoleIds.action?ids="+ids,function(data){
                        layer.msg(data.msg);
                        setTimeout(function(){
                            tableIns.reload();
                            //关闭提示框
                            layer.close(index);
                        },500)
                    })
                })
            }else{
                layer.msg("请选择需要删除的用户");
            }
        }
        //打开  添加人
        function toAddUser(){
            let kd = window.innerWidth*0.8+"px";
            let gd = window.innerHeight*0.8+"px";
            var index = layui.layer.open({
                title : "添加用户",
                type : 2,//ifream层
                area:[kd,gd],
                content : "${ctx }/roleManager/addRoleUser.action?roleId="+roleId,
                success : function(layero, index){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回用户列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500)
                }
            });
        }
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

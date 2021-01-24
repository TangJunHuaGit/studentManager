<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘记密码</title>
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
            <label class="layui-form-label" >班级名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="className"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime" autocomplete="off" class="layui-input">
            </div>
        </div>
         <div class="layui-inline">
            <label class="layui-form-label" >结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <a class="layui-btn search_btn" >查询</a>
        <button type="reset" class="layui-btn layui-btn-warm">清空</button>
    </div>
</form>
<table id="classList" lay-filter="classList"></table>

<!--表格工具条-->
<script type="text/html" id="tableToolBar">
	<a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
	<a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
</script>
<!--操作-->
<script type="text/html" id="classToolBar">
   		 <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
   		 <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
</script>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
</body>
<script type="text/javascript">
	var tableIns;
    layui.config({
        base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['form','layer','table','laydate'],function(){
	        var form = layui.form,
	        layer = parent.layer === undefined ? layui.layer : top.layer,
	        $ = layui.jquery,
	        laydate=layui.laydate,
	        table = layui.table;
		    laydate.render({
		    	elem:"#startTime"
		    })
		     laydate.render({
		    	elem:"#endTime"
		    })
    	    tableIns = table.render({
    	      id:"classList",
    	      elem: '#classList'
    	      ,url: "${ctx}/class/loadAllClass.action"
    	      ,height: 'full-200'
    	      ,cellMinWidth: 80
    	      ,page: true
    	      ,limit: 30
    	      ,toolbar: '#tableToolBar'
    	      ,cols: [[
    	        {type:'checkbox'}
    	        ,{field:'classId', title: 'classId', sort: true,hide:true}
    	        ,{field:'className', title: '班级名称'}
    	        ,{field:'remark', title: '备注'}
    	        ,{field:'sate', title: 'sate', sort: true, align: 'center',hide:true}
    	        ,{field:'userName', title: '创建人', sort: true, align: 'center'}
    	        ,{field:'createTime', title: '创建时间', sort: true, align: 'center'}
                ,{fixed: 'right',title: '操作',width: 200, align:'center', toolbar: '#classToolBar'}
    	      ]]
    	    });
    	  //查询
           $(".search_btn").on("click",function(){
               var params=$("#searchForm").serialize();
               table.reload('classList', {
                   url: '${ctx}/class/loadAllClass.action?'+params
               });
           });
           //监听头工具栏事件
           table.on('toolbar(classList)', function(obj){
               switch(obj.event){
   	            case 'add':
   	               	toAddClass();
                   	break;
                   case 'batchDel':
                   	batchDeleteClass();
                       break;
               };
           });
        table.on('tool(classList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值

            var classId = obj.data.classId; //得到id
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:"${ctx}/class/updateClassStateByclassId.action",
                        type:'POST',
                        async:true,    //或false,是否异步
                        data:{classId:classId},
                        timeout:5000,    //超时时间
                        dataType:'json',
                        success:function(data){
                            layer.msg(data.msg);
                            tableIns.reload();
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                toUpdateClass(classId);
            }
        });
           //批量删除
           function batchDelete(){
               //得到当前表格里面的checkbox的选中对象集合
               var checkStatus = table.checkStatus('leaveBillListTable'),//选中状态
                   data = checkStatus.data;//选中的对象集
               var ids="a=1";
               if(data.length > 0) {
                   for (var i in data) {
                       ids+="&ids="+data[i].id;
                   }
                   layer.confirm('确定删除选中的班级？', {icon: 3, title: '提示信息'}, function (index) {
                       $.post("${ctx}/leaveBill/batchDeleteLeaveBill.action?"+ids,function(data){
                           //刷新table
                           tableIns.reload();
                           //关闭提示框
                           layer.close(index);
                       })
                   })
               }else{
                   layer.msg("请选择需要删除的班级");
               }
           }
           //打开  添加班级
           function toAddClass(){
               var index = layui.layer.open({
                   title : "添加班级",
                   type : 2,//ifream层
                   area:["800px","500px"],
                   content : "${ctx }/classManager/addClass.action",
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回班级列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
               function toUpdateClass(classId){
                   var index = layui.layer.open({
                       title : "修改班级",
                       type : 2,//ifream层
                       area:["100%","100%"],
                       content : "${ctx}/class/updateClass.action?ClassId="+ClassId,
                       success : function(layero, index){
                           setTimeout(function(){
                               layui.layer.tips('点击此处返回班级列表', '.layui-layer-setwin .layui-layer-close', {
                                   tips: 3
                               });
                           },500);
                           //layer.full(index);
                       }
                   });
               }
               //layui.layer.full(index);
               //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
               $(window).on("resize",function(){
                   layui.layer.full(index);
               });
           }
    });
</script>
</html>

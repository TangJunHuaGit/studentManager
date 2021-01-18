<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理</title>
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css" media="all" />
</head>
<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" id="searchForm" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" >学生名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="studentName"  autocomplete="off" class="layui-input">
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
<table id="studentList" lay-filter="studentList" class="studentList"></table>

<!--表格工具条-->
<script type="text/html" id="tableToolBar">
	<a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
	<a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
</script>
<!--操作-->
<script type="text/html" id="tableToolBarLine">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
		    laydate.render({
		    	elem:"#startTime"
		    	,type: 'datetime'
		    })
		     laydate.render({
		    	elem:"#endTime"
		    	,type: 'datetime'
		    })
    	    tableIns = table.render({
    	      id:"studentList",
    	      elem: '#studentList'
    	      ,url: "${ctx}/student/loadAllStudent.action"
    	      ,height: 'full-200'
    	      ,cellMinWidth: 80
    	      ,page: true
    	      ,limit: 10
    	      ,toolbar: '#tableToolBar'
    	      ,cols: [[
    	        {type:'checkbox'}
    	        ,{field:'studentId', title: 'studentId', sort: true,hide:true}
    	        ,{field:'studentName', title: '学生名称'}
    	        ,{field:'studentPhone', title: '手机号码'}
    	        ,{field:'studentBirthday', title: '出生日期'}
    	        ,{field:'className', title: '所属班级'}
    	        ,{field:'teacherName', title: '班主任'}
    	        ,{field:'remark', title: '备注', sort: true}
    	        ,{field:'state', title: 'state', sort: true, align: 'center',hide:true}
    	        ,{field:'userName', title: '创建人', sort: true, align: 'center'}
    	        ,{field:'createTime', title: '创建时间', sort: true, align: 'center'}
    	        ,{fixed: 'right',title: '操作',width: 165, align:'center', toolbar: '#tableToolBarLine'}
    	      ]]
    	      ,done: function (res, curr, count) {
    	            if (curr > 1 && res.data.length === 0) {
    	                curr = curr - 1;
    	                table.reload('studentList', { 
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
               table.reload('studentList', {
                   url: '${ctx}/student/loadAllStudent.action?'+params
               });
           });
           //监听头工具栏事件
           table.on('toolbar(studentList)', function(obj){
               switch(obj.event){
   	            case 'add':
   	               	toAddStudent();
                   	break;
                   case 'batchDel':
                   	batchDeleteStudent();
                       break;
               };
           });
           table.on('tool(studentList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        	    var data = obj.data //获得当前行数据
        	    ,layEvent = obj.event; //获得 lay-event 对应的值
        	    
        	    var StudentId = obj.data.StudentId; //得到id
        	    if(layEvent === 'del'){
        	      layer.confirm('真的删除行么', function(index){
        	        obj.del(); //删除对应行（tr）的DOM结构
        	        layer.close(index);
        	        //向服务端发送删除指令
        	        $.ajax({
        	               url:"${ctx}/student/updateStudentStateByStudentId.action",
        	               type:'POST',
       				       async:true,    //或false,是否异步
       				       data:{StudentId:StudentId},
       				       timeout:5000,    //超时时间
       				       dataType:'json',
        	               success:function(data){
        	            	   layer.msg(data.msg);
        	            	   tableIns.reload();
        	               }
        	           });
        	      });
        	    } else if(layEvent === 'edit'){
        	    	toUpdateStudent(StudentId);
        	    }
        	  });
           //批量删除
           function batchDeleteStudent(){
               //得到当前表格里面的checkbox的选中对象集合
               var checkStatus = table.checkStatus('studentList'),//选中状态
                   data = checkStatus.data;//选中的对象集
               var ids = new Array();
               if(data.length > 0) {
                   for (var i in data) {
                       ids.push(data[i].StudentId);
                   }
                   layer.confirm('确定删除选中的学生？', {icon: 3, title: '提示信息'}, function (index) {
                      	   $.post("${ctx}/student/updateStudentStateByStudentIds.action?ids="+ids,function(data){
                      		layer.msg(data.msg);
                      		setTimeout(function(){
                      		  tableIns.reload();
                              //关闭提示框
                              layer.close(index);
    	                    },500)
                       }) 
                   })
               }else{
                   layer.msg("请选择需要删除的学生");
               }
           }
           //打开  添加学生
           function toAddStudent(){
               var index = layui.layer.open({
                   title : "添加学生",
                   type : 2,//ifream层
                   area:["600px","600px"],
                   content : "${ctx }/studentManager/addStudent.action",
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回学生列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
           }
           function toUpdateStudent(studentId){
               var index = layui.layer.open({
                   title : "修改学生",
                   type : 2,//ifream层
                   area:["600px","500px"],
                   content : "${ctx}/studentManager/updateStudent.action?studentId="+studentId,
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回学生列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
           }
    });
</script>
</html>
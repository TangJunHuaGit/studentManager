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
            <label class="layui-form-label" >内容:</label>
            <div class="layui-input-inline">
                <input type="text" name="reasonText"  autocomplete="off" class="layui-input">
            </div>
        </div>
         <div class="layui-inline">
            <label class="layui-form-label" >类型:</label>
            <div class="layui-input-inline">
                  <select name="reasonId" id="reasonId" lay-filter="reasonId">
	        		<option value="">请选择类型</option>
	   		 	  </select>
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
<table id="dictionaryList" lay-filter="test"></table>

<!--表格工具条-->
<script type="text/html" id="tableToolBar">
	<a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
	<a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
</script>
<!--操作-->
<script type="text/html" id="dictionary">
	{{#  if(d.state==0){ }}
  		 <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="startProcess">提交申请</a>
   		 <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
   		 <a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
	{{#  } else if(d.state==1){ }}
 		<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="viewSpProcess">审批进度查询</a>
    {{#  } else if(d.state==2){ }}	
		 <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="viewSpProcess">审批进度查询</a>
 	 {{#  } else if(d.state==3){ }}	
		<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    	<a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="viewSpProcess">审批进度查询</a>
	{{#  } }}  
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
    	      id:"dictionaryList",
    	      elem: '#dictionary'
    	      ,url: "${ctx}/dictionary/loadAllDictionary.action"
    	      ,height: 'full-200'
    	      ,cellMinWidth: 80
    	      ,page: true
    	      ,limit: 30
    	      ,toolbar: '#tableToolBar'
    	      ,cols: [[
    	        {type:'checkbox'}
    	        ,{field:'reasonId', title: 'reasonId', sort: true,hide:true}
    	        ,{field:'reasonText', title: '内容'}
    	        ,{field:'reasonPid', title: 'reasonPid', sort: true,hide:true}
    	        ,{field:'remark', title: '备注'}
    	        ,{field:'sate', title: 'sate', sort: true, align: 'center',hide:true}
    	        ,{field:'createPerson', title: '创建人', sort: true, align: 'center'}
    	        ,{field:'createTime', title: '创建时间', sort: true, align: 'center'}
    	      ]]
    	    });
    	  //查询
           $(".search_btn").on("click",function(){
               var params=$("#searchForm").serialize();
               table.reload('dictionaryList', {
                   url: '${ctx}/dictionary/loadAllDictionary.action?'+params
               });
           });
    	  /* 加载下拉框 */
           $.ajax({
               url:"${ctx}/dictionary/loadParentDictionary.action",
               success:function(res){
                     for(var i =0;i<res.length;i++){
                        $("#reasonId").append("<option value=\""+res[i].reasonId+"\">"+res[i].reasonText+"</option>");
                    }
                    //重新渲染
                    layui.form.render("select");
               }
           });
           //监听头工具栏事件
           table.on('toolbar(test)', function(obj){
               switch(obj.event){
   	            case 'add':
   	               	toAddDictionary();
                   	break;
                   case 'batchDel':
                   	batchDeleteDictionary();
                       break;
               };
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
                   layer.confirm('确定删除选中的请假单？', {icon: 3, title: '提示信息'}, function (index) {
                       $.post("${ctx}/leaveBill/batchDeleteLeaveBill.action?"+ids,function(data){
                           //刷新table
                           tableIns.reload();
                           //关闭提示框
                           layer.close(index);
                       })
                   })
               }else{
                   layer.msg("请选择需要删除的请假单");
               }
           }
           //打开  添加字典
           function toAddDictionary(){
               var index = layui.layer.open({
                   title : "添加字典",
                   type : 2,//ifream层
                   area:["800px","500px"],
                   content : "${ctx }/dictionaryManager/addDictionary.action",
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回字典列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
               //layui.layer.full(index);
               //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
               $(window).on("resize",function(){
                   layui.layer.full(index);
               });
           }
    });
</script>
</html>
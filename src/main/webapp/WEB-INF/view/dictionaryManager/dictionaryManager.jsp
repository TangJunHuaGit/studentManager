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
                  <select name="reasonId" id="reasonId" lay-filter="">
	        		<option value="">请选择类型</option>
	   		 	  </select>
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
<table id="dictionaryList" lay-filter="dictionaryList" class="dictionaryList"></table>

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
    	      id:"dictionaryList",
    	      elem: '#dictionaryList'
    	      ,url: "${ctx}/dictionary/loadAllDictionary.action"
    	      ,height: 'full-200'
    	      ,cellMinWidth: 80
    	      ,page: true
    	      ,limit: 10
    	      ,toolbar: '#tableToolBar'
    	      ,cols: [[
    	        {type:'checkbox'}
    	        ,{field:'reasonId', title: 'reasonId', sort: true,hide:true}
    	        ,{field:'reasonText', title: '内容'}
    	        ,{field:'reasonPid', title: 'reasonPid', sort: true,hide:true}
    	        ,{field:'remark', title: '备注'}
    	        ,{field:'state', title: 'state', sort: true, align: 'center',hide:true}
    	        ,{field:'userName', title: '创建人', sort: true, align: 'center'}
    	        ,{field:'createTime', title: '创建时间', sort: true, align: 'center'}
    	        ,{fixed: 'right',title: '操作',width: 165, align:'center', toolbar: '#tableToolBarLine'}
    	      ]]
    	      ,done: function (res, curr, count) {
    	            if (curr > 1 && res.data.length === 0) {
    	                curr = curr - 1;
    	                table.reload('dictionaryList', { 
    	                    page: {
    	                        curr: curr
    	                    },
    	                    where: null,
    	                });
    	            }
    	        }
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
          //查询
           $(".search_btn").click(function(){
               var params=$("#searchForm").serialize();
               table.reload('dictionaryList', {
                   url: '${ctx}/dictionary/loadAllDictionary.action?'+params
               });
           });
           //监听头工具栏事件
           table.on('toolbar(dictionaryList)', function(obj){
               switch(obj.event){
   	            case 'add':
   	               	toAddDictionary();
                   	break;
                   case 'batchDel':
                   	batchDeleteDictionary();
                       break;
               };
           });
           table.on('tool(dictionaryList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
        	    var data = obj.data //获得当前行数据
        	    ,layEvent = obj.event; //获得 lay-event 对应的值
        	    
        	    var reasonId = obj.data.reasonId; //得到id
        	    if(layEvent === 'del'){
        	      layer.confirm('真的删除行么', function(index){
        	        obj.del(); //删除对应行（tr）的DOM结构
        	        layer.close(index);
        	        //向服务端发送删除指令
        	        $.ajax({
        	               url:"${ctx}/dictionary/updateDictionaryStateByReasonId.action",
        	               type:'POST',
       				       async:true,    //或false,是否异步
       				       data:{reasonId:reasonId},
       				       timeout:5000,    //超时时间
       				       dataType:'json',
        	               success:function(data){
        	            	   layer.msg(data.msg);
        	            	   tableIns.reload();
        	               }
        	           });
        	      });
        	    } else if(layEvent === 'edit'){
        	    	toUpdateDictionary(reasonId);
        	    }
        	  });
           //批量删除
           function batchDeleteDictionary(){
               //得到当前表格里面的checkbox的选中对象集合
               var checkStatus = table.checkStatus('dictionaryList'),//选中状态
                   data = checkStatus.data;//选中的对象集
               var ids = new Array();
               if(data.length > 0) {
                   for (var i in data) {
                       ids.push(data[i].reasonId);
                   }
                   layer.confirm('确定删除选中的字典？', {icon: 3, title: '提示信息'}, function (index) {
                      	   $.post("${ctx}/dictionary/updateDictionaryStateByReasonIds.action?ids="+ids,function(data){
                      		layer.msg(data.msg);
                      		setTimeout(function(){
                      		  tableIns.reload();
                              //关闭提示框
                              layer.close(index);
    	                    },500)
                       }) 
                   })
               }else{
                   layer.msg("请选择需要删除的字典");
               }
           }
           //打开  添加字典
           function toAddDictionary(){
               var index = layui.layer.open({
                   title : "添加字典",
                   type : 2,//ifream层
                   area:["500px","400px"],
                   content : "${ctx }/dictionaryManager/addDictionary.action",
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回字典列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
           }
           function toUpdateDictionary(reasonId){
               var index = layui.layer.open({
                   title : "修改字典",
                   type : 2,//ifream层
                   area:["500px","400px"],
                   content : "${ctx}/dictionaryManager/updateDictionary.action?reasonId="+reasonId,
                   success : function(layero, index){
                       setTimeout(function(){
                           layui.layer.tips('点击此处返回字典列表', '.layui-layer-setwin .layui-layer-close', {
                               tips: 3
                           });
                       },500)
                   }
               });
           }
    });
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加权限</title>
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
	media="all" />
</head>
<body>
<!-- -->

<form class="layui-form" action="" lay-filter="dictionaryForm" style="padding: 20px 30px 0 0; ">
   <input type="text" name="createPerson" style="display: none;" class="layui-input" value="${user.user.userId}">
  <div class="layui-form-item">
    <label class="layui-form-label">菜单名称</label>
    <div class="layui-input-block">
      <input type="text" name="functionName" lay-verify="required"  placeholder="请输角色名称" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">父级菜单</label>
    <div class="layui-input-block">
      <select name="functionParentId" id="functionParentIdName" lay-filter="functionParentId">
        <option value="1">一级菜单</option>
        <option value="9999">跳转路径</option>
      </select>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">图标</label>
    <div class="layui-input-block">
      <input type="text" name="functionIcon"   placeholder="请输图标" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">链接</label>
    <div class="layui-input-block">
      <input type="text" name="functionHref"  placeholder="请输链接" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">排序</label>
    <div class="layui-input-block">
      <input type="text" name="functionOrderNum"  placeholder="请输链接" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">备注</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入备注" class="layui-textarea" name="remark"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="add-submit">立即提交</button>
    </div>
  </div>
</form>
</body>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
<script type="text/javascript">
layui.config({
    base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user','form','jquery'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router()
    ,search = router.search;
    form.render();
  $.ajax({
    url:"${ctx}/sysFunction/loadAllParentMenu.action?page=1&limit=9999",
    success:function(ret){
      var res = ret.data;
      for(var i =0;i<res.length;i++){
        $("#functionParentIdName").append("<option value=\""+res[i].id+"\">"+res[i].title+"</option>");
      }
      //重新渲染
      layui.form.render("select");
    }
  });
    //提交
   	form.on('submit(add-submit)', function(obj){
   	       var data = obj.field;
   	       console.log(data)
	   	    $.ajax({
			    url:'${ctx}/sysFunction/addMenu.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			      console.log(data)
			    	if(data.code == 200){
			    		var index = parent.layer.getFrameIndex(window.name);
			    		layer.msg(data.describe);
			    		setTimeout(function(){
			    			parent.layer.close(index);
				    		parent.layui.table.reload('roleList');//重载父页表格，参数为表格ID
	                       },500)
			    	}else{
			    	  layer.msg(data.describe)
                    }

			    }//返回的数据格式：json/xml/html/script/jsonp/text
			});
   	        return false;
   	    });
   
  });

</script>
</html>
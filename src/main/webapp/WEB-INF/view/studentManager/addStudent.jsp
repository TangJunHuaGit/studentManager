<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
	media="all" />
</head>
<body>
<!-- -->

<form class="layui-form" action="" lay-filter="studentForm" style="padding: 20px 30px 0 0; ">
   <input type="text" name="createPerson" style="display: none;" class="layui-input" value="${user.user.userId}">
  <div class="layui-form-item">
    <label class="layui-form-label">学生名称</label>
    <div class="layui-input-block">
      <input type="text" name="studentName" lay-verify="required"  placeholder="请输入学生名称" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item">
 	 <label class="layui-form-label">班级</label>
 	 <div class="layui-input-block">
 	 	 <select name="classId" id="className" lay-filter="classId">
       		<option value="">请选择班级</option>
  		 </select>
 	 </div>

  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">手机号</label>
    <div class="layui-input-block">
      <input type="text" name="studentPhone" lay-verify="required"  placeholder="请输入手机号" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">出生年月</label>
    <div class="layui-input-block">
      <input type="text" name="studentBirthday" id="studentBirthday" lay-verify="required"  placeholder="请选择出生年月" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">上传文件</label>
    <button type="button" class="layui-btn" id="uploadFile"><i class="layui-icon"></i>上传文件</button>

  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">文件名</label>
    <div class="layui-input-block">
      <input type="text" name="studentSources" id="studentSources"  placeholder="上传后显示文件名" readonly="readonly" autocomplete="off" class="layui-input">
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
  }).use(['index', 'user','form','jquery','laydate','upload'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router()
    ,laydate = layui.laydate
    ,upload = layui.upload
    ,search = router.search;

    form.render();

    laydate.render({
    	elem:"#studentBirthday"
    	,type: 'date'
    })


    $.ajax({
        url:"${ctx}/class/loadAllClassComboBox.action",
        success:function(res){
              for(var i =0;i<res.length;i++){
                 $("#className").append("<option value=\""+res[i].classId+"\">"+res[i].className+"</option>");
             }
             //重新渲染
             layui.form.render("select");
        }
    });

    //提交
   	form.on('submit(add-submit)', function(obj){
   	       var data = obj.field;
	   	    $.ajax({
			    url:'${ctx}/student/addStudent.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			    	if(data.code == 100){
			    		var index = parent.layer.getFrameIndex(window.name);
			    		layer.msg(data.msg);
			    		setTimeout(function(){
			    			parent.layer.close(index);
				    		parent.layui.table.reload('studentList');//重载父页表格，参数为表格ID
	                       },500)

			    	}

			    }//返回的数据格式：json/xml/html/script/jsonp/text
			});
   	        return false;
   	    });

  //普通图片上传
  //指定允许上传的文件类型
  upload.render({
    elem: '#uploadFile'
    ,url: '${ctx}/upload/uploadFile.action'
    ,accept: 'file' //普通文件	field:'mf',
    ,field:'mf'
    ,before: function(obj){ //
      //layer.load(); //上传loading
      var files = obj.pushFile();
      $("#studentSources").setValue(files.name);
    }
    ,done: function(res){
      console.log(res);
    }
  });

  });

</script>
</html>

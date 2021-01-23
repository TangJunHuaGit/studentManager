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

<form class="layui-form" action="" id="teacherForm" lay-filter="teacherForm" style="padding: 20px 30px 0 0; ">
   <input type="text" name="teacherId" style="display: none;" class="layui-input" >
  <div class="layui-form-item">
    <label class="layui-form-label">教師名称</label>
    <div class="layui-input-block">
      <input type="text" name="teacherName" lay-verify="required"  placeholder="请输教師名称" class="layui-input">
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
      <button type="submit" class="layui-btn" lay-submit="" lay-filter="update-submit">确认修改</button>
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
    var teacherId = getQueryVariable("teacherId");//获取界面穿的id

    /* 查询表单 */
     $.ajax({
	    url:'${ctx}/teacher/loadOneTeacherByTeacherId.action',
	    type:'POST',
	    async:true,    //或false,是否异步
	    data:{teacherId:teacherId},
	    timeout:5000,    //超时时间
	    dataType:'json',
	    success:function(data){
	    	//给表单赋值
	    	form.val("teacherForm",data.data);
	    }
	});
    //提交 loadOneTeacher
   	form.on('submit(update-submit)', function(obj){
   	       var data = obj.field;
	   	    $.ajax({
			    url:'${ctx}/teacher/updateTeacherByTeacherId.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			    	if(data.code === 200){
			    		var index = parent.layer.getFrameIndex(window.name);
			    		layer.msg(data.describe);
			    		setTimeout(function(){
			    			parent.layer.close(index);
				    		parent.layui.table.reload('teacherList');//重载父页表格，参数为表格ID
	                       },500)
			    	}
			    }//返回的数据格式：json/xml/html/script/jsonp/text
			});
   	        return false;
   	    });
       //获取界面传参的方法
	   function getQueryVariable(variable) {
          var query = window.location.search.substring(1);
          var vars = query.split("&");
          for (var i=0;i<vars.length;i++) {
                  var pair = vars[i].split("=");
                  if(pair[0] == variable){return pair[1];}
          }
          return(false);
	   }
  });

</script>
</html>

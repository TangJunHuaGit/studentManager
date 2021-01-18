<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.layui-trans, .layui-trans a {
  		 text-align: center;
  	 }
</style>
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/login.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css"
	media="all" />
</head>
<body>

  <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>注册</h2>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form" >
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-cellphone"></label>
          <input type="text" name="userName" id="LAY-user-login-cellphone" lay-verify="required"  placeholder="用户名" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-cellphone" for="LAY-user-login-cellphone"></label>
          <input type="text" name="userLogName" id="LAY-user-login-cellphone" lay-verify="required" placeholder="账号" class="layui-input">
        </div>
        <!--  <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
              <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="验证码" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div style="margin-left: 10px;">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-fluid" id="LAY-user-getsmscode">获取验证码</button>
              </div>
            </div>
          </div>
        </div> -->
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="userLogPwd" id="LAY-user-login-password" lay-verify="pass" placeholder="密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
          <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button>
        </div>
        <div class="layui-trans layui-form-item layadmin-user-login-other">
          <a href="${ctx}/sys/login.action" class="layadmin-user-jump-change layadmin-link layui-hide-xs" style="float:unset;line-height:20px;">用已有帐号登入</a>
        </div>
      </div>
    </div>
  </div>

</body>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/resources/common/public.js"></script>
 <script>
  layui.config({
    base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router();
    form.render();
    //提交
    form.on('submit(LAY-user-reg-submit)', function(obj){
      var data = obj.field;
      //确认密码
      if(data.userLogPwd !== data.repass){
        return layer.msg('两次密码输入不一致');
      }
      $.ajax({
		    url:'${ctx}/user/addUser.action',
		    type:'POST',
		    async:true,    //或false,是否异步
		    data:data,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data){
		    	if(data.code = 100){
		    		layer.msg(data.msg, {
			             offset: '15px'
			             ,icon: 1
			             ,time: 1000
			           }, function(){
			             location.href = '${ctx}/sys/login.action'; //跳转到登入页
			           });
		    	}else{
		    		layer.msg(data.msg, {
			             offset: '15px'
			             ,icon: 1
			             ,time: 1000
			           });
		    	}
		    },
		    error:function(xhr,textStatus){
		        console.log('错误')
		        console.log(xhr)
		        console.log(textStatus)
		    }
		});
	    return false;
    });
  });
  </script>
</html>
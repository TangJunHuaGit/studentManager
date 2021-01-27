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
<title>修改密码</title>
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/login.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css"
	media="all" />
</head>
<body>
<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header">修改密码</div>
        <div class="layui-card-body" pad15>

          <div class="layui-form" lay-filter="">
            <input type="text" name="userId" id="userId" style="display: none;" value="${user.user.userId}"  class="layui-input">
            <div class="layui-form-item">
              <label class="layui-form-label">当前密码</label>
              <div class="layui-input-inline">
                <input type="password" name="oldPassword" id="oldPassword" lay-verify="required" lay-verType="tips" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">新密码</label>
              <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="pass" lay-verType="tips" autocomplete="off" id="LAY_password" class="layui-input">
              </div>
              <div class="layui-form-mid layui-word-aux">6到16个字符</div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">确认新密码</label>
              <div class="layui-input-inline">
                <input type="password" name="userLogPwd" lay-verify="repass" lay-verType="tips" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="setmypass">确认修改</button>
              </div>
            </div>
          </div>

        </div>
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
    form.on('submit(setmypass)', function(obj){
      var data = obj.field;
      //确认密码
      if(data.password !== data.userLogPwd){
        return layer.msg('两次密码输入不一致');
      }
      $.ajax({
		    url:'${ctx}/user/updateUserPassword.action',
		    type:'POST',
		    async:true,    //或false,是否异步
		    data:data,
		    timeout:5000,    //超时时间
		    dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
		    success:function(data){
		    	if(data.code === "100"){
                  layer.msg("修改"+data.msg,"请重新登录!");
                  setTimeout(() =>{
                    parent.window.location.href = "${ctx}"
                  },800);
		    	}else{
		    		layer.msg(data.msg, {
			             offset: '15px'
			             ,icon: 1
			             ,time: 1000
			           });
		    	}
		    }
		});
    });
    $("#oldPassword").blur(function(){
      var value = this.value;
      var userId = $("#userId").val();
      var node = this;
      $.post('${ctx}/user/verificationPassword.action',{userLogPwd:value,userId:userId},function (data) {
        if(data.data <= 0 || data.data === undefined || data.data===""){
          layer.msg('当前密码不正确,请重新输入',{icon: 5});//!,ok,wrong,question,lock,cry,smile
          node.focus();
        }else{
          layer.msg('旧密码正确',{icon: 1});//!,ok,wrong,question,lock,cry,smile
        }
      });
    })
  });
  </script>
</html>

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
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/login.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/admin.css"
	media="all" />
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login"">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>中小学生停课监护系统</h2>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form" >
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
          <input type="text" name="userLogName" id="LAY-user-login-username" lay-verify="required" placeholder="账号" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="userLogPwd" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
        </div>
          <div class="layui-form-item">
          <div class="layui-row">
            <div class="layui-col-xs7">
              <label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
              <input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
            </div>
            <div class="layui-col-xs5">
              <div style="margin-left: 10px;">
                <canvas id="canvas" width="100" height="38"></canvas>
              </div>
            </div>
          </div>
        </div>
        <div class="layui-form-item" style="margin-bottom: 20px;">
            <a  class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;float:left;"  href="${ctx}/sys/reg.action">注册帐号</a>
          	<a  class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;"  href='${ctx}/sys/forget.action'>忘记密码？</a>
        </div>
        <div class="layui-form-item">
          <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="login-submit">登 入</button>
        </div>
      </div>
    </div>
  </div>
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

    //初始化验证码
    var show_num=[];
    draw(show_num);
    //点击canvas生成验证码
    $("#canvas").click(function(){
    	 draw(show_num);
    });

    form.render();

    //提交
   	form.on('submit(login-submit)', function(obj){
   	       var data = obj.field;
   	       var imgCode = show_num.join("");//图形验证码
   	       var vercode = obj.field.vercode;//表单填写的验证码
   	       // if(imgCode !== vercode){
   	       //     return layer.msg('验证码错误');
   	       //  }
	   	    $.ajax({
			    url:'${ctx}/login/doLogin.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			    	if(data.code == 200){
			    		location.href = '${ctx}/sys/index.action'; //跳转到登入页
			    	}else{
			    		layer.msg(data.message);
			    	}
			    }//返回的数据格式：json/xml/html/script/jsonp/text
			});
   	        return false;
   	    });



    function draw(show_num) {
        var canvas_width = $('#canvas').width();
        var canvas_height = $('#canvas').height();
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "A,B,C,E,F,G,H,J,K,L,M,N,P,Q,R,S,T,W,X,Y,Z,1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt.toLowerCase();
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }

    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }
  });

</script>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘记密码</title>
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/login.css"
	media="all" />
<link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css"
	media="all" />

</head>
<body>

	<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>重置密码</h2>
            <h3>step2</h3>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="pass" placeholder="新密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-repass"></label>
                    <input type="password" name="repass" id="LAY-user-login-repass" lay-verify="required" placeholder="确认密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-forget-resetpass">重置新密码</button>
                </div>
        </div>
    </div>

</body>
<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user'], function() {
        var $ = layui.$,
            setter = layui.setter,
            admin = layui.admin,
            form = layui.form,
            router = layui.router();

        form.render();
        //重置密码
        form.on('submit(LAY-user-forget-resetpass)', function(obj) {
            var field = obj.field;
            //确认密码
            if (field.password !== field.repass) {
                return layer.msg('两次密码输入不一致');
            }
            //请求接口
            admin.req({
                url:'json/user/resetpass.js', //实际使用请改成服务端真实接口
                data: field,
                done: function(res) {
                    layer.msg('密码已成功重置', {
                        offset: '15px',
                        icon: 1,
                        time: 1000
                    }, function() {
                        location.href = '${ctx}/sys/login.action'; //跳转到登入页
                    });
                }
            });

            return false;
        });
    });
</script>
</html>
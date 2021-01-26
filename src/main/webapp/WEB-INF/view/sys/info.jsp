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

<div class="layui-fluid">
  <div class="layui-row layui-col-space15">
    <div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-header">设置我的资料</div>
        <div class="layui-card-body" pad15>
          <form class="layui-form" lay-filter="userForm">
            <input type="text" name="userId" style="display: none" value="${user.user.userId}" readonly class="layui-input">
            <div class="layui-form-item">
              <label class="layui-form-label">用户名</label>
              <div class="layui-input-inline">
                <input type="text" name="userName" value=""  class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">账号</label>
              <div class="layui-input-inline">
                <input type="text" name="userLogName" value="" readonly class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">性别</label>
              <div class="layui-input-block">
                <input type="radio" name="userSex" value="1" title="男">
                <input type="radio" name="userSex" value="2" title="女">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">头像</label>
              <div class="layui-input-inline layui-btn-container" style="width: auto;">
                <button type="button" class="layui-btn layui-btn-primary" id="LAY_avatarUpload">
                  <i class="layui-icon">&#xe67c;</i>上传图片
                </button>
                <button class="layui-btn layui-btn-primary" layadmin-event="avartatPreview">查看图片</button >
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">手机</label>
              <div class="layui-input-inline">
                <input type="text" name="userMobilePhone" value="" lay-verify="phone" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">邮箱</label>
              <div class="layui-input-inline">
                <input type="text" name="userEmail" value="" lay-verify="email" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">QQ</label>
              <div class="layui-input-inline">
                <input type="text" name="userQQ" value=""  autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">证件号码</label>
              <div class="layui-input-block">
                <input type="text" name="userCard" value=""  autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <label class="layui-form-label">备注</label>
              <div class="layui-input-block">
                <textarea name="remark" placeholder="请输入内容" class="layui-textarea"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="setmyinfo">确认修改</button>
                <button type="reset" id="reset" class="layui-btn layui-btn-primary">重新填写</button>
              </div>
            </div>
          </form>

        </div>
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
    form.render();

    $.ajax({
      url:'${ctx}/user/loadOneUser.action',
      type:'POST',
      async:true,    //或false,是否异步
      timeout:5000,    //超时时间
      dataType:'json',
      success:function(data){
        //给表单赋值
        form.val("userForm",data);
        if(data.userSex == 1){
          $("input[name=userSex][value='"+data.userSex+"']").attr("checked", data.userSex == 1 ? true : false);
        }else if(data.userSex == 2){
          $("input[name=userSex][value='"+data.userSex+"']").attr("checked", data.userSex == 2 ? true : false);
        }
        form.render();
      }
    });
    //提交
   	form.on('submit(setmyinfo)', function(obj){
   	       var data = obj.field;
	   	    $.ajax({
			    url:'${ctx}/user/updateUser.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			    	if(data.code == 100){
                       layer.msg(data.msg);
			    	}else{
			    		layer.msg(data.msg);
			    	}
			    }
			});
   	        return false;
   	    });
  });

</script>
</html>

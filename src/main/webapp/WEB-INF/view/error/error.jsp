<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/login.css"
	media="all" />
<link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/admin.css"
	media="all" />
</head>
<body>
<div class="layui-fluid">
  <div class="layadmin-tips">
    <i class="layui-icon" face>&#xe664;</i>
    <div class="layui-text" style="font-size: 20px;">
      好像出错了呢
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
  }).use(['index']);
  </script>
</html>
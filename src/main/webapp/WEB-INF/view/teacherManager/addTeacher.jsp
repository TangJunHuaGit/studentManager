<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css"
          media="all"/>
</head>
<body>
<!-- -->

<form class="layui-form" action="" lay-filter="teacherForm" style="padding: 20px 30px 0 0; ">
    <input type="text" name="createPerson" style="display: none;" class="layui-input" value="${user.user.userId}">
    <div class="layui-form-item">
        <label class="layui-form-label">教师名称</label>
        <div class="layui-input-block">
            <input type="text" name="teacherName" lay-verify="required" placeholder="请输名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">联系电话</label>
        <div class="layui-input-block">
            <input type="text" name="teacherPhone" lay-verify="required" placeholder="请输名称" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="teacherSex" value="0" title="男" checked="">
            <input type="radio" name="teacherSex" value="1" title="女">
            <input type="radio" name="teacherSex" value="2" title="未知">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属班级</label>
        <div class="layui-input-block">
            <input type="text" name="classId" lay-verify="required" placeholder="请输名称" class="layui-input">
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
    }).use(['index', 'user', 'form', 'jquery'], function () {
        var $ = layui.$
            , setter = layui.setter
            , admin = layui.admin
            , form = layui.form
            , router = layui.router()
            , search = router.search;
        form.render();

        //提交
        form.on('submit(add-submit)', function (obj) {
            var data = obj.field;
            $.ajax({
                url: '${ctx}/teacher/addTeacher.action',
                type: 'POST',
                async: true,    //或false,是否异步
                data: data,
                timeout: 5000,    //超时时间
                dataType: 'json',
                success: function (data) {
                    if (data.code === 200) {
                        var index = parent.layer.getFrameIndex(window.name);
                        layer.msg(data.describe);
                        setTimeout(function () {
                            parent.layer.close(index);
                            parent.layui.table.reload('teacherList');//重载父页表格，参数为表格ID
                        }, 500)
                    }
                }//返回的数据格式：json/xml/html/script/jsonp/text
            });
            return false;
        });

    });

</script>
</html>

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

<form class="layui-form" action=""  id="studentForm" lay-filter="studentForm" style="padding: 20px 30px 0 0; ">
  <input type="text" name="studentId" style="display: none;" class="layui-input" >
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
    <label class="layui-form-label">学生名称</label>
    <div class="layui-input-block">
      <input type="text" name="studentPhone" lay-verify="required"  placeholder="请输入手机号" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">出生年月</label>
    <div class="layui-input-block">
      <input type="text" name="studentBirthday" id="studentBirthday" lay-verify="required"   class="layui-input" placeholder="请选择出身年月" autocomplete="off">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">下载文件</label>
    <button type="button" class="layui-btn" id="downLoadFile" onclick="downLoad()"><i class="layui-icon"></i>下载文件</button>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">上传文件</label>
    <button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>
    <input type="text" name="studentSource" style="display: none;" class="layui-input">
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
  var studentId = getQueryVariable("studentId");//获取界面穿的id
layui.config({
    base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'user','form','jquery','laydate'], function(){
    var $ = layui.$
    ,setter = layui.setter
    ,admin = layui.admin
    ,form = layui.form
    ,router = layui.router()
    ,laydate = layui.laydate
    ,search = router.search;
    form.render();

  laydate.render({
    elem:"#studentBirthday"
    ,type: 'date'
  })

    /* 加载班级 */
    $.ajax({
      url:'${ctx}/class/loadAllClassComboBox.action',
      success:function(res){
        $.each(res	, function (index, item) {
          // 追加option节点
          //item.name是option里的文本值
          //item.id是option的value值
          $("#className").append(new Option(item.className, item.classId));
        });
        //重新渲染下拉框
        form.render('select');
      }
    });

    /* 查询表单 */
     $.ajax({
	    url:'${ctx}/student/loadOneStudentByStudentId.action',
	    type:'POST',
	    async:true,    //或false,是否异步
	    timeout:5000,    //超时时间
        data:{studentId:studentId},
	    dataType:'json',
	    success:function(data){
	    	//给表单赋值
	    	form.val("studentForm",data);
            $("#className").find("option[value="+data.classId+"]").prop("selected",true);
	    }
	});
    //提交
   	form.on('submit(update-submit)', function(obj){
   	       var data = obj.field;
	   	    $.ajax({
			    url:'${ctx}/student/updateStudentByStudentId.action',
			    type:'POST',
			    async:true,    //或false,是否异步
			    data:data,
			    timeout:5000,    //超时时间
			    dataType:'json',
			    success:function(data){
			    	if(data.code == 200){
			    		var index = parent.layer.getFrameIndex(window.name);
			    		layer.msg(data.describe);
			    		setTimeout(function(){
			    			parent.layer.close(index);
				    		parent.layui.table.reload('studentList');//重载父页表格，参数为表格ID
	                       },500)
			    	}else{
                      layer.msg(data.describe);
                    }
			    }//返回的数据格式：json/xml/html/script/jsonp/text
			});
   	        return false;
   	    });
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
    function downLoad() {
      var curWwwPath = window.document.location.href;
      var pathName = window.document.location.pathname;
      var pos = curWwwPath.indexOf(pathName);
      var localhostPath = curWwwPath.substring(0, pos);
      var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
      var url = "${ctx}/upload/downLoadFile.action?studentId="+studentId;
      window.open(url);
    }

</script>
</html>

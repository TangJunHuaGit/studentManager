<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生管理</title>
    <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="${ctx }/resources/layuiadmin/style/admin.css" media="all" />
    <script type="application/javascript" >
        var userPermission = '${currentUserPermission}';
        var permissionObj = JSON.parse(userPermission);
        var add = false;
        var batchDel = false;
        var edit = false;
        var del = false;

        var tijiao = false;
        var tongyi = false;
        var butongyi = false;

        var userId = '${user.user.userId}';
        console.log(userId);
    </script>
</head>

<body class="childrenBody">
<fieldset class="layui-elem-field layui-field-title">
    <legend>查询条件</legend>
</fieldset>
<form class="layui-form" id="searchForm" method="post">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label" >学生名称:</label>
            <div class="layui-input-inline">
                <input type="text" name="studentName"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >开始时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="startTime" id="startTime"  placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label" >结束时间:</label>
            <div class="layui-input-inline">
                <input type="text" name="endTime" id="endTime" autocomplete="off"  placeholder="yyyy-MM-dd HH:mm:ss" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;">
        <a class="layui-btn search_btn" >查询</a>
        <button type="reset" class="layui-btn layui-btn-warm">清空</button>
    </div>
</form>
<table id="studentList" lay-filter="studentList" class="studentList"></table>


<script type="text/javascript" src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
<!--表格工具条-->
<script type="text/html" id="tableToolBar">
    {{# layui.each(permissionObj, function(index, item){ }}
    {{# if(item.functionCode == 'addStudent'){ }}
    {{# add = true}}
    {{# } }}
    {{# if(item.functionCode == 'deleteStudentByStudentIds'){ }}
    {{# batchDel = true}}
    {{# } }}
    {{#  }); }}
    {{# if(add){ }}
    <a class="layui-btn layui-btn layui-btn" lay-event="add">添加</a>
    {{#} }}
    {{# if(batchDel){ }}
    <a class="layui-btn layui-btn layui-btn-danger" lay-event="batchDel">批量删除</a>
    {{#} }}
</script>
<!--操作-->
<script type="text/html" id="tableToolBarLine">
    {{# if(userId == 20){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# }else{ }}
    {{# layui.each(permissionObj, function(index, item){ }}
    {{# if(item.functionCode == 'updateStudentStateByStudentIdGoBack'){ }}
    {{# tijiao = true}}
    {{# } }}
    {{# if(item.functionCode == 'updateStudentStateByStudentIdAgree'){ }}
    {{# tongyi = true}}
    {{# } }}
    {{# if(item.functionCode == 'updateStudentStateByStudentIdNotAgree'){ }}
    {{# butongyi = true}}
    {{# } }}
    {{#  }); }}
    {{# if(d.state == 1 && tijiao){ }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="submit">申请返校</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# }else if(d.state == 2 && tijiao) { }}
    {{# } else if(d.state== 3 && tijiao) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } else if(d.state== 4  && tijiao) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="submit">申请返校</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } else if(d.state== 1 && tongyi && butongyi) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } else if(d.state== 2 && tongyi && butongyi) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-xs layui-btn-warm" lay-event="shenPi">审批</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } else if(d.state== 3 && tongyi && butongyi) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } else if(d.state== 4 && tongyi && butongyi) { }}
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
    {{# } }}
    {{# } }}
</script>
<script type="text/html" id="table-gender">
    {{# if(d.state=== 1) { }}
    <span style="color:red">未提交</span>
    {{# } else if(d.state== 2) { }}
    <span style="color:RGB(252,195,48);">审批中</span>
    {{# }  else if(d.state== 3) { }}
    <span style="color:green">已审批</span>
    {{# } else if(d.state== 4) { }}
    <span style="color:#FFD700;">已审批未通过</span>
    {{# } }}
</script>
</body>
<script type="text/javascript">
    var tableIns;
    layui.use(['form','layer','table','laydate','layer'],function(){
        var form = layui.form,
            layer = layui.layer,
            $ = layui.jquery, $ = layui.jquery,
            laydate=layui.laydate,
            table = layui.table;
        laydate.render({
            elem:"#startTime"
            ,type: 'datetime'
        })
        laydate.render({
            elem:"#endTime"
            ,type: 'datetime'
        })
        tableIns = table.render({
            id:"studentList",
            elem: '#studentList'
            ,url: "${ctx}/student/loadAllStudent.action"
            ,height: 'full-200'
            ,cellMinWidth: 70
            ,page: true
            ,limit: 10
            ,toolbar: '#tableToolBar'
            ,cols: [[
                {type:'checkbox'}
                ,{field:'studentId', title: 'studentId', sort: true,hide:true}
                ,{field:'studentName', title: '学生名称'}
                ,{field:'studentPhone', title: '手机号码'}
                ,{field:'studentBirthday', title: '出生日期'}
                ,{field:'className', title: '所属班级'}
                ,{field:'teacherName', title: '班主任'}
                ,{field:'remark', title: '备注', sort: true}
                ,{field:'state', title: '状态', sort: true, align: 'center',templet: '#table-gender'}
                ,{field:'userName', title: '创建人', sort: true, align: 'center'}
                ,{field:'createTime', title: '创建时间', sort: true, align: 'center',width: 200}
                ,{fixed: 'right',title: '操作',width: 200, align:'center', toolbar: '#tableToolBarLine'}
            ]]
            ,done: function (res, curr, count) {
                if (curr > 1 && res.data.length === 0) {
                    curr = curr - 1;
                    table.reload('studentList', {
                        page: {
                            curr: curr
                        },
                        where: null,
                    });
                }
            }
        });
        //查询
        $(".search_btn").click(function(){
            var params=$("#searchForm").serialize();
            table.reload('studentList', {
                url: '${ctx}/student/loadAllStudent.action?'+params
            });
        });


        //监听头工具栏事件
        table.on('toolbar(studentList)', function(obj){
            switch(obj.event){
                case 'add':
                    toAddStudent();
                    break;
                case 'batchDel':
                    batchDeleteStudent();
                    break;
            };
        });
        table.on('tool(studentList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值

            var studentId = obj.data.studentId; //得到id
            if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del(); //删除对应行（tr）的DOM结构
                    layer.close(index);
                    //向服务端发送删除指令
                    $.ajax({
                        url:"${ctx}/student/updateStudentStateByStudentId.action",
                        type:'POST',
                        async:true,    //或false,是否异步
                        data:{studentId:studentId},
                        timeout:5000,    //超时时间
                        dataType:'json',
                        success:function(data){
                            layer.msg(data.msg);
                            tableIns.reload();
                        }
                    });
                });
            } else if(layEvent === 'edit'){
                toUpdateStudent(studentId);
            }else if(layEvent === "submit"){
                submitAction(studentId);
            }else if(layEvent == 'shenPi'){
                layer.prompt({
                    formType: 2,    // 弹出层为文本输入框
                    title: '请输入审批建议',    // 标题
                    value:'',    // 可以设置默认文本
                    area: ['400px', '250px'],     // 设置弹出层大小
                    btn: ['同意', '不同意','取消'],   // 自定义设置多个按钮，第一个是自带的，第二个为下面编写的
                    btnAlign: 'c',    // 设置按钮位置
                    yes: function(index){
                        var value = $('#layui-layer'+index + " .layui-layer-input").val();
                        if(value == ""){
                            layer.msg("请输入审批建议");
                            return false;
                        };     // 得到value
                        $.ajax({
                            url:"${ctx}/student/updateStudentStateByStudentIdAgree.action",
                            type:'POST',
                            async:true,    //或false,是否异步
                            data:{studentId:studentId,state:"3"},
                            timeout:5000,    //超时时间
                            dataType:'json',
                            success:function(data){
                                if(data.code == 200){
                                    layer.msg(data.describe);
                                    tableIns.reload();
                                }else{
                                    layer.msg(data.desc);
                                }
                            }
                        });
                        layer.close(index);
                    },
                    btn2: function(index, elem){
                        // 得到输入的数据，这里采用jquery，当然可以更换成layui内的jquery
                        var value = $('#layui-layer'+index + " .layui-layer-input").val();
                        if(value == ""){
                            layer.msg("请输入审批建议");
                            return false;
                        };     // 得到value
                        $.ajax({
                            url:"${ctx}/student/updateStudentStateByStudentIdAgree.action",
                            type:'POST',
                            async:true,    //或false,是否异步
                            data:{studentId:studentId,state:"4"},
                            timeout:5000,    //超时时间
                            dataType:'json',
                            success:function(data){
                                if(data.code == 200){
                                    layer.msg(data.describe);
                                    tableIns.reload();
                                }else{
                                    layer.msg(data.desc);
                                }
                            }
                        });
                        layer.close(index);
                    }});
            }
        });
        function submitAction(studentId) {
            layer.confirm('确认提交此申请吗?', {icon: 3, title:'提示'}, function(index){
                layer.close(index);
                $.ajax({
                    url:"${ctx}/student/updateStudentStateByStudentIdGoBack.action",
                    type:'POST',
                    async:true,    //或false,是否异步
                    data:{studentId:studentId,state:"2"},
                    timeout:5000,    //超时时间
                    dataType:'json',
                    success:function(data){
                        if(data.code == 200){
                            layer.msg(data.describe);
                            tableIns.reload();
                        }else{
                            layer.msg(data.desc);
                        }
                    }
                });
            });
        }

        //批量删除
        function batchDeleteStudent(){
            //得到当前表格里面的checkbox的选中对象集合
            var checkStatus = table.checkStatus('studentList'),//选中状态
                data = checkStatus.data;//选中的对象集
            var ids = new Array();
            if(data.length > 0) {
                for (var i in data) {
                    ids.push(data[i].studentId);
                }
                layer.confirm('确定删除选中的学生？', {icon: 3, title: '提示信息'}, function (index) {
                    $.post("${ctx}/student/updateStudentStateByStudentIds.action?ids="+ids,function(data){
                        layer.msg(data.msg);
                        setTimeout(function(){
                            tableIns.reload();
                            //关闭提示框
                            layer.close(index);
                        },500)
                    })
                })
            }else{
                layer.msg("请选择需要删除的学生");
            }
        }
        //打开  添加学生
        function toAddStudent(){
            var index = layui.layer.open({
                title : "添加学生",
                type : 2,//ifream层
                area:["100%","100%"],
                content : "${ctx }/studentManager/addStudent.action",
                success : function(layero, index){
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回学生列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                    //layer.full(index);
                }
            });
        }
        function toUpdateStudent(studentId){
            var index = layui.layer.open({
                title : "修改学生",
                type : 2,//ifream层
                area:["100%","100%"],
                //zIndex: layer.zIndex, //重点1
                content : "${ctx}/studentManager/updateStudent.action?studentId="+studentId,
                success : function(layero, index){
                    //layer.setTop(layero); //重点2
                    setTimeout(function(){
                        layui.layer.tips('点击此处返回学生列表', '.layui-layer-setwin .layui-layer-close', {
                            tips: 3
                        });
                    },500);
                    //layer.full(index);
                }
            });
        }
    });
</script>
</html>

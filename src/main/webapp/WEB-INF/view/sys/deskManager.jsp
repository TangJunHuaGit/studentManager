<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
  <link rel="stylesheet" href="${ctx}/resources/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${ctx}/resources/layuiadmin/style/admin.css" media="all">
</head>
<body>
	<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md8">
        <div class="layui-row layui-col-space15">
          <div class="layui-col-md12">
            <div class="layui-card">
              <div class="layui-card-header">数据概览</div>
              <div class="layui-card-body">
                <div class="layui-carousel layadmin-carousel layadmin-dataview" data-anim="fade" lay-filter="LAY-index-dataview">
                  <div carousel-item id="">
                    <div>
                      <div id="zhu" style="width: 984px;height:330px;"></div>
                    </div>
                    <div>
                      <div id="pie" style="width: 984px;height:330px;"></div>
                    </div>

                    <div>333</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
<script src="${ctx}/resources/common/echarts.js"></script>
<script type="text/javascript">
  var zhuChart = echarts.init(document.getElementById('zhu'));


  var optionZhu = {
    title: {
      text: '病例统计'
    },
    tooltip: {},
    legend: {
      data:['类型']
    },
    xAxis: {
      data: ["丧事","喜事","传染病","非传染病","事故"]
    },
    yAxis: {},
    series: [{
      name: '类型',
      type: 'bar',
      data: [5, 20, 36, 10, 10],
      itemStyle: {
        normal: {
          //这里是重点
          color: function(params) {
            //注意，如果颜色太少的话，后面颜色不会自动循环，最好多定义几个颜色
            var colorList = ["#5470c6","#91cc75","#fac858","#ee6666","#73c0de","#3ba272","#fc8452","#9a60b4","#ea7ccc"];
            return colorList[params.dataIndex]
          }
        }
      }
    }]
  };
  zhuChart.setOption(optionZhu);


  var pieChart = echarts.init(document.getElementById('pie'));
  optionPie = {
    legend: {
      data: ["丧事","喜事","传染病","非传染病","事故"]
    },
    tooltip: {
      trigger: 'item',
      formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    series : [
      {
        name: '数据',
        type: 'pie',
        radius: '55%',
        roseType: 'angle',
        data:[
          {value:235, name:'丧事'},
          {value:274, name:'喜事'},
          {value:310, name:'传染病'},
          {value:335, name:'非传染病'},
          {value:400, name:'事故'}
        ]
      }
    ]
  };
  pieChart.setOption(optionPie);

</script>
<script src="${ctx}/resources/layuiadmin/layui/layui.js?t=1"></script>
<script>
  layui.config({
    base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'console']);
</script>
</html>


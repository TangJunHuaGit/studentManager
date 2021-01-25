<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>中小学生停课监护系统</title>
<link rel="stylesheet"
	href="${ctx }/resources/layuiadmin/layui/css/layui.css" media="all" />
<link rel="stylesheet"
	href="${ctx }/resources/layuiadmin/style/login.css" media="all" />
<link rel="stylesheet"
	href="${ctx }/resources/layuiadmin/style/admin.css" media="all" />
</head>
<body class="layui-layout-body">

	<div id="LAY_app">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<!-- 头部区域 -->
				<ul class="layui-nav layui-layout-left">
					<li class="layui-nav-item layadmin-flexible" lay-unselect><a
						href="javascript:;" layadmin-event="flexible" title="侧边伸缩"> <i
							class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
					</a></li>
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="http://www.layui.com/admin/" target="_blank" title="前台">
							<i class="layui-icon layui-icon-website"></i>
					</a></li>
					<li class="layui-nav-item" lay-unselect><a href="javascript:;"
						layadmin-event="refresh" title="刷新"> <i
							class="layui-icon layui-icon-refresh-3"></i>
					</a></li>
				</ul>
				<ul class="layui-nav layui-layout-right"
					lay-filter="layadmin-layout-right">
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:;" layadmin-event="note"> <i
							class="layui-icon layui-icon-note"></i>
					</a></li>
					<li class="layui-nav-item layui-hide-xs" lay-unselect><a
						href="javascript:;" layadmin-event="fullscreen"> <i
							class="layui-icon layui-icon-screen-full"></i>
					</a></li>
					<li class="layui-nav-item" lay-unselect><a href="javascript:;">
							<cite>${user.user.userName}</cite>
					</a>
						<dl class="layui-nav-child">
							<dd>
								<a lay-href="${ctx}/sys/info.action">基本资料</a>
							</dd>
							<dd>
								<a lay-href="${ctx}/sys/password.action">修改密码</a>
							</dd>
							<hr>
							<dd id="logout"  style="text-align: center;">
								<a>退出</a>
							</dd>
						</dl></li>
				</ul>
			</div>

			<!-- 侧边菜单 -->
			<div class="layui-side layui-side-menu">
				<div class="layui-side-scroll">
					<script type="text/html" template
						lay-url="${ctx}/sysFunction/loadAllFunction.action"
						lay-headers="{'x-auth-token': layui.data('layuiAdmin').token}"
						lay-done="layui.element.render('nav', 'layadmin-system-side-menu');"
						id="TPL_layout">
          				<div class="layui-logo" lay-href="${ctx}/sys/deskManager.action">
           					<span>中小学生停课监护系统</span>
          				</div>
                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    {{# var path = layui.router().path ,dataName = layui.setter.response.dataName; layui.each(d[dataName], function (index, item){ var hasChildren = typeof item.list === 'object' && item.list.length > 0 ,classSelected = function (){ if (index == 0){ return
                    hasChildren ? '' : '' ; } return '' ; } ,url = typeof item.href === 'string' ? item.href : item.name; }}
                    <li data-name="{{ item.name || '' }}" data-jump="{{ item.href || '' }}" class="layui-nav-item {{ classSelected() }}">
                        <a href="javascript:;" {{ hasChildren ? '' : 'lay-href="' + url + '"' }} lay-tips="{{ item.title }}" lay-direction="2">
                            <i class="layui-icon {{ item.icon }}"></i>
                            <cite>{{ item.title }}</cite>
                        </a>
                        {{# if (hasChildren){ }}
                        <dl class="layui-nav-child">
                            {{# layui.each(item.list, function (index2, item2){ var hasChildren2 = typeof item2.list == 'object' && item2.list.length > 0 ,classSelected2 = function (){ if (index==0){ return hasChildren2 ? '' : '' ; } return '' ; } ,url2
                            = typeof item2.href === 'string' ? item2.href : [item.name, item2.name, '' ].join( '/' ); }}
                            <dd data-name="{{ item2.name || '' }}" data-jump="{{ item2.href || '' }}" {{ classSelected2() ? ( 'class="' + classSelected2() + '"' ) : '' }}>
                                <i class="layui-icon {{ item2.icon }}"></i>
								<a href="javascript:;" {{ hasChildren2 ? '' : 'lay-href="' + url2 + '"' }}>{{ item2.title }}</a> {{# if (hasChildren2){ }}
                                <dl class="layui-nav-child">
                                    {{# layui.each(item2.list, function (index3, item3){ var match = path[0] == item.name && path[1] == item2.name && path[2] == item3.name ,url3 = typeof item3.href === 'string' ? item3.href : [item.name, item2.name, item3.name].join( '/' ) }}
                                    <dd data-name="{{ item3.name || '' }}" data-jump="{{ item3.href || '' }}" {{ match ? 'class=""' : '' }}>
                                        <a href="javascript:;" lay-href="{{ url3 }}">{{ item3.title }}</a>
                                    </dd>
                                    {{# }); }}
                                </dl>
                                {{# } }}
                            </dd>
                            {{# }); }}
                        </dl>
                        {{# } }}
                    </li>
                    {{# }); }}
                </ul>
            </script>
				</div>
			</div>

			<!-- 页面标签 -->
			<div class="layadmin-pagetabs" id="LAY_app_tabs">
				<div class="layui-icon layadmin-tabs-control layui-icon-prev"
					layadmin-event="leftPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-next"
					layadmin-event="rightPage"></div>
				<div class="layui-icon layadmin-tabs-control layui-icon-down">
					<ul class="layui-nav layadmin-tabs-select"
						lay-filter="layadmin-pagetabs-nav">
						<li class="layui-nav-item" lay-unselect><a
							href="javascript:;"></a>
							<dl class="layui-nav-child layui-anim-fadein">
								<dd layadmin-event="closeThisTabs">
									<a href="javascript:;">关闭当前标签页</a>
								</dd>
								<dd layadmin-event="closeOtherTabs">
									<a href="javascript:;">关闭其它标签页</a>
								</dd>
								<dd layadmin-event="closeAllTabs">
									<a href="javascript:;">关闭全部标签页</a>
								</dd>
							</dl></li>
					</ul>
				</div>
				<div class="layui-tab" lay-unauto lay-allowClose="true"
					lay-filter="layadmin-layout-tabs">
					<ul class="layui-tab-title" id="LAY_app_tabsheader">
						<li lay-id="${ctx}/sys/deskManager.action" lay-attr="${ctx}/sys/deskManager.action"
							class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
					</ul>
				</div>
			</div>

			<!-- 主体内容 -->
			<div class="layui-body" id="LAY_app_body">
				<div class="layadmin-tabsbody-item layui-show">
					<iframe src="${ctx}/sys/deskManager.action" frameborder="0"
						class="layadmin-iframe"></iframe>
				</div>
			</div>

			<!-- 辅助元素，一般用于移动设备下遮罩 -->
			<div class="layadmin-body-shade" layadmin-event="shade"></div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${ctx}/resources/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${ctx}/resources/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user','jquery'], function() {
        var $ = layui.$,
            setter = layui.setter,
            admin = layui.admin,
            form = layui.form,
            router = layui.router();
        $("#logout").click(function (){
			logout();
		})
        function logout(){
        	$.post('${ctx}/login/loginOut.action',(res) => {
				if(res.code === 200){
					layer.msg("退出登录");
					location.href = '${ctx}/sys/login.action'; //跳转到登入页
				}else{
					layer.msg(res.message);
				}
			});
		}
    });

</script>
</html>

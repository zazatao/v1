<<<<<<< HEAD
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">RoomsWeb</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="user/index">Home</a></li>
                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Hotel <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="hotel/search">Hotel Search</a></li>
                        <li><a href="hotel/test">Test</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Another action</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Something else here</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Separated link</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">One more separated link</a></li>
                    </ul>
                </li>
                <li><a href="common/about">About</a></li>
                <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#contact">Contact</a></li>
            </ul>
            <form class="navbar-form navbar-right" role="form">
                <div class="form-group">
                    <input type="text" placeholder="Email" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" placeholder="Password" class="form-control">
                </div>
                <button type="submit" class="btn btn-success">Sign in</button>
            </form>
        </div>
    </div>
</div>
<!--
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Project name</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/roomsweb/user/index">Home</a></li>

                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Hotel<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="hotel/list">Hotel List</a></li>
                        <li><a href="hotel/info">Hotel Info</a></li>
                        <li><a href="hotel/create">Create Hotel</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Room<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="room/list">Room Info</a></li>
                        <li><a href="room/create">Create Room</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Price<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="price/list">Price Info</a></li>
                        <li><a href="price/create">Create Price</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Booking<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="lodging/status">Booking Info</a></li>
                        <li><a href="booking/cancel">Cancel Booking</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Action</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Another action</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Something else here</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-header">Nav header</li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">Separated link</a></li>
                        <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#">One more separated link</a></li>
                    </ul>
                </li>
                <li><a href="common/about">About</a></li>
                <li><a href="http://v3.bootcss.com/examples/sticky-footer-navbar/#contact">Contact</a></li>
            </ul>
        </div>
    </div>
</div>
-->
=======
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">总览<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">客户沟通</a></li>
						<li><a href="#">聊天</a></li>
						<li><a href="#">聊天中心</a></li>
						<li><a href="#">不明订单</a></li>
						<li><a href="#">未完成订单</a></li>
						<li><a href="#">订单问题</a></li>
						<li><a href="#">技术统计</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">订单处理 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">正在处理</a></li>
						<li><a href="#">订单组</a></li>
						<li><a href="#">处理</a></li>
						<li><a href="#">统计</a></li>
						<li><a href="#">操作员订单完成统计</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">仓库 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="../warehouse/receiving">收货</a></li>
						<li><a href="../warehouse/inspection">验货入库</a></li>
						<li><a href="../warehouse/reclaimStation">回收站</a></li>
						<li><a href="../warehouse/orderOfWay">在途订单</a></li>
						<li><a href="../warehouse/weighing">称量</a></li>
						<li><a href="../warehouse/sendTheParcel">发送包裹</a></li>
						<li><a href="../warehouse/freight">运费</a></li>
						<li><a href="../warehouse/batchShipments">成批发货</a></li>
						<li><a href="../warehouse/cargoGroup">货物组</a></li>
						<li><a href="#">统计发货人情况</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">转发 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">接收/发送</a></li>
						<li><a href="#">中转</a></li>
						<li><a href="#">问题</a></li>
						<li><a href="#">计算统计</a></li>
						<li><a href="#">运期</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">商店 <span class="caret"></span></a>
					<ul class="dropdown-menu menu-top" role="menu">
						<li><a href="#">订单</a></li>
						<li><a href="#">包裹</a></li>
						<li class="dropdown-submenu"><a href="#">财务</a>
							<ul class="dropdown-menu">
								<li><a href="#">操作</a></li>
								<li><a href="#">账单</a></li>
								<li><a href="#">用户结算</a></li>
								<li><a href="#">资金冻结</a></li>
								<li><a href="#">调整</a></li>
								<li><a href="#">会计</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">经济核算</a>
							<ul class="dropdown-menu">
								<li><a href="#">操作</a></li>
								<li><a href="#">账单计划</a></li>
								<li><a href="#">操作计划</a></li>
								<li><a href="#">账户计算</a></li>
								<li><a href="#">材料</a></li>
								<li><a href="#">基础操作</a></li>
								<li><a href="#">保存地</a></li>
								<li><a href="#">承包商</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">设置</a>
							<ul class="dropdown-menu">
								<li><a href="#">币种</a></li>
								<li><a href="#">币种汇率</a></li>
								<li><a href="#">附加费</a></li>
								<li><a href="#">操作员工作完成情况</a></li>
								<li><a href="#">栏目类型</a></li>
								<li><a href="#">调整原因</a></li>
							</ul></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">管理 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown-submenu"><a href="#">诊断</a>
							<ul class="dropdown-menu">
								<li><a href="#">状态</a></li>
								<li><a href="#">高峰期</a></li>
								<li><a href="#">PHP信息</a></li>
								<li><a href="#">Apache错误</a></li>
								<li><a href="#">Apache状态</a></li>
								<li><a href="#">统计AWStats软件</a></li>
								<li><a href="#">Cacti柱状图</a></li>
								<li><a href="#">计数器</a></li>
								<li><a href="#">测试</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">运输</a>
							<ul class="dropdown-menu">
								<li><a href="#">运输方式</a></li>
								<li><a href="#">关税</a></li>
								<li><a href="#">部门格子</a></li>
								<li><a href="#">包装盒</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">任务计划</a>
							<ul class="dropdown-menu">
								<li><a href="#">任务计划</a></li>
								<li><a href="#">任务状态</a></li>
								<li><a href="#">任务时刻表</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">管理</a>
							<ul class="dropdown-menu">
								<li><a href="#">权限管理</a></li>
								<li><a href="#">权限分配</a></li>
								<li><a href="#">角色管理</a></li>
								<li><a href="#">角色分配</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">其它</a>
							<ul class="dropdown-menu">
								<li><a href="#">设置</a></li>
								<li><a href="#">淘宝账户</a></li>
								<li><a href="#">语言</a></li>
								<li><a href="#">国家</a></li>
								<li><a href="#">时区</a></li>
								<li><a href="#">票的类型</a></li>
								<li><a href="#">票的状态</a></li>
								<li><a href="#">职位</a></li>
								<li><a href="#">员工分类</a></li>
								<li><a href="#">部门</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">内容</a>
							<ul class="dropdown-menu">
								<li><a href="#">新闻</a></li>
								<li><a href="#">邮寄</a></li>
								<li><a href="#">翻译</a></li>
								<li><a href="#">邮件模版</a></li>
								<li><a href="#">页面</a></li>
								<li><a href="#">论坛</a></li>
								<li><a href="#">视频</a></li>
								<li><a href="#">网站地图</a></li>
								<li><a href="#">网站电子地图类型</a></li>
								<li><a href="#">滚动广告</a></li>
								<li><a href="#">照片</a></li>
								<li><a href="#">帮助</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">折扣</a>
							<ul class="dropdown-menu">
								<li><a href="#">参与折扣</a></li>
								<li><a href="#">促销码</a></li>
								<li><a href="#">折扣</a></li>
								<li><a href="#">折扣类型</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">商品</a>
							<ul class="dropdown-menu">
								<li><a href="#">分类</a></li>
								<li><a href="#">确认</a></li>
								<li><a href="#">成批商品</a></li>
								<li><a href="#">首页商品</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">翻译</a>
							<ul class="dropdown-menu">
								<li><a href="#">翻译产品名称</a></li>
								<li><a href="#">翻译选项名称</a></li>
								<li><a href="#">翻译选项内容</a></li>
								<li><a href="#">翻译搜索短语</a></li>
								<li><a href="#">产品名称</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">黑名单</a>
							<ul class="dropdown-menu">
								<li><a href="#">销售黑名单</a></li>
								<li><a href="#">商品黑名单</a></li>
							</ul></li>
						<li><a href="#">客户</a></li>
						<li class="dropdown-submenu"><a href="#">员工</a>
							<ul class="dropdown-menu">
								<li><a href="#">操作员</a></li>
								<li><a href="#">发货员</a></li>
								<li><a href="#">经理</a></li>
								<li><a href="#">技术员</a></li>
								<li><a href="#">总经理</a></li>
							</ul></li>
						<li><a href="#">用户</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">统计 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">表格报表</a></li>
						<li><a href="#">折线报表</a></li>
						<li><a href="#">订单</a></li>
						<li><a href="#">技术支持</a></li>
						<li><a href="#">财务</a></li>
						<li><a href="#">员工</a></li>
						<li><a href="#">积极员工</a></li>
						<li><a href="#">发现者</a></li>
						<li><a href="#">促销码</a></li>
						<li class="dropdown-submenu"><a href="#">设置</a>
							<ul class="dropdown-menu">
								<li><a href="#">数据库</a></li>
								<li><a href="#">数据库类型</a></li>
							</ul></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><%=((User) request.getSession().getAttribute("loginUser")).getUserName()%></a></li>
				<li><a href="./user/logout">退出</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

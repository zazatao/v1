<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>zazatao</title>
<link href="./content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="./content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="./content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="./content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="./content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="./content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="./content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="./content/static/img/favicon.png">

<script type="text/javascript"
	src="./content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="./content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="./content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
</head>
<<<<<<< HEAD

<body>

	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">总览<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">订单处理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">仓库 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="./warehouse/receiving">收货</a></li>
							<li><a href="./warehouse/inspection">验货入库</a></li>
							<li><a href="./warehouse/reclaimStation">回收站</a></li>
							<li><a href="#">在途订单</a></li>
							<li><a href="#">称量</a></li>
							<li><a href="#">发送包裹</a></li>
							<li><a href="#">运费</a></li>
							<li><a href="#">成批发货</a></li>
							<li><a href="#">统计库房工作人员情况</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">转发 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">商店 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">管理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">统计 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><%=((User) request.getSession().getAttribute("loginUser")).getUserName()%></a></li>
					<li><a href="user/logout">退出</a></li>
				</ul>
				<jsp:include page="../default/common/footer.jsp"></jsp:include>
=======
<body>
	<!-- Static navbar -->
	<jsp:include page="./nav.jsp"></jsp:include>
</body>
</html>
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

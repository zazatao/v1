<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
=======
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!-- saved from url=(0040)http://getbootstrap.com/examples/signin/ -->
<html lang="en">
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git
<head>
<<<<<<< HEAD
<title>zazatao后台管理平台</title>
=======
<%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; ">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon"
	href="http://getbootstrap.com/assets/ico/favicon.ico">
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

<<<<<<< HEAD
<link href="content/static/css/bootstrap/bootstrap.css" rel="stylesheet">
=======
<title>Signin Template for Bootstrap</title>
<!-- Bootstrap core CSS -->
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

<<<<<<< HEAD
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">
=======
<!-- Custom styles for this template -->
<link href="content/static/css/commons/signin.css" rel="stylesheet">
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

<<<<<<< HEAD
<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
=======
<!-- Just for debugging purposes. Don't actually copy this line! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style id="clearly_highlighting_css" type="text/css">/* selection */
html.clearly_highlighting_enabled ::-moz-selection {
	background: rgba(246, 238, 150, 0.99);
}

html.clearly_highlighting_enabled ::selection {
	background: rgba(246, 238, 150, 0.99);
} /* cursor */
html.clearly_highlighting_enabled {
	/* cursor and hot-spot position -- requires a default cursor, after the URL one */
	cursor:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--cursor.png")
		14 16, text;
} /* highlight tag */
em.clearly_highlight_element {
	font-style: inherit !important;
	font-weight: inherit !important;
	background-image:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--yellow.png");
	background-repeat: repeat-x;
	background-position: top left;
	background-size: 100% 100%;
} /* the delete-buttons are positioned relative to this */
em.clearly_highlight_element.clearly_highlight_first {
	position: relative;
} /* delete buttons */
em.clearly_highlight_element a.clearly_highlight_delete_element {
	display: none;
	cursor: pointer;
	padding: 0;
	margin: 0;
	line-height: 0;
	position: absolute;
	width: 34px;
	height: 34px;
	left: -17px;
	top: -17px;
	background-image:
		url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--delete-sprite.png");
	background-repeat: no-repeat;
	background-position: 0px 0px;
}

em.clearly_highlight_element a.clearly_highlight_delete_element:hover {
	background-position: -34px 0px;
} /* retina */
@media ( min--moz-device-pixel-ratio : 2) , ( -webkit-min-device-pixel-ratio : 2)
		, ( min-device-pixel-ratio : 2) {
	em.clearly_highlight_element {
		background-image:
			url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--yellow@2x.png");
	}
	em.clearly_highlight_element a.clearly_highlight_delete_element {
		background-image:
			url("chrome-extension://pioclpoplcdbaefihamjohnefbikjilc/clearly/images/highlight--delete-sprite@2x.png");
		background-size: 68px 34px;
	}
}
</style>
<style type="text/css"></style>
<style>
[touch-action="none"] {
	-ms-touch-action: none;
	touch-action: none;
}

[touch-action="pan-x"] {
	-ms-touch-action: pan-x;
	touch-action: pan-x;
}

[touch-action="pan-y"] {
	-ms-touch-action: pan-y;
	touch-action: pan-y;
}

[touch-action="scroll"], [touch-action="pan-x pan-y"], [touch-action="pan-y pan-x"]
	{
	-ms-touch-action: pan-x pan-y;
	touch-action: pan-x pan-y;
}
</style>
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git
</head>
<body>
<<<<<<< HEAD
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<div class="col-md-12 column">
						<br> <br> <br> <br>
					</div>
				</div>
				<div class="row clearfix">
					<div class="col-md-3 column"></div>
					<div class="col-md-6 column">
						<p>
							<c:if test="${not empty message }">
								<font color="red">用户名或密码错误，请重新输入您的登陆信息</font>
							</c:if>
						</p>
						<form class="form-horizontal" action="personnel/login" method="POST">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input name="loginName" class="form-control" id="inputEmail3">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">密码</label>
								<div class="col-sm-10">
									<input type="password" name="password" class="form-control" id="inputPassword3">
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-default">登录</button>
									<button type="button" class="btn btn-default" onclick="regist()">注册</button>
								</div>
							</div>
						</form>
						<script type="text/javascript">
							function regist() {
								window.location.href = "personnel/regist";
							}
						</script>
					</div>
					<div class="col-md-3 column"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
=======

	<div class="container">

		<form class="form-signin" role="form" action="user/login"
			method="POST">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input type="text" name="name" class="form-control"
				placeholder="User Name" required autofocus> <input
				type="password" name="password" class="form-control"
				placeholder="Password" required> <label class="checkbox">
				<input type="checkbox" value="remember-me"> Remember me
			</label> <input class="btn btn-lg btn-primary btn-block" type="submit"
				value="Sign in">
		</form>

	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->


</body>
</html>
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git

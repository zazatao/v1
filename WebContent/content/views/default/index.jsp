<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title></title>

<link href="content/static/css/bootstrap/bootstrap.css" rel="stylesheet">

<link rel="apple-touch-icon-precomposed" sizes="144x144" href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">

<script type="text/javascript" src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
</head>
<body>
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
						<form class="form-horizontal" action="user/login" method="POST">
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
								<div class="col-sm-10">
									<input name="name" class="form-control" id="inputEmail3">
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
								window.location.href = "user/regist";
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

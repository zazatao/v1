<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>接收/发送</title>
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="../content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../content/static/img/favicon.png">
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
<div class="container-fluid" style="padding:0;margin-top:32px;" >
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">中转</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">接收&发送</font>
				</ul>
			</div>
		</div>
	</div>
	<br> 
	<br>
	<div class="row clearfix"
		style="vertical-align: middle; text-align: center;">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<form class="form-horizontal" action=""
						method="POST">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								<font color="green" style="font-size: 18px;">包裹:</font>
							</label>
							<div class="col-sm-6">
								<input type="text" name="hospitalDesignation"
									class="form-control" id="inputEmail3">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-7">
								<input type="radio" name="sendOrReceive" value="receive" checked="checked"><font
									color="red" style="font-size: 18px;">接收</font>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="radio" name="sendOrReceive" value="send"
									><font color="red"
									style="font-size: 18px;">发送</font>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-7">
							<br>
								<button class="btn btn-large btn-success" type="button">&nbsp;&nbsp;处&nbsp;&nbsp;理&nbsp;&nbsp;</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库房</title>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="content/static/img/favicon.png">

<script type="text/javascript"
	src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="panel panel-default" style="padding: 0; margin-top: 32px;">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a href="shop/insertShopOrder" style="font-size: 18px;">仓库</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">库房</font>
					<a href="#" style="font-size: 18px;" id="add">
					<span class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	
	<form action="warehouse/saveStoreroom" method="POST" class="form-horizontal" role="from">
		<div class="form-group">
			<label class="col-md-3 control-label">库房编号</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="cellStr">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">状态</label>
			<div class="col-md-6">
			<select class="form-control" name="isInCell" id="isInCell"
				placeholder="状态">
				<option value="">-----状态-----
					<option value="false" name = "false">未被使用
					<option value="true" name = "true">已被使用
			</select>	
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 col-md-offset-3">
				<button type="submit" class="form-control btn-primary" >提交</button>
			</div>
			<div class="col-md-2 col-md-offset-1">
				<button type="reset" class="form-control btn-warning">重置</button>
			</div>
		</div>
	</form>
	

	<jsp:include page="../common/delModelBox.jsp"></jsp:include>

	<script type="text/javascript">
	</script>
</body>
</html>

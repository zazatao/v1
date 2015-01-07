<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XX问题</title>
  
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
	<link href="../content/static/css/bootstrap/bootstrap-combined.min.css" rel="stylesheet"> 
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
					<li><a href="#" style="font-size: 18px;">问题</a></li> 
				</ul>
			</div>
		</div>
	</div>
	
	
	<div class="container-fluid"> 
			<div >
	<div class="row-fluid">
		<div class="span4 ui-sortable  panel panel-default">
			 <table class="table table-striped">
				<thead>
					<tr class="info" >
						<th>
							用户
						</th>
						<th>
							名字
						</th> 
					</tr>
				</thead> 
				<tbody>
					<tr>
						<td>zhangsan</td>
						<td>张三</td>
					</tr>	<tr>
						<td>zhangsan</td>
						<td>张三</td>
					</tr>	<tr>
						<td>zhangsan</td>
						<td>张三</td>
					</tr>	<tr>
						<td>zhangsan</td>
						<td>张三</td>
					</tr>	<tr>
						<td>zhangsan</td>
						<td>张三</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="span8  ui-sortable  panel panel-default ">
		   <table class="table table-striped">
				<thead>
					<tr class="info" >
						<th>
						订单号
							
						</th>
						<th>
							货物详情编号
						</th>
						<th>
							数量
						</th> 
						<th>
							结算重量
						</th> 
					</tr>
				</thead> 
				<tbody>
					<tr>
						<td>123131xasd</td>
						<td>184521247</td>
						<td>3</td>
						<td>3.00kg</td>
					</tr>	 
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
</body>
</html>
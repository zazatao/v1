<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会计</title>
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
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

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	<div class="panel panel-default" style="padding: 0; margin-top: 32px;">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a href="#" style="font-size: 18px;">商店</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">财务</font>
					<span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">会计</font>
			</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="./accounting"
					method="get">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="startDate" placeholder="起始日期"
								class="form-control" id="startDate"
								onclick="dateInfoxxx('startDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="endDate" placeholder="截至日期"
								class="form-control" id="endDate"
								onclick="dateInfoxxx('endDate')">
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<table id="yourTableID" class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>员工</th>
							<th>部门</th>
							<th>职位</th>
							<th>底薪</th>
							<th>规则</th>
							<th>票数</th>
							<th>提成</th>
						</tr>
					</thead>
					<c:forEach var="stat" items="${statistics }" >
						<tbody>
							<tr class="success">
								<td align="center">${stat.userName }</td>
								<td align="center">${stat.depart }</td>
								<td align="center">${stat.pos }</td>
								<td align="center">${stat.wage }</td>
								<td align="center">${stat.rules }</td>
								<td align="center">${stat.accomplishNum }</td>
								<td align="center">${stat.saleCut }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function dateInfoxxx(obj) {
		var date = obj;
		$('#' + date).datetimepicker({
			lang : 'ch',
			timepicker : false,
			format : 'Y-m-d',
			formatDate : 'Y-m-d',
		});
	}
	function checkvalue(obj) {
		if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
			alert('你输入的不是数字，或关闭输入法后再输入');
			obj.select();
		}
	}
	function updateShopOrder(commID){
		location.href ='./updateCommStatus?commID='+commID;
	}
	</script>
</body>
</html>
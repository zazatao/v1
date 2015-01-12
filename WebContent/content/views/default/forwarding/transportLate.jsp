<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运期晚点</title>

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

	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">中转</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">问题</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal" action="./searchTransportLate"
					method="POST">
					<div class="form-group">
						<div class="col-sm-2">
							<input type="text" name="cargoGroupID" class="form-control"
								id="cargoGroupID" onblur="checkvalue(this)" value=""
								placeholder="货物组号">
						</div>
						<div class="col-sm-2">
						<select class="form-control" id="transit"  name="transit">
							<option value="">-----------选择中转地-----------
							<option value="beijing">北京
						</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="delivery"
								id="delivery">
								<option value="">-------------运输方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default">查询</button>
						</div>
					</div>
				</form>
				<div class="panel panel-default">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>货物组号</th>
									<th>中转步骤</th>
									<th>运输方式</th>
									<th>发货日期</th>
									<th>收货日期</th>
									<th>延迟天数</th>
									<th>赔付</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cargoGroup" items="${list }" varStatus="loop">
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td>${cargoGroup.cargoGroupID}</td>
									<td>${cargoGroup.transit }</td>
									<td>${cargoGroup.delivery }</td>
									<td>${cargoGroup.sendDate }</td>
									<td>${cargoGroup.receiveDate }</td>
									<td>${cargoGroup.lateDays }</td>
									<td>${cargoGroup.compensation }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
	</script>
</body>
</html>
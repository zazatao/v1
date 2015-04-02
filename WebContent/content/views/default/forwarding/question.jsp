<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中转问题</title>

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
			<div class="col-md-4 column">
				<form class="form-horizontal" action="./searchQuestion"
					method="POST">
					<div class="form-group">
						<div class="col-sm-4">
							<input type="text" name="userName" class="form-control"
								id="userName" value="" placeholder="姓名">
						</div>
						<div class="col-sm-4">
							<input type="text" name="phone" class="form-control"
								id="phone" value="" placeholder="电话">
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
									<th>用户</th>
									<th>电话</th>
									<th>E-mail</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users }" varStatus="loop">
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td><a href="./getProblemPackByUser?id=${user.id }">${user.userName}</a></td>
									<td>${user.phone }</td>
									<td>${user.email }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-8 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<table class="table table-striped">
										<thead>
											<tr class="info">
												<th>订单号</th>
												<th>货物编号</th>
												<th>货品种类数量</th>
												<th>结算重量</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="problem" items="${problemPacks }" varStatus="loop">
												<c:forEach items="${problem.package1.orderForms }" var="order">
														<c:choose>
															<c:when test="${loop.index%2==0 }">
																<tr>
															</c:when>
															<c:otherwise>
																<tr class="success">
															</c:otherwise>
														</c:choose>
														<td>${order.orderFormID}</td>
														<td>${problem.package1.packAgeTpek }</td>
														<td>${fn:length(order.commodities) }</td>
														<td>${problem.package1.totalWeight}</td>
														</tr>
												</c:forEach>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
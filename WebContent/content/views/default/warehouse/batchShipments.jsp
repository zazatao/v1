<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货</title>
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
</head>

<body>

	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">仓库</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">成批出货</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">包裹</h3>
				</div>
				<div class="list-group-item">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>包裹号</th>
								<th>追踪号</th>
								<th>发货</th>
								<th>运输方式</th>
								<th>用户的格子</th>
								<th>毛重</th>
								<th>支付运费</th>
								<th>状态</th>
							</tr>
							<c:forEach var="orders" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td><a href="#" onclick="haveOrder(${orders.packageID });">${orders.packageCode }</a></td>
								<td>${orders.packAgeTpek }</td>
								<td></td>
								<td><c:if test="${orders.delivery=='EMS' }">EMS</c:if></td>
								<td></td>
								<td>${orders.grossWeight }</td>
								<td>${orders.transportFee }</td>
								<td><c:if test="${orders.status == 'sendOut' }">派送</c:if> <%-- 									<c:if test="${orders.inForwarding == 'inForwarding' }">在转发</c:if> --%>
									<%-- 									<c:if test="${orders.senToWarehouse == 'senToWarehouse' }">送货到仓库</c:if> --%>
									<%-- 									<c:if test="${orders.packing == 'packing' }"> 打包</c:if> --%>
								</td>
								</tr>
							</c:forEach>
						</table>
						</p>
					</div>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">订单</h3>
				</div>
				<div class="list-group-item">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>订单号</th>
								<th>格子</th>
								<th>淘宝ID</th>
								<th>卖家追踪号</th>
								<th>数量</th>
								<th>重量</th>
								<th>产品名称</th>
								<th>状态</th>
							</tr>
							<c:forEach var="order" items="${orders }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td>${order.orderFormID }</td>
								<td>${order.commodities[0].storeRoom.cellStr }</td>
								<td>${order.commodities[0].transNumForTaobao }</td>
								<td>${order.commodities[0].tpek }</td>
								<td>${fn:length(order.commodities) }</td>
								<td>${order.commodities[0].weight }</td>
								<td>${order.commodities[0].nameOfGoods }</td>
								<td>${order.commodities[0].status}</td>
								</tr>
							</c:forEach>
						</table>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function haveOrder(packageID) {
			location.href ='./getOrderByPackAgeID?id='+packageID;
		}
		function reloadData() {
			setTimeout(function() {
				window.location.reload();
			}, 1000);
		}
		function popupwindow(url) {
			var w = 700;
			var h = 800;
			var title = "";
			var left = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2);
			return window
					.open(
							url,
							title,
							'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
									+ w
									+ ', height='
									+ h
									+ ', top='
									+ top
									+ ', left=' + left);
		}
	</script>
</body>
</html>

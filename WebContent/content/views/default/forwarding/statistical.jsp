<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>包裹</title>
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
				<a href="#" style="font-size: 18px;">商品</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">包裹</font><a
					href="./toAddPackage" style="font-size: 18px;"><span
					class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>包裹编号</th>
							<th>订单编号</th>
							<th>包裹组追踪号</th>
							<th>包裹追踪</th>
							<th>下单时间</th>
							<th>付款时间</th>
							<th>包裹发货时间</th>
							<th>地区</th>
							<th>运输方式</th>
							<th>中转地</th>
							<th>实际运费(人民币)</th>
							<th>订单状态</th>
							<th>操作员</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="package" items="${packages }" varStatus="loop">
						<tbody>
							<c:forEach items="${package.orderForms }" var="order" varStatus="ll" >
									<c:choose>
										<c:when test="${ll.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td align="center">${package.packageID }</td>
									<td align="center">${order.orderFormID }</td>
									<td>${package.cargoGroup.tpekCargoGroup }</td>
									<td>${package.packAgeTpek }</td>
									<td>${order.orderDate }&nbsp;${order.orderTime }</td>
									<td>${order.paymentDate }&nbsp;${order.paymentTime }</td>
									<td>${package.sendDate }</td>
									<td>${order.address.country }${order.address.provience }${order.address.city }${order.address.district }</td>
									<td align="center">
										<c:choose>
											<c:when test="${package.delivery =='EMS'}">EMS</c:when>
											<c:when test="${package.delivery =='sf'}">顺风</c:when>
										</c:choose>
									</td>
									<td align="center">
										<c:if test="${package.transit == 'beijing'}">北京</c:if>
										<c:if test="${package.transit == 'wlmq'}">乌鲁木齐</c:if>
									</td>
									<td align="center">${package.transportFee }</td>
									<td>
										<c:choose>
											<c:when test="${order.orderstatus =='waitAcceptance'}">等待验收</c:when>
											<c:when test="${order.orderstatus =='waitPayment'}">等待支付</c:when>
											<c:when test="${order.orderstatus =='inForwarding'}">在线转发</c:when>
											<c:when test="${order.orderstatus =='waitDelivery'}">等待发货</c:when>
											<c:when test="${order.orderstatus =='transitGoods'}">在途货物</c:when>
											<c:when test="${order.orderstatus =='consigneeSigning'}">收货人签单</c:when>
											<c:when test="${order.orderstatus =='completionTransaction'}">完成交易</c:when>
											<c:when test="${order.orderstatus =='closeTransaction'}">关闭交易</c:when>
											<c:when
												test="${order.orderstatus =='autoCloseTransaction'}">自动关闭交易</c:when>
									</c:choose>
									</td>
									<td>${order.commodities[0].storeOperator.userName}</td>
									<td><button class="btn btn-default" onclick="updateShopOrder(${package.packageID});">修改</button>&nbsp;&nbsp;
										<button class="btn btn-default" onclick="deleteShopOrder(${package.packageID});">删除</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function updateShopOrder(num){
			location.href =	'./updateShopOrder?id='+num;
		}
		function deleteShopOrder(num){
			location.href =	'./deleteShopOrder?id='+num;
		}
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

<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成批发货</title>
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
	<div class="container-fluid"  style="padding:0;margin-top:32px;">
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
		<form class="form-horizontal" action="./searchFreight?page=batchShipments"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹追踪号"
								class="form-control" id="packageCode" >
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="收货人姓名"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="formDelivery"
								id="formDelivery">
								<option value="">-------------运输方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-1">
							<input type="text" name="sendDate" placeholder="发货日期"
								class="form-control" id="sendDate" onclick="dateInfoxxx('sendDate')">
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
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
								<th>收件人</th>
								<th>运输方式</th>
								<th>总重量</th>
								<th>支付运费</th>
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
								<td>${orders.orderForms[0].orderUser.userName }</td>
								<td><c:if test="${orders.delivery=='EMS' }">EMS</c:if>
								<c:if test="${orders.delivery=='sf' }">顺风</c:if>
								</td>
								<td>${orders.totalWeight }</td>
								<td>${orders.transportFee }</td>
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
								<th>货品编号</th>
								<th>产品名称</th>
								<th>数量</th>
								<th>重量</th>
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
								<td>${order.orderUser.storeRoom.cellStr }</td>
								<td>${order.commodities[0].transNumForTaobao }</td>
								<td>${order.commodities[0].nameOfGoods }</td>
								<td>${fn:length(order.commodities) }</td>
								<td>${order.commodities[0].weight }</td>
								<td>
								<c:choose>
																	<c:when test="${order.commodities[0].status =='unchanged'}">没有变化</c:when>
																	<c:when test="${order.commodities[0].status =='cancel'}">取消交易</c:when>
																	<c:when test="${order.commodities[0].status =='delete'}">删除</c:when>
																	<c:when test="${order.commodities[0].status =='senToWarehouse'}">送往库房</c:when>
																	<c:when test="${order.commodities[0].status =='refuse'}">拒绝入库</c:when>
																	<c:when test="${order.commodities[0].status =='lose'}">丢失</c:when>
																	<c:when test="${order.commodities[0].status =='inWarehouse'}">在库房中</c:when>
																	<c:when test="${order.commodities[0].status =='marriage'}">交易中</c:when>
																	<c:when test="${order.commodities[0].status =='lack'}">缺少货品</c:when>
																	<c:when test="${order.commodities[0].status =='inAuctionlose'}">下单</c:when>
																	<c:when test="${order.commodities[0].status =='delivery'}">交付</c:when>
																	<c:when test="${order.commodities[0].status =='support'}">支持</c:when>
																	<c:when test="${order.commodities[0].status =='sendOut'}">派送</c:when>
																	<c:when test="${order.commodities[0].status =='buyerNotPay'}">买方没有支付</c:when>
																	<c:when test="${order.commodities[0].status =='inCell'}">在格子</c:when>
																	<c:when test="${order.commodities[0].status =='manualProcessing'}">手工加工</c:when>
																	<c:when test="${order.commodities[0].status =='inForwarding'}">转发中</c:when>
																	<c:when test="${order.commodities[0].status =='packing'}">打包</c:when>
																	<c:when test="${order.commodities[0].status =='paid'}">已付</c:when>
																	<c:when test="${order.commodities[0].status =='apiProcessing'}">API处理</c:when>
																	<c:when test="${order.commodities[0].status =='waitingForTracking'}">等待的追踪</c:when>
																</c:choose>
								</td>
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
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
				timepicker : false,
				format : 'Y-m-d',
				formatDate : 'Y-m-d',
			});
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

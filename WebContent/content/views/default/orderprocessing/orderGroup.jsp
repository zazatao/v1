<%@page import="com.yc.entity.OrderForm"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单组</title>
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
					<li><a href="#" style="font-size: 18px;">订单处理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">订单组</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
		<form class="form-horizontal" action="./searchOrderProcess"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="orderGroupID" placeholder="订单编号"
								class="form-control" id="orderGroupID" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="taskNumber" placeholder="任务号"
								class="form-control" id="taskNumber">
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="orderStatus" placeholder="订单状态"
								id="orderStatus">
								<option value="">订单状态
								<option value="initializa">初始化
								<option value="waitAcceptance">等待验收
								<option value="waitPayment">等待支付
								<option value="waitDelivery"> 等待发货
								<option value="transitGoods">在途货物
								<option value="consigneeSigning">收货人签单
								<option value="completionTransaction">完成交易
								<option value="closeTransaction">关闭交易
								<option value="autoCloseTransaction">自动关闭交易
							</select>
						</div>
						
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">订单组</h3>
				</div>
				<div class="list-group-item">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>编号</th>
								<th>销售</th>
								<th>任务号</th>
								<th>支付宝交易</th>
								<th>金额</th>
								<th>状态</th>
								<th>支付(付款)</th>
							</tr>
							<c:forEach var="orderGroups" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td><a href="#" onclick="haveOrder(${orderGroups.orderGroupID });">${orderGroups.orderGroupID }</a></td>
								<td>${orderGroups.sale }</td>
								<td>${orderGroups.taskNumber }</td>
								<td>${orderGroups.alipayPay }</td>
								<td>${orderGroups.sumOfMoney }</td>
								<td><c:if test="${orderGroups.status == 'initializa' }">初始化</c:if> <%-- 									<c:if test="${orders.inForwarding == 'inForwarding' }">在转发</c:if> --%>
									<%-- 									<c:if test="${orders.senToWarehouse == 'senToWarehouse' }">送货到仓库</c:if> --%>
									<%-- 									<c:if test="${orders.packing == 'packing' }"> 打包</c:if> --%>
								</td>
								<td>${orderGroups.pay }</td>
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
						<table class="table table-striped" id="tableOrders">
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
			location.href = './getOrderByOrderGroup?id='+packageID
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

<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>
	<button type="button" class="btn btn-primary btn-sm">
		<font><font>小按钮</font></font>
	</button>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>订单</th>
										<th>货号</th>
										<th>买方</th>
										<th>追踪</th>
										<th>数量</th>
										<th>价格</th>
										<th>金额</th>
										<th>重量</th>
										<th>状态改变时间</th>
										<th>状态</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="value" items="${commodity }" varStatus="loop">
										<c:choose>
											<c:when test="${loop.index%2==0 }">
												<tr class="success">
											</c:when>
											<c:otherwise>
												<tr>
											</c:otherwise>
										</c:choose>
										<td>${value.orderNumber.orderFormID }</td>
										<td>${value.commItem }</td>
										<td>${value.orderNumber.orderUser.userName }</td>
										<td>${value.tpek }</td>
										<td>${value.quantity }</td>
										<td>${value.price }</td>
										<td>${value.money }</td>
										<td>${value.weight }</td>
										<td>${value.orderNumber.changeStatusDate }</td>
										<td><c:choose>
												<c:when test="${value.status =='unchanged'}">没有变化</c:when>
												<c:when test="${value.status =='cancel'}">取消交易</c:when>
												<c:when test="${value.status =='delete'}">删除</c:when>
												<c:when test="${value.status =='senToWarehouse'}">送往库房</c:when>
												<c:when test="${value.status =='refuse'}">拒绝入库</c:when>
												<c:when test="${value.status =='lose'}">丢失</c:when>
												<c:when test="${value.status =='inWarehouse'}">在库房中</c:when>
												<c:when test="${value.status =='marriage'}">交易中</c:when>
												<c:when test="${value.status =='lack'}">缺少货品</c:when>
												<c:when test="${value.status =='inAuctionlose'}">下拍</c:when>
												<c:when test="${value.status =='delivery'}">交付</c:when>
												<c:when test="${value.status =='support'}">支持</c:when>
												<c:when test="${value.status =='sendOut'}">派送</c:when>
												<c:when test="${value.status =='buyerNotPay'}">买方没有支付</c:when>
												<c:when test="${value.status =='inCell'}">在格子</c:when>
												<c:when test="${value.status =='manualProcessing'}">手工加工</c:when>
												<c:when test="${value.status =='inForwarding'}">转发中</c:when>
												<c:when test="${value.status =='packing'}">打包</c:when>
												<c:when test="${value.status =='paid'}">已付</c:when>
												<c:when test="${value.status =='apiProcessing'}">API处理</c:when>
												<c:when test="${value.status =='waitingForTracking'}">等待的追踪</c:when>
											</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
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
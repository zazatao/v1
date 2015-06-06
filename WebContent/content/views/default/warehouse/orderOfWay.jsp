<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在途订单</title>
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
	<div class="container-fluid"  style="padding:0;margin-top:32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">仓库</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">在途订单</font></a>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="warehouse/searchOrderOfWay"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="orderFormID" placeholder="订单"
								class="form-control" id="orderFormID" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="transNumForTaobao"
								placeholder="货品编码" class="form-control"
								id="transNumForTaobao" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="客户"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="tpek" placeholder="条形码"
								class="form-control" id="tpek">
						</div>
						<div class="col-sm-1">
							<input type="text" name="changeStatusDate" placeholder="改变日期"
								class="form-control" id="changeStatusDate"
								onclick="dateInfoxxx('changeStatusDate')">
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="formStatus" id="formStatus" >
								<option value="">-----状态-----
								<option value="unchanged">没有变化
								<option value="refuse">拒绝接受货物
								<option value="lack">缺乏
								<option value="inWarehouse">在仓库
								<option value="inAuctionlose">下拍
								<option value="cancel">取消
								<option value="delivery">交付
								<option value="support">支持
								<option value="sendOut">派送
								<option value="buyerNotPay">买方没有支付
								<option value="inCell">在格子
								<option value="lose">丢失
								<option value="manualProcessing">手工加工
								<option value="inForwarding">在转发
								<option value="senToWarehouse">送货到仓库
								<option value="packing">打包
								<option value="paid">已付
								<option value="apiProcessing">API处理
								<option value="delete">删除
								<option value="waitingForTracking">等待的追踪
							</select>
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<table class="table table-bordered table-hover table-condensed">
								<thead>
									<tr>
										<th>订单</th>
										<th>货品编码</th>
										<th>客户</th>
										<th>地址</th>
										<th>条形码</th>
										<th>数量</th>
										<th>价格</th>
										<th>金额</th>
										<th>重量</th>
										<th>改变时间</th>
										<th>订单状态</th>
										<th>货品状态</th>
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
										<td>${value.transNumForTaobao }</td>
										<td>${value.orderNumber.orderUser.userName }</td>
										<td align="center"><font style="color: blue;">${value.orderNumber.address.country }${value.orderNumber.address.provience }${value.orderNumber.address.city }${value.orderNumber.address.district }${value.orderNumber.address.street }${value.orderNumber.address.orther }</font></td>
										<td>${value.tpek }</td>
										<td>${value.quantity }</td>
										<td>${value.price }</td>
										<td>${value.money }</td>
										<td>${value.weight }</td>
										<td>${value.orderNumber.changeStatusDate }</td>
										<td><c:if test="${value.orderNumber.orderstatus == 'transitGoods'}">订单在途</c:if></td>
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
												<c:when test="${value.status =='inAuctionlose'}">下单</c:when>
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

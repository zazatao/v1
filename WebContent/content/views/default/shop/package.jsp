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
				<a href="./insertPackage" style="font-size: 18px;">商品</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">包裹</font><a
					href="./toAddPackage" style="font-size: 18px;"><span
					class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="./searchPackage"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="transNumForTaobao" placeholder="货号"
								class="form-control" id="transNumForTaobao" onblur="checkvalue(this);">
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="买方"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹"
								class="form-control" id="packageCode">
						</div>
						<div class="col-sm-1">
							<input type="text" name="operatorPurchase" placeholder="操作员"
								class="form-control" id="operatorPurchase">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderDate" placeholder="创建日期"
								class="form-control" id="orderDate"
								onclick="dateInfoxxx('orderDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="paymentDate" placeholder="付款日期"
								class="form-control" id="paymentDate"
								onclick="dateInfoxxx('paymentDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="tpek" placeholder="追踪"
								class="form-control" id="tpek">
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="formStatus" id="formStatus"
								placeholder="状态">
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
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>编号</th>
							<th>组货</th>
							<th>追踪</th>
							<th>创建日期</th>
							<th>付款日期</th>
							<th>发货日期</th>
							<th>地区</th>
							<th>运输方式</th>
							<th>实际用费(人民币)</th>
							<th>订单成本</th>
							<th>状态</th>
							<th>操作员</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="package" items="${list }" varStatus="loop">
						<tbody>
							<tr class="success">
								<td align="center">${package.packageID }</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td align="center">
									<c:choose>
										<c:when test="${package.transport =='ems'}">EMS</c:when>
										<c:when test="${package.transport =='sf'}">顺风</c:when>
									</c:choose>
								</td>
								<td></td>
								<td></td>
								<td>
									<c:choose>
										<c:when test="${commodity.status =='unchanged'}">没有变化</c:when>
										<c:when test="${commodity.status =='senToWarehouse'}">送往库房</c:when>
										<c:when test="${commodity.status =='refuse'}">拒绝入库</c:when>
										<c:when test="${commodity.status =='lose'}">丢失</c:when>
										<c:when test="${commodity.status =='inWarehouse'}">在库房中</c:when>
										<c:when test="${commodity.status =='marriage'}">交易中</c:when>
									</c:choose>
								</td>
								<td>${package.storeOperator.userName}</td>
								<td><button class="btn btn-default" onclick="updateShopOrder(${package.packageID});">修改</button>&nbsp;&nbsp;
									<button class="btn btn-default" onclick="deleteShopOrder(${package.packageID});">删除</button></td>
							</tr>
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

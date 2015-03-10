<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
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
	<br>
	<br>
	<br>
	<form class="form-horizontal" action="./editShopOrder?id=${orderform.orderFormID}" method="POST">
		<div class="form-group" style="text-align: center;">
			<label><font style="font-size: 40px;">订单修改</font> </label> <br>
			<br>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label"><a
				class="frred">*</a><font style="font-size: 18px;">编号</font></label>
			<div class="col-sm-8">
				<input type="text" name="orderFormID" class="form-control" id="inputEmail3" value="${orderform.orderFormID}" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label"><a
				class="frred">*</a><font style="font-size: 18px;">货号</font></label>
			<div class="col-sm-8">
				<input type="text" name="commItem" class="form-control" id="inputEmail3" value="${commodity.commItem }" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label"><a
				class="frred">*</a><font style="font-size: 18px;">买方</font></label>
			<div class="col-sm-8">
				<input type="text" name="customer" class="form-control" id="inputEmail3" value="${commodity.orderNumber.orderUser.userName }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label"><a
				class="frred">*</a><font style="font-size: 18px;">电话</font></label>
			<div class="col-sm-8">
				<input type="text" name="phone" class="form-control" id="inputEmail3" value="${commodity.orderNumber.orderUser.phone }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">
				<font style="font-size: 18px;">邮箱</font></label>
			<div class="col-sm-8">
				<input type="text" name="email" class="form-control" id="inputEmail3" value="${commodity.orderNumber.orderUser.email }">
			</div>
		</div>
		<div class="form-group">
			<label for="inputEmail3" class="col-sm-2 control-label">
				<font style="font-size: 18px;">状态</font></label>
			<div class="col-sm-8">
				<select class="form-control" name="orderstatus" id="orderstatus" value="${orderform.orderstatus}"
					placeholder="状态">
					<option value="">-----状态-----
					<option value="waitAcceptance" name = "waitAcceptance">等待验收
					<option value="waitPayment" name = "waitPayment">等待支付
					<option value="inForwarding" name = "inForwarding">在线转发
					<option value="waitDelivery" name = "waitDelivery">等待发货
					<option value="transitGoods" name = "transitGoods">在途货物
					<option value="consigneeSigning" name = "consigneeSigning">收货人签单
					<option value="completionTransaction" name = "completionTransaction">完成交易
					<option value="closeTransaction" name = "closeTransaction">关闭交易
					<option value="autoCloseTransaction" name = "autoCloseTransaction">自动关闭交易
				</select>
			</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-12" style="text-align: center;">
				<button type="submit" class="btn btn-default">修改</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-default" onclick="cancel()">取消</button>
			</div>
		</div>
	</form>

	<script type="text/javascript">
		function updateShopOrder(num) {
			location.href = './updateShopOrder?id=' + num;
		}
		function deleteShopOrder(num) {
			location.href = './deleteShopOrder?id=' + num;
		}
		function cancel(num) {
			location.href = './shopOrder?id=' + num;
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

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
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
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

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<jsp:include page="../../common/navbar.jsp"></jsp:include>
	<div class="panel panel-default" style="padding: 0; margin-top: 32px;">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a href="#" style="font-size: 18px;">商店</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">财务</font>
					<span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">账单支付</font>
			</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="shop/searchBillPay"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="orderID" placeholder="订单编号"
								class="form-control" id="orderID"
								onblur="checkvalue(this);">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderUser" placeholder="买方"
								class="form-control" id="orderUser">
						</div>
						<div class="col-sm-1">
							<input type="text" name="purchase" placeholder="操作员"
								class="form-control" id="purchase">
						</div>
						<div class="col-sm-1">
							<input type="text" name="paymentDate" placeholder="买家付款日期"
								class="form-control" id="paymentDate"
								onclick="dateInfoxxx('paymentDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="zazataoPayDate" placeholder="商城付款日期"
								class="form-control" id="zazataoPayDate"
								onclick="dateInfoxxx('zazataoPayDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="currency" placeholder="币种"
								class="form-control" id="currency">
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<table id="yourTableID" class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>订单号</th>
							<th>客户</th>
							<th>电话</th>
							<th>采购员</th>
							<th>产品编号</th>
							<th>产品名称</th>
							<th>产品描述</th>
							<th>买家付款日期</th>
							<th>付款日期</th>
							<th>金额</th>
							<th>币种</th>
							<th>结算方式</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="comm" items="${list }" varStatus="vs">
						<tbody>
							<tr class="success">
								<td align="center">${comm.orderNumber.orderFormID }</td>
								<td align="center">${comm.orderNumber.orderUser.userName }</td>
								<td align="center">${comm.orderNumber.orderUser.phone }</td>
								<td align="center">${comm.purchase.userName }</td>
								<td align="center">${comm.transNumForTaobao }</td>
								<td align="center">${comm.nameOfGoods }</td>
								<td>${comm.describes }</td>
								<td align="center">${comm.orderNumber.paymentDate }&nbsp;&nbsp;${comm.orderNumber.paymentTime }</td>
								<td><font style="color: blue;">${comm.zazataoPayDate }&nbsp;&nbsp;${comm.zazataoPayTime }</font></td>
								<td>${comm.money }</td>
								<td  align="center">${comm.currency }</td>
								<td>${orderform.deliveryMoney }</td>
								<td><button class="btn btn-default" data-toggle="modal"
										data-target="#detailModal"
										onclick="updateShopOrder(${comm.commodityID});">付款</button>&nbsp;&nbsp;
							</tr>
						</tbody>
					</c:forEach>
				</table>
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
	function updateShopOrder(commID){
		location.href ='shop/updateCommStatus?commID='+commID;
	}
	</script>
</body>
</html>
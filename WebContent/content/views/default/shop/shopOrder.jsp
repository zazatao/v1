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
	<div class="panel panel-default" style="padding: 0; margin-top: 32px;">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a href="./insertShopOrder" style="font-size: 18px;">商品</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">订单</font>
					<a href="./toAddShopOrder" style="font-size: 18px;">
					<span class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="./searchShopOrder"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="transNumForTaobao" placeholder="货号"
								class="form-control" id="transNumForTaobao" onblur="checkvalue(this);">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderUser" placeholder="买方"
								class="form-control" id="orderUser">
						</div>
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹"
								class="form-control" id="packageCode">
						</div>
						<div class="col-sm-1">
							<input type="text" name="storeOperator" placeholder="操作员"
								class="form-control" id="storeOperator">
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
							<select class="form-control" name="orderstatus" id="orderstatus"
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
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>编号</th>
							<th>货号(淘宝ID)</th>
							<th>买方</th>
							<th>E-mail</th>
							<th>电话</th>
							<th>追踪</th>
							<th>数量</th>
							<th>支付金额</th>
							<th>交易金额</th>
							<th>币种</th>
							<th>创建日期</th>
							<th>付款日期</th>
							<th>状态</th>
							<th>包裹</th>
							<th>完成订单个数</th>
							<th>操作员</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="orderform" items="${list }" varStatus="vs">
						<tbody>
							<tr class="success">
								<td align="center">${orderform.orderFormID }</td>
								<td></td>
								<td>${orderform.orderUser.userName }</td>
								<td>${orderform.orderNumber.email }</td>
								<td></td>
								<td></td>
								<td>${orderform.orderNumber.tpek }</td>
								<td></td>
								<td></td>
								<td>${orderform.orderNumber.currency }</td>
								<td>${orderform.orderDate }</td>
								<td></td>
								<td><c:choose>
										<c:when test="${orderform.orderstatus =='waitAcceptance'}">等待验收</c:when>
										<c:when test="${orderform.orderstatus =='waitPayment'}">等待支付</c:when>
										<c:when test="${orderform.orderstatus =='inForwarding'}">在线转发</c:when>
										<c:when test="${orderform.orderstatus =='waitDelivery'}">等待发货</c:when>
										<c:when test="${orderform.orderstatus =='transitGoods'}">在途货物</c:when>
										<c:when test="${orderform.orderstatus =='consigneeSigning'}">收货人签单</c:when>
										<c:when test="${orderform.orderstatus =='completionTransaction'}">完成交易</c:when>
										<c:when test="${orderform.orderstatus =='closeTransaction'}">关闭交易</c:when>
										<c:when test="${orderform.orderstatus =='autoCloseTransaction'}">自动关闭交易</c:when>
									</c:choose>
								</td>
								<td>${orderform.packAge.packageCode }</td>
								<td>${orderform.purchase.accomplishNum }</td>
								<td>${orderform.storeOperator.userName }</td>
								<td><button class="btn btn-default" data-toggle="modal" data-target="#detailModal" onclick="updateShopOrder(${commodity.commodityID});">修改</button>&nbsp;&nbsp;
									<button class="btn btn-default" id="del" onclick="deleteShopOrder(${orderform.orderFormID});">删除</button></td>
<!-- 									<button class="btn btn-default" onclick="#" id="del">删除</button> -->
							</tr>
							<tr>
								<td rowspan="5" height="140px;" width="140px;">
<%-- 									<c:if --%>
<%-- 										test="${orderform.imagePaths[0].path !=null}"> --%>
<!-- 										<img height="140px;" width="140px;" -->
<%-- 											src="..${orderform.imagePaths[0].path}"> --%>
<%-- 									</c:if> --%>
								</td>
								<td colspan="16">颜色：&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;尺码：&nbsp;</td>
							</tr>
							<tr>
								<td colspan="16">操作员：&nbsp;${orderform.storeOperator.userName }</td>
							</tr>
							<tr>
								<td colspan="16">采购：&nbsp;${orderform.purchase.userName }</td>
							</tr>
							<tr>
								<td colspan="16">重量：&nbsp;</td>
							</tr>	
							<tr>
								<td colspan="16">评论：&nbsp;</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="../common/delModelBox.jsp"></jsp:include>

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
		//删除模态框
		$(document).ready(function() {
			$("#del").click(function() { //给本页面的所有的“删除”超链接添加“点击事件”处理函数
				var onclick = $(this).attr("onclick"); //获取当前点击的超链接的href值
				alert(onclick);
				$("#delModal").modal("show"); //显示模态框
				//当点击“确认删除”按钮时，执行一次性事件处理函数
				$("#doDel").one("click", function() {
					location.assign(onclick); //加载指定链接值的目标资源
				});
				return false; //阻止元素本身的默认行为
			});
		});
	</script>
</body>
</html>

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
								<option value="unchanged" name = "unchanged">没有变化
								<option value="refuse" name = "refuse">拒绝接受货物
								<option value="lack" name = "lack">缺乏
								<option value="inWarehouse" name = "inWarehouse">在仓库
								<option value="inAuctionlose" name = "inAuctionlose">下拍
								<option value="cancel" name = "cancel">取消
								<option value="delivery" name = "delivery">交付
								<option value="support" name = "support">支持
								<option value="sendOut" name = "sendOut">派送
								<option value="buyerNotPay" name = "buyerNotPay">买方没有支付
								<option value="inCell" name = "inCell">在格子
								<option value="lose" name = "lose">丢失
								<option value="manualProcessing" name = "manualProcessing">手工加工
								<option value="inForwarding" name = "inForwarding">在转发
								<option value="senToWarehouse" name = "senToWarehouse">送货到仓库
								<option value="packing" name = "packing">打包
								<option value="paid" name = "paid">已付
								<option value="apiProcessing" name = "apiProcessing">API处理
								<option value="delete" name = "delete">删除
								<option value="waitingForTracking" name = "waitingForTracking">等待的追踪
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
					<c:forEach var="commodity" items="${list }" varStatus="vs">
						<tbody>
							<tr class="success">
								<td align="center">${commodity.orderNumber.orderFormID }</td>
								<td>${commodity.transNumForTaobao }</td>
								<td>${commodity.orderNumber.orderUser.userName }</td>
								<td>${commodity.orderNumber.orderUser.email }</td>
								<td>${commodity.orderNumber.orderUser.phone }</td>
								<td>${commodity.tpek }</td>
								<td>${commodity.quantity }</td>
								<td>${commodity.money }</td>
								<td>${commodity.money }</td>
								<td>${commodity.currency }</td>
								<td>${commodity.orderNumber.orderDate }</td>
								<td>${commodity.orderNumber.paymentDate }</td>
								<td><c:choose>
										<c:when test="${commodity.status =='unchanged'}">没有变化</c:when>
										<c:when test="${commodity.status =='lack'}">缺乏</c:when>
										<c:when test="${commodity.status =='inWarehouse'}">在仓库</c:when>
										<c:when test="${commodity.status =='inAuctionlose'}">下拍</c:when>
										<c:when test="${commodity.status =='cancel'}">取消</c:when>
										<c:when test="${commodity.status =='delivery'}">交付</c:when>
										<c:when test="${commodity.status =='support'}">支持</c:when>
										<c:when test="${commodity.status =='sendOut'}">派送</c:when>
										<c:when test="${commodity.status =='buyerNotPay'}">买方没有支付</c:when>
										<c:when test="${commodity.status =='senToWarehouse'}">送往库房</c:when>
										<c:when test="${commodity.status =='inCell'}">在格子</c:when>
										<c:when test="${commodity.status =='lose'}">丢失</c:when>
										<c:when test="${commodity.status =='manualProcessing'}">手工加工</c:when>
										<c:when test="${commodity.status =='inForwarding'}">在转发</c:when>
										<c:when test="${commodity.status =='senToWarehouse'}">送货到仓库</c:when>
										<c:when test="${commodity.status =='packing'}">打包</c:when>
										<c:when test="${commodity.status =='paid'}">已付</c:when>
										<c:when test="${commodity.status =='apiProcessing'}">API处理</c:when>
										<c:when test="${commodity.status =='delete'}">删除</c:when>
										<c:when test="${commodity.status =='waitingForTracking'}">等待的追踪</c:when>
									</c:choose>
								</td>
								<td>${commodity.orderNumber.packAge.packageCode }</td>
								<td>${commodity.purchase.accomplishNum }</td>
								<td>${commodity.storeOperator.userName }</td>
								<td><button class="btn btn-default" data-toggle="modal" data-target="#detailModal" onclick="updateShopOrder(${commodity.commodityID});">修改</button>&nbsp;&nbsp;
									<button class="btn btn-default" id="del" onclick="deleteShopOrder(${commodity.commodityID});">删除</button></td>
<!-- 									<button class="btn btn-default" onclick="#" id="del">删除</button> -->
							</tr>
							<tr>
								<td rowspan="5" height="140px;" width="140px;"><c:if
										test="${commodity.imagePaths[0].path !=null}">
										<img height="140px;" width="140px;"
											src="..${commodity.imagePaths[0].path}">
									</c:if></td>
								<td colspan="16">颜色：&nbsp;${commodity.color }&nbsp;&nbsp;&nbsp;&nbsp;尺码：&nbsp;${commodity.size }</td>
							</tr>
							<tr>
								<td colspan="16">操作员：&nbsp;${commodity.storeOperator.userName }</td>
							</tr>
							<tr>
								<td colspan="16">采购：&nbsp;${commodity.purchase.userName }</td>
							</tr>
							<tr>
								<td colspan="16">重量：&nbsp;${commodity.weight }</td>
							</tr>	
							<tr>
								<td colspan="16">评论：&nbsp;${commodity.comment  }</td>
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

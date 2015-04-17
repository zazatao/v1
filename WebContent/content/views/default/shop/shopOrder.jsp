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
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
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

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>
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
							<input type="text" name="orderID" placeholder="订单编号"
								class="form-control" id="orderID"
								onblur="checkvalue(this);">
						</div>
						<div class="col-sm-1">
							<input type="text" name="shopName" placeholder="店家名称"
								class="form-control" id="shopName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderUser" placeholder="买方"
								class="form-control" id="orderUser">
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
							<input type="text" name="tpek" placeholder="二维码"
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
				<table id="yourTableID" class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>订单号</th>
							<th>买方</th>
							<th>下单时间</th>
							<th>付款时间</th>
							<th>收件人</th>
							<th>电话</th>
							<th>邮件</th>
							<th>接收地址</th>
							<th>转交地址</th>
							<th>交付方式</th>
							<th>运输费</th>
							<th>最后状态改变日期</th>
							<th>订单状态</th>
							<th></th>
						</tr>
					</thead>
					<c:forEach var="orderform" items="${list }" varStatus="vs">
						<tbody>
							<tr class="success">
								<td align="center">${orderform.orderFormID }</td>
								<td>${orderform.orderUser.userName }</td>
								<td>${orderform.orderDate }<br>${orderform.orderTime }</td>
								<td>${orderform.paymentDate }<br>${orderform.paymentTime }</td>
								<td>${orderform.address.toName }</td>
								<td>${orderform.address.phone }</td>
								<td>${orderform.address.toEmail }</td>
								<td><font style="color: blue;">${orderform.address.country }${orderform.address.provience }${orderform.address.city }${orderform.address.district }${orderform.address.street }${orderform.address.orther }</font></td>
								<td>${orderform.address.handedAddress }</td>
								<td  align="center"><c:if test="${orderform.delivery == 'EMS'}">Ems</c:if></td>
								<td>${orderform.deliveryMoney }</td>
								<td>${orderform.changeStatusDate }</td>
								<td><font style="color: red;"><c:choose>
										<c:when test="${orderform.orderstatus =='waitAcceptance'}">等待验收</c:when>
										<c:when test="${orderform.orderstatus =='waitPayment'}">等待支付</c:when>
										<c:when test="${orderform.orderstatus =='inForwarding'}">在线转发</c:when>
										<c:when test="${orderform.orderstatus =='waitDelivery'}">等待发货</c:when>
										<c:when test="${orderform.orderstatus =='transitGoods'}">在途货物</c:when>
										<c:when test="${orderform.orderstatus =='consigneeSigning'}">收货人签单</c:when>
										<c:when test="${orderform.orderstatus =='completionTransaction'}">完成交易</c:when>
										<c:when test="${orderform.orderstatus =='closeTransaction'}">关闭交易</c:when>
										<c:when
											test="${orderform.orderstatus =='autoCloseTransaction'}">自动关闭交易</c:when>
									</c:choose></font></td>
								<td><button class="btn btn-default" data-toggle="modal"
										data-target="#detailModal"
										onclick="updateShopOrder(${orderform.orderFormID});">修改</button>&nbsp;&nbsp;
									<button class="btn btn-default" id="del"
										onclick="deleteShopOrder(${orderform.orderFormID});">删除</button></td>
							</tr>
							<c:forEach items="${orderform.commodities }" var="commodity" >
								<c:set var="commSpecs" value="${commodity.commSpec }"></c:set>
								<c:set var="commSpec" value="${fn:split(commSpecs,',') }"></c:set>
								<tr>
									<c:forEach var="spec" items="${commSpec }">
										<c:if test="${fn:contains(spec,'颜色')}">
											<td rowspan="5" height="140px;" width="140px;">
												 <img height="140px;" width="140px;" src="..${fn:substring(spec,fn:indexOf(spec,'$')+1,fn:length(spec))}">
											</td>
											<c:set value="${fn:substring(spec,0,fn:indexOf(spec,'$'))}" var="ys"></c:set>
											<c:set value="${spec }" var="orther"></c:set>
										</c:if>
									</c:forEach>
										<td colspan="3">商品：<font style="color: blue;">${commodity.nameOfGoods }</font></td>
										<td colspan="3">卖家：<font style="color:red;">${commodity.seller.shopName }</font></td>
										<c:set var="ortherSpec" value="${fn:replace(commSpecs,orther,'')}"></c:set>
										<td colspan="7">规格：${ys}&nbsp;${fn:replace(ortherSpec,',','&nbsp;')}</td>
								</tr>
								<tr>
									<td colspan="2">单价：&nbsp;${commodity.price }</td>
									<td colspan="2">数量：&nbsp;${commodity.quantity }</td>
									<td colspan="2">金额：&nbsp;${commodity.money }</td>
									<td >重量：&nbsp;${commodity.weight }</td>
									<td colspan="6">目前货品状态：&nbsp;
									<font color="red">
										<c:choose>
												<c:when test="${commodity.status =='unchanged'}">没有变化</c:when>
												<c:when test="${commodity.status =='cancel'}">取消交易</c:when>
												<c:when test="${commodity.status =='delete'}">删除</c:when>
												<c:when test="${commodity.status =='senToWarehouse'}">送往库房</c:when>
												<c:when test="${commodity.status =='refuse'}">拒绝入库</c:when>
												<c:when test="${commodity.status =='lose'}">丢失</c:when>
												<c:when test="${commodity.status =='inWarehouse'}">在库房中</c:when>
												<c:when test="${commodity.status =='marriage'}">交易中</c:when>
												<c:when test="${commodity.status =='lack'}">缺少货品</c:when>
												<c:when test="${commodity.status =='inAuctionlose'}">已下单需付款</c:when>
												<c:when test="${commodity.status =='delivery'}">交付</c:when>
												<c:when test="${commodity.status =='support'}">支持</c:when>
												<c:when test="${commodity.status =='sendOut'}">派送</c:when>
												<c:when test="${commodity.status =='buyerNotPay'}">买方没有支付</c:when>
												<c:when test="${commodity.status =='inCell'}">在格子</c:when>
												<c:when test="${commodity.status =='manualProcessing'}">手工加工</c:when>
												<c:when test="${commodity.status =='inForwarding'}">转发中</c:when>
												<c:when test="${commodity.status =='packing'}">打包</c:when>
												<c:when test="${commodity.status =='paid'}">已付</c:when>
												<c:when test="${commodity.status =='apiProcessing'}">API处理</c:when>
												<c:when test="${commodity.status =='waitingForTracking'}">等待的追踪</c:when>
											</c:choose>
										</font>
									</td>
								</tr>
								<tr>
									<td colspan="6">采购员：&nbsp;${commodity.purchase.userName }</td>
									<td colspan="7">操作员：&nbsp;${commodity.storeOperator.userName }</td>
								</tr>
								<tr>
									<td  rowspan="2" colspan="13">评论：&nbsp;</td>
								</tr>
								<tr>
								</tr>
							</c:forEach>
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

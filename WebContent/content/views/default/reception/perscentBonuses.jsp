<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<jsp:include page="userTop.jsp"></jsp:include>
		<!---------------   详细   ------------->
		<div class="orders">
			<p>我的订单</p>
			<div class="ordmain">
				<div>
					<div class="orderssel">
						<ul>
							<li>重量</li>
							<li class="ordersselon">在线查询</li>
							<li><a href="#" onclick="onOrderStatus('wanjie');">完成</a></li>
							<li>未兑换</li>
							<li><a href="#" onclick="onOrderStatus('weiwanjie');">进行中</a></li>
							<li>等待评价</li>
						</ul>
					</div>
					<div class="ordersclics">
						<form action="perscentBonuses" method="get" id="formSearch">
							<span>按日期筛选</span> <span> <select name="orderDate"
								onchange="searchParam();" id="orderDate">
									<option value="volvo"
										<c:if test="${orderDate == 'volvo' }">selected</c:if>>最近五天</option>
									<option value="saab"
										<c:if test="${orderDate == 'saab' }">selected</c:if>>最近一个月</option>
									<option value="fiat"
										<c:if test="${orderDate == 'fiat' }">selected</c:if>>最近三个月</option>
									<option value="-1"
										<c:if test="${orderDate == '-1' }">selected</c:if>>全部时间</option>
							</select>
							</span> <span> <select name="orderStatus"
								onchange="searchParam();" id="orderStatus">
									<option value="-1"
										<c:if test="${orderStatus == '-1' }">selected</c:if>>全部状态</option>
									<option value="wanjie"
										<c:if test="${orderStatus == 'wanjie' }">selected</c:if>>已完结</option>
									<option value="weiwanjie"
										<c:if test="${orderStatus == 'weiwanjie' }">selected</c:if>>未完结</option>
							</select>
							</span>
						</form>
					</div>
				</div>
				<script type="text/javascript">
					function searchParam(){
						var orderDate = $("#orderDate").find("option:selected").val();
						var orderStatus = $("#orderStatus").find("option:selected").val();
						location.href = "perscentBonuses?orderDate="+orderDate+"&orderStatus="+orderStatus;
					}
					function onOrderStatus(value){
						location.href = "perscentBonuses?orderDate=&orderStatus="+value;
					}
				</script>
				<div class="orderstil">
					<ul class="ordersall">
						<li class="ordersli1">订单号码</li>
						<li class="ordersli2">出发日期</li>
						<li class="ordersli4">卖家</li>
						<li class="ordersli3">数量</li>
						<li class="ordersli5">单价</li>
						<li class="ordersli6">价格</li>
						<li class="ordersli7">目前状态</li>
					</ul>
				</div>
				<div class="orderscont">
					<c:forEach items="${orderForms }" var="orderForm">
						<div class="ordcontil">
							<p>${orderForm.orderFormID }</p>
							<div class="octd">
								<span class="octdw" style="margin-left: 362px;">运费：${orderForm.deliveryMoney }</span>
							</div>
						</div>
						<div class="ordconpic">
							<c:forEach items="${orderForm.commodities }" var="commodity">
								<ul class="ordersall">
									<li class="ordersli1"><div class="midl">
											<img src="..${commodity.imagePaths[0].path }" /><br />${commodity.nameOfGoods }
										</div></li>
									<li class="ordersli2"><div class="midl">
											${orderForm.orderDate }<br /> ${orderForm.orderTime }
										</div></li>
									<li class="ordersli3"><div class="midl">${commodity.seller.shopName }</div></li>
									<li class="ordersli4"><div class="midl">
											<span class="octdw">${commodity.quantity }</span>
										</div></li>
									<li class="ordersli5"><div class="midl">${commodity.price }</div></li>
									<li class="ordersli6"><div class="midl">${commodity.money }</div></li>
									<li class="ordersli7"><div class="midl">
											<c:choose>
												<c:when test="${commodity.status == 'unchanged'}">没有变化</c:when>
												<c:when test="${commodity.status =='cancel'}">取消交易</c:when>
												<c:when test="${commodity.status =='delete'}">删除</c:when>
												<c:when test="${commodity.status =='senToWarehouse'}">送往库房</c:when>
												<c:when test="${commodity.status =='refuse'}">拒绝入库</c:when>
												<c:when test="${commodity.status =='lose'}">丢失</c:when>
												<c:when test="${commodity.status =='inWarehouse'}">在库房中</c:when>
												<c:when test="${commodity.status =='marriage'}">交易中</c:when>
												<c:when test="${commodity.status =='lack'}">缺少货品</c:when>
												<c:when test="${commodity.status =='inAuctionlose'}">下单</c:when>
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
										</div></li>
								</ul>
							</c:forEach>
						</div>
					</c:forEach>
				</div>
				<div class="cl"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

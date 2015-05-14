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
							<li><a href="#" onclick="shopAssess();">等待评价</a></li>
						</ul>
					</div>
				</div>
				<script type="text/javascript">
					function searchParam() {
						var orderDate = $("#orderDate").find("option:selected")
								.val();
						var orderStatus = $("#orderStatus").find(
								"option:selected").val();
						location.href = "perscentBonuses?orderDate="
								+ orderDate + "&orderStatus=" + orderStatus;
					}
					function onOrderStatus(value) {
						location.href = "perscentBonuses?orderDate=&orderStatus="
								+ value;
					}
					function shopAssess(){
						location.href="/proscenium/shopAssess";
					}
					function popupwindow(url) {
						var title = "";
						 var w = 700;
						var h = 800;	
						var title = "";
						var left = (screen.width / 2) - (w / 2);
						var top = (screen.height / 2) - (h / 2); 
						window.opener = null;
						window.open('', '_self');
						window.close();
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
												+ ', left=' + left 
									  );
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
						<li class="ordersli7">操作</li>
					</ul>
				</div>
				<div class="ordconpic">
					<c:forEach items="${list }"  var="commodity">
						<ul class="ordersall">
							<li class="ordersli1"><div class="midl">
									<img src="..${commodity.imagePaths[0].path }" /><br />${commodity.nameOfGoods }
								</div></li>
							<li class="ordersli2"><div class="midl">
									${commodity.orderNumber.orderDate}<br /> ${commodity.orderNumber.orderTime }
								</div></li>
							<li class="ordersli3"><div class="midl">${commodity.seller.shopName }</div></li>
							<li class="ordersli4"><div class="midl">
									<span class="octdw">${commodity.quantity }</span>
								</div></li>
							<li class="ordersli5"><div class="midl">${commodity.price }</div></li>
							<li class="ordersli6"><div class="midl">${commodity.money }</div></li>
							<li class="ordersli7"><div class="midl"><input type="button" value="评价" name="assess" onclick="popupwindow('/proscenium/userAssess?id=${commodity.transNumForTaobao}')"/></div></li>
						</ul>
					</c:forEach>
				</div>
				<div class="cl"></div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
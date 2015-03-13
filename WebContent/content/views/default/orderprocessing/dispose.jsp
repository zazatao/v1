<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单处理</title>
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
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">订单处理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">处理</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal" action="./searchWeighing"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="transNumForTaobao" placeholder="淘宝ID"
								class="form-control" id="transNumForTaobao"
								onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="seller" placeholder="卖家"
								class="form-control" id="seller">
						</div>
						<div class="col-sm-1">
							<input type="text" name="sellerDate" placeholder="卖家付款"
								class="form-control" id="sellerDate"
								onclick="dateInfoxxx('sellerDate')">
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="disposeStatus"
								id="disposeStatus" placeholder="状态">
								<option value="">-----状态-----
								<option value="process">正在处理
								<option value="shortage">商品现货不足
								<option value="commodityAds">产品广告
								<option value="waiting">等候
								<option value="manualProcessing">手动处理
							</select>
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">订单</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>编号</th>
								<th>淘宝ID</th>
								<th>卖家</th>
								<th>卖家付款</th>
								<th>状态</th>
							</tr>
							<c:forEach var="commodity" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td><a href="./orderItem?id=${commodity.commodityID}"
									onclick="orderItem(${commodity.commodityID});">${commodity.commodityID }</a></td>
								<td>${commodity.transNumForTaobao }</td>
								<td>${commodity.seller}</td>
								<td>${commodity.sellerDate}</td>
								<td><c:if test="${commodity.disposeStatus == 'process' }">正在处理</c:if>
									<c:if test="${commodity.disposeStatus == 'shortage' }">商品现货不足</c:if>
									<c:if test="${commodity.disposeStatus == 'commodityAds' }">产品广告</c:if>
									<c:if test="${commodity.disposeStatus == 'waiting' }">等候</c:if>
									<c:if test="${commodity.disposeStatus == 'manualProcessing' }">手动处理</c:if>
								</td>
								</tr>
							</c:forEach>
						</table>
						</p>
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
			function packNum(num){
					location.href ='./getOrder?page=weighing&id='+num;
			}
			</script>

			<!-- rightmain -->
			<div class="col-md-8 column" style="height: 100%">
				<!-- 
				<div class="panel panel-default">
				 -->
				<div class="container row">
					<div class="panel-heading">
						<h3 class="panel-title">订单/卖家</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<div class="list-group-item" style="">
										<p class="list-group-item-text">
										<form class="form-horizontal" action="" method="POST">
											<!-- 表格 -->
											<table class="table table-hover table-striped">
												<tr>
													<th>淘宝ID: <label>${dispose.transNumForTaobao }</label>
													</th>
													<th>卖家付款: <label>${dispose.sellerDate}</label>
													</th>
													<th>卖家: <label>${dispose.seller }</label>
													</th>
													<th></th>
												</tr>
												<tr>
													<th>产品名称: ${dispose.nameOfGoods }</th>
													<th>付款: ${dispose.money }</th>
													<th></th>
													<th></th>
												</tr>
												<tr>
													<th>选项:</th>
													<th></th>
													<th></th>
													<th></th>
												</tr>
												<tr>
													<th>数量: <label>${dispose.quantity}</label>
													</th>
													<th>价格: <label>${dispose.price}</label>
													</th>
													<th>金额: <label>${dispose.money}</label>
													</th>
													<th>付款: <label>1212</label>
													</th>
												</tr>
												<tr>
													<th>改变状态: <input type="radio" name="dispose" value="">手动处理
														<input type="radio" name="dispose" value="">处理中 <input
														type="radio" name="dispose" value="">剩余商品
													</th>
													<th>剩余商品: <input type="text"
														value="${dispose.quantity}">
													</th>
													<th></th>
													<th></th>
												</tr>
												<tr>
													<th>追踪号: <input type="text" value="${dispose.tpek}">
													</th>
													<th>&nbsp&nbsp&nbsp交易码: <input type="text"
														value="${dispose.tradingCode}">
													</th>
													<th>
														<button type="button" class="btn btn-primary">处理</button>
													</th>
													<th></th>
												</tr>
											</table>
											<!-- /表格 -->

											<div>
												<img src="../content/static/img/favicon.jpeg"
													alt="Responsive image" class="img-thumbnail img-responsive">
											</div>
											</p>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<div class="tabbable" id="tabs-294834">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#panel-700079"
												data-toggle="tab">与买家联系</a></li>
											<li><a href="#panel-520562" data-toggle="tab">内部</a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="panel-700079">
												<!-- 
												<div class="panel-heading">
													<h3 class="panel-title">
														<span class="badge navbar-right">订单号：<input
															type="text">
															<button onclick="">查询</button>
														</span>
													</h3>
												</div>
												 -->
												<br>
												<div class="list-group-item">
													<p class="list-group-item-text">
													<table class="table table-hover table-striped">
														<tr class="">
															<!-- 
															<th>日期</th>
															<th>订单号</th>
															<th>数量</th>
															<th>货号(淘宝ID)</th>
															<th>操作</th>
															<th>快捷</th>
															<th>实现</th>
															 -->
															<th>内容</th>
															<th>日期</th>
														</tr>
														<c:forEach var="orderForm" items="${packs.orderForms }">
															<c:set var="order" value="${orderForm }"></c:set>
															<c:forEach var="comm" items="${orderForm.commodities }"
																varStatus="loop">
																<c:choose>
																	<c:when test="${loop.index%2==0 }">
																		<tr>
																	</c:when>
																	<c:otherwise>
																		<tr class="success">
																	</c:otherwise>
																</c:choose>
																<td>${order.orderDate }</td>
																<td>${order.orderFormID }</td>
																<td>${comm.quantity}</td>
																<td>${comm.commItem}</td>
																<td></td>
																<td></td>
																<td></td>
																</tr>
															</c:forEach>
														</c:forEach>
													</table>
													</p>
												</div>
											</div>
											<div class="tab-pane" id="panel-520562">
												<!-- 
												<div class="panel-heading">
													<h3 class="panel-title">
														<span class="badge navbar-right">订单号：<input
															type="text">
															<button onclick="">查询</button>
														</span>
													</h3>
												</div>
												 -->
												<br>
												<div class="list-group-item">
													<p class="list-group-item-text">
													<table class="table table-hover table-striped">
														<tr class="">
															<!-- 
															<th>订单号</th>
															<th>格子</th>
															<th>货号(淘宝ID)</th>
															<th>卖方追踪</th>
															<th>数量</th>
															<th>重量</th>
															<th>名称</th>
															<th>便利</th>
															<th>状态</th>
															 -->
															<th>内容</th>
															<th>日期</th>
														</tr>
														<c:forEach var="orderF" items="${packs.orderForms }">
															<c:set var="orders" value="${orderF }"></c:set>
															<c:forEach var="commo" items="${orderF.commodities }"
																varStatus="loop">
																<c:choose>
																	<c:when test="${loop.index%2==0 }">
																		<tr>
																	</c:when>
																	<c:otherwise>
																		<tr class="success">
																	</c:otherwise>
																</c:choose>
																<td>${orders.orderFormID }</td>
																<td>${commo.storeRoom.cellStr }</td>
																<td>${commo.transNumForTaobao }</td>
																<td>${commo.tpek }</td>
																<td>${commo.quantity }</td>
																<td>${commo.weight }</td>
																<td>${commo.nameOfGoods }</td>
																<td></td>
																<td></td>
																</tr>
															</c:forEach>
														</c:forEach>
													</table>
													</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /rightmain -->
		</div>
	</div>
	</ul>
	<script type="text/javascript">
	function checkvalue(obj) {
		if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
			alert('你输入的不是数字，或关闭输入法后再输入');
			obj.select();
		}
	}
		// Popup window code
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

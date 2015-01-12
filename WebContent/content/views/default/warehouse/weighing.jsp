<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>称量</title>
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
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">仓库</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">称量</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal"
					action="./searchWeighing?page=weighing" method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹编号"
								class="form-control" id="packageCode" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="formDelivery"
								id="formDelivery">
								<option value="">-------------交货方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="买方"
								class="form-control" id="userName">
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
						<h3 class="panel-title">包裹</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>包裹编号</th>
								<th>交货方式</th>
								<th>买主</th>
								<th>总重量</th>
							</tr>
							<c:forEach var="pack" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td><a href="#" onclick="packNum(${pack.packageID});">${pack.packageCode }</a></td>
								<td>${pack.delivery }</td>
								<td>${pack.orderForms[0].orderUser.userName}</td>
								<td>${pack.totalWeight}</td>
								</tr>
							</c:forEach>
						</table>
						</p>
					</div>
				</div>
			</div>
			<script type="text/javascript">
				function packNum(num){
						location.href ='./getOrder?page=weighing&id='+num;
				}
			</script>
			<div class="col-md-8 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">称量包裹</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<form class="form-horizontal" action="./addHospital"
										method="POST">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">总重量</label>
											<div class="col-sm-3">
												<input type="text" name="totalWeight" class="form-control"
													id="totalWeight" value="${packs.totalWeight }">
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">毛重量</label>
											<div class="col-sm-3">
												<input type="text" name="grossWeight" class="form-control"
													id="grossWeight" value="${packs.grossWeight }"> <span
													class="badge navbar-right"><font
													style="font-size: 15px;">-</font></span>&nbsp;&nbsp;<span
													class="badge navbar-right"><font
													style="font-size: 16px;">+</font></span>
											</div>
										</div>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-1 control-label">尺寸</label>
											<div class="col-sm-2">
												<select class="form-control">
													<option value="600x500x400">600&nbsp;x&nbsp;500&nbsp;x&nbsp;400



													
													<option value="530x290x370">530&nbsp;x&nbsp;290&nbsp;x&nbsp;370





													
													<option value="530x230x290">530&nbsp;x&nbsp;230&nbsp;x&nbsp;290





													
													<option value="430x210x270">430&nbsp;x&nbsp;210&nbsp;x&nbsp;270





													
													<option value="350x190x230">350&nbsp;x&nbsp;190&nbsp;x&nbsp;230






													
													<option value="290x170x190">290&nbsp;x&nbsp;170&nbsp;x&nbsp;190







													
													<option value="260x150x180">260&nbsp;x&nbsp;150&nbsp;x&nbsp;180











													
													<option value="230x130x160">230&nbsp;x&nbsp;130&nbsp;x&nbsp;160











													
													<option value="210x110x140">210&nbsp;x&nbsp;110&nbsp;x&nbsp;140











													
													<option value="195x105x135">195&nbsp;x&nbsp;105&nbsp;x1&nbsp;35



													
													<option value="other">其它
												</select>
											</div>
											<div class="col-sm-1">
												<input type="text" name="hospitalDesignation"
													class="form-control" id="inputEmail3"
													value="${hospital.hospitalDesignation }">
											</div>
											<div class="col-sm-1">

												<input type="text" name="hospitalDesignation"
													class="form-control" id="inputEmail3"
													value="${hospital.hospitalDesignation }">
											</div>
											<div class="col-sm-1">
												<input type="text" name="hospitalDesignation"
													class="form-control" id="inputEmail3"
													value="${hospital.hospitalDesignation }">
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-8 control-label"
												style="text-align: right;">清除多余的包装</label>
											<div class="col-sm-1">
												<input type="checkbox" name="hospitalDesignation"
													class="btn checkbox" id="inputEmail3"
													value="${hospital.hospitalDesignation }">
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">打印发票</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">&nbsp;&nbsp;&nbsp;条&nbsp;&nbsp;码&nbsp;&nbsp;&nbsp;</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">称量包裹</button>
											</div>
										</div>
									</form>
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
												data-toggle="tab">操作</a></li>
											<li><a href="#panel-520562" data-toggle="tab">订单</a></li>
										</ul>
										<div class="tab-content">
											<div class="tab-pane active" id="panel-700079">
												<div class="panel-heading">
													<h3 class="panel-title">
														<span class="badge navbar-right">订单号：<input
															type="text">
															<button onclick="">查询</button>
														</span>
													</h3>
												</div>
												<br>
												<div class="list-group-item">
													<p class="list-group-item-text">
													<table class="table table-striped">
														<tr class="">
															<th>日期</th>
															<th>订单号</th>
															<th>数量</th>
															<th>货号(淘宝ID)</th>
															<th>操作</th>
															<th>快捷</th>
															<th>实现</th>
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
												<div class="panel-heading">
													<h3 class="panel-title">
														<span class="badge navbar-right">订单号：<input
															type="text">
															<button onclick="">查询</button>
														</span>
													</h3>
												</div>
												<br>
												<div class="list-group-item">
													<p class="list-group-item-text">
													<table class="table table-striped">
														<tr class="">
															<th>订单号</th>
															<th>格子</th>
															<th>货号(淘宝ID)</th>
															<th>卖方追踪</th>
															<th>数量</th>
															<th>重量</th>
															<th>名称</th>
															<th>便利</th>
															<th>状态</th>
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

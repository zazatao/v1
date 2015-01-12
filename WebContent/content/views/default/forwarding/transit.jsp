<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中转</title>

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
					<li><a href="#" style="font-size: 18px;">中转</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">中转</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="form-group">
					<div class="col-sm-1">
						<select class="form-control" name="formDelivery" id="formDelivery">
							<option value="">中转地
							<option value="beijing">北京
						</select>
					</div>
					<div class="col-sm-1">
						<input type="submit" value="收货" class="btn btn-default">&nbsp;&nbsp;&nbsp;
						<input type="submit" value="发送" class="btn btn-default">
					</div>
				</div>
			</div>
			<div class="col-md-6 column">
				<br>
				<form class="form-horizontal" action="./searchTransit" method="POST">
					<div class="form-group">
						<div class="col-sm-2">
							<input type="text" name="packageCode" class="form-control"
								id="packageCode" value="" placeholder="包裹编号"  onblur="checkvalue(this)">
						</div>
						<div class="col-sm-4">
							<select class="form-control" name="formDelivery"
								id="formDelivery">
								<option value="">-------------运输方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-4">
							<select class="form-control" name="formStatus" id="formStatus">
								<option value="">-------------状态-------------
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
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default">查询</button>
						</div>
					</div>
				</form>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">包裹</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr class="">
									<th>型号</th>
									<th>总重量</th>
									<th>包裹</th>
									<th>运输方式</th>
									<th>状态</th>
									<th>发送</th>
								</tr>
							</thead>
							<c:forEach var="pack" items="${list }" varStatus="loop">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td>${pack.packageSize.size }</td>
								<td>${pack.totalWeight}</td>
								<td><a href="#" onclick="packNum(${pack.packageID});">${pack.packageCode }</a></td>
								<td>${pack.delivery }</td>
								<td><c:choose>
										<c:when test="${pack.status =='unchanged'}">没有变化</c:when>
										<c:when test="${pack.status =='cancel'}">取消交易</c:when>
										<c:when test="${pack.status =='delete'}">删除</c:when>
										<c:when test="${pack.status =='senToWarehouse'}">送往库房</c:when>
										<c:when test="${pack.status =='refuse'}">拒绝入库</c:when>
										<c:when test="${pack.status =='lose'}">丢失</c:when>
										<c:when test="${pack.status =='inWarehouse'}">在库房中</c:when>
										<c:when test="${pack.status =='marriage'}">交易中</c:when>
										<c:when test="${pack.status =='lack'}">缺少货品</c:when>
										<c:when test="${pack.status =='inAuctionlose'}">下单</c:when>
										<c:when test="${pack.status =='delivery'}">交付</c:when>
										<c:when test="${pack.status =='support'}">支持</c:when>
										<c:when test="${pack.status =='sendOut'}">派送</c:when>
										<c:when test="${pack.status =='buyerNotPay'}">买方没有支付</c:when>
										<c:when test="${pack.status =='inCell'}">在格子</c:when>
										<c:when test="${pack.status =='manualProcessing'}">手工加工</c:when>
										<c:when test="${pack.status =='inForwarding'}">转发中</c:when>
										<c:when test="${pack.status =='packing'}">打包</c:when>
										<c:when test="${pack.status =='paid'}">已付</c:when>
										<c:when test="${pack.status =='apiProcessing'}">API处理</c:when>
										<c:when test="${pack.status =='waitingForTracking'}">等待的追踪</c:when>
									</c:choose></td>
								<td></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			function packNum(num){
				location.href ='./getOrder?id='+num;
			}
			function checkvalue(obj) {
				if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
					alert('你输入的不是数字，或关闭输入法后再输入');
					obj.select();
				}
			}
			</script>
			<div class="col-md-6 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">中转包裹</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<form class="form-horizontal" action="./addHospital"
										method="POST">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">地址：</label>
											<label for="inputEmail3" class="col-sm-8 control-label"></label>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">编号：</label>
											<div class="col-sm-3">
												<input type="text" name="grossWeight" class="form-control"
													id="grossWeight" value="">
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">总运费：</label>
											<div class="col-sm-3">
												<input type="text" name="grossWeight" class="form-control"
													id="grossWeight" value="">
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-8 control-label"></label>
											<div class="col-sm-2">
												<button type="button" class="btn btn-default">？？？？</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">发送包裹</button>
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
									<div id="tabs-294834" class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab"
												href="#panel-700079">订单</a></li>
											<li><a data-toggle="tab" href="#panel-520562">内部聊天</a></li>
											<li><a data-toggle="tab" href="#panel-520522">联系买家</a></li>
										</ul>
										<div class="tab-content">
											<div id="panel-700079" class="tab-pane active">

												<div class="list-group-item">
													<p class="list-group-item-text"></p>
													<table class="table table-striped">
														<tbody>
															<tr class="">
																<th>订单编号</th>
																<th>单元格</th>
																<th>货号</th>
																<th>卖家</th>
																<th>数量</th>
																<th>名称</th>
																<th>订单状态</th>
															</tr>
															<c:forEach var="order" items="${orders }"
																varStatus="loop">
																<c:choose>
																	<c:when test="${loop.index%2==0 }">
																		<tr class="success">
																	</c:when>
																	<c:otherwise>
																		<tr>
																	</c:otherwise>
																</c:choose>
																<td>${order.orderFormID }</td>
																<td></td>
																<td>${order.packAge.packageCode }</td>
																<td>${order.orderUser.userName }</td>
																<td>${fn:length(order.commodities )}</td>
																<td>${order.commodities[0].nameOfGoods }</td>
																<td><c:choose>
																		<c:when test="${order.packAge.status =='unchanged'}">没有变化</c:when>
																		<c:when test="${order.packAge.status =='cancel'}">取消交易</c:when>
																		<c:when test="${order.packAge.status =='delete'}">删除</c:when>
																		<c:when test="${order.packAge.status =='senToWarehouse'}">送往库房</c:when>
																		<c:when test="${order.packAge.status =='refuse'}">拒绝入库</c:when>
																		<c:when test="${order.packAge.status =='lose'}">丢失</c:when>
																		<c:when test="${order.packAge.status =='inWarehouse'}">在库房中</c:when>
																		<c:when test="${order.packAge.status =='marriage'}">交易中</c:when>
																		<c:when test="${order.packAge.status =='lack'}">缺少货品</c:when>
																		<c:when test="${order.packAge.status =='inAuctionlose'}">下单</c:when>
																		<c:when test="${order.packAge.status =='delivery'}">交付</c:when>
																		<c:when test="${order.packAge.status =='support'}">支持</c:when>
																		<c:when test="${order.packAge.status =='sendOut'}">派送</c:when>
																		<c:when test="${order.packAge.status =='buyerNotPay'}">买方没有支付</c:when>
																		<c:when test="${order.packAge.status =='inCell'}">在格子</c:when>
																		<c:when test="${order.packAge.status =='manualProcessing'}">手工加工</c:when>
																		<c:when test="${order.packAge.status =='inForwarding'}">转发中</c:when>
																		<c:when test="${order.packAge.status =='packing'}">打包</c:when>
																		<c:when test="${order.packAge.status =='paid'}">已付</c:when>
																		<c:when test="${order.packAge.status =='apiProcessing'}">API处理</c:when>
																		<c:when test="${order.packAge.status =='waitingForTracking'}">等待的追踪</c:when>
																	</c:choose></td>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
											<div id="panel-520562" class="tab-pane">
												<div class="list-group-item">
													<p class="list-group-item-text"></p>
													<table class="table table-striped">
														<tbody>
															<tr class="">
																<th class="col-sm-8 ">正文</th>
																<th class="col-sm-4 ">日期</th>
															</tr>

														</tbody>
													</table>
													<p></p>
												</div>
											</div>

											<div id="panel-520522" class="tab-pane">

												<div class="list-group-item">
													<p class="list-group-item-text"></p>
													<table class="table table-striped">
														<tbody>
															<tr class="">
																<th class="col-sm-8 ">正文</th>
																<th class="col-sm-4 ">日期</th>
															</tr>
														</tbody>
													</table>
													<p></p>
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
</body>
</html>
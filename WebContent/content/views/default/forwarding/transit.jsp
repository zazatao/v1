<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中转</title>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
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

<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
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

	<div class="col-md-6 column" style="height: 100%">
		<form class="form-horizontal" action="forwarding/searchTransit" method="POST">
			<div class="form-group">
				<div class="col-sm-2">
					<input type="text" name="tpekCargoGroup" class="form-control"
						id="tpekCargoGroup" value="" placeholder="包裹追踪号" >
				</div>
				<div class="col-sm-2">
					<input type="text" name="receiveDate" class="form-control"
						id="receiveDate" value="" placeholder="接收日起"
						 onclick="dateInfoxxx('receiveDate')" >
				</div>
				<div class="col-sm-4">
					<select class="form-control" name="formDelivery" id="formDelivery">
						<option value="">-------------物流方式-------------
						<option value="EMS">EMS
						<option value="sf">顺风
					</select>
				</div>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-default">查询</button>
				</div>
			</div>
		</form>
		<div class="list-group-item">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						包裹组<span class="badge navbar-right" id="yunfei"></span>
					</h3>
				</div>
				<div class="list-group-item">
					<p class="list-group-item-text">
					<table class="table table-striped">
						<tr class="">
							<th>编号</th>
							<th>总重量</th>
							<th>包裹追踪号</th>
							<th>中转地</th>
							<th>接收日期</th>
							<th>运输方式</th>
							<th>操作</th>
						</tr>
						<c:forEach var="cargoGroup" items="${list }" varStatus="loop">
							<c:choose>
								<c:when test="${loop.index%2==0 }">
									<tr>
								</c:when>
								<c:otherwise>
									<tr class="success">
								</c:otherwise>
							</c:choose>
							<td><a href="javascript:void(0);"
								onclick="packNum('${cargoGroup.cargoGroupID }');">${cargoGroup.cargoGroupID }</a></td>
							<td>${cargoGroup.totalWeight}</td>
							<td>${cargoGroup.tpekCargoGroup}</td>
							<td><c:if test="${cargoGroup.transit=='beijing' }">北京</c:if>
								<c:if test="${cargoGroup.transit=='wlmq' }">乌鲁木齐</c:if></td>
							<td>${cargoGroup.transitSte.receiveDate }</td>
							<td><c:if test="${cargoGroup.delivery == 'EMS'}">EMS</c:if>
							<c:if test="${cargoGroup.delivery == 'sf'}">顺风</c:if>
							</td>
							<td><button onclick="continuess('${cargoGroup.transitSte.transitSiteID}');">继续转发</button></td>
							</tr>
						</c:forEach>
					</table>
					</p>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">包裹</h3>
				</div>
				<div class="list-group-item">
					<p class="list-group-item-text">
					<table class="table table-striped">
						<tr class="">
							<th>包裹编号</th>
							<th>追踪号</th>
							<th>总重量</th>
							<th>运费</th>
							<th>订单数量</th>
							<th>发货方式</th>
							<th>状态</th>
						</tr>
						<c:set value="0" var="fee"></c:set>
						<c:forEach items="${cargoGroup.packAges }" var="pack">
							<c:if test="${pack.problemPack == null }">
								<tr class="warning">
									<td><a href="javascript:void(0);"
										onclick="packOrder('${cargoGroup.cargoGroupID}','${pack.packageID}');">${pack.packageCode }</a></td>
									<td>${pack.packAgeTpek}</td>
									<td>${pack.totalWeight}</td>
									<td>${pack.transportFee}</td>
									<c:set var="fee" value="${fee + pack.transportFee }"></c:set>
									<td>${fn:length(pack.orderForms)}</td>
									<td>${pack.delivery }</td>
									<td><c:if test="${pack.orderForms[0].commodities[0].status == 'inForwarding' }">等待派发</c:if>
									<c:if test="${pack.orderForms[0].commodities[0].status == 'sendOut' }">已经派发</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
						<c:forEach var="pack" items="${packAges }" varStatus="loop">
							<c:if test="${pack.problemPack == null }">
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<td><a href="javascript:void(0);"
									onclick="packOrder('${pack.cargoGroup.cargoGroupID}','${pack.packageID}');">${pack.packageCode }</a></td>
								<td>${pack.packAgeTpek}</td>
								<td>${pack.totalWeight}</td>
								<td>${pack.transportFee}</td>
								<c:set var="fee" value="${fee + pack.transportFee }"></c:set>
								<td>${fn:length(pack.orderForms)}</td>
								<td>${pack.delivery }</td>
								<td>
									<c:if test="${pack.orderForms[0].commodities[0].status == 'inForwarding' }">等待派发</c:if>
									<c:if test="${pack.orderForms[0].commodities[0].status == 'sendOut' }">已经派发</c:if>
								</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					</p>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<script type="text/javascript">
			function continuess(id){
				location.href ='forwarding/sendCargoGroup?transitID='+id;
			}
			function problem(id){
				location.href ='forwarding/problemPack?packID='+id;
			}
			function packOrder(cargoGroupID,packageID){
				location.href ='forwarding/packOrder?cargoGroupID='+cargoGroupID+'&packageID='+packageID;
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
			function packNum(num){
				location.href ='forwarding/getPackAge?id='+num;
			}
			function checkvalue(obj) {
				if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
					alert('你输入的不是数字，或关闭输入法后再输入');
					obj.select();
				}
			}
			function distributed(packid){
				location.href ='forwarding/distributedPackAge?id='+packid;
			}
			</script>
			<div class="col-md-6 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">分发包裹</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<form class="form-horizontal" action="./addHospital"
										method="POST">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">地址：</label>
											<label for="inputEmail3" class="col-sm-8 control-label">${pack.orderForms[0].address.country }
											${pack.orderForms[0].address.provience }${pack.orderForms[0].address.city }${pack.orderForms[0].address.district }
											${pack.orderForms[0].address.street }${pack.orderForms[0].address.orther }
											</label>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">收货人：</label>
											<div class="col-sm-3">
												<label class=" control-label">${pack.orderForms[0].address.toName }</label>
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">电话:</label>
											<div class="col-sm-3">
												<label class="col-sm-3 control-label">${pack.orderForms[0].address.phone }</label>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-8 control-label"></label>
											<div class="col-sm-2">
												<button type="button" class="btn btn-error" onclick="problem('${pack.packageID}');">问题包裹</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default" onclick="distributed('${pack.packageID}');">发送包裹</button>
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
												href="#panel-700079">订单货品</a></li>
											<li><a data-toggle="tab" href="#panel-520562">内部聊天</a></li>
											<li><a data-toggle="tab" href="#panel-520522">联系买家</a></li>
										</ul>
										<div class="tab-content">
											<div id="panel-700079" class="tab-pane active">

												<div class="list-group-item">
													<p class="list-group-item-text"></p>
													<table class="table table-striped">
														<tr class="">
															<th>订单号</th>
															<th>格子</th>
															<th>货物编码</th>
															<th>货品名称</th>
															<th>数量</th>
															<th>重量</th>
															<th>价值</th>
														</tr>
														<c:forEach var="orderF" items="${pack.orderForms }">
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
																<td>${orderF.orderFormID }</td>
																<td>${orderF.orderUser.storeRoom.cellStr }</td>
																<td>${commo.commodityID }</td>
																<td>${commo.nameOfGoods }</td>
																<td>${commo.quantity }</td>
																<td>${commo.weight }</td>
																<td>${commo.money }</td>
																</tr>
															</c:forEach>
														</c:forEach>
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

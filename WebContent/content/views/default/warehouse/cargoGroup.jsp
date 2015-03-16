<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>货物组</title>
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
	<div class="container-fluid"  style="padding:0;margin-top:32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">仓库</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">货物组</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="form-group">
					<div class="col-sm-2">
						<select class="form-control" id="transit">
							<option value="">-----------选择中转地-----------
							<option value="beijing">北京
						</select> <input type="hidden" name="transit" id="transitInput" value="">
					</div>
					<div class="col-sm-2">
						<select class="form-control" id="delivery">
							<option value="">-----------选择运输方式-----------
							<option value="EMS">EMS
						</select> <input type="hidden" name="delivery" id="deliveryInput" value="">
					</div>
					<div class="col-sm-2">
						<button class="btn btn-default" onclick="formSubmit();">查询&nbsp;&&nbsp;添加</button>
					</div>
				</div>
			</div>
			<br>
			<hr>
			<div class="col-md-5 column">
				<form class="form-horizontal" action="./searchCargoGroup"
					method="POST">
					<div class="form-group">
						<div class="col-sm-2">
							<input type="text" name="cargoGroupID" placeholder="包裹编号"
								class="form-control" id="cargoGroupID" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-2">
							<input type="text" name="sendDate" placeholder="发货日期"
								class="form-control" id="sendDate"
								onclick="dateInfoxxx('sendDate');">
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="formTransit" name="formTransit">
								<option value="">中转地
								<option value="beijing">北京
							</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" id="formDelivery"
								name="formDelivery">
								<option value="">运输
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="formStatus" id="formStatus">
								<option value="">状态
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
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">组货</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>编号</th>
								<th>包裹号</th>
								<th>总重量</th>
								<th>包裹</th>
								<th>中转地</th>
								<th>运输方式</th>
								<th>状态</th>
								<th>发货日期</th>
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
								<td><a href="#"
									onclick="packNum(${cargoGroup.cargoGroupID },${cargoGroup.totalWeight});">${cargoGroup.cargoGroupID }</a></td>
								<td>${cargoGroup.cargoGroupID}</td>
								<td>${cargoGroup.totalWeight}</td>
								<td></td>
								<td><c:if test="${cargoGroup.transit=='beijing' }">北京</c:if></td>
								<td>${cargoGroup.delivery }</td>
								<td>${cargoGroup.status }</td>
								<td>${cargoGroup.sendDate }</td>
								</tr>
							</c:forEach>
						</table>
						</p>
					</div>
				</div>

			</div>
			<script type="text/javascript">
				function checkvalue(obj) {
					if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
						alert('你输入的不是数字，或关闭输入法后再输入');
						obj.select();
					}
				}
				function packNum(num,totalWeight){
						location.href ='./getPackAge?weight='+totalWeight+'&id='+num;
				}
				function packOrder(groupID,num){
					var weight = $('#weight').text();
					location.href ='./getOrderByPackID?groupID='+groupID+'&id='+num+"&weight="+weight;
				}
				$(document).ready(function(){
					$('#transit').change(function(){
						$('#transitInput').val($(this).children('option:selected').val()); //弹出select的值
					});
					$('#delivery').change(function(){
						$('#deliveryInput').val($(this).children('option:selected').val());  //弹出select的值
					});
				})
				function formSubmit(){
					if (!$('#transitInput').val()=='' && !$('#deliveryInput').val()=='') {
						location.href = './getCargoGroup?transit='+$('#transitInput').val()+'&delivery='+$('#deliveryInput').val();
					}
				}
			</script>
			<div class="col-md-7 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">货物组</h3>
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
												<label name="tpek" class="control-label" id="weight"
													value="">${weight }</label>
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">包裹</label>
											<div class="col-sm-3">
												<label name="tpek" class="control-label" id="tpek" value="">0</label>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-1 control-label">运费</label>
											<div class="col-sm-3">
												<input type="text" name="grossWeight" class="form-control"
													id="grossWeight" value="${packs.grossWeight }"> <span
													class="badge navbar-right"><font
													style="font-size: 15px;">-</font></span>&nbsp;&nbsp;<span
													class="badge navbar-right"><font
													style="font-size: 16px;">+</font></span>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-8 control-label">&nbsp;</label>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">打印发票</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">计算价格</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">发送组货</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="list-group-item">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">包裹</h3>
							</div>
							<div class="list-group-item">
								<p class="list-group-item-text">
								<table class="table table-striped">
									<tr class="">
										<th>包裹编号</th>
										<th>总重量</th>
										<th>数量</th>
										<th>发货方式</th>
										<th></th>
									</tr>
									<c:forEach var="pack" items="${packAges }" varStatus="loop">
										<c:choose>
											<c:when test="${loop.index%2==0 }">
												<tr>
											</c:when>
											<c:otherwise>
												<tr class="success">
											</c:otherwise>
										</c:choose>
										<td><a href="#"
											onclick="packOrder(${id},${pack.packageID});">${pack.packageCode }</a></td>
										<td>${pack.totalWeight}</td>
										<td>${fn:length(pack.orderForms)}</td>
										<td>${pack.delivery }</td>
										<td></td>
										</tr>
									</c:forEach>
								</table>
								</p>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h3 class="panel-title">订单</h3>
							</div>
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
										<th>价值</th>
										<th>状态</th>
									</tr>
									<c:forEach var="orderF" items="${orders }">
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
											<td>${commo.money }</td>
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

<%@page import="java.io.IOException"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
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
	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
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
							<option value="wlmq">乌鲁木齐
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
							<select class="form-control" id="formTransit" name="formTransit">
								<option value="">中转地
								<option value="beijing">北京
								<option value="wlmq">乌鲁木齐
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
								<th>总重量</th>
								<th>包裹追踪号</th>
								<th>中转地</th>
								<th>运输方式</th>
								<th>状态</th>
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
								<td>${cargoGroup.totalWeight}</td>
								<td>${cargoGroup.tpekCargoGroup}</td>
								<td><c:if test="${cargoGroup.transit=='beijing' }">北京</c:if>
									<c:if test="${cargoGroup.transit=='wlmq' }">乌鲁木齐</c:if></td>
								<td>${cargoGroup.delivery }</td>
								<td><c:choose>
										<c:when test="${cargoGroup.status =='unchanged'}">没有变化</c:when>
										<c:when test="${cargoGroup.status =='cancel'}">取消交易</c:when>
										<c:when test="${cargoGroup.status =='delete'}">删除</c:when>
										<c:when test="${cargoGroup.status =='senToWarehouse'}">送往库房</c:when>
										<c:when test="${cargoGroup.status =='refuse'}">拒绝入库</c:when>
										<c:when test="${cargoGroup.status =='lose'}">丢失</c:when>
										<c:when test="${cargoGroup.status =='inWarehouse'}">在库房中</c:when>
										<c:when test="${cargoGroup.status =='marriage'}">交易中</c:when>
										<c:when test="${cargoGroup.status =='lack'}">缺少货品</c:when>
										<c:when test="${cargoGroup.status =='inAuctionlose'}">下单</c:when>
										<c:when test="${cargoGroup.status =='delivery'}">交付</c:when>
										<c:when test="${cargoGroup.status =='support'}">支持</c:when>
										<c:when test="${cargoGroup.status =='sendOut'}">派送</c:when>
										<c:when test="${cargoGroup.status =='buyerNotPay'}">买方没有支付</c:when>
										<c:when test="${cargoGroup.status =='inCell'}">在格子</c:when>
										<c:when test="${cargoGroup.status =='manualProcessing'}">手工加工</c:when>
										<c:when test="${cargoGroup.status =='inForwarding'}">转发中</c:when>
										<c:when test="${cargoGroup.status =='packing'}">打包</c:when>
										<c:when test="${cargoGroup.status =='paid'}">已付</c:when>
										<c:when test="${cargoGroup.status =='apiProcessing'}">API处理</c:when>
										<c:when test="${cargoGroup.status =='waitingForTracking'}">等待的追踪</c:when>
									</c:choose></td>
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
						location.href ='./getPackAge?id='+num;
				}
				function packOrder(groupID,num){
					location.href ='./getOrderByPackID?groupID='+groupID+'&id='+num;
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
									<form class="form-horizontal" action="./sendCargoGroup"
										method="POST">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">总重量</label>
											<div class="col-sm-3">
												<label name="tpek" class="control-label" id="weight"
													value="">${cargoGroup.totalWeight }</label>
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">包裹</label>
											<div class="col-sm-3">
												<label name="tpekCargoGroup" class="control-label"
													id="tpekCargoGroup" value="">${cargoGroup.tpekCargoGroup }</label>
													<input type="hidden" value="${cargoGroup.cargoGroupID }" name="cargoGroupID">
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">加减运费</label>
											<div class="col-sm-3">
												<input type="text" name="fee" class="form-control"
													id="fee" value="0" onblur="checkvalue(this);"> <span
													class="badge navbar-right" id="btn_prev" style="cursor: pointer;"><font
													style="font-size: 15px;">-</font></span>&nbsp;&nbsp;<span
													class="badge navbar-right"  id="btn_next" style="cursor: pointer;"><font
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
												<button type="button" class="btn btn-default"
													onclick="Calculator();">计算价格</button>
											</div>
											<div class="col-sm-1">
												<button type="submit" class="btn btn-default">发送组货</button>
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
								<h3 class="panel-title">包裹<span class="badge navbar-right" id="yunfei"></span></h3>
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
										<th></th>
									</tr>
									<c:set value="0" var="fee"></c:set>
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
											onclick="packOrder('${cargoGroup.cargoGroupID}','${pack.packageID}');">${pack.packageCode }</a></td>
										<td>${pack.packAgeTpek}</td>
										<td>${pack.totalWeight}</td>
										<td>${pack.transportFee}</td>
										<c:set var="fee" value="${fee + pack.transportFee }"></c:set>
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
										<th>货物编码</th>
										<th>货品名称</th>
										<th>数量</th>
										<th>重量</th>
										<th>价值</th>
										<th>状态</th>
									</tr>
									<c:forEach var="orderF" items="${orders }">
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
											<td><c:choose>
													<c:when test="${commo.status =='unchanged'}">没有变化</c:when>
													<c:when test="${commo.status =='cancel'}">取消交易</c:when>
													<c:when test="${commo.status =='delete'}">删除</c:when>
													<c:when test="${commo.status =='senToWarehouse'}">送往库房</c:when>
													<c:when test="${commo.status =='refuse'}">拒绝入库</c:when>
													<c:when test="${commo.status =='lose'}">丢失</c:when>
													<c:when test="${commo.status =='inWarehouse'}">在库房中</c:when>
													<c:when test="${commo.status =='marriage'}">交易中</c:when>
													<c:when test="${commo.status =='lack'}">缺少货品</c:when>
													<c:when test="${commo.status =='inAuctionlose'}">下单</c:when>
													<c:when test="${commo.status =='delivery'}">交付</c:when>
													<c:when test="${commo.status =='support'}">支持</c:when>
													<c:when test="${commo.status =='sendOut'}">派送</c:when>
													<c:when test="${commo.status =='buyerNotPay'}">买方没有支付</c:when>
													<c:when test="${commo.status =='inCell'}">在格子</c:when>
													<c:when test="${commo.status =='manualProcessing'}">手工加工</c:when>
													<c:when test="${commo.status =='inForwarding'}">转发中</c:when>
													<c:when test="${commo.status =='packing'}">打包</c:when>
													<c:when test="${commo.status =='paid'}">已付</c:when>
													<c:when test="${commo.status =='apiProcessing'}">API处理</c:when>
													<c:when test="${commo.status =='waitingForTracking'}">等待的追踪</c:when>
												</c:choose></td>
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
	$('#yunfei').html("包裹运费：${fee}");
	$(function() {
		//获得文本框对象
		//数量增加操作
		$("#btn_next").click(
				function() {
					var t = $(this).siblings('#fee');
					t.val(parseInt(t.val()) + 1)
					if (parseInt(t.val()) > 1) {
						$(this).siblings('#btn_prev').attr(
								'disabled', false);
					}
				})
		//数量减少操作
		$("#btn_prev").click(function() {
			var t = $(this).siblings('#fee');
			t.val(parseInt(t.val()) - 1);
		})
	})
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

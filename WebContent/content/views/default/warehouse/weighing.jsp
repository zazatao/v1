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
<script type="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
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
					<li><font style="font-size: 18px;">称量&打包</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal"
					action="warehouse/searchWeighing?page=weighing" method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹编号"
								class="form-control" id="packageCode" >
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="formDelivery"
								id="formDelivery">
								<option value="">-------------交货方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="客户"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索&添加" class="btn btn-default">
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
								<th>客户</th>
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
								<td><a href="warehouse/getOrder?page=weighing&id=${pack.packageID}" >${pack.packageCode }</a></td>
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
			<div class="col-md-8 column" style="height: 100%">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">称量包裹</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<form class="form-horizontal" action="warehouse/addHospital"
										method="POST">
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-2 control-label">净重</label>
											<div class="col-sm-3">
												<input type="text" name="weightText" class="form-control"
													id="weightText" readonly="readonly">
											</div>
											<label for="inputEmail3" class="col-sm-2 control-label">皮重</label>
											<div class="col-sm-3">
													<c:if test="${packs.grossWeight == null}">
														<input type="text" name="grossWeight" class="form-control"
															id="grossWeight" value="1">
													</c:if>
													<c:if test="${packs.grossWeight != null}">
														<input type="text" name="grossWeight" class="form-control"
															id="grossWeight" value="${packs.grossWeight }">
													</c:if>
												<span
													class="badge navbar-right" id="btn_prev" style="cursor: pointer;"><font
													style="font-size: 15px;">-</font></span>&nbsp;&nbsp;<span
													class="badge navbar-right"  id="btn_next" style="cursor: pointer;"><font
													style="font-size: 16px;">+</font></span>
											</div>
										</div>
										
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-1 control-label">尺寸</label>
											<div class="col-sm-2"> 
												<select class="form-control" onchange="packageGenre(this);" id="genre">
														<option value="">---选择尺寸---</option>
												</select>
										</div>
											
										<script type="text/javascript">
											$(document).ready(function(){
												var pos = document.getElementById('genre');
												var numd = pos.options.length;
												for (i = numd - 1; i >= 0; i--) {
													pos.remove(i);
												}
												var objOption = new Option("---选择尺寸---", "");
												pos.options[pos.options.length] = objOption;
												<c:forEach items="${size.packageGenres }" var="packageGenre">
													var item = '${packageGenre.attribute}'.split(',');
													var volume = "";
													for (i=0;i<item.length ;i++ )   
													 {   
														 if( item[i] != '' && item[i].indexOf("体积") >= 0 )
														 {
															 volume = item[i].split("-")[1];
															 break;
														 }
													 }
													
													var objOption = new Option(volume ,
															"${packageGenre.id }");
													pos.options[pos.options.length] = objOption;
												</c:forEach>
											});
										</script>
										
											<div class="col-sm-1">
												<input type="text" name="l"
													class="form-control" id="l"
													value="" placeholder="长" style="font-size: 12px;">
											</div>
											<div class="col-sm-1">
 												<input type="text" name="w"
													class="form-control" id="w"
													value="" placeholder="宽" style="font-size: 12px;">
											</div>
											<div class="col-sm-1">
												<input type="text" name="h"
													class="form-control" id="h"
													value="" 	="高" style="font-size: 12px;">
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label for="inputEmail3" class="col-sm-8 control-label"
												style="text-align: right;"></label>
											<div class="col-sm-1">
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">打印发票</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default">打印条码</button>
											</div>
											<div class="col-sm-1">
												<button type="button" class="btn btn-default" onclick="packageIng(${packs.packageID});">打包</button>
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
															<th>付款日期</th>
															<th>订单编号</th>
															<th>产品编号</th>
															<th>产品名称</th>
															<th>数量</th>
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
																<td>${order.paymentDate }&nbsp;${order.paymentTime }</td>
																<td>${order.orderFormID }</td>
																<td>${comm.commodityID }</td>
																<td>${comm.nameOfGoods }</td>
																<td>${comm.quantity}</td>
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
															<th>产品编号</th>
															<th>产品名称</th>
															<th>条形码</th>
															<th>数量</th>
															<th>重量</th>
															<th>状态</th>
														</tr>
														<c:set var="grossWeight" value="0"></c:set>
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
																<td>${orders.orderUser.storeRoom.cellStr }</td>
																<td>${commo.commodityID }</td>
																<td>${commo.nameOfGoods }</td>
																<td>${commo.tpek }</td>
																<td>${commo.quantity }</td>
																<td>${commo.weight }</td>
																<c:set var="grossWeight" value="${grossWeight+commo.weight}"></c:set>
																<td>
																<c:choose>
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
																</c:choose>
																</td>
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
	function packageIng(id){
		var genre = $('#genre').val();
		var weight = $('#weightText').val();
		var grossWeight = $('#grossWeight').val();
		if (genre == '') {
			alert('请选择外包装！！！');
		}else{
			location.href ='warehouse/updatePacke?id='+id+"&genre="+genre+"&weight="+weight+"&grossWeight="+grossWeight;
		}
	}
	
	function packageGenre(obj){
		 var item = obj.options[obj.selectedIndex].text.split("*");
		 for (i=0;i<item.length ;i++ )   
		 {   
			 $('#l').val(item[0]+"cm");
			 $('#w').val(item[1]+"cm");
			 $('#h').val(item[2]+"cm");
		 }  
	}
	$(document).ready(function(){
	   if ($('#weightText').val() == '') {
		   $('#weightText').val('${grossWeight}');
		}
	});
	$(function() {
		//获得文本框对象
		//数量增加操作
		$("#btn_next").click(
				function() {
					var t = $(this).siblings('#grossWeight');
					t.val(parseInt(t.val()) + 1)
					if (parseInt(t.val()) > 1) {
						$(this).siblings('#btn_prev').attr(
								'disabled', false);
					}
				})
		//数量减少操作
		$("#btn_prev").click(function() {
			var t = $(this).siblings('#grossWeight');
			t.val(parseInt(t.val()) - 1);
			if (parseInt(t.val()) <= 1) {
				$("#grossWeight").val(1);
			}
		})

	})
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

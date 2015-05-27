<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回收站</title>
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


<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="container-fluid"  style="padding:0;margin-top:32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">仓库</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">回收站</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="warehouse/searchReclaimStation"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="cellStr" placeholder="格子"
								class="form-control" id="cellStr">
						</div>
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹"
								class="form-control" id="packageCode" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderFormID" placeholder="订单"
								class="form-control" id="orderFormID" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="客户"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="tpek" placeholder="条形码"
								class="form-control" id="tpek">
						</div>
						<div class="col-sm-1">
							<input type="text" name="cellDate" placeholder="在格子时间"
								class="form-control" id="cellDate"
								onclick="dateInfoxxx('cellDate')">
						</div>
						<div class="col-sm-1">
							<input type="text" name="inStoreRoomDate" placeholder="进入仓库时间"
								class="form-control" id="inStoreRoomDate"
								onclick="dateInfoxxx('inStoreRoomDate')">
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="formStatus" id="formStatus"
								placeholder="状态">
								<option value="">-----状态-----
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
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<c:forEach var="comm" items="${commodity }" varStatus="loop">
					<div class="panel-group" id="panel-864199${loop.index }">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title collapsed" data-toggle="collapse"
									data-parent="#panel-864199${loop.index }"
									href="#panel-element-689950${loop.index }"> 格子：${comm.key }&nbsp;&nbsp;订单数：${fn:length(comm.value ) }
								</a>
							</div>
						</div>
						<div id="panel-element-689950${loop.index }"
							class="panel-collapse in">
							<div class="container-fluid">
								<div class="row-fluid">
									<div class="span12">
										<table
											class="table table-bordered table-hover table-condensed">
											<thead>
												<tr>
													<th>格子</th>
													<th>订单</th>
													<th>包裹</th>
													<th>货号(淘宝ID)</th>
													<th>客户</th>
													<th>条形码</th>
													<th>数量</th>
													<th>价格</th>
													<th>金额</th>
													<th>重量</th>
													<th>入格子时间</th>
													<th>进入仓库</th>
													<th>状态</th>
												</tr>
											</thead>
											<c:forEach var="commodity" items="${comm.value }"
												varStatus="loop">
												<tbody>
													<tr class="success">
														<td align="center">${commodity.orderNumber.orderUser.storeRoom.cellStr }</td>
														<td  align="center">${commodity.orderNumber.orderFormID }</td>
														<td>${commodity.orderNumber.packAge.packageCode }</td>
														<td>${commodity.commItem }</td>
														<td>${commodity.orderNumber.orderUser.userName }</td>
														<td>${commodity.tpek }</td>
														<td>${commodity.quantity }</td>
														<td>${commodity.price }</td>
														<td>${commodity.money }</td>
														<td>${commodity.weight }</td>
														<td>${commodity.cellDate }</td>
														<td>${commodity.inStoreRoomDate }</td>
														<td>
															<select onchange="checkData(this,${commodity.commodityID});">
																<option value="">----选择操作----
																<option value="senToWarehouse" <c:if test="${commodity.status =='senToWarehouse'}">selected</c:if>>送往库房
																<option value="refuse" <c:if test="${commodity.status =='refuse'}">selected</c:if>>拒绝入库
																<option value="inWarehouse" <c:if test="${commodity.status =='inWarehouse'}">selected</c:if>>放入格子里
																<option value="marriage" <c:if test="${commodity.status =='marriage'}">selected</c:if>>瑕疵品
																<option value="cancel" <c:if test="${commodity.status =='cancel'}">selected</c:if>>取消交易
																<option value="lose" <c:if test="${commodity.status =='lose'}">selected</c:if>>丢失
															</select>
														</td>
													</tr>
													<c:set var="commSpecs" value="${commodity.commSpec }"></c:set>
											<c:set var="commSpec" value="${fn:split(commSpecs,',') }"></c:set>
											<tr>
												<c:forEach var="spec" items="${commSpec }">
													<c:if test="${fn:contains(spec,'颜色')}">
														<td rowspan="5" height="140px;" width="140px;"><img
															height="140px;" width="140px;"
															src="..${fn:substring(spec,fn:indexOf(spec,'$')+1,fn:length(spec))}">
														</td>
														<c:set
															value="${fn:substring(spec,0,fn:indexOf(spec,'$'))}"
															var="ys"></c:set>
														<c:set value="${spec }" var="orther"></c:set>
													</c:if>
												</c:forEach>
												<td colspan="1">商品：<font style="color: blue;">${commodity.nameOfGoods }</font></td>
												<td colspan="1">卖家：<font style="color: red;">${commodity.seller.shopName }</font></td>
												<c:set var="ortherSpec"
													value="${fn:replace(commSpecs,orther,'')}"></c:set>
												<td colspan="10">规格：${ys}&nbsp;${fn:replace(ortherSpec,',','&nbsp;')}</td>
											</tr>
													<tr>
														<td colspan="3">操作员：&nbsp;${commodity.storeOperator.userName }</td>
														<td colspan="9">采购：&nbsp;${commodity.purchase.userName }</td>
													</tr>
													<tr>
														<td colspan="12">重量：&nbsp;${commodity.weight }</td>
													</tr>
													<tr>
														<td colspan="12" rowspan="2">评论：&nbsp;${commodity.comment  }</td>
													</tr>
													<tr>
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function checkData(obj,id){
			if (obj.value != '') {
				if(confirm('您确定要如此操作么？') ){
					location.href ='warehouse/updateInspection?page=reclaimStation&commodityID='+id+'&status='+obj.value;
				}
			}
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
	</script>
</body>
</html>

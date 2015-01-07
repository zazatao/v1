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
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<br>
	<br>
	<div class="container-fluid">
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
				<form class="form-horizontal" action="./searchReclaimStation"
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
							<input type="text" name="userName" placeholder="买方"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="tpek" placeholder="追踪"
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
													<th>包裹</th>
													<th>订单</th>
													<th>货号（淘宝ID）</th>
													<th>买方</th>
													<th>追踪</th>
													<th>数量</th>
													<th>价格</th>
													<th>金额</th>
													<th>重量</th>
													<th>改变日期</th>
													<th>状态</th>
												</tr>
											</thead>
											<c:forEach var="value" items="${comm.value }"
												varStatus="loop">
												<tbody>
													<tr class="success">
														<td align="center">${value.storeRoom.cellStr }</td>
														<td>${value.storeRoom.packageNum }</td>
														<td>${value.orderNumber.orderFormID }</td>
														<td>${value.commItem }</td>
														<td>${value.orderNumber.orderUser.userName }</td>
														<td>${value.tpek }</td>
														<td>${value.quantity }</td>
														<td>${value.price }</td>
														<td>${value.money }</td>
														<td>${value.weight }</td>
														<td>${value.storeRoom.cellDate }</td>
														<td><c:choose>
																<c:when test="${value.status =='unchanged'}">没有变化</c:when>
																<c:when test="${value.status =='cancel'}">取消交易</c:when>
																<c:when test="${value.status =='delete'}">删除</c:when>
															</c:choose></td>
													</tr>
													<tr>
														<td rowspan="5" height="140px;" width="140px;"><c:if
																test="${value.imagePaths[0].path !=null}">
																<img height="140px;" width="140px;"
																	src="..${value.imagePaths[0].path}">
															</c:if></td>
														<td colspan="12">颜色：&nbsp;${value.color }&nbsp;&nbsp;&nbsp;&nbsp;尺码：&nbsp;${value.size }</td>
													</tr>
													<tr>
														<td colspan="12">操作员：&nbsp;${value.storeOperator.userName }</td>
													</tr>
													<tr>
														<td colspan="12">采购：&nbsp;${value.purchase.userName }</td>
													</tr>
													<tr>
														<td colspan="12">重量：&nbsp;${value.weight }</td>
													</tr>
													<tr>
														<td colspan="12">评论：&nbsp;${value.comment  }</td>
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

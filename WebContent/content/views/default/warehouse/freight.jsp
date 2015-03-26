<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>运费</title>
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
					<li><font style="font-size: 18px;">运费</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">包裹运费</h3>
				</div>
				<div class="list-group-item">
					<div class="container-fluid">
						<div class="row-fluid">
							<div class="span12">
								<form class="form-horizontal" action=""
									method="POST">
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-2 control-label">追踪号</label>
										<div class="col-sm-3">
											<input type="text" name="packAgeTpek" class="form-control"
												id="packAgeTpek" readonly="readonly">
										</div>
										<label for="inputEmail3" class="col-sm-2 control-label">运费</label>
										<div class="col-sm-3">
											<input type="text" name="transportFee" class="form-control"
												id="transportFee"><span
													class="badge navbar-right" id="btn_prev" style="cursor: pointer;"><font
													style="font-size: 15px;">-</font></span>&nbsp;&nbsp;<span
													class="badge navbar-right"  id="btn_next" style="cursor: pointer;"><font
													style="font-size: 16px;">+</font></span>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<div class="col-sm-11" style="text-align: right;">
											<button type="button" class="btn btn-default" onclick="transportFeeJie();">运费结算</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<br>
				<form class="form-horizontal" action="./searchFreight?page=freight"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="packageCode" placeholder="包裹编号"
								class="form-control" id="packageCode" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="userName" placeholder="客户"
								class="form-control" id="userName">
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="formDelivery"
								id="formDelivery">
								<option value="">-------------运输方式-------------
								<option value="EMS">EMS
							</select>
						</div>
						<div class="col-sm-1">
							<input type="text" name="sendDate" placeholder="发货日期"
								class="form-control" id="sendDate" onclick="dateInfoxxx('sendDate')">
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<div class="panel-heading">
					<h3 class="panel-title">包裹运费</h3>
				</div>
				<div class="list-group-item">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>包裹号</th>
								<th>客户</th>
								<th>收货人姓名</th>
								<th>追踪号</th>
								<th>总重量</th>
								<th>毛重</th>
								<th>运输方式</th>
								<th>当前状态</th>
							</tr>
							<c:forEach var="orders" items="${list }" varStatus="loop">
								<c:set var="transportFee" value="0"></c:set>
								<c:choose>
									<c:when test="${loop.index%2==0 }">
										<tr>
									</c:when>
									<c:otherwise>
										<tr class="success">
									</c:otherwise>
								</c:choose>
								<c:forEach items="${orders.orderForms }" var="order">
									<c:set var="transportFee" value="${transportFee + order.deliveryMoney }"></c:set>
								</c:forEach>
								<input type="hidden" id="orderFee${loop.index }" value="${transportFee }">
								<td><a href="#"
									onclick="haveTpek('${orders.packAgeTpek }','${orders.transportFee }','${loop.index }');">${orders.packageCode }</a></td>
								<td>${orders.orderForms[0].orderUser.userName }</td>
								<td>${orders.orderForms[0].address.toName }</td>
								<td>${orders.packAgeTpek }</td>
								<td>${orders.totalWeight }</td>
								<td>${orders.grossWeight }</td>
								<td>
								<c:choose>
										<c:when test="${orders.delivery =='EMS'}">EMS</c:when>
										<c:when test="${orders.delivery =='sf'}">顺风</c:when>
									</c:choose>
								</td>
								<td>
									<c:if test="${orders.isClearing }">
										已经结算
									</c:if>
									<c:if test="${!orders.isClearing }">
										打包
									</c:if>
								</td>
								</tr>
							</c:forEach>
						</table>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function haveTpek(tpek, fee,id) {
			if (fee == '') {
				var ss= $('#orderFee'+id).val();
				$('#transportFee').val(ss);
			}else{
				$('#transportFee').val(fee);
			}
			$('#packAgeTpek').val(tpek);
		}
		function transportFeeJie(){
			var packAgeTpek = $('#packAgeTpek').val();
			var transportFee = $('#transportFee').val();
			location.href ='./updateTransportFee?packAgeTpek='+packAgeTpek+"&transportFee="+transportFee;
		}
		$(function() {
			//获得文本框对象
			//数量增加操作
			$("#btn_next").click(
					function() {
						var t = $(this).siblings('#transportFee');
						t.val(parseInt(t.val()) + 1)
						if (parseInt(t.val()) > 1) {
							$(this).siblings('#btn_prev').attr(
									'disabled', false);
						}
					})
			//数量减少操作
			$("#btn_prev").click(function() {
				var t = $(this).siblings('#transportFee');
				t.val(parseInt(t.val()) - 1);
				if (parseInt(t.val()) <= 1) {
					$("#transportFee").val(1);
				}
			})

		})
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
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

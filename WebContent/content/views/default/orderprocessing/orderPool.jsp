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
					<li><font style="font-size: 18px;">订单池</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal"
					action="./searchOrderPool" method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="transNumForTaobao" placeholder="货品编号"
								class="form-control" id="transNumForTaobao" onblur="checkvalue(this)">
						</div>
						<div class="col-sm-1">
							<input type="text" name="orderUserName" placeholder="买家"
								class="form-control" id="orderUserName">
						</div>
						<div class="col-sm-1">
							<input type="text" name="paymentDate" placeholder="付款日期"
								class="form-control" id="paymentDate"
								onclick="dateInfoxxx('paymentDate')">
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="disposeStatus" id="disposeStatus"
								placeholder="状态">
								<option value="">--------买家界面显示状态--------
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
						<h3 class="panel-title">订单池</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<tr class="">
								<th>订单编号</th>
								<th>货品编号</th>
								<th>买家</th>
								<th>付款日期</th>
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
								<td><a href="./orderPoolItem?orderid=${commodity.orderNumber.orderFormID }&commCode=${commodity.transNumForTaobao}" >${commodity.orderNumber.orderFormID }</a></td>
								<td>${commodity.transNumForTaobao }</td>
								<td>${commodity.orderNumber.orderUser.userName}</td>
								<td>${commodity.orderNumber.paymentDate}</td>
								<td>
									<c:if test="${commodity.disposeStatus == 'process' }">正在处理</c:if>
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
						<h3 class="panel-title">订单/货品</h3>
					</div>
					<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<div class="list-group-item" style="400px">
										<p class="list-group-item-text">
										<form class="form-horizontal" action="" method="POST">
											<!-- 表格 -->
											<table class="table table-hover table-striped">
													<tr>
														<th>
															订单编号:
															<label>${commodity.orderNumber.orderFormID}</label>
														</th>
														<th>
															产品编号:
															<label>${commodity.transNumForTaobao }</label>
														</th>
														<th>
															卖家:
															<label>${commodity.seller.shopName }</label>
														</th>
														<th></th>
													</tr>
													<tr>
														<th>
															产品名称:
															${commodity.nameOfGoods }
														</th>
														<th>
															付款日期:&nbsp;&nbsp;&nbsp;&nbsp;
															<font color="blue">${commodity.orderNumber.paymentDate }&nbsp;${commodity.orderNumber.paymentTime }</font>
														</th>
														<th></th>
														<th></th>
													</tr>
													<tr>
														<th>
															数量:
															<label>${commodity.quantity}</label>
														</th>
														<th>
															价格:
															<label>${commodity.price}</label>
														</th>
														<th>
															金额:
															<label>${commodity.money}</label>
														</th>
														<th>
														</th>
													</tr>
													<c:set value="${fn:split(commodity.commSpec,',')}" var="spec"></c:set>
													<tr>
														<th colspan="4">
															<div>
																<div class="sctbldscr">
																	<div style="width: 30%; float: left;">
																	规格：
																		<ul>
																			<c:forEach items="${spec }" var="sp">
																				<c:if
																					test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
																					<li><span>颜色:</span>
																						${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:indexOf(sp, '$') )}
																					</li>
																				</c:if>
																				<c:if
																					test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '尺寸'}">
																					<li><span>尺寸:</span>
																						${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:length(sp) )}
																					</li>
																				</c:if>
																				<c:if
																					test="${fn:substring(sp,0,fn:indexOf(sp, '-')) != '尺寸' && fn:substring(sp,0,fn:indexOf(sp, '-')) != '颜色'}">
																					<li class="sctbldscrlb"><span>${fn:substring(sp,0,fn:indexOf(sp, '-'))}:</span>
																						${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:length(sp) )}
																					</li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</div>
																	<div>
																		<c:forEach items="${spec }" var="sp">
																			<p class="sctbldscl">
																				<c:if
																					test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
																					<img
																						src="..${fn:substring(sp, fn:indexOf(sp, '$')+1, fn:length(sp)) }" />
																				</c:if>
																			</p>
																		</c:forEach>
																	</div>
																</div>
															</div>
														</th>
													</tr>
													<tr>
														<th>
															改变状态:
															<input type="radio" name="dispose" value="manualProcessing" <c:if test="${commodity.disposeStatus == 'manualProcessing'}">checked</c:if>>手动处理 
															<input type="radio" name="dispose" value="process" <c:if test="${commodity.disposeStatus == 'process'}">checked</c:if>>处理中
															<input type="radio" name="dispose" value="quantity">剩余商品
														</th>
														<th>
															剩余商品:
															<input type="text" name="quantity" id="quantity" readonly="readonly" value="${commodity.quantity}" onblur="checkvalue(this)">
														</th>
														<th></th>
														<th></th>
													</tr>
													<script type="text/javascript">
													var num = $('#quantity').val();
													$("input:radio[name='dispose']").change(function (){ //拨通
														if(this.value == 'quantity'){
															$('#quantity').removeAttr("readonly");
														}else{
															$('#quantity').val(num);
															$('#quantity').attr("readonly","readonly")
														}
													});
													</script>
													<tr>
														<th></th>
														<th></th>
														<th>
															<button type="button" class="btn btn-primary">稍后处理</button>
														</th>
														<th><button type="button" onclick="" class="btn btn-primary">现在处理</button></th>
													</tr>
											</table>
											<!-- /表格 -->
										</form>
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
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
<script TYPE="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script TYPE="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script TYPE="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script TYPE="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script TYPE="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script TYPE="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<DIV class="container-fluid" style="padding: 0; margin-top: 32px;">
		<DIV class="row-fluid">
			<DIV class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">订单处理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">处理</font>
				</ul>
			</DIV>
		</DIV>
	</DIV>
	<DIV class="container-fluid">
		<DIV class="row-fluid">
			<DIV class="col-md-12 column">
				<form class="form-horizontal"
					ACTION="./searchWeighing" method="POST">
					<DIV class="form-group">
						<DIV class="col-sm-1">
							<input TYPE="text" NAME="transNumForTaobao" placeholder="货品编号"
								class="form-control" id="transNumForTaobao" onblur="checkvalue(this)">
						</DIV>
						<DIV class="col-sm-1">
							<input TYPE="text" NAME="orderUserName" placeholder="买家"
								class="form-control" id="orderUserName">
						</DIV>
						<DIV class="col-sm-1">
							<input TYPE="text" NAME="paymentDate" placeholder="付款日期"
								class="form-control" id="paymentDate"
								onclick="dateInfoxxx('paymentDate')">
						</DIV>
						<DIV class="col-sm-2">
							<SELECT class="form-control" NAME="disposeStatus" id="disposeStatus"
								placeholder="状态">
								<OPTION VALUE="">--------买家界面显示状态--------
								<OPTION VALUE="process">正在处理
								<OPTION VALUE="shortage">商品现货不足
								<OPTION VALUE="commodityAds">产品广告
								<OPTION VALUE="waiting">等候
								<OPTION VALUE="manualProcessing">手动处理
							</SELECT>
						</DIV>
						<DIV class="col-sm-1">
							<input TYPE="submit" VALUE="搜索" class="btn btn-default">
						</DIV>
					</DIV>
				</form>
			</DIV>
			<DIV class="col-md-4 column">
				<DIV class="panel panel-default">
					<DIV class="panel-heading">
						<h3 class="panel-title">领取的处理订单</h3>
					</DIV>
					<DIV class="list-group-item">
						<p class="list-group-item-text">
						<TABLE class="table table-striped">
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
								<td><a href="./orderItem?id=${commodity.commodityID }&orderid=${commodity.orderNumber.orderFormID }" >${commodity.orderNumber.orderFormID }</a></td>
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
						</TABLE>
						</p>
					</DIV>
				</DIV>
			</DIV>
			<script TYPE="text/javascript">
			function dateInfoxxx(obj) {
				var DATE = obj;
				$('#' + DATE).datetimepicker({
					lang : 'ch',
					timepicker : FALSE,
					FORMAT : 'Y-m-d',
					formatDate : 'Y-m-d',
				});
			}
			function packNum(num){
					location.href ='./getOrder?page=weighing&id='+num;
			}
			</script>
			
			<!-- rightmain -->
			<DIV class="col-md-8 column" style="height: 100%">
				<!-- 
				<DIV class="panel panel-default">
				 -->
				 <DIV class="container row">
					<DIV class="panel-heading">
						<h3 class="panel-title">订单/卖家</h3>
					</DIV>
					<DIV class="list-group-item">
						<DIV class="container-fluid">
							<DIV class="row-fluid">
								<DIV class="span12">
									<DIV class="list-group-item" style="400px">
										<p class="list-group-item-text">
										<form class="form-horizontal" ACTION="" method="POST">
											<!-- 表格 -->
											<TABLE class="table table-hover table-striped">
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
															<DIV>
																<DIV class="sctbldscr">
																	<DIV style="width: 30%; float: left;">
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
																	</DIV>
																	<DIV>
																		<c:forEach items="${spec }" var="sp">
																			<p class="sctbldscl">
																				<c:if
																					test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
																					<img
																						src="..${fn:substring(sp, fn:indexOf(sp, '$')+1, fn:length(sp)) }" />
																				</c:if>
																			</p>
																		</c:forEach>
																	</DIV>
																</DIV>
															</DIV>
														</th>
													</tr>
													<tr>
														<th>
															改变状态:
															<input TYPE="radio" NAME="dispose" VALUE="manualProcessing" <c:if test="${commodity.disposeStatus == 'manualProcessing'}">checked</c:if>>手动处理 
															<input TYPE="radio" NAME="dispose" VALUE="process" <c:if test="${commodity.disposeStatus == 'process'}">checked</c:if>>处理中
															<input TYPE="radio" NAME="dispose" VALUE="quantity">剩余商品
														</th>
														<th>
															剩余商品:
															<input TYPE="text" NAME="quantity" id="quantity" readonly="readonly" VALUE="${commodity.quantity}" onblur="checkvalue(this)">
														</th>
														<th></th>
														<th></th>
													</tr>
													<tr>
														<th>
															追踪号:
															<input TYPE="text" NAME="tpek" VALUE="${commodity.tpek}">
														</th>
														<th>
															交易码:&nbsp;&nbsp;&nbsp;&nbsp;
															<input TYPE="text" NAME="tradingCode" value="${commodity.tradingCode}" >
														</th>
														<th></th>
														<th></th>
													</tr>
													<tr>
														<th></th>
														<th></th>
														<th>
															<button TYPE="button" class="btn btn-primary">稍后处理</button>
														</th>
														<th><button TYPE="button" onclick="onProcessing(${commodity.orderNumber.orderFormID},${commodity.commodityID });" class="btn btn-primary">现在处理</button></th>
													</tr>
											</TABLE>
											<script type="text/javascript">
											function onProcessing(orderID,commID){
												var num = $('#quantity').val();
												var dispoce = $('input[name="dispose"]:checked').val();
												location.href ='./onProcessing?dispose='+dispoce+'&num='+num+'&orderID='+orderID +'&commID='+commID;			
											}
											</script>
											<!-- /表格 -->
										</form>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>
											<script TYPE="text/javascript">
													var num = $('#quantity').val();
													$("input:radio[name='dispose']").change(function (){ //拨通
														IF(this.value == 'quantity'){
															$('#quantity').removeAttr("readonly");
														}ELSE{
															$('#quantity').val(num);
															$('#quantity').attr("readonly","readonly")
														}
													});
											</script>
					<DIV class="list-group-item">
						<DIV class="container-fluid">
							<DIV class="row-fluid">
								<DIV class="span12">
									<DIV class="tabbable" id="tabs-294834">
										<ul class="nav nav-tabs">
											<li class="active"><a href="#panel-700079"
												DATA-toggle="tab">与买家联系</a></li>
											<li><a href="#panel-520562" DATA-toggle="tab">内部</a></li>
										</ul>
										<DIV class="tab-content">
											<DIV class="tab-pane active" id="panel-700079">
												<br>
												<DIV class="list-group-item">
													<p class="list-group-item-text">
													<TABLE class="table table-hover table-striped">
														<tr class="">
															<th>内容</th>
															<th>日期</th>
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
													</TABLE>
													</p>
												</DIV>
											</DIV>
											<DIV class="tab-pane" id="panel-520562">
												<br>
												<DIV class="list-group-item">
													<p class="list-group-item-text">
													<TABLE class="table table-hover table-striped">
														<tr class="">
															<th>内容</th>
															<th>日期</th>
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
													</TABLE>
													</p>
												</DIV>
											</DIV>
										</DIV>
									</DIV>
								</DIV>
							</DIV>
						</DIV>
					</DIV>
				</DIV>
			</DIV>
			<!-- /rightmain -->
		</DIV>
	</DIV>
	</ul>
	<script TYPE="text/javascript">
		function checkvalue(obj) {
			IF (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		// Popup window CODE
		function reloadData() {
			setTimeout(function() {
				window.location.reload();
			}, 1000);
		}
		function popupwindow(url) {
			var w = 700;
			var h = 800;
			var title = "";
			var LEFT = (screen.width / 2) - (w / 2);
			var top = (screen.height / 2) - (h / 2);
			RETURN window
					.OPEN(
							url,
							title,
							'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
									+ w
									+ ', height='
									+ h
									+ ', top='
									+ top
									+ ', left=' + LEFT);
		}
	</script>
</body>
</html>
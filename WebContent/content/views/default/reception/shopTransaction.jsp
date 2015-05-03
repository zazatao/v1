<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品交易管理</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/jiaoyi.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<SCRIPT src="../content/static/js/reception/ScrollPic.js"
	type=text/javascript></SCRIPT>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<c:if test="${shop.blacklist != null }">
			<br />
			<br />
			<br />
			<center>
				<font color="red" size="+3">该店铺已入黑名单！</font>
			</center>
			<br />
			<br />
			<br />
		</c:if>
		<c:if test="${shop.blacklist == null }">
			<!---------------   left   ----------------------->
			<jsp:include page="left.jsp"></jsp:include>
			<form action="../proscenium/shopOrderSearch" method="post">
				<div class="Jiaoyi">
					<div class="biao">我是卖家&gt;交易管理&gt;全部卖出交易</div>
					<div class="nei">
						<div class="nei01">
							<table width="760" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td height="30"><div align="left">
											商品名称： <input type="text" name="nameOfGoods" id="textfield" />
										</div></td>
									<td colspan="2"><div align="left">
											成交日期：从 <input type="text" name="paymentDateLeft"
												id="textfield9" style="width: 100px;" placeholder="年-月-日" />&nbsp;&nbsp;&nbsp;&nbsp;
											<!-- 										<input type="text" name="paymentTimeLeft" id="textfield10" -->
											<!-- 										onclick="timessss('textfield10');" style="width: 45px;" placeholder="时：分" /> -->
											到 &nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
												placeholder="年-月-日" name="paymentDateRight" id="textfield11"
												style="width: 100px;" />
											<!-- 										 <input type="text" placeholder="时：分" name="paymentTimeRight" -->
											<!-- 										id="textfield12" onclick="timessss('textfield12');" -->
											<!-- 										style="width: 45px;" /> -->
										</div>
										<div align="left"></div></td>
								</tr>
								<tr>
									<td height="30"><div align="left">
											买家昵称： <input type="text" name="orderUserName" id="textfield2" />
										</div></td>
									<td><div align="left">
											订单状态： <select name="orderStatusFrom" id="textfield5"
												placeholder="状态">
												<option value="">-----状态-----
													<option value="waitAcceptance">等待验收
														<option value="waitPayment">等待支付
															<option value="inForwarding">在转发
																<option value="waitDelivery">等待发货
																	<option value="transitGoods">在途货物
																		<option value="consigneeSigning">收货人签单
																			<option value="refundOrderForm">退款订单
																				<option value="completionTransaction">完成交易
																					<option value="closeTransaction">关闭交易
																						<option value="autoCloseTransaction">自动关闭交易



																						
											</select>
										</div></td>
									<td><div align="left">
											评价状态： <select name="textfield6" id="textfield6"
												placeholder="状态">
												<option value="">-----状态-----
													<option value="needsComments">需要我评价
														<option value="iAlreadyComments">我已经评价
															<option value="orthSideComments">对方已评价
																<option value="bothSideComments">双方已平价
											</select>
										</div></td>
								</tr>
								<tr>
									<td height="30"><div align="left">
											订单编号： <input type="text" name="orderFormID" id="textfield3" />
										</div></td>
									<td><div align="left">
											物流服务： <select name="textfield7" id="textfield7"
												placeholder="状态">
												<option value="">-----状态-----
													<option value="cashOnDelivery">货到付款
											</select>
										</div></td>
									<td><div align="left">
											运费服务： <select name="textfield8" id="textfield8"
												placeholder="状态">
												<option value="">-----状态-----
													<option value="buyComplaint">买家投诉
														<option value="myComplaint">我已投诉
															<option value="refunding">退款中
											</select>
										</div></td>
								</tr>
								<!-- 						<tr> -->
								<!-- 							<td height="30"><div align="left"> -->
								<!-- 									交易类型： <select name="select3" id="select3" style="width: 150px"> -->
								<!-- 										<option>所有类型</option> -->
								<!-- 									</select> -->
								<!-- 								</div></td> -->
								<!-- 							<td><div align="left"></div></td> -->
								<!-- 							<td><div align="left"></div></td> -->
								<!-- 						</tr> -->
								<tr>
									<td height="30"><div align="left">
											<input type="submit" name="button" id="button" value="搜索"
												style="width: 50px; color: #36C" />
											<!-- 									<input type="submit" name="button" id="button" value="批量导出" -->
											<!-- 										style="width: 100px; color: #36C" /> -->
										</div></td>
									<td><div align="left"></div></td>
									<td><div align="left"></div></td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</form>
			<script type="text/javascript">
 						$('#textfield9').datetimepicker({
								lang:'ch',
								timepicker:false,
								format:'Y-m-d',
								formatDate:'Y-m-d',
						});
						$('#textfield11').datetimepicker({
								lang:'ch',
								timepicker:false,
								format:'Y-m-d',
								formatDate:'Y-m-d',
						});
						function timessss(obj){
							var hour=<%=(new Date()).getHours()%>
							var minute=<%=(new Date()).getMinutes()%>
							var a = obj;
							var id = a.substring(a.length-2,a.length);
								if($('#textfield'+(id-1)).val() !=""){
									$('#'+a).clockpicker({
										placement: 'bottom',
										align: 'left',
										autoclose: true,
										'default': hour+':'+minute
									});
								}
						}
				</script>
			<div class="quanbu_dan autoh">
				<div class="tab-title" style="width: 780px;">
					<ul id="myTab1">
						<c:if test="${shopOrderSearch == 'true'}">
							<li class="active1" onmouseover="nTabs(this,0,&#39;搜索结果&#39;);"
								style="top: 0; left: 0;">搜索结果</li>
						</c:if>
						<c:if test="${shopOrderSearch == null}">
							<li class="active1"
								onmouseover="nTabs(this,0,&#39;最近三个月订单&#39;);"
								style="top: 0; left: 0;">最近三个月订单</li>
						</c:if>
						<li class="normal1" onmouseover="nTabs(this,1,&#39;等待买家付款&#39;);"
							style="top: 0; left: 76px;">等待买家付款</li>
						<li class="normal1" onmouseover="nTabs(this,2,&#39;等待发货&#39;);"
							style="top: 0; left: 150px;">等待发货</li>
						<li class="normal1" onmouseover="nTabs(this,3,&#39;在途货物&#39;);"
							style="top: 0; left: 150px;">在途货物</li>
						<!-- 					<li class="normal1" onmouseover="nTabs(this,4,&#39;退款中&#39;);" -->
						<!-- 						style="top: 0; left: 150px;">退款中</li> -->
						<li class="normal1" onmouseover="nTabs(this,4,&#39;需要评价&#39;);"
							style="top: 0; left: 150px;">需要评价</li>
						<li class="normal1" onmouseover="nTabs(this,5,&#39;交易完成的订单&#39;);"
							style="top: 0; left: 150px;">交易完成的订单</li>
						<li class="normal1" onmouseover="nTabs(this,6,&#39;关闭的订单&#39;);"
							style="top: 0; left: 150px;">关闭的订单</li>
					</ul>
				</div>
				<div style="clear: both"></div>
				<table width="470" border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr>
							<td width="73%" height="160" valign="top"><div
									align="center">
									<div class="TabContent" id="myTab1_0"
										style="width: 780px; display:">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0" id="table1">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<tr style="background-color: #BBFFEE;">
														<td colspan="3">订单编号：${order.orderFormID }</td>
														<td><div align="center">${order.deliveryMoney }</div></td>
														<td></td>
														<td><div align="center">
																<c:choose>
																	<c:when
																		test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																	<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																	<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																	<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																	<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																	<c:when
																		test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																	<c:when
																		test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																	<c:when
																		test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																	<c:when
																		test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																	<c:when
																		test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																</c:choose>
															</div></td>
														<td><div align="center"></div></td>
														<td><div align="center"></div></td>
													</tr>
													<c:forEach items="${order.commodities }" var="comm">
														<tr>
															<c:if test="${comm == null }">
																<td height="30" colspan="5">没有符合条件的商品，请尝试其他搜索条件。</td>
															</c:if>
															<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
															<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
															<td><div align="center">${comm.quantity }</div></td>
															<td><div align="center"></div></td>
															<td><div align="center">${order.orderUser.userName }</div></td>
															<td><div align="center"></div></td>
															<td><div align="center">${comm.money }</div></td>
															<td><div align="center">好评</div></td>
														</tr>
													</c:forEach>
												</c:forEach>
											</table>
											<table width="760" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="427" bgcolor="#EEEEEE"><div align="left">
															<input type="checkbox" name="CheckboxGroup1_" value="复选框"
																id="CheckboxGroup1_" onclick="checkClose();" />
															不显示已关闭的订单
														</div></td>
												</tr>
											</table>
										</div>
									</div>
									<script language="JavaScript" type="text/javascript">
								function checkClose(){
									if($('#CheckboxGroup1_').is(':checked')) {
										$("#table1 tr:gt(0)").remove();
										var $close = "";
										<c:forEach items="${list }" var="order">
										<c:if test="${order.orderstatus != 'completionTransaction' && order.orderstatus != 'autoCloseTransaction' }">
										$close = $close +"<tr style='background-color: #BBFFEE;'><td colspan='3'>订单编号：${order.orderFormID }</td><td ><div align='center'>${order.deliveryMoney }</div></td>";
										$close = $close +"<td colspan='4'></td></tr>";
										<c:forEach items="${order.commodities }" var="comm">
										$close = $close + "<tr>";
											<c:if test="${comm == null }">
											$close = $close + "<td height='30' colspan='5'>没有符合条件的商品，请尝试其他搜索条件。</td>";
											</c:if>
											$close = $close + "<td height='30'><div align='center'>${comm.nameOfGoods }</div></td><td><div align='center'>${comm.price }</div></td><td><div align='center'>${comm.quantity }</div></td><td><div align='center'></div></td><td><div align='center'>${order.orderUser.userName }</div></td><td><div align='center'>";
												if("${order.orderstatus == 'waitAcceptance' }"){
													$close = $close + "等待验收";
												}else if("${order.orderstatus == 'waitPayment' }"){
													$close = $close + "等待支付";
												}else if("${order.orderstatus == 'inForwarding' }"){
													$close = $close + "在转发";
												}else if("${order.orderstatus == 'waitDelivery' }"){
													$close = $close + "等待发货";
												}else if("${order.orderstatus == 'transitGoods' }"){
													$close = $close + "在途货物";
												}else if("${order.orderstatus == 'consigneeSigning' }"){
													$close = $close + "收货人签单";
												}else if("${order.orderstatus == 'refundOrderForm' }"){
													$close = $close + "退款订单";
												}else if ("${order.orderstatus == 'completionTransaction' }") {
													$close = $close + "关闭交易";
												}else if("${order.orderstatus == 'autoCloseTransaction' }"){
													$close = $close + "自动关闭交易";
												}
												$close = $close + "</div></td><td><div align='center'>${comm.money }</div></td><td><div align='center'>好评</div></td></tr>";
									</c:forEach>
										</c:if>
								</c:forEach>
								$("#table1 tr:last").after($close);
									}else{
										$("#table1 tr:gt(0)").remove();
										var $close = "";
										<c:forEach items="${list }" var="order">
										$close = $close +"<tr style='background-color: #BBFFEE;'><td colspan='3'>订单编号：${order.orderFormID }</td><td ><div align='center'>${order.deliveryMoney }</div></td>";
										$close = $close +"<td colspan='4'></td></tr>";
										<c:forEach items="${order.commodities }" var="comm">
										$close = $close + "<tr>";
											<c:if test="${comm == null }">
											$close = $close + "<td height='30' colspan='5'>没有符合条件的商品，请尝试其他搜索条件。</td>";
											</c:if>
											$close = $close + "<td height='30'><div align='center'>${comm.nameOfGoods }</div></td><td><div align='center'>${comm.price }</div></td><td><div align='center'>${comm.quantity }</div></td><td><div align='center'></div></td><td><div align='center'>${order.orderUser.userName }</div></td><td><div align='center'>";
												if("${order.orderstatus == 'waitAcceptance' }"){
													$close = $close + "等待验收";
												}else if("${order.orderstatus == 'waitPayment' }"){
													$close = $close + "等待支付";
												}else if("${order.orderstatus == 'inForwarding' }"){
													$close = $close + "在转发";
												}else if("${order.orderstatus == 'waitDelivery' }"){
													$close = $close + "等待发货";
												}else if("${order.orderstatus == 'transitGoods' }"){
													$close = $close + "在途货物";
												}else if("${order.orderstatus == 'consigneeSigning' }"){
													$close = $close + "收货人签单";
												}else if("${order.orderstatus == 'refundOrderForm' }"){
													$close = $close + "退款订单";
												}else if ("${order.orderstatus == 'completionTransaction' }") {
													$close = $close + "关闭交易";
												}else if("${order.orderstatus == 'autoCloseTransaction' }"){
													$close = $close + "自动关闭交易";
												}
												$close = $close + "</div></td><td><div align='center'>${comm.money }</div></td><td><div align='center'>好评</div></td></tr>";
									</c:forEach>
								</c:forEach>
								$("#table1 tr:last").after($close);
									}
								}
								</script>
									<div class="TabContent" id="myTab1_1"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<c:if test="${order.orderstatus == 'waitPayment' }">
														<tr style="background-color: #BBFFEE;">
															<td colspan="3"><input type="checkbox"
																name="payMent" value="${order.orderFormID }" />订单编号：${order.orderFormID }</td>
															<td><div align="center">${order.deliveryMoney }</div></td>
															<td></td>
															<td><div align="center">
																	<c:choose>
																		<c:when
																			test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																		<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																		<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																		<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																		<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																		<c:when
																			test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																		<c:when
																			test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																		<c:when
																			test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																	</c:choose>
																</div></td>
															<td><div align="center"></div></td>
															<td><div align="center"></div></td>
														</tr>
														<c:forEach items="${order.commodities }" var="comm">
															<tr>
																<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
																<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
																<td><div align="center">${comm.quantity }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${order.orderUser.userName }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${comm.money }</div></td>
																<td><div align="center">好评</div></td>
															</tr>
														</c:forEach>
													</c:if>
												</c:forEach>
											</table>
											<table width="760" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="81" height="30" bgcolor="#EEEEEE"><div
															align="center">
															<input type="checkbox" name="CheckboxGroup1" value="复选框"
																id="CheckboxGroup1_0" />全选
														</div></td>
													<td width="70" bgcolor="#EEEEEE"><div align="center">
															<a onclick="piLiangPay();">批量免运费</a>
														</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center"></div></td>
													<td width="112" bgcolor="#EEEEEE"><div align="center"></div></td>
													<td width="427" bgcolor="#EEEEEE"></td>
												</tr>
											</table>
										</div>
									</div>
									<script language="JavaScript" type="text/javascript">
								$("#CheckboxGroup1_0").click(function(){ 
								    if(this.checked){
								        $("input[name='payMent']").each(function(){
								            this.checked = true;
								        }); 
								    }else{ 
								        $("input[name='payMent']").each(function(){
								            this.checked = false;
								        }); 
								    } 
								});
								function piLiangPay(){
								var ids = "";
									$("input[name='payMent']").each(function(){
										if ( this.checked == true) {
											ids = ids+"-"+$(this).attr('value');
									    }
									});
									if( confirm('您确定要将这些订单免去运费么？') ){
										location.href ='../proscenium/payMent?ids='+ids;
									}
						          };
								</script>
									<div class="TabContent" id="myTab1_2"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<c:if test="${order.orderstatus == 'waitDelivery' }">
														<tr style="background-color: #BBFFEE;">
															<td colspan="3"><input type="checkbox"
																name="orderDelivery" value="${order.orderFormID }" />订单编号：${order.orderFormID }</td>
															<td><div align="center">${order.deliveryMoney }</div></td>
															<td></td>
															<td><div align="center">
																	<c:choose>
																		<c:when
																			test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																		<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																		<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																		<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																		<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																		<c:when
																			test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																		<c:when
																			test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																		<c:when
																			test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																	</c:choose>
																</div></td>
															<td><div align="center"></div></td>
															<td><div align="center"></div></td>
														</tr>
														<c:forEach items="${order.commodities }" var="comm">
															<tr>
																<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
																<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
																<td><div align="center">${comm.quantity }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${order.orderUser.userName }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${comm.money }</div></td>
																<td><div align="center">好评</div></td>
															</tr>
														</c:forEach>
													</c:if>
												</c:forEach>
											</table>
											<table width="760" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="81" height="30" bgcolor="#EEEEEE"><div
															align="center">
															<input type="checkbox" name="CheckboxGroup1" value="复选框"
																id="CheckboxGroup1_0_1" />全选
														</div></td>
													<td width="66" bgcolor="#EEEEEE"><div align="center">
															<a href="#" onclick="sendAll();">批量发货</a>
														</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center"></div></td>
													<td width="112" bgcolor="#EEEEEE"><div align="center"></div></td>
													<td width="427" bgcolor="#EEEEEE"><div align="left">
														</div></td>
												</tr>
											</table>
										</div>
									</div>
									<script language="JavaScript" type="text/javascript">
								$("#CheckboxGroup1_0_1").click(function(){ 
								    if(this.checked){
								        $("input[name='orderDelivery']").each(function(){
								            this.checked = true;
								        }); 
								    }else{ 
								        $("input[name='orderDelivery']").each(function(){
								            this.checked = false;
								        }); 
								    } 
								});
								function sendAll(){
								var ids = "";
									$("input[name='orderDelivery']").each(function(){
										if ( this.checked == true) {
											ids = ids+"-"+$(this).attr('value');
									    }
									});
									if( confirm('您确定要将这些订单打包发送么？') ){
										location.href ='../proscenium/orderDelivery?ids='+ids;
									}
						          };
								</script>
									<div class="TabContent" id="myTab1_3"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<c:if test="${order.orderstatus == 'transitGoods' }">
														<tr style="background-color: #BBFFEE;">
															<td colspan="3">订单编号：${order.orderFormID }</td>
															<td><div align="center">${order.deliveryMoney }</div></td>
															<td></td>
															<td><div align="center">
																	<c:choose>
																		<c:when
																			test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																		<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																		<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																		<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																		<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																		<c:when
																			test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																		<c:when
																			test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																		<c:when
																			test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																	</c:choose>
																</div></td>
															<td><div align="center"></div></td>
															<td><div align="center"></div></td>
														</tr>
														<c:forEach items="${order.commodities }" var="comm">
															<tr>
																<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
																<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
																<td><div align="center">${comm.quantity }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${order.orderUser.userName }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${comm.money }</div></td>
																<td><div align="center">好评</div></td>
															</tr>
														</c:forEach>
													</c:if>
												</c:forEach>
											</table>

										</div>
									</div>

									<div class="TabContent" id="myTab1_4"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>

											</table>

										</div>
									</div>

									<div class="TabContent" id="myTab1_5"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<c:if
														test="${order.orderstatus == 'completionTransaction' }">
														<tr style="background-color: #BBFFEE;">
															<td colspan="3">订单编号：${order.orderFormID }</td>
															<td><div align="center">${order.deliveryMoney }</div></td>
															<td></td>
															<td><div align="center">
																	<c:choose>
																		<c:when
																			test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																		<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																		<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																		<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																		<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																		<c:when
																			test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																		<c:when
																			test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																		<c:when
																			test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																	</c:choose>
																</div></td>
															<td><div align="center"></div></td>
															<td><div align="center"></div></td>
														</tr>
														<c:forEach items="${order.commodities }" var="comm">
															<tr>
																<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
																<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
																<td><div align="center">${comm.quantity }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${order.orderUser.userName }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${comm.money }</div></td>
																<td><div align="center">好评</div></td>
															</tr>
														</c:forEach>
													</c:if>
												</c:forEach>
											</table>
										</div>
									</div>

									<div class="TabContent" id="myTab1_6"
										style="display: none; width: 780px;">
										<div class="pro">
											<table width="770" border="0" align="center" cellpadding="0"
												cellspacing="0">
												<tr>
													<td width="190" height="30" bgcolor="#EEEEEE"><div
															align="center">商品</div></td>
													<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
													<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">运费</div></td>
													<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
													<td width="74" bgcolor="#EEEEEE"><div align="center">交易状态</div></td>
													<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
													<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
												</tr>
												<c:forEach items="${list }" var="order">
													<c:if
														test="${order.orderstatus == 'closeTransaction' || order.orderstatus == 'autoCloseTransaction'}">
														<tr style="background-color: #BBFFEE;">
															<td colspan="3">订单编号：${order.orderFormID }</td>
															<td><div align="center">${order.deliveryMoney }</div></td>
															<td></td>
															<td><div align="center">
																	<c:choose>
																		<c:when
																			test="${order.orderstatus == 'waitAcceptance' }">等待验收</c:when>
																		<c:when test="${order.orderstatus == 'waitPayment' }">等待支付</c:when>
																		<c:when test="${order.orderstatus == 'inForwarding' }">在转发</c:when>
																		<c:when test="${order.orderstatus == 'waitDelivery' }">等待发货</c:when>
																		<c:when test="${order.orderstatus == 'transitGoods' }">在途货物</c:when>
																		<c:when
																			test="${order.orderstatus == 'consigneeSigning' }">收货人签单</c:when>
																		<c:when
																			test="${order.orderstatus == 'refundOrderForm' }">退款订单</c:when>
																		<c:when
																			test="${order.orderstatus == 'completionTransaction' }">完成交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'closeTransaction' }">关闭交易</c:when>
																		<c:when
																			test="${order.orderstatus == 'autoCloseTransaction' }">自动关闭交易</c:when>
																	</c:choose>
																</div></td>
															<td><div align="center"></div></td>
															<td><div align="center"></div></td>
														</tr>
														<c:forEach items="${order.commodities }" var="comm">
															<tr>
																<td height="30"><div align="center">${comm.nameOfGoods }</div></td>
																<td><div align="center">${comm.currency.symbol }${comm.price }</div></td>
																<td><div align="center">${comm.quantity }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${order.orderUser.userName }</div></td>
																<td><div align="center"></div></td>
																<td><div align="center">${comm.money }</div></td>
																<td><div align="center">好评</div></td>
															</tr>
														</c:forEach>
													</c:if>
												</c:forEach>
											</table>
										</div>
									</div>
								</div></td>
						</tr>
					</tbody>
				</table>
				<script language="JavaScript" type="text/javascript">
				//tab变换
				function nTabs(thisObj, Num, Value) {
					if (thisObj.className == "active1")
						return;

					//得到LI的父ID 后面会重组ID用到
					var tabObj = thisObj.parentNode.id;

					var tabList = document.getElementById(tabObj)
							.getElementsByTagName("li");
					for (i = 0; i < tabList.length; i++) {

						//重组ID项 li 父ID + "_"+数组的键值
						var tabOptions = tabObj + "_" + i;

						if (i == Num) {
							document.getElementById(tabOptions).style.display = 'block';
							thisObj.className = "active1";
						} else {
							document.getElementById(tabOptions).style.display = 'none';
							tabList[i].className = "normal1";
						}
					}
				}
			</script>
			</div>
		</c:if>
	</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

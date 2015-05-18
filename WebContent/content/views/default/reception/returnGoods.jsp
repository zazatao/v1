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
<link href="../content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
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
			<div class="Jiaoyi">
				<div class="biao">我是卖家&gt;交易管理&gt;买家退款退货</div>
				<div class="TabContent" id="myTab1_1"width: 780px;">
					<div class="pro">
						<table width="770" border="0" align="center" cellpadding="0"
							cellspacing="0" id="table1">
							<tr>
								<td width="190" height="30" bgcolor="#EEEEEE"><div
										align="center">商品</div></td>
								<td width="73" bgcolor="#EEEEEE"><div align="center">单价（元）</div></td>
								<td width="54" bgcolor="#EEEEEE"><div align="center">数量</div></td>
								<td width="57" bgcolor="#EEEEEE"><div align="center">重量</div></td>
								<td width="178" bgcolor="#EEEEEE"><div align="center">买家</div></td>
								<td width="74" bgcolor="#EEEEEE"><div align="center">状态</div></td>
								<td width="87" bgcolor="#EEEEEE"><div align="center">实收款（元）</div></td>
								<td width="57" bgcolor="#EEEEEE"><div align="center">评价</div></td>
							</tr>
							<c:forEach items="${list }" var="comm">
								<c:if
									test="${comm.status == 'refuse' || comm.status == 'cancel' || comm.status == 'delete' || comm.status == 'marriage'}">
									<tr>
										<td height="30"><div align="center">
										<c:if test="${sessionScope.language == 'chinese' }">${comm.nameOfGoods }</c:if>
										<c:if test="${sessionScope.language == 'russina' }">${comm.russinaNameOfGoods }</c:if>
										</div></td>
										<td><div align="center">${comm.price }</div></td>
										<td><div align="center">${comm.quantity }</div></td>
										<td><div align="center">${comm.weight }</div></td>
										<td><div align="center">${comm.orderNumber.orderUser.userName }</div></td>
										<td>
											<div align="center">
												<select
													onchange="updateCommStatus(this,'${comm.commodityID }');">
													<option value="refuse"
														<c:if test="${comm.status =='refuse'}">selected</c:if>>拒绝接受
														<option value="lack"
															<c:if test="${comm.status =='lack'}">selected</c:if>>缺货
															<option value="cancel"
																<c:if test="${comm.status =='cancel'}">selected</c:if>>取消交易
																<option value="delivery"
																	<c:if test="${comm.status =='delivery'}">selected</c:if>>交付
																	<option value="support"
																		<c:if test="${comm.status =='support'}">selected</c:if>>支持
																		<option value="sendOut"
																			<c:if test="${comm.status =='sendOut'}">selected</c:if>>派送
																			<option value="buyerNotPay"
																				<c:if test="${comm.status =='buyerNotPay'}">selected</c:if>>没有支付
																				<option value="lose"
																					<c:if test="${comm.status =='lose'}">selected</c:if>>丢失
																					<option value="inForwarding"
																						<c:if test="${comm.status =='inForwarding'}">selected</c:if>>在转发
																						<option value="paid"
																							<c:if test="${comm.status =='paid'}">selected</c:if>>已付
																							<option value="delete"
																								<c:if test="${comm.status =='delete'}">selected</c:if>>删除
																							
												</select>
											</div>
										</td>
										<td><div align="center">${comm.money }</div></td>
										<td><div align="center">好评</div></td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
						<table width="760" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="81" height="30" bgcolor="#EEEEEE"></td>
								<td width="70" bgcolor="#EEEEEE"></td>
								<td width="74" bgcolor="#EEEEEE"><div align="center"></div></td>
								<td width="112" bgcolor="#EEEEEE"><div align="center"></div></td>
								<td width="427" bgcolor="#EEEEEE"></td>
							</tr>
						</table>
						<script>
							function updateCommStatus(obj, commodityID) {
								if (confirm('您确定要更改该商品的状态么？')) {
									location.href = '../proscenium/updateCommStatus?id='
											+ commodityID
											+ "&status="
											+ obj.value;
								}
							}
						</script>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

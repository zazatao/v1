<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>验货入库</title>
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap-switch.css"
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
	src="../content/static/js/lib/strophe-custom-1.0.0.js"></script>
<script type="text/javascript" src="../content/static/js/lib/json2.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/easemob.im-1.0.4.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap-switch.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/highlight.js"></script>
<script type="text/javascript" src="../content/static/js/lib/main.js"></script>

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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="container-fluid">
					<div class="row-fluid">
						<div class="span12">
							<div>
								<font color="green" size="+2">${msg }</font>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									货物： <a href="../warehouse/jobAction"><span
										class="badge navbar-right">返回</span></a>
								</div>
								<table class="table table-bordered table-hover table-condensed">
									<thead>
										<tr>
											<th>订单</th>
											<th>货号(淘宝ID)</th>
											<th>买方</th>
											<th>二维码</th>
											<th>数量</th>
											<th>重量</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach var="commodity" items="${list }" varStatus="loop">
										<tbody>
											<tr class="success">
												<td>${commodity.orderNumber.orderFormID }</td>
												<td>${commodity.commItem }</td>
												<td>${commodity.orderNumber.orderUser.userName }</td>
												<td>${commodity.tpek }</td>
												<td>${commodity.quantity }</td>
												<td>${commodity.weight }</td>
												<td>
													<select onchange="checkData(this,${commodity.commodityID});">
														<option value="">----选择操作----
														<option value="senToWarehouse" <c:if test="${commodity.status =='senToWarehouse'}">selected</c:if>>送往库房
														<option value="refuse" <c:if test="${commodity.status =='refuse'}">selected</c:if>>拒绝入库
														<option value="lose" <c:if test="${commodity.status =='lose'}">selected</c:if>>丢失
														<option value="marriage" <c:if test="${commodity.status =='marriage'}">selected</c:if>>瑕疵品
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
												<td colspan="4">规格：${ys}&nbsp;${fn:replace(ortherSpec,',','&nbsp;')}</td>
											</tr>
											<tr>
												<td colspan="1">单价：&nbsp;${commodity.price }</td>
												<td colspan="1">数量：&nbsp;${commodity.quantity }</td>
												<td colspan="1">金额：&nbsp;${commodity.money }</td>
												<td>重量：&nbsp;${commodity.weight }</td>
												<td colspan="2">目前货品状态：&nbsp; <c:choose>
														<c:when test="${commodity.status =='unchanged'}">没有变化</c:when>
														<c:when test="${commodity.status =='cancel'}">取消交易</c:when>
														<c:when test="${commodity.status =='delete'}">删除</c:when>
														<c:when test="${commodity.status =='senToWarehouse'}">送往库房</c:when>
														<c:when test="${commodity.status =='refuse'}">拒绝入库</c:when>
														<c:when test="${commodity.status =='lose'}">丢失</c:when>
														<c:when test="${commodity.status =='inWarehouse'}">在库房中</c:when>
														<c:when test="${commodity.status =='marriage'}">交易中</c:when>
														<c:when test="${commodity.status =='lack'}">缺少货品</c:when>
														<c:when test="${commodity.status =='inAuctionlose'}">下单</c:when>
														<c:when test="${commodity.status =='delivery'}">交付</c:when>
														<c:when test="${commodity.status =='support'}">支持</c:when>
														<c:when test="${commodity.status =='sendOut'}">派送</c:when>
														<c:when test="${commodity.status =='buyerNotPay'}">买方没有支付</c:when>
														<c:when test="${commodity.status =='inCell'}">在格子</c:when>
														<c:when test="${commodity.status =='manualProcessing'}">手工加工</c:when>
														<c:when test="${commodity.status =='inForwarding'}">转发中</c:when>
														<c:when test="${commodity.status =='packing'}">打包</c:when>
														<c:when test="${commodity.status =='paid'}">已付</c:when>
														<c:when test="${commodity.status =='apiProcessing'}">API处理</c:when>
														<c:when test="${commodity.status =='waitingForTracking'}">等待的追踪</c:when>
													</c:choose>
												</td>
											</tr>
											<tr>
												<td colspan="2">采购员：&nbsp;${commodity.purchase.userName }</td>
												<td colspan="4">操作员：&nbsp;${commodity.storeOperator.userName }</td>
											</tr>
											<tr>
												<td rowspan="2" colspan="6">评论：&nbsp;</td>
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
		function checkData(obj,id){
			if (obj.value != '') {
				if(confirm('您确定要如此操作么？') ){
					location.href ='../warehouse/working?commodityID='+id+'&status='+obj.value;
				}
			}
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

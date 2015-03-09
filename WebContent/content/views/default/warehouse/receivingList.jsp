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
											<th>追踪</th>
											<th>数量</th>
											<th>重量</th>
											<th>状态</th>
											<th></th>
										</tr>
									</thead>
									<c:forEach var="value" items="${list }" varStatus="loop">
										<tbody>
											<tr class="success">
												<td>${value.orderNumber.orderFormID }</td>
												<td>${value.commItem }</td>
												<td>${value.orderNumber.orderUser.userName }</td>
												<td>${value.tpek }</td>
												<td>${value.quantity }</td>
												<td>${value.weight }</td>
												<td><c:choose>
														<c:when test="${value.status =='unchanged'}">没有变化</c:when>
														<c:when test="${value.status =='senToWarehouse'}">送往库房</c:when>
														<c:when test="${value.status =='refuse'}">拒绝入库</c:when>
														<c:when test="${value.status =='lose'}">丢失</c:when>
														<c:when test="${value.status =='inWarehouse'}">在库房中</c:when>
														<c:when test="${value.status =='marriage'}">瑕疵品</c:when>
													</c:choose></td>
												<td>
													<button class="btn btn-large btn-success" type="button"
														onclick="checkData(${value.commodityID});">入库</button>
												</td>
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
												<td colspan="12">操作员：&nbsp;${value.orderNumber.storeOperator.userName }</td>
											</tr>
											<tr>
												<td colspan="12">采购：&nbsp;${value.orderNumber.purchase.userName }</td>
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
		function checkData(id){
			if( confirm('您确定要将该货品入库吗？') ){
				location.href ='../warehouse/working?commodityID='+id;
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

<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户</title>
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
	<div class="panel panel-default" style="padding: 0; margin-top: 32px;">
		<div class="panel-heading">
			<h3 class="panel-title">
				<a href="javascript:void(0);" style="font-size: 18px;">管理</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span><a
					href="javascript:void(0);" style="font-size: 18px;">入驻商家<span
					class="badge navbar-right"></span></a>
			</h3>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<table class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>店名</th>
							<th>法人</th>
							<th>店铺性质</th>
							<th>所属地</th>
							<th>电话号码</th>
							<th>开店日期</th>			
							<th></th>			
						</tr>
					</thead>
<%-- 					<c:forEach var="personnel" items="${list }" varStatus="loop"> --%>
						<c:forEach var="shop" items="${list }" varStatus="loop">
						<tbody>
							<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
								<td align="center">${shop.shopName }</td>
								<td>${shop.juridicalPerson }</td>
								<td><c:if test="${shop.shopType == 'individual' }">个人开店</c:if><c:if test="${shop.shopType == 'company' }">企业开店</c:if></td>
								<td><c:if test="${shop.possession == 'HongKongAndMacao'}">香港/澳门</c:if>
								<c:if test="${shop.possession == 'Taiwan'}">台湾</c:if>
								<c:if test="${shop.possession == 'mainlandcChina'}">中国大陆</c:if>
								<c:if test="${shop.possession == 'Overseas'}">海外</c:if>
								</td>
								<td>${shop.phone }</td>
								<td>${shop.createDate }</td>	
								<td><button onclick="popupwindow('addBlack?id=${shop.id}&mathed=add&page=shop');">加入黑名单</button></td>	
							</tr>
						</tbody>
					</c:forEach>
<%-- 					</c:forEach> --%>
				</table>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function changeIsPermit(obj,id){
			var num = obj.value;
			location.href =	'management/updateIsPermit?id='+id+'&isPermit='+num;
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
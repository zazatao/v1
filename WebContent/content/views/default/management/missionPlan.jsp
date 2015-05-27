<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务计划</title>
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
<body >
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="javascript:void(0);" style="font-size: 18px;">管理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">任务计划</font></li>
				</ul>
			</div>
		</div>
	</div>
	<c:set var="personnel" value='<%=(Personnel)request.getSession().getAttribute("loginPersonnle") %>'></c:set>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							任务计划
							<c:if test="${personnel.departAndPositions.positions.positionid !=33 }">
								<a href="javascript:void(0);" onclick="popupwindow('management/addMissionPlan');"><span class="badge navbar-right" id="yunfei"><font size="3px;">添加&nbsp;&nbsp;+</font></span></a>
							</c:if>
						</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>任务编号</th>
									<th>任务名称</th>
									<th>任务发布者</th>
									<th>任务执行者</th>
									<th>任务用时</th>
									<th>截至日期</th>
									<th>任务完成度</th>
									<th>任务状态</th>
									<th>加速</th>
									<th>积极否</th>
									<th>备注</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="missionPlan" items="${list }" varStatus="pool">
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td>${missionPlan.id}</td>
									<td>${missionPlan.missionName}</td>
									<td>${missionPlan.fromPer.userName}</td>
									<td>${missionPlan.toPer.userName}</td>
									<td>${missionPlan.usingTime}
										<c:if test="${missionPlan.period == 'Minute'}">分钟</c:if>
										<c:if test="${missionPlan.period == 'Hours'}">小时</c:if>
										<c:if test="${missionPlan.period == 'Days'}">天</c:if>
										<c:if test="${missionPlan.period == 'Weeks'}">周</c:if>
										<c:if test="${missionPlan.period == 'Months'}">月</c:if>
									</td>
									<td>${missionPlan.endDate}</td>
									<td>${missionPlan.compLine}%</td>
									<td>
										<c:if test="${missionPlan.advState =='Finished' }">完成</c:if>
										<c:if test="${missionPlan.advState =='InProgress' }">进行中</c:if>
										<font color="red"><c:if test="${missionPlan.advState =='Unfinished' }">未完成</c:if></font>
									</td>
									<td>
										<input type="checkbox" name="accelerate" <c:if test="${missionPlan.accelerate == true }">checked</c:if>>
									</td>
									<td>
										<input type="checkbox" name="positiveOrNo" value="${missionPlan.positiveOrNo }" <c:if test="${missionPlan.positiveOrNo == 'Positive' }">checked</c:if>>
									</td>
									<td>
										${missionPlan.remarks }
									</td>
									<td>
										<button class="btn btn-default" onclick="popupwindow('management/updateMissionPlan?id=${missionPlan.id}');">修改</button>
										<button class="btn btn-default" onclick="deletePlan('management/deleteMissionPlan?id=${missionPlan.id}')">删除</button>
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteBlack(obj){
			location.href = "management/deleteTicket?id="+obj;
		}
		function deletePlan(obj){
			location.href = obj;
		}
		window.onunload = refreshParent;
		function refreshParent() {
			window.opener.location.reload();
		}
		function reloadData() {
			setTimeout(function() {
				window.location.reload();
			}, 1000);
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
		$(document).ready(function() {
			var len = "${count}" + "${count1}";
			for (var i = 0; i < len; i++) {
				var sendDate = "";
				if ($('#sendDate' + i).val() == '') {
					sendDate = new Date();
				} else {
					sendDate = getDate($('#sendDate' + i).val());
					sendDate = sendDate.valueOf();
					sendDate = new Date(sendDate);
				}
				var receiveDate = getDate($('#receiveDate' + i).val());
				receiveDate = receiveDate.valueOf();
				receiveDate = new Date(receiveDate);
				var a = (sendDate - receiveDate)
				var b = 24 * 60 * 60 * 1000;
				$('#reduce' + i).html(Math.ceil(a / b) + "天");
			}
		})
		function getDate(strDate) {
			var date = eval('new Date('
					+ strDate.replace(/\d+(?=-[^-]+$)/, function(a) {
						return parseInt(a, 10) - 1;
					}).match(/\d+/g) + ')');
			return date;
		}
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		function popupwindow(url) {
			var w = 1200;
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
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
<title>添加任务计划</title>
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
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<c:set var="personnel"
					value='<%=(Personnel) request.getSession().getAttribute(
						"loginPersonnle")%>'></c:set>
				<form class="form-horizontal" id="form" name="form" method="POST">
					<input type="hidden" name="id" value="${missionPlan.id }">
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">任务名称：</label>
						<div class="col-sm-3">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<input class="form-control" name="missionName"
									value="${missionPlan.missionName }">
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<input class="form-control" name="missionName"
									value="${missionPlan.missionName }" readonly="readonly">
							</c:if>
							<c:if test="${missionPlan == null }">
								<input class="form-control" name="missionName">
							</c:if>
						</div>
					</div>
					<c:if
						test="${missionPlan != null && missionPlan.fromPer.id == personnel.id}">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">任务执行者：</label>
							<div class="col-sm-3">
								<select name="dep" id="dep" class="form-control"
									onchange="depChange(this);">
									<option value="">选择部门
									<option value="${deps.departmentID }">${deps.departmentname }
										<c:forEach var="dep" items="${deps.children }">
											<option value="${dep.departmentID }">${dep.departmentname }
										</c:forEach>
								</select> <br>
							</div>
							<div class="col-sm-3">
								<select name="pos" id="pos" onchange="posChange(this);"
									class="form-control">
									<option value="">选择职位
								</select>
							</div>
						</div>
					</c:if>
					<c:if test="${missionPlan == null }">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">任务执行者：</label>
							<div class="col-sm-3">
								<select name="dep" id="dep" class="form-control"
									onchange="depChange(this);">
									<option value="">选择部门
									<option value="${deps.departmentID }">${deps.departmentname }
										<c:forEach var="dep" items="${deps.children }">
											<option value="${dep.departmentID }">${dep.departmentname }
										</c:forEach>
								</select> <br>
							</div>
							<div class="col-sm-3">
								<select name="pos" id="pos" onchange="posChange(this);"
									class="form-control">
									<option value="">选择职位
								</select>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"><c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id}">任务执行者：</c:if></label>
						<div class="col-sm-3" id="per">
							<c:if test="${missionPlan != null}">${missionPlan.toPer.userName }
								<input name="persName" type="hidden"
									value="${missionPlan.toPer.id }">
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">任务用时：</label>
						<div class="col-sm-2">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<input type="text" name="usingTime" onclick="checkvalue(this);"
									class="form-control" value="${missionPlan.usingTime }">
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<input type="text" name="usingTime" class="form-control"
									value="${missionPlan.usingTime }" readonly="readonly">
							</c:if>
							<c:if test="${missionPlan == null }">
								<input type="text" name="usingTime" class="form-control"
									onclick="checkvalue(this);">
							</c:if>
						</div>
						<div class="col-sm-2">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<select class="form-control" name="periods">
									<option value="Minute"
										<c:if test="${missionPlan.period == 'Minute'}">selected</c:if>>分钟
									
									<option value="Hours"
										<c:if test="${missionPlan.period == 'Hours'}">selected</c:if>>小时
									
									<option value="Days"
										<c:if test="${missionPlan.period == 'Days'}">selected</c:if>>天
									
									<option value="Weeks"
										<c:if test="${missionPlan.period == 'Weeks'}">selected</c:if>>周
									
									<option value="Months"
										<c:if test="${missionPlan.period == 'Months'}">selected</c:if>>月
									
								</select>
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<select class="form-control" name="periods" disabled="disabled">
									<option value="Minute"
										<c:if test="${missionPlan.period == 'Minute'}">selected</c:if>>分钟
									
									<option value="Hours"
										<c:if test="${missionPlan.period == 'Hours'}">selected</c:if>>小时
									
									<option value="Days"
										<c:if test="${missionPlan.period == 'Days'}">selected</c:if>>天
									
									<option value="Weeks"
										<c:if test="${missionPlan.period == 'Weeks'}">selected</c:if>>周
									
									<option value="Months"
										<c:if test="${missionPlan.period == 'Months'}">selected</c:if>>月
									
								</select>
							</c:if>
							<c:if test="${missionPlan == null }">
								<select class="form-control" name="periods">
									<option value="Minute">分钟
									<option value="Hours">小时
									<option value="Days">天
									<option value="Weeks">周
									<option value="Months">月
								</select>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">截至日期：</label>
						<div class="col-sm-3">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<input type="text" id="endDate" name="endDate"
									onclick="dateInfoxxx('endDate')" class="form-control"
									value="${missionPlan.endDate }">
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<input type="text" id="endDate" name="endDate"
									onclick="dateInfoxxx('endDate')" readonly="readonly"
									class="form-control" value="${missionPlan.endDate }">
							</c:if>
							<c:if test="${missionPlan == null }">
								<input type="text" id="endDate" name="endDate"
									onclick="dateInfoxxx('endDate')" class="form-control">
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">备注：</label>
						<div class="col-sm-5">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<textarea rows="3" cols="70" name="remarks">${missionPlan.remarks }</textarea>
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<textarea rows="3" cols="70" name="remarks" readonly="readonly">${missionPlan.remarks }</textarea>
							</c:if>
							<c:if test="${missionPlan == null }">
								<textarea rows="3" cols="70" name="remarks"></textarea>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label">提醒加速：</label>
						<div class="col-sm-3">
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
								<input type="checkbox" name="accelerate" value="true"
									<c:if test="${missionPlan.accelerate == true }">checked</c:if>>
							</c:if>
							<c:if
								test="${missionPlan != null && missionPlan.fromPer.id != personnel.id }">
								<input type="checkbox" name="accelerate" value="true"
									disabled="disabled"
									<c:if test="${missionPlan.accelerate == true }">checked</c:if>>
							</c:if>
							<c:if test="${missionPlan == null }">
								<input type="checkbox" name="accelerate" value="true">
							</c:if>
						</div>
					</div>
					<c:if
						test="${missionPlan != null && missionPlan.fromPer.id == personnel.id }">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">完成度：</label>
							<div class="col-sm-3">
								<input type="text" name="compLine"
									value="${missionPlan.compLine }">%
							</div>
							<label for="inputEmail3" class="col-sm-1 control-label">积极否：</label>
							<div class="col-sm-3">
								<select class="form-control" name="positiveOrNo">
									<option value="Positive"
										<c:if test="${missionPlan.positiveOrNo == 'Positive'}">selected</c:if>>积极地
									
									<option value="NotPositive"
										<c:if test="${missionPlan.positiveOrNo == 'NotPositive'}">selected</c:if>>不积极
									
								</select>
							</div>
						</div>
					</c:if>
					<c:if test="${missionPlan != null }">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">状态：</label>
							<div class="col-sm-3">
								<select class="form-control" name="advStates">
									<option value="Finished"
										<c:if test="${missionPlan.advState == 'Finished'}">selected</c:if>>完成
										<c:if
											test="${missionPlan.fromPer.id == personnel.id }">
											<option value="Unfinished"
												<c:if test="${missionPlan.advState == 'Unfinished'}">selected</c:if>>未完成
											
										</c:if>
											<option value="InProgress"
												<c:if test="${missionPlan.advState == 'InProgress'}">selected</c:if>>进行中
								</select>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-default"
								onclick="addPlan();">确认提交</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		function depChange(obj) {
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : 'getShopCategory/getPositions?depID=' + obj.value,
				dataType : 'json',
				success : function(data) {
					if (data.success == 'true') {
						var pos = document.getElementById('pos');
						var numd = pos.options.length;
						for (i = numd - 1; i >= 0; i--) {
							pos.remove(i);
						}
						var objOption = new Option("选择职位", "");
						pos.options[pos.options.length] = objOption;
						$.each(data.list, function(i, position) {
							var objOption = new Option(position.positionname,
									position.positionid);
							pos.options[pos.options.length] = objOption;
						});
					}
				}
			});
		}
		function posChange(obj) {
			jQuery
					.ajax({
						type : 'GET',
						contentType : 'application/json',
						url : 'getShopCategory/getPersonnel?posID='
								+ obj.value + "&depID=" + $('#dep').val(),
						dataType : 'json',
						success : function(data) {
							if (data.success == 'true') {
								$('#per').html("");
								var $guige2 = "";
								$
										.each(
												data.personnels,
												function(i, pers) {
													$guige2 = $guige2
															+ "<input type='checkbox' name='persName' value='"+pers.id+"'>"
															+ pers.userName
															+ "&nbsp;";
												});
								$('#per').append($guige2);
							}
						}
					});
		}
		window.onunload = refreshParent;
		function refreshParent() {
			window.opener.location.reload();
		}
		function addPlan() {
			document.form.action = "management/planAcitve";
			document.form.submit();
			window.onunload = refreshParent;
		}
		function closeAndRefresh() {
			window.onunload = refreshParent;
			self.close();
			return true;
		}
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
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
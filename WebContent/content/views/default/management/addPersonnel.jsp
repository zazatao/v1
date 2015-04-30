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
<title>员工</title>

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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal"  id="form" name="form" method="POST">
					<div class="form-group">
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写登录名</label>
							<input type="hidden" name="id" value="${id }">	
							<div class="col-sm-8">
							<input id="loginName"  class="form-control" name="loginName">${personnel.loginName}
							</div>	
						</c:if>
					</div>
					<div class="form-group">
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写密码</label>
							<input type="hidden" name="id" value="${id }">	
							<div class="col-sm-8">
							<input id="password" class="form-control" name="password">${personnel.password}
							</div>								
						</c:if>
					</div>

					<div class="form-group">
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写用户名</label>
							<input type="hidden" name="id" value="${id }">	
							<div class="col-sm-8">
							<input id="userName" class="form-control" name="userName">${personnel.userName}
							</div>								
						</c:if>
					</div>

					<div class="form-group">
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写性别</label>
							<input type="hidden" name="id" value="${id }">	
							<div class="col-sm-8">
							<input id="sex" class="form-control" name="sex">${personnel.sex}
							</div>								
						</c:if>
					</div>
				
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改电话</label>
							<input type="hidden" name="id" value="${personnel.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写电话</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="phone" class="form-control" name="phone" value="${personnel.phone}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改邮件</label>
							<input type="hidden" name="id" value="${personnel.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写邮件</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="email"  class="form-control" name="email" value="${personnel.email}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改完成订单数</label>
							<input type="hidden" name="id" value="${personnel.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写完成订单数</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="accomplishNum"  class="form-control" name="accomplishNum" value="${personnel.accomplishNum}">
						</div>
					</div>	
						
					<div class="form-group">
						<div class="col-sm-3">
							<select name="department_id" id="department_id" class="form-control" onchange="depChange(this);">
								<option value="0">选择部门
								<c:forEach var="department" items="${departmentlist }">
								<option value="${department.departmentID }">${department.departmentname }</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-sm-3">
							<select name="position_id" id="position_id"  class="form-control">
								<option value="0">选择职位 
								<c:forEach var="position" items="${poss }">
									<option value="0">选择职位 
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
							<button type="button" class="btn btn-default" onclick="addPersonnel('${mathed}');">
							<c:if test="${mathed == 'add'}">加入员工</c:if>
							<c:if test="${mathed == 'update'}">修改员工</c:if>
							</button>
						</div>
					</div>
					</form>
					</div>
					</div>
			</div>
	<script type="text/javascript">
		window.onunload = refreshParent;
		function refreshParent() {
			window.opener.location.reload();
		}
		
		function addPersonnel(obj){
			document.form.action="./addPersonnelList?page=${page}&mathed="+obj;
			document.form.submit();
			return closeAndRefresh();
		}
		function closeAndRefresh() {
			window.onunload = refreshParent;
			self.close();
			return true;
		}
		function depChange(obj){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : '../getShopCategory/getPositions?depID='+obj.value,
				dataType : 'json',
				success : function(data) {
					if(data.success == 'true'){
						var pos = document.getElementById('position_id');
						var numd = pos.options.length;
						for (i = numd - 1; i >= 0; i--) {
							pos.remove(i);
						}
						var objOption = new Option("选择职位", "0");
						pos.options[pos.options.length] = objOption;
						$.each(data.list, function(i, position) {
							var objOption = new Option(position.positionname ,
									position.positionid);
							pos.options[pos.options.length] = objOption;
						});
					}
				}
			});
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
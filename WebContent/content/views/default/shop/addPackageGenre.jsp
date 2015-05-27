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
<title>材料</title>
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
				<form class="form-horizontal"  id="form" name="form" method="POST">
					<div class="form-group">
						<c:if test="${mathed == 'add'}">
						<label for="inputEmail3" class="col-sm-2 control-label">选择材料类型</label>
						<input type="hidden" name="id" value="${id }">
						<div class="col-sm-3">
							<select name="packageSize_id" id="packageSize_id" class="form-control">
								<c:forEach var="size" items="${sizes }">
								<option value="${size.sizeID }">${size.genre }</option>
								</c:forEach>
							</select>
						</div>
						</c:if>
					</div>
				
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改数量</label>
							<input type="hidden" name="id" value="${material.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写数量</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="num" class="form-control" name="num" value="${material.num}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改价格</label>
							<input type="hidden" name="id" value="${material.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写价格</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="price"  class="form-control" name="price" value="${material.price}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${mathed == 'update'}">
							<label for="inputEmail3" class="col-sm-2 control-label">修改规格</label>
							<input type="hidden" name="id" value="${material.id }">							
						</c:if>
						<c:if test="${mathed == 'add'}">
							<label for="inputEmail3" class="col-sm-2 control-label">填写规格</label>
							<input type="hidden" name="id" value="${id }">															
						</c:if>
						<div class="col-sm-8">
							<input id="attribute"  class="form-control" name="attribute" value="${material.attribute}">
						</div>
					</div>	

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
							<button type="button" class="btn btn-default" onclick="addMaterial('${mathed}');">
							<c:if test="${mathed == 'add'}">加入材料</c:if>
							<c:if test="${mathed == 'update'}">修改材料</c:if>
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
		
		function addMaterial(obj){
			document.form.action="shop/addMaterialList?id=${material.id}&page=${page}&mathed="+obj;
			document.form.submit();
			return closeAndRefresh();
		}
		function closeAndRefresh() {
			window.onunload = refreshParent;
			self.close();
			return true;
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
<%@ page import="java.util.Date"%>
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
	href="content/static/img/apple-touch-icon-144-precomposed.png"/>
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="content/static/img/apple-touch-icon-114-precomposed.png"/>
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="content/static/img/apple-touch-icon-72-precomposed.png"/>
<link rel="apple-touch-icon-precomposed"
	href="content/static/img/apple-touch-icon-57-precomposed.png"/>
<link rel="shortcut icon" href="content/static/img/favicon.png"/>
<script type="text/javascript"
	src="content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="content/static/js/lib/bootstrap.min.js"></script>

<script type="text/javascript"
	src="content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet"/>
<link href="content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet"/>
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
					<li><a href="#" style="font-size: 18px;">商店</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><a href="#"><font style="font-size: 18px;">经济核算</font></a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">材料</font></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							材料列表
							<a href="javascript:void(0);"  onclick="popupwindow('shop/addMaterial?mathed=add');">
							<span class="badge navbar-right" id="add"><font size="3px;">添加&nbsp;&nbsp;+</font></span></a>
						</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>类型</th>
									<th>数量</th>
									<th>价格</th>
									<th>规格</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="material" items="${materiallist }" varStatus="pool">
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td>${material.packageSize.genre}</td>									
									<td>${material.num}</td>	
									<td>${material.price}</td>
									<td>${material.attribute}</td>
									<td><button class="btn btn-default" onclick="popupwindow('shop/addMaterial?id=${material.id}&mathed=update');">修改</button>
										<button class="btn btn-default" onclick="deleteMaterialById('${material.id}');" >删除</button>
									</td>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function deleteMaterialById(obj){
 			location.href = "shop/deleteMaterial?id="+obj;
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
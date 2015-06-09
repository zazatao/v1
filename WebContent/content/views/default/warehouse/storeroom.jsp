<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>库房</title>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<link href="content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="content/static/css/datetime/jquery.datetimepicker.css"
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
<script type="text/javascript"
	src="content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="content/static/js/lib/scripts.js"></script>
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
				<a href="#" style="font-size: 18px;">仓库</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">库房</font>
					<a href="warehouse/addStoreroom" style="font-size: 18px;">
					<span class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<form class="form-horizontal" action="warehouse/searchStoreroom"
					method="POST">
					<div class="form-group">
						<div class="col-sm-1">
							<input type="text" name="cellStr" placeholder="库房编号"
								class="form-control" id="cellStr"  >
						</div>
						<div class="col-sm-1">
							<input type="text" name="user" placeholder="用户"
								class="form-control" id="user" >
						</div>
						<div class="col-sm-1">
							<select class="form-control" name="isInCell" id="isInCell"
								placeholder="状态">
								<option value="">-----状态-----</option>
							    <option value="false"  >未被使用</option>
					            <option value="true"  >已被使用</option>
							</select>															
						</div>
						<div class="col-sm-1">
							<input type="submit" value="搜索" class="btn btn-default">
						</div>
					</div>
				</form>
				<table id="yourTableID" class="table table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<th>单元格编号</th>
							<th>用户名</th>
						    <th>状态</th>
						</tr>
					</thead>
					<c:forEach var="storeroom" items="${storerooms}">
						<tbody>
						    <tr>
							<th>${storeroom.cellStr}</th>
							<th>${storeroom.user.userName }</th>
							<c:if test="${storeroom.isInCell=='true'}">
							    <th>已被使用</th>
							</c:if>
						   <c:if test="${storeroom.isInCell=='false'}">
							    <th>未被使用</th>
							</c:if>
						   </tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>

	<jsp:include page="../common/delModelBox.jsp"></jsp:include>
	<script type="text/javascript">
	    $("#user").blur(function(){
	    	  var value=$(this).val();
	    	  if(value!=''){
	    		    var sta="已被使用";
	    		     $('#isInCell option:contains(' + sta + ')').each(function(){
	    		    	 if ($(this).text() == sta) {
                                $(this).attr('selected', true);
                                $("#isInCell").attr("disabled",true);
	    		    	 }
	    		     })
	    	 }else{
	    		 $("#isInCell").attr("disabled",false);
	    	 }
	    });
	    $("#isInCell").change(function(){
	    	 var text=$(this).find("option:selected").text(); 
	    	 if(text=="未被使用"){
	    		   $("#user").attr("disabled",true);
	    	 }else{
	    		  $("#user").attr("disabled",false);
	    	 }
        });
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

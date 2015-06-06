<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品类别管理</title>
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
<link href="content/static/css/bootstrap/bootstrap-tree.css"
	rel="stylesheet">
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="javascript:void(0);" style="font-size: 18px;">管理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><a href="javascript:void(0);" style="font-size: 18px;"><font style="font-size: 18px;">商品</font></a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">商品品牌</font></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-5 column" style="width:1224px;">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					商品品牌
				</h3>
				
			</div>
			     <ul style="list-style: none;margin-top: 20px;">
				    <li style="float: left;margin-right: 120px;font-size:20px;font-weight: bold;">品牌名称</li>
				    <li style="float: left;margin-right: 200px;font-size:20px;font-weight: bold;">官网地址</li>
				    <li style="float: left;margin-right: 0px;font-size:20px;font-weight: bold;">品牌Logo</li>
				 </ul>
				 <br/>
				  <ul style="list-style: none;margin-top: 20px;">
				         <c:forEach items="${brands}" var="brand">
				             <li style="float: left;margin-right: 120px;font-size:20px;">${brand.brandName }</li>
				              <li style="float: left;margin-right: 120px;font-size:20px;"><a href="${brand.website }">${brand.website }</a></li>
                              <li style="float: left;margin-right: 0px;font-size:20px;"><img alt="" src="${brand.logo }"/></li>
                              <br/>                     
				         </c:forEach>
				 </ul>
	
		</div>
	</div>
	<div class="col-md-7 column"  style="width:650px;float: right">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">操作&nbsp;>&nbsp;</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<br>
					  <form id="brandform" action="management/addBrand" method="post" enctype="multipart/form-data">
                          <label  for="bName">品牌名称</label>
                          <input type="text" id="bName" name="brandName"/>
                          <br/><br/>
                          <label for="website">官网地址</label>
                          <input type="text" id="website" name="website"/>
                          <br/><br/>
                          <label for="website">LOGO</label>
                          <input type="file" id="imageFile" name="imageFile"/>
                          <br/><br/>
                          <input type="submit" name="submit" value="品牌添加"/>
                        </form>  
				</P>
			</div>
		</div>
	</div>

</body>
</html>
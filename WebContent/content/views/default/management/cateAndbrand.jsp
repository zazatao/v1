<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品类别品牌管理</title>
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
					<li><font style="font-size: 18px;">商品分类</font></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-md-5 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					商品分类
				</h3>
			</div>
			<div class="tree well">
				<c:set var="index" value="0" scope="request" />
				<!-- 自增序号，注意scope-->
				<c:set var="level" value="0" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:import url="__shopCategory.jsp" />
			</div>
		</div>
	</div>
	<div class="col-md-7 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">操作&nbsp;>&nbsp;<a href="javascript:void(0);">${category.category }</a></h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<br>
					<form class="form-horizontal" action="management/saveBrandAndCate"  id="form" name="form" 
						method="POST">
						<div class="form-group">
							<label class="col-sm-2 control-label">上级商品类别:</label>
							<c:if test="${category.level != null }">
								<label class="col-sm-2 control-label">${category.parentLevel.category }</label>
							</c:if>
							<br>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">商品类别名称:</label> 
							<div class="col-sm-8">
							<input id="categoryID" name="categoryID" value="${category.categoryID }" type="hidden">
								<input name="category" class="form-control"
									value="${category.category }"> <br>
							</div>
						</div>
						         <label id="brand"  style="margin-left: 60px;">品牌选择：</label>
							        <c:forEach items="${brands }" var="brand">
							       	 	<c:set var="isok" value="false"></c:set>
							        	<c:forEach items="${category.brands }" var="br">
							        		<c:if test="${br.brandName == brand.brandName }">
							        			<c:set var="isok" value="true"></c:set>
							        		</c:if>
							        	</c:forEach>
							             <input name="brand" value="${brand.brandID }" <c:if test="${ isok}">checked</c:if>  type="checkbox" class="check">${brand.brandName }
							        </c:forEach>
							        <br/>
							         <label id="specification"  style="margin-left: 60px;">规格选择：</label>
							           <c:forEach items="${specifications}" var="specification">
							                    <c:set var="isok1" value="false"></c:set>
							                    <c:forEach items="${category.specifications }" var="cs">
							                        <c:if test="${cs.id==specification.id}">
							        			        <c:set var="isok1" value="true"></c:set>
							        		         </c:if>	
							                    </c:forEach>
							             <input name="specification" value="${specification.id }" <c:if test="${isok1}">checked</c:if> type="checkbox" class="check">${specification.specificatName }
							        </c:forEach>
							        <br/>
							    <input type="submit" value="提交"  >    
					</form>
				</P>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		function onclickID(id) {
			location.href = 'management/getCate?categoryID=' + id;
		}
		$(function() {
			$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr(
					'title', 'Collapse this branch');
			$('.tree li.parent_li > span').on(
					'click',
					function(e) {
						var children = $(this).parent('li.parent_li').find(
								' > ul > li');
						if (children.is(":visible")) {
							children.hide('fast');
							$(this).attr('title', 'Expand this branch').find(
									' > i').addClass('icon-plus-sign')
									.removeClass('icon-minus-sign');
						} else {
							children.show('fast');
							$(this).attr('title', 'Collapse this branch').find(
									' > i').addClass('icon-minus-sign')
									.removeClass('icon-plus-sign');
						}
						e.stopPropagation();
					});
		});
	</script>
</body>
</html>
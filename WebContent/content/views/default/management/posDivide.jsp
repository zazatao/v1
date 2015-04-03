<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>部门管理</title>
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
<script type="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="../content/static/css/bootstrap/bootstrap-tree.css"
	rel="stylesheet">
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">管理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">角色员工分配</font>
				</ul>
			</div>
		</div>
	</div>
	<form action="./posRoleDivide" method="post">
	<div class="col-md-5 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">组织机构</h3>
			</div>
			<div class="tree well">
				<c:set var="index" value="0" scope="request" />
				<!-- 自增序号，注意scope-->
				<c:set var="level" value="0" scope="request" />
				<!-- 记录树的层次，注意scope-->
				<c:import url="__department.jsp" />
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">机构角色</h3>
				</div>
				<div style="padding-top: 28px; padding-bottom: 28px;">
					<label for="inputSex" class="col-sm-2 control-label">选择角色</label>
					<c:forEach items="${treeList2 }" var="pos">
						<input type="radio" style="width: 18px;" name="pos"
							value="${pos.positionid }">${pos.positionname }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-7 column">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					操作
					<button type="submit" class="badge navbar-right">变更职位</button>
				</h3>
			</div>
			<div class="list-group-item">
				<p class="list-group-item-text">
					<table class="table table-striped"><tr>
						<th>选择</th>
						<th>员工姓名</th>
						<th>所属部门</th>
						<th>职位角色</th>
						<th>电话</th>
					</tr>
					
					<c:forEach var="personnel" items="${personnels }" varStatus="loop">
						<c:choose>
							<c:when test="${loop.index%2==0 }">
								<tr>
							</c:when>
							<c:otherwise>
								<tr class="success">
							</c:otherwise>
						</c:choose>
							<td><input value="${personnel.id }" type="checkbox" name="checkID"></td>
							<td>${personnel.userName }</td>
							<td>${personnel.department.departmentname }</td>
							<td>
								<input type="hidden" name="departID" value="${department.departmentID }">
								<c:forEach items="${personnel.positions }" var="pos">
									${pos.positionname }&nbsp;&nbsp;
								</c:forEach>
							</td>
							<td>${personnel.phone }</td>
						</tr>
						</c:forEach>
					</table>
				</P>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">
		function onclickID(id) {
			location.href = './getDepartment?departmentId=' + id
					+ "&page=posDivide";
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
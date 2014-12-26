<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收货</title>
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
</head>
<style type="text/css">
th {
	text-align: center;
}
</style>
<body>

	<!-- Static navbar -->
	<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">总览<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">订单处理 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">仓库 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="../warehouse/receiving">收货</a></li>
						<li><a href="../warehouse/warehousing">验货入库</a></li>
						<li><a href="#">回收站</a></li>
						<li><a href="#">在途订单</a></li>
						<li><a href="#">称量</a></li>
						<li><a href="#">发送包裹</a></li>
						<li><a href="#">运费</a></li>
						<li><a href="#">成批发货</a></li>
						<li><a href="#">统计库房工作人员情况</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">转发 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">商店 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">管理 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">统计 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li class="dropdown-header">Nav header</li>
						<li><a href="#">Separated link</a></li>
						<li><a href="#">One more separated link</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><%=((User) request.getSession().getAttribute("loginUser"))
					.getUserName()%></a></li>
				<li><a href="../user/logout">退出</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid --> </nav>
	<br>
	<br>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<button class="btn btn-mini btn-success" type="button">编辑</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button class="btn btn-mini btn-success" type="button">内部聊天</button>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<c:forEach var="comm" items="${commodity }" varStatus="loop">
					<div class="panel-group" id="panel-864199${loop.index }">
						<div class="panel panel-default">
							<div class="panel-heading">
								<a class="panel-title collapsed" data-toggle="collapse"
									data-parent="#panel-864199${loop.index }"
									href="#panel-element-689950${loop.index }"> 格子：${comm.key }&nbsp;&nbsp;订单数：${fn:length(comm.value ) }
								</a>
							</div>
						</div>
						<div id="panel-element-689950${loop.index }"
							class="panel-collapse in">
							<div class="container-fluid">
								<div class="row-fluid">
									<div class="span12">
										<table
											class="table table-bordered table-hover table-condensed">
											<thead>
												<tr>
													<th>格子</th>
													<th>包</th>
													<th>订单</th>
													<th>货号</th>
													<th>买方</th>
													<th>追踪</th>
													<th>数量</th>
													<th>价格</th>
													<th>金额</th>
													<th>重量</th>
													<th>在格子</th>
													<th>进入仓库</th>
													<th>状态</th>
												</tr>
											</thead>
											<c:forEach var="value" items="${comm.value }"
												varStatus="loop">
												<tbody>
													<tr class="success">
														<td align="center">${value.storeRoom.cellStr }</td>
														<td>${value.storeRoom.packageNum }</td>
														<td>${value.orderNumber.orderFormID }</td>
														<td>${value.commItem }</td>
														<td>${value.orderNumber.orderUser.userName }</td>
														<td>${value.tpek }</td>
														<td>${value.quantity }</td>
														<td>${value.price }</td>
														<td>${value.money }</td>
														<td>${value.weight }</td>
														<td><c:if test="${value.storeRoom.isInCell=='true' }">已用</c:if>
														</td>
														<td><c:if
																test="${value.storeRoom.isInStoreRoom=='true' }">已入库</c:if>
														</td>
														<td><c:choose>
																<c:when test="${value.status =='unchanged'}">没有变化</c:when>
																<c:when test="${value.status =='toWarehouse'}">送往库房</c:when>
																<c:when test="${value.status =='refuse'}">拒绝入库</c:when>
																<c:when test="${value.status =='lose'}">丢失</c:when>
																<c:when test="${value.status =='inWarehouse'}">在库房中</c:when>
																<c:when test="${value.status =='transaction'}">交易中</c:when>
															</c:choose></td>
													</tr>
													<tr>
														<td rowspan="5" height="140px;" width="140px;"><c:if
																test="${value.imagePaths[0].path !=null}">
																<img height="140px;" width="140px;"
																	src="..${value.imagePaths[0].path}">
															</c:if></td>
														<td colspan="12">颜色：&nbsp;${value.color }&nbsp;&nbsp;&nbsp;&nbsp;尺码：&nbsp;${value.size }</td>
													</tr>
													<tr>
														<td colspan="12">操作员：&nbsp;${value.storeOperator.userName }</td>
													</tr>
													<tr>
														<td colspan="12">采购：&nbsp;${value.purchase.userName }</td>
													</tr>
													<tr>
														<td colspan="12">重量：&nbsp;${value.weight }</td>
													</tr>
													<tr>
														<td colspan="12">评论：&nbsp;${value.comment  }</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		
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
<%@page import="com.yc.entity.user.Personnel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<title>开始工作</title>
</head>
<body>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<c:if test="${msg!='' }">
							<font color="green" size="+2">${msg }</font>
						</c:if>
						<div class="tabbable" id="tabs-323194">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#panel-707179"
									data-toggle="tab">搜索</a></li>
								<li><a href="#panel-181560" data-toggle="tab">不明货品</a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="panel-707179">
									<div class="col-md-12 column">
									<br>
										<form action="enterStoreRoom" method="POST">
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">条形码</label>
												<div class="col-sm-10">
													<input type="text" name="tpek" class="form-control"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">订单号</label>
												<div class="col-sm-10">
													<input type="text" name="orderNum" class="form-control"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">淘宝网上的交易号</label>
												<div class="col-sm-10">
													<input type="text" name="transNumForTaobao"
														class="form-control"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">
													货号</label>
												<div class="col-sm-10">
													<input type="text" name="commItem" class="form-control"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-12 control-label">&nbsp;&nbsp;&nbsp;&nbsp;<input
													type="checkbox" checked="checked" />自动打印条码</label>
											</div>
											<br><br><br><br>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10"
													style="text-align: center;">
													<button type="submit" class="btn btn-default">搜索</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-default"
														onclick="cancel()">休息</button>
												</div>
											</div>
										</form>
									</div>
								</div>
								<div class="tab-pane" id="panel-181560">
									<div class="col-md-12 column">
									<br>
										<form action="saveUnKnownCommodity" method="POST">
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">代码</label>
												<div class="col-sm-10">
													<input type="text" name="code" class="form-control" readonly="readonly" value="${unKnownComm.code }"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">操作员</label>
												<div class="col-sm-10">
													<input type="text" name="operatorUser" class="form-control" readonly="readonly" value="<%=((Personnel) request.getSession().getAttribute("loginUser")).getUserName()%>"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">数量</label>
												<div class="col-sm-10">
													<input type="text" name="amountNum"
														class="form-control" value="${unKnownComm.amountNum }"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">
													类别</label>
												<div class="col-sm-10">
													<input type="text" name="category" class="form-control" value="${unKnownComm.category }"><br>
												</div>
											</div>
											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">
													评论</label>
												<div class="col-sm-10">
													<textarea rows="2" cols="10" name="comment" class="form-control">${unKnownComm.comment }</textarea>
												</div>
											</div>
											<c:if test="${images !=null}">
											<div class="form-group">
												<div class="col-sm-12">
													<c:forEach items="${images }" var="image">
														<img src="..${image.path}" width="100px;" height="100px;">
													</c:forEach>
												</div>
											</div>
											</c:if>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10"
													style="text-align: center;">
													<button type="button" class="btn btn-default" onclick="saveUnknow();">创建</button>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-default" onclick="popupwindow('../warehouse/imageUplode');">照片上传</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<button type="button" class="btn btn-default" >删除</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
				function saveUnknow(){
					$("form").submit();
				}
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
					window.opener = null;
					window.open('', '_self');
					window.close();
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
				function cancel() {
					if (confirm("您确定要取消并关闭本页吗？")) {
						window.opener = null;
						window.open('', '_self');
						window.close();
					} 
				}
				</script>
			</div>
		</div>
	</div>
</body>
</html>

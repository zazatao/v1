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
					<li><a href="javascript:void(0);" style="font-size: 18px;">商店</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><a href="javascript:void(0);"><font style="font-size: 18px;">经济核算</font></a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">材料</font></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
			<form class="form-horizontal" action="shop/searchMaterialResult" method="POST">
			<div class="form-group">
				<div class="col-sm-2">
					<input type="text" name="type" class="form-control"
						id="type" value="" placeholder="材料类型" >
				</div>				
				<div class="col-sm-2">
					<input type="text" name="standard" class="form-control"
						id="standard" value="" placeholder="规格" >
				</div>
				<div class="col-sm-2">
					<button type="submit" class="btn btn-default">查询</button>
				</div>
			</div>
		</form>
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
							<a href="javascript:void(0);" onclick="popupwindow('shop/addMaterial?mathed=add');">
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
									<td>${material.type}</td>
									<td>${material.num}</td>	
									<td>${material.price}</td>
									<td>${material.standard}</td>	
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
		
		 function addMaterial(obj){
			document.form.action="shop/addMaterial?mathed="+obj;
			document.form.submit();
			return closeAndRefresh(); 
		 }
		
		window.onunload = refreshParent;
		function refreshParent() {
			window.opener.location.reload();
		}
		function reloadData() {
			setTimeout(function() {
				window.location.reload();
			}, 1000);
		}
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
				timepicker : false,
				format : 'Y-m-d',
				formatDate : 'Y-m-d',
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
			var w = 1200;
			var h = 800;
			var title = "促销码";
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
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
<title>广告</title>

<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
<script src="../content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../content/static/img/apple-touch-icon-144-precomposed.png"/>
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../content/static/img/apple-touch-icon-114-precomposed.png"/>
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../content/static/img/apple-touch-icon-72-precomposed.png"/>
<link rel="apple-touch-icon-precomposed"
	href="../content/static/img/apple-touch-icon-57-precomposed.png"/>
<link rel="shortcut icon" href="../content/static/img/favicon.png"/>
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet"/>
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet"/>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
</head>
<body >
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">管理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><a href="#"><font style="font-size: 18px;">内容</font></a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">广告</font></li>
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
							广告列表
							<a href="#" onclick="popupwindow('./showAddAdvertisement');">
							<span class="badge navbar-right" id="add"><font size="3px;">添加&nbsp;&nbsp;+</font></span></a>
						</h3>
					</div>
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>所在页面</th>
									<th>所在页面的位置</th>
									<th>图片</th>
									<th>链接</th>
									<th>收入</th>
									<th>支出</th>
									<th>起始时间</th>
									<th>持续时间(天)</th>
									<th>是否到期</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="advertisement" items="${adverlist }" varStatus="loop">
									<c:set var="count" value="${fn:length(adverlist) }" ></c:set>
									<c:choose>
										<c:when test="${loop.index%2==0 }">
											<tr>
										</c:when>
										<c:otherwise>
											<tr class="success">
										</c:otherwise>
									</c:choose>
									<td>
									<c:if test="${advertisement.adverDistribution.whichPage == 'homePage'}">首页</c:if>
									<c:if test="${advertisement.adverDistribution.whichPage == 'innerPage'}">内页</c:if>
									<c:if test="${advertisement.adverDistribution.whichPage == 'detailPage'}">详情页</c:if>
									<c:if test="${advertisement.adverDistribution.whichPage == 'carPage'}">汽车用具</c:if>
									<c:if test="${advertisement.adverDistribution.whichPage == 'elecProductionPage'}">电子产品</c:if>
									<c:if test="${advertisement.adverDistribution.whichPage == 'myOfficePage'}">我的办公室</c:if>
									</td>
									<td>${advertisement.adverDistribution.position}</td>
									<td>${advertisement.imagePath}</td>
									<td>${advertisement.link}</td>
									<td>${advertisement.expenditure}</td>
									<td>${advertisement.income}</td>	
									<td>${advertisement.startDate}&nbsp;&nbsp;&nbsp;${loop.index }
										<input id="startDate${loop.index }" type="hidden" value="${advertisement.startDate}">
									</td>
									<td>${advertisement.during}
										<input id="during${loop.index }" type="hidden" value="${advertisement.during}">
									</td>
									<td id="between${loop.index }" >																		  
									</td>
									<td>
									<button class="btn btn-default" onclick="popupwindow('showUpdateAdvertisement?id=${advertisement.id}');">修改</button>
									<button type="button" class="btn btn-default" onclick="deleteAdvertisementById('${advertisement.id}');">删除</button>
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

	$(document).ready(function(){	
		var len = "${count}";
		var nowDate = new Date();
		for (var i = 0; i < len ; i++) {
			var during = $('#during'+i).val();
			var startDate = getDate($('#startDate'+i).val());
			startDate = startDate.valueOf();
			startDate = new Date(startDate);
			var a =(nowDate-startDate);
			var b = 24 * 60 * 60 * 1000;
			var between = Math.ceil(a/b) - during;
			if ( between >= 0 ) {
				$('#between'+i).html("广告时间已过");
			} else {
				$('#between'+i).html(Math.ceil(a/b)+"天");
			}			
		}
	})
	
	function getDate(strDate) {    
		var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,    
	    function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');    
	    return date;    
	}
    	
		function deleteAdvertisementById(obj){
			location.href = "deleteAdvertisement?id="+obj;
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
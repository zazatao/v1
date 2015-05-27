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
<title>运期晚点</title>
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
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>

	<div class="container-fluid" style="padding: 0; margin-top: 32px;">
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">中转</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">运期</font>
				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal" action="forwarding/searchTransportLate"
					method="POST">
					<div class="form-group">
						<div class="col-sm-2">
							<input type="text" name="packTpek" class="form-control"
								id="packTpek" value=""
								placeholder="包裹追踪号">
						</div>
						<div class="col-sm-2">
						<select class="form-control" id="transit"  name="transit">
							<option value="">-----------选择中转地-----------
							<option value="beijing">北京
							<option value="wlmq">乌鲁木齐
						</select>
						</div>
						<div class="col-sm-2">
							<select class="form-control" name="delivery"
								id="delivery">
								<option value="">-------------运输方式-------------
								<option value="EMS">EMS
								<option value="sf">顺风
							</select>
						</div>
						<div class="col-sm-2">
							<input class="form-control" id="receiveDate" name="receiveDate" placeholder="收货日期" onclick="dateInfoxxx('receiveDate')">
						</div>
						<div class="col-sm-2">
							<input class="form-control" id="sendDate" name="sendDate" placeholder="发货日期"  onclick="dateInfoxxx('sendDate')">
						</div>
						<div class="col-sm-2">
							<button type="submit" class="btn btn-default">查询</button>
						</div>
					</div>
				</form>
				<div class="panel panel-default">
					<div class="list-group-item">
						<p class="list-group-item-text">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>包裹追踪号</th>
									<th>中转步骤</th>
									<th>运输方式</th>
									<th>收货日期</th>
									<th>发货日期</th>
									<th>停留天数</th>
									<th>赔付</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="transitSite" items="${list }"  varStatus="pool">
									<c:if test="${fn:length(transitSite.packages)>0 }">
										<c:forEach items="${transitSite.packages }" var="pack" varStatus="loop">
											<c:set var="count" value="${fn:length(transitSite.packages) }" ></c:set>										
											<c:choose>
												<c:when test="${loop.index%2==0 }">
													<tr>
												</c:when>
												<c:otherwise>
													<tr class="success">
												</c:otherwise>
											</c:choose>
											<td>${pack.packAgeTpek}</td>
											<td>
												<c:if test="${pack.transit == 'beijing'}">北京</c:if>
												<c:if test="${pack.transit == 'wlmq'}">乌鲁木齐</c:if>
											</td>
											<td>
												<c:if test="${pack.delivery == 'EMS'}">EMS</c:if>
												<c:if test="${pack.delivery == 'sf'}">顺风</c:if>
											</td>
											<td>${transitSite.receiveDate }
												<input id="receiveDate${loop.index }" type="hidden" value="${transitSite.receiveDate }">
											</td>
											<td>${transitSite.sendDate }
												<input id="sendDate${loop.index }" type="hidden" value="${transitSite.sendDate }">
											</td>
											<td id="reduce${loop.index }">
											</td>
											<td>${cargoGroup.compensation }</td>
											</tr>
											<c:set var="index" value="${loop.index }"></c:set>
										</c:forEach>
									</c:if>
									<c:if test="${fn:length(transitSite.cargoGroups)>0 }">
										<c:forEach items="${transitSite.cargoGroups }" var="cargoGroup"  varStatus="p">
											<c:set var="count1" value="${fn:length(transitSite.cargoGroups) }"></c:set>										
											<c:choose>
												<c:when test="${p.index%2==0 }">
													<tr>
												</c:when>
												<c:otherwise>
													<tr class="success">
												</c:otherwise>
											</c:choose>
											<td>${cargoGroup.tpekCargoGroup }</td>
											<td>
												<c:if test="${cargoGroup.transit == 'beijing'}">北京</c:if>
												<c:if test="${cargoGroup.transit == 'wlmq'}">乌鲁木齐</c:if>
											</td>
											<td>
												<c:if test="${cargoGroup.delivery == 'EMS'}">EMS</c:if>
												<c:if test="${cargoGroup.delivery == 'sf'}">顺风</c:if>
											</td>
											<td>${transitSite.receiveDate }
											<input id="receiveDate${loop.index+index+1 }" type="hidden" value="${transitSite.receiveDate }">
											</td>
											<td>${transitSite.sendDate }
											<input id="sendDate${p.index+index+1 }" type="hidden" value="${transitSite.sendDate }">
											</td>
											<td id="reduce${loop.index+index+1 }"></td>
											<td>${cargoGroup.compensation }</td>
											</tr>
										</c:forEach>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function dateInfoxxx(obj) {
			var date = obj;
			$('#' + date).datetimepicker({
				lang : 'ch',
				timepicker : false,
				format : 'Y-m-d',
				formatDate : 'Y-m-d',
			});
		}
		$(document).ready(function(){
			var len = "${count}"+"${count1}";
			for (var i = 0; i < len ; i++) {
				var sendDate ="";
				if($('#sendDate'+i).val() == ''){
					sendDate = new Date();
				}else{
					sendDate = getDate($('#sendDate'+i).val());
					sendDate = sendDate.valueOf();
					sendDate = new Date(sendDate);
				}
				var receiveDate = getDate($('#receiveDate'+i).val());
				receiveDate = receiveDate.valueOf();
				receiveDate = new Date(receiveDate);
				var a =(sendDate-receiveDate);
				var b = 24 * 60 * 60 * 1000;
				$('#reduce'+i).html(Math.ceil(a/b)+"天");
			}
		})
		 function getDate(strDate) {    
          var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,    
           function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');    
          return date;    
      }   
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
	</script>
</body>
</html>
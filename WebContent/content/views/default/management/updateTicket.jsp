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
<title>添加或者修改票</title>
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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal" id="form" name="form" method="POST">
					<div class="form-group">
							<input type="hidden" name="id" value="${ticket.brandID }">
							<label for="inputEmail3" class="col-sm-2 control-label">名称</label>
						<div class="col-sm-10">
							<input type="text" name="ticketName" class="form-control" value="${ticket.ticketName }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
							<button type="button" class="btn btn-default" onclick="return addOrUpdate();">确定提交
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	window.onunload = refreshParent;
	function refreshParent() {
		window.opener.reloadData();
	}
	function closeAndRefresh() {
		self.close();
		return true;
	}
		function addOrUpdate(){
			document.form.action="management/addOrUpTicket";
			document.form.submit();
			return closeAndRefresh();
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
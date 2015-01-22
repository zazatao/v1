<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单</title>
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
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
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
				<a href="./insertShopOrder" style="font-size: 18px;">商品</a> <span class="divider"><font
					style="font-size: 18px;">/</font></span> <font style="font-size: 18px;">订单</font>
					<a href="#" style="font-size: 18px;" id="add">
					<span class="badge navbar-right">添加&nbsp;+</span></a>
			</h3>
		</div>
	</div>
	
	<form action="./addShopOrder" method="POST" class="form-horizontal" role="from">
		<div class="form-group">
			<label class="col-md-3 control-label">货号(淘宝ID)</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="transNumForTaobao">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">货号</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="commItem">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">买方</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="user">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">E-mail</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="email">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">电话</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="phone">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">追踪</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="tpek">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">数量</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="quantity">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">支付金额</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="money">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">交易金额</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="money">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">币种</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="currency">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">包裹</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="transNumForTaobao">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">状态</label>
			<div class="col-md-6">

			<select class="form-control" name="formStatus" id="formStatus"
				placeholder="状态">
				<option value="">-----状态-----
				<option value="unchanged" name = "unchanged">没有变化
				<option value="refuse" name = "refuse">拒绝接受货物
				<option value="lack" name = "lack">缺乏
				<option value="inWarehouse" name = "inWarehouse">在仓库
				<option value="inAuctionlose" name = "inAuctionlose">下拍
				<option value="cancel" name = "cancel">取消
				<option value="delivery" name = "delivery">交付
				<option value="support" name = "support">支持
				<option value="sendOut" name = "sendOut">派送
				<option value="buyerNotPay" name = "buyerNotPay">买方没有支付
				<option value="inCell" name = "inCell">在格子
				<option value="lose" name = "lose">丢失
				<option value="manualProcessing" name = "manualProcessing">手工加工
				<option value="inForwarding" name = "inForwarding">在转发
				<option value="senToWarehouse" name = "senToWarehouse">送货到仓库
				<option value="packing" name = "packing">打包
				<option value="paid" name = "paid">已付
				<option value="apiProcessing" name = "apiProcessing">API处理
				<option value="delete" name = "delete">删除
				<option value="waitingForTracking" name = "waitingForTracking">等待的追踪
			</select>	
				
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">操作员</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="personnel"
					placeholder="手机号、座机号" value="${personel.userName }" readonly="readonly">
			</div>
		</div>
		<div class="form-group">
			<div class="col-md-2 col-md-offset-3">
				<button type="submit" class="form-control btn-primary">提交</button>
			</div>
			<div class="col-md-2 col-md-offset-1">
				<button type="reset" class="form-control btn-warning">重置</button>
			</div>
		</div>
	</form>
	

	<jsp:include page="../common/delModelBox.jsp"></jsp:include>

	<script type="text/javascript">
		function updateShopOrder(num){
			location.href =	'./updateShopOrder?id='+num;
		}
		function deleteShopOrder(num){
			location.href =	'./deleteShopOrder?id='+num;
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
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
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
		//删除模态框
		$(document).ready(function() {
			$("#del").click(function() { //给本页面的所有的“删除”超链接添加“点击事件”处理函数
				var onclick = $(this).attr("onclick"); //获取当前点击的超链接的href值
				alert(onclick);
				$("#delModal").modal("show"); //显示模态框
				//当点击“确认删除”按钮时，执行一次性事件处理函数
				$("#doDel").one("click", function() {
					location.assign(onclick); //加载指定链接值的目标资源
				});
				return false; //阻止元素本身的默认行为
			});
		});
		//添加模态框
		$(document).ready(function() {
			$("#add").click(function() { //给本页面的所有的“添加”超链接添加“点击事件”处理函数
				var href = $(this).attr("href"); //获取当前点击的超链接的href值
				$("#AddManagerModal").modal("show"); //显示模态框
				//当点击“提交”按钮时，执行一次性事件处理函数
				$("#doDel").one("click", function() {
					location.assign(href); //加载指定链接值的目标资源
				});
				return false; //阻止元素本身的默认行为
			});
		});
	</script>
</body>
</html>

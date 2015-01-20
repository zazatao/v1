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
		<!-- 
		<div class="form-group">
			<label class="col-md-3 control-label">登录名</label>
			<div class="col-md-6">
				<input type="text" name="manager.lname" placeholder="英文、数字组成。6-12位"
					class="form-control" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">密码</label>
			<div class="col-md-6">
				<input type="password" class="form-control" name="manager.pwd"
					placeholder="4-20位">
			</div>
		</div>
		 -->
		<div class="form-group">
			<label class="col-md-3 control-label">货号(淘宝ID)</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="transNumForTaobao"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">货号</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="commItem"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">买方</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name=""
					placeholder="手机号、座机号" value="${user.userName }">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">E-mail</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="email"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">电话</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="phone"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">追踪</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="tpek"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">数量</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="quantity"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">支付金额</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="money"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">交易金额</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="money"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">币种</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="currency"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">包裹</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="transNumForTaobao"
					placeholder="手机号、座机号">
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">状态</label>
			<div class="col-md-6">
			<select class="form-control input-sm" name="commodityID" id="byStatus">
				<c:forEach items="${commodity }" var="comm">
					<option value="${comm.commodityID }" 
						<c:if test="${comm.status == 'delivery' }">
							selected='selected' 
						</c:if>
					>
					<c:if test="${comm.status == 'delivery' }">
						舅舅家
					</c:if>
					<c:if test="${comm.status == 'marriage' }">
						舅舅家1
					</c:if>
					</option>
				</c:forEach>
			</select>	
				
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">操作员</label>
			<div class="col-md-6">
				<input type="text" class="form-control" name="userName"
					placeholder="手机号、座机号" value="${user.userName }" readonly="readonly">
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

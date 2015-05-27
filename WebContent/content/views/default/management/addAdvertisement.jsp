<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加广告</title>
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
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="col-md-12 column">
				<form class="form-horizontal"  id="form" name="form" method="POST">
					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">填写广告图片路径</label>
							<input type="hidden" name="id" value="${id }">	
							<div class="col-sm-8">
								<input id="imagePath"  class="form-control" name="imagePath" value="不能为空哦"
									type="text" onfocus="this.value=''" onblur="if(this.value==''){this.value='不能为空哦';}"/>
							</div>	
						</c:if>
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改广告图片路径</label>
							<input type="hidden" name="id" value="${advertisement.id }">	
							<div class="col-sm-8">
								<input id="imagePath"  class="form-control" name="imagePath" value="${advertisement.imagePath}" 
									type="text" onfocus="this.value=''" onblur="if(this.value==''){this.value='不能为空哦';}"/>
							</div>	
						</c:if>
						
					</div>

					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">填写链接</label>
							<input type="hidden" name="id" value="${id }">
						</c:if>	
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改链接</label>
							<input type="hidden" name="id" value="${advertisement.id }">
						</c:if>
						<div class="col-sm-8">
							<input id="link" class="form-control" name="link" value="${advertisement.link}">
						</div>								
					</div>
				
					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">添加支出</label>
							<input type="hidden" name="id" value="${id }">	
						</c:if>			
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改支出</label>
							<input type="hidden" name="id" value="${advertisement.id }">	
						</c:if>				
						<div class="col-sm-8">
							<input id="expenditure" class="form-control" name="expenditure" value="${advertisement.expenditure}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">添加收入</label>
							<input type="hidden" name="id" value="${id }">	
						</c:if>
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改收入</label>
							<input type="hidden" name="id" value="${advertisement.id }">	
						</c:if>						
						<div class="col-sm-8">
							<input id="income"  class="form-control" name="income" value="${advertisement.income}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">添加起始时间</label>
							<input type="hidden" name="id" value="${id }">	
						</c:if>		
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改起始时间</label>
							<input type="hidden" name="id" value="${advertisement.id }">	
						</c:if>					
						<div class="col-sm-8">
							<input id="startDate" class="form-control" name="startDate" value="${advertisement.startDate}">
						</div>
					</div>
					
					<div class="form-group">
						<c:if test="${method == 'add' }">
							<label for="inputEmail3" class="col-sm-2 control-label">添加广告持续的时间段</label>
							<input type="hidden" name="id" value="${id }">	
						</c:if>			
						<c:if test="${method == 'update' }">
							<label for="inputEmail3" class="col-sm-2 control-label">修改广告持续的时间段</label>
							<input type="hidden" name="id" value="${advertisement.id }">	
						</c:if>				
						<div class="col-sm-8">
							<input id="during"  class="form-control" name="during" value="${advertisement.during}">
						</div>
					</div>
						
					<div class="form-group">
						<div class="col-sm-3">
							<select name="whichPage" id="whichPage" class="form-control" onchange="depChange(this);">
								<option value="0">选择广告所在的页面</option>
								<c:forEach var="AdvertisementPage" items="${list }" varStatus="pool">
									<option value="${AdvertisementPage }">
										<c:if test="${AdvertisementPage == 'homePage'}">首页</c:if>
										<c:if test="${AdvertisementPage == 'innerPage'}">内页</c:if>
										<c:if test="${AdvertisementPage == 'carPage'}">汽车用具页</c:if>
										<c:if test="${AdvertisementPage == 'detailPage'}">详情页</c:if>
										<c:if test="${AdvertisementPage == 'elecProductionPage'}">电子产品页</c:if>
										<c:if test="${AdvertisementPage == 'myOfficePage'}">我的办公室</c:if>
										<c:if test="${AdvertisementPage == 'brandPage'}">品牌页</c:if>
									</option>
								</c:forEach>
							</select>
						</div>
						
						<div class="col-sm-3">
							<select name="position" id="position"  class="form-control">
								<option value="0">选择所在页面的广告位</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10" style="text-align: center;">
						<c:if test="${method == 'add' }">
							<button type="button" class="btn btn-default" onclick="addAdvertisemnt();">加入广告</button>
						</c:if>
						<c:if test="${method == 'update' }">
							<button type="button" class="btn btn-default" onclick="updateAdvertisement();">更新广告</button>
						</c:if>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
		window.onunload = refreshParent;
		function refreshParent() {
			window.opener.location.reload();
		}
		
		function addAdvertisemnt(){
			document.form.action="management/addAdvertisement";
			document.form.submit();
			return closeAndRefresh();
		}
		
		function updateAdvertisement(){
			document.form.action="management/updateAdvertisement?id=${advertisement.id}";
			document.form.submit();
			return closeAndRefresh();
		}
		
		function closeAndRefresh() {
			window.onunload = refreshParent;
			self.close();
			return true;
		}
		function depChange(obj){
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : 'getShopCategory/getAdverPositions?whichPage='+whichPage.value,
				dataType : 'json',
				success : function(data) {
					if(data.success == 'true'){
						var pos = document.getElementById('position');
						var numd = pos.options.length;
						for (i = numd - 1; i >= 0; i--) {
							pos.remove(i);
						}
						var objOption = new Option("选择所在页面的广告位", "0");
						pos.options[pos.options.length] = objOption;
						$.each(data.list, function(i, position) {
							var objOption = new Option(position ,
									position);
							pos.options[pos.options.length] = objOption;
						});
					}
				}
			});
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
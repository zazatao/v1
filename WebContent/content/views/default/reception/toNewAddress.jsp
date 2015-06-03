<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/shopcar.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<SCRIPT src="../content/static/js/reception/ScrollPic.js"
	type=text/javascript></SCRIPT>
</head>
<body>
	<div class="con">

		<!---------------   shopcar   ----------------------->
		   <form id="formAddress" action="/user/saveNewAddress" method="post">
				<div class="shopcartabt2">
					<div class="shcaadd">
						<ul class="shcaaddtex">
							<li>
								<p>收货人*</p>
								<p>
									<input name="toName"  type="text" />
								</p>
							</li>
							<li>
								<p>电话*</p>
								<p>
									<input name="phone" type="text" />
								</p>
							</li>
							<li>
								<p>Emial</p>
								<p>
									<input name="toEmail" type="text" />
								</p>
							</li>
							<li>
								<p>国家*</p>
								<p class="shcaadds">
									<select name="country">
										<option value="volvo">选择国家</option>
										<option value="中国">中国</option>
									</select>
								</p>
							</li>
							<li>
								<p>省份*</p>
								<p class="shcaadds">
									<select name="provience">
								<option value="volvo">选择省份</option>
								<option value="新疆">新疆</option>
							</select>
								</p>
								
							</li>
							<li>
								<p>城市*</p>
								<p class="shcaadds">
									<select name="city">
								<option value="volvo">选择城市</option>
								<option value="乌鲁木齐">乌鲁木齐</option>
							</select>
								</p>
								
							</li>
							<li>
								<p>区县*</p>
								<p class="shcaadds">
									<select name="district">
								<option value="volvo">选择区县</option>
								<option value="新市区">新市区</option>
							</select>
								</p>
								
							</li>
							<li>
								<p>详细地址*</p>
								<p>
									<input name="street" type="text" />
								</p>
							</li>
							<li class="shcaaddtexc"><span><input name="theDefault"
									type="checkbox" value="true" /></span> 是否设定为默认地址</li>
						</ul>
						<div align="right" style="margin-right: 60px;"><a style="color: green;" onclick="addMaterial()">确认新增</a></div>
					</div>
				</div>
			 </form> 
			 <script type="text/javascript">
			  window.onunload = refreshParent;
				function refreshParent() {
					window.opener.location.reload();
				}
				
				function addMaterial(){
					document.getElementById("formAddress").submit();
					return closeAndRefresh();
				}
				function closeAndRefresh() {
					window.onunload = refreshParent;
					self.close();
					return true;
				}
			 </script>
			</div>
			
</body>
</html>
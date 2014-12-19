<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>新华锐健康督导</title>

<link href="../content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet">

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
<script type="text/javascript" src="../content/static/js/lib/scripts.js"></script>

<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<style>
.frred {
	color: #FF0000;
	font-size: 12px;
}

.frbule {
	color: #0066CC;
	font-size: 12px;
}

.fgren {
	color: #339933;
	font-size: 12px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="row clearfix">
			<div class="col-md-12 column">
				<div class="row clearfix">
					<br> <br>
				</div>

				<div class="row clearfix">
					<div class="col-md-3 column"></div>
					<div class="col-md-6 column">
						<form class="form-horizontal" action="../user/regist"
							method="POST">
							<div class="form-group" style="text-align: center;">
								<label><font style="font-size: 40px;">用户注册</font> </label> <br>
								<br>
							</div>
							<div class="form-group">
								<label for="inputEmail3" class="col-sm-2 control-label"><a
									class="frred">*</a>用户名</label>
								<div class="col-sm-10">
									<input type="text" name="name" class="form-control"
										id="inputEmail3" onblur="checkformname()"> <span
										id="sname" class="frbule">输入至少2位用户名</span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label"><a
									class="frred">*</a>密码 </label>
								<div class="col-sm-10">
									<input type="password" name="password1" class="form-control"
										id="inputPassword3" onblur="checkpwd()"><span
										id="spwd" class="frbule"> 请输入至少6为密码</span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword4" class="col-sm-2 control-label"><a
									class="frred">*</a>确认密码</label>
								<div class="col-sm-10">
									<input type="password" name="password2" class="form-control"
										id="inputPassword4" onblur="rcheckpwd()"><span
										id="srpwd" class="frbule"> 请输入重复密码</span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword3" class="col-sm-2 control-label">角色</label>
								<div class="col-sm-10">
									<c:if test="${ role == null}">
										<select name="role" class="form-control" id="inputRole"
											onchange="test()">
											<option value="ADMIN">管理员</option>
											<option value="PATIENT" selected="selected">患者</option>
											<option value="DOCTOR">医生</option>
											<option value="CDC">CDC</option>
										</select>
									</c:if>
									<c:if test="${ role !=null}">
										<select name="role" class="form-control" required="required"
											onload="role()">
											<c:if test="${ role =='PATIENT'}">
												<option value="PATIENT" selected="selected">患者</option>
											</c:if>
											<c:if test="${ role =='DOCTOR'}">
												<option value="DOCTOR" selected="selected">医生</option>
											</c:if>
											<c:if test="${ role =='CDC'}">
												<option value="CDC" selected="selected">CDC</option>
											</c:if>
										</select>
									</c:if>
								</div>
							</div>
							<div id="ADMIN" style="display: none;"></div>
							<div id="PATIENT" style="display: block;">
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="tel" id="inputPatientName" name="patientName"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputIdentifier" class="col-sm-2 control-label"><a
										class="frred">*</a>身份证</label>
									<div class="col-sm-10">
										<input type="text" name="identifier" class="form-control"
											id="inputIdentifier">
									</div>
								</div>
								<div class="form-group">
									<label for="inputIdentifier" class="col-sm-2 control-label">病案号</label>
									<div class="col-sm-10">
										<input type="text" name="treatNo" class="form-control"
											id="inputTreatNo">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label"><a
										class="frred">*</a>电话</label>
									<div class="col-sm-10">
										<input type="tel" id="inputPhone" name="phone"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputNation" class="col-sm-2 control-label">民族</label>
									<div class="col-sm-10">
										<select name="nation" class="form-control" id="inputNation">
											<c:forEach var="nation" items="${nationList }">
												<option value="${nation.nationName }">${nation.nationName }
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputSex" class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">
										<input type="radio" id="inputSex" name="sex" value="m"
											checked="checked" class="audio">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											id="inputSex" name="sex" value="w" class="audio">女
									</div>
								</div>
								<div class="form-group">
									<label for="input" class="col-sm-2 control-label">就诊日期</label>
									<div class="col-sm-10">
										<input type="text" name="registrationDate"
											class="form-control" id="inputRegistrationDate"
											onclick="dateInfoxxx('inputRegistrationDate');">
									</div>
								</div>
								<div class="form-group">
									<label for="inputFirstTakeDate" class="col-sm-2 control-label">首次服药日期</label>
									<div class="col-sm-10">
										<input type="text" name="firstTakeDate" class="form-control"
											id="inputFirstTakeDate"
											onclick="dateInfoxxx('inputFirstTakeDate');">
									</div>
								</div>
								<div class="form-group">
									<label for="inputBirthDay" class="col-sm-2 control-label">出生日期</label>
									<div class="col-sm-10">
										<input type="text" id="inputBirthDay" name="birthDay"
											onclick="dateInfoxxx('inputBirthDay');" class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputAddress" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-10">
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">省份</label>
											<div class="col-sm-10">
												<select name="provience" class="form-control"
													onchange="checkCity(this)" id="provience"
													onblur="forProvienceText(this)">
													<option value="-1" selected="selected">----省份----
														<c:forEach var="provience" items="${list }">
															<c:if test="${provience.nodeRank ==1 }">
																<option value="${provience.id }">${provience.geogDesignation }
															</c:if>
														</c:forEach>
												</select> <input type="hidden" name="provienceText"
													id="provienceText" value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">地市</label>
											<div class="col-sm-10">
												<select name="city" class="form-control"
													onchange="checkDistrict(this)" id="city"
													onblur="forCityText(this)">
													<option value="-1">----地市----
												</select> <input type="hidden" name="cityText" id="cityText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">区县</label>
											<div class="col-sm-10">
												<select name="district" onchange="checkStreet(this)"
													id="district" class="form-control"
													onblur="forDistrictText(this)">
													<option value="-1">----区县----
												</select> <input type="hidden" name="districtText" id="districtText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">街道</label>
											<div class="col-sm-10">
												<select name="street" id="street" class="form-control"
													onblur="forStreetText(this)">
													<option value="-1">----街道----
												</select> <input type="hidden" name="streetText" id="streetText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">街道号</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="streetNo"
													class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">小区</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="place"
													class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">楼号</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="building"
													class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">单元号</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="unit"
													class="form-control">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">房间号</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="room"
													class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="DOCTOR" style="display: none;">
								<div class="form-group">
									<label for="inputDoctorName" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="tel" id="inputDoctorName" name="doctorName"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-10">
										<input type="tel" id="inputPhone" name="Dphone"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputHospitalName" class="col-sm-2 control-label">所属医院</label>
									<div class="col-sm-10">
										<select name="hospitalName" class="form-control"
											id="inputHospitalName">
											<c:forEach  items="${hospitals }" var="hospital">
												<option value="${hospital.id }">${hospital.hospitalDesignation }
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputDepartments" class="col-sm-2 control-label">所属科室</label>
									<div class="col-sm-10">
										<input type="text" name="departments" class="form-control"
											id="inputDepartments">
									</div>
								</div>
								<div class="form-group">
									<label for="inputSex" class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">
										<input type="radio" id="inputSex" name="Dsex" value="m"
											checked="checked" class="audio">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											id="inputSex" name="Dsex" value="w" class="audio">女

									</div>
								</div>
								<div class="form-group">
									<label for="inputAddress" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-10">
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">省份</label>
											<div class="col-sm-10">
												<select name="provience" class="form-control"
													onchange="checkCity(this)" id="provience"
													onblur="forProvienceText(this)">
													<option value="-1" selected="selected">----省份----
														<c:forEach var="provience" items="${list }">
															<c:if test="${provience.nodeRank ==1 }">
																<option value="${provience.id }">${provience.geogDesignation }
															</c:if>
														</c:forEach>
												</select> <input type="hidden" name="provienceText"
													id="provienceText" value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">地市</label>
											<div class="col-sm-10">
												<select name="city" class="form-control"
													onchange="checkDistrict(this)" id="city"
													onblur="forCityText(this)">
													<option value="-1">----地市----
												</select> <input type="hidden" name="cityText" id="cityText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">区县</label>
											<div class="col-sm-10">
												<select name="district" onchange="checkStreet(this)"
													id="district" class="form-control"
													onblur="forDistrictText(this)">
													<option value="-1">----区县----
												</select> <input type="hidden" name="districtText" id="districtText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">街道</label>
											<div class="col-sm-10">
												<select name="street" id="street" class="form-control"
													onblur="forStreetText(this)">
													<option value="-1">----街道----
												</select> <input type="hidden" name="streetText" id="streetText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">小区</label>
											<div class="col-sm-10">
												<input id="inputAddress" type="text" name="place"
													class="form-control">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="CDC" style="display: none;">
								<div class="form-group">
									<label for="inputCDCName" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="tel" id="inputCDCName" name="cdcName"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label">电话</label>
									<div class="col-sm-10">
										<input type="tel" id="inputPhone" name="cdcphone"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label for="inputPhone" class="col-sm-2 control-label">隶属机构</label>
									<div class="col-sm-10">
										<select name="cdcOrg" id="cdcOrg"  class="form-control">
											<c:forEach items="${cdcOrgs }" var="cdcOrg">
												<option value="${cdcOrg.id }">${cdcOrg.cdcOrgDesignation }
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label for="inputSex" class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">
										<input type="radio" id="inputSex" name="Csex" value="m"
											checked="checked" class="audio">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio"
											id="inputSex" name="Csex" value="w" class="audio">女

									</div>
								</div>
								<div class="form-group">
									<label for="inputAddress" class="col-sm-2 control-label">地址</label>
									<div class="col-sm-10">
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">省份</label>
											<div class="col-sm-10">
												<select name="provience" class="form-control"
													onchange="checkCity(this)" id="provience"
													onblur="forProvienceText(this)">
													<option value="-1" selected="selected">----省份----
														<c:forEach var="provience" items="${list }">
															<c:if test="${provience.nodeRank ==1 }">
																<option value="${provience.id }">${provience.geogDesignation }
															</c:if>
														</c:forEach>
												</select> <input type="hidden" name="provienceText"
													id="provienceText" value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">地市</label>
											<div class="col-sm-10">
												<select name="city" class="form-control"
													onchange="checkDistrict(this)" id="city"
													onblur="forCityText(this)">
													<option value="-1">----地市----
												</select> <input type="hidden" name="cityText" id="cityText"
													value="-1">
											</div>
										</div>
										<div class="form-group">
											<label for="inputSex" class="col-sm-2 control-label">区县</label>
											<div class="col-sm-10">
												<select name="district" onchange="checkStreet(this)"
													id="district" class="form-control"
													onblur="forDistrictText(this)">
													<option value="-1">----区县----
												</select> <input type="hidden" name="districtText" id="districtText"
													value="-1">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10"
									style="text-align: center;">
									<button type="submit" class="btn btn-default"
										onClick="return closeAndRefresh();">注册</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-default"
										onclick="cancel()">取消</button>
								</div>
							</div>
						</form>
					</div>
					<div class="col-md-3 column"></div>
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
		function forStreetText(sel) {
			var street = document.getElementById("streetText");
			street.value = sel.options[sel.selectedIndex].value;
		}
		function forDistrictText(sel) {
			var district = document.getElementById("districtText");
			district.value = sel.options[sel.selectedIndex].value;
		}
		function forCityText(sel) {
			var cityText = document.getElementById("cityText");
			cityText.value = sel.options[sel.selectedIndex].value;
		}
		function forProvienceText(sel) {
			var provienceText = document.getElementById("provienceText");
			provienceText.value = sel.options[sel.selectedIndex].value;
		}
		function checkCity(obj) {
			var Code = obj.value;
			var citySelect = document.getElementById('city');
			var cityText = document.getElementById('cityText');
			cityText.value = -1;
			var districtText = document.getElementById('districtText');
			districtText.value = -1;
			var streetText = document.getElementById('streetText');
			streetText.value = -1;
			var num = citySelect.options.length;
			for (i = num - 1; i >= 0; i--) {
				citySelect.remove(i);
			}
			var districtSelect = document.getElementById('district');
			var numd = districtSelect.options.length;
			for (i = numd - 1; i >= 0; i--) {
				districtSelect.remove(i);
			}
			var objOption = new Option("----区县----", -1);
			districtSelect.options[districtSelect.options.length] = objOption;
			var streetSelect = document.getElementById('street');
			var nums = streetSelect.options.length;
			for (i = nums - 1; i >= 0; i--) {
				streetSelect.remove(i);
			}
			var objOption = new Option("----街道----", -1);
			streetSelect.options[streetSelect.options.length] = objOption;
			var objOption = new Option("----地市----", -1);
			citySelect.options[citySelect.options.length] = objOption;
			<c:forEach items="${list }" var="city">
			if ('${city.parentNode }' == Code && '${city.nodeRank}' == 2) {
				var objOption = new Option("${city.geogDesignation }",
						'${city.id}');
				citySelect.options[citySelect.options.length] = objOption;
			}
			</c:forEach>
		}
		function checkDistrict(obj) {
			var Code = obj.value;
			var districtText = document.getElementById('districtText');
			districtText.value = -1;
			var streetText = document.getElementById('streetText');
			streetText.value = -1;
			var districtSelect = document.getElementById('district');
			var num = districtSelect.options.length;
			for (i = num - 1; i >= 0; i--) {
				districtSelect.remove(i);
			}
			var streetSelect = document.getElementById('street');
			var nums = streetSelect.options.length;
			for (i = nums - 1; i >= 0; i--) {
				streetSelect.remove(i);
			}
			var objOption = new Option("----街道----", -1);
			streetSelect.options[streetSelect.options.length] = objOption;
			var objOption = new Option("----区县----", -1);
			districtSelect.options[districtSelect.options.length] = objOption;
			<c:forEach items="${list }" var="district">
			if ('${district.parentNode }' == Code
					&& '${district.nodeRank}' == 3) {
				var objOption = new Option("${district.geogDesignation }",
						'${district.id}');
				districtSelect.options[districtSelect.options.length] = objOption;
			}
			</c:forEach>
		}
		function checkStreet(obj) {
			var Code = obj.value;
			var streetText = document.getElementById('streetText');
			streetText.value = -1;
			var streetSelect = document.getElementById('street');
			var num = streetSelect.options.length;
			for (i = num - 1; i >= 0; i--) {
				streetSelect.remove(i);
			}
			var objOption = new Option("----街道----", -1);
			streetSelect.options[streetSelect.options.length] = objOption;
			<c:forEach items="${list }" var="street">
			if ('${street.parentNode }' == Code && '${street.nodeRank}' == 4) {
				var objOption = new Option("${street.geogDesignation }",
						'${street.id}');
				streetSelect.options[streetSelect.options.length] = objOption;
			}
			</c:forEach>
		}
		function test() {
			document.getElementById('ADMIN').style.display = 'none';
			document.getElementById('PATIENT').style.display = 'none';
			document.getElementById('DOCTOR').style.display = 'none';
			document.getElementById('CDC').style.display = 'none';
			var value = document.getElementById('inputRole').value;
			document.getElementById(value).style.display = 'block';
		}

		window.onload = function role() {
			document.getElementById('ADMIN').style.display = 'none';
			document.getElementById('PATIENT').style.display = 'none';
			document.getElementById('DOCTOR').style.display = 'none';
			document.getElementById('CDC').style.display = 'none';
			if ("${ role }".length == 0) {
				test();
			} else {
				document.getElementById("${ role }").style.display = 'block';
			}
		}
		function cancel() {
			window.location.href = "../index.jsp?backurl="
					+ window.location.href;
		}
		function checkformname() {
			var fname = document.getElementById("inputEmail3");
			var ftname = document.getElementById("sname");
			if (fname.value == ""
					|| fname.value.length<2||fname.value.length>10) {
				ftname.className = "frred";
				fname.focus();
				ftname.innerHTML = "× 请输入2-10位用户名，可包含数字、字母、下划线";
			} else {
				ftname.className = "fgren";
				ftname.innerHTML = "√用户名可用!";
			}
		}
		function checkpwd() {
			var fpwd = document.getElementById("inputPassword3");
			var ftpwd = document.getElementById("spwd");
			if (fpwd.value == "" || fpwd.value.length<6||fpwd.value.length>20) {
				ftpwd.className = "frred";
				fpwd.focus();
				ftpwd.innerHTML = "× 请输入6-20位用户密码！";
			} else {
				ftpwd.className = "fgren";
				ftpwd.innerHTML = "√密码可用！"
			}
		}
		function rcheckpwd() {
			var fpwd = document.getElementById("inputPassword3");
			var frpwd = document.getElementById("inputPassword4");
			var ftrpwd = document.getElementById("srpwd");
			if (frpwd.value == "") {
				ftrpwd.className = "frred";
				frpwd.focus();
				ftrpwd.innerHTML = "× 请输入您的重复密码！"
			} else {
				if (frpwd.value != fpwd.value) {
					ftrpwd.className = "frred";
					fpwd.focus();
					ftrpwd.innerHTML = "× 俩次密码输入不一致，请重新输入！";
				} else {
					ftrpwd.className = "fgren";
					ftrpwd.innerHTML = " √ 密码输入正确"
				}
			}
		}
	</script>
</body>
</html>

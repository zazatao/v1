<%@page import="com.yc.entity.user.User"%><%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/gr.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
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
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">

		<!---------------   left   ----------------------->
		<jsp:include page="left.jsp"></jsp:include>
		<!---------------   right   ------------->
		<div class="perterrtab perterrtab_2">
			<input id="language" type="hidden" value="${sessionScope.language}" />
			<h3>
				商品新增：
			</h3>
			<div class="kd_yz_cont">
				<form action="./saveCommoidty" enctype="multipart/form-data"
					method="post">
					<dl>
						<dd>
						<c:if test="${sessionScope.language == 'chinese' }">
							<span></span><input type="checkbox" style="width: 15px; height: 15px;" value="true" name="shelves" id="shelvesTrue" onclick="addLanguage(this)"/>添加俄文
						</c:if>
						<c:if test="${sessionScope.language == 'russina' }">
							<span></span><input type="checkbox" style="width: 15px; height: 15px;" value="true" name="shelves" id="shelvesTrue" onclick="addLanguage(this)"/>添加中文
						</c:if>
						</dd>
						<dd id="new" style="display:none;">
							<c:if test="${sessionScope.language == 'chinese' }">
								<span>商品名称(俄文)</span><input type="text" value="" name="russinaCommoidtyName" />
							</c:if>
							<c:if test="${sessionScope.language == 'russina' }">
								<span>商品名称(中文)</span><input type="text" value="" name="commoidtyName" />
							</c:if>
						</dd>
						<dd>
							<c:if test="${sessionScope.language == 'chinese' }">
								<span>商品名称</span><input type="text" value="" name="commoidtyName" />
							</c:if>
							<c:if test="${sessionScope.language == 'russina' }">
								<span id="pre">商品名称</span><input type="text" value="" name="russinaCommoidtyName" />
							</c:if>
						</dd>
						<dd>
							<span>货号</span><input type="text" value="" name="commItem" />
						</dd>
						<dd>
							<span>商品分类</span> <select onchange="shopcateOne(this);"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
								<c:forEach items="${shopCategory }" var="shopcate"
									varStatus="loop">
									<c:if test="${shopcate.level == 1 }">
										<option value="${shopcate.categoryID }">
										<c:if test="${sessionScope.language == 'chinese'}">
											${shopcate.category }
										</c:if>
										<c:if test="${sessionScope.language == 'russina'}">
											${shopcate.russinaCategory }
										</c:if>
										</option>
									</c:if>
								</c:forEach>
							</select>
						</dd>
						<dd>
							<span>商品分类</span> <select id="shopcateTwo"
								onchange="shopcate(this);"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
							</select>
						</dd>
						<dd>
							<span>商品分类</span> <select name="fenlei" id="shopcateThree"
								onchange="shopBrand(this);"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
							</select>
						</dd>
						<div id="guige"></div>
						<input type='hidden' id='guize' name="guige" value="" />
						<dd>
							<span>库存数量</span><input type="text" style="width: 100px;"
								value="" name="stock" onblur="checkvalue(this);" /><span>显示比例</span><input type="text"
								style="width: 100px;" value="" name="proportion" onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>单价</span><input type="text" style="width: 100px;" value=""
								name="unitPrice"  onblur="checkvalue(this);"/>
							<select name="currency_id">
								<c:forEach var="currency" items="${currencylist }" varStatus="pool">
									<option value="${currency.id}">${currency.symbol}</option>
								</c:forEach>
							</select>
							<span>大概重量</span><input type="text"
								style="width: 100px;" value="" name="probablyWeight"  onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>是否上架</span><input type="radio"
								style="width: 15px; height: 15px;" value="true" name="shelves"
								checked="checked" id="shelvesTrue"/>上架&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="shelves" id="shelvesFalse" />暂不上架 <span>是否精品</span><input type="radio"
								style="width: 15px; height: 15px;" value="true" name="iscChoice"
								checked="checked" />精品&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="iscChoice" checked="checked" />普通
						</dd>
						<dd id="checkShow">
							<span>是否拍卖</span><input type="radio"
								style="width: 15px; height: 15px;" value="true" name="auction"
								checked="checked" />拍卖&nbsp;&nbsp;&nbsp;&nbsp;<input
								style="width: 15px; height: 15px;" type="radio" value="false"
								name="auction" checked="checked" />不拍卖&nbsp;&nbsp;&nbsp;&nbsp;
								<span>是否折扣</span><input style="width: 15px; height: 15px;" type="radio" value="false"
								name="isSpecial" checked="checked" id="noIsSpecial"/>不折扣<input
								type="radio" style="width: 15px; height: 15px;" value="true"
								name="isSpecial" id="isSpecial"/>折扣<input type="text" style="width: 100px; display: none;"
								value="" name="special" id="special" onblur="checkvalue(this);"/>
						</dd>
						<dd>
							<span>所属品牌</span> <select name="brandid" id="brand"
								style="height: 35px; width: 303px; border: 1px solid #ccc; margin-left: 7px">
								<option value="-1">----请选择----</option>
							</select>
						</dd>
						<dd>
							<span>照片上传</span><input type="file" name="file" />
						</dd>
						<div id="newUpload2"></div>
						<dd>
							<span></span><input type="button" id="btn_add2"
								style="height: 35px; width: 80px;" value="再增加一张">
						</dd>
						<dd>
							<span></span>
							<button type="submit">添加</button>
						</dd>
					</dl>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		j = 1;
		$(document)
				.ready(
						function() {
							$("#btn_add2")
									.click(
											function() {
												document
														.getElementById("newUpload2").innerHTML += '<div id="div_'+j+'"><dd><span></span><input  name="file_'+j+'" type="file"  /><input type="button"  style="width: 35px; height: 35px;" value="删除"  onclick="del_2('
														+ j + ')"/></dd></div>';
												j = j + 1;
											});
						});
		function del_2(o) {
			document.getElementById("newUpload2").removeChild(
					document.getElementById("div_" + o));
		}
		function checkvalue(obj) {
			if (!/^[+|-]?\d+\.?\d*$/.test(obj.value) && obj.value != '') {
				alert('你输入的不是数字，或关闭输入法后再输入');
				obj.select();
			}
		}
		$(document).ready(function(){
			$("#noIsSpecial").click(function(){
				$("#special").val("");
				$("#special").hide();
			});
			$("#isSpecial").click(function(){
				$("#special").show();
			});
			$("#shelvesFalse").click(function(){
				$("#special").val("");
				$("#checkShow").hide();
			});
			$("#shelvesTrue").click(function(){
				$("#checkShow").show();
			});
			
		});
		
		function addLanguage(obj) {		
			var dd=document.getElementById("new"); 
			if(obj.checked){				 
				dd.style.display='block'; 
			}else{
				dd.style.display='none';
			}
		}
		
		function shopcateOne(obj) {
			var language = $("#language").val();
			var Code = obj.value;
			var shopcateTwo = document.getElementById('shopcateTwo');
			var num = shopcateTwo.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateTwo.remove(i);
			}
			var shopcateThree = document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOption = new Option("----请选择----", -1);
			shopcateTwo.options[shopcateTwo.options.length] = objOption;
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${shopCategory }" var="leiBieTwo">
			if ('${leiBieTwo.parentLevel.categoryID }' == Code
					&& '${leiBieTwo.level}' == 2) {
				if ( language == "chinese" ) {
					var objOption = new Option("${leiBieTwo.category }",
					'${leiBieTwo.categoryID}');
				} else if ( language == "russina" ) {
					var objOption = new Option("${leiBieTwo.russinaCategory }",
					'${leiBieTwo.categoryID}');
				}
				
				shopcateTwo.options[shopcateTwo.options.length] = objOption;
			}
			</c:forEach>

		}
		function shopcate(obj) {
			var language = $("#language").val();
			var Code = obj.value;
			var shopcateThree = document.getElementById('shopcateThree');
			var num = shopcateThree.options.length;
			for (i = num - 1; i >= 0; i--) {
				shopcateThree.remove(i);
			}
			var objOptionT = new Option("----请选择----", -1);
			shopcateThree.options[shopcateThree.options.length] = objOptionT;
			<c:forEach items="${shopCategory }" var="leiBieThree">
			if ('${leiBieThree.parentLevel.categoryID }' == Code
					&& '${leiBieThree.level}' == 3) {
				if ( language == "chinese" ) {
					var objOption = new Option("${leiBieThree.category }",
					'${leiBieThree.categoryID}');
				} else if ( language == "russina" ) {
					var objOption = new Option("${leiBieThree.russinaCategory }",
					'${leiBieThree.categoryID}');
				}				
				shopcateThree.options[shopcateThree.options.length] = objOption;
			}
			</c:forEach>
		}
		function shopBrand(obj) {
			var Code = obj.value;
			jQuery
			.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : './getSpecific?ids=' + Code,
				dataType : 'json',
				success : function(data) {
					$('#guige').empty();
					$('#guize').val("");
					if (data && data.success == "true") {
						var $guige = "";
						$.each(data.spec,function(i, item) {
											var gui = item.attribute
													.split(',');
											var d = "";
											for (var j = 0; j < gui.length; j++) {
												d = d
														+ "<option value='"+gui[j]+"'>"
														+ gui[j]
														+ "</option>";
											}
											$guige = $guige
													+ "<dd><span id='"+i+"'>"
													+ item.specificatName
													+ "</span><select onchange='guigechange(this,"
													+ i
													+ ");'  name='' style='height:35px; width:303px; border:1px solid #ccc; margin-left: 7px'><option value='-1'>----请选择----</option>"
													+ d
													+ "</select></dd>";
										});
					}
					$('#guige').append($guige);
				}
			});
			var brand = document.getElementById('brand');
			var num = brand.options.length;
			for (i = num - 1; i >= 0; i--) {
				brand.remove(i);
			}
			var language = $("#language").val();
			var objOptionB = new Option("----请选择----", -1);
			brand.options[brand.options.length] = objOptionB;
			<c:forEach items="${shopCategory }" var="brands">
				<c:forEach items="${brands.brands }" var="brand">
					if ('${brand.shopCateg.categoryID }' == Code) {
						var objOption = new Option("${brand.brandName }",
								'${brand.brandID }');
						brand.options[brand.options.length] = objOption;
					}
				</c:forEach>
			</c:forEach>
		}
		function guigechange(obj, id) {
			var gui = $('#' + id).html();
			if(gui == '颜色'){
				$('#yanse').remove();
				var $guige ="<dd id='yanse'><span>该颜色商品照片</span><input type='file' name='yanse' /></dd>";
				$('#guige').append($guige);
			}
			var ze = obj.value;
			var guizes = $('#guize').val();
			var guize = guizes.split(',');
			var isok = false;
			var str = "";
			for (var i = 1; i < guize.length; i++) {
				if (guize[i].split('-')[0] == gui) {
					if (ze != '-1') {
						guize[i] = gui + '-' + ze;
						str = str + "," + guize[i];
					} else {
						guize[i] = "";
						str = str + guize[i];
					}
					isok = true;
				} else {
					str = str + "," + guize[i];
				}
			}
			if (isok) {
				$('#guize').val(str);
			} else {
				guizes = guizes + "," + gui + "-" + ze;
				$('#guize').val(guizes);
			}
		}
	</script>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

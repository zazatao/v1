<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/yl.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<!---------------   页面主体   ----------------------->
		<div class="dqwz" id="navbar">
			<a href="../index">首页</a>
		</div>
		<div class="nybtl" id="title"></div>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								var strs = '${nvabar}';
								var str = strs.split("|");
								var $guige = "";
								var $guige1 = "";
								for (var j = 0; j < str.length; j++) {
									if (j == 0) {
										if('${page}'=='brand'){
											$guige = $guige
											+ "> <a href='..proscenium/categoryLei?id=-1&page=brand'>"
											+ '品牌街'
											+ "</a> ";
										}else if('${page}'=='special'){
											$guige = $guige
											+ "> <a href='..proscenium/categoryLei?id=-1&page=special'>"
											+ '打折热卖产品'
											+ "</a> ";
										}else{
											$guige = $guige
											+ "> <a href='../proscenium/categoryOne?id="
											+ str[j].split("-")[0] + "'>"
											+ str[j].split("-")[1]
											+ "</a> ";
										}
									} else {
										$guige = $guige + "> <a href='#'>"
												+ str[j].split("-")[1]
												+ "</a> ";
									}
									if (j == str.length - 1) {
										$guige1 = ""
												+ str[j].split("-")[1]
												+ "</a> <div class='clear'></div>";
									}
								}
								$('#navbar').append($guige);
								$('#title').append($guige1);
							});
		</script>
		<jsp:include page="searchLeft.jsp" />
		<div class="nyright">
			<div class="nytjsx">
				<div class="nytjsxt">您的选择器</div>
				<div class="nytjsxn">
					<div class="tjsr">
						<ul>
							<li>
								<div class="tjsl">&nbsp;&nbsp;选择 :</div> <input
								style="width: 200px; height: 20px; margin: 8px 0 0 15px"
								name="searchName" type="text" />
							</li>
							<li class="tjsrck">
								<div class="tjsl">&nbsp;&nbsp;品牌 :</div>
								<ul>
									<c:forEach items="${brands }" var="brand">
<<<<<<< HEAD
										<li><input name="searchBrand" type="checkbox" onclick="searchs('${brand.brandID }','brand');"
											value="${brand.brandID }" />${brand.brandName }</li>
									</c:forEach>
								</ul>
								<div class="gd">更多...</div>
							</li>
							<c:forEach items="${specifications }" var="spec">
								<c:set value="${fn:split(spec.attribute, ',') }" var="attrs"></c:set>
								<c:choose>
									<c:when test="${spec.specificatName == '颜色' }">
										<li class="tjcal">
											<div class="tjsl">${spec.specificatName }</div>
											<ul>
												<c:forEach items="${attrs }" var="attr">
													<c:choose>
														<c:when test="${attr == '黑色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="黑色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #000;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '灰色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="灰色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #999;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '白色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="白色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #fff;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '粉色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="粉色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #fdd;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '红色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="红色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f00;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '玫红色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="玫红色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f08;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '紫色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="紫色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #a2e;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '蓝色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="蓝色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #18f;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '绿色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="绿色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #0b2;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '橙色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="橙色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f80;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '驼色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="驼色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #b97;"></span><b></b></a></li>
														</c:when>
													</c:choose>
												</c:forEach>
									</c:when>
									<c:otherwise>
										<li class="tjcm">
											<div class="tjsl">${spec.specificatName }</div>
											<ul>
												<c:forEach items="${attrs }" var="attr">
													<li><a href="javascript:;"
														onclick="searchs('${attr}','${spec.specificatName }');"
														class="black" title="${attr }">${attr }</a></li>
												</c:forEach>
									</c:otherwise>
								</c:choose>
						</ul>
							<div class="gd">更多...</div>
						</li>
						</c:forEach>
						<li class="tjcm">
							<div class="tjsl">价格 :</div> <a href="#" rel="nofollow"
							class="black" title="0-89" onclick="searchs('0@89','money');">0-89</a>
							<a href="#" rel="nofollow" class="black" title="90-199"
							onclick="searchs('90@199','money');">90-199</a> <a href="#"
							rel="nofollow" class="black" title="200-299"
							onclick="searchs('200@299','money');">200-299</a> <a href="#"
							rel="nofollow" class="black" title="300-399"
							onclick="searchs('300@399','money');">300-399</a> <a href="#"
							rel="nofollow" class="black" title="400-499"
							onclick="searchs('400@499','money');">400-499</a> <a href="#"
							rel="nofollow" class="black" title="500-599"
							onclick="searchs('500@599','money');">500-599</a> <a href="#"
							rel="nofollow" class="black" title="600-699"
							onclick="searchs('600@699','money');">600-699</a> <a href="#"
							rel="nofollow" class="black" title="700以上"
							onclick="searchs('700@%','money');">700以上</a> <input
							style="width: 30px; margin-left: 10px;" id="money1" type="text" />
							- <input id="money2" style="width: 30px;" type="text"  /> <input
							style="width: 40px; margin-left: 10px;" type="button" onclick="searchMoney();" value="确定" />
						</li>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<form action="./searchShopComm" id="paramForm" method="post" >
				<input id="params" name="params" type="hidden" value="${params }" />
				<input id="id" name="id" type="hidden" value="${id }" />
				<input id="page" name="page" type="hidden" value="${page }" />
			</form>
			<div class="rightcon">
				<script type="text/javascript">
					function searchMoney(){
						var isok = false;
						var str = "";
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var money = $('#money1').val()+"@"+$('#money2').val();
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'money') {
								guize[i] = "money-"+money;
								str = str + "," + guize[i];
								isok = true;
							}else{
								str = str + "," + guize[i];
							}
						}
						if (!isok) {
							str = str + ",money-"+money;
						}
						if(guize.length == 1){
							$('#params').val(",money-"+money);
						}else{
							$('#params').val(str);
						}
						$('#paramForm').submit();
					}
					function searchs(obj, name) {
						var isok = false;
						var str = "";
						var check = "";
						$("input[name='searchBrand']").each(function(){
							if($(this).attr('checked')){
								check = check + ",brand-"+$(this).val();
							}
						});
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == name) {
								if(guize[i].split('-')[0] == 'brand'){
									guize[i] = "";
									str = str + guize[i];
								}else{
									guize[i] = name+"-" + obj;
									str = str + "," + guize[i];
								}
								isok = true;
							}else{
								if(guize[i].split('-')[0] == 'brand'){
									guize[i] = "";
									str = str + guize[i];
								}else{
									str = str + "," + guize[i];
								}
							}
						}
						if (!isok) {
							str = str + ","+name+"-" + obj ;
						}
						if(guize.length == 1){
							$('#params').val(","+name+"-" + obj);
						}else{
							$('#params').val(str+check);
						}
						$('#paramForm').submit(); 
					}
					
					$(document).ready(function(){
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var ze = "";
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'brand') {
								ze = ze +","+ guize[i].split('-')[1];
							}
						}
						var zes = ze.split(',');
						$("input[name='searchBrand']").each(function(){
							for (var j = 1; j < zes.length; j++) {
								if($(this).val() == zes[j]){
									$(this).attr('checked',true);
								}
							}
						});
					});
					$(document)
							.ready(
									function(e) {
										var navLi = $("#navhd ul li"), navUl = $("#navhd ul"), speed = 0;
										function OnClick() {
											n = navUl.find("li.on").index();
											navUl
													.stop()
													.animate(
															{
																backgroundPositionX : navLi
																		.width()
																		* n
																		+ 57
															}, speed);
										}
										OnClick();
										navLi
												.hover(
														function() {
															n = $(this).index();
															navUl
																	.stop()
																	.animate(
																			{
																				backgroundPosition : navLi
																						.width()
																						* n
																						+ 57,
																				backgroundPositionY : 0
																			},
																			speed);
														}, function() {
															OnClick();
														})
										navLi.click(function() {
											$(this).addClass("on").siblings()
													.removeClass("on")
										});
										$(window)
												.scroll(
														function() {
															if ($(window)
																	.scrollTop() > $(
																	"#nav")
																	.height() + 50) {
																$("#nav")
																		.addClass(
																				"scoll_nav")
															} else {
																$("#nav")
																		.removeClass(
																				"scoll_nav")
															}
														});
									});
					$(document).ready(
							function() {

								$(".slider li").click(
										function() {
											$(this).addClass("current")
													.siblings().removeClass(
															"current");
											var onclkj = $(this).parents("h")
													.siblings("a").find("img");
											$(onclkj).attr(
													'src',
													$(this).find("img").attr(
															"src"));
										});

							});
				</script>
				<div id="nav">
					<div id="navhd">
						<ul>
							<li class="on"><a href="#">Популярные</a></li>
							<li><a href="#">На повышение</a></li>
							<li><a href="#">На понижение</a></li>
							<li><a href="#">Со скидкой</a></li>
							<li><a href="#">Новинки</a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
				<div class="fzcon">
					<ul>
						<c:forEach items="${list }" var="commShop">
							<li><a href="../proscenium/shopItem?commID=${commShop.commCode }&category=${id }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><img
									src="..${commShop.shopCommImages[0].imagePath }" /></a> <h>
								<dl>
									<dt>
										<div class="arrow-btn arrow-btnleft dasabled"></div>
										<div class="slider">
											<ul>
												<c:forEach items="${commShop.shopCommImages }" var="image">
													<li class="current"><img src="..${image.imagePath }" /></li>
												</c:forEach>
											</ul>
										</div>
										<div class="arrow-btn arrow-btnright"></div>
										<div class="slidernumb" style="display: none;">0</div>
									</dt>
									<dd>
										<span class="red">$ ${commShop.unitPrice }</span><span
											class="p1"><a href="../proscenium/shopItem?commID=${commShop.commCode }&category=${id }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }">
											<img src="../content/static/images/con_10.png" /></a></span><span
											class="p2"><a href="#"><img
=======
										<li><input name="searchBrand" type="checkbox"
											onclick="searchs('${brand.brandID }','brand');"
											value="${brand.brandID }" />${brand.brandName }</li>
									</c:forEach>
								</ul>
								<div class="gd">更多...</div>
							</li>
							<c:forEach items="${specifications }" var="spec">
								<c:set value="${fn:split(spec.attribute, ',') }" var="attrs"></c:set>
								<c:choose>
									<c:when test="${spec.specificatName == '颜色' }">
										<li class="tjcal">
											<div class="tjsl">${spec.specificatName }</div>
											<ul>
												<c:forEach items="${attrs }" var="attr">
													<c:choose>
														<c:when test="${attr == '黑色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="黑色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #000;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '灰色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="灰色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #999;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '白色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="白色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #fff;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '粉色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="粉色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #fdd;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '红色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="红色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f00;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '玫红色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="玫红色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f08;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '紫色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="紫色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #a2e;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '蓝色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="蓝色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #18f;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '绿色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="绿色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #0b2;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '橙色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="橙色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #f80;"></span><b></b></a></li>
														</c:when>
														<c:when test="${attr == '驼色'}">
															<li><a href="#" rel="nofollow" class="black"
																title="驼色"><span
																	onclick="searchs('${attr}','${spec.specificatName }');"
																	style="background-color: #b97;"></span><b></b></a></li>
														</c:when>
													</c:choose>
												</c:forEach>
									</c:when>
									<c:otherwise>
										<li class="tjcm">
											<div class="tjsl">${spec.specificatName }</div>
											<ul>
												<c:forEach items="${attrs }" var="attr">
													<li><a href="javascript:;"
														onclick="searchs('${attr}','${spec.specificatName }');"
														class="black" title="${attr }">${attr }</a></li>
												</c:forEach>
									</c:otherwise>
								</c:choose>
						</ul>
						<div class="gd">更多...</div>
						</li>
						</c:forEach>
						<li class="tjcm">
							<div class="tjsl">价格 :</div> <a href="#" rel="nofollow"
							class="black" title="0-89" onclick="searchs('0@89','money');">0-89</a>
							<a href="#" rel="nofollow" class="black" title="90-199"
							onclick="searchs('90@199','money');">90-199</a> <a href="#"
							rel="nofollow" class="black" title="200-299"
							onclick="searchs('200@299','money');">200-299</a> <a href="#"
							rel="nofollow" class="black" title="300-399"
							onclick="searchs('300@399','money');">300-399</a> <a href="#"
							rel="nofollow" class="black" title="400-499"
							onclick="searchs('400@499','money');">400-499</a> <a href="#"
							rel="nofollow" class="black" title="500-599"
							onclick="searchs('500@599','money');">500-599</a> <a href="#"
							rel="nofollow" class="black" title="600-699"
							onclick="searchs('600@699','money');">600-699</a> <a href="#"
							rel="nofollow" class="black" title="700以上"
							onclick="searchs('700@%','money');">700以上</a> <input
							style="width: 30px; margin-left: 10px;" id="money1" type="text" />
							- <input id="money2" style="width: 30px;" type="text" /> <input
							style="width: 40px; margin-left: 10px;" type="button"
							onclick="searchMoney();" value="确定" />
						</li>
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<form action="./searchShopComm" id="paramForm" method="post">
				<input id="params" name="params" type="hidden" value="${params }" />
				<input id="id" name="id" type="hidden" value="${id }" /> <input
					id="page" name="page" type="hidden" value="${page }" />
			</form>
			<div class="rightcon">
				<script type="text/javascript">
					function searchMoney(){
						var isok = false;
						var str = "";
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var money = $('#money1').val()+"@"+$('#money2').val();
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'money') {
								guize[i] = "money-"+money;
								str = str + "," + guize[i];
								isok = true;
							}else{
								str = str + "," + guize[i];
							}
						}
						if (!isok) {
							str = str + ",money-"+money;
						}
						if(guize.length == 1){
							$('#params').val(",money-"+money);
						}else{
							$('#params').val(str);
						}
						$('#paramForm').submit();
					}
					function searchs(obj, name) {
						var isok = false;
						var str = "";
						var check = "";
						$("input[name='searchBrand']").each(function(){
							if($(this).attr('checked')){
								check = check + ",brand-"+$(this).val();
							}
						});
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == name) {
								if(guize[i].split('-')[0] == 'brand'){
									guize[i] = "";
									str = str + guize[i];
								}else{
									guize[i] = name+"-" + obj;
									str = str + "," + guize[i];
								}
								isok = true;
							}else{
								if(guize[i].split('-')[0] == 'brand'){
									guize[i] = "";
									str = str + guize[i];
								}else{
									str = str + "," + guize[i];
								}
							}
						}
						if (!isok) {
							str = str + ","+name+"-" + obj ;
						}
						if(guize.length == 1){
							$('#params').val(","+name+"-" + obj);
						}else{
							$('#params').val(str+check);
						}
						$('#paramForm').submit(); 
					}
					
					$(document).ready(function(){
						var searchParam = $('#params').val();
						var guize = searchParam.split(',');
						var ze = "";
						for (var i = 1; i < guize.length; i++) {
							if (guize[i].split('-')[0] == 'brand') {
								ze = ze +","+ guize[i].split('-')[1];
							}
						}
						var zes = ze.split(',');
						$("input[name='searchBrand']").each(function(){
							for (var j = 1; j < zes.length; j++) {
								if($(this).val() == zes[j]){
									$(this).attr('checked',true);
								}
							}
						});
					});
					$(document)
							.ready(
									function(e) {
										var navLi = $("#navhd ul li"), navUl = $("#navhd ul"), speed = 0;
										function OnClick() {
											n = navUl.find("li.on").index();
											navUl
													.stop()
													.animate(
															{
																backgroundPositionX : navLi
																		.width()
																		* n
																		+ 57
															}, speed);
										}
										OnClick();
										navLi
												.hover(
														function() {
															n = $(this).index();
															navUl
																	.stop()
																	.animate(
																			{
																				backgroundPosition : navLi
																						.width()
																						* n
																						+ 57,
																				backgroundPositionY : 0
																			},
																			speed);
														}, function() {
															OnClick();
														})
										navLi.click(function() {
											$(this).addClass("on").siblings()
													.removeClass("on")
										});
										$(window)
												.scroll(
														function() {
															if ($(window)
																	.scrollTop() > $(
																	"#nav")
																	.height() + 50) {
																$("#nav")
																		.addClass(
																				"scoll_nav")
															} else {
																$("#nav")
																		.removeClass(
																				"scoll_nav")
															}
														});
									});
					$(document).ready(
							function() {

								$(".slider li").click(
										function() {
											$(this).addClass("current")
													.siblings().removeClass(
															"current");
											var onclkj = $(this).parents("h")
													.siblings("a").find("img");
											$(onclkj).attr(
													'src',
													$(this).find("img").attr(
															"src"));
										});

							});
				</script>
				<div id="nav">
					<div id="navhd">
						<ul>
							<li class="on"><a href="#">Популярные</a></li>
							<li><a href="#">На повышение</a></li>
							<li><a href="#">На понижение</a></li>
							<li><a href="#">Со скидкой</a></li>
							<li><a href="#">Новинки</a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
				<div class="fzcon">
					<ul>
						<c:forEach items="${list }" var="commShop">
							<li><a
								href="../proscenium/shopItem?commID=${commShop.commCode }&category=${id }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }"><img
									src="..${commShop.shopCommImages[0].imagePath }" /></a> <h>
								<dl>
									<dt>
										<div class="arrow-btn arrow-btnleft dasabled"></div>
										<div class="slider">
											<ul>
												<c:forEach items="${commShop.shopCommImages }" var="image">
													<li class="current"><img src="..${image.imagePath }" /></li>
												</c:forEach>
											</ul>
										</div>
										<div class="arrow-btn arrow-btnright"></div>
										<div class="slidernumb" style="display: none;">0</div>
									</dt>
									<dd>
										<span class="red">$ ${commShop.unitPrice }</span><span
											class="p1"><a
											href="../proscenium/shopItem?commID=${commShop.commCode }&category=${id }&shopID=${commShop.belongTo.id }&commoName=${commShop.commoidtyName }">
												<img src="../content/static/images/con_10.png" />
										</a></span><span class="p2"><a href="#"><img
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git
												src="../content/static/images/con_11.png" /></a></span>
									</dd>
									<dd>
										店铺:<span class="red">${commShop.belongTo.shopName }</span>
									</dd>
									<dd class="hg">
										<img src="../content/static/images/con_12.png" width="85"
											height="21" />
									</dd>
									<dd>
										<p>已有多少人评价</p>
									</dd>
								</dl>
								</h></li>
						</c:forEach>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

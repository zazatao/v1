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
<link href="../content/static/css/reception/yl.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<SCRIPT src="../content/static/js/reception/ScrollPic.js"
	type=text/javascript></SCRIPT>
<script type="text/javascript"
	src="../content/static/js/reception/Marquee.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.jqzoom.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.imagezoom.min.js"></script>
</head>
<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<!---------------   页面主体   ----------------------->
		<div class="dqwz" id="navbar">
			<a href="../index">
			<c:if test="${sessionScope.language == 'chinese' }">首页</c:if>
			<c:if test="${sessionScope.language == 'russina' }">我是俄语首页</c:if>
			</a>
		</div>
		<script type="text/javascript">
			$(document)
					.ready(
							function() {
								var strs = '${nvabar}';
								var str = strs.split("|");
								var $guige = "";
								for (var j = 0; j < str.length; j++) {
									if (j == 0) {
										$guige = $guige
												+ "> <a href='../proscenium/categoryOne?id="
												+ str[j].split("-")[0] + "'>"
												+ str[j].split("-")[1]
												+ "</a> ";
									} else {
										$guige = $guige + "> <a href='#'>"
												+ str[j].split("-")[1]
												+ "</a> ";
									}
								}
								$('#navbar').append($guige);
							});
		</script>
		<!-----left_y start-------->
		<div class="left_y">
			<div class="left_ytop">
				<!-----------lb_pic start-------------->
				<div class="lb_pic">
					<div class="tb-booth tb-pic tb-s310">
						<img src="..${shopCommoidty.shopCommImages[0].imagePath }"
							rel="..${shopCommoidty.shopCommImages[0].imagePath }"
							class="jqzoom" />
					</div>
					<div class="lb_piclelist">
						<div id="btn-left" class="lb_piclelistbtn dasabled"></div>
						<div class="lb_picle">
							<ul class="tbaqw">
								<c:forEach items="${shopCommoidty.shopCommImages }"
									var="imageCommo">
									<li class="left_none"><img
										src="..${imageCommo.imagePath }" /></li>
								</c:forEach>
							</ul>
						</div>
						<div id="btn-right" class="lb_piclelistbtn"></div>
					</div>
					<p>
						发给朋友<a href="#"><img
							src="../content/static/images/small/con_2.png" /></a><a href="#"><img
							src="../content/static/images/small/con_3.png" /></a> <a href="#"><img
							src="../content/static/images/small/con_4.png" /></a><a href="#"><img
							src="../content/static/images/small/con_5.png" /></a> <a href="#"><img
							src="../content/static/images/small/con_6.png" /></a><a href="#"><img
							src="../content/static/images/small/con_7.png" /></a> <a href="#"><img
							src="../content/static/images/small/con_8.png" /></a>
					</p>
					<p>
						卖家:
						<c:if test="${sessionScope.language == 'chinese' }">${shopCommoidty.belongTo.shopName }</c:if>
						<c:if test="${sessionScope.language == 'russina' }">${shopCommoidty.belongTo.russinaShopName }</c:if>
						
						<c:if test="${user != null && user.shop.isPermit == true && user.shop.id != shopCommoidty.belongTo.id}">
							<span onclick="addSupplier();">添加</span>
						</c:if>
					</p>
					<p>
						<img src="../content/static/images/small/con_9.png" />
					</p>
				</div>
				<!-----------lb_pic over-------------->
				<!-------        放大镜ja        ----------->
				<script type="text/javascript">
					function addSupplier(){
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : '../proscenium/addSupplier?commID=${shopCommoidty.commCode }&category=${shopCommoidty.shopCategory.categoryID }&shopID=${shopCommoidty.belongTo.id }&commoName=${shopCommoidty.commoidtyName }',
							dataType : 'json',
							success : function(data) {
								if(data.success == 'true'){
									alert('已将该商品加入到您的商铺中！！！');
								}
								if(data.success == 'false'){
									alert('对不起,添加失败！！或该商品已加入到您的商铺中！！！');
								}
							}
						});
					}
					$(document).ready(
							function() {
								$(".jqzoom").imagezoom();
								$(".tbaqw li").click(
										function() {
											$(this).addClass("left_red")
													.siblings().removeClass(
															"left_red");
											$(".jqzoom").attr(
													'src',
													$(this).find("img").attr(
															"src"));
											$(".jqzoom").attr(
													'rel',
													$(this).find("img").attr(
															"src"));
										});
								$(".choice_cm a").click(
										function() {
											$(this).addClass("chicon")
													.siblings().removeClass(
															"chicon");
										});
								$(".choice_color span").click(
										function() {
											$(this).addClass("choice_colorspr")
													.siblings().removeClass(
															"choice_colorspr");
											$(".jqzoom").attr(
													'src',
													$(this).find("img").attr(
															"src"));
											$(".jqzoom").attr(
													'rel',
													$(this).find("img").attr(
															"src"));
										});

							});
				</script>
				<!-----------lb_detail start-------------->
				<div class="lb_detail">
					<h1>
					<c:if test="${sessionScope.language == 'chinese' }">${shopCommoidty.commoidtyName }</c:if>
					<c:if test="${sessionScope.language == 'russina' }">${shopCommoidty.russinaCommoidtyName }</c:if>
					<p></p>
					</h1>
					<h2>
						现价：
						<c:if test="${shopCommoidty.isSpecial }">
							<span class="red">${shopCommoidty.currency.symbol } <fmt:formatNumber
								value="${shopCommoidty.unitPrice * shopCommoidty.special  +surs[0].fare }"
								pattern="##.##" minFractionDigits="2"></fmt:formatNumber></span>
						</c:if>
						<c:if test="${!shopCommoidty.isSpecial }">
							<span class="red">${shopCommoidty.currency.symbol }
							<fmt:formatNumber
								value="${shopCommoidty.unitPrice + surs[0].fare}"
								pattern="##.##" minFractionDigits="2">
							</fmt:formatNumber>
							</span>
						</c:if>						
						<p>
							原价：<span class="thr">${shopCommoidty.currency.symbol }${shopCommoidty.unitPrice + surs[0].fare}
							<input type="hidden" id="fare" value="${surs[0].fare}"></span>
						</p>
					</h2>
					<div class="tg">
						<p><a href="#" onclick="collectionClick('../getShopCategory/addCollection?commID=${shopCommoidty.commCode }');">
                    		<img src="../content/static/images/con_11.png"/></a></p>
                    </div>
					
					<div class="th">
						<p class="thts">大概重量&nbsp;${shopCommoidty.probablyWeight}KG</p>
						<span class="thon"><img
							src="../content/static/images/small/con_1.png" /></span>
						<div class="gucjmth">
							<div class="gucjmthckl">
								<h3>
									文本说明！<span class="gucjmthone">X</span>
								</h3>
								<p>*********** ******** ******</p>
								<p>***** * ** * *****</p>
							</div>
						</div>
					</div>
					<ul>
						<li><p>
								<span class="n1">216</span><br />已经卖了
							</p></li>
						<li><p class="bd_both">
								<span class="n2">216</span><br />评价<br />
								<span class="n3"><img
									src="../content/static/images/small/xx_1.png" />4.9</span>
							</p></li>
						<li><p>
								<span class="n4">216</span>
							</p></li>
					</ul>
					<c:forEach items="${map }" var="keySet" >
						<c:if test="${keySet.key == '颜色' }">
							<div class="choice_color">
							选择颜色：
								<c:forEach items="${keySet.value }" var="spec">
									<c:set var="index1" value="${fn:indexOf(spec, '$') }"></c:set>
									<c:set var="index2" value="${fn:length(spec) }"></c:set>
									<span title="${keySet.key }-${fn:substring(spec, 0, index1)}" onclick="searchs('${keySet.key}','${spec}');" ><img src="..${fn:substring(spec, index1+1, index2)}" /></span>
								</c:forEach>
							</div>
						</c:if>
						<c:if test="${keySet.key != '颜色' }">
							<div class="choice_cm">
								选择${keySet.key }：
								<c:forEach items="${keySet.value }" var="spec">
									<a name="c22" title="${keySet.key }-${spec}" onclick="searchs('${keySet.key}','${spec}');">${spec }</a>
								</c:forEach>
							</div>
						</c:if>
					</c:forEach>
					<div class="choice_sl">
						<span style="float: left">选择数量：</span>
						<div style="float: left">
							<input class="btn_prev gy" name="" type="button" value="-" /> <input
								class="texnum ct" id="buyAmount" type="text" value="1" /> <input
								class="btn_next gy" name="" type="button" value="+" />
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Ha CYMMY&nbsp;&nbsp;&nbsp;<span
							class="red">22222￥</span>
						<p>Bcero B Ha..:765.</p>
					</div>
					<div class="anniu">
						<a onclick="buyCat();"><img src="../content/static/images/bt_2.png" /></a>
						<a href="#"><img src="../content/static/images/bt_3.png" /></a>
						<img src="../content/static/images/xx.png" />
					</div>
					<input id="params" type="hidden">
					<input id="commID" type="hidden" value="${shopCommoidty.commCode }">
					<script type="text/javascript">
						function buyCat(){
							var commID = $('#commID').val();
							var params = $('#params').val();
							var buyAmount = $('#buyAmount').val();
							var fare = $('#fare').val();
							if(params != ""){
							jQuery.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : '../proscenium/buyCat?params='+params+'&commID='+commID+'&buyAmount='+buyAmount+'&fare='+fare,
								dataType : 'json',
								success : function(data) {
									if(data.success == 'true'){
										$(".gucjm").css("display", "block");
									}
								}
							});
							}else{
								alert("请选择型号或规格");
							}
						}
						function gui7212(ements,name,obj){
							$(ements).parent('div').siblings().filter('.choice_color').children('span').each(
									function(){  
											$(this).css("display", "none");		
							 		}
								);
							var  element = ements;
							var gui = $(ements).attr("title");
							var commID = $('#commID').val();
						    var gui = $(ements).attr("title");
							jQuery
							.ajax({
								type : 'GET',
								contentType : 'application/json',
								url : '../proscenium/getShopCommSpeces?speces='+gui+'&id='+commID ,
								dataType : 'json',
								success : function(data) {
									$.each(data.mySpeces,function(i,spec) {
										var strs = spec.split('@');
										for (var j = 0; j < strs.length; j++) {
											var sss = strs[j];
											if(sss != ''){
											$(element).parent('div').siblings().filter('.choice_color').children('span').each(
													function(){  
														if (sss.split('$')[0]==$(this).attr("title")) {
															
														}
											 		}
												);
											}
										}
									});
								}
							});
						}
						function searchs(name, obj) {
							var isok = false;
							var str = "";
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
								$('#params').val(str);
							}
						}
						$(function() {
							//获得文本框对象
							//数量增加操作
							$(".btn_next").click(
									function() {
										var t = $(this).siblings('.ct');
										t.val(parseInt(t.val()) + 1)
										if (parseInt(t.val()) > 1) {
											$(this).siblings('.btn_prev').attr(
													'disabled', false);
										}
									})
							//数量减少操作
							$(".btn_prev").click(function() {
								var t = $(this).siblings('.texnum');
								t.val(parseInt(t.val()) - 1);
								if (parseInt(t.val()) <= 1) {
									$(this).attr('disabled', true);
								}
							})

						})
						$(document).ready(function() {
							$(".jrgwc").click(function() {
								$(".gucjm").css("display", "block");
							});
							$(".gucjnone").click(function() {
								$(".gucjm").css("display", "none");
							});
							$(".thon").click(function() {
								$(".gucjmth").toggle();
							});
							$(".gucjmthone").click(function() {
								$(".gucjmth").hide();
							});
							$("#m01").mouseover(function(){
								$("#c01").css("display", "block");
								$("#c02").hide();
								$("#c03").hide();
							});
							$("#m02").mouseover(function(){
								$("#c02").css("display", "block");
								$("#c01").hide();
								$("#c03").hide();
							});
							$("#m03").mouseover(function(){
								$("#c03").css("display", "block");
								$("#c01").hide();
								$("#c02").hide();
							});
						});
					</script>
					<div class="gucjm">
						<div class="gucjnone">111111111</div>
						<div class="gucjonckl">
							<span><img src="../content/static/images/small/kd_2.png" />添加成功！</span>
							<p>
								<a href="#" class="gucjnone" >继续购物</a>
							</p>
							<p>
								<a href="./shopcar">进入购物车</a>
							</p>
						</div>
					</div>
				</div>
				<!-----------lb_detail start-------------->
			</div>
			<div class="clear"></div>
			<div class="left_ycenter1">
				<h1>
					<img src="../content/static/images/dz/tit_5.png" />
				</h1>
				<div class="sp">
					<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
					<p>
						<a href="#">chenshanchenzshanndhcnnaaha</a>
					</p>
				</div>
				<div class="sp_over">
					<p>
						<img src="../content/static/images/small/jiahao.png" />
					</p>
					<dl>
						<dt>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dt>
						<dd>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dd>
						<dd>
							<input type="checkbox" /><span class="red">109</span>
						</dd>
					</dl>
					<p>
						<img src="../content/static/images/small/jiahao.png" />
					</p>
					<dl>
						<dt>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dt>
						<dd>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dd>
						<dd>
							<input type="checkbox" /><span class="red">109</span>
						</dd>
					</dl>
					<p>
						<img src="../content/static/images/small/jiahao.png" />
					</p>
					<dl>
						<dt>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dt>
						<dd>
							<a href="#"><img src="../content/static/images/dz/y1.jpg" /></a>
						</dd>
						<dd>
							<input type="checkbox" /><span class="red">109</span>
						</dd>
					</dl>
				</div>
				<div class="buy">
					<p>
						<img src="../content/static/images/small/dengyu.png" />
					</p>
					<dl>
						<dt>购买人气组合</dt>
						<dd>
							京东价：<span class="red">￥159</span>
						</dd>
						<dd>
							总参考价：<span class="th">￥548</span>
						</dd>
						<dd>
							<a href="#"><img src="../content/static/images/small/buy.png" /></a>
						</dd>
					</dl>
				</div>
			</div>
			<div class="scrolldoorFrame">
				<ul class="scrollUl">
					<li class="sd01" id="m01">来自买家评论</li>
					<li  id="m02" >商品详情<li>
					<li  id="m03" >商品详情</li>
				</ul>
				<div class="bor03 cont">
					<div id="c01">
				 <c:choose>	 
				   <c:when test="${not empty reviewslist}">  
					<ul class="ordersall">
					    <li class="ordersli1">评论等级</li>
						<li class="ordersli2">买家</li>
						<li class="ordersli3">商品名称</li>
						<li class="ordersli4">评论时间</li>
						<li class="ordersli5">评论内容</li>
					</ul>
						<c:forEach items="${reviewslist}" var="reviews">
						    <ul class="ordersall">
						    <li style="margin-left: 45px;"><img style="border-width: 0px;" src="..${reviews.rankImagesPath}" /></li>
							<li class="ordersli2" style="margin-left: 50px;"><div class="midl">${reviews.user.loginName}</div></li>
							<li class="ordersli3"><div class="midl">
							<c:if test="${sessionScope.language == 'chinese' }">${reviews.shopscommodity.commoidtyName}</c:if>
							<c:if test="${sessionScope.language == 'russina' }">${reviews.shopscommodity.russinaCommoidtyName}</c:if>
							</div></li>
							<li class="ordersli4"><div class="midl">${reviews.reviewsdate}</div></li>
							<li class="ordersli5"><div class="midl">${reviews.reviews}</div></li>
							</ul>
						</c:forEach>
				    </c:when>
					<c:otherwise>
					           <p style="margin-left: 40px;color:red">暂无评论</p>
					</c:otherwise>
					</c:choose>
					    
					</div>
					<div id="c02" style="display: none">123456</div>
					<div id="c03" style="display: none">456789</div>
				</div>
			</div>
			<div class="left_ybottom">
				<h1>
					<img src="../content/static/images/small/tit_11.png" />
				</h1>
				<div class="catalog_img_2">
					<DIV class="LeftBotton" id="LeftArr"></DIV>
					<DIV class="Cont" id="ISL_Cont_1">
						<!-- 图片列表 begin -->
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/dz/img050.jpg" />
							<p>
									$233<span class="th">$577</span>
								</p></A>
						</DIV>
						<!-- 图片列表 end -->
					</DIV>

					<DIV class="RightBotton" id="RightArr"></DIV>
				</DIV>

				<SCRIPT language=javascript type=text/javascript>
				<!--//--><![CDATA[//><!--
					var scrollPic_02 = new ScrollPic();
					scrollPic_02.scrollContId = "ISL_Cont_1"; //内容容器ID
					scrollPic_02.arrLeftId = "LeftArr";//左箭头ID
					scrollPic_02.arrRightId = "RightArr"; //右箭头ID

					scrollPic_02.frameWidth = 700; //显示框宽度
					scrollPic_02.pageWidth = 140; //翻页宽度

					scrollPic_02.speed = 10; //移动速度(单位毫秒，越小越快)
					scrollPic_02.space = 10; //每次移动像素(单位px，越大越快)
					scrollPic_02.autoPlay = false; //自动播放
					scrollPic_02.autoPlayTime = 3; //自动播放间隔时间(秒)

					scrollPic_02.initialize(); //初始化

					//--><!]]>
				</SCRIPT>
			</div>
		</div>
		<!-----left_y over-------->

		<!-----right_y start-------->
		<div class="right_y">
			<h1>
				<img src="../content/static/images/small/tit_12.png" />
			</h1>
			<div class="sc">
				<div class="scup">
					<img src="../content/static/images/small/jiantou1.png" />
				</div>
				<div class="scall">
					<ul>
						<c:forEach var="advertisement" items="${advertisements1 }" varStatus="pool">
    						<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/><span>$889</span></a></li>
    					</c:forEach>
						<!-- <li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li>
						<li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li>
						<li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li>
						<li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li>
						<li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li>
						<li><a href="yl_list_detail.html"><img
								src="../content/static/images/dz/img051.jpg" /><span>$889</span></a></li> -->
					</ul>
				</div>
				<div class="scdn">
					<img src="../content/static/images/small/jiantou2.png" />
				</div>
			</div>
			<script type="text/javascript">
				$(function() {
					//一次纵向滚动一个
					$('.scall').kxbdSuperMarquee({
						distance : 198,
						time : 3,
						btnGo : {
							up : '.scup',
							down : '.scdn'
						},
						direction : 'down'
					});

				});
			</script>
			<div class="sc_2">
				<h2>Вы не давно просматривали</h2>
				<div class="leftpg">
					<img src="../content/static/images/small/left_pg2.png" />
				</div>
				<div class="sc2all">
					<ul>
						<c:forEach var="advertisement" items="${advertisements2 }" varStatus="pool">
    						<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/></a></li>
    					</c:forEach>
						<!-- <li><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a></li>
						<li><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a></li> -->
					</ul>
				</div>
				<div class="rightpg">
					<img src="../content/static/images/small/right_pg2.png" />
				</div>
			</div>
			<script type="text/javascript">
				$('.sc_2 .sc2all').kxbdSuperMarquee({
					distance : 100,
					time : 3,
					btnGo : {
						left : '.sc_2 .leftpg',
						right : '.sc_2 .rightpg'
					},
					direction : 'left'
				});
			</script>

			<div class="sc_3">
				<h2>Вы не давно просматривали</h2>
				<div class="leftpg">
					<img src="../content/static/images/small/left_pg2.png" />
				</div>
				<div class="sc2all">
					<ul>
						<c:forEach var="advertisement" items="${advertisements3 }" varStatus="pool">
    						<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/></a></li>
    					</c:forEach>
						<!-- <li><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a></li>
						<li><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a><a href="#"><img
								src="../content/static/images/dz/img051.jpg" /></a></li> -->
					</ul>
				</div>
				<div class="rightpg">
					<img src="../content/static/images/small/right_pg2.png" />
				</div>
			</div>
			<script type="text/javascript">
				$('.sc_3 .sc2all').kxbdSuperMarquee({
					distance : 100,
					time : 3,
					btnGo : {
						left : '.sc_3 .leftpg',
						right : '.sc_3 .rightpg'
					},
					direction : 'right'
				});
			</script>

		</div>
		<!-----right_y over-------->
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
	
	<script type="text/javascript">	
	function collectionClick(paramUrl){
		jQuery.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : paramUrl,
			dataType : 'json',
			success : function(data) {
				if( data.success == "true" ){
					alert('亲，已经加入收藏夹了哦！');
				}
				
				else if ( data.success == "existed" ) {
					alert('收藏夹已经有这个宝贝了，亲是有多喜欢她啊！');
				}
				
				else if ( data.success == "nouser" ) {
					if (confirm('您还没有登录哦！')) {
						var url="../user/login"; 
						window.location=url;
					} 
				}
			}
		});	
	}
	</script>
	
</body>
</html>

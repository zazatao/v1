<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="topfd">
		<!---------------   浮动头部   ----------------------->
		<div class="topnone"><input id="language" type="hidden" value="${sessionScope.language}" /></div>
		<div class="top1">
			<div class="logo">
				<a href="../index"><img src="../content/static/images/logo.jpg"
					width="162" height="62" /></a>
			</div>
			<div class="znss">
				<div class="ssk">
					<form action="/searchComm" method="post">
						<input value="搜索" name="content" type="text" onfocus="this.value=''"
							onblur="if(this.value==''){this.value='搜索';}" />
						<button type="submit">搜索</button>
					</form>
				</div>
			</div>

			<div class="top_tel">
				<img src="../content/static/images/top_sj.png" />
				<p>
					全球统一客服电话<br />
					<span class="red">152386895258</span>
				</p>
			</div>
			<div class="gwctb">
				<a href="../proscenium/shopcar"><img src="../content/static/images/gwc.jpg"
					width="63" height="43" /></a>
			</div>
			<div class="clear"></div>
			<div class="qbfl">
				<a href="../index?language=chinese"><img src="../content/static/images/china.jpg" /></a>
				<a href="../index?language=russina"><img src="../content/static/images/eluosi.jpg" /></a>
			</div>
		</div>
		<div class="topnone"></div>
	</div>

	<div class="topnone"></div>
	<div class="topfn">
		<div style="height: 78px;"></div>
		<div class="dlzc">
			<ul>
				<li><a href="../user/myoffice">我的办公室</a></li>
				<li><a href="../user/login">请登记</a></li>
				<li class="zc"><a href="../user/regist">免费注册</a></li>
				<li><a href="#">客户服务</a>
					<div class="filexlcd">
						<ul>
							<li><a href="#" onclick="ib_wopen();"><span><img
										src="../content/static/images/brand/filel_02.png" /></span>提问和回答</a></li>
							<li><a href="#"><span><img
										src="../content/static/images/brand/filel_17.png" /></span>如何找到合适商品在产品目录</a></li>
							<li><a href="#"><span><img
										src="../content/static/images/brand/filel_01.png" /></span>关于zazatao.com的服务</a></li>
							<li><a href="#"><span><img
										src="../content/static/images/brand/filel_05.png" /></span>运费 </a></li>
							<li><a href="../proscenium/shopcar"><span><img
										src="../content/static/images/brand/filel_18.png" /></span>购物袋</a></li>
							<li><a href="#contactus"><span><img
										src="../content/static/images/brand/filel_19.png" /></span>联系我们</a></li>
						</ul>
					</div></li>
				<li style="background: #fff; height: 32px; margin-top: 1px;"><a
					style="color: #000;" href="../proscenium/shopcar" id="buyCatNum">购物车(0)</a></li>
			</ul>
			<div class="clear"></div>
		</div>
	</div>
	<div class="top">
		<div class="menu">
			<!---------------   菜单   ----------------------->
			<div class="menu1">
				<ul class="navf" id="navShopCaegory1">
					<li class="bg_none"><a href="../index"><img
							src="../content/static/images/fzan.jpg" width="16" height="17" /></a></li>
					<c:forEach items="${shopCategories }" var="shopCategory">
						<c:if test="${shopCategory.level == 1 && shopCategory.category != '汽车用具' && shopCategory.category != '电子产品' }">
							<li>
							<a href="../proscenium/categoryOne?id=${shopCategory.categoryID}">
							<c:if test="${sessionScope.language == 'chinese'}">${shopCategory.category }</c:if>
							<c:if test="${sessionScope.language == 'russina'}">${shopCategory.russinaCategory }</c:if>
							</a>
							<div>
									<c:forEach items="${shopCategory.children }" var="shopCategory2">
										<c:if test="${shopCategory2.level == 2  }">
											<c:if test="${sessionScope.language == 'chinese'}">
												<div class="nav-column"><h3>${shopCategory2.category }</h3>
											</c:if>
											<c:if test="${sessionScope.language == 'russina'}">
												<div class="nav-column"><h3>${shopCategory2.russinaCategory }</h3>
											</c:if>
											<ul>
												<c:forEach  items="${shopCategory2.children }" var="shopCategory3">
													<c:if test="${shopCategory3.level == 3 }">
														<c:if test="${sessionScope.language == 'chinese'}">
															<li><a href='../proscenium/shopCommItem?id=${shopCategory3.categoryID }&page=page'>${shopCategory3.category }</a></li>
														</c:if>
														<c:if test="${sessionScope.language == 'russina'}">
															<li><a href='../proscenium/shopCommItem?id=${shopCategory3.categoryID }&page=page'>${shopCategory3.russinaCategory }</a></li>
														</c:if>
													</c:if>
												</c:forEach>
											</ul>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="menu2">
				<ul class="navf nav_2" id="navShopCaegory2">
				<c:forEach items="${shopCategories }" var="shopCategory">
						<c:if test="${shopCategory.level == 1 && (shopCategory.category == '电子产品' || shopCategory.category == '汽车用具') }">
							<li>
							<c:if test="${shopCategory.category == '电子产品' }">
								<a href="../proscenium/categoryLei?id=${shopCategory.categoryID}&page=electronics">
								<c:if test="${sessionScope.language == 'chinese'}">${shopCategory.category }</c:if>
								<c:if test="${sessionScope.language == 'russina'}">${shopCategory.russinaCategory }</c:if>
								</a>
							</c:if>
							<c:if test="${shopCategory.category == '汽车用具' }">
								<a href="../proscenium/categoryLei?id=${shopCategory.categoryID}&page=autoSupplies&towID=23"><c:if test="${sessionScope.language == 'chinese'}">${shopCategory.category }</c:if>
								<c:if test="${sessionScope.language == 'russina'}">${shopCategory.russinaCategory }</c:if></a>
							</c:if>	
							<div>
								<c:forEach items="${shopCategory.children }" var="shopCategory2">
										<c:if test="${shopCategory2.level == 2  }">
											<div class="nav-column">
											<h3>
											<c:if test="${sessionScope.language == 'chinese'}">${shopCategory2.category }</c:if>
											<c:if test="${sessionScope.language == 'russina'}">${shopCategory2.russinaCategory }</c:if>
											</h3><ul>
												<c:forEach  items="${shopCategory2.children }" var="shopCategory3">
													<c:if test="${shopCategory3.level == 3 }">
														<li><a href='../proscenium/shopCommItem?id=${shopCategory3.categoryID }&page=page'>
														<c:if test="${sessionScope.language == 'chinese'}">${shopCategory3.category }</c:if>
														<c:if test="${sessionScope.language == 'russina'}">${shopCategory3.russinaCategory }</c:if>
														</a></li>
													</c:if>
												</c:forEach>
												</ul>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
			<div class="menu3">
				<ul class="navf nav_3" id="navShopCaegory3">
				</ul>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	<script type="text/javascript">
				$(document).ready(function(){
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : '../getShopCategory/getBuyCatNum',
							dataType : 'json',
							success : function(data) {
								if(data.success == 'true'){
									$('#buyCatNum').html("购物车("+data.num+")");
								}
							}
						});
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : '../getShopCategory/shopCategoryBrand',
							dataType : 'json',
							success : function(data) {
								var $guige2 = "";
								var language = $("#language").val();
								var brand = "";
								if ( language == 'chinese') {
									brand = "名品街";
								} else if ( language == 'russina') {
									brand = "我是俄文名品街";
								}
								
								if (data && data.success == "true") {
									$guige2 = $guige2 + "<li><a href='../proscenium/categoryLei?id=-1&page=brand'>"+brand+"</a><div>";
									$.each(data.shopCategories,function(i, brandCategory) {
										if ( language == 'chinese') {
											$guige2 = $guige2 + "<div class='nav-column'><h3>"+brandCategory.category+"</h3><ul>";
										} else if ( language == 'russina') {
											$guige2 = $guige2 + "<div class='nav-column'><h3>"+brandCategory.russinaCategory+"</h3><ul>";
										}

										var strs = brandCategory.brandStr.split("|");
											for (var i = 0; i < strs.length; i++) {
												$guige2 = $guige2 + "<li><a href='../proscenium/shopCommItem?id="+strs[i].split('-')[0]+"&page=brand'>"+ strs[i].split('-')[1] +"</a></li>";
											}
											$guige2 = $guige2 + "</ul></div>";
									});
									$guige2 = $guige2 + "</div></li>";
								}else{
									var $guige2 = "<li><a href='../proscenium/categoryLei?id=-1&page=brand'>"+brand+"</a><div></div></li>";
								}
								$('#navShopCaegory2').append($guige2);
							}
						});
						jQuery.ajax({
							type : 'GET',
							contentType : 'application/json',
							url : '../getShopCategory/shopCategoryIsSpecial',
							dataType : 'json',
							success : function(data) {
								var $guige2 = "";
								var language = $("#language").val();
								var special = "";
								if ( language == 'chinese') {
									special = "折扣";
								} else if ( language == 'russina') {
									special = "我是俄文折扣";
								}
								if (data && data.success == "true") {
									$guige2 = $guige2 + "<li><a href='../proscenium/categoryLei?id=-1&page=special'>"+special+"</a><div>";
									$.each(data.shopCategories,function(i, brandCategory) {
										$guige2 = $guige2 + "<div class='nav-column'><h3>"+brandCategory.category+"</h3><ul>";
										var strs = brandCategory.brandStr.split("|");
											for (var i = 0; i < strs.length; i++) {
												$guige2 = $guige2 + "<li><a href='../proscenium/shopCommItem?id="+strs[i].split('-')[0]+"&page=special'>"+ strs[i].split('-')[1] +"</a></li>";
											}
											$guige2 = $guige2 + "</ul></div>";
									});
									$guige2 = $guige2 + "</div></li>";
								}else{
									var $guige2 = "<li><a href='../proscenium/categoryLei?id=-1&page=special'>"+special+"</a><div></div></li>";
								}
								$('#navShopCaegory3').append($guige2);
							}
						});
					});
	</script>

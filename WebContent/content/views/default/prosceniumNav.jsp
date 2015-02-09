<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<div class="topfd">
	<!---------------   浮动头部   ----------------------->
	<div class="topnone"></div>
	<div class="top1">
		<div class="logo">
			<a href="./index"><img src="content/static/images/logo.jpg"
				width="162" height="62" /></a>
		</div>
		<div class="znss">
			<div class="ssk">
				<input value="搜索" name="" type="text" onfocus="this.value=''"
					onblur="if(this.value==''){this.value='搜索';}" />
			</div>
			<div class="ssan">
				<input name="" type="button" />
			</div>
		</div>

		<div class="top_tel">
			<img src="content/static/images/top_sj.png" />
			<p>
				全球统一客服电话<br />
				<span class="red">152386895258</span>
			</p>
		</div>
		<div class="gwctb">
			<a href="shopcar.jsp"><img src="content/static/images/gwc.jpg"
				width="63" height="43" /></a>
		</div>
		<div class="clear"></div>
		<div class="qbfl">
			<a href="./index"><img src="content/static/images/china.jpg" /></a><a
				href="../index"><img src="content/static/images/eluosi.jpg" /></a>
		</div>
	</div>
	<div class="topnone"></div>
</div>
<div class="topfn">
	<div style="height: 78px;"></div>
	<div class="dlzc">
		<ul>
			<li><a href="./user/login">我的办公室</a></li>
			<li><a href="./user/login">请登记</a></li>
			<li class="zc"><a href="./user/regist">免费注册</a></li>
			<li><a href="file_index.jsp">客户服务</a>
				<div class="filexlcd">
					<ul>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_02.png" /></span>提问和回答</a></li>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_17.png" /></span>如何找到合适商品在产品目录</a></li>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_01.png" /></span>关于zazatao.com的服务</a></li>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_05.png" /></span>运费 </a></li>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_18.png" /></span>购物袋</a></li>
						<li><a href="#"><span><img
									src="content/static/images/brand/filel_19.png" /></span>联系我们</a></li>
					</ul>
				</div></li>
			<li style="background: #fff; height: 32px; margin-top: 1px;"><a
				style="color: #000;" href="shopcar.html">购物车(0)</a></li>
		</ul>
		<div class="clear"></div>
	</div>
</div>
<div class="top">
	<div class="menu">
		<!---------------   菜单   ----------------------->
		<div class="menu1">
			<ul class="nav" id="navShopCaegory1">
				<li class="bg_none"><a href="./index"><img
						src="content/static/images/fzan.jpg" width="16" height="17" /></a></li>
			</ul>
		</div>
		<div class="menu2">
			<ul class="nav nav_2" id="navShopCaegory2">
			</ul>
		</div>
		<div class="menu3">
			<ul class="nav nav_3" id="navShopCaegory3">
				
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
				url : './getShopCategory/shopCategoryAll',
				dataType : 'json',
				success : function(data) {
					var $guige = "";
					var $guige1 = "";
					if (data && data.success == "true") {
						$.each(data.shopCategories,function(i, shopCategory) {
							if(shopCategory.level == 1 && shopCategory.category != '汽车用具' && shopCategory.category != '电子产品'){
								$guige = $guige + "<li><a href='../proscenium/categoryOne?id="+shopCategory.categoryID+"'>"+shopCategory.category+"</a><div>";
								$.each(data.shopCategories,function(i, shopCategory2) {
									if(shopCategory2.level == 2 && shopCategory2.parentLevel == shopCategory.categoryID){
										$guige = $guige + "<div class='nav-column'><h3>"+shopCategory2.category+"</h3><ul>";
										$.each(data.shopCategories,function(i, shopCategory3) {
											if(shopCategory3.level == 3 && shopCategory3.parentLevel == shopCategory2.categoryID){
												$guige = $guige + "<li><a href='../proscenium/shopCommItem?id="+shopCategory3.categoryID+"'>"+ shopCategory3.category +"</a></li>";
											}
										});
										$guige = $guige + "</ul></div>";
									}
								});
								$guige = $guige + "</div></li>";
							}
						});
						$('#navShopCaegory1').append($guige);
						$.each(data.shopCategories,function(i, shopCategory) {
							if(shopCategory.level == 1 && (shopCategory.category == '电子产品' || shopCategory.category == '汽车用具')){
								$guige1 = $guige1 + "<li><a href='../proscenium/categoryLei?id="+shopCategory.categoryID+"'>"+shopCategory.category+"</a><div>";
								$.each(data.shopCategories,function(i, shopCategory2) {
									if(shopCategory2.level == 2 && shopCategory2.parentLevel == shopCategory.categoryID){
										$guige1 = $guige1 + "<div class='nav-column'><h3>"+shopCategory2.category+"</h3><ul>";
										$.each(data.shopCategories,function(i, shopCategory3) {
											if(shopCategory3.level == 3 && shopCategory3.parentLevel == shopCategory2.categoryID){
												$guige1 = $guige1 + "<li><a href='../proscenium/shopCommItem?id="+shopCategory3.categoryID+"'>"+ shopCategory3.category +"</a></li>";
											}
										});
										$guige1 = $guige1 + "</ul></div>";
									}
								});
								$guige1 = $guige1 + "</div></li>";
							}
						});
						$('#navShopCaegory2').append($guige1);
					}
				}
			});
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : './getShopCategory/shopCategoryBrand',
				dataType : 'json',
				success : function(data) {
					var $guige2 = "";
					if (data && data.success == "true") {
						$guige2 = $guige2 + "<li><a href='../proscenium/categoryLei?id=-1&page=brand'>名品街</a><div>";
						$.each(data.shopCategories,function(i, brandCategory) {
							$guige2 = $guige2 + "<div class='nav-column'><h3>"+brandCategory.category+"</h3><ul>";
							var strs = brandCategory.brandStr.split("|");
								for (var i = 0; i < strs.length; i++) {
									$guige2 = $guige2 + "<li><a href='../proscenium/shopCommItem?id="+strs[i].split('-')[0]+"&page=brand'>"+ strs[i].split('-')[1] +"</a></li>";
								}
								$guige2 = $guige2 + "</ul></div>";
						});
						$guige2 = $guige2 + "</div></li>";
					}else{
						var $guige2 = "<li><a href='../proscenium/categoryLei?id=-1&page=brand'>名品街</a><div></div></li>";
					}
					$('#navShopCaegory2').append($guige2);
				}
			});
			jQuery.ajax({
				type : 'GET',
				contentType : 'application/json',
				url : './getShopCategory/shopCategoryIsSpecial',
				dataType : 'json',
				success : function(data) {
					var $guige2 = "";
					if (data && data.success == "true") {
						$guige2 = $guige2 + "<li><a href='../proscenium/categoryLei?id=-1&page=special'>折扣</a><div>";
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
						var $guige2 = "<li><a href='../proscenium/categoryLei?id=-1&page=special'>折扣</a><div></div></li>";
					}
					$('#navShopCaegory3').append($guige2);
				}
			});
		});		
	</script>
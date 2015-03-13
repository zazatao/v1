<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form action="./user" method="post"></form>
<!---------------   页面主体   ----------------------->
<div class="basic">
	<!-----基本信息-------->
	<div class="perbastil">
		<div>
			<dl>
				<dt>
					<img src="../content/static/images/kx.jpg" />
				</dt>
				<dd>
					<b>Пополнить счет счет</b><img
						src="../content/static/images/user.jpg" />
				</dd>
				<dd>06.07.1992</dd>
			</dl>
			<p>marat004@163.com</p>
			<p>您的账号码:456789123</p>
		</div>
		<div>
			<p>可以资金</p>
			<p>
				<b>$0</b>
			</p>
			<p>
				<a class="onck1" href="perscent_chongzhi.html">新增资金</a>
			</p>
		</div>
	</div>
	<!-----完善程度-------->
	<script>
				$(document).ready(function() {
					$(".onck2").click(function() {
						$(".tc2all").show();
					});
					$(".tc2sel").click(function() {
						$(".t2sall").toggle();
					});
					$(".t2sall p").click(function() {
						$(".t2sall").hide();
						$(".tc2stex").text($(this).text());
					});
					$(".tcnoe2").click(function() {
						$(".tc2all").hide();
					});
					$(".tc2bg").click(function() {
						$(".tc2all").hide();
					});
					$("#shopImg").click(function() {

					});

				})
			</script>
	<div class="tc2all">
		<div class="tc2bg"></div>
		<div class="tc_2">
			<h1>
				开店<span class="tcnoe2">x</span>
			</h1>
			<div class="t2sel">
				<p class="t2s">
					<span class="tc2stex">请选择店铺类型</span><span class="tc2sel"></span>
				</p>
				<div class="t2sall">
					<c:forEach items="${shopCates }" var="shopcate" varStatus="loop">
						<p>${shopcate.category }</p>
					</c:forEach>
				</div>
			</div>
			<p>
				<input type="text" placeholder="店铺名称" id="shopName" value="" />
			</p>
			<p>
				<input type="text" placeholder="店铺链接" value="" />
			</p>
			<p>
				<input type="text" placeholder="店铺链接地址" value="" />
			</p>
			<p>
				<span> </span>
			</p>
			<div class="tjtp">
				<a href="#" id="shopImg"><img
					src="../content/static/images/tj.png" />添加图片信息</a>
			</div>
			<div class="bott">
				<a href="#" onclick="kaidian();">创建</a>
			</div>
		</div>
	</div>
	<script>
				function kaidian() {
					var name = $('#shopName').val();
					location.href = '../proscenium/setUpShop?shopName=' + name;
				}
			</script>
	<div class="perbaspft">
		<div class="jdt">
			<div class="jdtc"></div>
			<p class="bfb">33%</p>
		</div>
		<p class="udli">
			<a href="perscent_set.html">设置简介</a>
		</p>
		<p>您的资料已经填满100%</p>
		<p>
			<a class="onck2" href="#">我的展示窗</a>
		</p>
		</p>
	</div>
	<!-----切换表格-------->
	<div class="perbastab">
		<ul>
			<li class="pbeabclk"><a href="./myoffice">${user.userName }的账户</a></li>
			<li><a href="./perscentBonuses?orderDate=volvo&orderStatus=-1">我的订单</a></li>
			<li><a href="perscent_account.html">我的账单</a></li>
			<li><a href="perscent_dreams.html">我喜欢的产品</a></li>
			<li><a href="perscent_sup.html">引起支持呼吁</a></li>
			<li><a href="./introduction">设置简介</a></li>
			<li class="mr_n"><a href="perscent_size.html">我的尺寸</a></li>
		</ul>
	</div>
	<div class="cl"></div>
</div>

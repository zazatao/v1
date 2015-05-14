<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/gr_3.css" rel="stylesheet"
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
		<jsp:include page="brandTop.jsp"></jsp:include>
		<div class="cont_gr3">
			<div class="nybtl">
				品牌
				<div class="clear"></div>
			</div>
			<p class="cont_gr3_sort">
				<a href="../proscenium/categoryLei?id=-1&page=brand">所有分类*</a><a href="../proscenium/categoryLei?id=5&page=brand">女士*</a><a href="../proscenium/categoryLei?id=1&page=brand">男士*</a><a href="../proscenium/categoryLei?id=58&page=brand">儿童*</a> <a href="../proscenium/categoryLei?id=62&page=brand">运动*</a><a href="../proscenium/categoryLei?id=30&page=brand">电子产品*</a><a href="../proscenium/categoryLei?id=60&page=brand">居家*</a><a href="../proscenium/categoryLei?id=7&page=brand">箱包*</a>
			</p>
			<div class="cont_gr3_all" style="display: block;">
				<!-------------gr3_list_1 start------------------>
				    <c:choose>
				       <c:when test="${not empty shopcomlist }">
				           <c:forEach items="${shopcomlist}" var="shopcom">
				         
				                     <dl class="border_gray">
						<dt>
							<a href="../proscenium/shopItem?commID=${shopcom.commCode }&category=${shopcom.shopCategory.categoryID }&shopID=${shopcom.belongTo.id }&commoName=${shopcom.commoidtyName }"><img
								src="..${shopcom.shopCommImages[0].imagePath}" /></a>
						</dt>
						<dd>
							<a href="../proscenium/shopCommItem?id=${shopcom.brand.brandID }&page=brand&which=brand"><img src="..${shopcom.brand.logo}"></a>
						</dd>
						<dd>
							  ${shopcom.commoidtyName}<br />
						</dd>
					</dl>
                              </c:forEach> 
                            </c:when>
				       <c:otherwise>
				             <span>暂无品牌商品</span>
				       </c:otherwise>
				    </c:choose>
					
		
			
		</div>
		<div class="clear"></div>
		<div class="page_1">
			<ul>
				<li class="left_pg"><a href="#"><img
						src="../content/static/images/small/left_pg.png" /></a></li>
				<li class="sz"><a href="#">1</a></li>
				<li class="sz"><a href="#">2</a></li>
				<li class="sz"><a href="#">3</a></li>
				<li class="sz"><a href="#">4</a></li>
				<li class="sz"><a href="#">5</a></li>
				<li class="sz"><a href="#">6</a></li>
				<li><a href="#">...</a></li>
				<li class="right_pg"><a href="#"><img
						src="../content/static/images/small/right_pg.png" /></a></li>
				<li><a href="#">回到顶部</a></li>
				<li><a href="#">1</a></li>
				<li><a href="#"><img
						src="../content/static/images/small/page_bot.png" /></a></li>

			</ul>
		</div>
		</div>
		<!-------------page over------------------------->
		<div class="clear"></div>
		<jsp:include page="../common/foot.jsp"></jsp:include>
	</div>
</body>
</html>
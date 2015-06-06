<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>汽车用具</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/gr.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
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
		<jsp:include page="autoSuppliesTop.jsp"></jsp:include>
		<div class="clear"></div>
		<div class="cont_cent_1">
			<div class="tit">
				<!--         	<img src="../content/static/images/small/1_lou.png" /> -->
				<h1>${cate.category}<br />
					<c:choose>
						<c:when test="${not empty cateList}">
							<c:forEach items="${cateList}" var="cate">
								<a href="../proscenium/categoryLei?id=${cate.categoryID}&page=autoSupplies" >${cate.category}</a>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<br />
						</c:otherwise>
					</c:choose>
				</h1>
			</div>
			<div class="cont_cent_left cont_cent_left1">
			 <c:choose>
			   <c:when test="${not empty shopcommlist}">
				<c:forEach items="${shopcommlist}" var="shopcomm">
					<span><a
						href="../proscenium/shopItem?commID=${shopcomm.commCode }&category=${shopcomm.shopCategory.categoryID }&shopID=${shopcomm.belongTo.id }&commoName=${shopcomm.commoidtyName }"><img
							src="..${shopcomm.shopCommImages[0].imagePath}"></a></span>
				</c:forEach>
				</c:when>
				<c:otherwise>
				         <span style="color:red">请等待上架</span>
				</c:otherwise>
			</c:choose>	
			</div>
			<div class="cont_cent_right">
				<h1>推荐排行榜</h1>
				  <div id="img5">
					<c:forEach items="${topshopcommlist}" var="topshopcomm">
						<dl>
							<dt>
								<img src="..${topshopcomm.path}" />
							</dt>
							<dd>${topshopcomm.nameOfGoods}</dd>
							<dd>
								<span class="red">销售量：</span>${topshopcomm.sums}</dd>
						</dl>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

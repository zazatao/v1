<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>折扣</title>
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
		<jsp:include page="specialTop.jsp"></jsp:include>
		<div class="red_cont">
			<ul>
			       <c:choose>
		        <c:when test="${ not empty shopcomlist}">
		             <c:forEach items="${shopcomlist }" var="shopcom">
		             			<li><a href="../proscenium/shopItem?commID=${shopcom.commCode }&category=${shopcom.shopCategory.categoryID }&shopID=${shopcom.belongTo.id }&commoName=${shopcom.commoidtyName }"> 
		             			<img src="..${shopcom.shopCommImages[0].imagePath}"  style="width:335px;height:320px;"/>
						<div class="tit_3">
						<c:if test="${sessionScope.language == 'chinese' }">${shopcom.commoidtyName}</c:if>
						<c:if test="${sessionScope.language == 'russina' }">${shopcom.russinaCommoidtyName}</c:if>
						
							<p>
								  限时打折:<span class="red">14:59:12</span>
							</p>
                     <!-- 							     将折扣转化为百分比 -->
							<span class="bfb"><fmt:formatNumber type="percent" >${shopcom.special}</fmt:formatNumber></span>
						 </div>
				           </a></li>
		             </c:forEach>
		        </c:when>
		        <c:otherwise>
		                  <span style="color:red">此类商品暂无打折</span>
		        </c:otherwise>
		     </c:choose>
				
			
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</div>
</body>
</html>
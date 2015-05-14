<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类页面</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
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
<jsp:include page="categoryOneLeft.jsp"></jsp:include>

<div class="nyright nyrightls">
    	<div class="rightl">
    
                <c:choose>
                      <c:when test="${not empty shopcommlist}">
                            <c:forEach items="${shopcommlist}"  var="shopcom">
				             <li style="float:left"><a href="../proscenium/shopItem?commID=${shopcom.commCode }&category=${shopcom.shopCategory.categoryID }&shopID=${shopcom.belongTo.id }&commoName=${shopcom.commoidtyName }"><img src="..${shopcom.shopCommImages[0].imagePath}" /></a></li>
				           </c:forEach>
                      </c:when>
                      <c:otherwise>
                                <span style="color: red">暂无此类商品</span>
                      </c:otherwise>
                </c:choose>
           
               <div class="clear"></div>
               </div>
        
           
            
        </div>
        <div class="rightl">
        
      </div>
    <div class="clear"></div>
    <jsp:include page="../common/foot.jsp"></jsp:include>
</div>
</body>
</html>
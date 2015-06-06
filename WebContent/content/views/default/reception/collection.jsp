<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我喜欢的产品</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet" type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../content/static/js/reception/png.js"></script>
<script type="text/javascript" src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript" src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript" src="../content/static/js/reception/js.js"></script>
</head>

<body>
<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
<div class="con">
	<jsp:include page="userTop.jsp"></jsp:include>
	<div class="dreams" >
        <div>
        	<div class="dreamls" >
           	  <h3>&Phi;我喜欢的产品</h3>
                <ul>
                	<c:forEach var="collection" items="${collections }" varStatus="pool">               
                  		<li class="dreamlfal" style="margin-bottom:20px">
                  			<a href="../proscenium/shopItem?commID=${collection.shopCommoidty.commCode }&category=${collection.shopCommoidty.shopCategory.categoryID }&shopID=${collection.shopCommoidty.belongTo.id }&commoName=${collection.shopCommoidty.commoidtyName }">
                    		<p class="dreamlimg"><img src="..${collection.shopCommoidty.shopCommImages[0].imagePath }"/></p></a>
							<!-- <p class="dreamlimg"><img src="../content/static/images/nz.jpg"/></p></a> -->
                    		<c:if test="${sessionScope.language == 'chinese'}">
								<p>${collection.shopCommoidty.commoidtyName }</p>
							</c:if>
							<c:if test="${sessionScope.language == 'russina'}">
								<p>${collection.shopCommoidty.russinaCommoidtyName }</p>
							</c:if>
                    		
                    		<p>до<span class="red">78% cdse</span></p>
                    		<p><img src="../content/static/images/dreatime.png" width="17" height="16" />1day 12:21:15</p>                   
                    		<p class="dreamllike">
                    		<a href="../user/deleteCollection?collectionID=${collection.id }">
<!--                     		<img src="../content/static/images/con_11.png"/></a> -->
<!--                     		<img src="../content/static/images/con_10.png"/></p> -->
                  		</li>     
                 	</c:forEach>
                 </ul>   
            </div>
        </div>
    </div> 
</div>
 <jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

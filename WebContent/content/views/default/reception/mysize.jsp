<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<script type="text/javascript">
function popupwindow(url) {
	var w = 700;
	var h = 800;
	var title = "";
	var left = (screen.width / 2) - (w / 2);
	var top = (screen.height / 2) - (h / 2);
	return window
			.open(
					url,
					title,
					'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=yes,resizable=yes, width='
							+ w
							+ ', height='
							+ h
							+ ', top='
							+ top
							+ ', left=' + left);
}
</script>	
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<jsp:include page="userTop.jsp"></jsp:include>
<!-- =============== -->
                           <div class="size">
    	<div class="sizetop">
        	<h3>我的尺寸<span>创建配置文件</span></h3>
            <p class="sizetoptex">现在，您可以快速创建自己的尺寸的个人资料找到所需的产品。您最多可以保存6个配置文件和从一个配置文件切换到另一个，选择项目的依据是什么，或者你想买给谁 </p>
            <p class="sizetopcon"><a href="#" onclick="popupwindow('/user/addsize')">创建一个新的配置文件</a></p>
            <div class="sizelest">
            	<ul>
            	  <li>
            	    <p class="szls1">文件名称</p>
            	    <p class="szls2">性别</p>
            	    <p class="szls3">尺寸</p>
            	    <p class="szls4"></p>
            	    <p class="szls5"></p>
            	  </li>
            	  <c:forEach items="${sizelist}" var="xxx">
            	     <li>
            	    <p class="szls1">${xxx.filename}</p>
            	    <c:if test="${xxx.sex=='Female' }">
            	         <p class="szls2">针对女性</p>
            	     </c:if>
            	     <c:if test="${xxx.sex=='Male' }">
            	         <p class="szls2">针对男性</p>
            	      </c:if>
            	    <p class="szls3">${xxx.size}</p>
            	    <p class="szls4"><a href="../user/deletemysize?code=${xxx.code}">删除</a></p>
            	    <p class="szls5"><a>默认配置文件</a></p>
            	   </li>
            	  </c:forEach>
            	</ul>
            </div>
        </div>
        <script  type="text/javascript">
        	$(document).ready(function(){
				$(".sizetopcon a").click(function(){
						$(".sizetex").show();
					});
				$(".szls5 a").click(function(){
						$(".sizetex").show();
					});
				$(".sztatexbon a").click(function(){
						$(".sizetex").hide();
					});
			
			});
        </script>
   </div>
</div>
<!-- =============== -->
	    <jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>
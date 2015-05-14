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
<link href="../content/static/css/reception/gr.css" rel="stylesheet" type="text/css" />
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
        	<img src="../content/static/images/small/1_lou.png" />
            <h1>汽车装饰<br /><a href="gr_list.html">内饰\</a><a href="gr_list.html">外饰\</a><a href="gr_list.html">坐垫\</a><a href="gr_list.html">座套【内外兼修】</a>
            </h1>
        </div>
        <div class="cont_cent_left cont_cent_left1" id="img5">
               <c:forEach items="${shopcommlist}" var="shopcomm">
                       <img src="..${shopcomm.shopCommImages[0].imagePath}">${shopcomm.commoidtyName}
               </c:forEach>
<!--         	<span><a href="gr_list.html"><img src="../content/static/images/dq/img_21.jpg" /></a></span> -->
<!--             <span class="n06"><a href="gr_list.html"><img src="../content/static/images/dq/img_22.jpg" width="437" height="166" /></a><a href="gr_list.html"><img src="../content/static/images/dq/img_23.jpg" width="157" height="167" /></a></span> -->
<!--             <span class="n06"><a href="gr_list.html"><img src="../content/static/images/dq/img_24.jpg" width="158" height="166" /></a><a href="gr_list.html"><img src="../content/static/images/dq/img_25.jpg" width="436" height="166" /></a></span> -->
        </div>
        <div class="cont_cent_right">
        	<h1>推荐排行榜</h1>
            <dl>
            	<dt><img src="../content/static/images/dq/img_26.jpg" /></dt>
                <dd>牛牛工艺汽车坐垫</dd>
                <dd><span class="red">￥：1180</span></dd>
            </dl>
            <dl>
            	<dt><img src="../content/static/images/dq/img_26.jpg" /></dt>
                <dd>牛牛工艺汽车坐垫</dd>
                <dd><span class="red">￥：1180</span></dd>
            </dl>
            <dl>
            	<dt><img src="../content/static/images/dq/img_26.jpg" /></dt>
                <dd>牛牛工艺汽车坐垫</dd>
                <dd><span class="red">￥：1180</span></dd>
            </dl>
            <dl>
            	<dt><img src="../content/static/images/dq/img_26.jpg" /></dt>
                <dd>牛牛工艺汽车坐垫</dd>
                <dd><span class="red">￥：1180</span></dd>
            </dl>
            <dl>
            	<dt><img src="../content/static/images/dq/img_26.jpg" /></dt>
                <dd>牛牛工艺汽车坐垫</dd>
                <dd><span class="red">￥：1180</span></dd>
            </dl>
        </div>
        </div>
     </div>
     <div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</div>
</body>
</html>
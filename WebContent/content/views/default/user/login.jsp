<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
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
		<!---------------   页面主体   ----------------------->
		<!--login start-->
		<div class="login">
			<h1>登陆社交网站</h1>
			<p class="ptop">
				<a href="#"><img
					src="../content/static/images/small/dl_pic_1.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_2.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_3.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_4.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_5.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_6.png" /></a>
			</p>
			<div class="clear"></div>
			<p>
<%-- 				<c:if test="${not empty message }"> --%>
<!-- 					<font color="red">用户名或密码错误，请重新输入您的登陆信息</font> -->
<%-- 				</c:if> --%>
=======
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
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
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
		<!---------------   页面主体   ----------------------->
		<!--login start-->
		<div class="login">
			<h1>登陆社交网站</h1>
			<p class="ptop">
				<a href="#"><img
					src="../content/static/images/small/dl_pic_1.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_2.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_3.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_4.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_5.png" /></a> <a href="#"><img
					src="../content/static/images/small/dl_pic_6.png" /></a>
			</p>
			<div class="clear"></div>
			<p>
				<%-- 				<c:if test="${not empty message }"> --%>
				<!-- 					<font color="red">用户名或密码错误，请重新输入您的登陆信息</font> -->
				<%-- 				</c:if> --%>
>>>>>>> branch 'master' of https://github.com/zazatao/v1.git
			</p>
			<form action="../user/login" method="post">
				<p>
					您的用户名和电子邮件<br /> <input class="zh" type="text" value=""
						name="loginName" />
				</p>
				<p>
					密码<br /> <input class="zh" type="text" name="password" value="" />
				</p>
				<p>
					<a href="#">忘记密码</a>
				</p>
				<p>
					<span><input class="checkbox" type="checkbox" /></span>记住<input
						class="sub_2" type="submit" value="进入 " />
				</p>
			</form>
		</div>
		<!--login over-->
		<div class="login_right">
			<a href="../user/regist"><img
				src="../content/static/images/small/s_16.png" /></a>
		</div>

		<div class="clear"></div>
		<div class="wmdfw">
			<div class="wmtop">О НАШЕМ СЕРВИСЕ</div>
			<div class="wmcon">
				<ul>
					<li class="h_1"><a href="file06.html"></a></li>
					<li class="h_2"><a href="download.html"></a></li>
					<li class="h_3"><a href="file15.html"></a></li>
					<li class="h_4"><a href="#"></a></li>
				</ul>
			</div>
		</div>
		<!-------------图片轮播----------------->
		<div class="spzx">
			<div class="sptop">
				<img src="images/tbfh.jpg" width="14" height="14" />&nbsp; ВИДЕО
				ПОМОЩЬ ПОЛЬЗОВАНИИ САЙТОМ
			</div>
			<div class="spcon">
				<div class="catalog_img">
					<DIV class="LeftBotton" id="LeftArr"></DIV>
					<DIV class="Cont" id="ISL_Cont_1">
						<!-- 图片列表 begin -->
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="yl_list_detail.html"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<!-- 图片列表 end -->
					</DIV>

					<DIV class="RightBotton" id="RightArr"></DIV>
				</DIV>

				<SCRIPT language=javascript type=text/javascript>
				<!--//--><![CDATA[//><!--
					var scrollPic_02 = new ScrollPic();
					scrollPic_02.scrollContId = "ISL_Cont_1"; //内容容器ID
					scrollPic_02.arrLeftId = "LeftArr";//左箭头ID
					scrollPic_02.arrRightId = "RightArr"; //右箭头ID

					scrollPic_02.frameWidth = 916; //显示框宽度
					scrollPic_02.pageWidth = 229; //翻页宽度

					scrollPic_02.speed = 10; //移动速度(单位毫秒，越小越快)
					scrollPic_02.space = 10; //每次移动像素(单位px，越大越快)
					scrollPic_02.autoPlay = false; //自动播放
					scrollPic_02.autoPlayTime = 3; //自动播放间隔时间(秒)

					scrollPic_02.initialize(); //初始化

					//--><!]]>
				</SCRIPT>
			</div>
		</div>
		<!-------------图片轮播----------------->


	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

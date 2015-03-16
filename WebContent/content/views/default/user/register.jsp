<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<!--zhuce start-->
		<div class="zc_left">
			<img src="../content/static/images/small/zc_left.png" />
		</div>
		<div class="zc_center">
			<p>在这里您会买到一切您所需要的东西</p>
			<!-----------zc_box start---------------->
			<div class="zc_box" style="display: block">
				<h1>注册新用户</h1>
				<div class="zc_cent_cont">
					<h2>登陆社交网站</h2>
					<p class="ptop_2">
						<a href="#"><img
							src="../content/static/images/small/dl_pic_1.png" /></a> <a href="#"><img
							src="../content/static/images/small/dl_pic_2.png" /></a> <a href="#"><img
							src="../content/static/images/small/dl_pic_3.png" /></a>
					</p>
					<p class="ptop_3">
						<a href="#"><img
							src="../content/static/images/small/dl_pic_1.png" /></a> <a href="#"><img
							src="../content/static/images/small/dl_pic_2.png" /></a> <a href="#"><img
							src="../content/static/images/small/dl_pic_3.png" /></a>
					</p>
					<p>
						<span>—————————ИЛИ————————</span>
					</p>
					<form action="./regist" method="post">
						<ul>
							<li>选择登录名<span class="red"> *</span><br /> <input
								class="zc_input" type="text" name="loginName" id="loginName" /></li>

							<li>密码 <span class="red"> *</span><br /> <input
								class="zc_input" type="password" name="password" id="password" /></li>

							<li><input type="checkbox" class="checkbox_2"
								checked="checked" /><span class="gray">显示密码</span></li>

							<li>确认密码<span class="red"> *</span><br /> <input
								class="zc_input" type="text" name="password1" id="password" /></li>

							<li>输入电话号码<span class="red"> *</span><br /> <select
								class="zc_input_2"><option>选择国家</option>
									<option>中国</option>
									<option>美国</option>
									<option>俄罗斯</option>
									<option>伊拉克</option></select> <span class="zc_bd">+90</span>-<input
								class="zc_input_2" type="text" name="phone" id="phone" /><span
								class="red">или</span></li>

							<li>输入电邮地址<span class="red"> *</span><br /> <input
								class="zc_input" type="text" name="email" id="email" /></li>

							<li>短信代码<input class="zc_input_2" type="text" value="" /><input
								class="sub_3" type="submit" value="发送代码" /></li>
							<li><p>您的性别</p></li>
							<li><a class="green" name="Male" id="Male" value="Male"
								type="radio">男士 </a> <a class="red" name="Female" id="Female"
								type="radio" value="Female">女士</a></li>
							<li>我有代码可以邀请朋友<input class="zc_input_2" type="text" value="" /></li>
							<li><input type="checkbox" class="checkbox_2"
								checked="checked" /><span class="gray">接受用户协议条款</span></li>
							<li><input type="submit" class="bott" value="注册" /></li>
						</ul>
					</form>
				</div>
			</div>
			<!-----------zc_box over---------------->

			<!-----------zc_box_2 start---------------->
			<div class="zc_box zc_box_2" style="display: none">
				<h1>定于组织</h1>
				<div class="zc_cent_cont">
					<ul>
						<li>代表组织名称<br /> <input class="zc_input" type="text"
							value="" /><br /> <em>例子<br />-OOO有限公司<br />-阿斯塔纳责任有限公司<br />-"РосСТРАХ"
								喀山公司
						</em>
						</li>

						<li>收货人名称 <br /> <input class="zc_input" type="password"
							value="" /></li>

						<li>法定地址<br /> <input class="zc_input" type="text" value="" /></li>

						<li>实际地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;符合法律<br /> <input
							class="zc_input" type="text" value="" /></li>

						<li>输入电话号码<span class="red"> *</span><br /> <select
							class="zc_input_2"><option>选择国家</option>
								<option>中国</option>
								<option>美国</option>
								<option>俄罗斯</option>
								<option>伊拉克</option></select> <span class="zc_bd">+90</span>-<input
							class="zc_input_2" type="text" value="" /><span class="red">или</span></li>

						<li><span>NHH</span><input class="zc_input_2" type="text"
							value="4444444" /></li>

						<li><span>NHH</span><input class="zc_input_2" type="text"
							value="43334434" /></li>

						<li>银行名称<br /> <input class="zc_input" type="text" value="" /></li>

						<li><span>银行的分类</span><input class="zc_input_3 zc_input_2"
							type="text" value="" /></li>
						<li><span>计算账户</span><input class="zc_input_3 zc_input_2"
							type="text" value="" /></li>
						<li><span>计算账户</span><input class="zc_input_3 zc_input_2"
							type="text" value="" /></li>
						<li><input type="checkbox" class="checkbox_2"
							checked="checked" /><span class="gray">接收用户协议条款</span></li>
						<li><input type="button" class="bott" value="注册" /></li>
					</ul>

				</div>
			</div>
			<!-----------zc_box_2 over---------------->




			<!-----------zc_box_3 start---------------->
			<div class="zc_box zc_box_2 zc_box_3" style="display: none">
				<h1>免费注册</h1>
				<div class="zc_cent_cont">
					<h3>
						<img src="../content/static/images/zc_1.png" />设置登录名
					</h3>
					<ul>
						<li><span>所在国家/地区</span> <select><option>中国</option>
								<option>美国</option>
								<option>俄国</option>
								<option>澳大利亚</option></select></li>
						<li><span class="sp">手机号码</span>
							<div class="tel">
								<span class="gray_tel">+86</span><input
									class="zc_input_2 zc_input_4" type="text" />
							</div></li>

						<li><span>验证码</span><input class="zc_input_2" type="password"
							value="" /></li>

						<li><input type="checkbox" class="checkbox_2"
							checked="checked" />同意<span class="orange">《服务协议》</span></li>

						<li class="down">下一步</li>

						<li><h3>
								<img src="../content/static/images/zc_2.png" />填写账户信息
							</h3></li>

						<li><span>登录名</span><input class="zc_input_2" type="text"
							value="" /></li>

						<li><span>设置登录密码</span>登录时验证，保护账户信息</li>

						<li><span>登录密码</span><input class="zc_input_2"
							type="password" value="" /></li>

						<li><span>再次确认密码</span><input class="zc_input_2"
							type="password" value="" /></li>

						<li><span>设置会员名</span></li>

						<li><span>会员名</span><input class="zc_input_2" type="text"
							value="" /></li>

						<li class="down">下一步</li>

						<li><h3>
								<img src="../content/static/images/zc_3.png" />注册成功
							</h3></li>

						<li><input type="button" class="bott" value="开始销售" /></li>
					</ul>

				</div>
			</div>
			<!-----------zc_box_3 over---------------->



			<div class="side_tit">
				<a><img src="../content/static/images/right_tit_1.png" /></a><a><img
					src="../content/static/images/right_tit_2.png" /></a><a><img
					src="../content/static/images/right_tit_3.png" /></a>
			</div>
		</div>
		<div class="zc_right">
			<img src="../content/static/images/small/zc_right.png" />
		</div>
		<!--zhuce over-->
		<div class="clear"></div>
		<div class="wmdfw">
			<div class="wmtop">关于我们的服务</div>
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
				<img src="../content/static/images/tbfh.jpg" width="14" height="14" />&nbsp;
				ВИДЕО ПОМОЩЬ ПОЛЬЗОВАНИИ САЙТОМ
			</div>
			<div class="spcon">
				<div class="catalog_img">
					<DIV class="LeftBotton" id="LeftArr"></DIV>
					<DIV class="Cont" id="ISL_Cont_1">
						<!-- 图片列表 begin -->
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
								src="../content/static/images/lb.jpg" /></A>
						</DIV>
						<DIV class="box">
							<A class=imgBorder href="#"><img
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

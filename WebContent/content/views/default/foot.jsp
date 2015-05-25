<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#big {
	display: none;
	position: fixed;
	top: 180px;
	right: 0px;
	width: 150px;
	height: 228px;
}

#small {
	position: absolute;
	top: 180px;
	right: 0px;
}

#iconDivMain {
	font-size: 12px;
	line-height: 22px;
	z-index: 7999;
	top: 240px;
	right: 1.5%;
	height: 60px;
	position: fixed;
	display: none;
}

#zi {
	margin-left: 10px;
	color: #093;
}

#za {
	position: absolute;
	top: 183px;
	left: 30px;
}
</style>
<div class="footer">
	<!---------------   底部   ----------------------->
	<div class="dyzx">
		<div class="fotlogo">
			<a href="./index"><img src="content/static/images/fotlogo.jpg"
				width="150" height="60" /></a>
		</div>
		<div class="dyxx">订阅我们的时事通讯</div>
		<input name="" type="text" value="email"
			onfocus="if(this.value=='email'){this.value='';$('.xbdj').css('display','block')}"
			onblur="if(this.value==''){this.value='email';$('.xbdj').css('display','none')}" />
		<div class="xbdj">
			<div class="xbxz">性别</div>
			<div class="xban">
				<a href="#"><img style="float: left"
					src="content/static/images/xbn.jpg" width="81" height="29" /></a> <a
					href="#"><img style="float: right"
					src="content/static/images/xbw.jpg" width="81" height="29" /></a>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="fxlj">
		社交网络 <a href="http://instagram.com/"><img
			style="vertical-align: middle; margin-left: 20px;"
			src="content/static/images/sj01.jpg" width="37" height="37" /></a> <a
			href="https://www.facebook.com/"><img
			style="vertical-align: middle; margin-left: 8px;"
			src="content/static/images/sj02.jpg" width="37" height="37" /></a> <a
			href="http://vk.com/"><img
			style="vertical-align: middle; margin-left: 8px;"
			src="content/static/images/sj03.jpg" width="37" height="37" /></a> <a
			href="http://www.odnoklassniki.ru/"><img
			style="vertical-align: middle; margin-left: 8px;"
			src="content/static/images/sj04.jpg" width="37" height="37" /></a> <a
			href="https://twitter.com/"><img
			style="vertical-align: middle; margin-left: 8px;"
			src="content/static/images/sj05.jpg" width="37" height="37" /></a> <a
			href="https://mail.ru/"><img
			style="vertical-align: middle; margin: 0 130px 0 8px;"
			src="content/static/images/sj06.jpg" width="37" height="37" /></a> 分享好友
		<a href="#"><img
			style="vertical-align: middle; margin-left: 30px;"
			src="content/static/images/sj07.jpg" width="316" height="45" /></a>
	</div>
	<div class="fotcd">
		<div class="dbcd">
			<ul>
				<li><a href="../user/skipmysize">我的尺寸</a></li>
				<li><a href="file06.html">运输方式</a></li>
				<li><a href="file_index.jsp">付款方式和客户保密保证</a></li>
				<li><a href="file.html">订单流程</a></li>
				<li><a href="../user/perscentBonuses?orderDate=&orderStatus=weiwanjie">退款</a></li>
				<li><a href="file07.html">帮忙</a></li>
				<li><a href="file14.html">保证</a></li>
			</ul>
			<ul>
				<li><a href="../user/login">登记/</a><a href="../user/regist">注册</a></li>
				<li><a href="../index">主页</a></li>
				<li><a href="../user/myoffice">我的办公室</a></li>
				<li><a href="../user/perscentBonuses?orderDate=volvo&orderStatus=-1">我的订单</a></li>
				<li><a href="../user/introduction">个人信息</a></li>
				<li><a href="../proscenium/shopcar">购物车</a></li>
				<li><a href="file14.html">安全策略</a></li>
			</ul>
			<ul>
				<li><a href="file_index.jsp">关于我们</a></li>
				<li><a href="news_1.html">网站新闻</a></li>
				<li><a href="news_2.html">新闻</a></li>
				<li><a href="file15.html">联系我们</a></li>
			</ul>
			<ul>
				<li><a href="file12.html">合作节目</a></li>
				<li><a href="file12.html">合同要求</a></li>
				<li><a href="file12.html">卖家合作</a></li>
			</ul>
		</div>
	</div>
	<div class="fkfs">
		<a href="#"><img src="content/static/images/fkfs.jpg" width="1200"
			height="110" /></a>
	</div>
	<div class="bqsy">
		<a href="#"><img src="content/static/images/bqsy.jpg" width="192"
			height="31" /></a>
	</div>
</div>
<div class="zxzx" onmousemove="show()">
	<a href="#"><img src="content/static/images/zxzx.png" /></a>
</div>
<!---------------   右侧浮动   ----------------------->
<div class="fdan">
	<ul>
		<li><a href="#"><img src="content/static/images/mfsh.png"
				width="109" height="55" /></a></li>
		<li><a href="#"><img src="content/static/images/ysfs.png"
				width="109" height="55" /></a></li>
		<li><a href="#"><img src="content/static/images/zftk.png"
				width="109" height="55" /></a></li>
	</ul>
</div>
<div id="big" onmouseout="f2()">
	<img src="content/static/img/tu1.png" />
	<div id="za">
		<a href="index"><font
			style="font-size: 20px; text-decoration: none;">zazatao.com</font></a>
	</div>
	<div id="iconDivMain">
		<img id="ib_img" border="0" style="cursor: pointer"
			onclick="ib_wopen();" src="content/static/img/toux.jpg"></img>
		<div id="zi">有问题找我</div>
	</div>

</div>
<script type="text/javascript">
	var div = document.getElementById("big");
	var d1 = document.getElementById("iconDivMain");
	function show() {
		div.style.display = "inline";
		d1.style.display = "inline";
	}
	function f2() {
		div.style.display = "none";
		d1.style.display = "none";
	}
</script>
<script type="text/javascript">
	window.log = function(s) {
	};
	ib_ = {
		bu : 'http://b.ibangkf.com/i',
		fu : 'http://f.ibangkf.com/i',
		tu : 'http://t.ibangkf.com/i',
		aspid : 44490,
		l : 'qwerty123456',
		online : 3,
		vmx : 251,
		asplogined : 1,
		img_hide : 0,
		img_mode : 1,
		img_off : 'http://f.ibangkf.com/i/img/1_.gif',
		img_W : 110,
		img_H : 60,
		img_toright : 0,
		img_offsetH : -220,
		img_offsetW : 20,
		acc_zdyivt : 0,
		acc_W : 0,
		acc_H : 0,
		acc_middle : 0,
		acc_lr : 1,
		acc_left : 280,
		acc_tb : 1,
		acc_top : 230,
		acc_freeze : 0,
		acc_title : 'zazatao&#22312;&#32447;&#21672;&#35810;',
		acc_content : '&#26377;&#20160;&#20040;&#21487;&#20197;&#24110;&#21161;&#24744;&#30340;&#21527;?',
		acc_effect : 0,
		acc_auto : 1,
		acc_tpl : 1,
		acc_pop_pagenum : 1,
		acc_pop_totalnum : 3,
		acc_reinvite : 1,
		acc_reauto_time : 60
	};
	if (location.href.indexOf('kf=0') < 0) {
		if (document.cookie.indexOf('kf=0') < 0) {
			document.write("<scr" + "ipt src='" + ib_.fu
					+ "/js/f.js?20140417' type='text/javascript'></scr"+"ipt>");
		}
	} else {
		document.cookie = 'ibangkf=0';
	}
</script>
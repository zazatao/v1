<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<jsp:include page="electronicsLeft.jsp"></jsp:include>
<div class="nyright">
		<div class="bannerbox fl">
        	<div class="bannerpic">
            <ul>
              <li><a href="gr_list.html"><img src="../content/static/images/header_banner_1.jpg" /></a></li>
              <li><a href="gr_list.html"><img src="../content/static/images/header_banner_2.jpg" /></a></li>
              <li><a href="gr_list.html"><img src="../content/static/images/header_banner_3.jpg" /></a></li>
              <li><a href="gr_list.html"><img src="../content/static/images/header_banner_1.jpg" /></a></li>
            </ul>
            </div>
            <div class="smallbox">
                	<span class="cur">FREE BT HEADSET<br /><h>Pro XT811</h></span>
                    <span>FREE BT HEADSET<br /><h>Pro XT811</h></span>
                    <span>FREE BT HEADSET<br /><h>Pro XT811</h></span>
                    <span>FREE BT HEADSET<br /><h>Pro XT811</h></span>
            </div>
        </div>
        <div class="right_lb_1 fr">
        	<div class="lb_pic1 lb_pic">
                <ul>
                    <li><a href="gr_list.html"><img src="../content/static/images/09.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/08.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/07.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/05.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/03.jpg" /></a></li>
                </ul>
            </div>
            <ul class="lb_piconcs lb_piconcs1">
            	<li></li>
            	<li></li>
            	<li></li>
            	<li></li>
            	<li></li>
            </ul>
        </div>
        <div class="right_lb_2 right_lb_1 fr">
        	<div class="lb_pic lb_pic2">
                <ul>
                    <li><a href="gr_list.html"><img src="../content/static/images/07.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/09.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/05.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/06.jpg" /></a></li>
                    <li><a href="gr_list.html"><img src="../content/static/images/09.jpg" /></a></li>
                </ul>
            </div>
            <ul class="lb_piconcs lb_piconcs2">
            	<li></li>
            	<li></li>
            	<li></li>
            	<li></li>
            	<li></li>
            </ul>
        </div>
        <div class="clear"></div>
        
        <!---right_cen_1 start---->
        <div class="right_cen_1">
        	<h1 style="color:orange;">品牌电子商品</h1>
            	<ul>
            	 <c:forEach items="${brands}" var="brand">
                              <li><a href="../proscenium/shopCommItem?id=${brand.brandID}&page=brand&which=brand">${brand.brandName }</a></li>
                   </c:forEach>
<!--                 	<li><a href="gr_list.html"><img src="../content/static/images/logo/l_1.png" /></a></li> -->
                </ul>
            <a class="more" href="#">VIEW ALL</a>
        </div>
        <!---right_cen_1 over---->
        
      <!---right_cen_2 start---->  
      <script type="text/javascript">
		$(function() {
			var sWidth = $(".cont_lb").width(); //获取焦点图的宽度（显示面积）
			var len = $(".cont_lb ul li").length; //获取焦点图个数
			var index = 0;
			var picTimer;
			
			//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
			var btn = "<div class='btnBg'></div><div class='btn'>";
			for(var i=0; i < len; i++) {
				btn += "<span></span>";
			}
			btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
			$(".cont_lb").append(btn);
			$(".cont_lb .btnBg").css("opacity",0.5);
		
			//为小按钮添加鼠标滑入事件，以显示相应的内容
			$(".cont_lb .btn span").css("opacity",0.4).mouseenter(function() {
				index = $(".cont_lb .btn span").index(this);
				showPics(index);
			}).eq(0).trigger("mouseenter");
		
			//上一页、下一页按钮透明度处理
			$(".cont_lb_2 .preNext").css("opacity",1).hover(function() {
				$(this).stop(true,false).animate({"opacity":"1"},300);
			},function() {
				$(this).stop(true,false).animate({"opacity":"1"},300);
			});
		
			//上一页按钮
			$(".cont_lb_2 .pre").click(function() {
				index -= 1;
				if(index == -1) {index = len - 1;}
				showPics(index);
			});
		
			//下一页按钮
			$(".cont_lb_2 .next").click(function() {
				index += 1;
				if(index == len) {index = 0;}
				showPics(index);
			});
		
			//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
			$(".cont_lb ul").css("width",sWidth * (len));
			
			//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
			$(".cont_lb").hover(function() {
				clearInterval(picTimer);
			},function() {
				picTimer = setInterval(function() {
					showPics(index);
					index++;
					if(index == len) {index = 0;}
				},4000); //此4000代表自动播放的间隔，单位：毫秒
			}).trigger("mouseleave");
			
			//显示图片函数，根据接收的index值显示相应的内容
			function showPics(index) { //普通切换
				var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
				$(".cont_lb ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
				//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
				$(".cont_lb .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
			}
		});
		
		</script>  
        	<div class="cont_lb cont_lb_2">
             <ul>
             	<li>
                	<dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_3.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </li>
                <li>
                	<dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_3.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </li>
                <li>
                	<dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_3.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </li>
                <li>
                	<dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_1.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_3.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_4.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd class="hg_2"><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </li>
             </ul>
            </div>
        <!---right_cen_2 over---->
        
         <!---right_cen_2 start---->
        <div class="right_cen_1 right_cen_2">
        	<h1>推荐产品<a class="more" href="#">VIEW ALL</a></h1>
                <div class="cont_lb">
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_5.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_6.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_7.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_7.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_7.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </div>
        </div>
        <!---right_cen_2 over---->
        
         <!---right_cen_2 start---->
        <div class="right_cen_1 right_cen_2">
        	<h1>推荐产品<a class="more" href="#">VIEW ALL</a></h1>
                <div class="cont_lb">
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_8.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_9.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_10.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
						<dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_10.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                    <dl>
                        <dd class="lb_pic"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_11.jpg" /></a></dd>
                        <dd>Digifilip Pro XT911 Tablet(Wihite,16GB,2G,3G,Wi-Fi)</dd>
                        <dd><span class="red">$79:00</span><span class="p1"><a href="#"><img src="../content/static/images/con_10.png"/></a></span><span class="p2"><a href="#"><img src="../content/static/images/con_11.png"/></a></span></dd>
                        <dd>Digifilip:<span class="red">Tamll</span></dd>
                        <dd><img src="../content/static/images/con_12.png" /></dd>
                    </dl>
                </div>
        </div>
        <!---right_cen_2 over---->
        
        <script>
        
        	$(document).ready(function(){
				//Full Caption Sliding (Hidden to Visible)
				$('.right_cen_3 li').hover(function(){
					$(this).find('span').stop().animate({bottom:'0px'},{queue:false,duration:160});
				}, function() {
					$(this).find('span').stop().animate({bottom:"-"+$(this).find('span').innerHeight()},{queue:false,duration:160});
				});
			});
        </script>
        
         <!---right_cen_3 start---->
        <div class="right_cen_1 right_cen_3">
        	<h1>流行电子产品</h1>
            	<ul>
            	      <c:forEach items="${shopcommlist}" var="shopcomm">
            	             	<li><a href="../proscenium/shopItem?commID=${shopcomm.commCode }&category=${shopcomm.shopCategory.categoryID }&shopID=${shopcomm.belongTo.id }&commoName=${shopcomm.commoidtyName }"><img src="..${shopcomm.shopCommImages[0].imagePath}" /></a><span><h3>${shopcomm.brand.brandName}</h3><p>${shopcomm.commoidtyName}</p></span></li>
            	      </c:forEach>
<!--                 	<li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_14.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_15.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_14.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_15.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_12.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
<!--                     <li><a href="#"><img src="../content/static/images/dq/img_13.jpg" /></a><span><h3>fdsaec</h3><p>fdsuevb zmxeuivgh fjdksah fsjd kagsf jdagf hdsa</p></span></li> -->
                    
                </ul>
        </div>
        </div>
        <!---right_cen_3 over---->
    </div>
    <div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</div>
</body>
</html>
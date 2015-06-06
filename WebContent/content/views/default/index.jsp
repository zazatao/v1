<%@ page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<% String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<base href="<%=basePath%>">
<link href="content/static/css/reception/css.css" rel="stylesheet" type="text/css" />
<script src="content/static/js/reception/png.js" type="text/javascript" ></script>
<script src="content/static/js/reception/ScrollPic.js" type="text/javascript" ></script>
<script type="text/javascript" src="content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/reception/js.js"></script>
</head>
<script type="text/javascript">
    //点击上边文字的链接
	function Search(num){
		$('#img5').html('');
		jQuery.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : "shopComm?id="+num,
			dataType : 'json',
			success : function(data) {
				var coteid = num;
				var $para = "";
				if (data.success == 'true') {
					$.each(data.pr, function(i, item) {
						$para = $para +"<li><a href='proscenium/shopItem?commID="+item.transNumForTaobao+"&category="+item.shopcategory+"&shopID="+item.seller+"&commoName="
								+item.nameOfGoods+"'><img src="+item.path+" alt="+item.nameOfGoods+"/></a></li>";
			        });
				}
				$('#img5').html($para);
				$('#img5').append("<li><div><p><a href='shopCommItemone?id="+coteid+"'>更多</a></p></div></li>");
			}
		});
	}
	function imageFor(cate,commid,seller,name){
		location.href = "/proscenium/shopItem?commID="+commid+"&category="+cate+"&shopID="+seller+"&commoName="+name;
	}
</script>
<body>
	<jsp:include page="./prosceniumNav.jsp"></jsp:include>

    <div class="con"><!---------------   内容主体   ----------------------->
    	<div class="ban">
    		<div class="banner">
    		<c:forEach var="advertisement" items="${advertisements1 }" varStatus="pool">
    			<c:if test="${pool.index == 0 }">
    				<a href="${advertisement.link }" ><img src="..${advertisement.imagePath }" width="818" height="400" /></a>
    			</c:if>
    			<c:if test="${pool.index != 0 }">
    				<a href="${advertisement.link }" style="display:none;"><img src="..${advertisement.imagePath }" width="818" height="400" /></a>
    			</c:if>    			
    		</c:forEach>
            <div class="bannerli">
                <ul>
                  <li class="bannerlio"></li>
                  <li></li>
                  <li></li>
                </ul>
            </div>
            </div>
            <div class="syj">
            	<div><a href="try01.html"><img src="content/static/images/syjt.jpg" width="196" height="283" /></a></div>
                <div class="syjan" style="background:url(content/static/images/syja.jpg) no-repeat;"><a href="try01.html">试衣间</a></div>
                <div class="kdan" style="background:url(content/static/images/ksdp.jpg) no-repeat;"><a href="./proscenium/setUpShop">我要开店</a></div>

                <div class="clear"></div>
       		</div>
        </div>
        <div class="flxx">
        	<div class="flcd">
            <h1>热销商品</h1>
            <div class="fenlei" id="fl1">
            	 <c:forEach items="${list}" var="Comm">
            	 	<a href="#"  onmouseover='Search(${Comm.categoryID});'>       	 	
            	 	<span class="f1" >${fn:substring(Comm.category, 0, 4)}</span></a>
              	</c:forEach> 
             </div>
            <div  id="test" class="tj"><a class="gray" href="red.html">推荐商品</a><a class="red" href="red_2.html">打折促销</a></div>
            </div>
            <div class="flzs">
            	<div class="flan">
                	<ul>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=9');"><img src="content/static/images/txs.jpg" big="content/static/images/txs.jpg" mid="content/static/images/at/txs.jpg" width="67" height="64" /></a></li>
                    	<li><a href="#" onclick="categoryClick('shopCommItems?id=45');"><img src="content/static/images/at/zxj.jpg" big="content/static/images/zxj.jpg" mid="content/static/images/at/zxj.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=33');"><img src="content/static/images/cf.jpg" big="content/static/images/cf.jpg" mid="content/static/images/at/cf.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=14');"><img src="content/static/images/gwb.jpg" big="content/static/images/gwb.jpg" mid="content/static/images/at/gwb.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=40');"><img src="content/static/images/dj.jpg" big="content/static/images/dj.jpg" mid="content/static/images/at/dj.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=11');"><img src="content/static/images/ggx.jpg" big="content/static/images/ggx.jpg" mid="content/static/images/at/ggx.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=27');"><img src="content/static/images/etwj.jpg" big="content/static/images/etwj.jpg" mid="content/static/images/at/etwj.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=41');"><img src="content/static/images/yd.jpg" big="content/static/images/yd.jpg" mid="content/static/images/at/yd.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=16');"><img src="content/static/images/hlyp.jpg" big="content/static/images/hlyp.jpg" mid="content/static/images/at/hlyp.jpg" width="67" height="64" /></a></li>
                        <li><a href="#" onclick="categoryClick('shopCommItems?id=30');"><img src="content/static/images/sb.jpg" big="content/static/images/sb.jpg" mid="content/static/images/at/sb.jpg" width="67" height="64" /></a></li>                  	
                    </ul>
                </div>
                <div class="fltp">
                	<div class="fltplas">
                		<div class="fltpf" id="buyCatNum">
                			<ul id="img5">
                				<c:forEach items="${lists}" var="category" varStatus="loop">
                        			<c:if test="${loop.index < 7 }">
            	 						<li><a href="proscenium/shopItem?commID=${category.transNumForTaobao}&category=${category.shopcategory}&shopID=${category.seller}&commoName=${category.nameOfGoods}"><img src="..${category.path }" alt="${category.nameOfGoods }"/></a></li>
              						</c:if>
              					</c:forEach> 
                        		<li><div><p><a href="shopCommItemone?id=6">更多</a></p></div></li>
                    		</ul>
                		</div>
                	</div>
                </div>

                <script type="text/javascript">
              	//点击左边图片的链接
                function categoryClick(paramUrl){
                	$("#fl1").html("");
                	$("#img5").html("");
            		jQuery.ajax({
            			type : 'GET',
            			contentType : 'application/json',
            			url : paramUrl,
            			dataType : 'json',
            			success : function(data) {
            				if( data.success == "true" ){ 
            					var coteid = data.categoryId;
            					var $cote = "";
            					var $para = "";

            					$.each(data.list, function(i, item) {
            						$cote = $cote +"<a href='#'  onmouseover='Search("+item.categoryID+");'><span class='f1' >"+item.category+"</span></a>";		
            				    });
            						
            					$.each(data.lists, function(i, item) {
            						if ( i < 7 ) {
            							$para = $para +"<li><a href='proscenium/shopItem?commID="+item.transNumForTaobao+"&category="+item.shopcategory+"&shopID="+item.seller+"&commoName="
        									+item.nameOfGoods+"'><img src="+item.path+" alt="+item.nameOfGoods+"/></a></li>";
            						}            							
            				    });
            					
            					$('#fl1').html($cote);
            					$('#img5').html($para);
            					$('#img5').append("<li><div><p><a href='shopCommItemone?id="+coteid+"&page=page'>更多</a></p></div></li>");
            				}       
            			}
            		});	
            	}
				</script>
                <div class="clear"></div>
            </div>
        </div>
        <div class="fldh2">
        	<div class="shfl">——————————— &nbsp;&nbsp;&nbsp;&nbsp; 在我们的商店你们可以选择你们要的产品 &nbsp;&nbsp;&nbsp;&nbsp; ———————————</div>
            <div class="fltpzs">
                <div class="fltpzs2">
                	<ul>
                	<c:forEach var="advertisement" items="${advertisements2 }" varStatus="pool">
    					<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }" height="304"  /></a></li>
    				</c:forEach>
    				</ul>
                </div>
                <div class="clear"></div>
			</div>
        </div>
        <div class="fldh3">
        	<div class="shfl">——————————— &nbsp;&nbsp;&nbsp;&nbsp; 订单2天做好， 20天之内全世界发货。 &nbsp;&nbsp;&nbsp;&nbsp; ———————————</div>
            <div class="fltpz3">
                <div style="margin-top:5px; height:311px;">
                	<ul>
                	<c:forEach var="advertisement" items="${advertisements3 }" varStatus="pool">
    					<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }" height="311" width="512" /></a></li>
    				</c:forEach>
    				</ul>
                </div>
			</div>
        </div>
        <div class="ppjq">
        	<ul>
                <c:forEach var="advertisement" items="${advertisements4 }" varStatus="pool">
    					<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }" /></a></li>
    			</c:forEach>
            </ul>
            <div class="jrppj"><a href="gr_3.html">名牌街 进去名牌街 ></a></div>
            <div class="clear"></div>
        </div>
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
        	<div class="sptop"><img src="content/static/images/tbfh.jpg" width="14" height="14" />&nbsp; 时尚站点</div>
            <div class="spcon">
            <div class="catalog_img">          
            <DIV class="LeftBotton" id="LeftArr"></DIV>
            <DIV class="Cont" id="ISL_Cont_1">
            <!-- 图片列表 begin -->
            	<c:forEach var="advertisement" items="${advertisements5 }" varStatus="pool">
    					<DIV class="box"><a class=imgBorder href="${advertisement.link }" ><img src="..${advertisement.imagePath }" /></a></DIV>
    			</c:forEach>
            </DIV>
            <DIV class="RightBotton" id="RightArr"></DIV></DIV>
            
            <SCRIPT language=javascript type=text/javascript>
					<!--//--><![CDATA[//><!--
					var scrollPic_02 = new ScrollPic();
					scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
					scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
					scrollPic_02.arrRightId     = "RightArr"; //右箭头ID
			
					scrollPic_02.frameWidth     = 916; //显示框宽度
					scrollPic_02.pageWidth      = 229; //翻页宽度
			
					scrollPic_02.speed          = 10; //移动速度(单位毫秒，越小越快)
					scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
					scrollPic_02.autoPlay       = false; //自动播放
					scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)
			
					scrollPic_02.initialize(); //初始化
										
					//--><!]]>
			</SCRIPT>
            </div>            
        </div>
        <!-------------图片轮播----------------->
        <div class="clear"></div>
    </div> 
 <jsp:include page="./foot.jsp"></jsp:include>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="content/static/css/reception/css.css" rel="stylesheet" type="text/css" />
<script src="content/static/js/reception/png.js" type="text/javascript" ></script>
<script src="content/static/js/reception/ScrollPic.js" type="text/javascript" ></script>
<script type="text/javascript" src="content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript" src="content/static/js/reception/js.js"></script>
</head>

<body>
	<jsp:include page="./prosceniumNav.jsp"></jsp:include>
			<script>
			$(document).ready(function(){
			    var $guige = "";
				<c:forEach items="${shopCategories }" var="shopCategory">
					if ('${shopCategory.level}' == 1) {
						alert('${shopCategory.categoryID}');
						$guige = $guige + "<li><a href='../proscenium/categoryOne?id=${shopCategory.categoryID}'>${shopCategory.category}</a><div>";
					}
					<c:forEach items="${shopCategories }" var="shopCategory2">
						if('${shopCategory2.level}' == 2 && '${shopCategory2.parentLevel}' == '${shopCategory.categoryID}' ){
							$guige = $guige + "<div class='nav-column'><h3>${shopCategory.category}</h3><ul>";
						}
						<c:forEach items="${shopCategories }" var="shopCategory3">
							if('${shopCategory3.level}' == 3 && '${shopCategory3.parentLevel}' == '${shopCategory2.categoryID}' ){
								$guige = $guige + "<li><a href='../proscenium/categoryThree?id=${shopCategory3.categoryID}'>${shopCategory3.category }</a></li>";
							}
						</c:forEach>
						$guige = $guige + "</ul></div>";
					</c:forEach>
					$guige = $guige + "</div></li>";
				</c:forEach>
				$('#navShopCaegory1').append($guige);
			});
		</script>
    <div class="con"><!---------------   内容主体   ----------------------->
    	<div class="ban">
    		<div class="banner">
            <a href="index.jsp"><img src="content/static/images/banner.jpg" width="818" height="400" /></a>
            <a href="index.jsp" style="display:none;"><img src="content/static/images/banner_2.jpg" width="818" height="400" /></a>
            <a href="index.jsp" style="display:none;"><img src="content/static/images/banner_3.jpg" width="818" height="400" /></a>
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
            <div class="fenlei">
            	<span class="f1"><div style="background:#fbd70c;"></div><a href="#">平板电脑</a></span>
                <span class="f2"><div style="background:#116d0f;"></div><a href="#">照相机/摄录机</a></span>
                <span class="f3"><div style="background:#000000;"></div><a href="#">笔记本</a></span>
            </div>
            <div class="fenlei">
                <span class="f4"><div style="background:#c20102;"></div><a href="#">家用电器</a></span>
                <span class="f5"><div style="background:#ffffff;"></div><a href="#">冰箱</a></span>
            </div>
            <div class="fenlei">
            	<span class="f1"><div style="background:#fbd70c;"></div><a href="#">女包</a></span>
            </div>
            <div class="fenlei">
            	<span class="f1"><div style="background:#fbd70c;"></div><a href="#">平板电脑</a></span>
                <span class="f2"><div style="background:#116d0f;"></div><a href="#">照相机/摄录机</a></span>
                <span class="f3"><div style="background:#000000;"></div><a href="#">笔记本</a></span>
                <span class="f4"><div style="background:#c20102;"></div><a href="#">家用电器</a></span>
                <span class="f5"><div style="background:#ffffff;"></div><a href="#">冰箱</a></span>
            </div>
            <div class="fenlei">
            	<span class="f1"><div style="background:#fbd70c;"></div><a href="#">平板电脑</a></span>
                <span class="f2"><div style="background:#116d0f;"></div><a href="#">照相机/摄录机</a></span>
                <span class="f3"><div style="background:#000000;"></div><a href="#">笔记本</a></span>
                <span class="f4"><div style="background:#c20102;"></div><a href="#">家用电器</a></span>
                <span class="f5"><div style="background:#ffffff;"></div><a href="#">冰箱</a></span>
            </div>
            <div class="tj"><a class="gray" href="red.html">推荐商品</a><a class="red" href="red_2.html">打折促销</a></div>
            </div>
            <div class="flzs">
            	<div class="flan">
                	<ul>
                    	<li><a><img src="content/static/images/at/zxj.jpg" big="content/static/images/zxj.jpg" mid="content/static/images/at/zxj.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/cf.jpg" big="content/static/images/cf.jpg" mid="content/static/images/at/cf.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/gwb.jpg" big="content/static/images/gwb.jpg" mid="content/static/images/at/gwb.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/dj.jpg" big="content/static/images/dj.jpg" mid="content/static/images/at/dj.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/ggx.jpg" big="content/static/images/ggx.jpg" mid="content/static/images/at/ggx.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/etwj.jpg" big="content/static/images/etwj.jpg" mid="content/static/images/at/etwj.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/txs.jpg" big="content/static/images/txs.jpg" mid="content/static/images/at/txs.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/yd.jpg" big="content/static/images/yd.jpg" mid="content/static/images/at/yd.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/hlyp.jpg" big="content/static/images/hlyp.jpg" mid="content/static/images/at/hlyp.jpg" width="67" height="64" /></a></li>
                        <li><a><img src="content/static/images/sb.jpg" big="content/static/images/sb.jpg" mid="content/static/images/at/sb.jpg" width="67" height="64" /></a></li>
                    </ul>
                </div>
                
                <div class="fltp">
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_1.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_2.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_3.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_4.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_5.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_6.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_1.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_2.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_3.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_4.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_5.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_6.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/xb_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/yg_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_1.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_2.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_3.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_4.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_5.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_6.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/px_7.jpg" /></a></li>
                                <li><div><p><a href="yl_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/wj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_1.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_2.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_3.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_4.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_5.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_6.jpg" /></a></li>
                                <li><a href="yl_list_detail.html"><img src="content/static/images/at/nz_7.jpg" /></a></li>
                                <li><div><p><a href="yl_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/lq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/jz_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                	<div class="fltplas">                    
                        <div class="fltps">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/sb_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dn_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/zxj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bj_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">

                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/dq_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                        <div class="fltpf">
                            <ul>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_1.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_2.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_3.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_4.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_5.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_6.jpg" /></a></li>
                                <li><a href="gr_list_detail.html"><img src="content/static/images/at/bx_7.jpg" /></a></li>
                                <li><div><p><a href="gr_list.html">更多</a></p></div></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <script type="text/javascript">
					function tabSlider(obj,objs,objlas,objsn,objsno){
						$(function(){
							hookThumb();
						})
						 var i=-1;//第i+1个tab开始
							
						function autoroll(){
							nca = $(obj).length-1;
							i++;
							if(i > nca){
							i = 0;
							}
							slide(i);
						}
						
						function slide(i){
							$(obj).eq(i).addClass(objs).siblings().removeClass(objs);
							$(objlas + ":visible " + objsn).eq(i).css('display','block').siblings(objsn).css('display','none');
							$(objsno).css('display','none');
						}
						
						function hookThumb(){    
							$(obj).hover(
							function(){
									i = $(this).prevAll().length;
									slide(i); 
							},function(){
								this.blur();            
								return false;
							}); 
						}
					}
					function tabSliderck(obj,objs,objlas,objsn,objfl,objsno){
						$(function(){
							hookThumb();
							$(objfl + ':first').css('display','block');
							$(objlas + ':first').css('display','block');
							$(objsn + ':first').css('display','block');
						})
						 var i=-1;//第i+1个tab开始
							
						function autoroll(){
							nca = $(obj).length-1;
							i++;
							if(i > nca){
							i = 0;
							}
							slide(i);
						}
						
						function slide(i){
							$(obj).eq(i).addClass(objs).siblings().removeClass(objs);
							$(objlas).eq(i).css('display','block').siblings(objlas).css('display','none');
							$(objfl).eq(i).css('display','block').siblings(objfl).css('display','none');
							
							$(objsn).css('display','block');
							$(objsno).css('display','none');
						}
						
						function hookThumb(){    
							$(obj).click(
							function(){
									i = $(this).prevAll().length;
									slide(i); 
									$(this).find("img").attr('src',$(this).find("img").attr("mid"));
									$(obj).not(this).each(function(){ 
										$(this).find("img").attr('src',$(this).find("img").attr("big"));
									  });
							},function(){
								this.blur();            
								return false;
							}); 
						}
					}
					
					$(document).ready(function(){
						tabSliderck(".flan li","sd01",".fltplas",".fltps",".fenlei",".fltpf");
						tabSlider(".fenlei span","sd01",".fltplas",".fltpf",".fltps");
					})
				</script>
                <div class="clear"></div>
            </div>
        </div>
        <div class="fldh2">
        	<div class="shfl">——————————— &nbsp;&nbsp;&nbsp;&nbsp; 在我们的商店你们可以选择你们要的产品 &nbsp;&nbsp;&nbsp;&nbsp; ———————————</div>
            <div class="fltpzs">
                <div class="fltpzs1">
                    <ul>
                        <li><a href="yl_list.html"><img src="content/static/images/sp.jpg" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/ny.jpg" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/kx.jpg" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/wscd.jpg"/></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/jsqc.jpg" /></a></li>
                    </ul>
                </div>
                <div class="fltpzs2">
                    <ul>
                        <li><a href="yl_list.html"><img src="content/static/images/nwd.jpg" height="304" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/lyq.jpg" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/hzp.jpg" /></a></li>
                    </ul>
                </div>
                <div class="clear"></div>
			</div>
        </div>
        <div class="fldh3">
        	<div class="shfl">——————————— &nbsp;&nbsp;&nbsp;&nbsp; 订单2天做好， 20天这内全世界发货。 &nbsp;&nbsp;&nbsp;&nbsp; ———————————</div>
            <div class="fltpz3">
                <div style="height:300px;">
                    <ul>
                        <li><a href="yl_list.html"><img src="content/static/images/sy.jpg" height="300" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/nz.jpg" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/et.jpg" /></a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
                <div style="margin-top:5px; height:311px;">
                    <ul>
                        <li><a href="yl_list.html"><img src="content/static/images/tea.jpg" height="311" /></a></li>
                        <li><a href="yl_list.html"><img src="content/static/images/top_100.jpg" width="512" /></a></li>
                    </ul>
                    <div class="clear"></div>
                </div>
			</div>
        </div>
        <div class="ppjq">
        	<ul>
            	<li class="n01">
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_02_01.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_03_01.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_04_01.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_05_01.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_06_01.jpg" /></a>
                </li>
                <li  class="n02">
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_02_02.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_03_02.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_04_02.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_05_02.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_06_02.jpg" /></a>
                </li>
                <li class="n03">
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_02_03.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_03_03.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_04_03.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_05_04.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_06_03.jpg" /></a>
                </li>
                <li class="n04">
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_02_04.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_03_04.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_04_04.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_05_05.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_06_04.jpg" /></a>
                </li>
                <li class="n05">
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_02_05.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_03_05.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_04_05.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_05_06.jpg" /></a>
                    <a href="yl_list.html"><img src="content/static/images/logo/ppj_06_05.jpg" /></a>
                </li>
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
        	<div class="sptop"><img src="content/static/images/tbfh.jpg" width="14" height="14" />&nbsp; 电影射频用途网站</div>
            <div class="spcon">
            <div class="catalog_img">          
            <DIV class="LeftBotton" id="LeftArr"></DIV>
            <DIV class="Cont" id="ISL_Cont_1"><!-- 图片列表 begin -->
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV>
            <DIV class="box"><A class=imgBorder href="video.html"><img src="content/static/images/lb.jpg"/></A> </DIV><!-- 图片列表 end --></DIV>
            
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

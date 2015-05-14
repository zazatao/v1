<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!------cont_head start-------->
	<div class="cont_head">
    	<div class="cont_head_left">
        	<dl>
            	<dt>汽车配件</dt>
                <dd><img src="../content/static/images/small/s_1.png" /><a href="23"  onclick="categoryClick('shopCommItems?id=33');">汽车电子产品</a></dd>
                <dd><img src="../content/static/images/small/s_2.png" /><a href="63"  onclick="categoryClick('shopCommItems?id=33');">汽车照明</a></dd>
                <dd><img src="../content/static/images/small/s_3.png" /><a href="24"  onclick="categoryClick('shopCommItems?id=33');">GPS导航<br /></a></dd>
                <dd><img src="../content/static/images/small/s_4.png" /><a href="64"  onclick="categoryClick('shopCommItems?id=33');">汽车保养<br /></a> </dd>
                <dd><img src="../content/static/images/small/s_5.png" /><a href="65"  onclick="categoryClick('shopCommItems?id=33');">汽配 <br /></a></dd>
                <dd><img src="../content/static/images/small/s_6.png" /><a href="66"  onclick="categoryClick('shopCommItems?id=33');">工具 <br /></a></dd>
                <dd><img src="../content/static/images/small/s_7.png" /><a href="67"  onclick="categoryClick('shopCommItems?id=33');">汽车配件</a></dd>
                <dd style="border-bottom:none;"><img src="../content/static/images/small/s_8.png" /><a href="68" onclick="categoryClick('shopCommItems?id=33');">摩托车用品</a></dd>
            </dl>
        </div>
        <div class="cont_head_center">
			<script type="text/javascript">
            $(function() {
                var sWidth = $(".banner").width(); //获取焦点图的宽度（显示面积）
                var len = $(".banner ul li").length; //获取焦点图个数
                var index = 0;
                var picTimer;
                
                //以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
                var btn = "<div class='btnBg'></div><div class='btn'>";
                for(var i=0; i < len; i++) {
                    btn += "<span></span>";
                }
                btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
                $(".banner").append(btn);
                $(".banner .btnBg").css("opacity",0.5);
            
                //为小按钮添加鼠标滑入事件，以显示相应的内容
                $(".banner .btn span").css("opacity",0.4).mouseenter(function() {
                    index = $(".banner .btn span").index(this);
                    showPics(index);
                }).eq(0).trigger("mouseenter");
            
                //上一页、下一页按钮透明度处理
                $(".banner .preNext").css("opacity",0.2).hover(function() {
                    $(this).stop(true,false).animate({"opacity":"0.5"},300);
                },function() {
                    $(this).stop(true,false).animate({"opacity":"0.2"},300);
                });
            
                //上一页按钮
                $(".banner .pre").click(function() {
                    index -= 1;
                    if(index == -1) {index = len - 1;}
                    showPics(index);
                });
            
                //下一页按钮
                $(".banner .next").click(function() {
                    index += 1;
                    if(index == len) {index = 0;}
                    showPics(index);
                });
            
                //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
                $(".banner ul").css("width",sWidth * (len));
                
                //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
                $(".banner").hover(function() {
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
                    $(".banner ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position
                    //$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
                    $(".banner .btn span").stop(true,false).animate({"opacity":"0.4"},300).eq(index).stop(true,false).animate({"opacity":"1"},300); //为当前的按钮切换到选中的效果
                }
                //局部刷新
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
            					if (data.success == 'true') {
            						$.each(data.list, function(i, item) {
            							$cote = $cote +"<a href='#' onclick='Search("+item.categoryID+");'><span class='f1' >"+item.category+"</span></a>";		
            				        });
            						
            						$.each(data.lists, function(i, item) {
            							$para = $para +"<li><a href='proscenium/shopItem?commID="+item.transNumForTaobao+"&category="+item.shopcategory+"&shopID="+item.seller+"&commoName="
            									+item.nameOfGoods+"'><img src="+item.path+" alt="+item.nameOfGoods+"/></a></li>";
            				        });
            					}
            					$('#fl1').html($cote);
            					$('#img5').html($para);
            					$('#img5').append("<li><div><p><a href='proscenium/shopCommItem?id="+coteid+"&page=page'>更多</a></p></div><>");
            				}       
            			}
            		});	
            	}
                
            });
            
            </script>
        	<div class="banner">
              <ul>
              	<c:forEach var="advertisement" items="${advertisements1 }" varStatus="pool">
    				<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/></a></li>
    			</c:forEach>
                <!-- <li>
                   <a href="gr_list.html"><img src="../content/static/images/dq/banner01.jpg" /></a>
                </li>
                <li>
                   <a href="gr_list.html"><img src="../content/static/images/dq/banner02.jpg" /></a>
                </li>
                <li>
                  <a href="gr_list.html"><img src="../content/static/images/dq/banner03.jpg" /></a>
                </li>
                <li>
                   <a href="gr_list.html"><img src="../content/static/images/dq/banner01.jpg" /></a>
                </li> -->
              </ul>
            </div>
            <div class="smallbox_2">
            	<c:forEach var="advertisement" items="${advertisements2 }" varStatus="pool">
    				<a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/></a>
    			</c:forEach>
            	<!-- <a href="gr_list.html"><img src="../content/static/images/dq/img_16.jpg" /></a>
                <a href="gr_list.html"><img src="../content/static/images/dq/img_17.jpg" /></a>
                <a href="gr_list.html"><img src="../content/static/images/dq/img_18.jpg" /></a> -->
            </div>
        </div>
        <div class="cont_head_right">
        	<c:forEach var="advertisement" items="${advertisements3 }" varStatus="pool">
    			<c:if test="${pool.index == 0 }">
    				<span class="sp_top"><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/></a></span>
    			</c:if>
    			<c:if test="${pool.index != 0 }">
    				<span><a href="${advertisement.link }"><img src="..${advertisement.imagePath }"/></a></span>
    			</c:if>    			
    		</c:forEach>
        	<!-- <span class="sp_top"><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_19.jpg" /></a></span>	
            <span><a href="yl_list_detail.html"><img src="../content/static/images/dq/img_20.jpg" /></a></span>	 -->	
        </div>
    </div>
    <!------cont_head over-------->

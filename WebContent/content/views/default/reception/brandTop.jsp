<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="dqwz">
	<a href="../index">主页</a>> <a
		href="../proscenium/categoryLei?id=-1&page=brand">主要目录</a> ><a
		href="../proscenium/categoryLei?id=-1&page=brand">品牌街</a>
</div>
<div class="nyleft">
	<div class="hbflcd">
		<div class="jd_left_top">全球品牌</div>
		<ul class="menu4">
			<c:forEach items="${shopCategories }" var="category" varStatus="loop">
				<c:if test="${category.level == 1  }">
					<c:if
						test="${category.category !='汽车用具' && category.category !='电子产品' }">
						<li><a
							href="../proscenium/categoryOne?id=${category.categoryID  }"><p>${category.category }</p>
								<span>></span></a>
						<div>
					</c:if>
					<c:if test="${category.category =='电子产品' }">
						<li><a
							href="../proscenium/categoryLei?id=${category.categoryID  }&page=electronics"><p>${category.category }</p>
								<span>></span></a>
						<div>
					</c:if>
					<c:if test="${category.category =='汽车用具' }">
						<li><a
							href="../proscenium/categoryLei?id=${category.categoryID  }&page=autoSupplies"><p>${category.category }</p>
								<span>></span></a>
						<div>
					</c:if>
					<c:forEach items="${shopCategories }" var="one">
						<c:if test="${one.parentLevel == category }">
							<dl>
								<dt>
									<a href="#">${fn:substring(one.category,0,6) }</a>
								</dt>
								<c:forEach items="${shopCategories }" var="two">
									<c:if
										test="${fn:length(two.brands)>0 && two.parentLevel == one }">
										<dd>
											<a
												href="../proscenium/shopCommItem?id=${two.categoryID }&page=brand">${fn:substring(two.category,0,6) }</a>
										</dd>
									</c:if>
								</c:forEach>
							</dl>
						</c:if>
					</c:forEach>
	</div>
	</li>
	</c:if>
	</c:forEach>
	</ul>
</div>
</div>
<div class="nyright_2">
	<script type="text/javascript">
		$(function() {
			var sWidth = $(".banner_gr").width(); //获取焦点图的宽度（显示面积）
			var len = $(".banner_gr ul li").length; //获取焦点图个数
			var index = 0;
			var picTimer;

			//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
			var btn = "<div class='btnBg'></div><div class='btn'>";
			for (var i = 0; i < len; i++) {
				btn += "<span></span>";
			}
			btn += "</div><div class='preNext pre'></div><div class='preNext next'></div>";
			$(".banner_gr").append(btn);
			$(".banner_gr .btnBg").css("opacity", 0.5);

			//为小按钮添加鼠标滑入事件，以显示相应的内容
			$(".banner_gr .btn span").css("opacity", 0.4).mouseenter(
					function() {
						index = $(".banner_gr .btn span").index(this);
						showPics(index);
					}).eq(0).trigger("mouseenter");

			//上一页、下一页按钮透明度处理
			$(".banner_gr .preNext").css("opacity", 0.2).hover(function() {
				$(this).stop(true, false).animate({
					"opacity" : "0.5"
				}, 300);
			}, function() {
				$(this).stop(true, false).animate({
					"opacity" : "0.2"
				}, 300);
			});

			//上一页按钮
			$(".banner_gr .pre").click(function() {
				index -= 1;
				if (index == -1) {
					index = len - 1;
				}
				showPics(index);
			});

			//下一页按钮
			$(".banner_gr .next").click(function() {
				index += 1;
				if (index == len) {
					index = 0;
				}
				showPics(index);
			});

			//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
			$(".banner_gr ul").css("width", sWidth * (len));

			//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
			$(".banner_gr").hover(function() {
				clearInterval(picTimer);
			}, function() {
				picTimer = setInterval(function() {
					showPics(index);
					index++;
					if (index == len) {
						index = 0;
					}
				}, 4000); //此4000代表自动播放的间隔，单位：毫秒
			}).trigger("mouseleave");

			//显示图片函数，根据接收的index值显示相应的内容
			function showPics(index) { //普通切换
				var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
				$(".banner_gr ul").stop(true, false).animate({
					"left" : nowLeft
				}, 300); //通过animate()调整ul元素滚动到计算出的position
				//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
				$(".banner_gr .btn span").stop(true, false).animate({
					"opacity" : "0.4"
				}, 300).eq(index).stop(true, false).animate({
					"opacity" : "1"
				}, 300); //为当前的按钮切换到选中的效果
			}
		});
	</script>
	<div class="banner_grlist">
		<ul class="banner_grlistlogo">
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_2.jpg" /></a></li>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_4.jpg" /></a></li>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_5.jpg" /></a></li>
		</ul>
		<div class="banner_grlistbt">
			<span> <a class="options pre" href="javascript:;"
				data-drec="pre"><img
					src="../content/static/images/dz/banner_gr_2_03.png" width="14"
					height="26" /></a>
			</span>
			<ul>
				<li></li>
				<li></li>
				<li></li>
			</ul>
			<span><a class="options next" href="javascript:;"
				data-drex="next"><img
					src="../content/static/images/dz/banner_gr_2_05.png" width="14"
					height="26" /></a></span>
		</div>
	</div>
	<div class="banner_gr">
		<ul>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_1.jpg" /></a></li>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_1_1.jpg" /></a></li>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_1_2.jpg" /></a></li>
			<li><a href="gr_list.html"><img
					src="../content/static/images/dz/banner_gr_1_3.jpg" /></a></li>
		</ul>
	</div>
</div>
<!-------------nyleft over------------------------>
<div class="clear"></div>

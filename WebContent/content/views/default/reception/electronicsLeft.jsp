<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="dqwz">
	<a href="../index">主页</a>> <a
		href="../proscenium/categoryLei?id=30&page=electronics">主要目录</a> ><a
		href="../proscenium/categoryLei?id=30&page=electronics"> 电子产品 </a>
</div>
<div class="nyleft">
	<div class="hbflcd">
		<div class="jd_left_top">电子产品</div>
		<script type="text/javascript">
            var myMenu;
            window.onload = function() {
                myMenu = new SDMenu("my_menu");
                myMenu.init();
            };
            </script>
		<div id="my_menu" class="sdmenu">
			<c:forEach items="${list }" var="category" varStatus="loop">
				<c:if test="${category.parentLevel == cate.categoryID  }">
					<div class="collapsed">
						<span>${category.category }</span>
						<div>
							<c:forEach items="${list }" var="one">
								<c:if test="${one.parentLevel == category.categoryID  }">
									<a
										href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">${one.category }</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="leftzs">
		<ul>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/016.jpg" /></a>
			<h>【<span class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="#">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/017.jpg" /></a>
			<h>【<span class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="#">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/018.jpg" /></a>
			<h>【<span class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="#">￥123</a></li>
			<li><a href="yl_list_detail.html"><img
					src="../content/static/images/dz/016.jpg" /></a>
			<h>【<span class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold"
				href="#">￥123</a></li>
		</ul>
	</div>
</div>
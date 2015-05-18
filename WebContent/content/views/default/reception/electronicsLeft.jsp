<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="dqwz"><a href="../index">主页</a>> <a href="../proscenium/categoryLei?id=30&page=electronics">主要目录</a> ><a href="../proscenium/categoryLei?id=30&page=electronics"> 电子产品 </a></div>
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
				<c:forEach items="${cate.children }" var="category" varStatus="loop">
					<div class="collapsed">
						<span>
						<c:if test="${sessionScope.language == 'chinese' }">${category.category }</c:if>
						<c:if test="${sessionScope.language == 'russina' }">${category.russinaCategory }</c:if>
						</span>
							<div>
								<c:forEach items="${category.children }" var="one">
									<a href="../proscenium/shopCommItem?id=${one.categoryID }&page=page">
									<c:if test="${sessionScope.language == 'chinese' }">${one.category }</c:if>
									<c:if test="${sessionScope.language == 'russina' }">${one.russinaCategory }</c:if>
									</a>
								</c:forEach>
							</div>
					</div>
			</c:forEach>
            </div>
        </div>
        <div class="leftzs">
            <ul>
            	<c:forEach var="advertisement" items="${advertisements4 }" varStatus="pool">
    					<li><a href="${advertisement.link }" ><img src="..${advertisement.imagePath }"/><h>【<span class="red">人气爆款</span>】测试信息测试信息测试信息</h><a class="bold" href="#">￥123</a></li>
    			</c:forEach>
            </ul>
		</div>
    </div>
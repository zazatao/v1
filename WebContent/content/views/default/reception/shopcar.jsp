<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/shopcar.css"
	rel="stylesheet" type="text/css" />
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
		<div class="shopcar">
			<!-----基本信息-------->
			<div class="shopcartop">
				<ul>
					<li class="shcatock"><a href="shopcar.html"><img
							src="../content/static/images/brand/shcanumc_1.png" />购物车</a></li>
					<li><img src="../content/static/images/brand/shcatoplis.png" /></li>
					<li><a href="shopcardelv.html"><img
							src="../content/static/images/brand/shcanum_2.png" />交付</a></li>
					<li><img src="../content/static/images/brand/shcatoplis.png" /></li>
					<li><a href="shopcarpro.html"><img
							src="../content/static/images/brand/shcanum_3.png" />付款</a></li>
					<li><img src="../content/static/images/brand/shcatoplis.png" /></li>
					<li><a href="#"><img
							src="../content/static/images/brand/shcanum_4.png" />账户</a></li>
				</ul>
				<div class="cl"></div>
			</div>
			<h3 class="shopcarles">
				<img src="../content/static/images/brand/shcanumc_1.png" width="16"
					height="16" />购物车里的商品<span><a href="#">回去继续采购</a></span>
			</h3>
			<div class="shopcartab">
				<div class="shopcartabt1">
					<div class="shcatbtil">
						<div class="shctlink"></div>
						<div class="sctbldsc">产品描述</div>
						<div class="shctlink"></div>
						<div class="sctblnum">数量</div>
						<div class="shctlink"></div>
						<div class="sctblpri">价格</div>
						<div class="shctlink"></div>
						<div class="sctblapw">大概重量</div>
						<div class="shctlink"></div>
						<div class="sctblamt">价格</div>
					</div>
					<c:set var="sum" value="0"></c:set>
					<c:forEach items="${list }" var="shopCar">
					<div class="shcatbtis">
						<div class="shctlink"></div>
						<div class="sctbldsc">
							<p>
								<span><a href="./deleteShopCar?id=${shopCar.catID }">从购物车里删除</a></span>
							</p>
							<div>
								<c:set value="${fn:split(shopCar.specs,',')}" var="spec"></c:set>
								<c:forEach items="${spec }" var="sp">
									<p class="sctbldscl">
										<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
											<img src="..${fn:substring(sp, fn:indexOf(sp, '$')+1, fn:length(sp)) }" />
										</c:if>
									</p>
								</c:forEach>
									<div class="sctbldscr">
										<p>${shopCar.shopCommoidty.commoidtyName }</p>
										<ul>
											<c:forEach items="${spec }" var="sp">
													<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
														<li><span>颜色:</span>
															${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:indexOf(sp, '$') )}
														</li>
													</c:if>
													<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '尺寸'}">
														<li><span>尺寸</span>
																${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:length(sp) )}
														</li>
													</c:if>
													<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) != '尺寸' && fn:substring(sp,0,fn:indexOf(sp, '-')) != '颜色'}">
														<li class="sctbldscrlb"><span>${fn:substring(sp,0,fn:indexOf(sp, '-'))}</span>
															${fn:substring(sp,fn:indexOf(sp, '-') +1, fn:length(sp) )}
														</li>
													</c:if>
											</c:forEach>
										</ul>
										<p class="sctbldscp red">
										库存数量：<c:out value="${shopCar.shopCommoidty.proportion * shopCar.shopCommoidty.stock} "></c:out></p>
									</div>
							</div>
							<div class="cl"></div>
							<div class="sctbldscb">
								<p class="sctbldscl">产品详情</p>
								<p class="sctbldscr">
								</p>
							</div>
						</div>
						<div class="shctlink"></div>
						<div class="sctblnum">
							<div>
								<input class="btn_prev" name="" type="button" value="-" /> <input
									class="texnum" name="" type="text" value="${shopCar.buyAmount }" /> <input
									class="btn_next" name="" type="button" value="+" />
							</div>
						</div>
						<div class="shctlink"></div>
						<div class="sctblpri">
							<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice }" type="currency" pattern="#,###.00#"/> <br />
							<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special}" type="currency" pattern="#,###.00#"/> 
						</div>
						<div class="shctlink"></div>
						<div class="sctblapw">
							<fmt:formatNumber value="${shopCar.buyAmount * shopCar.shopCommoidty.probablyWeight}" type="currency" pattern="#,###.00#"/> 
						</div>
						<div class="shctlink"></div>
						<div class="sctblamt">
							<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount }" type="currency" pattern="#,###.00#"/>
						 <c:set var="sum" value="${sum + shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount}"></c:set>
						</div>
					</div>
					</c:forEach>
					<script>
							$(function() {
								//获得文本框对象
								//数量增加操作
								$(".btn_next")
										.click(
												function() {
													var t = $(this).siblings(
															'.texnum');
													t
															.val(parseInt(t
																	.val()) + 1)
													if (parseInt(t.val()) > 1) {
														$(this)
																.siblings(
																		'.btn_prev')
																.attr(
																		'disabled',
																		false);
													}
												});
								//数量减少操作
								$(".btn_prev").click(function() {
									var t = $(this).siblings('.texnum');
									t.val(parseInt(t.val()) - 1);
									if (parseInt(t.val()) <= 1) {
										$(this).attr('disabled', true);
									}
								});

							});
						</script>
					<div class="shcatbbts">
						<p class="shcatbbtst">
							<span class="red">*</span>这个只是一个估算的运费，具体运费要货物到达我们仓库称重后才能计算
						</p>
						<p class="shcatbbtstw">
							<span><label><input name="1" type="radio" value="" />礼品包装</label></span>
							<span>ИЛИ</span> <span class="greed"><label><input
									name="1" type="radio" value="" />保留原包装</label></span> <span
								class="shcatbbtstwles">展示</span>
						</p>
						<div class="shcatbbtsl">
							<img src="../content/static/images/brand/sctbldscims.png" />
						</div>
						<div class="shcatbbtsr">
							<ul class="shcatbbtsrtil">
								<li class="shcatbbtsro">选择套装</li>
								<li class="shcatbbtsrt">数量</li>
								<li class="shcatbbtsrs">价格</li>
								<li class="shcatbbtsrf">金额</li>
							</ul>
							<ul>
								<li class="shcatbbtsro"><p>
										<label><span><input name="" type="checkbox"
												value="" /></span>准备节日套装<br /> 给您亲近的人设计赠送礼物</label><span class="right"><img
											src="../content/static/images/brand/shcatbbtsro.png" /></span>
									</p>
									<div class="shcattc">
										<div class="shcattcno">X</div>
										<div class="shcattcsro">
											<h3>Grft pock</h3>
											<p>This jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq
												nrmjkewq ghrewq yruiewqb rewq</p>
											<p>
												<img src="../content/static/images/brand/sctbldscims.png" />
											</p>

										</div>
									</div></li>
								<script type="text/javascript">
									$(document)
											.ready(
													function() {
														$(
																".shcatbbtsro span.right")
																.click(
																		function() {
																			$(
																					this)
																					.parent(
																							"p")
																					.siblings(
																							".shcattc")
																					.css(
																							"display",
																							"block");
																		});
														$(".shcattcno")
																.click(
																		function() {
																			$(
																					".shcattc")
																					.css(
																							"display",
																							"none");
																		});

													});
								</script>
								<li class="shcatbbtsrt"><p>
										<select name="">
											<option value="volvo">1</option>
											<option value="volvo">2</option>
										</select>
									</p></li>
								<li class="shcatbbtsrs"><p>£ 14</p></li>
								<li class="shcatbbtsrf"><p>£ 16</p></li>
							</ul>
							<ul>
								<li class="shcatbbtsro"><p>
										<label><span><input name="" type="checkbox"
												value="" /></span>"节日包装“自己手工”<br /> "送出您的礼物我们会为您准备节日包装“适合各种场合” </label><span
											class="right"><img
											src="../content/static/images/brand/shcatbbtsro.png" /></span>
									<div class="shcattc">
										<div class="shcattcno">X</div>
										<div class="shcattcsro">
											<h3>Grft pock</h3>
											<p>This jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq
												nrmjkewq ghrewq yruiewqb rewqThis jkfldsauy fdsaen fdsa fdsa
												fdsaewq eq rjieowq nrmjkewq ghrewq yruiewqb rewqThis
												jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq nrmjkewq
												ghrewq yruiewqb rewq</p>
											<ul>
												<li>This jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq
													nrmjkewq ghrewq yruiewqb rewq</li>
												<li>This jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq
													nrmjkewq ghrewq yruiewqb rewq</li>
												<li>This jkfldsauy fdsaen fdsa fdsa fdsaewq eq rjieowq
													nrmjkewq ghrewq yruiewqb rewq</li>
											</ul>
											<p>
												<img src="../content/static/images/brand/ds.png" />
											</p>

										</div>
									</div>

									</p></li>
								<li class="shcatbbtsrt"><p>
										<select name="">
											<option value="volvo">1</option>
											<option value="volvo">2</option>
										</select>
									</p></li>
								<li class="shcatbbtsrs"><p>EUR 140.00</p></li>
								<li class="shcatbbtsrf"><p>EUR 140.00</p></li>
							</ul>
						</div>
						<p class="shcatbbtsrbon">
							<span><a href="#">隐藏</a></span>
						</p>
					</div>
					<div class="cl"></div>
				</div>
			</div>
			<div class="shopcarbtns">
				<p>
					总支付<span class="gray"><b>
					<font style="font-size: 18px; color: green;"><fmt:formatNumber value="${sum }" type="currency" pattern="#,###.00#"/></font></b></span>
				</p>
				<p>
					<a href="./shopcardelv" class="scbtonc">继续订购>></a>
				</p>
			</div>
			<div class="shopcarlesimgs">
				<p class="scligb">
					<a href="#">推荐商品</a>
				</p>
				<ul>
					<li>
						<dl>
							<dt>
								<img src="../content/static/images/brand/shclig_01.png" />
							</dt>
							<dd>123456789s</dd>
							<dd>FORNASETTI</dd>
							<dd class="gray">EUR 160.00</dd>
							<dd class="scligdata">
								<a href="#">详细</a>
								<div class="shcabtca">
									<p class="sctbldscl">
										<img src="../content/static/images/brand/sctbldscim1.png">
									</p>
									<div class="sctbldscr">
										<p>连衣裙</p>
										<ul>
											<li><span>颜色:</span>照片中的颜色</li>
											<li><span>尺寸</span></li>
											<li class="sctbldscrlb"><span>参数</span></li>
										</ul>
										<p class="sctbldscp red">最后一件</p>
									</div>
								</div>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<img src="../content/static/images/brand/shclig_02.png" />
							</dt>
							<dd>123456789s</dd>
							<dd>FORNASETTI</dd>
							<dd class="gray">EUR 160.00</dd>
							<dd class="scligdata">
								<a href="#">详细</a>
								<div class="shcabtca">
									<p class="sctbldscl">
										<img src="../content/static/images/brand/sctbldscim1.png">
									</p>
									<div class="sctbldscr">
										<p>连衣裙</p>
										<ul>
											<li><span>颜色:</span>照片中的颜色</li>
											<li><span>尺寸</span></li>
											<li class="sctbldscrlb"><span>参数</span></li>
										</ul>
										<p class="sctbldscp red">最后一件</p>
									</div>
								</div>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<img src="../content/static/images/brand/shclig_03.png" />
							</dt>
							<dd>123456789s</dd>
							<dd>FORNASETTI</dd>
							<dd class="gray">EUR 160.00</dd>
							<dd class="scligdata">
								<a href="#">详细</a>
								<div class="shcabtca">
									<p class="sctbldscl">
										<img src="../content/static/images/brand/sctbldscim1.png">
									</p>
									<div class="sctbldscr">
										<p>连衣裙</p>
										<ul>
											<li><span>颜色:</span>照片中的颜色</li>
											<li><span>尺寸</span></li>
											<li class="sctbldscrlb"><span>参数</span></li>
										</ul>
										<p class="sctbldscp red">最后一件</p>
									</div>
								</div>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<img src="../content/static/images/brand/shclig_04.png" />
							</dt>
							<dd>123456789s</dd>
							<dd>FORNASETTI</dd>
							<dd class="gray">EUR 160.00</dd>
							<dd class="scligdata">
								<a href="#">详细</a>
								<div class="shcabtca">
									<p class="sctbldscl">
										<img src="../content/static/images/brand/sctbldscim1.png">
									</p>
									<div class="sctbldscr">
										<p>连衣裙</p>
										<ul>
											<li><span>颜色:</span>照片中的颜色</li>
											<li><span>尺寸</span></li>
											<li class="sctbldscrlb"><span>参数</span></li>
										</ul>
										<p class="sctbldscp red">最后一件</p>
									</div>
								</div>
							</dd>
						</dl>
					</li>
					<li>
						<dl>
							<dt>
								<img src="../content/static/images/brand/shclig_05.png" />
							</dt>
							<dd>123456789s</dd>
							<dd>FORNASETTI</dd>
							<dd class="gray">EUR 160.00</dd>
							<dd class="scligdata">
								<a href="#">详细</a>
								<div class="shcabtca">
									<p class="sctbldscl">
										<img src="../content/static/images/brand/sctbldscim1.png">
									</p>
									<div class="sctbldscr">
										<p>连衣裙</p>
										<ul>
											<li><span>颜色:</span>照片中的颜色</li>
											<li><span>尺寸</span></li>
											<li class="sctbldscrlb"><span>参数</span></li>
										</ul>
										<p class="sctbldscp red">最后一件</p>
									</div>
								</div>
							</dd>
						</dl>
					</li>
				</ul>
				<p class="gray">fd1a23f4d65ar7e8w9qf4d56sa12cxz</p>
				<p class="gray">fd1a23f4d65ar7e8w9qf4d56sa12cxzfd1a23f4d65ar7e8w9qf4d56sa12cxz</p>
			</div>
			<div class="cl"></div>
		</div>
		<jsp:include page="../common/foot.jsp"></jsp:include>
	</div>
</body>
</html>
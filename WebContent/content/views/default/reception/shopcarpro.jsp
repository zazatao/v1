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
<script type="text/javascript">
	function reloadData() {
		setTimeout(function() {
			window.location.reload();
		}, 1000);
	}

	function popupwindow(url) {
		var w = 1200;
		var h = 400;
		var title = "";
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		return window
				.open(
						url,
						title,
						'directories=0,titlebar=0,toolbar=0,location=0,status=0,menubar=0,scrollbars=no,resizable=no, width='
								+ w
								+ ', height='
								+ h
								+ ', top='
								+ top
								+ ', left=' + left);
	}
</script>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<div class="shopcar">
			<!-----基本信息-------->
			<div class="shopcartop">
				<ul>
					<li class="shcatock"><a href="shopcar"><img
							src="../content/static/images/brand/shcanumc_1.png" />购物车</a></li>
					<li><img src="../content/static/images/brand/shcatoplis.png" /></li>
					<li><a href="shopcardelv"><img
							src="../content/static/images/brand/shcanum_2.png" />交付</a></li>
					<li><img src="../content/static/images/brand/shcatoplis.png" /></li>
					<li><a href="#"><img
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
					<div class="shcabt">
						<p class="shcabril">
							<a>修改我的产品列表</a><span>展示我的商品</span>
						</p>
						<div class="shcabtl">
							<ul>
								<c:set var="sum" value="0"></c:set>
								<c:forEach items="${list }" var="shopCar">
								<c:set value="${fn:split(shopCar.specs,',')}" var="spec"></c:set>
								<li>
									<dl>
										<dt>
											<c:forEach items="${spec }" var="sp">
												<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
													<img src="..${fn:substring(sp, fn:indexOf(sp, '$')+1, fn:length(sp)) }" />
												</c:if>
											</c:forEach>
										</dt>
										<dd>${shopCar.shopCommoidty.commoidtyName }</dd>
										<dd class="shcabtlbtn">
											<a href="#">详细 </a>
											<div class="shcabtca">
												<p class="sctbldscl">
													<c:forEach items="${spec }" var="sp">
														<c:if test="${fn:substring(sp,0,fn:indexOf(sp, '-')) == '颜色'}">
															<img src="..${fn:substring(sp, fn:indexOf(sp, '$')+1, fn:length(sp)) }" />
														</c:if>
													</c:forEach>
												</p>
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
														<li class="sctbldscrlb"><span>原价</span><fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice }" type="currency" pattern="#,###.00#"/></li>
														<li class="sctbldscrlb"><span>现价</span><fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special}" type="currency" pattern="#,###.00#"/> </li>
														<li class="sctbldscrlb"><span>购买数量</span>${shopCar.buyAmount }</li>
													</ul>
												</div>
											</div>
										</dd>
										<dd>
										<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount }" type="currency" pattern="#,###.00#"/>
										</dd>
										<c:set var="sum" value="${sum + shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount}"></c:set>
									</dl>
								</li>
								</c:forEach>
							</ul>
						</div>
						<div class="shcabr">
							<ul>
								<li>在我购物车里的商品</li>
								<li>订单总额 <span><fmt:formatNumber value="${sum }" type="currency" pattern="#,###.00#"/></span></li>
								<li>额外包装</li>
								<li>礼品包装“自己手工”<span></span></li>
								<li>运输方式</li>
                    	  		<li>${deliveryComm }<span><fmt:formatNumber value="${deliveryMoney }" type="currency" pattern="#,###.00#"/></span></li>
							</ul>
							<p class="shcabra">
								总金额<span><fmt:formatNumber value="${sum +deliveryMoney }" type="currency" pattern="#,###.00#"/></span>
							</p>

						</div>
						<p class="shcabrb">
							<a href="#">隐藏商品</a>
						</p>
						 <div class="shcabrbsk">
                    	<p class="shcabrbsko"><font style="font-size: 14px;">订单将被送往指定地址:</font> </p>
                    	<p class="shcaadds" id="addressShow">
						<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.country}&nbsp;${address.provience}&nbsp;${address.city}&nbsp;</font><br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.street}&nbsp;${address.orther}&nbsp;</font><br><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>转交地址：&nbsp;&nbsp;${address.handedAddress}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;${address.toEmail}</font><br><br>
							
						</p>
                    	<p class="shcabrbsks" onclick="popupwindow('../user/toNewAddress');"><font color="blue">更改</font></p>
                    	<p class="shcabrbskf"><input name="" type="text" value="有没有优惠券？输入代码"  onfocus="this.value=''" onblur="if(this.value==''){this.value='有没有优惠券？输入代码';}"/> <a href="#">ok</a></p>
                        <div class="cl"></div>
                    </div>
					</div>
				</div>
            	<div class="shcabrblse">
                	<ul>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	  <li>fdsauief32</li>
                	</ul>
                </div>
            	<div class="shcabrbbank">
                	<div class="shcabrbk">
                	  <div class="shcabrbklo"><img src="../content/static/images/brand/srbbank_01.png"/></div>
                	  <div class="shcabrbkse"><label><input name="back" type="radio" value="" />fdvcxzuiotr230,revnmcxz890r23vdaf</label></div>
                	  <div class="shcabrbkbc">
                      	<p class="shcabrbkbct">yubncvz uyewiq ndska ure njkdsa hfuyiq bfjdsa ruiowe nbk huwif qhfew hr hu32r rh4 hu3 h43 r4 43 h734 t439 hfue918 fbhuqo fgby8eoq fh38y1 fhy832</p>
                      	<p class="shcabrbkbcb"><a href="#">оплатить</a></p>
                      </div>
                	</div>
                	<div class="shcabrbk">
                	  <div class="shcabrbklo"><img src="../content/static/images/brand/srbbank_02.png"/></div>
                	  <div class="shcabrbkse"><label><input name="back" type="radio" value="" />fdvcxzuiotr230,revnmcxz890r23vdaf</label></div>
                	  <div class="shcabrbkbc">
                      	<p class="shcabrbkbct">yubncvz uyewiq ndska ure njkdsa hfuyiq bfjdsa ruiowe nbk huwif qhfew hr hu32r rh4 hu3 h43 r4 43 h734 t439 hfue918 fbhuqo fgby8eoq fh38y1 fhy832</p>
                      	<p class="shcabrbkbcb"><a href="#">оплатить</a></p>
                      </div>
                	</div>
                	<div class="shcabrbk">
                	  <div class="shcabrbklo"><img src="../content/static/images/brand/srbbank_03.png"/></div>
                	  <div class="shcabrbkse"><label><input name="back" type="radio" value="" />fdvcxzuiotr230,revnmcxz890r23vdaf</label></div>
                	  <div class="shcabrbkbc">
                      	<p class="shcabrbkbct">yubncvz uyewiq ndska ure njkdsa hfuyiq bfjdsa ruiowe nbk huwif qhfew hr hu32r rh4 hu3 h43 r4 43 h734 t439 hfue918 fbhuqo fgby8eoq fh38y1 fhy832</p>
                      	<p class="shcabrbkbcb"><a href="#">оплатить</a></p>
                      </div>
                	</div>
                    <div class="shcabrlinksd"></div>
                </div>
                <div class="cl"></div>
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
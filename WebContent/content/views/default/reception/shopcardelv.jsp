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
					<li><a href="#" onclick="focusTT();"><img
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
														<li class="sctbldscrlb"><span>现价</span>
														<c:if test="${shopCar.shopCommoidty.isSpecial }">
															<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special}" type="currency" pattern="#,###.00#"/> 
														</c:if>
														<c:if test="${!shopCar.shopCommoidty.isSpecial }">
															<fmt:formatNumber value="${shopCar.shopCommoidty.unitPrice }" type="currency" pattern="#,###.00#"/> 
														</c:if>
														</li>
														<li class="sctbldscrlb"><span>购买数量</span>${shopCar.buyAmount }</li>
													</ul>
													<p class="sctbldscp red">库存数量：<c:out value="${shopCar.shopCommoidty.proportion * shopCar.shopCommoidty.stock} "></c:out></p>
												</div>
											</div>
										</dd>
										<dd>
										<c:if test="${shopCar.shopCommoidty.isSpecial }">
											<fmt:formatNumber value="${shopCar.shopCommoidty.currency.symbol }${shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount }" type="currency" pattern="#,###.00#"/>
										</c:if>
										<c:if test="${!shopCar.shopCommoidty.isSpecial }">
											<fmt:formatNumber value="${shopCar.shopCommoidty.currency.symbol }${shopCar.shopCommoidty.unitPrice * shopCar.buyAmount }" type="currency" pattern="#,###.00#"/>
										</c:if>
										</dd>
										<c:if test="${shopCar.shopCommoidty.isSpecial }">
											<c:set var="sum" value="${shopCar.shopCommoidty.currency.symbol }${sum + shopCar.shopCommoidty.unitPrice * shopCar.shopCommoidty.special * shopCar.buyAmount}"></c:set>
										</c:if>
										<c:if test="${!shopCar.shopCommoidty.isSpecial }">
											<c:set var="sum" value="${shopCar.shopCommoidty.currency.symbol }${sum + shopCar.shopCommoidty.unitPrice * shopCar.buyAmount}"></c:set>
										</c:if>
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
							</ul>
							<p class="shcabra">
								总金额<span><fmt:formatNumber value="${sum }" type="currency" pattern="#,###.00#"/></span>
							</p>

						</div>
						<p class="shcabrb">
							<a href="#">隐藏商品</a>
						</p>
					</div>

					<h3 class="shopcarles">
						<img src="../content/static/images/brand/shcanumc_2.png" width="18" height="18" />输入送货地址
					</h3>
				</div>
				<div class="shopcartabt2">
					<div class="shcaadd">
						<p class="shcaadds">
							<select name="" id="addressChange">
								<option value="-1" selected="selected">-----选择收件人----</option>
								<c:forEach items="${addresses }" var="address">
									<option value="${address.id }" <c:if test="${address.theDefault == true }">selected</c:if>>${address.toName }</option>
								</c:forEach>
							</select> 
							<a href="#" onclick="popupwindow('../user/toNewAddress');"><font color="blue">使用新地址</font></a>
						</p>
						<p class="shcaadds" id="addressShow">
						</p>
						<div class="cl"></div>
						<div class="shcaaddselink"></div>
					</div>
				</div>
				<script type="text/javascript">
					$(document).ready(function(){
						var code = $("#addressChange").find("option:selected").val();
						$option = "";
						<c:forEach items="${addresses }" var="address">
							if('${address.id}' == code){
								$option = $option +"&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.country}&nbsp;${address.provience}&nbsp;${address.city}&nbsp;</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.street}&nbsp;${address.orther}&nbsp;</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
							}
						</c:forEach>
						$('#addressShow').append($option);
					});
					$("#addressChange").change(function(){
						  var code = $(this).val();
						  $('#addressShow').html("");
							$option = "";
							<c:forEach items="${addresses }" var="address">
							if('${address.id}' == code){
								$option = $option +"&nbsp;<br>&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px; color: blue;'>${address.toName}&nbsp;&nbsp;</font><font style='font-size: 18px;'>(收)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话：&nbsp;&nbsp;${address.phone }</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.country}&nbsp;${address.provience}&nbsp;${address.city}&nbsp;</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>${address.district}&nbsp;${address.street}&nbsp;${address.orther}&nbsp;</font><br><br>";
								$option = $option +"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style='font-size: 18px;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:&nbsp;&nbsp;${address.toEmail}</font><br><br>";
							}
						</c:forEach>
							$('#addressShow').append($option);
					});
				</script>
				<div class="shopcartabtb">
					<h3 class="shopcarles">
						<img src="../content/static/images/brand/shcanumc_3.png" width="18" height="18" />选择送货方式
						<span>价格</span>
					</h3>
					<div class="shopcartabca">
						<img src="../content/static/images/brand/shopcartabca.jpg" width="220" height="221" />
					</div>
					<div class="shopcartabt3">
						<div class="shcacho">
							<ul>
								<li>
									<p class="shcachos">
										<span><label><input name="deliveryComm" type="radio"
												value="EMS" checked="checked"/>邮政 <b>EMS</b></label></span><span class="shcachostim">周期：2-3周</span>
									</p>
									<p class="shcachom">
										<span></span><span>EUR230.00</span>
										<input type="hidden" name="deliveryMoney" id="deliveryMoney" value="230.00">
										
									</p>
								</li>
							</ul>
						</div>
					</div>
<!-- 					<p class="shcachomcr"> -->
<!-- 						<span><b>保险</b></span> <span class="shcachomcrock">为什么需要保险？ -->
<!-- 						</span> <span><label><input name="" type="checkbox" -->
<!-- 								value="" /><b>保证我的订单</b></label></span> <span class="shcachomany">£ -->
<!-- 							230.00</span> -->
<!-- 					</p> -->
					<div class="shcks">
						<div class="shcrocbg"></div>
						<div class="shcrockal">
							<div class="shcrockno">X</div>
							<div class="shcrockre"></div>
						</div>
					</div>
					<div class="cl"></div>
				</div>
			</div>
			<div class="shopcarbtns">
				<p>
					总金额 <span class="gray"><b><font style="color: red;font-size: 20px;"><fmt:formatNumber value="${sum+230 }" type="currency" pattern="#,###.00#"/></font></b></span>
				</p>
				<p>
					<a href="#" onclick="focusTT();" class="scbtonc">继续购物>></a>
				</p>
			</div>
			<script type="text/javascript">
				function focusTT(){
					var addID = $("#addressChange").find("option:selected").val();
					var deliveryComm = $("input[name='deliveryComm'][checked]").val();
					var deliveryMoney = $("#deliveryMoney").val();
					location.href ="../proscenium/shopcarpro?addID="+addID+"&deliveryComm="+deliveryComm+"&deliveryMoney="+deliveryMoney;
				}
			</script>
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
		</div>
		<jsp:include page="../common/foot.jsp"></jsp:include>
	</div>
</body>
</html>

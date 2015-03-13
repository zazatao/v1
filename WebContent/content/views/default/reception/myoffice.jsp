<%@page import="com.yc.entity.user.Personnel"%>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
		<jsp:include page="userTop.jsp"></jsp:include>

		<!---------------   详细   ------------->
		<div class="orders">
			<div class="ordersle">
				<div class="ord_bas">
					<p class="ord_basye">
						Free Member<sup>st</sup> year
					</p>
					<dl>
						<dt>
							<img src="../content/static/images/kx.jpg" />
						</dt>
						<dd>
							<b>Пополнить счет счет</b><img
								src="../content/static/images/user.jpg" />
						</dd>
					</dl>
					<div class="cl"></div>
					<div class="ordjd">
						<div class="ordjs"></div>
						<p class="ordjts">33%</p>
					</div>
					<p class="udli">
						<a href="perscent_set.html">设置简介</a>
					</p>
					<p>您的资料已经填满100%</p>
				</div>
				<div>
					<ul>
						<li><a href="file_index.html">关于服务</a></li>
						<li><a href="file_index.html">关于我们</a></li>
						<li><a href="#">Рекомендации просмотреть</a></li>
						<li><a href="file02.html">尺寸表</a></li>
						<li><a href="file.html">订单流程</a></li>
						<li><a href="file14.html">退款</a></li>
						<li><a href="file14.html">安全策略</a></li>
						<li><a href="file06.html">运输方式</a></li>
						<li><a href="file14.html">保证</a></li>
					</ul>
				</div>
				<div class="orderyjs">
					<div class="orderim">
						<span class="grean">Anne is online</span> <br />24 Hour Smart
						Response
					</div>
					<div>
						<textarea name="" cols="" rows="" value="Ask questions"></textarea>
					</div>
					<div class="orderbtck">
						<a href="#"><b>NOMBER</b></a>
					</div>
				</div>
				<div>
					<p>Товары которые вы смотрели</p>
					<form id="form1" name="form1" method="post" action="">
						<p>
							<label><input type="radio" name="RadioGroup1"
								value="Скорость" id="RadioGroup1_0" />Скорость</label>
						</p>
						<p>
							<label><input type="radio" name="RadioGroup1"
								value="Сервис" id="RadioGroup1_1" />Сервис</label>
						</p>
						<p>
							<label><input type="radio" name="RadioGroup1"
								value="Условия оплаты" id="RadioGroup1_2" />Условия оплаты</label>
						</p>
					</form>
					<p>
						<textarea name="" cols="" rows=""
							value="Напишите ваше тут комментарии"></textarea>
					</p>
					<p class="orderseonck">
						<a href="#">Отправить</a>
					</p>
				</div>
			</div>
			<div class="ordersre">
				<div class="orderssup">
					<h3>The Fastest Way to Find the Right Suppliers</h3>
					<div class="odrstex">
						<p class="odrsuer">
							<span class="grean">12028</span> suppliers can give you
							quotations,
						</p>
						<p class="odrstim">
							you'll get them in avg.<span class="grean">2 Minutis</span>
						</p>
					</div>
					<div class="odrsput">
						<p>Искать продукты：</p>
						<p>
							<input name="" type="text" value="Сюда видите то что вы ищите." />
						</p>
					</div>
					<p class="cl"></p>
				</div>
				<div class="orderlest">
					<h3>To Do List</h3>
					<div class="orderls">
						<div class="orderlsfal">
							<h3>Транзакции</h3>
							<p>
								Текущие<span><a href="#">0</a></span>
							</p>
							<p>
								Завершенные<span><a href="#">0</a></span>
							</p>
							<p>
								Невыкупленные<span><a href="#">0</a></span>
							</p>
							<p>
								В обработке<span><a href="#">0</a></span>
							</p>
							<p>
								Ожидающие оценки<span><a href="#">0</a></span>
							</p>
						</div>
						<div>
							<h3>Запросы по товарам</h3>
							<p>
								Есть ответ<span><a href="#">0</a></span>
							</p>
							<p>
								Предложение платформы<span><a href="#">0</a></span>
							</p>
							<p>
								Комментарии к товарам<span><a href="#">0</a></span>
							</p>
						</div>
						<div>
							<h3>Центр оповещение</h3>
							<p>
								Есть новые ответы<span><a href="#">0</a></span>
							</p>
							<p>
								Мои диалоги<span><a href="#">0</a></span>
							</p>
							<p>
								Покупки<span><a href="#">0</a></span>
							</p>
							<p>
								Остальные<span><a href="#">0</a></span>
							</p>
						</div>
						<p class="cl"></p>
					</div>
				</div>
				<div class="ordertab">
					<h3>
						Товары которые вы смотрели <span>Looking to better
							recommendations?<a href="#">Tell us what you like</a>
						</span>
					</h3>
					<div class="ordertpag">
						<p class="ordertpagt">
							Page <span>3</span> of <span>3</span>
						</p>
						<div class="odtpagls">
							<div class="odtpaglsl"></div>
							<div class="odtpaglsa">
								<div class="odtplas">
									<ul>
										<li>
											<p>
												<img src="../content/static/images/img/odtplas01.jpg" />
											</p>
											<p class="odtplasti blon">pession ieos moserfd</p>
											<p class="odtplasta">
												<b>FOB Price:</b><b class="red">US $130-180</b>
											</p>
											<p class="odtplastp">
												<b>Port:</b>shanghai
											</p>
											<p class="odtplasnu">
												<b>Min Order:</b>1 Set/Sers
											</p>
										</li>
										<li>
											<p>
												<img src="../content/static/images/img/odtplas01.jpg" />
											</p>
											<p class="odtplasti blon">pession ieos moserfd</p>
											<p class="odtplasta">
												<b>FOB Price:</b><b class="red">US $130-180</b>
											</p>
											<p class="odtplastp">
												<b>Port:</b>shanghai
											</p>
											<p class="odtplasnu">
												<b>Min Order:</b>1 Set/Sers
											</p>
										</li>
										<li>
											<p>
												<img src="../content/static/images/img/odtplas01.jpg" />
											</p>
											<p class="odtplasti blon">pession ieos moserfd</p>
											<p class="odtplasta">
												<b>FOB Price:</b><b class="red">US $130-180</b>
											</p>
											<p class="odtplastp">
												<b>Port:</b>shanghai
											</p>
											<p class="odtplasnu">
												<b>Min Order:</b>1 Set/Sers
											</p>
										</li>
										<li>
											<p>
												<img src="../content/static/images/img/odtplas01.jpg" />
											</p>
											<p class="odtplasti blon">pession ieos moserfd</p>
											<p class="odtplasta">
												<b>FOB Price:</b><b class="red">US $130-180</b>
											</p>
											<p class="odtplastp">
												<b>Port:</b>shanghai
											</p>
											<p class="odtplasnu">
												<b>Min Order:</b>1 Set/Sers
											</p>
										</li>
									</ul>
								</div>
							</div>
							<div class="odtpaglsr"></div>
						</div>
					</div>
					<div class="cl"></div>
				</div>
				<div>
					<img src="../content/static/images/ordresd.jpg" />
				</div>
			</div>
			<div class="cl"></div>
		</div>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

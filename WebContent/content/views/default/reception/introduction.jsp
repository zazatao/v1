﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.yc.entity.user.User"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>zazatao</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../content/static/js/reception/png.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/sdmenu.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/reception/js.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript">

	 function address()
	 {
		 $("#addresses").css("display","none");	//原有
		 $("#address").css("display","block");	//新增
	 }
	 
	 function add()
	 {
		 var num = 0;
		 if ($('#theDefault').attr('checked')) {
			    num = 1;
			}else{
				num = 0;
			}
		 document.form.action="./Address?num="+num;
		 document.form.submit();
	 }
	 
	 function check(num){
		 if(num == null){
			 alert("参数有误,请重新载入此页面");
			 window.location.href = 'index';
		 }
		 if(num == 1){
			 $('#theDefault1').attr('checked','checked');
		 }
	 }
	 
	 function editpwd()
	 {
		 document.form.action="./editUserpwd?id=${user.id}";
		 document.form.submit();
	 }
	 function deleteaddress(num)
	 {
		 alert(num);
		 document.form.action='./deleteaddress?id='+num;
		 document.form.submit();
	 }
 	 function editaddress(num)
 	 {
 		 $("#addresses").css("display","none");	
		 $("#address").css("display","none");	
		 $("#upaddress").css("display","block");
// 		 document.form.action = 'editaddress?id=0&num'+num;
// 		 document.form.submit();
 	 }
	 
 	 function edit(num)
 	 {
 		var num1 = 0;
		 if ($('#theDefault1').attr('checked')) {
			    num1 = 1;
			}else{
				num1 = 0;
			}
 		document.form.action='./editaddress?id='+num+"&num="+num1;
 		document.form.submit();
 	 }
 	 $('#textfield9').datetimepicker({
			lang:'ch',
			timepicker:false,
			format:'Y-m-d',
			formatDate:'Y-m-d',
	});
</script>
</head>

<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">
	<jsp:include page="userTop.jsp"></jsp:include>

		<form action="./editUser?id=${user.id}" id="form" name="form"
			method="post">
			<!---------------   详细   ------------->
			<div class="sets">

				<div class="settil">
					<h3>账户</h3>
					<ul>
						<li class="setonc">个人资料</li>
						<li>地址簿</li>
						<li>更改密码</li>
						<li>公告</li>
						<li>网站设置</li>
						<li>邀请你的朋友和我们一起赚钱</li>
					</ul>
				</div>
				<div class="setcan">
					<h3>我的信息</h3>
					<p>更新您的个人信息和发照片到您的个人资料</p>
					<div>

						<div class="seacale">
							<p class="seacaleimg">
								<img src="../content/static/images/users.jpg" />
							</p>
							<p>
								<a href="#">上传照片</a>
							</p>
						</div>

						<div class="seacare seacarefa">
							<ul>
								<li>
									<p class="seacaretil">姓名:</p>
									<p>${user.userName}</p>
								</li>
								<li>
									<p class="seacaretil">邮件:</p>
									<p>${user.email}</p>
								</li>
								<li>
									<p class="seacaretil">性别:</p>
									<p>
									<c:choose>
										<c:when test="${user.sex == 'Female'}">女</c:when>
										<c:when test="${user.sex == 'Male'}">男</c:when>
									</c:choose>
									</p>
								</li>
								<li>
									<p class="seacaretil">生日:</p>
									<p>${user.birthday}</p>
								</li>
								<li>
									<p class="seacaretil">默认地址:</p>
									<p></p>
								</li>
								<li>
									<p class="seacaretil">电话</p>
									<p>${user.phone}</p>
								</li>
							</ul>
							<p class="secaclk">
								<label><span><input name="" type="checkbox"
										value="" /></span>我想订阅电子报刊ZAZATAO,COM及时获取促销活动信息 </label>
							</p>
							<p class="secaclk">您的个人数据将被用来改进ZAZATAO.COM，加快结算订单，以及给您带来部分限制使用的机会，提供您的信息给ZAZATAO会提高整体服务水平，ZAZATAO一定会保护您的数据</p>
						</div>

						<div class="seacare seacareno">
							<ul>
								<li>
									<p class="seacaretil">姓名:</p>
									<p>
										<input name="userName" id="userName" value="${user.userName}" type="text"/>
									</p>
								</li>
								<li>
									<p class="seacaretil">邮件:</p>
									<p>
										<input name="email" id="email" value="${user.email}" type="text" />
									</p>
								</li>
								<li>
									<p class="seacaretil">性别:</p>
										<select name="sex" id="sex" type="text" style="width:50px">
											<option value="Female" name="Female">女</option>
											<option value="Male" name="Male">男</option>
										</select>
								</li>
								<li>
									<p class="seacaretil">生日:</p>
									<p>
										<input name="birthday"  id="textfield9" value="${user.birthday}" type="text" />
									</p>
								</li>
								<li>
									<p class="seacaretil">默认地址:</p>
									<p>
										<input name="addresses" id="textfield9" value="" type="text" />
									</p>
								</li>
								<li>
									<p class="seacaretil">电话</p>
									<p>
										<input name="phone" id="phone" value="${user.phone}"
											type="text" />
									</p>
								</li>
							</ul>
							<p class="secaclk">
								<label><span><input name="" type="checkbox"
										value="" /></span>我想订阅电子报刊ZAZATAO,COM及时获取促销活动信息 </label>
							</p>
							<p class="secaclk">您的个人数据将被用来改进ZAZATAO.COM，加快结算订单，以及给您带来部分限制使用的机会，提供您的信息给ZAZATAO会提高整体服务水平，ZAZATAO一定会保护您的数据</p>
						</div>
					</div>
					<div class="cl"></div>
					<p class="setcanbon setcanbonfs">
						<a href="#" onclick="submit();">更改</a>
					</p>
				<script type="text/javascript">
		            var isok = false;
		            	$(function(){
							$(".setcanbonfs a").toggle(function(){
									$(".seacarefa").hide();
									$(".seacareno").show();
									$(this).text("确认");
									isok = true;
								},function(){
									$(".seacareno").hide();
									$(".seacarefa").show();
									$(this).text("更改");
									isok = false;
								})
							$(".setaddonlest .sels5 a").click(function(){
									$(".setaddallstw").hide();
									$(".setaddonlest").show();
							$(".setaddonlest .setcanbon a").click(function(){
									$(".setaddonlest").hide();
									$(".setaddallstw").show();
								});
							$(".setcanbontw a").click(function(){
									$(".setaddonlest").show();
									$(".setaddalls").hide();
								});
							});
						});
							
						function submit(){
							if(isok){
								form.submit();	
							}
						}
           		</script>
        </div>
        <div class="setcan" id="t2">
        	<div class="setaddonlest">
                <h3>通讯录<span>保存地址</span></h3>
                <p class="setaddl">保存收货地址，使得采购更加快捷方便，“快速购买”也是在“我的账户”结算信息保存到下单，只需点击一次。填写资料时候，只能使用字母</p>
                <div id="addresses">
                 	<div class="setlest">
                        <div>
                            <p class="sels1">名字</p>
                            <p class="sels2">地址</p>
                            <p class="sels6">默认送货地址</p>
                            <p class="sels7"></p>
                        </div>
                        <ul>
                        <c:forEach var="address" items="${user.addresses}" varStatus="vs">
                          <li>
                            <p class="sels1">${address.toName}</p>
                            <p class="sels2">${address.country}${address.provience}${address.city}${address.street}</p>
                            <p class="sels3">★</p>
                            <p class="sels4"><a href="#" onclick="deleteaddress(${address.id});">删除</a></p>
                            <p class="sels5"><a href="#" onclick="editaddress(${address.id});">更改</a></p>
                          </li>
                         </c:forEach>
                        </ul>
                	</div>
                </div>
                <div class="cl"></div>
                <p class="setcanbon"><a href="#" onclick="address();">添加新地址</a></p>
             </div>
             <c:forEach var="address" items="${user.addresses}" varStatus="vs">
        	<div class="setaddalls setaddallsfs" id="upaddress">
                <h3>通讯录</h3>
                <p class="setaddl">保存收货地址，使得采购更加快捷方便，“快速购买”也是在“我的账户”结算信息保存到下单，只需点击一次。填写资料时候，只能使用字母</p>
                <p class="setaddls">详细运输资料</p>
                <p class="setalip"><span>姓名* </span><span>电话*</span></p>
                <p class="setalip"><span><input name="toNamea" type="text" value="${address.toName}"/></span><span><input name="phonea" type="text" value="${address.phone}"/></span></p>
                <p class="setalip"><span>邮箱:</span><span>国家 *</span></p>
                <p class="setalip"><span><input name="toEmaila" type="text" value="${address.toEmail}"/></span><span><input name="countrya" type="text" value="${address.country}"/></span></p>
                <p class="setaddlinks"></p>
                <p class="setalip"><span>省 *</span><span>城市 *</span></p>
                <p class="setalip"><span><input name="proviencea" type="text" value="${address.provience}"/></span><span><input name="citya" type="text" value="${address.city}"/></span></p>
                <p class="setalip"><span>地区 *</span><span>地址*</span></p>
                <p class="setalip"><span><input name="districta" type="text" value="${address.district}"/></span><span><input name="streeta" type="text" value="${address.street}"/></span></p>
                <p class="setalip"><span>转交地址</span><span>指数*</span></p>
                <p class="setalip"><span><input name="handedAddressa" type="text" value="${address.handedAddress}"/></span><span><input name="indexNuma" type="text" value="${address.indexNum}"/></span></p>
                <p class="setaddlinks"></p>
                <p class="setalckl"><label><span><input name="theDefault" id="theDefault1" type="checkbox" value=""  onchange="check(${address.theDefault})"/></span>默认送货地址</label></p>
                <p class="setalckl"><label><span><input name="" type="checkbox" value="" /></span>默认情况下，按以前的地址</label></p>
                <p class="setalckl">您输入的个人信息将用于ZAZATAO结算，ZAZATAO会保证您数据的安全性。详情请参阅我们的隐私保障</p>
                <div class="cl"></div>
                <p class="setcanbon setcanbontw"><a href="#" onclick="edit(${address.id});">确认</a></p>
             </div>
             </c:forEach>
        	<div class="setaddalls setaddallstw" id="address">
                <h3>通讯录</h3>
                <p class="setaddl">保存收货地址，使得采购更加快捷方便，“快速购买”也是在“我的账户”结算信息保存到下单，只需点击一次。填写资料时候，只能使用字母</p>
                <p class="setaddls">详细运输资料</p>
                <p class="setalip"><span>姓名* </span><span>电话*</span></p>
                <p class="setalip"><span><input name="toName" type="text" /></span><span><input name="phone" type="text" /></span></p>
                <p class="setalip"><span>邮箱:</span><span>国家 *</span></p>
                <p class="setalip"><span><input name="toEmail" type="text" /></span><span><input name="country" type="text" /></span></p>
                <p class="setaddlinks"></p>
                <p class="setalip"><span>省 *</span><span>城市 *</span></p>
                <p class="setalip"><span><input name="provience" type="text" /></span><span><input name="city" type="text" /></span></p>
                <p class="setalip"><span>地区 *</span><span>地址*</span></p>
                <p class="setalip"><span><input name="district" type="text" /></span><span><input name="street" type="text" /></span></p>
                <p class="setalip"><span>转交地址</span><span>指数*</span></p>
                <p class="setalip"><span><input name="handedAddress" type="text" /></span><span><input name="indexNum" type="text" /></span></p>
                <p class="setaddlinks"></p>
                <p class="setalckl"><label><span><input name="theDefault" type="checkbox" value=""  id="theDefault"/></span>默认送货地址</label></p>
                <p class="setalckl"><label><span><input name="" type="checkbox" value="" /></span>默认情况下，按以前的地址</label></p>
                <p class="setalckl">您输入的个人信息将用于ZAZATAO结算，ZAZATAO会保证您数据的安全性。详情请参阅我们的隐私保障</p>
                <div class="cl"></div>
                <p class="setcanbon setcanbontw"><a href="#" onclick="add();">确认</a></p>
             </div>
        </div>
	        <div class="setcan">
	        	<div class="setcposs">
	                <table width="100%" border="0" cellspacing="0" cellpadding="0">
	                  <tr>
	                    <th scope="row">旧密码</th>
	                    <td><input name="password1" id="password1" type="text"/></td>
	                  </tr>
	                  <tr>
	                    <th scope="row">新密码</th>
	                    <td><input name="password" id="password" type="text" /></td>
	                  </tr>
	                  <tr>
	                    <th scope="row">确认密码</th>
	                    <td><input name="password" id="password" type="text" /></td>
	                  </tr>
	                  <tr>
	                    <th scope="row">&nbsp;</th>
	                    <td><a href="#" onclick="editpwd();">更改密码</a>
	                    </td>
	                  </tr>
	                </table>
	                <div class="cl"></div>
	             </div>
	        </div>
        <div class="setcan">
        	<div class="setcposs">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th scope="row">邮箱</th>
                    <td><input name="" type="text" /></td>
                  </tr>
                  <tr>
                    <th scope="row">电话</th>
                    <td><input name="" type="text" /></td>
                  </tr>
                  <tr>
                    <th scope="row">程序</th>
                    <td><input name="" type="text" /></td>
                  </tr>
                </table>
                <div class="day">
                	<h1>星期</h1>
                    <ul>
                    	<li>
                        	<span class="d1">周一</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周二</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周三</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周四</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周五</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周六</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1">周末</span><span class="d3"><input type="checkbox" /></span>
                        </li>
                    </ul>
                </div>
                
                
                <div class="day">
                	<h1>每天订阅号分类</h1>
                    <ul>
                    	<li>
                        	<span class="d1 d4">周一<br />电子及电器</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周二<br />只针对家用</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周三<br />孩子用品</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周四<br />衣服</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周五<br />旅游</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周六<br />美容</span><span class="d2"><input type="checkbox" /></span>
                        </li>
                        <li>
                        	<span class="d1 d4">周末<br />美容</span><span class="d3"><input type="checkbox" /></span>
                        </li>
                    </ul>
                </div>
                
               <div class="day day_2">
                <h1>每天订阅</h1>
                	<ul>
                    	<li style="padding-left:560px;">邮箱</li>
                        <li>所有折扣<span><input type="checkbox" /></span></li>
                        <li>服务<span><input type="checkbox" /></span></li>
                        <li>商品<span><input type="checkbox" /></span></li>
                        <li>旅游<span><input type="checkbox" /></span></li>
                        <li>推荐折扣<span><input type="checkbox" /></span></li>
                    </ul>
                </div>
                
                <div class="day day_2">
                <h1>ЕЖЕДНЕВНЫЕ РАССЫЛКИ</h1>
                	<ul>
                    	<li style="padding-left:490px;">CMC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;E-mail</li>
                        <li>Все акции<span><input type="checkbox" /></span><span><input type="checkbox" /></span></li>
                        <li>Услуги<span><input type="checkbox" /></span><span></span></li>
                        <li>Товары<span><input type="checkbox" /></span><span><input type="checkbox" /></span></li>
                    </ul>
                </div>
                <div class="day_bottom">
                	<h1>通知</h1>
                    <p>如果您希望收到短信或是电子邮件的形式，请在个人资料处填写您的电话号码邮箱地址</p>
               		<div class="d_right">SMS&nbsp;&nbsp;&nbsp;&nbsp;элektpoнная почтa</div>
                    <ul>
                    	<li>特别优惠<span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                        <li>结束命令<span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                        <li>关于仓库到货 <span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                        <li>关于交付货物<span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                        <li>货物状态<span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                        <li>反馈意见<span><input type="checkbox"/><input type="checkbox" checked="checked" /></span></li>
                    </ul>
                </div>
                
                <div class="cl"></div>
             </div>
        </div>
        
        
        <div class="setcan">
        	<div class="setcposs">
                <p>查看产品目录</p>
                <div>
                	<p>新品</p>
                </div>
                <p>排序方式 
                    <select name="">
                        <option value="volvo">------------</option>
                        <option value="saab">价格从低到高排列</option>
                        <option value="audi">价格最高</option>
                        <option value="auda">品名 </option>
                        <option value="fiat" selected="selected">新品</option>
                        <option value="auds">购物评价</option>
                        <option value="volvo">热门程度排列</option>
                    </select>
                </p>
                <p class="setaddlinks"></p>
                <p>Вид каталогаВид каталога</p>
                <p>Вид каталогаВид каталогаВид каталогаВид каталогаВид каталога</p>
                <div class="cl"></div>
                <p><a href="#">保存</a></p>
             </div>
        </div>
        
        
        <div class="setcan setcan_2">
        	<script>
            	$(document).ready(function(){ 
						$(".emalonc img").click(function(){
								$(".tcall").show();
								$(".emaladd").text($(this).attr("eml"))
							});
						$(".tcnoe").click(function(){
								$(".tcall").hide();
							});
						$(".tcbg").click(function(){
								$(".tcall").hide();
							});
					})
            </script>
					<div class="tcall">
						<div class="tcbg"></div>
						<div class="tc">
							<h1>
								3arpy3ak 3arpy3ak<span class="tcnoe">x</span>
							</h1>
							<p>
								aaaa<br />
								<input type="text" />@<span class="emaladd">gmail.com</span>
							</p>
							<p>
								aaaa<br />
								<input type="text" />
							</p>
							<p>
								<a>3arpy3ak</a>
							</p>
						</div>
					</div>
					<div class="set_left">
						<h1>
							<img src="../content/static/images/brand/xf.jpg" />通过电子邮件邀请
						</h1>
						<p>邀请朋友以自己的名义给他们发邮件，还可以在“收件人”以ZAZATAO邮件的名义发送您的信息，在发送多邮件地址的时候，以逗号隔开便可
						</p>
						<ul>
							<li><span>来自谁:</span><input type="text" value="Maikl Maikl" /></li>
							<li><span>给谁:</span>
							<textarea></textarea>
								<div class="emalonc">
									发送邀请 <img src="../content/static/images/brand/an_1.jpg"
										eml="gmail.com" /> <img
										src="../content/static/images/brand/an_2.jpg" eml="rhekc.com" />
									<img src="../content/static/images/brand/an_3.jpg"
										eml="mall.ru" /> <img
										src="../content/static/images/brand/an_4.jpg" eml="pamnep.com" />
								</div></li>
							<li><span>联系:</span>
							<textarea></textarea></li>
							<li style="text-align: right;"><a href="#">发送邀请</a></li>
						</ul>
					</div>
					<div class="set_right">
						<h1>
							<img src="../content/static/images/brand/an_5.png" />邀请和我们一起赚钱
						</h1>
						<p>你有很多的朋友在社交网络，这是一个好机会，邀请他们加入</p>
						<p>
							<a href="#"><img
								src="../content/static/images/brand/an_6.png" width="115"
								height="40" /></a> <a href="#"><img
								src="../content/static/images/brand/an_7.png" width="115"
								height="40" /></a>
						</p>
						<p>
							<a href="#"><img
								src="../content/static/images/brand/an_8.png" /></a> <a href="#"><img
								src="../content/static/images/brand/an_9.png" /></a> <a href="#"><img
								src="../content/static/images/brand/an_10.png" /></a>
						</p>
						<p>为了适应邀请，按社交网络的风格放置图片</p>
					</div>

					<div class="set_cent_1">
						<h1>
							<img src="../content/static/images/brand/an_11.png" />发送邀请
						</h1>
						<p
							style="border: 1px solid #d0d0d0; text-align: center; margin-top: 45px;">http:www.zazatao.com</p>
						<p style="margin: 30px 0 0 50px;">您可以复制链接并粘贴在论坛上，或者用SKYPE等等</p>
					</div>
					<div class="set_cent_1">
						<h1>
							<img src="../content/static/images/brand/an_12.png" />请发送一个代码来邀请朋友
						</h1>
						<p style="margin: 30px 0 0 150px; width: 550px;">
							这将成为唯一的代码，当您购买任何商品时都可以使用。这个唯一代码会放在收到货的印刷单据上 <a href="#">ПРИМЕР</a>
						</p>
					</div>

					<div class="set_cent_1 set_cent_2">
						<h1>完整的规则</h1>
						<span class="h01"><a href="#">所有受邀</a></span><span class="h02"><a
							href="#">前往购物</a></span>
					</div>

					<div class="set_cent_1 set_cent_3">
						<ul>
							<li class="li_tit1"><img
								src="../content/static/images/brand/an_14.png" />邀请好友</li>
							<li class="li_tit2"><img
								src="../content/static/images/brand/an15.png" />历史记录</li>
						</ul>
						<div class="jifen">您的积分:</div>
						<table>
							<tr>
								<td width="195" height="37">何时</td>
								<td width="197">给谁</td>
								<td width="197">状态</td>
								<td width="203">发展</td>
							</tr>
						</table>
					</div>

					<div class="set_cent_1 set_cent_4">
						<h1>
							邀请朋友<span>进入ZAZATAO看如何更改图标</span>
						</h1>
						<dl>
							<dt>
								<img src="../content/static/images/brand/pe_1.png" />
							</dt>
							<dd>您发出的邀请会有显示</dd>
						</dl>
						<dl>
							<dt>
								<img src="../content/static/images/brand/pe_2.png" />
							</dt>
							<dd>邀请被接收时小人会变成白色</dd>
						</dl>
						<dl>
							<dt>
								<img src="../content/static/images/brand/pe_3.png" />
							</dt>
							<dd>在每次购买的时候会变成蓝色</dd>
						</dl>
					</div>
					<div class="set_cent_1 set_cent_5">
						<h1>
							<img src="../content/static/images/brand/an_12.png" />订购卡给朋友<input
								type="text" value="" />
						</h1>
						<img class="img1" src="../content/static/images/brand/an16.jpg"
							width="420" height="170" /> <img class="img2"
							src="../content/static/images/brand/an17.jpg" width="440"
							height="358" />
					</div>
				</div>
				<div class="cl"></div>
			</div>
		</form>
	</div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

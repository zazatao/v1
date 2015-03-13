<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品评价管理</title>
<link href="../content/static/css/reception/css.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/qt.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/persc.css" rel="stylesheet"
	type="text/css" />
<link href="../content/static/css/reception/Pingjia.css"
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
<link href="../content/static/css/bootstrap/bootstrap.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet" />
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
</head>
<body>
	<jsp:include page="../common/prosceniumNav.jsp"></jsp:include>
	<div class="con">

		<!---------------   left   ----------------------->
		<jsp:include page="left.jsp"></jsp:include>
		<div class="Pingjia">
			<div class="biao"
				style="background: url(../content/static/images/pingjia/icon01.png) no-repeat left;">店铺半年内动态评分</div>
			<div class="nei">
				<div class="nei01">
					<div class="neileft">
						<h1>商品与描述相符</h1>
						<h2>
							<img src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" />
						</h2>
						<h3>暂无人打分</h3>
					</div>
					<div class="neiright">
						<img src="../content/static/images/pingjia/progressBar.png" />
					</div>
				</div>

				<div class="nei01">
					<div class="neileft">
						<h1>卖家的服务态度</h1>
						<h2>
							<img src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" />
						</h2>
						<h3>暂无人打分</h3>
					</div>
					<div class="neiright">
						<img src="../content/static/images/pingjia/progressBar.png" />
					</div>
				</div>

				<div class="nei01">
					<div class="neileft">
						<h1>卖家的发货速度</h1>
						<h2>
							<img src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_press.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" /> <img
								src="../content/static/images/pingjia/stars_normal.png" />
						</h2>
						<h3>暂无人打分</h3>
					</div>
					<div class="neiright">
						<img src="../content/static/images/pingjia/progressBar.png" />
					</div>
				</div>

				<div class="nei02">
					<table width="320" border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tr>
							<td><div align="center">1分</div></td>
							<td><div align="center">2分</div></td>
							<td><div align="center">3分</div></td>
							<td><div align="center">4分</div></td>
							<td><div align="center">5分</div></td>
						</tr>
						<tr>
							<td><div align="center">非常不满</div></td>
							<td><div align="center">不满意</div></td>
							<td><div align="center">一般</div></td>
							<td><div align="center">满意</div></td>
							<td><div align="center">非常满意</div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="Pingjia01">
			<div class="biao">
				<h1
					style="background: url(../content/static/images/pingjia/icon02.png) no-repeat left;">卖家累积信用：</h1>
				<h2>81</h2>
				<h3>
					<img src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" /><img
						src="../content/static/images/pingjia/silver_icon.png" />
				</h3>
				<h4>
					好评率：<span style="color: #F60">100%</span>
				</h4>
			</div>
			<div class="nei">
				<div class="nei02">
					<table width="550" border="0" align="left" cellpadding="0"
						cellspacing="1" bgcolor="#CCCCCC">
						<tr>
							<td bgcolor="#F0F0F0"><div align="center"></div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近一周</div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近一个月</div></td>
							<td bgcolor="#F0F0F0"><div align="center">最近六个月</div></td>
							<td bgcolor="#F0F0F0"><div align="center">六个月前</div></td>
							<td bgcolor="#F0F0F0"><div align="center">总 计</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/gold_icon.png"
										width="16" height="16" />好评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">1</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">20</div></td>
							<td bgcolor="#FFFFFF"><div align="center">50</div></td>
							<td bgcolor="#FFFFFF"><div align="center">81</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/silver_icon.png"
										width="16" height="16" />中评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">
									<img src="../content/static/images/pingjia/ash_icon.png"
										width="16" height="16" />差评
								</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
							<td bgcolor="#FFFFFF"><div align="center">0</div></td>
						</tr>
						<tr>
							<td height="26" bgcolor="#FFFFFF"><div align="center">总
									计</div></td>
							<td bgcolor="#FFFFFF"><div align="center">1</div></td>
							<td bgcolor="#FFFFFF"><div align="center">2</div></td>
							<td bgcolor="#FFFFFF"><div align="center">20</div></td>
							<td bgcolor="#FFFFFF"><div align="center">50</div></td>
							<td bgcolor="#FFFFFF"><div align="center">83</div></td>
						</tr>
					</table>
				</div>

			</div>

		</div>
		<div class="quanbu_dan autoh">
			<div class="tab-title" style="width: 780px;">
				<ul id="myTab1">
					<li class="active1" onmouseover="nTabs(this,0,&#39;公司新品&#39;);"
						style="top: 0; left: 0;">来自买家的评价</li>
					<li class="normal1" onmouseover="nTabs(this,1,&#39;产品促销&#39;);"
						style="top: 0; left: 76px;">来自卖家的评论</li>
					<li class="normal1" onmouseover="nTabs(this,2,&#39;最新加盟&#39;);"
						style="top: 0; left: 150px;">给他人的评论</li>

				</ul>
			</div>
			<div style="clear: both"></div>
			<table width="470" border="0" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td width="73%" height="160" valign="top"><div align="center">
								<div class="TabContent" id="myTab1_0"
									style="width: 780px; display:">
									<div class="pro">
										<div class="tou">
											<div class="t1">
												<select name="" style="margin-top: 10px">
													<option>评价</option>
												</select>
											</div>
											<div class="t2">
												<select name="" style="margin-top: 10px">
													<option>评论</option>
												</select>
											</div>
											<div class="t3">评价人</div>
											<div class="t4">商品信息</div>
											<div class="t5">操作</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">家居专营店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">家居专营店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">家居专营店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">家居专营店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">家居专营店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="page01">
											<a href="#">上一页</a><a href="#">1</a><a href="#">2</a><a
												href="#">下一页</a>
										</div>

									</div>
								</div>
								<div class="TabContent" id="myTab1_1"
									style="display: none; width: 780px;">
									<div class="pro">
										<div class="tou">
											<div class="t1">
												<select name="" style="margin-top: 10px">
													<option>评价</option>
												</select>
											</div>
											<div class="t2">
												<select name="" style="margin-top: 10px">
													<option>评论</option>
												</select>
											</div>
											<div class="t3">评价人</div>
											<div class="t4">商品信息</div>
											<div class="t5">操作</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">春天花花专卖店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">春天花花专卖店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">春天花花专卖店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">春天花花专卖店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">春天花花专卖店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>
											</div>
										</div>

										<div class="page01">
											<a href="#">上一页</a><a href="#">1</a><a href="#">2</a><a
												href="#">下一页</a>
										</div>

									</div>
								</div>
								<div class="TabContent" id="myTab1_2"
									style="display: none; width: 780px;">
									<div class="pro">
										<div class="tou">
											<div class="t1">
												<select name="" style="margin-top: 10px">
													<option>评价</option>
												</select>
											</div>
											<div class="t2">
												<select name="" style="margin-top: 10px">
													<option>评论</option>
												</select>
											</div>
											<div class="t3">评价人</div>
											<div class="t4">商品信息</div>
											<div class="t5">操作</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">时尚婚纱店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">时尚婚纱店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="xinxi">
											<div class="t1">
												<img src="../content/static/images/pingjia/gold_icon.png" />
											</div>
											<div class="t2">
												好评<br />2015-02-01
											</div>
											<div class="t3">
												商家：<a href="#">时尚婚纱店</a>
											</div>
											<div class="t4">
												<a href="#">康巴时尚田园大褂中锋卧式客厅办公时钟静音挂表...</a><br /> <span
													style="color: #C60">78.00 元</span>
											</div>
											<div class="t5">
												<a href="#">回复</a>还有3天可以解释
											</div>
										</div>

										<div class="page01">
											<a href="#">上一页</a><a href="#">1</a><a href="#">2</a><a
												href="#">下一页</a>
										</div>

									</div>
								</div>

							</div></td>
					</tr>
				</tbody>
			</table>
		</div>
		<script language="JavaScript" type="text/javascript">
//tab变换
function nTabs(thisObj, Num,Value) {
    if (thisObj.className == "active1") return;
 
 //得到LI的父ID 后面会重组ID用到
    var tabObj = thisObj.parentNode.id;   
 
    var tabList = document.getElementById(tabObj).getElementsByTagName("li");
    for (i = 0; i < tabList.length; i++) {
 
  //重组ID项 li 父ID + "_"+数组的键值
  var tabOptions =   tabObj+"_"+i;
  
        if (i == Num) {
   document.getElementById(tabOptions).style.display= 'block';
            thisObj.className = "active1";
        } else {
   document.getElementById(tabOptions).style.display= 'none';
            tabList[i].className = "normal1";
        }
    }
}
            </script>
	</div>
	<div class="clear"></div>
	<jsp:include page="../common/foot.jsp"></jsp:include>
</body>
</html>

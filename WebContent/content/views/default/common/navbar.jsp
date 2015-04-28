<%@page import="com.yc.entity.user.Personnel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="personnel" value='<%=(Personnel)request.getSession().getAttribute("loginPersonnle") %>'></c:set>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">总览<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${personnel.departAndPositions.department.departmentID == 27 || personnel.departAndPositions.department.departmentID == 1}">
							<li><a href="#">客户沟通</a></li>
							<li><a href="#">聊天</a></li>
							<li><a href="#">聊天中心</a></li>
						</c:if>
						<li><a href="#">不明订单</a></li>
						<li><a href="../overall/unfinishedOrder">未完成订单</a></li>
						<li><a href="#">订单问题</a></li>
					</ul></li>
				<c:if test="${personnel.departAndPositions.department.departmentID == 2 || personnel.departAndPositions.department.departmentID == 1}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">订单处理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="../orderprocessing/orderPool">订单池</a></li>
							<li><a href="../orderprocessing/orderGroup">订单组</a></li>
							<li><a href="../orderprocessing/dispose">处理</a></li>
							<c:if test="${personnel.departAndPositions.positions.positionid != 33 }">
								<li><a href="#">统计</a></li>
								<li><a href="#">操作员订单完成统计</a></li>
							</c:if>
						</ul></li>
				</c:if>
				<c:if test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23  || personnel.departAndPositions.department.departmentID == 24 || personnel.departAndPositions.department.departmentID == 1 }">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">仓库 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<c:if test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23 || personnel.departAndPositions.department.departmentID == 1}">
							<li><a href="../warehouse/receiving">收货</a></li>
							<li><a href="../warehouse/inspection">验货入库</a></li>
							<li><a href="../warehouse/reclaimStation">回收站</a></li>
						</c:if>
						<c:if test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23 || personnel.departAndPositions.department.departmentID == 24 || personnel.departAndPositions.department.departmentID == 1 }">
							<li><a href="../warehouse/orderOfWay">在途订单</a></li>
						</c:if>
						<c:if test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 24 || personnel.departAndPositions.department.departmentID == 1}">
							<li><a href="../warehouse/weighing">称量打包</a></li>
							<li><a href="../warehouse/freight">运费</a></li>
							<li><a href="../warehouse/sendTheParcel">发送包裹</a></li>
							<li><a href="../warehouse/cargoGroup">货物组</a></li>
							<li><a href="../warehouse/batchShipments">出货查询</a></li>
						</c:if>
						<c:if test="${personnel.departAndPositions.positions.positionid != 33 }">
							<li><a href="../warehouse/statistical">统计发货人情况</a></li>
						</c:if>
					</ul></li>
				</c:if>
				<c:if test="${personnel.departAndPositions.department.departmentID == 4 || personnel.departAndPositions.department.departmentID == 1}">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">中转 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="../forwarding/sendAndReceive">接收/发送</a></li>
						<li><a href="../forwarding/transit">中转</a></li>
						<li><a href="../forwarding/transportLate">运期</a></li>
						<li><a href="../forwarding/question">问题</a></li>
						<c:if test="${personnel.departAndPositions.positions.positionid != 33 }">
							<li><a href="#">运期统计</a></li>
						</c:if>
					</ul></li>
				</c:if>
				<c:if test="${personnel.departAndPositions.department.departmentID == 25 || personnel.departAndPositions.department.departmentID == 1}">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">商店 <span class="caret"></span></a>
					<ul class="dropdown-menu menu-top" role="menu">
						<li><a href="../shop/shopOrder">订单</a></li>
						<li><a href="../shop/package">包裹</a></li>
						<li class="dropdown-submenu"><a href="#">财务</a>
							<ul class="dropdown-menu">
								<li><a href="../shop/accountBook">zazatao账本</a></li>
								<li><a href="../shop/billPay">账单支付</a></li>
								<li><a href="#">用户结算</a></li>
								<li><a href="#">资金冻结</a></li>
								<li><a href="#">调整</a></li>
								<li><a href="#">会计</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">经济核算</a>
							<ul class="dropdown-menu">
								<li><a href="#">操作</a></li>
								<li><a href="#">账单计划</a></li>
								<li><a href="#">操作计划</a></li>
								<li><a href="#">账户计算</a></li>
								<li><a href="#">材料</a></li>
								<li><a href="#">基础操作</a></li>
								<li><a href="#">保存地</a></li>
								<li><a href="#">承包商</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">设置</a>
							<ul class="dropdown-menu">
								<li><a href="#">币种</a></li>
<!-- 								<li><a href="#">币种汇率</a></li> -->
								<li><a href="#">附加费</a></li>
								<li><a href="#">操作员工作完成情况</a></li>
								<li><a href="#">栏目类型</a></li>
								<li><a href="#">调整原因</a></li>
							</ul></li>
					</ul></li>
				</c:if>
<%-- 				<c:if test="${personnel.departAndPositions.department.departmentID == 26 || personnel.departAndPositions.department.departmentID == 1 }"> --%>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">管理 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
<!-- 						<li class="dropdown-submenu"><a href="#">诊断</a> -->
<!-- 							<ul class="dropdown-menu"> -->
<!-- 								<li><a href="#">状态</a></li> -->
<!-- 								<li><a href="#">高峰期</a></li> -->
<!-- 								<li><a href="#">PHP信息</a></li> -->
<!-- 								<li><a href="#">Apache错误</a></li> -->
<!-- 								<li><a href="#">Apache状态</a></li> -->
<!-- 								<li><a href="#">统计AWStats软件</a></li> -->
<!-- 								<li><a href="#">Cacti柱状图</a></li> -->
<!-- 								<li><a href="#">计数器</a></li> -->
<!-- 								<li><a href="#">测试</a></li> -->
<!-- 							</ul></li> -->
						<li class="dropdown-submenu"><a href="#">运输</a>
							<ul class="dropdown-menu">
								<li><a href="#">运输方式</a></li>
								<li><a href="#">关税</a></li>
								<li><a href="#">部门格子</a></li>
								<li><a href="#">包装盒</a></li>
							</ul></li>
						<li><a href="../management/missionPlan">任务计划</a>
							</li>
						<li class="dropdown-submenu"><a href="#">管理</a>
							<ul class="dropdown-menu">
								<li><a href="../management/department">组织机构</a></li>
								<li><a href="../management/position">职位角色</a></li>
								<li><a href="../management/deparDivide">机构角色分配</a></li>
								<li><a href="../management/posDivide">角色员工分配</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">其它</a>
							<ul class="dropdown-menu">
<!-- 								<li><a href="#">设置</a></li> -->
								<li><a href="#">淘宝账户</a></li>
<!-- 								<li><a href="#">语言</a></li> -->
<!-- 								<li><a href="#">国家</a></li> -->
<!-- 								<li><a href="#">时区</a></li> -->
								<li><a href="../management/ticket">票的类型</a></li>
<!-- 								<li><a href="#">票的状态</a></li> -->
								<li><a href="../management/posAndTicket">职位与票</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">内容</a>
							<ul class="dropdown-menu">
								<li><a href="#">新闻</a></li>
								<li><a href="#">邮寄</a></li>
								<li><a href="#">翻译</a></li>
								<li><a href="#">邮件模版</a></li>
								<li><a href="#">页面</a></li>
								<li><a href="#">论坛</a></li>
								<li><a href="#">视频</a></li>
								<li><a href="#">网站地图</a></li>
								<li><a href="#">网站电子地图类型</a></li>
								<li><a href="#">滚动广告</a></li>
								<li><a href="#">照片</a></li>
								<li><a href="#">帮助</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">折扣</a>
							<ul class="dropdown-menu">
								<li><a href="#">参与折扣</a></li>
								<li><a href="../management/promotionCode">促销码</a></li>
								<li><a href="#">折扣</a></li>
								<li><a href="#">折扣类型</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">商品</a>
							<ul class="dropdown-menu">
								<li><a href="../management/shopCategory">商品分类</a></li>
								<li><a href="#">成批商品</a></li>
								<li><a href="#">首页商品</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">翻译</a>
							<ul class="dropdown-menu">
								<li><a href="#">翻译产品名称</a></li>
								<li><a href="#">翻译选项名称</a></li>
								<li><a href="#">翻译选项内容</a></li>
								<li><a href="#">翻译搜索短语</a></li>
								<li><a href="#">产品名称</a></li>
							</ul></li>
						<li class="dropdown-submenu"><a href="#">黑名单</a>
							<ul class="dropdown-menu">
								<li><a href="../management/blacklistStores">店家黑名单</a></li>
								<li><a href="../management/blacklistGoods">商品黑名单</a></li>
							</ul></li>
						<li><a href="../management/merchantsSettled">入驻商家</a></li>
						<li class="dropdown-submenu"><a href="../personnel/personnel">员工</a>
							<ul class="dropdown-menu">
								<li><a href="#">操作员</a></li>
								<li><a href="#">发货员</a></li>
								<li><a href="#">经理</a></li>
								<li><a href="#">技术员</a></li>
								<li><a href="#">总经理</a></li>
							</ul></li>
						<li><a href="../management/user">用户</a></li>
					</ul></li>
<%-- 				</c:if> --%>
				<c:if test="${personnel.departAndPositions.department.departmentID == 1 }">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">统计 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">表格报表</a></li>
							<li><a href="#">折线报表</a></li>
							<li><a href="#">订单</a></li>
							<li><a href="#">技术支持</a></li>
							<li><a href="#">财务</a></li>
							<li><a href="#">员工</a></li>
							<li><a href="#">积极员工</a></li>
							<li><a href="#">发现者</a></li>
							<li><a href="#">促销码</a></li>
						</ul></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><c:out value="${personnel.userName }"></c:out></a></li>
				<li><a href="../personnel/logout">退出</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>

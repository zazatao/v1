<%@page import="com.yc.entity.user.Personnel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="personnel"
	value='<%=(Personnel) request.getSession().getAttribute(
						"loginPersonnle")%>'></c:set>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
					data-toggle="dropdown">总览<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="overall/unknownCommList">不明货品</a></li>
						<li><a href="overall/unfinishedOrder">未完成订单</a></li>
						<li><a href="overall/questionOrder">问题订单</a></li>
					</ul></li>

				<c:if test="${personnel.departAndPositions.department.departmentID == 2 || personnel.departAndPositions.department.departmentID == 1|| personnel.loginName== 'administrator'}">
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">订单处理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="orderprocessing/orderPool">订单池</a></li>
							<li><a href="orderprocessing/orderGroup">订单组</a></li>
							<li><a href="orderprocessing/dispose">处理</a></li>
							<li><a href="orderprocessing/statistics">统计</a></li>
						</ul></li>
				</c:if>
				<c:if test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23  || personnel.departAndPositions.department.departmentID == 24 || personnel.departAndPositions.department.departmentID == 1|| personnel.loginName== 'administrator' }">
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">仓库 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<c:if
								test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23  || personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
								<li><a href="warehouse/receiving">收货</a></li>
								<li><a href="warehouse/inspection">验货入库</a></li>
								<li><a href="warehouse/reclaimStation">回收站</a></li>
							</c:if>
							<c:if
								test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 23 || personnel.departAndPositions.department.departmentID == 24 || personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
								<li><a href="warehouse/orderOfWay">在途订单</a></li>
							</c:if>
							<c:if
								test="${personnel.departAndPositions.department.departmentID == 22 || personnel.departAndPositions.department.departmentID == 24  || personnel.departAndPositions.department.departmentID == 1|| personnel.loginName== 'administrator'}">
								<li><a href="warehouse/weighing">称量打包</a></li>
								<li><a href="warehouse/freight">运费</a></li>
								<li><a href="warehouse/sendTheParcel">发送包裹</a></li>
								<li><a href="warehouse/cargoGroup">货物组</a></li>
								<li><a href="warehouse/batchShipments">出货查询</a></li>
							</c:if>
								<li><a href="warehouse/statistical">统计发货人情况</a></li>
						</ul></li>
				</c:if>
				<c:if
					test="${personnel.departAndPositions.department.departmentID == 4 || personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">中转<span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="forwarding/sendAndReceive">接收/发送</a></li>
							<li><a href="forwarding/transit">中转</a></li>
							<li><a href="forwarding/transportLate">运期</a></li>
							<li><a href="forwarding/question">问题</a></li>
							<c:if
								test="${personnel.departAndPositions.positions.positionid != 33|| personnel.loginName== 'administrator' }">
								<li><a href="forwarding/forStatistical">计算统计</a></li>
							</c:if>
						</ul></li>
				</c:if>
				<c:if
					test="${personnel.departAndPositions.department.departmentID == 25 || personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">商店 <span class="caret"></span></a>
						<ul class="dropdown-menu menu-top" role="menu">
							<li><a href="shop/shopOrder">订单</a></li>
							<li><a href="shop/package">包裹</a></li>
							<li class="dropdown-submenu"><a href="javascript:void(0);">财务</a>
								<ul class="dropdown-menu">
									<li><a href="shop/accountBook">zazatao账本</a></li>
									<li><a href="shop/billPay">账单支付</a></li>
									<li><a href="shop/accounting">会计</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a href="javascript:void(0);">经济核算</a>
								<ul class="dropdown-menu">
									<li><a href="shop/material">材料</a></li>
									<li><a href="javascript:void(0);">承包商</a></li>
								</ul></li>
							<li class="dropdown-submenu"><a href="javascript:void(0);">设置</a>
								<ul class="dropdown-menu">
									<li><a href="shop/currency">币种</a></li>
									<!-- 								<li><a href="javascript:void(0);">币种汇率</a></li> -->
									<li><a href="shop/surcharges">附加费</a></li>
								</ul></li>
						</ul></li>
				</c:if>
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">管理 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="management/missionPlan">任务计划</a></li>
							
							<li class="dropdown-submenu"><a href="javascript:void(0);">管理</a>
									<ul class="dropdown-menu">
										<li><a href="management/department">组织机构</a></li>
										<li><a href="management/position">职位角色</a></li>
										<li><a href="management/deparDivide">机构角色分配</a></li>
										<li><a href="management/posDivide">角色员工分配</a></li>
									</ul></li>
									
							<c:if
								test="${personnel.departAndPositions.department.departmentID == 26 || personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
								<li class="dropdown-submenu"><a href="javascript:void(0);">运输</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">运输方式</a></li>
										<li><a href="javascript:void(0);">关税</a></li>
										<li><a href="javascript:void(0);">部门格子</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">其它</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">淘宝账户</a></li>
										<li><a href="management/ticket">票的类型</a></li>
										<li><a href="management/posAndTicket">职位与票</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">内容</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">语言</a></li>
										<li><a href="management/advertisement">广告</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">折扣</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">参与折扣</a></li>
										<li><a href="management/promotionCode">促销码</a></li>
										<li><a href="javascript:void(0);">折扣</a></li>
										<li><a href="javascript:void(0);">折扣类型</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">商品</a>
									<ul class="dropdown-menu">
										<li><a href="management/shopCategory">商品分类</a></li>
										<li><a href="management/specification">商品类型规格</a></li>
										<li><a href="management/brand">商品品牌</a></li>
										<li><a href="./management/shopcateAndbrand">商品品牌分配</a></li>
										<li><a href="javascript:void(0);">成批商品</a></li>
										<li><a href="javascript:void(0);">首页商品</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">翻译</a>
									<ul class="dropdown-menu">
										<li><a href="javascript:void(0);">翻译产品名称</a></li>
										<li><a href="javascript:void(0);">翻译选项名称</a></li>
										<li><a href="javascript:void(0);">翻译选项内容</a></li>
										<li><a href="javascript:void(0);">翻译搜索短语</a></li>
										<li><a href="javascript:void(0);">产品名称</a></li>
									</ul></li>
								<li class="dropdown-submenu"><a href="javascript:void(0);">黑名单</a>
									<ul class="dropdown-menu">
										<li><a href="management/blacklistStores">店家黑名单</a></li>
										<li><a href="management/blacklistGoods">商品黑名单</a></li>
									</ul></li>
								<li><a href="management/merchantsSettled">入驻商家</a></li>
								<li><a href="management/personnel">员工</a></li>
								<li><a href="management/user">用户</a></li>
							</c:if>
						</ul></li>
				<c:if
					test="${personnel.departAndPositions.department.departmentID == 1 || personnel.loginName== 'administrator'}">
					<li class="dropdown"><a href="javascript:void(0);" class="dropdown-toggle"
						data-toggle="dropdown">统计 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="management/orderAccount">订单</a></li>
							<li><a href="javascript:void(0);">财务</a></li>
						</ul></li>
				</c:if>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="management/missionPlan"><font color="blue"><div
								id="nums"></div></font></a></li>
				<li><a href="javascript:void(0);"><c:out value="${personnel.userName }"></c:out></a></li>
				<li><a href="personnel/logout">退出</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	<!--/.container-fluid -->
</nav>
<script type="text/javascript">
	$(document).ready(function() {
		jQuery.ajax({
			type : 'GET',
			contentType : 'application/json',
			url : 'getShopCategory/getPlanNum',
			dataType : 'json',
			success : function(data) {
				if (data.success == 'true') {
					$('#nums').html("您有任务(" + data.num + ")");
				}
			}
		});
	});
</script>

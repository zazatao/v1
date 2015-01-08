<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>中转</title>
  
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
	<link href="../content/static/css/bootstrap/bootstrap-combined.min.css" rel="stylesheet"> 
<script src="../content/static/js/echart/ie-emulation-modes-warning.js"></script>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../content/static/img/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../content/static/img/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../content/static/img/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../content/static/img/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../content/static/img/favicon.png">
<script type="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script> 

<script type="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>

<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script type="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script type="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
</head> 
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
 
	<div class="container-fluid" style="padding:0;margin-top:32px;" >
		<div class="row-fluid">
			<div class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">中转</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">中转</font>
				</ul>
			</div>
		</div>
	</div>
	
	
	<div class="container-fluid"> 
			<div >
	<div class="row-fluid">
		<div class="span6 ui-sortable  panel panel-default">
			<h4 class="breadcrumb">
				组货
			</h4>
			<span  style="padding-left:10px;"  > </span>
			<button class="btn" type="button">收货</button>&nbsp;&nbsp;&nbsp;<button class="btn" type="button">发货</button>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>
								型号
							</th>
							<th>
								总重量
							</th>
							<th>
								包裹
							</th>
							<th>
								运输方式
							</th>
							<th>
								状态
							</th>
							<th>
								发送
							</th>
						</tr>
					</thead> 
				</table>

		</div>
		<div class="span6  ui-sortable  panel panel-default ">
			<h4 class="breadcrumb">
					中转包裹
				</h4> 
			<div class="container" >
			
				<address> 
					<strong>地址 </strong>
							新市区 创业大厦
				</address>
				<form class="form-search">
						编号 : <input class="input-medium " type="text" />&nbsp;&nbsp;&nbsp;&nbsp; 总运费 : <input class="input-medium " type="text" />  <button type="submit" class="btn  btn-default">发送包裹</button>  <button type="submit" class="btn  btn-default">发送包裹</button>
				</form>
			</div>
			<div class="list-group-item">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<div id="tabs-294834" class="tabbable">
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#panel-700079">订单</a></li>
											<li><a data-toggle="tab" href="#panel-520562">内部聊天</a></li>
											<li><a data-toggle="tab" href="#panel-520522">联系买家</a></li>
										</ul>
										<div class="tab-content">
											<div id="panel-700079" class="tab-pane active">
												 
												<div class="list-group-item">
													<p class="list-group-item-text">
													</p><table class="table table-striped">
														<tbody><tr class="">
															<th>订单编号</th>
															<th>单元格</th>
															<th>货号</th>
															<th>买家</th>
															<th>数量</th>
															<th>名称</th> 
														</tr>
														
													</tbody></table>
													<p></p>
												</div>
											</div>
											<div id="panel-520562" class="tab-pane">
											 
												<div class="list-group-item">
													<p class="list-group-item-text">
													</p><table class="table table-striped">
														<tbody>
														<tr class="">
															<th class="col-sm-8 " >正文</th>
															<th class="col-sm-4 " >日期</th> 
														</tr>
														
													</tbody></table>
													<p></p>
												</div>
											</div>
											
											<div id="panel-520522" class="tab-pane">
											 
												<div class="list-group-item">
													<p class="list-group-item-text">
													</p><table class="table table-striped">
														<tbody><tr class="">
															<th class="col-sm-8 " >正文</th>
															<th class="col-sm-4 " >日期</th> 
														</tr>
													</tbody></table>
													<p></p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>
<%@page import="com.yc.entity.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计</title>
<link href="../content/static/css/bootstrap/navbar.css" rel="stylesheet">
<link href="../content/static/css/bootstrap/bootstrap.min.css"
	rel="stylesheet">
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
<script TYPE="text/javascript"
	src="../content/static/js/lib/jquery.min.js"></script>
<script TYPE="text/javascript"
	src="../content/static/js/lib/bootstrap.min.js"></script>
<script TYPE="text/javascript" src="./content/static/js/lib/scripts.js"></script>

<script TYPE="text/javascript"
	src="../content/static/js/echart/ie10-viewport-bug-workaround.js"></script>
<link href="../content/static/css/datetime/jquery-clockpicker.min.css"
	rel="stylesheet">
<link href="../content/static/css/datetime/jquery.datetimepicker.css"
	rel="stylesheet">
<script TYPE="text/javascript"
	src="../content/static/js/datetime/bootstrap-clockpicker.min.js"></script>
<script TYPE="text/javascript"
	src="../content/static/js/datetime/jquery.datetimepicker.js"></script>
<script src="../content/static/js/echart/echarts.js"></script>
</head>
<body>
	<!-- Static navbar -->
	<jsp:include page="../common/navbar.jsp"></jsp:include>
	<DIV class="container-fluid" style="padding: 0; margin-top: 32px;">
		<DIV class="row-fluid">
			<DIV class="span12">
				<ul class="breadcrumb">
					<li><a href="#" style="font-size: 18px;">订单处理</a></li>
					<span class="divider"><font style="font-size: 18px;">/</font></span>
					<li><font style="font-size: 18px;">统计</font>
					
				</ul>
			</DIV>
		</DIV>
	</DIV>
	<div class="form-group">
			<div class="col-md-3">
				<select class="form-control" id="param">
					<option value="week">本周
					<option value="months">本月
					<option value="year">本年
				</select>
				<br>
			</div>
		</div>
	<div id="main" style="width: 100%; height: 700px;"></div>
</body>
<script src="../content/static/js/echart/echarts-all.js"></script>
<script type="text/javascript">  
	var PATH = "../analysis/removecauses?param=week";
	$('#param').change(function(){
		alert(this.value);
		PATH = "../analysis/removecauses?param="+this.value;
		require.config({
			paths : {
				'echarts' : 'http://echarts.baidu.com/build/echarts',
				'echarts/chart/line' : 'http://echarts.baidu.com/build/echarts'
			}
		});
		require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
  	], drewEcharts
 	);
	});
// 路径配置
		require.config({
			paths : {
				'echarts' : 'http://echarts.baidu.com/build/echarts',
				'echarts/chart/line' : 'http://echarts.baidu.com/build/echarts'
			}
		});
		require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
  	], drewEcharts
 	);

 function drewEcharts(ec) {
        // 基于准备好的dom，初始化echarts图表
        myChart = ec.init(document.getElementById('main')); 
        var option = {
        	    title : {
        	        text: '订单采购与工资统计表',
        	        subtext: '折线与饼图'
        	    },
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data: (function(){
                        var arr=[];
                        jQuery.ajax({
							type : 'post',
							async : false, //同步执行
							dataType : 'json',
							contentType : 'application/json',
							url : PATH,
							success : function(data) {
								var items = data.statistics
								for (var i = 0; i < items.length; i++) {
									arr.push(items[i]);
								}
							}
						});
                   return arr;
                })()
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            magicType : {show: true, type: ['line', 'bar']},
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    calculable : true,
        	    xAxis : [
        	        {
        	            type : 'category',
        	            boundaryGap : false,
        	            data : ['周一','周二','周三','周四','周五','周六','周日']
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value',
        	            axisLabel : {
        	                formatter: '{value}'
        	            }
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'最高气温',
        	            type:'line',
        	            data:[11, 11, 15, 13, 12, 13, 10],
        	            markPoint : {
        	                data : [
        	                    {type : 'max', name: '最大值'},
        	                    {type : 'min', name: '最小值'}
        	                ]
        	            },
        	            markLine : {
        	                data : [
        	                    {type : 'average', name: '平均值'}
        	                ]
        	            }
        	        }
        	    ]
        	};
        myChart.setOption(option); 
    }
</script>
</html>
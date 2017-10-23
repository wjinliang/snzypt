<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>后台管理 | 后台主页</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<%@include file="../includejsps/style.jsp"%>
<%@include file="../includejsps/plugin-style.jsp"%>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
	<!-- BEGIN HEADER -->
	<%@include file="../includejsps/head.jsp"%>
	<!-- END HEADER -->
	<!-- BEGIN PAGE CONTAINER -->
	<div class="page-container">
		<!-- BEGIN PAGE HEAD -->
		<%-- <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>
                    主页面板
                    <small>统计 & 报告</small>
                    <a style="cursor:default;"></a>
                </h1>
            </div>
            <!-- END PAGE TITLE -->
            <!-- BEGIN PAGE TOOLBAR -->
            <%@include file="../includejsps/toolbar.jsp" %>
            <!-- END PAGE TOOLBAR -->
        </div>
    </div> --%>
		<!-- END PAGE HEAD -->
		<!-- BEGIN PAGE CONTENT -->
		<div class="page-content">
			<div class="container">
			<!-- BEGIN TRACKING CURVES PORTLET-->
					<div class="col-md-12 col-sm-12">
						<div class="portlet light gree">
							<div class="portlet-title">
							<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">近期发布文章数量</span>
									<span class="caption-helper"></span>
								</div>
								
							</div>
							<div class="portlet-body">
								<div id="chart_3" class="chart"></div>
							</div>
						</div>
					</div>
						<!-- END TRACKING CURVES PORTLET-->
				 <!-- <div class="row margin-top-10">
					<div class="col-md-6 col-sm-12">
						BEGIN PORTLET
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">内容点击排行</span>
									<span class="caption-helper"></span>
								</div>
								<div class="actions">
									<div class="btn-group btn-group-devided" data-toggle="buttons">
										<label
											class="btn btn-transparent grey-salsa btn-circle btn-sm"
											onclick="contentReload(1);"> <input type="radio"
											onclick="channelReload(this.value);" name="options"
											class="toggle" id="option1">日
										</label> <label
											class="btn btn-transparent grey-salsa btn-circle btn-sm"
											onclick="contentReload(7);"> <input type="radio"
											name="options" class="toggle" id="option2">周
										</label> <label
											class="btn btn-transparent grey-salsa btn-circle btn-sm active"
											onclick="contentReload(30);"> <input type="radio"
											name="options" class="toggle" id="option3">月
										</label>
									</div>
								</div>
							</div>
							<div class="portlet-body" id="content_grid"></div>
						</div>
						END PORTLET
					</div> -->
					<!-- <div class="col-md-6 col-sm-12">
						BEGIN PORTLET
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">频道点击排行</span>
									<span class="caption-helper"></span>
								</div>
								<div class="actions">
									<div class="btn-group btn-group-devided" data-toggle="buttons">
										<label
											class="btn btn-transparent grey-salsa btn-circle btn-sm "
											onclick="channelReload(1);"> <input type="radio"
											name="options" class="toggle" id="option1">日
										</label> <label
											class="btn btn-transparent grey-salsa btn-circle btn-sm"
											onclick="channelReload(7);"> <input type="radio"
											name="options" class="toggle" id="option2">周
										</label> <label
											class="btn btn-transparent grey-salsa btn-circle btn-sm active"
											onclick="channelReload(30);"> <input type="radio"
											name="options" class="toggle" id="option3">月
										</label>
									</div>
								</div>
							</div>
							<div class="portlet-body" id="channel_grid"></div>
						</div>
						END PORTLET
					</div> -->
				</div> 
				<!-- END PAGE CONTENT INNER -->
			</div>
		</div>
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
	<!-- BEGIN FOOTER -->
	<%@include file="../includejsps/foot.jsp"%>
	<!-- END FOOTER-->
	<!-- BEGIN JAVASCRIPTS-->
	<%@include file="../includejsps/js.jsp"%>
	<%@include file="../includejsps/plugin-js.jsp"%>
	<script type="text/javascript">
    var grid,channel_grid,content_grid;
    var contentType = "0";
    var content_options = {
            url: "cmsStatic/contentVisitList?days=30&channelType="+contentType, // ajax地址
            pageNum: 1,//当前页码
            pageSize: 10,//每页显示条数
            idFiled: "id",//id域指定
            showCheck: false,//是否显示checkbox
            showPaging:false,
            cloums: [{
                title: "标题",
                field: "title",
                width: "70%",
                format:function(i,c){
                	return '<a href="'+c.url+'" target="_blank">'+c.title+'</a>';
                }
            },{
                title: "点击量",
                field: "count",
                width: "15%"
            }]};
    var channel_options = {
            url: "cmsStatic/channelVisitList?days=30", // ajax地址
            pageNum: 1,//当前页码
            pageSize: 10,//每页显示条数
            idFiled: "id",//id域指定
            showCheck: false,//是否显示checkbox
            showPaging:false,
            cloums: [{
                title: "标题",
                field: "title",
                width: "70%",
                format:function(i,c){
                	return '<a href="'+c.url+'" target="_blank">'+c.title+'</a>';
                }
            },{
                title: "点击量",
                field: "count",
                width: "15%"
            }]};
   
	function contentReload(days){
		content_grid.reload({url:"cmsStatic/contentVisitList?days="+days+"&channelType="+contentType});
	}
	function channelReload(days){
		channel_grid.reload({url:"cmsStatic/channelVisitList?days="+days});
	}
    jQuery(document).ready(function () {
//         content_grid = $("#content_grid").dmGrid(content_options);
//         channel_grid = $("#channel_grid").dmGrid(channel_options);
    }); 
</script>
	<!-- <script src="<%=basePath%>assets/dmcms/js/visit-record.js"></script> -->
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.stack.min.js"></script>
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.crosshair.min.js"></script>
	<script
		src="<%=basePath%>assets/global/plugins/flot/jquery.flot.categories.min.js"
		type="text/javascript"></script>
	<script
		src="<%=basePath%>assets/admin/pages/scripts/charts-flotcharts.js"></script>
	<!-- END JAVASCRIPTS -->
</body>
<script>
function chart3(data){
	if ($('#chart_3').size() != 1) {
        return;
    }
    plot = $.plot($("#chart_3"),
    		formatData(data),
    	{
        series: {
            lines: {
                show: true
            }
        },
        grid: {
            hoverable: true,
            autoHighlight: true,
            tickColor: "#eee",
            borderColor: "#eee",
            borderWidth: 1
        },
        xaxis: {
            tickLength: 0,
            tickDecimals: 0,
            mode: "categories",
            min: 0,
            font: {
                lineHeight: 18,
                style: "normal",
                variant: "small-caps",
                color: "#6F7B8A"
            }
        },
        yaxis: {
//             ticks:10,
            tickDecimals: 0,
            tickColor: "#eee",
            font: {
                lineHeight: 14,
                style: "normal",
                variant: "small-caps",
                color: "#6F7B8A"
            }
        },
    });
    function showTooltip(x, y, contents) {
        $('<div id="tooltip">' + contents + '</div>').css({
            position: 'absolute',
            display: 'none',
            top: y + 5,
            left: x + 15,
            border: '1px solid #333',
            padding: '4px',
            color: '#fff',
            'border-radius': '3px',
            'background-color': '#333',
            opacity: 0.80
        }).appendTo("body").fadeIn(200);
    }

    var previousPoint = null;
    $("#chart_3").bind("plothover", function(event, pos, item) {
        $("#x").text(pos.x.toFixed(0));
        $("#y").text(pos.y.toFixed(0));

        if (item) {
            if (previousPoint != item.dataIndex) {
                previousPoint = item.dataIndex;

                $("#tooltip").remove();
                var x = item.datapoint[0].toFixed(0),
                    y = item.datapoint[1].toFixed(0);

                showTooltip(item.pageX, item.pageY, item.series.label + "频道  : "+y+"条" );
            }
        } else {
            $("#tooltip").remove();
            previousPoint = null;
        }
    });
    function formatData(data){
    	var arr=[];
    	var str=[];
    	for(var i=0;i<data.total;i++){
    		arr.push([]);
    		str.push(undefined);
    	}
    	$.each(data.data,function(index,content){
    		for(var i=0;i<arr.length;i++){
    			if(str[i]==content.title){
    				arr[i].push([content.dateStr,content.count]);
    				break;
    			}
    			if(str[i]==undefined){
    				str[i]=content.title
    				arr[i].push([content.dateStr,content.count]);
    				break;
    			}
    		}	
    	});
    	return formatPlot(arr,str);
    }
    function formatPlot(arr,str){
    	arr.sort(function (a,b){
    		return b.length-a.length;
    	});
    	var plotss=[];
    	for(var i=0;i<arr.length;i++){
    		var p={data: arr[i],label: str[i],lines: {lineWidth: 1},shadowSize: 0};
    		plotss.push(p);
    	}
    	return plotss;
    }
   

}

jQuery(document).ready(function() {
	var url="cmsStatic/pubulishList?days=30&pageSize=7";
	$.get(url,function(data){
		chart3(data);
	});
            
});
</script>
<!-- END BODY -->
</html>

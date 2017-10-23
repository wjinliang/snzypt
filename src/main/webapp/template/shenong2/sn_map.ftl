<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
<link rel="stylesheet" type="text/css" href="/html/sn-static/static/css/jquery.treemenu.css">

<style type="text/css">
/*树结构样式设置开始*/
.tree {color:#46CFB0; padding-left:0px;}
.tree li,
.tree li > a,
.tree li > span {
    padding: 4px;
    border-radius: 4px;
}
.tree li a {
    color:#000;
    text-decoration: none;
    line-height: 20pt;
    border-radius: 4px;
}
.tree li a:hover {
    background-color: #0e82d9;
    color: #fff;
}
.active {
    background-color: #0e82d9;
    color:#fff;
}
.active a {
    color: #fff;
}
.tree li a.active:hover {
    background-color: #34BC9D;
}
.real-map{
	height:500px;
}
/*树结构样式设置结束*/
</style>
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<div class="col-md-4 col-lg-4">
                	<div class="input-group" style="border:1px solid #CCC">
                    	<input type="text" class="form-control input-alter" placeholder="请输入关键字搜索">
                        <span class="input-group-btn">
                        	<button class="btn btn-alter" type="button">搜索</button>
                        </span>
                    </div>
                    <div class="mgt15">
                    	<div class="real-map-info">
                            <div class="item-title">
                                <div class="item-title-partl alter-icon3">
                                    <span>数据目录</span>
                                </div>
                            </div>
                            <div class="real-map-con">
                                 <ul class="map-list clearfix">
                                     <li class="pull-left">
                                         <a href="" title="农村信息" target="_blank">
                                            <img src="/html/sn-static/static/image/icon5.png" width="50" height="46" alt="涉农机构">
                                            <p>农村信息</p>
                                         </a>
                                     </li>
                                     <li class="pull-left">
                                         <a href="" title="种植生产" target="_blank">
                                            <img src="/html/sn-static/static/image/icon6.png" width="39" height="46" alt="休闲农业">
                                            <p>种植生产</p>
                                         </a>
                                     </li>
                                     <li class="pull-left">
                                         <a href="" title="畜牧水产" target="_blank">
                                            <img src="/html/sn-static/static/image/icon7.png" width="39" height="46" alt="市场行情">
                                            <p>畜牧水产</p>
                                         </a>
                                     </li>
                                     <li class="pull-left">
                                         <a href="" title="市场资源" target="">
                                            <img src="/html/sn-static/static/image/icon8.png" width="55" height="46" alt="农村经济">
                                            <p>市场资源</p>
                                         </a>
                                     </li>
                                     <li class="pull-left">
                                         <a href="" title="农业科技" target="">
                                            <img src="/html/sn-static/static/image/icon08.png" width="49" height="45" alt="农业科技">
                                            <p>农业科技</p>
                                         </a>
                                     </li>
                                 </ul>
                            </div>
                        </div>
                        <div class="detail">
                        	<div class="detail-title icon-bg5">
                                <span class="blue">详细</span>
                            </div>
                            <div class="detail-con">
                                <div class="panel-body">
                                    <ul class="tree">
                                      <li class="tree-closed"><span class="toggler"></span><a href="javascript:void(0)">北京市2015年种植行业企业信息</a>
                                      	<ul>
                                          <li><a href="#">企业信息</a>
                                            <ul>
                                              <li class="active"><a href="#">种植行业</a></li>
                                              <li><a href="#">种植信息</a></li>
                                              <li><a href="#">种植信息</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                      <li class="tree-closed"><span class="toggler"></span><a href="javascript:void(0)">北京市2015年种植行业企业信息</a>
                                        <ul>
                                           <li><a href="#">企业信息</a>
                                            <ul>
                                              <li><a href="#">种植行业</a></li>
                                              <li><a href="#">种植信息</a></li>
                                              <li><a href="#">种植信息</a></li>
                                            </ul>
                                          </li>
                                          <li><a href="#">种植信息</a>
                                            <ul>
                                             <li><a href="#">种植行业</a></li>
                                              <li><a href="#">种植信息</a></li>
                                              <li><a href="#">种植信息</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                      <li><a href="#about">北京市2015年种植行业企业信息</a>
                                        <ul>
                                         <li><a href="#">种植行业</a></li>
                                              <li><a href="#">种植信息</a></li>
                                              <li><a href="#">种植信息</a>
                                            <ul>
                                              <li><a href="#">种植行业</a></li>
                                              <li><a href="#">种植信息</a></li>
                                              <li><a href="#">种植信息</a></li>
                                            </ul>
                                          </li>
                                        </ul>
                                      </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-lg-8" style="padding-left:0px;">
               		<div class="real-map" id="mapDiv">
                    	<!--<img src="/html/sn-static/static/image/map.png" height="500" style="width:100%;">-->
                    </div> 	
                </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/sn-static/static/js/jquery.treemenu.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=eRS1t1tVGBCR04Cj6WQED4j69ntlohM5"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/TextIconOverlay/1.2/src/TextIconOverlay_min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/library/MarkerClusterer/1.2/src/MarkerClusterer_min.js"></script>
	<title>描点</title>
	<script type="text/javascript">
		$(function(){
			initPointPositions();
		
			var map = new BMap.Map("mapDiv");
			map.centerAndZoom(new BMap.Point(116.397428, 39.90923), 9);
			map.enableScrollWheelZoom();
			var markers = [];
			var pt = null;
			var i = 0;
			for (; i < pointPositions.length; i++) {
			   pt = new BMap.Point(pointPositions[i][0], pointPositions[i][1]);
			   markers.push(new BMap.Marker(pt));
			}
			
			var markerClusterer = new BMapLib.MarkerClusterer(map, {markers:markers});
		});
		
		var pointPositions = new Array();
		function initPointPositions(){
			//这些写死的点用于测试
		    for(var i=0;i<5;i++){
		    	pointPositions[i] = [116.205467 + 0.5*i, 39.907761 + 0.3*i];
			}
			//正式环境中，点的坐标数据从后台取出来
			/*
			$.ajax({  
		         type:'get',      
		         url:'<%=basePath%>api/dataconfig/getPointDatas.do',  
		         data:{},  
		         cache:false,  
		         dataType:'json',  
		         success:function(data){
		         	var list = data.data;
		         	var length = list.length;
		         	for(var i=0;i<length;i++){
		         		pointPositions[i] = [list.X,list.Y];
		         	}
		         },
		         error:function(){
		         	alert('初始化点数据失败');
		         } 
		     });
		    */
		}
		
  </script>
<script>
$(function(){
        $(".tree").treemenu({delay:300}).openActive();
    });
</script>
</body>
</html>

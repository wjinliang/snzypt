<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
        <script src='/html/sn-static/static/sumap/libs/SuperMap.Include.js'></script>
	<!--[if lt IE 10]> 
	<style>
		.head-bottom{background:url(/html/sn-static/static/image/navbanner.png) no-repeat;}
	</style>
	<![endif]-->
</head>

<script>
$(function(){
	
	init();
});
            var map, local, layer, vectorLayer, features, select, tempLayer , drag, delIndex = 0, editEnable = false,control, queryBounds, markerLayer,drawFeature,layerWorld,layerMsly,
            style = {
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker.png",
                graphicWidth: 13,
                graphicHeight: 16,
                name: "town"
            },
            style1 = {
                pointRadius: 10,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/markerbig.png",
                name: "city"
            },
            style2 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/markerflag.png",
                name: "captial"
            },
	    styleBound = {
                strokeColor: "#304DBE",
                strokeWidth: 1,
                pointerEvents: "visiblePainted",
                fillColor: "#304DBE",
                fillOpacity: 0.3
            },
	    host = "http://172.24.61.42:8090",
            url1=host+"/iserver/services/map-basemap/rest/maps/mslymaps";
            var url2=host+"/iserver/services/map-ugcv5-base1224/rest/maps/base1224";
            function init(){

                //加载map控件
                map = new SuperMap.Map("map",{controls: [
                    new SuperMap.Control.LayerSwitcher(),
                    new SuperMap.Control.ScaleLine(),
                    new SuperMap.Control.Zoom(),
                    new SuperMap.Control.Navigation({
                        dragPanOptions: {
                            enableKinetic: true 
                        }
                    })], allOverlays: true
                });
                //初始化图层
                layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("base1220", url2, {transparent: true, cacheEnabled: true}, {maxResolution:"auto"});
                layerWorld.events.on({"layerInitialized":addLayer1});

                vectorLayer = new SuperMap.Layer.Vector("Vector Layer", {renderers: ["Canvas2"]});
                select = new SuperMap.Control.SelectFeature(vectorLayer, {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect, repeat:true});
                map.addControl(select);
	    }

            	
            function addLayer1(){
                layerMsly = new SuperMap.Layer.TiledDynamicRESTLayer("mslymaps", url1, {transparent: true, cacheEnabled: true}, {maxResolution:"auto"});
                layerMsly.events.on({"layerInitialized":addLayer});
            }
			
            //添加图层
            function addLayer() {
                map.addLayers([layerWorld,layerMsly,vectorLayer]);
                map.setCenter(new SuperMap.LonLat(12975695.47, 4817251.51), 2);        
            }

	    function onFeatureSelect(feature) {
                if(editEnable) {
                    editSelectedFeatures();
                } else {
                    selectedFeature = feature;
                    //被点选的feature第二次被选中的时候popup无需重新构建，直接显示即可
                    if(feature.popup){
                        feature.popup.show();
                        return;
                    }
					
                    var contentHTML = "<div style='font-size:.8em; opacity: 0.8; overflow-y:hidden;'>" +
                            "<span style='font-weight: bold; font-size: 10px;'>详细信息</span><br>";
				
                    contentHTML += "名称：" + feature.attributes["商户名称"] + "<br>";
                    contentHTML += "电话：" + feature.attributes["电话"] + "<br>";
                    //初始化一个弹出窗口，当某个地图要素被选中时会弹出此窗口，用来显示选中地图要素的属性信息
                    popup = new SuperMap.Popup.FramedCloud("chicken",
                            feature.geometry.getBounds().getCenterLonLat(),
                            null,
                            contentHTML,
                            null,
                            true,
                            null,
                            true);
                    feature.popup = popup;
                    map.addPopup(popup);
					//var a = feature.attributes["SmY"];
					//var b = feature.attributes["SmX"];
					//map.setCenter(new SuperMap.LonLat(a,b),5); 
                }
            }

            function onPopupClose(evt) {

            }
            //清除要素时调用此函数
            function onFeatureUnselect(feature) {
                map.removePopup(feature.popup);
                feature.popup.destroy();
                feature.popup = null;
            }

	    function drawGeometry() {
		clearFeatures();
		drawFeature.activate();
	    }
			
			
               //SQL查询
           var types = "";
	   var featureType = [];
           function queryBySQL(valueParam) {
		 vectorLayer.removeAllFeatures();			
		 types = valueParam;
		 delIndex =0;
            var queryParamCapital, queryBySQLParamsCapital, queryBySQLServiceCapital,params,type,param;
		 type = valueParam;
		params = "ID > 0";
		queryParamCapital = new SuperMap.REST.FilterParameter({
			name: type,
			attributeFilter:params 
		}),
			//初始化sql查询参数
		queryBySQLParamsCapital = new SuperMap.REST.QueryBySQLParameters({
			queryParams: [queryParamCapital]
								}),
		        //SQL查询服务
			queryBySQLServiceCapital = new SuperMap.REST.QueryBySQLService(url1, {
				eventListeners: {"processCompleted": processCompletedCapital, "processFailed": processFailedCapital}});
				queryBySQLServiceCapital.processAsync(queryBySQLParamsCapital);
			}

			
	function queryByClick() {
		var queryParamCapital,queryParamCapital1,queryParamCapital2, queryBySQLParamsCapital, queryBySQLServiceCapital,params,param;
						param = document.getElementById("text1").value;
						params = "商户名称='"+param+"'";				
						alert(params);
						queryParamCapital = new SuperMap.REST.FilterParameter({
							name: "民俗旅游村@beijing",
							attributeFilter:params 
						}),
						queryParamCapital1 = new SuperMap.REST.FilterParameter({
							name:"民俗旅游户@beijing",
							attributeFilter:params 
						}),
						queryParamCapital2 = new SuperMap.REST.FilterParameter({
							name: "休闲农业园区@beijing",
							attributeFilter:params 
						}),
							//初始化sql查询参数
								queryBySQLParamsCapital = new SuperMap.REST.QueryBySQLParameters({
									queryParams: [queryParamCapital,queryParamCapital1,queryParamCapital2]
								}),
							//SQL查询服务
								queryBySQLServiceCapital = new SuperMap.REST.QueryBySQLService(url1, {
									eventListeners: {"processCompleted": processCompletedCapital, "processFailed": processFailedCapital}});
						queryBySQLServiceCapital.processAsync(queryBySQLParamsCapital);
				}
          
			
            //SQL查询(省会)成功时触发此事件
            function processCompletedCapital(queryEventArgs) { 
                var i, j, feature,
                        result = queryEventArgs.result;
                features = [];
                if (result && result.recordsets) {
                    for (i=0; i<result.recordsets.length; i++) {
                        if (result.recordsets[i].features) {
                            for (j=0; j<result.recordsets[i].features.length; j++) {
                                feature = result.recordsets[i].features[j];
				if(types=="民俗旅游户@beijing"){
					feature.style = style;
				}else if(types=="民俗旅游村@beijing" ){
					feature.style = style1;
				}else if(types=="休闲农业园区@beijing"){
					feature.style = style2;
				}else{
					feature.style = style;
				};
                                features.push(feature);
                            }
                        }
                    }
		featureType[types] = features;
                }
			
		
				
                vectorLayer.addFeatures(features);
                select.activate();
				
            }

            //SQL查询(省会)失败时出发的事件
            function processFailedCapital(e) {
                alert(e.error.errorMsg);
            }
			 
            function processFailed(e) {
                alert(e.error.errorMsg);
            }
			var infowin = null;
            //清除全部要素
            function clearFeatures(){
                if(vectorLayer.selectedFeatures.length > 0) {
                    map.removePopup(vectorLayer.selectedFeatures[0].popup);
                }
				map.setCenter(new SuperMap.LonLat(12975695.47 , 4817251.51), 2);        
                vectorLayer.removeAllFeatures();
                markerLayer.clearMarkers();
                closeInfoWin();
            }
			function closeInfoWin(){
                if(infowin){
                    try{
                        infowin.hide();
                        infowin.destroy();
                    }
                    catch(e){}
                }
            }
				   
         
</script>
<body>
<#include "/template/sn_header.ftl"> 
<div class="wrapper" id="wrapper">
    	<div class="container">
            <div class="row mgt15">
            	<div class="col-md-12">
                    <ul class="map_titList clearfix">
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('民俗旅游村@beijing')">民俗旅游村</span></li>
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('民俗旅游户@beijing')">民俗旅游户</span></li>
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('休闲农业园区@beijing')">休闲农业园区</span></li>
                        <li><span class="hvr-underline-from-right">星级园区</span></li>
                        <li><span class="hvr-underline-from-right">最美乡村</span></li>
                        <!--<li class="lastOne"><span class="hvr-underline-from-right">最美乡村</span></li>-->
                    </ul>
                </div>
            </div>
            <div class="row mgt15">
            	<div class="col-md-12" style="margin-bottom:15px;">
                	<div id="map" class="show_mapOne"></div>
                </div>
            </div>
        </div>
    </div>
    <!--footer开始-->
    <#include "/template/sn_footer.ftl">
    
    <script type="text/javascript" src="/html/sn-static/static/js/myMove.js"></script>
</body>
</html>

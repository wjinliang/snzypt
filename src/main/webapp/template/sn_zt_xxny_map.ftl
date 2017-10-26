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
            var map, local, layer, vectorLayer, features, select, tempLayer , drag, delIndex = 0, editEnable = false,control, queryBounds, markerLayer,drawFeature,layerWorld,
            //设置图层样式
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
            },transformControl,
			host = "http://172.24.61.42:8090",
            url1=host+"/iserver/services/map-Shenong4/rest/maps/mslymaps";
            function init(){
                /*
                 * 不支持canvas的浏览器不能运行该范例
                 * android 设备也不能运行该范例*/
                var broz = SuperMap.Util.getBrowser();

                if(!document.createElement('canvas').getContext) {
                    alert('您的浏览器不支持 canvas，请升级');
                    return;
                } else if (broz.device === 'android') {
                    alert('您的设备不支持高性能渲染，请使用pc或其他设备');
                    return;
                }

                //加载map控件
                map = new SuperMap.Map("map",{controls: [
                    new SuperMap.Control.LayerSwitcher(),
                    new SuperMap.Control.ScaleLine(),
                    new SuperMap.Control.Zoom(),
                    new SuperMap.Control.Navigation({
                        dragPanOptions: {
                            enableKinetic: true 
                        }
                    })], units: "m"
                });
                //初始化图层
                layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("mslymaps", url1, {transparent: true, cacheEnabled: true}, {maxResolution:"auto"});
                layerWorld.events.on({"layerInitialized":addLayer});
                //初始化Vector图层
                vectorLayer = new SuperMap.Layer.Vector("Vector Layer", {renderers: ["Canvas2"]});
				//鹰眼控件
				overviewmap = new SuperMap.Control.OverviewMap();
				//属性minRectSize：鹰眼范围矩形边框的最小的宽度和高度。默认为8pixels
				overviewmap.minRectSize = 20;
				//layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("ZTshenong", url1);     //获取图层服务地址
				layerWorld.events.on({"layerInitialized": addLayer});

				//给在vector图层上所选择的要素初始化
                select = new SuperMap.Control.SelectFeature(vectorLayer, {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect, repeat:true});
                map.addControl(select);
				

               
            }
			
            //添加图层
            function addLayer() {
                map.addLayers([vectorLayer,layerWorld]);
                map.setCenter(new SuperMap.LonLat(524221.11, 337620.34), 0);        
				//map.addControl(new SuperMap.Control.MousePosition()) ;
				map.addControl(overviewmap);
            }
            //要素被选中时调用此函数
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
                            "<span style='font-weight: bold; font-size: 18px;'>详细信息</span><br>";
			  // var val = document.getElementById("text1").value;
				
				//if(val.length !=0){				
				//	if(val.indexOf("村")>0){
							contentHTML += "名称：" + feature.attributes["商户名称"] + "<br>";
						
			//			}else{
				//			contentHTML += "SZ_QX：" + feature.attributes["SZ_QX"] + "<br>";
			//			} 
			//		}else{
			//			contentHTML += "SZ_QX：" + feature.attributes["SZ_QX"] + "<br>";
			//		}
				
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
				
         
            //关闭弹出窗口
            function onPopupClose(evt) {
            }
            //清除要素时调用此函数
            function onFeatureUnselect(feature) {
                map.removePopup(feature.popup);
                feature.popup.destroy();
                feature.popup = null;
            }
			 function drawGeometry() {
					//先清除上次的显示结果
					clearFeatures();

					drawFeature.activate();
			}
			
			
               //SQL查询
		    var types = "";
			var featureType = [];
              function queryBySQL(valueParam) {
			  vectorLayer.removeAllFeatures();
				// var obj = document.getElementById(""+valueParam+"");
				//var valu = obj.checked;
			   // if(!valu){
				//	featrues = featureType[valueParam];
				//	 vectorLayer.removeFeatures(featrues);
//}else{
				//	if(featureType[valueParam]){
				//			vectorLayer.addFeatures(featureType[valueParam]);
				//			return;
				//	}			
					   types = valueParam;
						delIndex =0;
						var queryParamCapital, queryBySQLParamsCapital, queryBySQLServiceCapital,params,type,param;
						type = valueParam;
						params = "ID > 0";
						//param = document.getElementById("text1").value;
						//if(param.length != 0){
					//				type = "";
//params = "商户名称='"+params+"'";				
//}
						
						//type = "ST_BIG_RESERVOIR@221";
						//params = "SZ_XZC='"+param+"'";
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
         //   }
			
			function queryByClick() {
						var queryParamCapital,queryParamCapital1,queryParamCapital2, queryBySQLParamsCapital, queryBySQLServiceCapital,params,param;
						param = document.getElementById("text1").value;
				
						params = "商户名称='"+param+"'";				
						alert(params);
						queryParamCapital = new SuperMap.REST.FilterParameter({
							name: "民俗旅游村@休闲农业数据",
							attributeFilter:params 
						}),
						queryParamCapital1 = new SuperMap.REST.FilterParameter({
							name:"民俗旅游户@休闲农业数据",
							attributeFilter:params 
						}),
						queryParamCapital2 = new SuperMap.REST.FilterParameter({
							name: "休闲农业园区@休闲农业数据",
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
									if(types=="民俗旅游户@休闲农业数据"){
										feature.style = style2;
									}else if(types=="民俗旅游村@休闲农业数据" ){
										feature.style = style1;
									}else if(types=="休闲农业园区@休闲农业数据"){
										feature.style = style;
									}else{
											feature.style = style2;
									}
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
				map.setCenter(new SuperMap.LonLat(524221.11, 337620.34), 1);        
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
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('民俗旅游村@休闲农业数据')">民俗旅游村</span></li>
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('民俗旅游户@休闲农业数据')">民俗旅游户</span></li>
                        <li><span class="hvr-underline-from-right" onclick="queryBySQL('休闲农业园区@休闲农业数据')">休闲农业园区</span></li>
                        <li><span class="hvr-underline-from-right">特色农产品</span></li>
                        <li><span class="hvr-underline-from-right">星级园区</span></li>
                        <li class="lastOne"><span class="hvr-underline-from-right">最美乡村</span></li>
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

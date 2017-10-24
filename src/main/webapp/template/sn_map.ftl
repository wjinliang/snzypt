<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">

</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15"  style="margin-bottom:15px;">
            	<div class="col-md-4 col-lg-4">
                	<div class="input-group" style="border:1px solid #CCC">
                    	<input type="text" class="form-control input-alter" placeholder="请输入关键字搜索">
                        <span class="input-group-btn">
                        	<button class="btn btn-alter" type="button">搜索</button>
                        </span>
                    </div>
                    <div class="mgt15">
                            <div class="item-title">
                                <div class="item-title-partl">
                                    <span>图层分类</span>
                                </div>
                            </div>
                            <div class="tabs-vertical">
                                 <ul class="map-list clearfix">
                                     <li>
                                         <a class="tab-active" data-index="2" href="#">畜牧养殖</a>
                                     </li>
                                     <li>
                                         <a data-index="0" href="#">涉农企业</a>
                                     </li>
                                     <li>
                                         <a data-index="1" href="#">种植生产</a>
                                     </li>
                                     <li>
                                         <a data-index="3" href="#">市场资源</a>
                                     </li>
                                     <li>
                                         <a data-index="4" href="#">农业科技</a>
                                     </li>
                                 </ul>
                                 <div class="detail-con">
                                    <div class="tabs-content-placeholder">
                                        <div class="" id="zzsc" style="height:367px;">
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_GY@221');">
                                            	<input type="checkbox" name="genre" id="sn1" value="action" />
                								<label for="sn1">涉农企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_MP@221');">
                                            	<input type="checkbox" name="genre" id="sn2" value="action" />
                								<label for="sn2">农加工企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_HHJD@221');">
                                            	<input type="checkbox" name="genre" id="sn3" value="action" />
                								<label for="sn3">农机服务组织</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sn4" value="action" />
                								<label for="sn4">观光农业示范园</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sn5" value="action" />
                								<label for="sn5">兽药经营企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sn6" value="action" />
                								<label for="sn6">观光果园</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sn7" value="action" />
                								<label for="sn7">饲料企业</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style="height:367px;">
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_GY@221');">
                                            	<input type="checkbox" name="genre" id="snp01" value="action" />
                								<label for="snp01">果园基地</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_MP@221');">
                                            	<input type="checkbox" name="genre" id="snp02" value="action" />
                								<label for="snp02">苗圃基地</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_HHJD@221');">
                                            	<input type="checkbox" name="genre" id="snp03" value="action" />
                								<label for="snp03">花卉基地</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snp04" value="action" />
                								<label for="snp04">三品基地</label>
                                            </div>
                                        </div>
                                        <div class="tab-content-active" id="zzsc" style="height:367px;">
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_GY@221');">
                                            	<input type="checkbox" name="genre" id="snxm01" value="action" />
                								<label for="snxm01">羊养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_MP@221');">
                                            	<input type="checkbox" name="genre" id="snxm02" value="action" />
                								<label for="snxm02">鸭养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('LY_ST_HHJD@221');">
                                            	<input type="checkbox" name="genre" id="snxm03" value="action" />
                								<label for="snxm03">生猪养殖场</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm04" value="action" />
                								<label for="snxm04">蛋鸡养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm05" value="action" />
                								<label for="snxm05">水产养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm06" value="action" />
                								<label for="snxm06">肉牛养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm07" value="action" />
                								<label for="snxm07">肉鸡养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm08" value="action" />
                								<label for="snxm08">奶牛养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm09" value="action" />
                								<label for="snxm09">畜禽养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm10" value="action" />
                								<label for="snxm10">动物诊疗单位</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snxm11" value="action" />
                								<label for="snxm11">动物卫生防疫所</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style="height:367px;">
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snm01" value="action" />
                								<label for="snm01">经营市场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snm02" value="action" />
                								<label for="snm02">农副市场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snm03" value="action" />
                								<label for="snm03">超市</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style="height:367px;">
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sna01" value="action" />
                								<label for="sna01">协调员工作站</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sna02" value="action" />
                								<label for="sna02">田间学校</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sna03" value="action" />
                								<label for="sna03">农业技术推广站</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL('ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="sna04" value="action" />
                								<label for="sna04">科技示范园区</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-md-8 col-lg-8" style="padding-left:0px;">
               		<div class="real-map" id="mapDiv">
			<div id="sumap" style="height:500px;"></div>
                    	<!--<img src="/html/sn-static/static/image/map.png" height="500" style="width:100%;">-->
                    </div> 	
                </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
	
        <script src="/html/sn-static/static/sumap/libs/SuperMap.Include.js"></script>
	<script type="text/javascript">
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
			style3 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker_select.png",
				graphicWidth: 10,
                graphicHeight: 10,
                name: "captial"
            },
			style4 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker2.png",
				graphicWidth: 10,
                graphicHeight: 10,
                name: "captial"
            },
			style5 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker_blue.png",
                name: "captial"
            },
			style6 = {
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker_red.png",
                graphicWidth: 13,
                graphicHeight: 16,
                name: "town"
            },
            style7 = {
                pointRadius: 10,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/marker_black.png",
                name: "city"
            },
            style8 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/markerbig_select.png",
                name: "captial"
            },
			style9 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/markerflag_select.png",
                name: "captial"
            },
			style10 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/20.png",
                name: "captial"
            },
			styleMP11 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/29.png",
                name: "captial"
            },
			styleMP12 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/circle.png",
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
            url1=host+"/iserver/services/map-Shenong/rest/maps/sheNongCQ";
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
                map = new SuperMap.Map("sumap",{controls: [
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
                layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("ZTshenong", url1, {transparent: true, cacheEnabled: true}, {maxResolution:"auto"});
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
				  markerLayer = new SuperMap.Layer.Markers("Markers");//创建一个有标签的图层

                drawFeature = new SuperMap.Control.DrawFeature(vectorLayer, SuperMap.Handler.Box,{"handlerOptions":{"cursorCSS":"crosshair"}});
                drawFeature.events.on({"featureadded": drawCompleted});
                map.addControl(drawFeature);
            }
			
            //添加图层
            function addLayer() {
                map.addLayers([vectorLayer,markerLayer,layerWorld]);
                map.setCenter(new SuperMap.LonLat(538039.74, 287458.17), 2);        
				map.addControl(new SuperMap.Control.MousePosition()) ;
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
					
				
					//contentHTML += "属地：" + feature.attributes["SZ_XZ"] + "<br>";
					contentHTML += "名称：" + feature.attributes["MC"] + "<br>";
				
                    contentHTML += "ID：" + feature.attributes["ID"] + "<br>";
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
					var a = feature.attributes["SmX"];
					var b = feature.attributes["SmY"];
					map.setCenter(new SuperMap.LonLat(a,b),8); 
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
            function queryBySQL(valueParam) {
               // vectorLayer.removeAllFeatures();
                delIndex =0;
                var queryParamCapital, queryBySQLParamsCapital, queryBySQLServiceCapital,params,type;
				type = valueParam;
				params = "ID > 0";
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
			
			
			//总类查询
			function queryAll(typeClass){
				clearFeatures();
				var btns = new Array();
				switch(typeClass){
					case 'span2':
						btns = ["YZ_ST_YZC@221","YZ_ST_YANG@221","YZ_ST_YA@221","YZ_ST_SHENGZHU@221","YZ_ST_DANJI@221", 
				            "YZ_ST_SCYZC@221","YZ_ST_ROUNIU@221","YZ_ST_ROUJI@221","YZ_ST_NAINIU@221","ZYDP_ST_YZ_XQLZC@221",
							"YZ_ST_DWZLDW@221","YZ_ST_DWWSFYS@221"];
							break;
					case 'span3':
						btns = ["SCDP_ST_JYSC@221","SCDP_ST_CGXPT_NFSC@221","SCDP_ST_CGXPT_CS@221"];
							break;
					case 'span4':
						btns = ["KJZC_KJFW_ST_XTYGZZ@221","KJZC_KJFW_ST_TJXX@221","KJSF_ST_WLWSDJS@221","KJ_ST_NYJSTGZ@221","KJ_ST_KJSFYQ@221"];
							break;
					case 'span5':
						btns = ["ZH_ST_SNQY@221","ZH_ST_NJGQY@221","ZH_ST_NJFWZZ@221","ZH_ST_GGNYSFY@221","YZ_ST_SYJYQY@221", 
				            "ZYDP_ST_LY_GGGY@221","YZ_ST_SLQY@221"];
							break;	
					case 'span6':
						btns = ["LY_ST_GY@221","LY_ST_MP@221","LY_ST_HHJD@221","ZZ_ST_SPBASE@221"];
							break;
				}
				 
				            
				for(var i = 0;i<btns.length;i++){
					queryBySQL(btns[i]);
				}
			}
			
            //SQL查询(省会)成功时触发此事件
			var num = 0;
            function processCompletedCapital(queryEventArgs) {
				num = num+1;
                var i, j, feature,
                        result = queryEventArgs.result;
                features = [];
                if (result && result.recordsets) {
                    for (i=0; i<result.recordsets.length; i++) {
                        if (result.recordsets[i].features) {
                            for (j=0; j<result.recordsets[i].features.length; j++) {
                                feature = result.recordsets[i].features[j];
                                switch(num){
									case 1:
										feature.style = style1;
										break;
									case 2:
										feature.style = style2;
										break;
									case 3:
										feature.style = style3;
										break;
									case 4:
										feature.style = style4;
										break;
									case 5:
										feature.style = style5;
										break;
									case 6:
										feature.style = style6;
										break;
									case 7:
										feature.style = style7;
										break;
									case 8:
										feature.style = style8;
										break;
									case 9:
										feature.style = style9;
										break;
									case 10:
										feature.style = style10;
										break;
									case 11:
										feature.style = style11;
										break;
									case 12:
										feature.style = style12;
										break;
									default:
										feature.style = style1;
										break;
								}	
								features.push(feature);
                            }
                        }
                    }
                }
			
		
				
                vectorLayer.addFeatures(features);
                select.activate();
				
            }

            //SQL查询(省会)失败时出发的事件
            function processFailedCapital(e) {
                alert(e.error.errorMsg);
            }
			  function drawCompleted(obj){
                drawFeature.deactivate();
                var feature = obj.feature;
                feature.style = styleBound;
                vectorLayer.addFeatures(feature);
                var queryBounds = feature.geometry.bounds;

                var queryParam, queryByBoundsParams, queryService;
                queryParam = new SuperMap.REST.FilterParameter({name: "ST_COUNTY_DIA_PT@221"});//FilterParameter设置查询条件，name是必设的参数，（图层名称格式：数据集名称@数据源别名）
                queryByBoundsParams = new SuperMap.REST.QueryByBoundsParameters({queryParams: [queryParam], bounds: queryBounds});//queryParams查询过滤条件参数数组。bounds查询范围
                queryService = new SuperMap.REST.QueryByBoundsService(url1, {
                    eventListeners: {
                        "processCompleted": processCompleted,
                        "processFailed": processFailed
                    }
                });
                queryService.processAsync(queryByBoundsParams);//向服务端传递参数，然后服务端返回对象
            }
            function processCompleted(queryEventArgs) {
                var i, j, result = queryEventArgs.result,marker;//queryEventArgs服务端返回的对象
                if (result && result.recordsets) {
                    for (i=0, recordsets=result.recordsets, len=recordsets.length; i<len; i++) {
                        if (recordsets[i].features) {
                            for (j=0; j<recordsets[i].features.length; j++) {
                                var f = recordsets[i].features[j];
                                var point = f.geometry,
                                        size = new SuperMap.Size(44, 33),
                                        offset = new SuperMap.Pixel(-(size.w/2), -size.h),
                                        icon = new SuperMap.Icon("/html/sn-static/static/sumap/examples/images/marker_black.png", size, offset);
                                marker = new SuperMap.Marker(new SuperMap.LonLat(point.x, point.y), icon);
                                marker.sm_capital = f.attributes.CAPITAL;
                                marker.events.on({
                                    "click":openInfoWin,
									"touchstart":openInfoWin,        //假如要在移动端的浏览器也实现点击弹框，则在注册touch类事件
                                    "scope": marker
                                });
                                markerLayer.addMarker(marker);
                            }
                        }
                    }
                }
            }
            function processFailed(e) {
                alert(e.error.errorMsg);
            }
            var infowin = null;
            function openInfoWin(){
		
                closeInfoWin();
				alert("功能暂停");
                //var marker = this;
                //var lonlat = marker.getLonLat();
                //var contentHTML = "<div style='font-size:.8em; opacity: 0.8; overflow-y:hidden;'>";
                //contentHTML += "<div>"+marker+"</div></div>";
                //var size = new SuperMap.Size(0, 33);
                //var offset = new SuperMap.Pixel(0, -size.h);
                //var icon = new SuperMap.Icon("/html/sn-static/static/sumap/examples/images/marker_black.png", size, offset);
                //var popup = new SuperMap.Popup.FramedCloud("popwin",
                //        new SuperMap.LonLat(lonlat.lon,lonlat.lat),
                //        null,
                //        contentHTML,
                //        icon,
                //        true);

                //infowin = popup;
                //map.addPopup(popup);
            }
			var infowin = null;
            //清除全部要素
            function clearFeatures(){
                if(vectorLayer.selectedFeatures.length > 0) {
                    map.removePopup(vectorLayer.selectedFeatures[0].popup);
                }
				num=0;
				map.setCenter(new SuperMap.LonLat(538039.74, 287458.17), 2);    
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
			

	$(function(){
	       init();
	    });
</script>
</body>
</html>

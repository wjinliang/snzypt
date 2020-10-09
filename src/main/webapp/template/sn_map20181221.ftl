<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div >
	<!--<div class="container">改为宽版-->
        	<div class="row mgt15"  style="margin-bottom:15px;">
            	<div class="col-md-3 col-lg-3">
                	<!--<div class="input-group" style="border:1px solid #CCC">
                    	<input type="text" class="form-control input-alter" placeholder="请输入关键字搜索">
                        <span class="input-group-btn">
                        	<button class="btn btn-alter" type="button">搜索</button>
                        </span>
                    </div>-->
                    <div class="">
                            <!--<div class="item-title" style="margin-top: 0px;">
                                <div class="item-title-partl">
                                    <span>图层分类</span>
                                </div>
                            </div>-->
                            <div class="tabs-vertical">
                                 <ul class="map-list clearfix">
									 <li>
                                         <a class="tab-active" data-index="0"  href="#">基础地理</a>
                                     </li>
									  <li>
                                         <a data-index="1" href="#">农业资源</a>
                                     </li>
                                     <li>
                                         <a data-index="2" href="#">涉农企业</a>
                                     </li>
                                     <li>
                                         <a data-index="3" href="#">种植生产</a>
                                     </li>
                                     <li>
                                         <a data-index="4" href="#">畜牧养殖</a>
                                     </li>
                                     <li>
                                         <a data-index="5" href="#">市场资源</a>
                                     </li>
                                     <li>
                                         <a data-index="6" href="#">农业科技</a>
                                     </li> 
                                 </ul>
                                 <div class="detail-con">
                                    <div class="tabs-content-placeholder">
										<div class="tab-content-active" id="zzsc" style=" height: 700px;">
                                            <!--<div class="custom-checkbox" onclick="showHide(this,'agriland')">
                                            	<input type="checkbox" name="genre" id="sts01" value="action" />
                								<label for="sts01">行政区县</label>
                                            </div>-->
                                            <div class="custom-checkbox" onclick="showHide(this,'town')">
                                            	<input type="checkbox" name="genre" id="sts02" value="action" />
                								<label for="sts02">行政乡镇街道</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="showHide(this,'village')">
                                            	<input type="checkbox" name="genre" id="sts03" value="action" />
                								<label for="sts03">行政村</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="showHide(this,'jmd')">
                                            	<input type="checkbox" name="genre" id="sts04" value="action" />
                								<label for="sts04">居民点</label>
                                            </div>
											<div class="custom-checkbox" onclick="showHide(this,'road')">
                                            	<input type="checkbox" name="genre" id="sts05" value="action" />
                								<label for="sts05">道路</label>
                                            </div>
											<div class="custom-checkbox" onclick="showHide(this,'gl')">
                                            	<input type="checkbox" name="genre" id="sts06" value="action" />
                								<label for="sts06">公路</label>
                                            </div>
											<div class="custom-checkbox" onclick="showHide(this,'highway')">
                                            	<input type="checkbox" name="genre" id="sts07" value="action" />
                								<label for="sts07">高速公路</label>
                                            </div>
                                        </div>
										<div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="showHide(this,'nyjj')">
                                            	<input type="checkbox" name="genre" id="sny01" value="action" />
                								<label for="sny01">农业机井</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="showHide(this,'tryf')">
                                            	<input type="checkbox" name="genre" id="sny02" value="action" />
                								<label for="sny02">土壤养分</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="showHide(this,'agriland')">
                                            	<input type="checkbox" name="genre" id="sny03" value="action" />
                								<label for="sny03">农用地块</label>
                                            </div>
                                          <!--  <div class="custom-checkbox" onclick="showHide(this,'nydfddj')">
                                            	<input type="checkbox" name="genre" id="sny04" value="action" />
                								<label for="sny04">农用地分等定级</label>
                                            </div>-->
                                        </div>
                                        <div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZH_ST_SNQY@221');">
                                            	<input type="checkbox" name="genre" id="sn1" value="action" />
                								<label for="sn1">涉农企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZH_ST_NJGQY@221');">
                                            	<input type="checkbox" name="genre" id="sn2" value="action" />
                								<label for="sn2">农加工企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZH_ST_NJFWZZ@221');">
                                            	<input type="checkbox" name="genre" id="sn3" value="action" />
                								<label for="sn3">农机服务组织</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZH_ST_GGNYSFY@221');">
                                            	<input type="checkbox" name="genre" id="sn4" value="action" />
                								<label for="sn4">观光农业示范园</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_SYJYQY@221');">
                                            	<input type="checkbox" name="genre" id="sn5" value="action" />
                								<label for="sn5">兽药经营企业</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZYDP_ST_LY_GGGY@221');">
                                            	<input type="checkbox" name="genre" id="sn6" value="action" />
                								<label for="sn6">观光果园</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_SLQY@221');">
                                            	<input type="checkbox" name="genre" id="sn7" value="action" />
                								<label for="sn7">饲料企业</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'LY_ST_GY@221');">
                                            	<input type="checkbox" name="genre" id="snp01" value="action" />
                								<label for="snp01">果园基地</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'LY_ST_MP@221');">
                                            	<input type="checkbox" name="genre" id="snp02" value="action" />
                								<label for="snp02">苗圃基地</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'LY_ST_HHJD@221');">
                                            	<input type="checkbox" name="genre" id="snp03" value="action" />
                								<label for="snp03">花卉基地</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZZ_ST_SPBASE@221');">
                                            	<input type="checkbox" name="genre" id="snp04" value="action" />
                								<label for="snp04">三品基地</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_YANG@221');">
                                            	<input type="checkbox" name="genre" id="snxm01" value="action" />
                								<label for="snxm01">羊养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_YA@221');">
                                            	<input type="checkbox" name="genre" id="snxm02" value="action" />
                								<label for="snxm02">鸭养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_SHENGZHU@221');">
                                            	<input type="checkbox" name="genre" id="snxm03" value="action" />
                								<label for="snxm03">生猪养殖场</label>
                                            </div>	
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_DANJI@221');">
                                            	<input type="checkbox" name="genre" id="snxm04" value="action" />
                								<label for="snxm04">蛋鸡养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_SCYZC@221');">
                                            	<input type="checkbox" name="genre" id="snxm05" value="action" />
                								<label for="snxm05">水产养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_ROUNIU@221');">
                                            	<input type="checkbox" name="genre" id="snxm06" value="action" />
                								<label for="snxm06">肉牛养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_ROUJI@221');">
                                            	<input type="checkbox" name="genre" id="snxm07" value="action" />
                								<label for="snxm07">肉鸡养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_NAINIU@221');">
                                            	<input type="checkbox" name="genre" id="snxm08" value="action" />
                								<label for="snxm08">奶牛养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'ZYDP_ST_YZ_XQLZC@221');">
                                            	<input type="checkbox" name="genre" id="snxm09" value="action" />
                								<label for="snxm09">畜禽养殖场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_DWZLDW@221');">
                                            	<input type="checkbox" name="genre" id="snxm10" value="action" />
                								<label for="snxm10">动物诊疗单位</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'YZ_ST_DWWSFYS@221');">
                                            	<input type="checkbox" name="genre" id="snxm11" value="action" />
                								<label for="snxm11">动物卫生防疫所</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'SCDP_ST_JYSC@221');">
                                            	<input type="checkbox" name="genre" id="snm01" value="action" />
                								<label for="snm01">经营市场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'SCDP_ST_CGXPT_NFSC@221');">
                                            	<input type="checkbox" name="genre" id="snm02" value="action" />
                								<label for="snm02">农副市场</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'SCDP_ST_CGXPT_CS@221');">
                                            	<input type="checkbox" name="genre" id="snm03" value="action" />
                								<label for="snm03">超市</label>
                                            </div>
                                        </div>
                                        <div class="" id="zzsc" style=" height: 700px;">
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'KJZC_KJFW_ST_XTYGZZ@221');">
                                            	<input type="checkbox" name="genre" id="sna01" value="action" />
                								<label for="sna01">协调员工作站</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'KJZC_KJFW_ST_TJXX@221');">
                                            	<input type="checkbox" name="genre" id="sna02" value="action" />
                								<label for="sna02">田间学校</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'KJ_ST_NYJSTGZ@221');">
                                            	<input type="checkbox" name="genre" id="sna03" value="action" />
                								<label for="sna03">农业技术推广站</label>
                                            </div>
                                            <div class="custom-checkbox" onclick="queryBySQL(this,'KJ_ST_KJSFYQ@221');">
                                            	<input type="checkbox" name="genre" id="sna04" value="action" />
                								<label for="sna04">科技示范园区</label>
                                            </div>
                                        </div>
										
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                <div class="col-md-9 col-lg-9" style="padding-left:0px;">
               		<div id="mapDiv">
               		<!--<div class="real-map" id="mapDiv">-->
			<div id="sumap" style="height:700px;"></div>
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
                graphicWidth: 10,
                graphicHeight: 10,
                name: "captial"
            },
			style11 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/29.png",
                graphicWidth: 12,
                graphicHeight: 12,
                name: "captial"
            },
			style12 = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/circle.png",
                graphicWidth: 10,
                graphicHeight: 10,
                name: "captial"
            },
			styleBound = {
                strokeColor: "#304DBE",
                strokeWidth: 1,
                pointerEvents: "visiblePainted",
                fillColor: "#304DBE",
                fillOpacity: 0.3
            },transformControl,town,village,jmd,road,gl,highway,nyjj,tryf,agriland,nydfddj,
           //host = "http://172.24.61.42:8090";
            //var url1=host+"/iserver/services/map-Shenong2/rest/maps/sheNongCQ";
           // var url2=host+"/iserver/services/map-Shenong2/rest/maps/town";
	    host = "http://172.24.61.42:8090";
            var url1=host+"/iserver/services/map-ugcv5-BaseMap/rest/maps/BaseMap";
            var url2=host+"/iserver/services/map-ugcv5-town/rest/maps/town";
			var url3=host+"/iserver/services/map-Shenong2/rest/maps/village";
			var url4=host+"/iserver/services/map-Shenong2/rest/maps/jmd";
			var url5=host+"/iserver/services/map-Shenong2/rest/maps/road";
			var url6=host+"/iserver/services/map-Shenong2/rest/maps/gl";
			var url7=host+"/iserver/services/map-Shenong2/rest/maps/highway";
			var url8=host+"/iserver/services/map-Shenong2/rest/maps/nyjj";
			var url9=host+"/iserver/services/map-Shenong2/rest/maps/tryf";
			var url10=host+"/iserver/services/map-Shenong2/rest/maps/agriland";
			var url11=host+"/iserver/services/map-Shenong2/rest/maps/nydfddj";
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
                    //new SuperMap.Control.LayerSwitcher(),
                    new SuperMap.Control.ScaleLine(),
		    //new SuperMap.Control.OverviewMap(),
                    new SuperMap.Control.Zoom(),
                    new SuperMap.Control.Navigation({
                        dragPanOptions: {
                            enableKinetic: true
                        }
                    })], allOverlays: true
                });
                //初始化图层
				
                layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("map", url1, {transparent: true, cacheEnabled: true}, {maxResolution:"auto"});
                layerWorld.events.on({"layerInitialized":addLayer2});
				//layerWorld.setLayerIndex(0);
               
				//鹰眼控件
				//overviewmap = new SuperMap.Control.OverviewMap();
				//属性minRectSize：鹰眼范围矩形边框的最小的宽度和高度。默认为8pixels
				//overviewmap.minRectSize = 20;
				//layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("ZTshenong", url1);     //获取图层服务地址
				//layerWorld.events.on({"layerInitialized": addLayer2});
				//初始化Vector图层
				vectorLayer = new SuperMap.Layer.Vector("Vector Layer", {renderers: ["Canvas2"]});
				//给在vector图层上所选择的要素初始化
                select = new SuperMap.Control.SelectFeature(vectorLayer, {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect, repeat:true});
                 map.addControl(select);
				//  markerLayer = new SuperMap.Layer.Markers("Markers");//创建一个有标签的图层
            }
			function addLayer2(){
                town = new SuperMap.Layer.TiledDynamicRESTLayer("行政乡镇街道", url2, {transparent: true, cacheEnabled: true});
                town.events.on({"layerInitialized": addLayer3});
				town.setVisibility(false);
            }
			function addLayer3(){
                village = new SuperMap.Layer.TiledDynamicRESTLayer("行政村", url3, {transparent: true, cacheEnabled: true});
                village.events.on({"layerInitialized": addLayer4});
				village.setVisibility(false);
            }
			function addLayer4(){
                jmd = new SuperMap.Layer.TiledDynamicRESTLayer("居民点", url4, {transparent: true, cacheEnabled: true});
                jmd.events.on({"layerInitialized": addLayer5});
				jmd.setVisibility(false);
            }
			function addLayer5(){
                road = new SuperMap.Layer.TiledDynamicRESTLayer("道路", url5, {transparent: true, cacheEnabled: true});
                road.events.on({"layerInitialized": addLayer6});
                road.setVisibility(false);
            }
			function addLayer6(){
                gl = new SuperMap.Layer.TiledDynamicRESTLayer("公路", url6, {transparent: true, cacheEnabled: true});
                gl.events.on({"layerInitialized": addLayer7});
				gl.setVisibility(false);
            }
			function addLayer7(){
                highway = new SuperMap.Layer.TiledDynamicRESTLayer("高速公路", url7, {transparent: true, cacheEnabled: true});
                highway.events.on({"layerInitialized": addLayer8});
				highway.setVisibility(false);
            }
			function addLayer8(){
                nyjj = new SuperMap.Layer.TiledDynamicRESTLayer("农业机井", url8, {transparent: true, cacheEnabled: true});
                nyjj.events.on({"layerInitialized": addLayer9});
				nyjj.setVisibility(false);
            }
			function addLayer9(){
                tryf = new SuperMap.Layer.TiledDynamicRESTLayer("土壤养分", url9, {transparent: true, cacheEnabled: true});
                tryf.events.on({"layerInitialized": addLayer10});
				tryf.setVisibility(false);
            }
			function addLayer10(){
                agriland = new SuperMap.Layer.TiledDynamicRESTLayer("农用地块", url10, {transparent: true, cacheEnabled: true});
                agriland.events.on({"layerInitialized": addLayer11});
				agriland.setVisibility(false);
            }
			function addLayer11(){
                nydfddj = new SuperMap.Layer.TiledDynamicRESTLayer("农用地分等定级", url11, {transparent: true, cacheEnabled: true});
                nydfddj.events.on({"layerInitialized": addLayer});
				nydfddj.setVisibility(false);
            }
            //添加图层
            function addLayer() {
                map.addLayers([layerWorld,vectorLayer,town,village,jmd,road,gl,highway,nyjj,tryf,agriland,nydfddj]);
               // map.setCenter(new SuperMap.LonLat(527473.55725, 324968.17), 1);      
		map.setCenter(new SuperMap.LonLat(12963813.48, 4916276.52), 2); 
				map.addControl(new SuperMap.Control.MousePosition()) ;
				//map.addControl(overviewmap);
            }
			function showHide(objs,valueParam){
				var valu = $(objs).find('label').attr('class');
					if(valu=='checked'){
						if(valueParam == "town"){
								town.setVisibility(false);
							}else if(valueParam == "village"){
								village.setVisibility(false);
							}else if(valueParam == "jmd"){
								jmd.setVisibility(false);
							}else if(valueParam == "road"){
								road.setVisibility(false);
							}else if(valueParam == "gl"){
								gl.setVisibility(false);
							}else if(valueParam == "highway"){
								highway.setVisibility(false);
							}else if(valueParam == "nyjj"){
								nyjj.setVisibility(false);
							}else if(valueParam == "tryf"){
								tryf.setVisibility(false);
							}else if(valueParam == "agriland"){
								agriland.setVisibility(false);
							}else if(valueParam == "nydfddj"){
								nydfddj.setVisibility(false);
							}					
					}else{
						if(valueParam == "town"){
								town.setVisibility(true);
							}else if(valueParam == "village"){
								village.setVisibility(true);
							}else if(valueParam == "jmd"){
								jmd.setVisibility(true);
							}else if(valueParam == "road"){
								road.setVisibility(true);
							}else if(valueParam == "gl"){
								gl.setVisibility(true);
							}else if(valueParam == "highway"){
								highway.setVisibility(true);
							}else if(valueParam == "nyjj"){
								nyjj.setVisibility(true);
							}else if(valueParam == "tryf"){
								tryf.setVisibility(true);
							}else if(valueParam == "agriland"){
								agriland.setVisibility(true);
							}else if(valueParam == "nydfddj"){
								nydfddj.setVisibility(true);
							}				
					}
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
				
                    //contentHTML += "ID：" + feature.attributes["ID"] + "<br>";
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
		    var types = "";
			var featureType = [];
            function queryBySQL(objs,valueParam) {
				var valu = $(objs).find('label').attr('class');
			    if(valu=='checked'){
					featrues = featureType[valueParam];
					vectorLayer.removeFeatures(featrues);
				}else{ 
					if(featureType[valueParam]){
							vectorLayer.addFeatures(featureType[valueParam]);
							return;
					}			
					   types = valueParam;
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
                               if(types=="YZ_ST_YZC@221" || types=="LY_ST_GY@221"|| types=="SCDP_ST_JYSC@221"|| types=="'KJZC_KJFW_ST_XTYGZZ@221"|| types=="ZH_ST_SNQY@221"){
										feature.style = style1;
									}else if(types=="YZ_ST_YANG@221"|| types=="LY_ST_MP@221"|| types=="SCDP_ST_CGXPT_NFSC@221"|| types=="KJZC_KJFW_ST_TJXX@221"|| types=="ZH_ST_NJGQY@221"){
										feature.style = style2;
									}else if(types=="YZ_ST_YA@221" || types=="LY_ST_HHJD@221"|| types=="SCDP_ST_CGXPT_CS@221"|| types=="KJ_ST_NYJSTGZ@221"|| types=="ZH_ST_NJFWZZ@221"){
										feature.style = style3;
									}else if(types=="YZ_ST_SHENGZHU@221"|| types=="ZZ_ST_SPBASE@221"|| types=="KJ_ST_KJSFYQ@221"|| types=="ZH_ST_GGNYSFY@221"){
										feature.style = style4;
									}else if(types=="YZ_ST_DANJI@221" ||types=="YZ_ST_SYJYQY@221"){
										feature.style = style5;
									}else if(types=="YZ_ST_SCYZC@221"||  types=="ZYDP_ST_LY_GGGY@221"){
										feature.style = style6;
									}else if(types=="YZ_ST_ROUNIU@221"||types=="YZ_ST_SLQY@221"){
										feature.style = style7;
									}else if(types=="YZ_ST_ROUJI@221"||types=="@221"){
										feature.style = style8;
									}else if(types=="YZ_ST_NAINIU@221" ||types=="@221"){
										feature.style = style9;
									}else if(types=="ZYDP_ST_YZ_XQLZC@221" || types=="@221"){
										feature.style = style10;
									}else if(types=="YZ_ST_DWZLDW@221" ){
										feature.style = style11;
									}else if(types=="YZ_ST_DWWSFYS@221"){
										feature.style = style12;
									}
								features.push(feature);
                            }
                        }
                    }
                }
				featureType[types] = features;
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
            function openInfoWin(){
		
                closeInfoWin();
				alert("功能暂停");
                //var marker = this;
                //var lonlat = marker.getLonLat();
                //var contentHTML = "<div style='font-size:.8em; opacity: 0.8; overflow-y:hidden;'>";
                //contentHTML += "<div>"+marker+"</div></div>";
                //var size = new SuperMap.Size(0, 33);
                //var offset = new SuperMap.Pixel(0, -size.h);
                //var icon = new SuperMap.Icon("examples/images/marker_black.png", size, offset);
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
				//map.setCenter(new SuperMap.LonLat(538039.74, 287458.17), 2);    
				map.setCenter(new SuperMap.LonLat(12963813.48, 4916276.52), 2); 
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
<style type="text/css">
   div.smMap { z-index: 0;
    padding: 0px!important;
    margin: 0px!important;
    cursor: url(../images/cursors/Pan.cur),default;
     border: 1px solid #fff; 
    }
</style>
</html>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
        <link rel="stylesheet" href="/html/shenong-app/css/mui.css">
        <link rel="stylesheet" href="/html/shenong-app/css/layout.css">
	<!--<script src='/html/sn-static/static/sumap/libs/SuperMap.Include.js'></script>-->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/html/sn-static/static/js/jquery.base64.js"></script>
<script type="text/javascript" src="/html/sn-static/static/js/tkmethod.js"></script>
<script type="text/javascript">   
 //加密方法。没有过滤首尾空格，即没有trim.    
//加密可以加密N次，对应解密N次就可以获取明文    
 function encodeBase64(mingwen,times){    
    var code="";    
    var num=1;    
    if(typeof times=='undefined'||times==null||times==""){    
       num=1;    
    }else{    
       var vt=times+"";    
       num=parseInt(vt);    
    }    
    if(typeof mingwen=='undefined'||mingwen==null||mingwen==""){    
    }else{    
        $.base64.utf8encode = true;    
        code=mingwen;    
        for(var i=0;i<num;i++){    
           code=$.base64.btoa(code);    
        }    
    }    
    return code;    
};  
</script>
	</head>
<body onload="initMap()">
    <div class="mui-content">
        <div class="index">
            <!-- 显示地图 -->
            <div class="show-map" id="cunqing"></div>
            <div class="search">
                <input type="search" id="searchInput" class="mui-input-clear" placeholder="输入乡村名称检索基本情况">
                <span class="serach-icon"></span>
            </div>
            <div class="show-detail">
                <h1 class="detail-tit"></h1>
                <div class="detail-con"></div>
                <div class="flower-logo"></div>
            </div>
        </div>
    </div>
</body>
<script src="/html/shenong-app/js/mui.min.js"></script>
 	<link rel="stylesheet" href="http://172.24.61.42:8090/iserver/services/map-ugcv5-cunqing/rest/static/javascriptForMaps/resource/theme/default/style.css" type="text/css" />
 	<script src="http://172.24.61.42:8090/iserver/services/map-ugcv5-cunqing/rest/static/jquery/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="http://172.24.61.42:8090/iserver/services/map-ugcv5-cunqing/rest/static/javascriptForMaps/SuperMap.js"></script>
    <script src="http://172.24.61.42:8090/iserver/services/map-ugcv5-cunqing/rest/static/javascriptForMaps/resource/QueryResultLayer.js"></script>
   
<script type="text/javascript">
    mui.init();
    	var villageName = localStorage.getItem('villageName');
	if(villageName){
		$("#searchInput").val(villageName);
    		var villageCode = localStorage.getItem('villageCode');
		mui.ajax('findVillageInfoByCode', {
                data: {villageCode: villageCode},
                dataType: 'json', //服务器返回json格式数据
                type: 'post', //HTTP请求类型
				async:false,
                timeout: 10000, //超时时间设置为10秒；
                success: function(res) {
                    // var result = eval('(' + data + ')'); //js原生方法解析json字符串为json对象
					var spanStr = '';
					$(".show-detail").show();
					$(".detail-tit").text(res.data.village.mc);
					setTimeout(function(){
						queryBySQL(res.data.village.mc);
					 },1000);
					$(".detail-con").text(res.data.xclyJj);
					var honor = res.data.honor;
					if(honor){
						for(var i = 0; i<honor.length; i++){
							spanStr+="<span>"+honor[i]+"</span>";
						}
					}
					 $(".flower-logo").empty().append(spanStr);
					 //TODO 地图定位
                },
                error: function(xhr, type, errorThrown) {
					$(".show-detail").hide();
					mui.alert("服务器错误");
                }
            });
		
	}
	mui.plusReady(function() {
		 plus.geolocation.getCurrentPosition(translatePoint,function(e){
                    mui.toast("异常:" + e.message);
		 });
		var search = document.getElementById("searchInput");
		search.addEventListener("focus", function(e) {
			var ad = search.value;
			mui.openWindow({
				url: "search_list.htm",//跳转地址
				id:"searchInput",//id
				show: {
					aniShow: "slide-in-right",//页面显示动画，默认为”slide-in-right“；
					duration: 200,//页面动画持续时间，Android平台默认100毫秒，iOS平台默认200毫秒
					autoShow: true //页面loaded事件发生后自动显示，默认为true
				}
			})
		});
		/*
		* getLocation是自定义事件，为了获取searchList.html页面传过来的值
		*/
		window.addEventListener("getLocation", function(e) {
			document.getElementById("searchInput").value = e.detail.inputName;
			localStorage.setItem("villageCode", e.detail.inputVal); // 将村名存在localstorage里
			localStorage.setItem("villageName", e.detail.inputName); // 将村名存在localstorage里
			mui.ajax('/${application}/portal/app/findVillageInfoByCode', {
                data: {villageCode: e.detail.inputVal},
                dataType: 'json', //服务器返回json格式数据
                type: 'post', //HTTP请求类型
				async:false,
                timeout: 10000, //超时时间设置为10秒；
                success: function(res) {
                    // var result = eval('(' + data + ')'); //js原生方法解析json字符串为json对象
					var spanStr = '';
					$(".show-detail").show();
					$(".detail-tit").text(res.data.village.mc);
					$(".detail-con").text(res.data.xclyJj);
					var honor = res.data.honor;
					if(honor){
						for(var i = 0; i<honor.length; i++){
							spanStr+="<span>"+honor[i]+"</span>";
						}
					}
					 $(".flower-logo").empty().append(spanStr);
					 //TODO 地图定位
					 queryBySQL(res.data.village.mc);
                },
                error: function(xhr, type, errorThrown) {
					$(".show-detail").hide();
					mui.alert("服务器错误");
                }
            });
		});
	});
	function translatePoint(position){
	    var currentLon = position.coords.longitude;
	    var currentLat = position.coords.latitude;
	    //$("#cunqing").html("<div style='color:#aaa;font-size:10px;margin-top:-4px;'>当前位置坐标：("+currentLon+","+currentLat+")</div>");
	    //var gpsPoint = new BMap.Point(currentLon,currentLat);
	    //BMap.Convertor.translate(gpsPoint,2,initMap); //坐标转换
	}
	var styleCaptial = {
                pointRadius: 15,
                externalGraphic: "/html/sn-static/static/sumap/examples/images/markerflag.png",
                name: "captial"
            };
       var map, layer,vectorLayer, options,scaleCenter,
		host="http://172.24.61.42:8090",
        url = host+"/iserver/services/map-ugcv5-cunqing/rest/maps/cunqing",
	    url2=host+"/iserver/services/map-basemap/rest/maps/cunqing";
	function initMap(){
		options = {};
		map = new SuperMap.Map("cunqing",{controls:[], theme:null});
		var navigation = new SuperMap.Control.Navigation({dragPanOptions: {enableKinetic: true}});
		map.addControl(navigation);
		layer = new SuperMap.Layer.TiledDynamicRESTLayer("Map", url, {}, options);
		layer.events.on({"layerInitialized": addlayer});
		 //初始化Vector图层
                vectorLayer = new SuperMap.Layer.Vector("Vector Layer", {renderers: ["Canvas2"]});
		//给在vector图层上所选择的要素初始化
                select = new SuperMap.Control.SelectFeature(vectorLayer, {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect, repeat:true});
                map.addControl(select);
        }

        function addlayer() {
			map.addLayers([layer,vectorLayer]);
            map.setCenter(new SuperMap.LonLat(12974732.78 , 4821537.75), 1);  
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
                            "<span style='font-weight: bold; font-size: 12px;'>详细信息</span><br>";
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
					map.setCenter(new SuperMap.LonLat(a,b),1); 
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
            function queryBySQL(Pname) {
                vectorLayer.removeAllFeatures();
                delIndex =0;
                //查询中国的全部省会。
                var queryParamCapital, queryBySQLParamsCapital, queryBySQLServiceCapital,param,params,type;
				//param = document.getElementById("text1").value;
				type = "ST_VILLAGE_DIA_PT@221";
				params = "ID > 0";
				if(Pname.length != 0){
					type = "ST_VILLAGE_DIA_PT@221";
					params = "MC='"+Pname+"'";		
						
				}
			
                queryParamCapital = new SuperMap.REST.FilterParameter({
                    name: type,
					attributeFilter:params 
				}),
                    //初始化sql查询参数
                        queryBySQLParamsCapital = new SuperMap.REST.QueryBySQLParameters({
                            queryParams: [queryParamCapital]
                        }),
                    //SQL查询服务
                        queryBySQLServiceCapital = new SuperMap.REST.QueryBySQLService(url2, {
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
                                feature.style = styleCaptial;
                                features.push(feature);
				var a = feature.attributes["SmX"];
				var b = feature.attributes["SmY"];
				//alert("地图服务:" + a +":"+b);
				map.setCenter(new SuperMap.LonLat(a,b),1); 
                            }
                        }
                    }
                }
				
                vectorLayer.addFeatures(features);
                select.activate();
				
            }

            //SQL查询(省会)失败时出发的事件
            function processFailedCapital(e) {
                alert("地图服务:"+e.error.errorMsg);
            }
			 
            function processFailed(e) {
                alert("地图服务:"+e.error.errorMsg);
            }
			var infowin = null;
            //清除全部要素
            function clearFeatures(){
                if(vectorLayer.selectedFeatures.length > 0) {
                    map.removePopup(vectorLayer.selectedFeatures[0].popup);
                }
				map.setCenter(new SuperMap.LonLat(12974732.78 , 4821537.75), 0);        
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
</html>
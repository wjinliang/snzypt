<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="renderer" content=webkit>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport"/>
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css"/>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css"/>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/font.css"/>
    <link rel="stylesheet" href="/html/sn-static209/jl/style.css"/>
    <link rel="stylesheet" href="/html/sn-static209/cdn/iconFonts/iconfont.css"/>
</head>

<body>
<div class="index-wrap">
    <div class="common-header">
        <div class="header-top">
            <div class="setWidth clearfix">
                <div class="header-font">
                    <img src="/html/sn-static209/cdn/img/fonticon.png"/>
                </div>
                <div class="search-box">
                    <input type="text" value="" class="serach-text" placeholder="请输入数据资源的名称关键词进行搜索"/>
                    <button class="arg-btn blue-btn">全站搜索</button>
                    <!-- <button class="arg-btn blue-btn">高级筛选</button> -->
                </div>
            </div>
        </div>
        <div class="header-btm">
            <div class="set-nav">
                <div class="setWidth nav-position">
                    <ul class="arg-nav clearfix">
                        <li class=""><a href="${site.url}">首页</a></li>
                        <@channelListDirective siteId=site.id>
                            <#list channels as chan>
                                <li class="${(chan.id==own)?string('active','')}"><a
                                            href="${chan.url}">${chan.displayName}</a></li>
                            </#list>
                        </@channelListDirective>
                    </ul>
                    <span class="shadow"></span>
                    <div class="login-info">
                        <span class="nologin">登录</span>
                    </div>
                    <div class="other-info">
                        <span class="userIonfo"></span>
                        <span class="systemss">后台管理</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="main-data-reasource">
        <div class="setWidth">
            <div class="setlocation">
                当前页面：特色专题/<span>村情专题</span>
            </div>
            <div class="common-valliage">
                <div class="main-topic">
                    <div class="common-valliage">
                        <div class="valliage-info">
                            <div class="clearfix">
                                <div class="v-left">
                                    <div class="v-name">XXXX村</div>
                                    <div class="v-nav">
                                        <div id="navList" class="navlist-wrap">
                                            <div class="navlist">
                                                <a href="" class="btn-active nav-btn">基本信息</a>
                                                <a href="" class="nav-btn">特色产业</a>
                                                <a href="" class="nav-btn">休闲农业</a>
                                                <a href="" class="nav-btn">智慧乡村</a>
                                                <a href="" class="nav-btn">其他</a>
                                            </div>
                                        </div>
                                        <div id="expandZone" class="expand active">
                                            <div class="download">
                                                <div id="basicInfo" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div id="specialItem" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置11</span>
                                                            <span class="info-count">2121212</span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div id="validItem" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div id="talenceItem" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>

                                                <div id="otherItem" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="v-hot-news">
                                        <div class="h-header">
                                            <span><i class="iconfont icon-laba"></i>最新动态</span>
                                            <a href="" target="_blank">更多></a>
                                        </div>
                                        <div class="v-hot-cons" id="newestDynamic">
                                            <p><a href="" target="_blank">世行：疫苗为经济复苏关键 中国助力全球经济发展中国助力全球经济发展</a></p>
                                        </div>
                                    </div>
                                    <div class="v-other-service">
                            <span id="cqvideo">
                                <img src="/html/sn-static209/cdn/img/cqicon02.png">
                                视频
                            </span>
                                        <span id="allImage">
                                <img src="/html/sn-static209/cdn/img/cqicon03.png">
                                图片
                            </span>
                                        <span id="allView">
                                <img src="/html/sn-static209/cdn/img/cqicon04.png">
                                全景图
                            </span>
                                    </div>
                                    <!-- 图片库 -->
                                    <div class="image-gallery" id="allImgs" style="display: none;">
                                        <ul id="imgsGallery" class="clearfix">
                                            <li><img data-original="/html/sn-static209/cdn/img/111.jpg"
                                                     src="/html/sn-static209/cdn/img/111.jpg"></li>
                                            <li><img data-original="/html/sn-static209/cdn/img/222.jpg"
                                                     src="/html/sn-static209/cdn/img/222.jpg"></li>
                                            <li><img data-original="/html/sn-static209/cdn/img/111.jpg"
                                                     src="/html/sn-static209/cdn/img/111.jpg"></li>
                                            <li><img data-original="/html/sn-static209/cdn/img/222.jpg"
                                                     src="/html/sn-static209/cdn/img/222.jpg"></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="v-right">
                                    <div class="cq-filter-con">
                                        <div class="filter-dropDown">
                                            <input id="searchRegion" type="text" value="" placeholder="输入搜索区名称">
                                            <ul id="regionResult" class="region-style">
                                                <li>海淀区</li>
                                                <li>搜索1</li>
                                                <li>搜索2</li>
                                                <li>搜索3</li>
                                            </ul>
                                        </div>
                                        <div class="filter-dropDown">
                                            <input id="searchVallage" type="text" value="" placeholder="输入村名城">
                                            <ul id="vallageResult" class="region-style">
                                                <li>海淀区</li>
                                                <li>搜索1</li>
                                                <li>搜索2</li>
                                                <li>搜索3</li>
                                            </ul>
                                        </div>
                                        <div class="filter-dropDown">
                                            <input type="text" value="" class="search-keys" placeholder="关键词搜索">
                                        </div>
                                        <div class="searchIcon">
                                            <i class="iconfont icon-sousuo"></i>
                                        </div>
                                    </div>
                                    <div id="map" style="width:100%;height:530px; margin: 20px 20px 20px 0"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/sn_new_footer.ftl">
    <script src="/html/sn-static209/cdn/js/jquery-3.4.1.min.js"></script>
    <script src="/html/sn-static209/cdn/js/viewer.min.js"></script>
    <script src="/html/sn-static209/cdn/js/layer.js"></script>
    <script src="/html/sn-static209/cdn/js/topicLayer.js"></script>
    <script src='/html/sn-static/static/sumap/libs/SuperMap.Include.js'></script>
    <script type="text/javascript" src="/html/sn-static209/jl/cunqing.js"></script>
</div>
<script>
    var viewer = new Viewer(document.getElementById('imgsGallery'), {
        url: 'data-original'
    });

    /* 地图服务 start*/
    var map, local, layer, vectorLayer, features, select, tempLayer, drag, delIndex = 0, editEnable = false, control,
        queryBounds, markerLayer, drawFeature, layerWorld,
        //设置图层样式
        style = {
            externalGraphic: "/html/sn-static/static/sumap/examples/images/marker.png",
            graphicWidth: 13,
            graphicHeight: 16,
            name: "town"
        },
        styleCity = {
            pointRadius: 10,
            externalGraphic: "/html/sn-static/static/sumap/examples/images/markerbig.png",
            name: "city"
        },
        styleCaptial = {
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
        }, transformControl,
        host = "http://172.24.61.42:8090";
    //url1=host+"/iserver/services/map-Shenong2/rest/maps/sheNongCQ";
    url1 = host + "/iserver/services/map-ugcv5-cunqing/rest/maps/cunqing";
    //url2=host+"/iserver/services/map-basemap3/rest/maps/cunqing"
    url2 = host + "/iserver/services/map-basemap/rest/maps/cunqing"

    function initMap(name) {
        /*
         * 不支持canvas的浏览器不能运行该范例
         * android 设备也不能运行该范例*/
        var broz = SuperMap.Util.getBrowser();

        if (!document.createElement('canvas').getContext) {
            alert("地图服务:" + '您的浏览器不支持 canvas，请升级');
            return;
        } else if (broz.device === 'android') {
            alert("地图服务:" + '您的设备不支持高性能渲染，请使用pc或其他设备');
            return;
        }

        //加载map控件
        map = new SuperMap.Map("map", {
            controls: [
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
        layerWorld = new SuperMap.Layer.TiledDynamicRESTLayer("cunqing", url1, {
            transparent: true,
            cacheEnabled: true
        }, {maxResolution: "auto"});
        layerWorld.events.on({"layerInitialized": addLayer});
        //初始化Vector图层
        vectorLayer = new SuperMap.Layer.Vector("Vector Layer", {renderers: ["Canvas2"]});
        //给在vector图层上所选择的要素初始化
        select = new SuperMap.Control.SelectFeature(vectorLayer, {
            onSelect: onFeatureSelect,
            onUnselect: onFeatureUnselect,
            repeat: true
        });
        map.addControl(select);

    }

    //添加图层
    function addLayer() {
        map.addLayers([layerWorld, vectorLayer]);
        map.setCenter(new SuperMap.LonLat(12974732.78, 4821537.75), 1);
    }

    //要素被选中时调用此函数
    function onFeatureSelect(feature) {
        if (editEnable) {
            editSelectedFeatures();
        } else {
            selectedFeature = feature;
            //被点选的feature第二次被选中的时候popup无需重新构建，直接显示即可
            if (feature.popup) {
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
            map.setCenter(new SuperMap.LonLat(a, b), 1);
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
        delIndex = 0;
        //查询中国的全部省会。
        var queryParamCapital, queryBySQLParamsCapital, queryBySQLServiceCapital, param, params, type;
        //param = document.getElementById("text1").value;
        type = "ST_VILLAGE_DIA_PT@221";
        params = "ID > 0";
        if (Pname.length != 0) {
            type = "ST_VILLAGE_DIA_PT@221";
            params = "MC='" + Pname + "'";

        }

        queryParamCapital = new SuperMap.REST.FilterParameter({
            name: type,
            attributeFilter: params
        }),
            //初始化sql查询参数
            queryBySQLParamsCapital = new SuperMap.REST.QueryBySQLParameters({
                queryParams: [queryParamCapital]
            }),
            //SQL查询服务
            queryBySQLServiceCapital = new SuperMap.REST.QueryBySQLService(url2, {
                eventListeners: {"processCompleted": processCompletedCapital, "processFailed": processFailedCapital}
            });
        queryBySQLServiceCapital.processAsync(queryBySQLParamsCapital);
    }

    //SQL查询(省会)成功时触发此事件
    function processCompletedCapital(queryEventArgs) {
        var i, j, feature,
            result = queryEventArgs.result;
        features = [];
        if (result && result.recordsets) {
            for (i = 0; i < result.recordsets.length; i++) {
                if (result.recordsets[i].features) {
                    for (j = 0; j < result.recordsets[i].features.length; j++) {
                        feature = result.recordsets[i].features[j];
                        feature.style = styleCaptial;
                        features.push(feature);
                        var a = feature.attributes["SmX"];
                        var b = feature.attributes["SmY"];
                        //alert("地图服务:" + a +":"+b);
                        map.setCenter(new SuperMap.LonLat(a, b), 1);
                    }
                }
            }
        }

        vectorLayer.addFeatures(features);
        select.activate();

    }

    //SQL查询(省会)失败时出发的事件
    function processFailedCapital(e) {
        alert("地图服务:" + e.error.errorMsg);
    }

    function processFailed(e) {
        alert("地图服务:" + e.error.errorMsg);
    }

    var infowin = null;

    //清除全部要素
    function clearFeatures() {
        if (vectorLayer.selectedFeatures.length > 0) {
            map.removePopup(vectorLayer.selectedFeatures[0].popup);
        }
        map.setCenter(new SuperMap.LonLat(12974732.78, 4821537.75), 0);
        vectorLayer.removeAllFeatures();
        markerLayer.clearMarkers();
        closeInfoWin();
    }

    function closeInfoWin() {
        if (infowin) {
            try {
                infowin.hide();
                infowin.destroy();
            } catch (e) {
            }
        }
    }
    initMap("北郎中村");
</script>
</body>

</html>
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
    <script>
        var iserver = "http://localhsot:8090";
        //var iserver = "http://47.96.75.177:8090";
        iserver = "http://mxbt.pro:8090";
        var mapUrl = iserver + "/iserver/services/map-beijing/rest/maps/beijing10261";
        var mapDataUrl = iserver + '/iserver/services/data-beijing/rest/data';
    </script>
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
    <div id="_mapdiv"></div>
    <div class="main-data-reasource">
        <div class="setWidth">

            <div class="common-valliage" style="background: none">
                <div class="main-topic">
                    <div class="setlocation">
                        <div id="pathText">当前页面：特色专题/<span>村情专题</span></div>
                    </div>
                    <div class="common-valliage" style="background: none">
                        <div class="valliage-info">
                            <div class="clearfix">
                                <div class="v-left">
                                    <div id="info_cunName" class="v-name">村情专题</div>
                                    <div class="v-nav">
                                        <div id="navList" class="navlist-wrap">
                                            <div class="navlist">
                                                <a href="" class="btn-active nav-btn">基本信息</a>
                                                <a href="" class="nav-btn">特色产业</a>
                                                <a href="" class="nav-btn">休闲农业</a>
                                                <#--                                                <a href="" class="nav-btn">智慧乡村</a>-->
                                                <#--                                                <a href="" class="nav-btn">其他</a>-->
                                            </div>
                                        </div>
                                        <div id="expandZone" class="expand active">
                                            <div class="download">
                                                <div id="basicInfo" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span id="info_location" class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-mianji"></i>
                                                            <span class="info-label">村域面积</span>
                                                            <span id="info_villageArea" class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-renyuanfenbu"></i>
                                                            <span class="info-label">人口情况</span>
                                                            <span id="populationSituation" class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-shebei"></i>
                                                            <span class="info-label">基础设施</span>
                                                            <span id="infrastructure" class="info-count"></span>
                                                        </li>
                                                        <li>
                                                            <i class="iconfont icon-tudi"></i>
                                                            <span class="info-label">村庄规划</span>
                                                            <span id="info_villagePlanning" class="info-count"></span>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div id="specialItem" class="item">
                                                    <ul>
                                                        <li>
                                                            <i class="iconfont icon-weizhi"></i>
                                                            <span class="info-label">地理位置</span>
                                                            <span id="" class="info-count"></span>
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
                                            <a href='javascript:void(0)' id="moreDynamic">更多></a>
                                        </div>
                                        <div class="v-hot-cons" id="newestDynamic">
                                            <p><a href='javascript:void(0)' target="_blank">此处展示最新动态，正在加载...</a></p>
                                        </div>
                                    </div>
                                    <div class="v-other-service">
                            <span id="cqvideoShow">
                                <img src="/html/sn-static209/cdn/img/cqicon02.png">
                                视频
                            </span>
                                        <span id="allImageShow">
                                <img src="/html/sn-static209/cdn/img/cqicon03.png">
                                图片
                            </span>
                                        <span id="quanjingShow">
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
                                            <input type="text" value="" class="search-keys" placeholder="关键词搜索">
                                        </div>
                                        <div class="filter-dropDown dropDownModif" id="dropdown2">
                                            <span>按区查询</span>
                                            <ul class="dropdown">
                                                <li>大兴区</li>
                                                <li>通州区</li>
                                                <li>朝阳区</li>
                                                <li>密云县</li>
                                                <li>顺义区</li>
                                                <li>平谷区</li>
                                                <li>昌平区</li>
                                                <li>怀柔区</li>
                                                <li>房山区</li>
                                                <li>丰台区</li>
                                                <li>门头沟区</li>
                                                <li>石景山区</li>
                                                <li>海淀区</li>
                                                <li>延庆县</li>
                                            </ul>
                                        </div>
                                        <div class="filter-dropDown dropDownModif" id="dropdown3">
                                            <span>选择乡镇</span>
                                            <ul class="dropdown">

                                            </ul>
                                        </div>
                                        <div class="filter-dropDown dropDownModif" id="dropdown4">
                                            <span>选择村庄</span>
                                            <ul class="dropdown">

                                            </ul>
                                        </div>
                                        <div class="searchIcon" id="searchBtn">
                                            <i class="iconfont icon-sousuo"></i>
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
    <#include "/template/sn_new_footer.ftl">
    <script src="/html/sn-static209/cdn/js/jquery-3.4.1.min.js"></script>
    <script src="/html/sn-static209/cdn/js/viewer.min.js"></script>
    <script src="/html/sn-static209/cdn/js/coco-modal.min.js"></script>
    <script src="/html/sn-static209/cdn/js/layer.js"></script>
    <script src="/html/sn-static209/cdn/js/topicLayer.js"></script>
    <script type="text/javascript" include="widgets.alert" src="/html/sn-static209/cdn/js/include-web.js"></script>
    <script type="text/javascript" exclude="iclient-classic" include="nanoscroller,infoWindow,MapToImg"
            src="/html/sn-static209/cdn/classic/include-classic.js"></script>
</div>
<script>
    $(document).ready(function () {
        // dropdown效果
        // var dropdown2 = new DropDown($('#dropdown2'));
        // var dropdown3 = new DropDown($('#dropdown3'));
        // var dropdown4 = new DropDown($('#dropdown4'));
        // dropdown2.initEvents();
        // dropdown3.initEvents();
        // dropdown4.initEvents();
        $('#filterBtn li').on('click', function () {
            $('.filter-dropDown').removeClass('active');
            $(this).addClass('hover').siblings().removeClass('hover')
        })
        $('#searchList li span').on('click', function () {
            $(this).addClass('active')
            $(this).siblings('').slideToggle()
            $(this).parent('li').siblings().find('.res-nav').removeClass('active')
            $(this).parent('li').siblings().find('.detail-cont').slideUp()
        })

        // 初始化map的大小
        var mapDiv = document.getElementById("_mapdiv");
        var nongQingContentDiv = document.getElementsByClassName("main-data-reasource")[0];
        mapDiv.style.position = 'absolute';
        mapDiv.style.top = getComputedStyle(nongQingContentDiv, null).top;
        mapDiv.style.height = getComputedStyle(nongQingContentDiv, null).height;
        mapDiv.style.width = getComputedStyle(nongQingContentDiv, null).width;
        mapDiv.style.zIndex = 0;

        var commonValliage = document.querySelectorAll(".common-valliage");

        commonValliage.forEach(item => {
            item.style.background = "none";
        })

        var pathText = document.getElementById("pathText");
        pathText.style.width = "250px";
        pathText.style.padding = "10px 10px";
        pathText.style.borderRadius = "10px";
        pathText.style.background = 'rgba(255, 255, 255, 0.9)';

        window.onresize = () => {
            mapDiv.style.top = getComputedStyle(nongQingContentDiv, null).top;
            mapDiv.style.height = getComputedStyle(nongQingContentDiv, null).height;
            mapDiv.style.width = getComputedStyle(nongQingContentDiv, null).width;
        };

        window.map = null;


        var initMap = function () {
            this.map = new SuperMap.Map("_mapdiv", {
                controls: [
                    new SuperMap.Control.Navigation(),
                    new SuperMap.Control.Zoom({div: $("#rightBottom")[0]}),
                    new SuperMap.Control.MousePosition(),
                ], allOverlays: true
            });
            window.map = this.map;
            // $("#rightBottom").attr("style", "");
            //设置地图最小缩放级别为7级
            this.map.events.register("zoomend", this, function (e) {
                if (this.map.getZoom() < 7)
                {
                    //map.zoomTo(17);
                    this.map.setCenter(new SuperMap.LonLat(116.36503293755, 39.953585745484), 9);
                }
            });
            layer = new SuperMap.Layer.TiledDynamicRESTLayer("World", mapUrl, null, {
                maxResolution: "auto",
                useCanvas: false
            });
            layer.events.on({
                "layerInitialized": () => {
                    this.map.addLayers([layer]);
                    this.map.setCenter(new SuperMap.LonLat(116.36503293755, 39.953585745484), 9);
                    //区划矢量图层
                    var qu_Layer = new SuperMap.Layer.Vector("qu_Layer");
                    this.map.addLayers([qu_Layer]);


                    var queryResult = new SuperMap.Layer.Vector("queryResult");
                    this.map.addLayers([queryResult]);


                    var featurePop;
                    var callbacks = {
                        click: (currentFeature) => {
                            closeInfoWin();
                            var x = (currentFeature.geometry.bounds.bottom + currentFeature.geometry.bounds.top) / 2
                            var y = (currentFeature.geometry.bounds.left + currentFeature.geometry.bounds.right) / 2
                            featurePop = new SuperMap.InfoWindow(
                                "feature",
                                "属性"
                            );
                            featurePop.hide();
                            featurePop.titleBox = true;
                            featurePop.contentSize = new SuperMap.Size(300, 200);
                            featurePop.render();
                            //featurePop.show(null, feature);
                            featurePop.show(null, currentFeature);
                            var lonLat = new SuperMap.LonLat(y, x);
                            featurePop.setLonLat(lonLat, { x: 0, y: 0 });
                            this.map.addPopup(featurePop)
                        }
                    };
                    function closeInfoWin() {
                        if (featurePop) {
                            try {
                                featurePop.hide();
                                featurePop.destroy();
                            }
                            catch (e) {
                            }
                        }
                    }
                    this.selectFeature = new SuperMap.Control.SelectFeature([qu_Layer,queryResult],
                        {
                            callbacks: callbacks
                        });
                    this.map.addControl(this.selectFeature);
                    this.selectFeature.activate();

                    //	this.shuxing();

                }
            });
            // 禁用拖拽
            // for (var i = 0; i< this.map.controls.length; i++) {
            //     this.map.controls[i].deactivate();
            // }
        };

        initMap();
    });
</script>
<script type="text/javascript" src="/html/sn-static209/jl/cunqing.js"></script>
</body>

</html>
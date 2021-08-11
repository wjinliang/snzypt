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
    <div id="_mapdiv"></div>
    <div class="main-data-reasource" style="height: 800px;">
        <div class="setWidth">
            <div class="common-valliage">
                <div class="main-topic">
                    <div class="setlocation">
                        <div id="pathText">当前页面：特色专题/<span>农情专题</span></div>
                    </div>
                    <div class="common-valliage">
                        <div class="main-topic" id='nongQingContent'>
                            <div class="topic-filter">
                                <div class="clearfix" style="padding:15px 0"><span id="collapseBtn"
                                                                                   class="collapse-btn">收起选项</span>
                                </div>
                                <div class="filter-box" id="nongQingFilterBox">
                                    <ul>
                                        <#--                      <li>-->
                                        <#--                        <span class="filter-label">年度:</span>-->
                                        <#--                        <div class="filter-list" id="year">-->
                                        <#--                          <a href="javascript:;" class="active">2020年</a>-->
                                        <#--                          <a href="javascript:;">2019年</a>-->
                                        <#--                          <a href="javascript:;">2018年</a>-->
                                        <#--                          <a href="javascript:;">2017年</a>-->
                                        <#--                          <a href="javascript:;">2016年</a>-->
                                        <#--                          <a href="javascript:;">2015年</a>-->
                                        <#--                          <a href="javascript:;">2014年</a>-->
                                        <#--                        </div>-->
                                        <#--                      </li>-->
                                        <li>
                                            <span class="filter-label">区域:</span>
                                            <div class="filter-list" id="region">
                                                <a href="javascript:;" class="active">顺义区</a>
                                                <a href="javascript:;">密云区</a>
                                                <a href="javascript:;">朝阳区</a>
                                                <a href="javascript:;">海淀区</a>
                                                <a href="javascript:;">昌平区</a>
                                                <a href="javascript:;">石景山区</a>
                                                <a href="javascript:;">大兴区</a>
                                                <a href="javascript:;">通州区</a>
                                                <a href="javascript:;">房山区</a>
                                                <a href="javascript:;">东城区</a>
                                                <a href="javascript:;">西城区</a>
                                                <a href="javascript:;">延庆区</a>
                                                <a href="javascript:;">门头沟区</a>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="filter-label">其他选项:</span>
                                            <div class="filter-dropDown">
                                                <div class="selectNext">
                                                    <span class="selectValNext" onselectstart="return false">企业名称</span>
                                                    <#--                            <i class="iconfont icon-xiangxia" style="float: right;"></i>-->
                                                </div>
                                                <#--                          <div class="selectListNext">-->
                                                <#--                            <a href="javascript:;" class="listANext">企业名称</a>-->
                                                <#--                          </div>-->
                                            </div>
                                            <div class="filter-search">
                                                <input type="text" value="" class="search-keys" placeholder="请输入内容">
                                                <i class="iconfont icon-sousuo" id="searchBtn"></i>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="region-detail" id="regionDetail">
                                <div class="regin-body">
                                    <h1>顺义区</h1>
                                    <ul>
                                        <li>
                                            <span class="regin-label">常住人口</span>
                                            <span class="regin-count">288219人</span>
                                        </li>
                                        <li>
                                            <span class="regin-label">经济收入</span>
                                            <span class="regin-count">29939232元</span>
                                        </li>
                                        <li>
                                            <span class="regin-label">农业用地</span>
                                            <span class="regin-count">34万平方米</span>
                                        </li>
                                        <li>
                                            <span class="regin-label">涉农企业</span>
                                            <span class="regin-count">78家</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="topic-result" id="topicResult">
                                <ul>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-tudi"></i>
                                            农场数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-mianji"></i>
                                            基地占地面积
                                        </div>
                                        <div>
                                            <span>1579</span>米
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-zhongzhi"></i>
                                            可种植面积
                                        </div>
                                        <div>
                                            <span>2893</span>米
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-mianji"></i>
                                            当前种植面积
                                        </div>
                                        <div>
                                            <span>1579</span>米
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-chanliangyield"></i>
                                            预期年产量
                                        </div>
                                        <div>
                                            <span>1579</span>吨
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-shebeisheshi"></i>
                                            设施数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-mianjitu"></i>
                                            设施面积
                                        </div>
                                        <div>
                                            <span>1579</span>米
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-qitaleinongzuowu"></i>
                                            农作物品种数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-chuanganqi"></i>
                                            传感器数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-shexiangtou"></i>
                                            摄像头数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-tubiao-"></i>
                                            信息化示范基地数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-icon_xinyong_xianxing_jijin-127"
                                               style="font-size: 16px;"></i>
                                            产业化龙头企业数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-shuibeng1"></i>
                                            机井数量
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <i class="iconfont icon-baohunongyeyongdiguanli"></i>
                                            农用地块
                                        </div>
                                        <div>
                                            <span>1579</span>个
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/sn_new_footer.ftl">
    <script type="text/javascript" src="/html/sn-static209/cdn/js/topicLayer.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/nongqing.js"></script>
    <script type="text/javascript" include="widgets.alert" src="/html/sn-static209/cdn/js/include-web.js"></script>
    <script type="text/javascript" exclude="iclient-classic" include="nanoscroller,infoWindow,MapToImg"
            src="/html/sn-static209/cdn/classic/include-classic.js"></script>
</div>
<script>
    window.onload = () => {
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

        var iserver = "http://localhsot:8090";
        //var iserver = "http://47.96.75.177:8090";
        iserver = "http://mxbt.pro:8090";
        var mapUrl = iserver + "/iserver/services/map-beijing/rest/maps/beijing10261";

        var initMap = function () {
            this.map = new SuperMap.Map("_mapdiv", {
                controls: [
                    new SuperMap.Control.Navigation(),
                    new SuperMap.Control.Zoom({div: $("#rightBottom")[0]}),
                    new SuperMap.Control.MousePosition(),
                    new SuperMap.Control.OverviewMap()
                ], allOverlays: true
            });

            // $("#rightBottom").attr("style", "");

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

                    var featurePop;
                    //设置地图最小缩放级别为7级
                    this.map.events.register("zoomend", this, function (e) {
                        if (map.getZoom() < 7)
                        {
                            //map.zoomTo(17);
                            map.setCenter(new SuperMap.LonLat(116.36503293755, 39.953585745484), 9);
                        }
                    });

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
                            featurePop.setLonLat(lonLat, {x: 0, y: 0});
                            this.map.addPopup(featurePop)
                        }
                    };

                    function closeInfoWin() {
                        if (featurePop) {
                            try {
                                featurePop.hide();
                                featurePop.destroy();
                            } catch (e) {
                            }
                        }
                    }

                    this.selectFeature = new SuperMap.Control.SelectFeature(qu_Layer,
                        {
                            callbacks: callbacks
                        });
                    this.map.addControl(this.selectFeature);
                    this.selectFeature.activate();

                    //	this.shuxing();

                }
            });
            for (var i = 0; i< this.map.controls.length; i++) {
                this.map.controls[i].deactivate();
            }
        }
        initMap();
    };
</script>
</body>

</html>
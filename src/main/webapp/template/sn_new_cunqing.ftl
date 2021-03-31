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
            <div class="common-valliage" style="background: none">
                <div class="main-topic">
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
                                    <div id="map" style="width:100%;height:500px; margin: 20px 20px 20px 0">
                                        <iframe runat="server" src="https://172.26.72.221:8090/map/mxbt.html"
                                                frameborder="no" border="0" marginwidth="0" marginheight="0"
                                                scrolling="no" allowtransparency="yes"
                                                style="height: 615px;width: 100%;"></iframe>
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
    <script src='/html/sn-static/static/sumap/libs/SuperMap.Include.js'></script>
    <script type="text/javascript" src="/html/sn-static209/jl/cunqing.js"></script>
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
    });
</script>
</body>

</html>
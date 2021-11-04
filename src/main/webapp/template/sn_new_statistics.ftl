<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="renderer" content=webkit>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/font.css" />
    <link rel="stylesheet" href="/html/sn-static209/jl/style.css" />
  </head>

  <body>
    <div class="index-wrap">
      <div class="common-header">
        <div class="header-top">
          <div class="setWidth clearfix">
            <div class="header-font">
              <img src="/html/sn-static209/cdn/img/fonticon.png" />
            </div>
            <div class="search-box">
              <input
                type="text"
                value=""
                class="serach-text"
                placeholder="请输入数据资源的名称关键词进行搜索"
              />
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
		    <@channelListDirective siteId=site.id><#list channels as chan>
			<li  class="${(chan.id==own)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
			</#list></@channelListDirective>
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
            当前页面：<span>统计年鉴</span>
          </div>
          <div class="clearfix mgb30">
            <div class="source-navs pull-box-left">
              <!-- <ul id="treeDemo" class="ztree"></ul> -->
              <div id="platPane" class="menu_list"></div>
            </div>
            <div class="resource-cons pull-box-right">
              <div class="bg-white statical-panel"></div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
<#--      2019年-->
    <script type="text/javascript" src="/html/sn-static/static/js/echarts.common.min.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NCJBQK2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYSCTJ2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NZWBZMJHZLMJ2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NLMYYZCZ2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_ZYNCPCL2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_PJYNCYRYZNLMYZCZ2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_GDMJ2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYGGY2019FP.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYSCTJ2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NLMYYZCZZB2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_ZYNZWBZMJJCL2019zb.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_LYJGGXCPSC2019bd.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SCSYJCCPCL2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SCPSC2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYGGY2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_tjZZSC2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_MSLY2019db.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SSNY2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_XZQY2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_XZQYCKGHQK2019.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NCSCJYZYZBQK2019.js"></script>

<#--   2020年   -->
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NCJBQK2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYSCTJ2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NZWBZMJHZLMJ2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NLMYYZCZ2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_ZYNCPCL2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_PJYNCYRYZNLMYZCZ2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYGGY2020FP.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_GDMJ2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYSCTJ2020db.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NLMYYZCZZB2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_ZYNZWBZMJJCL2020zb.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_LYJGGXCPSC2020bd.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SCSYJCCPCL2020db.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SCPSC2020db.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NYGGY2020db.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_tjZZSC2020db.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_SSNY2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_XZQY2020.js"></script>
      <script type="text/javascript" src="/html/sn-static209/jl/sn_new_statistics_NCSCJYZYZBQK2020.js"></script>
    <script type="text/javascript" src="/html/sn-static209/jl/statistics.js"></script>
    </div>
    <script>
      
    </script>
  </body>
</html>

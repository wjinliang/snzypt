<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="renderer" content=webkit>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
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
        <div class="bg-gray">
          <div class="setWidth topic-box clearfix">
            <div class="topic-desc pull-topic-right">
              <h1>农情</h1>
              <p>此处可添加一句农情概括</p>
              <button id="nongqing_btn" class="more-btn btn-default">《了解更多</button>
            </div>
            <div class="topic-img topic-img2"></div>
          </div>
        </div>
        <div class="bg-white">
          <div class="setWidth topic-box">
            <div class="topic-desc">
              <h1>村情</h1>
              <p>此处可添加一句村情概括</p>
              <button class="more-btn btn-primary">了解更多》</button>
            </div>
            <div class="topic-img topic-img1"></div>
          </div>
        </div>
        <#--<div class="bg-white">
          <div class="setWidth topic-box">
            <div class="topic-desc">
              <h1>美丽乡村</h1>
              <p>此处可添加一句美丽乡村概括</p>
              <button class="more-btn btn-primary">了解更多》</button>
            </div>
            <div class="topic-img topic-img3"></div>
          </div>
        </div>-->
        <div class="bg-gray">
          <div class="topic-box setWidth clearfix">
            <div class="topic-desc pull-topic-right">
              <h1>休闲农业</h1>
              <p>此处可添加一句休闲农业概括</p>
              <button class="more-btn btn-default">《了解更多</button>
            </div>
            <div class="topic-img topic-img4"></div>
          </div>
        </div>
        <div class="bg-white">
          <div class="setWidth topic-box">
            <div class="topic-desc">
              <h1>智慧乡村</h1>
              <p>此处可添加一句智慧乡村概括</p>
              <button class="more-btn btn-primary">了解更多》</button>
            </div>
            <div class="topic-img topic-img5"></div>
          </div>
        </div>
        <div class="bg-gray">
          <div class="topic-box setWidth clearfix">
            <div class="topic-desc pull-topic-right">
              <h1>统计年鉴</h1>
              <p>全面反映北京农村经济和社会发展</p>
              <button id="nianjian_btn" class="more-btn btn-default">《了解更多</button>
            </div>
            <div class="topic-img topic-img6"></div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
  </body>
  <script>
  $("#nianjian_btn").on("click",function(){
    window.location.href = "/topiecms/portal/channel/ntjnj/43_1.htm";
  });
  $("#nongqing_btn").on("click",function(){
    window.location.href = "/topiecms/portal/channel/newnongqing/45_1.htm";
  });
  </script>
</html>

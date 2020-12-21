<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
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
    <script src="/html/sn-static209/jl/statistics.js"></script>
    </div>
    <script>
      $(function () {
        var parentNodes = zNodes.filter(function (ele) {
          return ele.pId === 0
        })
        var htmlStr = ''
        parentNodes.forEach(function (ele, index) {
          var cHtmlStr = ''
          zNodes.forEach(function (ele1, index1) {
            if (ele.id === ele1.pId) {
              cHtmlStr +=
                '<li><i class="icon ' +
                ele1.iconSkin +
                '"></i>' +
                ele1.name +
                '</li>'
            }
          })
          if (cHtmlStr !== '') {
            htmlStr +=
              '<h3 class="menu_head set-icon"><i class="icon ' +
              ele.iconSkin +
              '"></i>' +
              ele.name +
              '</h3>' +
              '<ul class="menu_body">' +
              cHtmlStr +
              '</ul>'
          } else {
            htmlStr +=
              '<h3 class="menu_head_noc"><i class="icon ' +
              ele.iconSkin +
              '"></i>' +
              ele.name +
              '</h3>' +
              '<ul class="menu_body">' +
              cHtmlStr +
              '</ul>'
          }
        })
        $('#platPane').append(htmlStr)
        // $('#platPane .menu_body:eq(1)').show()
        $('#platPane h3.menu_head_noc').click(function () {
          alert(1)
        })
        $('#platPane h3.menu_head').click(function () {
          $(this)
            .addClass('current')
            .next('.menu_body')
            .slideToggle(300)
            .siblings('.menu_body')
            .slideUp('normal')
          $(this).siblings().removeClass('current')
          $(this).next('.menu_body').addClass('open')
          $(this)
            .next('.menu_body')
            .children('li')
            .on('click', function () {
              Statistics.open($(this));
              $(this).addClass('navs-active')
              $(this).siblings().removeClass('navs-active')
            })
        })
      })
    </script>
  </body>
</html>

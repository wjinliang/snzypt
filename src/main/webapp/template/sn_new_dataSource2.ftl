<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="renderer" content=webkit>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/zTree/css/zTreeStyle/zTreeStyle.css" />
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
              <div class="other-info">
                <span class="userIonfo">XXX用户</span>
                <span class="systemss">后台管理</span>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="main-data-reasource">
        <div class="setWidth">
          <div class="setlocation">
            当前页面：<span>数据资源</span>
          </div>
          <div class="clearfix mgb30">
            <div class="source-navs pull-box-left">
              <ul id="treeDemo" class="ztree"></ul>
            </div>
            <div class="resource-cons pull-box-right">
              <div class="bg-white source-panel">
                <h1>基础地理信息</h1>
                <div class="resource-box">
                  <h2>行政区域</h2>
                  <div class="box-head">
                    <span>所属分类</span>
                    <span>数据来源</span>
                    <span>数据量</span>
                  </div>
                  <ul>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>15</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>15</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>15</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>15</span>
                    </li>
                  </ul>
                </div>
                <div class="resource-box">
                  <h2>交通资源</h2>
                  <div class="box-head">
                    <span>所属分类</span>
                    <span>数据来源</span>
                    <span>数据量</span>
                  </div>
                  <ul>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>15</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>0</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>2121</span>
                    </li>
                    <li>
                      <span>海淀区XXX镇XXX街道</span>
                      <span>211信息平台</span>
                      <span>29929</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
    <script src="/html/sn-static209/cdn/zTree/js/jquery.ztree.core-3.5.min.js"></script>
    <script src="/html/sn-static209/cdn/zTree/js/jquery.ztree.excheck-3.5.min.js"></script>
    <script src="/html/sn-static209/cdn/zTree/js/jquery.ztree.exedit-3.5.min.js"></script>
    <script src="/html/sn-static209/cdn/js/resourceZtreeMenu.js"></script>
  </body>
</html>

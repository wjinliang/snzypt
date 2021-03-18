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
            当前页面：<span>数据资源</span>
          </div>
          <div class="clearfix mgb30">
            <div class="source-navs pull-box-left">
              <!-- <ul id="treeDemo" class="ztree"></ul> -->
              <div id="platPane" class="menu_list"></div>
            </div>
            <div class="resource-cons pull-box-right">
              <div class="bg-white source-panel">
                <h1>平台介绍</h1>
                <article>
                  随着大数据技术和产业快速发展，国务院及农业部、工信部连续发布了《促进大数据发展行动纲要》、《关于推进农业农村大数据发展的实施意见》、《大数据产业发展规划（2016－2020年）》等一系列指导性文件。北京市认真落实国家和农业农村部的总体部署，先后出台了《北京市“十二五”期间农村信息化发展指导意见》（京经信委发〔2012〕16号）、《关于做好2014年智慧北京重点工作任务的通知》（京信办发〔2014〕1号）、《关于扎实做好农业农村信息化工作的意见》（京政农发〔2014〕6号）、《北京大数据行动计划工作方案》（京政办发[2018]31号）等若干文件，要求推进农业农村数据资源整合和平台建设工作。为落实上述文件精神，我市于2016年启动“北京市涉农信息资源平台”建设项目，推动涉农数据资源汇聚共享，探索建立信息共建共享工作长效机制。
                </article>
		<article>
                  已完成的平台一期项目建设工作，搭建了一个资源门户和三个子系统（互联网数据采集管理系统、基础平台管理系统、数据交换管理系统），为涉农数据汇聚共享、加工处理、数据服务提供了基础平台；通过对现有数据的梳理、加工、整合，构建了“4大基础库+10大主题库+N个服务库”的数据库体系；从管理支撑和经营布局两个角度，探索形成了村情、农情、美丽乡村、休闲农业、智慧乡村、统计年鉴六大特色专题。
                </article>
                <article>
                  目前平台已实现14个应用系统或网站的数据汇聚，形成108个数据目录类、176万多条数据。完成数据汇聚的14个应用系统或网站包括：221信息平台、北京现代农业物联网综合服务平台、北京市农村实用人才信息管理系统、休闲农业信息采集系统、北京市村庄规划管理地理信息系统、北京统计年鉴、中国农业信息网、北京市农业农村局网、北京市农业信息网、北京市农研中心网、Hi乡村网、一村一品网、北京美丽乡村网、北京郊区农村改革与发展观察点信息采集与管理系统。
                </article>
              </div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
    <script src="/html/sn-static209/jl/resourceZtreeMenu.js"></script>
  </body>
</html>

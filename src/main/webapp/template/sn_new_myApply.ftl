<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
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
			<li  class="${(chan.id==superChannel.id)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
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
            当前页面：<span>${superChannel.displayName!}</span> > <span>${channel.displayName!}</span>
          </div>
          <div class="clearfix mgb30">
            <div class="apply-navs pull-box-left">
              <ul>
		<@channelListDirective channelId=superChannel.id><#list channels as chan>
			<li class="${(chan.id==own)?string('active','')}">
			  <i class="icon icon_0${chan_index+1} fontSize24"></i
			  ><a href="${chan.url!}" target="_self">${chan.displayName!}</a>
			</li>
		</#list></@channelListDirective>
              </ul>
            </div>
            <div class="apply-cons pull-box-right">
              <div class="apply-bg">
                <h1 class="apply-tit myapply">${channel.displayName!}</h1>
                <div class="my-apply-table">
                  <table border="0" cellspacing="0">
                    <thead>
                      <tr>
                        <th>序号</th>
                        <th>申请类型</th>
                        <th>数据名称/数据类型</th>
                        <th>需求描述</th>
                        <th>申请时间</th>
                        <th>审核状态</th>
                        <th>下载数据</th>
                      </tr>
                    </thead>
                    <tbody>
		    <@datasourceApplyListDirective channelId=own >
			<#list datasourceApplyList as apply>
			      <tr>
				<td>${apply_index+1}</td>
				<td>${apply.applyType}</td>
				<td>${apply.applyFor}${apply.resourceName}</td>
				<td>${apply.applyContent}</td>
				<td>${apply.applyTime?string("yy-MM-dd")}</td>
				<td class="checking">${apply.checkStatus}</td>
				<td>XXXXX</td>
			      </tr>
			      </#list>
		      </@datasourceApplyListDirective>
                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
  </body>
</html>

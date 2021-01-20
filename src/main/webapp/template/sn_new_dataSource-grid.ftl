<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport" />
    <title>${site.displayName!}</title>
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/common.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/style.css" />
    <link rel="stylesheet" href="/html/sn-static209/cdn/css/font.css" />
    <link rel="stylesheet" href="/html/sn-static209/jl/style.css?v=2" />
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
	    <#assign parentType=param>
	      <@tableInfoDirective id=parentType >
                <h1>${tableInfo.gridName!}</h1>
		</@tableInfoDirective>
		  <@tableListDirective type=0  pId=param gridName=param channelId=41 pageNum=pageNum pageSize=15 >
		  <#assign typeName='typeName' />
			    <#list tables as t>
		<#if typeName != t.pTypeName>
			<#if (t_index gt 0)>
				</ul> 
				</div>
			</#if>
                  <div class="resource-box">
			<#assign typeName=t.pTypeName />
                  <h2>${typeName}</h2>
			  <div class="box-head">
			    <span>资源名称</span>
			    <span>系统名称</span>
			    <span>数据量</span>
			  </div>
			 <ul>
			 <li>
			      <span><a href="../sjzyxq/42_1.htm?param=${parentType}_${t.id!}" class="fontSize16 pText1">${t.gridName!}</a></span>
			      <span>${t.origin!}</span>
			      <span>${t.dataCount!}</span>
			    </li>
		 <#else>
			<li>
		      <span><a href="../sjzyxq/42_1.htm?param=${parentType}_${t.id!}" class="fontSize16 pText1">${t.gridName!}</a></span>
		      <span>${t.origin!}</span>
		      <span>${t.dataCount!}</span>
		    </li>
		</#if>
				    
			
                 </#list>
		 
		 </ul> 
                </div>
			<#if (totalPage gt 0)>
			 ${pagination!}
			</#if>
		
		</@tableListDirective>
              </div>
            </div>
          </div>
        </div>
      </div>
      <#include "/template/sn_new_footer.ftl">
    </div>
    <script src="/html/sn-static209/jl/resourceZtreeMenu.js?v=1"></script>
  </body>
</html>

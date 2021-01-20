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
	    <#assign parentType=param?split("_")[0]>
	    <#assign cType=param?split("_")[1]>
            <div class="resource-cons pull-box-right">
              <div class="bg-white source-panel">
	      <@tableInfoDirective id=cType >
                <h1>${tableInfo.gridName!}</h1>
		</@tableInfoDirective>
		<@tableInfoListDirective id=cType >
		<#list tables as table>
		 <#if (table_index==0)>
                <p class="login-get-file" style="display:none;">登录后即可下载数据</p>
                <p class="fileData"><a href="../../../table/data/export/${tableId}" target="_blank" style="display:none;">下载数据</a></p>
		<ul class="data-catalog">
		  <li class="clearfix">
		    <label>数据来源:</label>
		    <span>${table.origin!""}</span>
		  </li>
		  <li class="clearfix">
		    <label>数据总数:</label>
		    <span>${table.dataCount!"- -"}条</span>
		  </li>
		  <li class="clearfix">
		    <label>访问量:</label>
		    <span>${table.visitCount!}</span>
		  </li>
		  <li class="clearfix">
		    <label>共享方式:</label>
		    <span>${table.shareType!}</span>
		  </li>
		  <#if table.dataUpdateTime??>
		  <li class="clearfix">
		    <label>采集时间:</label>
		    <span>${table.dataUpdateTime!"- -"}</span>
		  </li>
		  </#if>
		  <li class="clearfix">
		    <label>是否开放:</label>
		    <span>${table.publicType!}</span>
		  </li>
		  <li class="clearfix">
		    <label>所属部门:</label>
		    <span>${table.org!}</span>
		  </li>
		  <li class="clearfix">
		    <label>数据说明:</label>
		    <span>${table.info!}</span>
		  </li>
		</ul>

		  </#if>
		<#if (tables?size &gt; 1)>
                <h1>${tableInfo.gridName!} - ${table.gridName!}</h1>
		</#if>
                <div class="resource-box">
                  <h2 class="main-sub-title">数据项</h2>
                  <div class="box-head">
                    <span>名称</span>
                    <span>字段</span>
                    <span>描述</span>
                  </div>
                  <ul>
		  <@dataFieldListDirective tableId=table.id pageNum=1 pageSize=5>
			<#list fields as item>
			<#if item.detailShow>
			  <li>
			      <span>${item.aTitle!}</span>
			      <span>${item.aField!}</span>
			      <span>${item.aFormat!item.aTitle}</span>
			    </li>
			</#if>
			</#list>
		</@dataFieldListDirective>
                  </ul>
                </div>
                  </#list>
		</@tableInfoListDirective>
                  
                </div>
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

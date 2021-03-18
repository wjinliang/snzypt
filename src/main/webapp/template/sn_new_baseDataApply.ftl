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
                <div class="apply-forms">
                  <h1 class="apply-tit">${channel.displayName!}</h1>
		  <#if (channel.enName=='jcsjsq')>
		  <input type="hidden" name="applyType" value="data">
		  <input type="hidden" name="resourceId" value="">
                  <div class="items">
                    <label class="items-name">数据选择：</label>
                    <input
                      id="_topOfficeName"
                      name="resourceName"
                      type="text"
                      value=""
                      onkeyup="AutoMatch(this)"
                      onclick="showMenu()"
                      selectname="PleaseEnterCompany"
                      selectattr="placeholder"
                      autocomplete="off"
                    />
                    <div id="menuContent" class="menuContent">
                      <ul
                        id="treeDemo"
                        class="ztree"
                        style="margin-top: 0; width: 178px"
                      ></ul>
                    </div>
                  </div>
		  </#if>
		  <#if (channel.enName=='yyfwsq')>
		  <input type="hidden" name="applyType" value="service">
		 <div class="items">
                    <label class="items-name">服务申请：</label>
                    <label for="data1">
                      <input
                        type="radio"
                        name="colors"
			value="产品数据需求"
                        id="data1"
                        class="a-radio"
                      />
                      <span class="b-radio"></span>产品数据需求
                    </label>
                    <label for="data2" style="margin-left: 15px">
                      <input
                        type="radio"
                        name="colors"
			value="其他数据需求"
                        id="data2"
                        class="a-radio"
                      /><span class="b-radio"></span>其他数据需求
                    </label>
                  </div>	
		  </#if>
		  
		  <#if (channel.enName=='yyjksq')>
			<input type="hidden" name="applyType" value="interface">
		  </#if>
                  <div class="items request">
                    <label class="items-name">需求描述：</label>
                    <textarea name="content"></textarea>
                  </div>
                  <div class="items">
                    <label class="items-name">联系方式：</label>
                    <input type="text" value="" name="link" placeholder="联系人电话或邮箱" />
                  </div>
                  <div class="items texCenter">
                    <span class="apply-btn primary-btn">提交</span>
                  </div>
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
    <script src="/html/sn-static209/jl/dataResource.js"></script>
  </body>
</html>

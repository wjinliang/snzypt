<!DOCTYPE html>
    <html>
    <head lang="en">
        <#include "/template/jh-meta.ftl">
        <title>金湖政府网</title>
        <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
        <script src="/html/jinhu-static/js/respond.min.js"></script>
        <![endif]-->
        <style>
    	 .ft-bg {
                             margin: 2.5em 0 3em 0;
                             background-color: #97040c;
                             height: 1em;
                             border-bottom: 3px solid #6B0019;
                         }
    	.ft {
    	    background-color: #f0f0f0;
    	}
        </style>
    </head>
    <body class="wxqd-bg-white">
    <div class="wxqd-bg">
        <div class="wxqd-logo">
            <span class="thumbnail thumbnails">
                <img src="/html/jinhu-static/img/wxqd_logo.png">
            </span>
        </div>
        <div class="container text-center fontSize18">
    	  <@channelListDirective channelId=39>
            <div class="row wxqd-red mgb20">
                <div class="col-md-11">
                    <div class="row">
    					<#list channels as cha>
    					<#if (cha_index lt 4)>
                        <div class="col-xs-6 col-md-3">
                            <a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
                        </div>
    					</#if>
    					</#list>
                    </div>
                </div>
            </div>
            <div class="row wxqd-red">
    			<#list channels as cha>
    				<#if (cha_index gte 4)>
    				<div class="${(cha_index%3==1)?string('col-md-offset-1','')} col-xs-6 col-md-3">
    					<a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
    				</div>
    				</#if>
    			</#list>
            </div>
    	</@channelListDirective>
        </div>
    </div>
    <div class="container bg-white">
       <#include "/template/jh-rdzt-current.ftl">
        <div class="jh-main">
            <div class="row">
                <div class="col-md-4">
    		<@channelListDirective channelId=own>
    			<#if channels?size gt 0>
    				<div class="fontSize18 pd3 color-red">${channel.displayName!}</div>
    				<ul class="news-list1 news-list1-sm wxqd-red fontSize16 clearfix">
    					<#list channels as cha>
    				    <li class="${(cha_index==0)?string('active','')}"><a href="${cha.url!}"><span class="glyphicon glyphicon-play-circle"></span>${cha.displayName!}</a> </li>
    				    </#list>
    				</ul>
    			<#else>
    				<@channelDirective channelId=channel.pid>
    				<div class="fontSize18 pd3 color-red">${channel.displayName!}</div>
    				<ul class="news-list1 news-list1-sm wxqd-red fontSize16 clearfix">
    							<@channelListDirective channelId=channel.id >
    							<#list channels as cha>
    				    <li class="${(cha.id==own)?string('active','')}"><a href="${cha.url!}"><span class="glyphicon glyphicon-play-circle"></span>${cha.displayName!}</a> </li>
    				    </#list>
    				</@channelListDirective>
    			</ul>
    				</@channelDirective>
    			</#if>
    		</@channelListDirective>
    			
                </div>
                <div class="col-md-8 pdTop1em">
    	    <@channelListDirective channelId=own>
    			<#if channels?size gt 0>
    				<#list channels as ch>
    					<#if ch_index==0>
    					<@channelDirective channelId=ch.id>
    				<div class="fontSize18 new-list2-t wxqd-red">${channel.displayName!}</div>
    						<@contentListDirective channelId=ch.id pageSize=channel.pageSize pageNum=pageNum titleLeft=35 order=2>
    						<#list contents as cont>
    				<ul class="panel2-list panel2-list-pd news-list2 wxqd-red">
    				    <li><a href="${cont.url!}" title="${cont.title!}" target="_blank">
    							<span class="panel2-list-content">${cont.shortTitle!}</span><span class="panel2-list-time">${cont.publishDate?string('yyyy-MM-dd')}</span>
    							</a></li>
    				</ul>
    						</#list>
    				${pagination!}
    						</@contentListDirective>
    					</@channelDirective>
    					</#if>
    				</#list>
    			<#else>
    				<@channelDirective channelId=own>
    				<div class="fontSize18 new-list2-t wxqd-red">${channel.displayName!}</div>
    						<@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=35 order=2>
    						<#list contents as cont>
    				<ul class="panel2-list panel2-list-pd news-list2 wxqd-red">
    				    <li><a href="${cont.url!}" title="${cont.title!}" target="_blank">
    							<span class="panel2-list-content">${cont.shortTitle!}</span><span class="panel2-list-time">${cont.publishDate?string('yyyy-MM-dd')}</span>
    							</a></li>
    				</ul>
    						</#list>
    				${pagination!}
    						</@contentListDirective>
    					</@channelDirective>
    			</#if>
    			</@channelListDirective>
                </div>
            </div>
        </div>
        <!--<div class="jh-link wxqd-red">
            <div class="jh-link-list text-center fontSize16 clearfix">
                <div class="current col-xs-4 col-md-2">友情链接</div>
                <div class="col-xs-4 col-md-2 jh-link-click" data-src="/html/jinhu-static/zybw"><a href="/html/jinhu-static/javascript:void(0);">中央部委网站</a><span class="jh-link-list-line">|</span></div>
                <div class="col-xs-4 col-md-2 jh-link-click" data-src="/html/jinhu-static/sqs"><a href="/html/jinhu-static/javascript:void(0);">省（区市）网站</a><span class="jh-link-list-line hidden-sm hidden-xs">|</span></div>
                <div class="col-xs-4 col-md-2 jh-link-click" data-src="/html/jinhu-static/jxs"><a href="/html/jinhu-static/javascript:void(0);">江苏省辖市网站</a><span class="jh-link-list-line">|</span></div>
                <div class="col-xs-4 col-md-2 jh-link-click" data-src="/html/jinhu-static/hxx"><a href="/html/jinhu-static/javascript:void(0);">淮安市辖县区网站</a><span class="jh-link-list-line">|</span></div>
                <div class="col-xs-4 col-md-2 jh-link-click" data-src="/html/jinhu-static/bdw"><a href="/html/jinhu-static/javascript:void(0);">本地网站 </a> </div>
            </div>
        </div>-->
    </div>
    <#include "/template/jh-footer.ftl">
    <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
    <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
    <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
    <script type="text/javascript">
        $(function () {
            $('input, textarea').placeholder();
        });
    </script>
    </body>
    </html>
    
   
  
 
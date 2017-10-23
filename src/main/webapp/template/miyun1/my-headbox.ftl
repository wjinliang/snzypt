<div class="headBox">
    	<div class="headBar">
        	<div class="container">
            	<h4>欢迎来到密云水库综合信息门户！</h4>
            </div>
        </div>
        <div class="headWrap">
        	<div class="head-bg-img">
            	<img src="/html/miyun1-static/img/title2.png" height="162px" style="width:100%;">
            </div>
            <div class="nav-box">
                <div class="container">
                    <div class="row">
                        <ul class="nav nav-pills alter-nav">
			<li class="<#if own??><#else> active</#if>"><a href="${site.url}">首页</a></li>
			<@channelListDirective siteId=1><#list channels as chan>
				<li class="<#if own??>${(own==chan.id)?string('active','')}</#if>"><a href="${chan.url}">${chan.displayName}</a></li> 
			</#list></@channelListDirective>
                           <#-- <li class="active"><a href="/html/miyun1-static/#">首页</a></li>
                            <li><a href="/html/miyun1-static/">组织机构</a></li>
                            <li><a href="/html/miyun1-static/">水库通讯</a></li>
                            <li><a href="/html/miyun1-static/">水库文化</a></li>
                            <li><a href="/html/miyun1-static/">水库新闻</a></li>
                            <li><a href="/html/miyun1-static/">公开栏</a></li>
                            <li><a href="/html/miyun1-static/">公示栏</a></li>
                            <li><a href="/html/miyun1-static/">工作通知</a></li>
                            <li><a href="/html/miyun1-static/">水库青年</a></li>
                            <li><a href="/html/miyun1-static/">道德讲堂</a></li>
                            <li><a href="/html/miyun1-static/">学习专栏</a></li>
                            <li><a href="/html/miyun1-static/">办公助手</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
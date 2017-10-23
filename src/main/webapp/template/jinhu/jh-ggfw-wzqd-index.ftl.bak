<!DOCTYPE html>
<html>
<head lang="en">
    <#include "/template/jh-meta.ftl">
    <title>${site.displayName!}-{channel.displayName!}</title>
    <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
    <script src="/html/jinhu-static/js/respond.min.js"></script>
    <![endif]-->
	 <style>
	.ft-bg {
	    margin: 2.5em 0 3em 0;
	    background-color: #aa0000;
	    height: 1em;
	    border-bottom: 3px solid #990000;
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
	  <@channelListDirective channelId=own>
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
<div class="container">
    <div class="jh-main color-oldgray">
        <div class="row mgb20">
            <div class="col-md-4">
				<@channelDirective channelId=111>
                <a href="${channel.url}" target="_blank">
				<div class="wxqd-pic-bg">
                    <div class="wxqd-pic fontSize18">
                        ${channel.displayName!}
                    </div>
                </div>
				</a>
				</@channelDirective>
            </div>
			<@channelDirective channelId=114>
            <div class="col-md-8 pdTop1em">
                <div class="wxqd-panel">
                    <div class="wxqd-panel-t wxqd-red">
                        <a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span><span class="more">更多 》</span> </a>
                        <div class="wxqd-panel-tw"></div>
                    </div>
                    <div class="wxqd-panel-c bg-white">
						<@contentListDirective channelId=channel.id pageSize=5>
                        <ul class="panel2-list panel2-list-pds wxqd-red">
							<#list contents as content>
                            <li><span class="jh-dotted color-oldgray">·</span><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
							</#list>
						</ul>
						</@contentListDirective>
                    </div>
                </div>
            </div>
			</@channelDirective>
        </div>
        <div class="row mgb20">
            <@channelDirective channelId=119>
            <div class="col-md-6 pdTop1em">
                <div class="wxqd-panel">
                    <div class="wxqd-panel-t wxqd-red">
                        <a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span><span class="more">更多 》</span> </a>
                        <div class="wxqd-panel-tw"></div>
                    </div>
                    <div class="wxqd-panel-c bg-white">
						<@contentListDirective channelId=channel.id pageSize=5>
                        <ul class="panel2-list panel2-list-pds wxqd-red">
							<#list contents as content>
                            <li><span class="jh-dotted color-oldgray">·</span><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span><span class="panel2-list-time">${content.publishDate?string('yyyy-MM-dd')}</span></a></li>
							</#list>
						</ul>
						</@contentListDirective>
                    </div>
                </div>
            </div>
			</@channelDirective>
            <div class="col-md-6">
                <div class="row wxqd-cbg">
				<@channelDirective channelId=115>
					<div class="col-md-6">
						<div class="wxqd-panel">
							<div class="wxqd-panel-t wxqd-red">
								<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span><span class="more">更多 》</span> </a>
								<div class="wxqd-panel-tw"></div>
							</div>
							<div class="wxqd-panel-c2 bg-red">
								<@channelListDirective channelId=channel.id pageSize=5>
									<#list channels as chan>
									<div class="wxqd-panel-bg bg-white"><a href="${chan.url!}" target="_blank">${chan.displayName!}</a></div>
									</#list>
								</@channelListDirective>
							</div>
						</div>
					</div>
					</@channelDirective>
					<@channelDirective channelId=117>
					<div class="col-md-6">
						<div class="wxqd-panel">
							<div class="wxqd-panel-t wxqd-red">
								<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
								<div class="wxqd-panel-tw"></div>
							</div>

							<div class="wxqd-panel-c bg-white wxqd-panel-cpd">
								<@contentListDirective channelId=channel.id pageSize=5>
								<ul class="panel2-list panel2-list-pds wxqd-red">
									<#list contents as content>
									<li><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span></a></li>
									</#list>
								</ul>
								</@contentListDirective>
							</div>
						</div>
					</div>
					</@channelDirective>
                    <!-- <div class="col-sm-6">
                       <div class="wxqd-panel">
                            <div class="wxqd-panel-t wxqd-red">
                                <a href="#" class="wxqd-panel-tbg"><span class="color-white fontSize18">投资项目和申报材料</span></a>
                                <div class="wxqd-panel-tw"></div>
                            </div>
                            <div class="wxqd-panel-c bg-white wxqd-panel-cpd">
                                <ul class="panel2-list panel2-list-pds wxqd-red">
                                    <li><a href="#"><span class="panel2-list-content">金湖县投资项目目录</span></a></li>
                                    <li><a href="#"><span class="panel2-list-content">金湖县外商投资项目快速审批</span></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="wxqd-panel">
                            <div class="wxqd-panel-t wxqd-red">
                                <a href="#" class="wxqd-panel-tbg"><span class="color-white fontSize18">专项资金管理</span></a>
                                <div class="wxqd-panel-tw"></div>
                            </div>
                            <div class="wxqd-panel-c wxqd-panel-cpd">
                                <ul class="panel2-list panel2-list-pds wxqd-red">
                                    <li><a href="#"><span class="panel2-list-content">金湖县2015年县本级财政</span></a></li>
                                    <li><a href="#"><span class="panel2-list-content">专项资金管理目录清单</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>-->
                </div>
            </div>
        </div>
        <div class="row">
            <@channelDirective channelId=120>
					<div class="col-md-8">
						<div class="wxqd-panel">
							<div class="wxqd-panel-t wxqd-red">
								<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
								<div class="wxqd-panel-tw"></div>
							</div>

							<div class="wxqd-panel-c bg-white wxqd-panel-cpd">
								<@contentListDirective channelId=channel.id pageSize=5>
								<ul class="panel2-list panel2-list-pds wxqd-red">
									<#list contents as content>
									<li><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span></a></li>
									</#list>
								</ul>
								</@contentListDirective>
							</div>
						</div>
					</div>
					</@channelDirective>
					<@channelDirective channelId=118>
					<div class="col-md-4 pdTop1em">
						<div class="wxqd-panel">
							<div class="wxqd-panel-t wxqd-red">
								<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
								<div class="wxqd-panel-tw"></div>
							</div>

							<div class="wxqd-panel-c bg-white wxqd-panel-cpd">
								<@contentListDirective channelId=channel.id pageSize=5>
								<ul class="panel2-list panel2-list-pds wxqd-red">
									<#list contents as content>
									<li><span class="jh-dotted color-oldgray">·</span><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span></a></li>
									</#list>
								</ul>
								</@contentListDirective>
							</div>
						</div>
					</div>
					</@channelDirective>
            
        </div>
	<div class="row">
		<@channelListDirective channelId=own excludeIds='111,114,115,117,118,119,120'>
		<#list channels as channel>
		<div class="col-md-6 pdTop1em">
			<div class="wxqd-panel">
				<div class="wxqd-panel-t wxqd-red">
					<a href="${channel.url!}"  target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName!}</span></a>
					<div class="wxqd-panel-tw"></div>
				</div>

				<div class="wxqd-panel-c bg-white wxqd-panel-cpd">
					<@contentListDirective channelId=channel.id pageSize=5>
					<ul class="panel2-list panel2-list-pds wxqd-red">
						<#list contents as content>
						<li><span class="jh-dotted color-oldgray">·</span><a href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span></a></li>
						</#list>
					</ul>
					</@contentListDirective>
				</div>
			</div>
		</div>
		</#list>
		</@channelListDirective>
	</div>
    </div>
    
</div>
<#include "jh-footer.ftl">
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
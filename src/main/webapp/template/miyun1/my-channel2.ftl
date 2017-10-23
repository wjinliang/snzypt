<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9"/>
<title>欢迎来到密云水库综合信息门户！</title>
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/style1.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/style2.css">
<script type="text/javascript" src="/html/miyun1-static/js/jquery-1.12.1.min.js"></script>
</head>
<body>
	<#include "/template/my-headbox.ftl">
 <!--主内容区-->
	<div class="con-wrap pdb20">
    	<div class="container">
        	<ol class="my-breadcrumb">
            	<span>当前位置</span>
		<@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                <!-- <a href="/html/miyun1-static/" target="_blank" title="首页">首页</a>&nbsp;&nbsp;&nbsp;>>
                <a href="/html/miyun1-static/" target="_blank" title="工作通知">工作通知</a>-->
            </ol>
        	<div class="my-main">
            	<div class="row">
                	<!--左边通知栏导航条-->
                    	<div class="col-md-3">
                        	<div class="wInform">
				<#if channel.pid??>
					<@channelDirective channelId=channel.pid>
					<div class="blue-bg wInform-tit">
						${channel.displayName!}
					</div>
					<@channelListDirective channelId=channel.id>
					<div class="wInform-con">
						<ul>
						<#if (channels?size>0)>
						<#list channels as chan>
						<li rel="tz-rep" class="${(chan.id==own)?string('curtab','')}"><a href="${chan.url!}" >${chan.displayName!}</a></li>
						</#list>
						<#else>									
										<li rel="tz-rep" class="curtab"><a href="${channel.url}">${channel.displayName!}</a></li>
									</#if>
					    </ul>
					</div>
					</@channelListDirective>
					</@channelDirective>
					
					<#else>
						<div class="blue-bg wInform-tit">
							${channel.displayName!}
						</div>
						<div class="wInform-con">
							<ul>
							<@channelListDirective channelId=channel.id>
								<div class="wInform-con">
									<#if (channels?size>0)>
										<#list channels as chan>
											<li rel="tz-rep" class="${(chan.id==own)?string('curtab','')}"><a href="${chan.url!}">${chan.displayName!}</a></li>
										</#list>
									<#else>									
										<li rel="tz-rep" class="curtab"><a href="${channel.url}">${channel.displayName!}</a></li>
									</#if>
								</div>
							</@channelListDirective>
							</ul>
						</div>
					</#if>
                            	 
                            </div>
                        </div>
                    <!--右边通知栏具体内容-->
                    	<div class="col-md-9">
                        	<div class="bg-white">
                           		<div class="border-gray panel-tit">
                                	<p class="icon">${channelName!}</p>
                                </div>
				<@contentListDirective channelId=own pageSize=pageSize pageNum=pageNum titleLeft=38>
                                <div class="panel-body">
                                	<ul class="panel-list" rel="info_pad" style="display:block;">
                                    	<#list contents as con>
					<li>
                                        	<span class="my-dotted">.</span>
                                            <a href="${con.url!}" target="_blank" title=${con.title!}>
                                            	<span class="panel-list-con">${con.shortTitle!}</span>
                                                <span class="panel-list-time">[${con.publishDate?string('YYYY-MM-dd')}]</span>
                                            </a>
                                        </li>
					</#list>
                                    </ul>
                                </div>
				${paginationlist}
                                </@contentListDirective> 
                                
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/my-footer.ftl">
<script type="text/javascript" src="/html/miyun1-static/js/webjs.js"></script>
</body>
</html>

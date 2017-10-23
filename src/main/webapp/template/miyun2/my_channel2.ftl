<!doctype html>
<html>
<head>
<#include "/template/my_head.ftl">
</head>

<body>
	<#include "/template/my_header.ftl">
     <div class="wrapper my_bg" id="wrapper" style="min-height:660px; background-size:cover;">
     	<div class="container">
            <div class="row">
            	<div class="col-md-12">
                    <div class="position-info">
                        <span>您所在的位置：</span>
		<@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                    </div>
                </div>
            </div>
            <div class="my-main">
                <div class="row">
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
                    <div class="col-md-9">
                        	<div class="bg-white my-mainNews">
                           		<div class="border-gray panel-tit">
                                	<p class="icon">${channelName!}</p>
                                </div>

								<@contentListDirective channelId=own pageSize=pageSize pageNum=pageNum titleLeft=38>
                                <div class="panel-body">
                                	<ul class="newsList clearfix" style="margin-top:0;">
                                    	<#list contents as con>
					<li>
                                        	<span class="my-dotted">.</span>
                                            <a href="${con.url!}" target="_blank" title=${con.title!}>
                                            	${con.shortTitle!}</a>
                                                <span >[${con.publishDate?string('YYYY-MM-dd')}]</span>
                                            
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
     <#include "/template/my_footer.ftl">
<script type="text/javascript" src="/html/miyun-static/static/js/webindex.js"></script>
</body>
</html>

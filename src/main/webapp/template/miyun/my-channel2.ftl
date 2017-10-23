<!doctype html>
<html>
<#include "/template/my-head.ftl"/>

<body>
	<#include "/template/my-daohang.ftl"/>
 <!--主内容区-->
 <#assign channelName = channel.displayName>
 <#assign pageSize = channel.pageSize>
	<div class="main-content pdb20">
    	<div class="container">
        	<ol class="my-breadcrumb">
            	<span>当前位置</span>
                <@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
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
    <#include "/template/my-footer.ftl"/>
</body>
</html>

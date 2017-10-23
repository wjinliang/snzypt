<!DOCTYPE html>
        <html>
        <head lang="en">
           <#include "/template/jh-meta.ftl">
            <title>${site.displayName!}</title>
          	<meta name="keywords" content="" />
            <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
            <script src="/html/jinhu-static/js/respond.min.js"></script>
            <![endif]-->
        </head>
        <body>
        
        <#include "/template/jh-head.ftl"/>
        <#include "/template/jh-daohang.ftl"/>
        <div class="container bg-white">
            <ol class="breadcrumb fontSize16 jh-breadcrumb">
                <span class="jh-dotted">·</span>
                <@currentLocationDirective channelId=own divider="   /   ">${current}</@currentLocationDirective>
            </ol>
        	
              <div class="jh-main">
	      <div class="clearfix text-center fontSize16 mgb10">
            
	<@channelListDirective channelId=own >
		<#list channels as chann>
		    <div class="col-xs-4 col-md-2">
			<a href="${chann.url!}" class="thumbnail thumbnails color-green">
			    <img src="/html/jinhu-static/img/ggfw_${chann.enName!}_icon1.png">
			    <p>${chann.displayName!}</p>
			</a>
		    </div>
		 </#list>
	 </@channelListDirective>
            
        </div>
	<@channelListDirective channelId=own>
	<#list channels as c>
	<#if (c_index==0)>
        <div class="fontSize18 color-green mgb20">专题服务 - ${channel.displayName!}</div>
	<div class="row">
	<@channelListDirective channelId=c.id channelType='0'>
		<#if (channels?size gt 2)>
			<#if (channels?size == 4)>
				<#list channels as channel>
					 <div class="col-md-6">
						<div class="panel panel-default panel1">
						    <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName!}</a></div>
						    <div class="panel-body">
							<ul class="panel2-list panel2-list-sm">
							<@contentListDirective channelId=channel.id pageSize=7 pageNum=1 titleLeft=27 order=2>
							<#list contents as cont>
								<li><span class="jh-dotted">·</span><a title="${cont.title!}" href="${cont.url!}" target="_blank"><span class="panel2-list-content">${cont.title!}</span><span class="panel2-list-time">${cont.publishDate?string("yyyy-MM-dd")}</span></a></li>
							</#list>
							</@contentListDirective >
							    </ul>
						    </div>
						</div>
					    </div>	
				</#list>
			<#elseif (channels?size ==3)>
				<#list channels as channel>
					<div class="col-md-4">
						<div class="panel panel-default panel1">
<div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName!}</a></div>
						    <div class="panel-body">
							<ul class="panel2-list panel2-list-sm">
							   <@contentListDirective channelId=channel.id pageSize=7 pageNum=1 titleLeft=15 order=2>
								<#list contents as cont>
									<li><span class="jh-dotted">·</span><a title="${cont.title!}" href="${cont.url!}" target="_blank"><span class="panel2-list-content">${cont.title!}</span></a></li>
								</#list>
								</@contentListDirective >
							</ul>
						    </div>
						</div>
					    </div>
				</#list>
			<#else>
				<#list channels as channel>
					<#if (channel_index == 0)><div class="col-md-7"></#if>
					<#if (channel_index == 1)><div class="col-md-5"></#if>
					<#if (channel_index gt 1)><div class="col-md-4"></#if>
					
						<div class="panel panel-default panel1">
						   <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName!}</a></div>
						    <div class="panel-body">
							<ul class="panel2-list panel2-list-sm">
							   <@contentListDirective channelId=channel.id pageSize=7 pageNum=1 titleLeft=15 order=2>
								<#list contents as cont>
									<li><span class="jh-dotted">·</span><a title="${cont.title!}" href="${cont.url!}" target="_blank"><span class="panel2-list-content">${cont.title!}</span><#if (channel_index lt 2)><span class="panel2-list-time">${cont.publishDate?string("yyyy-MM-dd")}</span></#if></a></li>
								</#list>
								</@contentListDirective >
							</ul>
						    </div>
						</div>
					    </div>
				</#list>
			</#if>
		</#if>
		<#if (channels?size == 2)>
			<#list channels as channel>
					 <div class="col-md-6">
						<div class="panel panel-default panel1">
						    <div class="panel-heading panel1-t"><a href="${channel.url}" target="_blank" class="panel1-ton fontSize18">${channel.displayName!}</a></div>
						    <div class="panel-body">
							<ul class="panel2-list panel2-list-sm">
							<@contentListDirective channelId=channel.id pageSize=7 pageNum=1 titleLeft=27 order=2>
							<#list contents as cont>
								<li><span class="jh-dotted">·</span><a href="${cont.url!}" target="_blank"><span class="panel2-list-content">${cont.title!}</span><span class="panel2-list-time">${cont.publishDate?string("yyyy-MM-dd")}</span></a></li>
							</#list>
							</@contentListDirective >
							    </ul>
						    </div>
						</div>
					    </div>	
				</#list>
		</#if>
	</@channelListDirective>
	</div>
	<@channelListDirective channelId=c.id channelType='2'>
		<div class="row" style="text-align: center;">
			<#list channels as ch>
			<div class="col-md-2">
				<a href="${ch.url!}" target="_blank" class="index-jbzw-btn index-jbzw-btns">${ch.displayName!}</a>
			</div>
			</#list>
		</div>
	</@channelListDirective>
    </#if>
	</#list >
	</@channelListDirective>
        </div>
            <#include "/template/jh-links.ftl">
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
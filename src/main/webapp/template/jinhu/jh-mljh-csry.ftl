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
        	
            <div class="jh-main jh-article">
              
	       <@contentListDirective channelId=own pageSize=8 pageNum =pageNum >
	        <div class="ggfw-ztfw-list">
			<#list contents as content>
				<#if (content_index ==0)>
					<div class="clearfix mgb20 pdt10 pdb10">
					<div class="col-md-4">
					    <a href="${content.url!}" target="_blank" class="thumbnail thumbnails">
						<img src="${content.titleImageUrl}">
					    </a>
					</div>
					<div class="col-md-8 pdt10">
					    <a href="${content.url!}" target="_blank">
						<p class="fontSize18 mgb20">${content.title!}</p>
						
						<p class="mgb20">${content.brief!}<span class="color-green">【详细】</span></p>
						
						<p class="color-gray">${content.publishDate?string("yyyy年MM月dd日")}</p>
					    </a>
					</div>
				    </div>
				</#if>
				<#if (content_index gt 0)>
				<div class="clearfix mgb20 pdt10 pdb10">
					<div class="col-md-3">
					    <a href="${content.url!}" target="_blank" class="thumbnail thumbnails">
						<img src="${content.titleImageUrl}">
					    </a>
					</div>
					<div class="col-md-9 pdt10">
					    <a href="${content.url!}" target="_blank">
						<p class="fontSize18 mgb20">${content.title!}</p>
						
						<p class="mgb20">${content.brief!}<span class="color-green">【详细】</span></p>
						
						<p class="color-gray">${content.publishDate?string("yyyy年MM月dd日")}</p>
					    </a>
					</div>
				    </div>
				</#if>
			</#list>
			</div>
			${pagination} 
	       </@contentListDirective>

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
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
        	
            <div class="jh-main mljh-shly-bg">
        <div class="mljh-shly-tpd">
            <div class="row">
		<@channelListDirective channelId=channel.pid>
		<#list channels as chan>
                <div class="col-xs-4">
                    <a href="${chan.url!}" class="mljh-shly-tbg fontSize18 ${(chan.id==own)?string('active','')}">${chan.displayName!}</a>
                </div>
		</#list>
		</@channelListDirective>
                
            </div>
        </div>
        <div class="mljh-shly-border">
            <div class="mljh-shly-sbg">
                   <font style="color: #55a421;font-size: 4ex;">${channel.displayName!}</font>
            </div>
        </div>
        
		<@contentListDirective channelId=own pageSize=channel.pageSize pageNum= pageNum>
		<div class="ggfw-ztfw-list">
		<#list contents as content>
		    <div class="clearfix borderBottom mgb20 pdt10 pdb10">
			<div class="col-md-3">
			    <a href="${content.url!}" target="_blank" class="thumbnail thumbnails">
				<img src="${content.titleImageUrl!}">
			    </a>
			</div>
			<div class="col-md-9 pdt10">
			    <a href="${content.url!}" target="_blank">
				<p class="fontSize18">${content.title}</p>
				<p>${content.brief!}<span class="color-green">【详细】</span></p>
				<p class="color-gray">${content.publishDate?string("yyyy年MM月dd日")}</p>
			    </a>
			</div>
		    </div>
		    </#list>
		    </div>
		${pagination} 
	       </@contentListDirective>

    </div>
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
           function window.onload() 
	{ 
	var arr; 
	if(arr=document.cookie.match(/scrollTop=([^;]+)(;|$)/)) 
	document.documentElement.scrollTop=parseInt(arr[1]); 
	document.body.scrollTop=parseInt(arr[1]); 
	} 

	//页面刷新前保存滚动条位置信息到cookie 

	function window.onbeforeunload(){ 
	var scrollPos; 
	if (typeof window.pageYOffset != 'undefined') { 
	   scrollPos = window.pageYOffset; 
	} 
	else if (typeof document.compatMode != 'undefined' && 
	     document.compatMode != 'BackCompat') { 
	   scrollPos = document.documentElement.scrollTop; 
	} 
	else if (typeof document.body != 'undefined') { 
	   scrollPos = document.body.scrollTop; 
	} 
	document.cookie="scrollTop="+scrollPos; 
	}  
	if (window.addEventListener)  
                {  
                     window.addEventListener("load", onloadt, false);  
                     window.addEventListener("beforeunload",onbeforeunloadt,false)  
                }else if (window.attachEvent){  
                     window.attachEvent("load",onloadt,false);  
                     window.attachEvent("beforeunload",beforeunloadt,false);  
                }else{  
                     window.onload=onbeforeunloadt;  
                     window.onload=onloadt;  
                }  
     </script>
        </body>
</html>
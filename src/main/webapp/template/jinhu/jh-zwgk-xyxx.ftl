<!DOCTYPE html>
         <html>
         <head lang="en">
             <#include "/template/jh-meta.ftl">
	     <meta name="keywords" content="${channel.displayName}">
             <title>${site.displayName}-${channel.displayName}</title>
             <link href="/html/jinhu-static-z01/bootstrap/css/bootstrap.min.css" rel="stylesheet">
             <link href="/html/jinhu-static-z01/css/style.ts.css" rel="stylesheet">
             <!--[if lt IE 9]>
             <script src="/html/jinhu-static-z01/js/html5shiv.min.js"></script>
             <script src="/html/jinhu-static-z01/js/respond.min.js"></script>
             <![endif]-->
         </head>
         <body class="ztrd4-bg">
         <div class="container">
             <div class="ztrd4-logo text-center">
               <#if channel.channelIcon??>
                 <img src="${channel.channelIcon!}">
                 </#if>
             </div>
         </div>
         <div class="pos-r">
             <img src="/html/jinhu-static-z01/img/zt4_bg1.png" class="ztrd4-bg1">
             <div class="container">
                <div class="jh-main bg-white ztrd4 fontSize16">
		<!-- Nav tabs -->
            <ul class="nav nav-tabs fontSize18 navTab1 navTab3 text-center" role="tablist" id="navTab2">
		<@channelListDirective channelId=channel.pid >
		<#list channels as chan>
                <li role="presentation" class="${(chan.id==own)?string('active','')} wdAuto"><a href="${chan.url}" aria-controls="xzcf" role="tab" >${chan.displayName}</a></li>
                </#list>
		</@channelListDirective>
            </ul>
            <!-- Tab panes -->
		    <div class="tab-content navTab1-content navTab3-content pTextIndent">
			<div role="tabpanel" class="tab-pane active" >
			
		    <@contentListDirective channelId=own pageSize=10 pageNum=pageNum order=2>
		    <ul class="panel2-list panel2-list-pd ztrd3-panel borderBottom pdb10">
		    <#list contents as content>
			<li><a title="${content.title}" href="${content.url!}" target="_blank"><span class="panel2-list-content">${content.title!}</span><span class="panel2-list-time">${content.publishDate?string("yyyy-MM-dd")}</span></a></li>
		    </#list>
		    </ul>
		    ${pagination} 
		    </@contentListDirective>
		</div>
	</div>
         <#include "/template/jh-footer.ftl">
         <script type="text/javascript" src="/html/jinhu-static-z01/js/jquery-1.12.1.min.js"></script>
         <script type="text/javascript" src="/html/jinhu-static-z01/js/jquery.placeholder.min.js"></script>
         <script type="text/javascript" src="/html/jinhu-static-z01/bootstrap/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="/html/jinhu-static-z01/js/js.js"></script>
         <script type="text/javascript">
             $(function () {
                 $('input, textarea').placeholder();
             });
         </script>
         </body>
         </html>
         
        
       
      
     
    
   
  
 
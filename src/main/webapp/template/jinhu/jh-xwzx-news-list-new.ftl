<!DOCTYPE html>
            <html>
            <head lang="en">
               <#include "/template/jh-meta.ftl">
                 <title>${site.displayName}-${channel.displayName}</title>
                <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
                <!--[if lt IE 9]>
                <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                <script src="/html/jinhu-static/js/respond.min.js"></script>
                <![endif]-->
                <style type="text/css">
            		.rcmz-bg-white{background:#fffaf0}
            		.rcmz-bg-white .rcmz_bg{height:377px; background:url(/html/jinhu-static/img/wrong_bg.jpg) no-repeat center top;}
            		.rcmz-bg-white .rcmz_logo{padding:150px 0 120px 0; text-align:center;}
            		.rcmz-bg-white .rcmz_fhsy_div{width:80%; text-align:right;}
            		.rcmz-bg-white .zsyz_fhsy{display:inline-block;}
            		.rcmz-bg-white .addwidth{width:90%; margin:0 auto;}
            		.rcmz-bg-white .ft-bg-red{margin:2.5em 0 3em 0; background:#97040c; height:1em;}
            		.rcmz-bg-white .color-green{color:#97040c;}
            		.rcmz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
                  .ft .ft-bg{background-color:#97040c;border-bottom: 3px solid #6B0019;}
                     .ft {
                          background-color: #fffaf0; 
                     }
               		
                     .color-green{color:#97040c;}
                     a:focus, a:active, a:hover {
                        color: #97040c;
                    }
            		
            	</style>
            </head>
            <body>
            <body class="rcmz-bg-white">
            <div class="rcmz_bg">
            	<div class="rcmz_logo"><img src="/html/jinhu-static/img/fault.png"></div>
            	<div class="rcmz_fhsy_div"><a href="${site.url}" class="zsyz_fhsy" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
            </div>
            
            <div class="container bg-white">
               <#include "/template/jh-rdzt-current.ftl">
               <div class="jh-main">
                   <div class="row">
                       <div class="col-md-4">
           		<@channelDirective channelId=channel.pid>
                           <div class="fontSize18 pd3 color-green">${channel.displayName}</div>
                           <ul class="news-list1 news-list1-sm wxqd-red fontSize16 clearfix">
           		<@channelListDirective channelId=channel.id order=1 >
           		 <#list channels as channel>
                               <li class="${(channel.id==own)?string('active','')}">
           		    <a href="${channel.url}"><span class="glyphicon glyphicon-play-circle"></span>${channel.displayName}</a> </li>
                             </#list> 
           		</@channelListDirective> 
                           </ul>
           		</@channelDirective>
                       </div>
                       <div class="col-md-8 pdTop1em">
           	    <@channelDirective channelId=own>
                           <div class="fontSize18 new-list2-t wxqd-red">${channel.displayName}</div>
    		        <#if channel.id==16>
                            <@videoListDirective channelId=16 pageSize=channel.pageSize pageNum=pageNum  titleLeft=50 >
    			<ul class="panel2-list panel2-list-pd news-list2">
    			  <#list cmsVideos as video>
    				<li><a target="_blank" href="${video.url!}" title="${video.name}">
    				<span class="panel2-list-content">${video.name!}</span>
    				<span class="panel2-list-time">${video.publishDate?string("yyyy-MM-dd")}</span></a></li>	
    			  </#list>
                           </ul> 
           			${pagination}
                       </@videoListDirective>
                        <#else>
           		   <@contentListDirective channelId=channel.id pageSize=channel.pageSize pageNum=pageNum titleLeft=50 order=2>
                           <ul class="panel2-list panel2-list-pd news-list2">
    			  <#list contents as cmsContent>
    				<li><a target="_blank" href="${cmsContent.url}" title="${cmsContent.title}">
    				<span class="panel2-list-content">${cmsContent.shortTitle}</span>
    				<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>	
    			  </#list>
                           </ul> 
           			${pagination} 
           		</@contentListDirective>
                      </#if> 
           	    </@channelDirective ></div>
                   </div>
               </div>
           </div>
            <#include "/template/jh-footer.ftl">
            <script type="text/javascript" src="/html/jinhu-static/js/visit-record.js"></script>  
            <script type="text/javascript" src="/html/jinhu-static/js/search-jinhu.js"></script>   
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
            
           
          
         
        
       
      
     
    
   
  
 
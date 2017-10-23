<!DOCTYPE html>
             <html>
             <head lang="en">
                 <#include "/template/jh-meta.ftl">
                 <title>${site.displayName!}-${channel.displayName!}</title>
                 <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                 <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
       	            <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
                 <!--[if lt IE 9]>
                 <script src="/html/jinhu-static-z01/js/html5shiv.min.js"></script>
                 <script src="/html/jinhu-static-z01/js/respond.min.js"></script>
                 <![endif]-->
       	  <style type="text/css">
       		.fhsy{height:50px; line-height:50px; text-align:right;}
       		.fhsy a{ text-decoration:underline; color:#ff5c37; font-family:"黑体"; margin-left:10px;}
       		.ztrd3_logo{margin-top:0px; }
       		.panel2-list-content{width:70%;}
       		.panel2-list-pd{width:95%; margin:0 auto;}
               
       	</style>
             </head>
             <body class="ztrd3-bg">
       <div class="container">
       
       	<div class="fhsy"><a href="${site.url!}"><!--<img src="/html/jinhu-static/img/fhsy.png">-->返回主站</a></div>
           <div class="ztrd3_logo">
               <#if channel.channelIcon??>
                     <img src="${channel.channelIcon!}">
                </#if>
           </div>
       </div>
       <div class="container">
       
          <#include "/template/jh-rdzt-current.ftl">
           <div class="jh-main">
               <div class="ztrd3_pd fontSize16">
             		<@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=2>  	
             		<ul class="panel2-list panel2-list-pd ztrd3-panel">
             		<#list contents as cmsContent>
             			 <li><a href="${cmsContent.url} " title="${cmsContent.title}" target="_blank"><span class="panel2-list-content">${cmsContent.title}</span><span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
             		</#list>	
                         </ul>
                         ${pagination}
                     </@contentListDirective>
                     </div>
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
             
            
           
          
         
        
       
      
     
    
   
  
 
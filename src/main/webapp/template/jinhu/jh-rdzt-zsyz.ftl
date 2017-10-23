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
             		.zsyz-bg-white{background:#fffaf0;}
             		.zsyz-bg-white .zsyz-bg{position:relative; height:366px; width:100%; background:url(/html/jinhu-static/img/zsyz-bg.jpg) no-repeat center top;}
             		.zsyz-bg-white .zsyz_fhsy_div{position:absolute; right:15%; bottom:-2%;}
             		.zsyz-bg-white .zsyz_fhsy{display:inline-block;}
             		.zsyz-bg-white .zsyz-panel{width:80%; margin:0 auto;}
             		.ft .ft-bg{background-color:#97040c;border-bottom: 3px solid #6B0019;}
                   .ft {
                        background-color: #fffaf0; 
                   }
             		.zsyz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
                   .color-green{color:#97040c;}
                   a:focus, a:active, a:hover {
                      color: #97040c;
                  }
                   
            }
             		
             	</style>
             </head>
             <body>
             <body class="zsyz-bg-white">
             <div class="zsyz-bg">
             	<div class="zsyz_fhsy_div"><a href="${site.url}" class="zsyz_fhsy" alt="返回首页" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
             </div>
             
             <div class="container">
                 <#include "/template/jh-rdzt-current.ftl">
                 <div class="jh-main">
                  
                      <div class="ztrd3_pd zsyz-panel fontSize16">
             		    
             			<@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=40 order=2> 
             			  <ul class="panel2-list ztrd3-panel pdb10 lxyz-add-border">
             				<#list contents as cmsContent>
             					 <li><a href="${cmsContent.url}" title="${cmsContent.title}" target="_blank"><span class="panel2-list-content">${cmsContent.shortTitle}</span><span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>											
             				</#list> 
             				${pagination}  
             			  </ul>
             			</@contentListDirective>
             
             		 
             				   
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
             
            
           
          
         
        
       
      
     
    
   
  
 
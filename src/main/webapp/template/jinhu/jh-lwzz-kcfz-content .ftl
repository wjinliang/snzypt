<!DOCTYPE html>
             <html>
             <head lang="en">
                 <#include "/template/jh-meta.ftl">
                 <title></title>
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
           <@channelDirective channelId=cmsContent.channelId>
             <#if channel.channelIcon??>
                   <img src="${channel.channelIcon!}">
              </#if>
             </@channelDirective>
         </div>
     </div>
            <div class="container">
               <ol class="breadcrumb fontSize16 jh-breadcrumb">
                           <span class="jh-dotted">·</span>
                           <@currentLocationDirective contentId=own divider="   /   "stopChannelId=19>${current}</@currentLocationDirective>
                       </ol>
                   	
                       <div class="jh-main jh-article">
                           <div class="jh-article-title fontSize22 text-center"><span style="${cmsContent.titleStyle!}">${cmsContent.title?default("")}</span></div>
                           <div class="jh-article-info text-center">
                               <span>发布日期：<#if cmsContent.publishDate??>${(cmsContent.publishDate?string("yyyy-MM-dd"))}</#if></span>
                               <span>出处：${cmsContent.origin?default("")}</span>
                               <span>作者：${cmsContent.author?default("")}</span>
           			<div class="jh-share-btn" style="margin-top: -15px;">
              			
           			<span  class="bdsharebuttonbox">
           			<a href="#" class="bds_more" data-cmd="more"></a>
           			<a href="#" class="bds_qzone" data-cmd="qzone"></a>
           			<a href="#" class="bds_tsina" data-cmd="tsina"></a>
           			<a href="#" class="bds_tqq" data-cmd="tqq"></a>
           			<a href="#" class="bds_renren" data-cmd="renren"></a>
           			<a href="#" class="bds_weixin" data-cmd="weixin"></a>
           			</span>
           <script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdPic":"","bdStyle":"0","bdSize":"16"},"share":{},"image":{"viewList":["qzone","tsina","tqq","renren","weixin"],"viewText":"分享到：","viewSize":"16"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","tsina","tqq","renren","weixin"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
           			
           		</div>
           		</div>
                          <!--<div class="thumbnail jh-article-thumbnail">
                   	<#if cmsContent.titleImageUrl?? &&(cmsContent.titleImageUrl!='')>
                          
                               <img src="${cmsContent.titleImageUrl}">
                           
                   	</#if>
                            </div>-->
                           <div class="jh-article-p" style="min-height: 380px;">
           		</br>
                               ${cmsContent.contentText?default("")}
                           </div>
                       </div>
                   		<#if cmsAttachments??>
                   		   <div class="jh-article-download">
                   				   <#list cmsAttachments as cmsAttachment>
                   				  
                   				   <a href='/jinhuadmin/cms/attachment/download/${cmsAttachment.id}'><div class="btn btn-default btn-lg btn-download">
                   				   <span class="glyphicon glyphicon-save-file"></span><span style="font-size: 1.3ex;">&nbsp; 
                   				   ${cmsAttachment.attachmentName?default("未命名")}
                   				   &nbsp;</span>
                   				   </div></a>
                   				  
                   				   </#list>
                   			   </div>
                   		  
                   	 </#if>
                    
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
             
            
           
          
         
        
       
      
     
    
   
  
 
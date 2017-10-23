<!DOCTYPE html>
           <html>
           <head lang="en">
               <#include "/template/jh-meta.ftl">
                 <title>${cmsContent.title}</title>
               <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
               <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
               <!--[if lt IE 9]>
               <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
               <script src="/html/jinhu-static/js/respond.min.js"></script>
               <![endif]-->
               <style type="text/css">
           		.lxyz-bg-white{background:#fffaf0 url(/html/jinhu-static/img/lxyz-bg1.jpg) center top no-repeat;;}
           		.lxyz-bg-white .lxyz_logo{ text-align:left; padding:140px 0 110px 50px;}
           		.lxyz-bg-white .lxyz_fhsy_div{width:80%; text-align:right;}
           		.lxyz-bg-white .lxyz_fhsy{ display:inline-block;}
           		.lxyz-bg-white .lxyz-panel{width:80%; margin:0 auto;}
           		.lxyz-bg-white .ft-bg-red{margin:2.5em 0 3em 0; background:#97040c; height:1em;}
           		.lxyz-bg-white .color-red{color:#97040c;}
           		.lxyz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
                  .ft .ft-bg{background-color:#97040c;border-bottom: 3px solid #6B0019;}
                           .ft {
                                background-color: #fffaf0; 
                           }
                     		.zsyz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
                           .color-green{color:#97040c;}
                           a:focus, a:active, a:hover {
                              color: #97040c;
                          }
                  .jh-article-info{
              padding: 1em 0;
              border-bottom: 1px solid #990002;
              position: relative;
          }
                		
           		
           	</style>
           </head>
           <body>
           <body class="lxyz-bg-white">
           <div class="lxyz-bg">
           	<div class="lxyz_logo"><img src="/html/jinhu-static/img/lxyz.png"></div>
               <div class="lxyz_fhsy_div"><a href="${site.url}" class="lxyz_fhsy" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
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
           
          
         
        
       
      
     
    
   
  
 
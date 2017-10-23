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
              <body class="rcmz-bg-white">
              <div class="rcmz_bg">
              	<div class="rcmz_logo"><img src="/html/jinhu-static/img/fault.png"></div>
              	<div class="rcmz_fhsy_div"><a href="${site.url}" class="zsyz_fhsy" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
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
              
             
            
           
          
         
        
       
      
     
    
   
  
 
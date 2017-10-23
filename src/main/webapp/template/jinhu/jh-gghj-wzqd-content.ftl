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
                  		.zxzj-pic-bg{height:125px; background:url(/html/jinhu-static/img/bgwzqd.png) no-repeat left 12px top;}
                  		.zxzj-pic-bg ul li{ text-align:center;}
                  		.wzqd-ft-bg{margin:0 0 2em 0; height:1em; background:#990000;}
                  		.addft{ background:#f0f0f0}
                        .ft-bg {
                             margin: 2.5em 0 3em 0;
                             background-color: #97040c;
                             height: 1em;
                             border-bottom: 3px solid #6B0019;
                         }
                        .ft { background-color: #f0f0f0;} 
                        .mgb20 {margin-bottom: 20px;}
                  	</style>
                  </head>
                  <body class="wxqd-bg-white">
                      <div class="wxqd-bg">
                          <div class="wxqd-logo">
                              <span class="thumbnail thumbnails">
                                  <img src="/html/jinhu-static/img/wxqd_logo.png">
                              </span>
                          </div>
                  		<div class="container text-center fontSize18">
                       	  <@channelListDirective channelId=39>
                               <div class="row wxqd-red mgb20">
                                   <div class="col-md-11">
                                       <div class="row">
                       					<#list channels as cha>
                  							<#if (cha_index lt 4)>
                  								 <div class="col-xs-6 col-md-3">
                  									 <a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
                  								 </div>
                  							</#if>
                       					</#list>
                                       </div>
                                   </div>
                               </div>
                               <div class="row wxqd-red">
                       			<#list channels as cha>
                       				<#if (cha_index gte 4)>
                       				<div class="${(cha_index%3==1)?string('col-md-offset-1','')} col-xs-6 col-md-3">
                       					<a href="${cha.url!}" class="wxqd-nav color-red1">${cha.displayName!}</a>
                       				</div>
                       				</#if>
                       			</#list>
                               </div>
                       	  </@channelListDirective>
                          </div>
                      </div>
                       <div class="container">
                        <ol class="breadcrumb fontSize16 jh-breadcrumb">
                                    <span class="jh-dotted">·</span>
                                    <@currentLocationDirective contentId=own  divider="   /  ">${current}</@currentLocationDirective>
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
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 
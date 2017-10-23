<!DOCTYPE html>
                               <html>
                               <head>
                               <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                               <meta http-equiv="X-UA-Compatible" content="IE=edge">
                               <title>【蓝海】信息网</title>
                               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/quicklink.css"/>
                               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                                <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                               <script type="text/javascript" src="${htmlFolder}/js/tpl.base.js"></script>
                               <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                               <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                               <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
                               <style>
                                      .comment{
                                        height=40px;
                                        margin: 10px auto;
                                          width: 98%;
                                          
                                      }
                                      .comment li{
                                        border-bottom: 1px dashed #dddddd;
                                      }
                                      .comment span{
                                        display: block;
                                        font-size: 10px;
                                        color: #dddddd;
                                        padding: 0 10px;
                                      }
                                      .comment p {
                                        text-indent: 2em;
                                        line-height: 2.2em;
                                        display: block;
                                      }
                                </style>      
                                   </head>
                               
                               <body>
                               <form>
                               <#include "/template/head.ftl"/>
                               <!--nav-->
                               <div class="nav fn-clear">
                                    <div class="navmain">
                                       <div class="navshop"><a href="###">海洋商城</a></div>
                                       <div class="navbar">
                                       <ul>
                               	<li>
                               	<a href="${site.url}">首页</a>
                               	</li>
                               	    <#include "/template/daohang.ftl" />   
                                   </ul></div>
                                   </div>
                               </div>
                               <!--nav end-->
                               <!-- Main -->
                               <div id="main-wrap">
                               	 <div id="container">
                                       <div class="contentwrap">
                                          <div class="crumb"><@currentLocationDirective contentId=own divider="/">${current}</@currentLocationDirective></div> 
                                            <div class="detailtitle"><h2>${cmsContent.title?default("")}</h2></div>
                                           <div class="detailtag">  <span class=" fn-right"> 来源：${cmsContent.origin?default("")}</span><span >发布时间：${cmsContent.publishDate?string("yyyy-MM-dd HH:mm:ss")}</span></div> 
                                            <div class="detailtext">
                                                 ${cmsContent.contentText?default("")}
                               
                                            </div>
                               		                                        <#if cmsAttachments??>
                                                                                   <div class="">
                                                                                       <div class="">
                                                                                           <div class="">
                                                                                               附件
                                                                                           </div>
                                                                                       </div>
                                                                                       <div class="">
                                                                                           <#list cmsAttachments as cmsAttachment>
                                                                                               <div class="">
                                                                                                   <a href='${cmsAttachment.attachmentUrl}'>${cmsAttachment.attachmentName?default("未命名")}</a>
                                                                                               </div>
                                                                                           </#list>
                                                                                       </div>
                                                                                  </div>
                                                                             </#if>	
                                                     </div> 
                                                      <#include "/template/comment.ftl"/>    
                                                  </div>
                                             </div>
                               <!-- Main end-->
                              
                               <div class="blank_20"></div>
          
                               <!--!footer-->
                               
                               <!--!footer end-->
                               
                      
                               
                               
                               <!--[if lte IE 8]>
                               <script src="/js/ieBetter.js"></script>
                               <![endif]-->
                               </form>
                               </body>
                               <!--                       Javascripts 注意不要改变顺序                      -->
                              
                               <!-- 右侧栏 
                               <script type="text/javascript">
                               	$(".quick_links_panel li").mouseenter(function(){
                               		$(this).children(".mp_tooltip").animate({left:-92,queue:true});
                               		$(this).children(".mp_tooltip").css("visibility","visible");
                               		$(this).children(".ibar_login_box").css("display","block");
                               	});
                               	$(".quick_links_panel li").mouseleave(function(){
                               		$(this).children(".mp_tooltip").css("visibility","hidden");
                               		$(this).children(".mp_tooltip").animate({left:-121,queue:true});
                               		$(this).children(".ibar_login_box").css("display","none");
                               	});
                               	$(".quick_toggle li").mouseover(function(){
                               		$(this).children(".mp_qrcode").show();
                               	});
                               	$(".quick_toggle li").mouseleave(function(){
                               		$(this).children(".mp_qrcode").hide();
                               	});
                               	</script>-->
                               </html>
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 
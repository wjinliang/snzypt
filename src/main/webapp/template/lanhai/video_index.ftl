<!doctype html>
           <html>
           <head>
           <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
           <meta http-equiv="X-UA-Compatible" content="IE=edge">
           <title>【蓝海】信息网</title>
           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
           <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
           <body>
           <!--topnav-->
           <#include "/template/head.ftl"/>
           <!--header end-->
           <!--nav-->
           <div class="nav fn-clear">
                                   <div class="navmain">
                                      <div class="navshop"><a href="###">海洋商城</a></div>
                                         <div class="navbar">
                                            <ul>
                                               <li><a href="${site.url}" >首页</a></li>
                                                   <#include "/template/daohang.ftl"/>
                                             </ul></div>
                                         </div>
                                </div>
           <div class="blank_20"></div>
           <!--nav end-->
           <!--焦点图开始-->
           <div class="fn-clear">
           <div id="imageShow">
             <div id="imgshow_mask"></div>
             <ul class="imagebg" id="imagebg">
               <@videoListDirective channelId=66 pageNum=1 pageSize=6 order=2>
               <#list cmsVideos as cmsVideo>
               <li class="bannerbg" data-sPic="${cmsVideo.imageUrl}">
                 <div class="bannerbg_main" style="background:url(${cmsVideo.imageUrl}) center no-repeat; cursor:pointer;" onClick="window.open('${cmsVideo.url}')">
                   <div class="banner"></div>
                 </div>
               </li>
               </#list>
               </@videoListDirective>
             </ul>
             <div class="scrollbg">
               <div class="scroll"> <a id="left_img_btn" class="s_pre" href="javascript:void(0)"></a>
                 <div class="current" id="current"></div>
                 <div class="outScroll_pic">
                   <ul class="scroll_pic cls" id="small_pic">
                   </ul>
                 </div>
                 <a id="right_img_btn" class="s_next" href="javascript:void(0)"></a> </div>
             </div>
           </div>
           </div>
           <!--焦点图结束-->
           <div class="videochannel-floor fn-clear">
              <div id="container">
               <div class="videoleftwrap">
                   <div class="videopannel-hot">
                        <div class="slidevideo">
                            <div class="hd">
                               <ul>
                                  <li><a href="###">最新视频</a></li>
                                  <li><a href="###">最热视频</a></li>
                               </ul>
                            </div>
                            <div class="bd">
                                 <ul>
                                   <@videoListDirective channelId=66 pageNum=1 pageSize=6 order=2>
                                   <#list cmsVideos as cmsVideo>
                                     <li>
                                         <div class="videoitem">
                                                 <div class="vidoeitem-img"> 
                                                 <div class="view third-effect">
                                                 <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
           			<a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                                 </div>
                                                <h4>${cmsVideo.name}</h4> 
                                                <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                               <div class="videoitem-user">
                                                <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                <#else>
                                                  <span>${cmsVideo.actor[0..6]}</span>
                                               </#if>
                                                </div>
                                         </div>
                                     </li>  
                                     </#list>
                                   </@videoListDirective>  
                                 </ul>
                                 
                                 <ul>
                                  <@contentVisitListDirective contentType=5 channelId=66 pageNum=1 pageSize=6>
                                   <#list contentVisitList as cmsVideo>
                                     <li>
                                         <div class="videoitem">
                                                 <div class="vidoeitem-img"> 
                                                 <div class="view third-effect">
                                                 <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
           			<a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                                 <span></span></div>
                                                <h4>${cmsVideo.title}</h4> 
                                                <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                               <div class="videoitem-user">
                                                  <#if cmsVideo.author?length lt 6>
                                                  <span>${cmsVideo.author}</span>
                                                  <#else>
                                                  <span>${cmsVideo.author[0..6]}……</span>
                                                 </#if>
                                                </div>
                                         </div>
                                     </li>  
                                      </#list>
                                   </@contentVisitListDirective>  
                                   </ul>
                            </div>
                        </div>
                   </div>
               </div>
               <div class="videorightwrap">
                   <div class="videopannel-made">
                       <div class="videopannel-title">
                       <a href="###">我要上传</a>
                       <h2>原创视频</h2></div>
                       <div class="videopannel-madelist">
                           <ul>
                             <@videoListDirective channelId=86 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>
                                 <li><img src="${cmsVideo.imageUrl}"  width="85px" height="70px"/>
                                 <h4><a href="${cmsVideo.url}">${cmsVideo.name}</a></h4>
                                 <p><a href="${cmsVideo.url}">${cmsVideo.director}</a></p><span><em>${cmsVideo.count}次播放</em><em>${cmsVideo.commentCount}个评论</em></span> 
                                 </li> 
                               </#list>
                             </@videoListDirective>     
                           </ul>
                       </div>
                   </div>
               </div>
             </div>
           </div>
           <!--分类视频-->
           <div class="videosort-floor">
               <div class="videosortpannel">
                  <div class="slidevideosort">
                      <div class="hd">
                      <h2>分类视频</h2>
                      <ul>
                       <@channelDirective channelId=87>
                         <li><a href="${channel.url}">海洋</a></li>
                       </@channelDirective>  
                       <@channelDirective channelId=71>
                         <li><a href="${channel.url}">爱情</a></li>
                       </@channelDirective> 
                      <@channelDirective channelId=88>   
                         <li><a href="${channel.url}">搞笑</a></li>
                      </@channelDirective> 
                      <@channelDirective channelId=69>   
                         <li><a href="${channel.url}">动作</a></li>
                      </@channelDirective> 
                      <@channelDirective channelId=70>   
                         <li><a href="${channel.url}">悬疑</a></li>
                     </@channelDirective> 
                      <@channelDirective channelId=89>   
                         <li><a href="${channel.url}">科技</a></li>
                      </@channelDirective> 
                      </ul></div>
                      <div class="bd">
                          <ul>       
                          <@videoListDirective channelId=87 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
           			<a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>                              
                          </ul>
                          <ul>
                            <@videoListDirective channelId=71 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>        
                          </ul>
                          <ul>
                             <@videoListDirective channelId=88 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>  
                          </ul>
                          <ul>
                              <@videoListDirective channelId=69 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>      
                          </ul>
                          <ul>
                              <@videoListDirective channelId=70 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>     
                          </ul>
                          <ul>
                              <@videoListDirective channelId=89 pageNum=1 pageSize=6 order=2>
                                <#list cmsVideos as cmsVideo>                     
                               <li>
                                  <div class="videoitem">
                                       <div class="vidoeitem-img"> 
                                       <div class="view third-effect">
                                              <img src="${cmsVideo.imageUrl}" width="230px" height="131px"/> <div class="mask">
                 <a href="${cmsVideo.url}" target="_blank" class="info" title="Full Image">Full Image</a></div></div>
                                                 
                                               <span></span></div>
                                               <h4>${cmsVideo.name}</h4> 
                                               <p><span>${cmsVideo.count}次播放</span> <span>${cmsVideo.commentCount}次评论</span></p>
                                        <div class="videoitem-user">
                                              <#if cmsVideo.actor?length lt 6>
                                                  <span>${cmsVideo.actor}</span>
                                                  <#else>
                                                  <span>${cmsVideo.actor[0..6]}……</span>
                                               </#if>
                                        </div>
                                   </div>
                              </li>  
                              </#list>
                             </@videoListDirective>   
                          </ul>
                      </div>
                  </div>
                 
               </div>
           </div>
           <!--!footer-->
           <div class="footer">
             <div class="footerwrap">
               <div class="linklist">
                   <a href="###">关于我们</a>  |  <a href="###">联系我们</a>   |<a href="###">  友情链接 </a> |<a href="###">  客服热线：400-898-9898</a> </div>
                   <div class="copyright">
               <p><span>海洋信息网  版权声明 </span>  <span>京ICP备093817344号</span>  <span>京ICP证B2-21366号</span>   <span>  北京市公安局海淀分局备案编号：21341345699 </span>       </p>
           </div>
             </div>
           </div>
           <!--!footer end-->
           </body>
           <!--                       Javascripts 注意不要改变顺序                      -->
            <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
           <script type="text/javascript" src="${htmlFolder}/js/jquery.imgSlider.js"></script>
           <script src="${htmlFolder}/js/jquery.SuperSlide.2.1.1.js"></script>
           <script src="${htmlFolder}/js/slides.min.jquery.js" language="javascript" type="text/javascript"></script>
           <script src="${htmlFolder}/js/login.js"></script>
           <script type="text/javascript">
           img.init();
           img.play(0);
           //阻止事件冒泡
           function estop(e){
           	var e=arguments.callee.caller.arguments[0]||event;
           	if (e && e.stopPropagation){
           	//因此它支持W3C的stopPropagation()方法
           	   e.stopPropagation();
           	}else{
           	//否则，我们需要使用IE的方式来取消事件冒泡
           	   window.event.cancelBubble = true;
           	   return false;
           	}
           }
           jQuery(".slidevideo").slide({effect:"fold"});
           jQuery(".slidevideosort").slide({effect:"fold"});
           </script>
           </html>
           
          
         
        
       
      
     
    
   
  
 
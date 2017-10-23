<!doctype html>
  <html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>【蓝海】信息网</title>
  <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
  <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
  <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
  <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/quicklink.css"/>
  
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
  
  <!--焦点图结束-->
  <!--音乐电台-->
  <div class="musicradio-box fn-clear">
      <div class="musicradio-nav">
          <ul class="musicradio-navlist">
            <@channelListDirective channelId=67>
            <#list channels as channel>
              <li>
                 <a href="${channel.url}"><h4 class="fontblue">${channel.displayName}</h4></a>
              </li>
              </#list>
            </@channelListDirective>
          </ul>
      </div>    
  </div>
  <!--各类排行-->
  <div class="musicrank-floor fn-clear">
     <div class="musicrank-pannel">
         <div class="musicrank-title">
          
            <h2>最新歌曲榜</h2>
         </div>
         <div class="musicrank-list">
             <ul>
              <@audioListDirective channelId=67 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>    
                </ul>
              </div>
     </div>
     <!--最热歌曲--> 
     <div class="musicrank-pannel">
         <div class="musicrank-title">
            
            <h2>摇滚歌曲</h2>
         </div>
         <div class="musicrank-list">
             <ul>
                  <@audioListDirective channelId=77 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>     
                </ul>
              </div>
     </div>
     <!--热门歌手--> 
     <div class="musicrank-pannel">
         <div class="musicrank-title">
          
            <h2>流行音乐</h2>
         </div>
         <div class="musicrank-list">
             <ul>
              <@audioListDirective channelId=76 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>    
                </ul>
              </div>
     </div>
    <div class="blank_20 fn-clear"></div>
    <!--经典老歌-->
    <div class="musicrank-pannel">
         <div class="musicrank-title">
          
            <h2>经典老歌</h2>
         </div>
         <div class="musicrank-list">
             <ul>
              <@audioListDirective channelId=91 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>    
                </ul>
              </div>
     </div>
     
     <!--网络歌曲-->
    <div class="musicrank-pannel">
         <div class="musicrank-title">
          
            <h2>网络歌曲</h2>
         </div>
         <div class="musicrank-list">
             <ul>
              <@audioListDirective channelId=93 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>    
                </ul>
              </div>
     </div>
       <!--原创歌曲榜-->
       <div class="musicrank-pannel">
         <div class="musicrank-title">
          
            <h2>古典歌曲</h2>
         </div>
         <div class="musicrank-list">
             <ul>
              <@audioListDirective channelId=78 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                 <li>
                      <div class="musicrank-list-item">
                         <span class="num-top">1</span>
                         <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                         <em>${cmsAudio.singer}</em>
                       </div>
                  </li>
                   </#list>
              </@audioListDirective>    
                </ul>
              </div>
     </div>
  <!--大家都在听-->
  <div class="musicall-floor">
      <div class="musicall-title"><h2>经典MV</h2></div>
       <@audioListDirective channelId=78 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
          <div class="musicall-item">
              <div class="musicallitem-img"><img src="${cmsAudio.imageUrl}"/>
              <span><img src="${htmlFolder}/images/icon_music_listen.png"/><font>45674</font></span></div>
              <h4><a href="#">${cmsAudio.name}</a></h4>
              <font><a href="javascript:void(0);">${cmsAudio.singer}</a></font>
          </div>
         </#list>
       </@audioListDirective>   
  </div>
  
  <!---->
  <div class="musicrecomm-floor" style="height:500px;">
     <div class="musicrecom-left">
     <!--原创推荐-->
      <div class="musicoriginal-pannel">
         <@channelDirective channelId=79>
          <div class="musicoriginal-title"><h2>原创推荐<a href="${channel.url}">更多……</a></h2></div>
        </@channelDirective>
          <div class="musicoriginal-list">
             <ul>
              <@audioListDirective channelId=79 pageNum=1 pageSize=10>
                 <#list cmsAudios as cmsAudio>
                <li>${cmsAudio.name}<h4><a href="${cmsAudio.url}" class="name">${cmsAudio.singer}</a></h4><font>${cmsAudio.count}播放</font><a href="###" class="play">&nbsp;</a><span><em>${cmsAudio.commentCount}</em><a href="###" class="love">&nbsp;</a></span></li>
                 </#list>
              </@audioListDirective>    
             </ul>
          </div>
      </div>
      <!--翻唱推荐-->
      
      </div>
  <div class="musicrecom-right">
          <div class="musictags-pannel">
               <div class="musictags-title">
                  <h2>播放排行</h2>
               </div>
               <div class="hotlist">
                  <ul >
                     <@audioListDirective channelId=67 pageNum=1 pageSize=10>
                     <#list cmsAudios as cmsAudio>
                     <li>
                             <em class="top">${cmsAudio_index+1}</em>
                             <a href="${cmsAudio.url}" class="name-top">${cmsAudio.name}</a>
                             
                      </li>
                   </#list>
                 </@audioListDirective>   
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
  <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>

  
  </html>
  
 
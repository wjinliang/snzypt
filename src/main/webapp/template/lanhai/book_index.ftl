<!DOCTYPE html>
                    <html>
                    <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                    <title>【蓝海】信息网</title>
                    <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                    <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                    <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
              <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/orbit.other.css"/>
       
                     <style>
                       #bookscroll img{
                          width:660px;
                          height: 360px;
                       }
                       .bookgood-main img{
                        width:75px;
                        height: 95px；
                       }
                       .bookrecom-main img{
                        width:95px;
                        height: 120px
                       }
                       .booknew-main img{
                        width:128px;
                        height: 165px
                       }
                     </style>
      
                    </head>
                    
                    <body>
                    <#include "/template/head.ftl"/>
        
        
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
        <!--floor1-->
        <div class="bookchannel-floor fn-clear">
          <div class="bookpic">
              <div class="scrollpic" id="scrollbook">
              <div id="bookscroll">
               <@novelListDirective channelId=80 pageSize=8 pageNum=1 descLeft=1 order=1>
               <#list cmsNovels as novel>
                 <a class="orbit-item" href="${novel.url}" data-caption="#htmlCaption${novel_index+1}"><img src="${novel.imageUrl}"></a>
               </#list>
              </@novelListDirective>
            </div>
                <!--
              <span class="orbit-caption" id="htmlCaption1">3D《海底大冒险》将映 打响海底保卫战</span>
             <span class="orbit-caption" id="htmlCaption2">《私人》曝纪录片 章子怡：羡慕嫉妒恨</span>
             <span class="orbit-caption" id="htmlCaption3">赵又廷林更新戏里有情 跟高圆圆没分手</span>
             -->
            </div>
           </div>
           <div class="booknews">
               <h2><a href="${channel.url}">更多&gt;   </a><font>最新上架</font></h2>
               <ul>
                <@novelListDirective channelId=80 pageSize=8 pageNum=1 descLeft=1 order=1>
                  <#list cmsNovels as novel>
                  <li><em>【${novel.type}】</em><a href="${novel.url}">${novel.name}</a></li>
                  </#list>
                </@novelListDirective>
               </ul>  
            </div>
        </div>
        <div class="blank_20"></div>
        <!--floor2-->
        <div class="bookchannel-floor fn-clear">
           <div class="bookleftwrap">
               <div class="bookclassify">
                  <h4>小说分类</h4> 
                  <ul>
                    <@channelListDirective channelId=68 order=1>
                    <#list channels as channel>
                     <li class=" bgwither"><a href="${channel.url}">${channel.displayName}</a></li>
                     </#list>
                    </@channelListDirective>
                  </ul>
               </div>
               <!--热门标签-->
              <!--  <div class="booktags">
                  <h4>热门标签</h4>
                   <div class="booktags-main">
                      <a href="###">生活情感</a><a href="###">花样年华</a><a href="###">谁主沉浮</a><a href="###">生活情感</a><a href="###">花样年华</a><a href="###">谁主沉浮</a><a href="###">生活情感</a><a href="###">花样年华</a><a href="###">谁主沉浮</a>
                  </div>
               </div> -->
               <!--好书榜-->
               <div class="bookgood">
                  <h4>热书榜</h4>
                  <ul class="bookgood-main">
                    <@contentVisitListDirective titleLeft=10 contentType=7  pageNum=1 channelId = 107 days=7 pageSize=12>
                      <#list contentVisitList as novel>
                      <#if novel_index==0>
                      <li class="num01 bgwither"><a href="${novel.url}"><em>01</em><img src="${novel.imageUrl}"/><h4>${novel.name}</h4><span>${novel.author!}</span></a></li>
                      </#if>
                      <#if novel_index &gt; 0>
                      <li class=" bggray"><a href="${novel.url}"><em>0${novel_index+1}</em><font>${novel.name}</font></a></li>          
                      </#if>
                      </#list>
                    </@contentVisitListDirective>
                  </ul>
                  
               </div>
           </div>
           <div class="bookrightwrap">
               <div class="bookrecom">
                  <div class="bookrecom-box">
                      <div class="bookrecom-main">
                        <@novelListDirective channelId=81 pageSize=5 pageNum=1 titleLeft=5 descLeft=30 order=1>
                        <#list cmsNovels as novel>
                        <#if novel_index == 0>
                          <a href="" class="more">更多 &gt; </a>
                          <img src="${novel.imageUrl}"/><h3>玄幻·奇幻</h3>
                          <h4>${novel.name}</h4>
                          <span>[${novel.author}]</span>
                          <em>${novel.introduce}</em>
                          <a href="${novel.url}" class="view">立即阅读</a>
                        </#if>  
                      </div>
                      <ul class="bookrecom-list">
                        <#list cmsNovels as novel>
                        <#if novel_index &gt; 0>
                          <li><a href="###">斗罗大陆II门[唐家三少]</a></li>
                        </#if> 
                        </#list> 
                      </ul>
                       </#list>
                       </@novelListDirective>
                  </div>
                  <div class="bookrecom-box">
                      <div class="bookrecom-main">
                        <@novelListDirective channelId=80 pageSize=5 pageNum=1 titleLeft=5 descLeft=30 order=1>
                        <#list cmsNovels as novel>
                        <#if novel_index == 0>
                          <a href="" class="more">更多 &gt; </a>
                          <img src="${novel.imageUrl}"/><h3>武侠·仙侠</h3>
                          <h4>${novel.name}</h4>
                          <span>[${novel.author}]</span>
                          <em>${novel.introduce}</em>
                          <a href="${novel.url}" class="view">立即阅读</a>
                        </#if>  
                      </div>
                      <ul class="bookrecom-list">
                        <#list cmsNovels as novel>
                        <#if novel_index &gt; 0>
                          <li><a href="###">斗罗大陆II门[唐家三少]</a></li>
                        </#if> 
                        </#list> 
                      </ul>
                       </#list>
                       </@novelListDirective>
                  </div>
                  <div class="bookrecom-box">
                      <div class="bookrecom-main">
                        <@novelListDirective channelId=82 pageSize=5 pageNum=1 titleLeft=5 descLeft=30 order=1>
                        <#list cmsNovels as novel>
                        <#if novel_index == 0>
                          <a href="" class="more">更多 &gt; </a>
                          <img src="${novel.imageUrl}"/><h3>都市·职场</h3>
                          <h4>${novel.name}</h4>
                          <span>[${novel.author}]</span>
                          <em>${novel.introduce}</em>
                          <a href="${novel.url}" class="view">立即阅读</a>
                        </#if>  
                      </div>
                      <ul class="bookrecom-list">
                        <#list cmsNovels as novel>
                        <#if novel_index &gt; 0>
                          <li><a href="###">斗罗大陆II门[唐家三少]</a></li>
                        </#if> 
                        </#list> 
                      </ul>
                       </#list>
                       </@novelListDirective>
                  </div>
                  <div class="bookrecom-box">
                      <div class="bookrecom-main">
                        <@novelListDirective channelId=85 pageSize=5 pageNum=1 titleLeft=5 descLeft=40 order=1>
                        <#list cmsNovels as novel>
                        <#if novel_index == 0>
                          <a href="" class="more">更多 &gt; </a>
                          <img src="${novel.imageUrl}"/><h3>爱情·言情</h3>
                          <h4>${novel.name}</h4>
                          <span>[${novel.author}]</span>
                          <em>${novel.introduce}</em>
                          <a href="${novel.url}" class="view">立即阅读</a>
                        </#if>  
                      </div>
                      <ul class="bookrecom-list">
                        <#list cmsNovels as novel>
                        <#if novel_index &gt; 0>
                          <li><a href="###">斗罗大陆II门[唐家三少]</a></li>
                        </#if> 
                        </#list> 
                      </ul>
                       </#list>
                       </@novelListDirective>
                  </div>
               
               </div>
               <div class="blank_20"></div>
               <!--新书速递-->
               <div class="booknew">
                   <h2><span>新书速递</span></h2>
                   <@novelListDirective channelId=107 pageSize=5 pageNum=1 titleLeft=5 descLeft=40 order=2>
                    <ul class="booknew-main">
                   <#list cmsNovels as novel>
                           <li><a href="${novel.url}">
                             <img src="${novel.imageUrl}" />
                             <h4>${novel.name}</h4>
                             <span>【${novel.type}】${novel.author}</span></a>
                          </li>
                   </#list>
                   </ul>
                   </@novelListDirective>
               </div>
           </div>
        </div>
        <div class="  blank_20"></div>
        <!--footer-->
        <#include "/template/foot.ftl" />
                                        
        <!--!footer end-->
        </body>
        <!--                       Javascripts 注意不要改变顺序                      -->
        <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
        <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
        <!-- 焦点图 -->
        <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
         <script type="text/javascript" src="${htmlFolder}/js/login.js"></script>
        <script type="text/javascript">
        $(window).load(function() {
          $('#bookscroll').orbit({
            bullets : true,
            startClockOnMouseOut : true,
            captionAnimation : 'slideOpen'
          });
        });
        </script>
       
       
        </html>
        
       
      
     
    
   
  
 
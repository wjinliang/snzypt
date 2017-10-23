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
                              <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/orbit.css"/>
                              
                              <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                              </head>
                              
                              
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
                              <!--nav end-->
                              <div class="blank_20"></div>
                              
                              <!--list-->
                              <div class="newschannel-floor fn-clear">
                                 <div class="moretabs news-cont" >
                                   <div class="crumb"><h4> ${channel.displayName}</h4></div>
                                                <@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=10>
                              				 <div class="newslist">
                              					<#list contents as cmsContent>
                              						<div class="newslist-item">
                              						 <h2><a href="${cmsContent.url}">${cmsContent.title?default("")}</a></h2>
                              						 <span>${cmsContent.brief?default("")}</span>
                              						  <p><em class="interact">来源：${cmsContent.origin}</em><em class="time">${cmsContent.publishDate?string("yyyy-MM-dd")}</em></p>
                              						</div>
                              					 </#list>
                              				</div>
                              				<div class="page_wrap">
                              					${pagination}
                              					<!--${paginationlist}-->
                              				 </div>
                              			</@contentListDirective>
                                                   <!--<div class="page"> <a href="#" class="page_last">上一页</a> <a href="#" class="page_current">1</a> <a href="#">2</a><a href="#">3</a><a href="#">4</a><a href="#">5</a> <a href="#" class="page_next">下一页</a> </div>-->
                                               <div class=" blank_20"></div>
                                          
                                 </div>
                                 <!--点击排行-->
                                 <div class="leftlistwrap">
                                    <div class="hotlist">
                                         <h4><span>点击排行</span></h4>
                                         <ul >
                                             <@contentVisitListDirective titleLeft=10 siteId="${site.id}" contentType=0  pageNum=1 channelId = own days=7 pageSize=12>
                                                       <#list contentVisitList as cmsContent>
                                                        <li><em class="top">${cmsContent_index+1}</em><a href="${cmsContent.url}">${cmsContent.title}</a></li>
                                                       </#list>
                                             </@contentVisitListDirective>
                                         </ul>
                                    </div>
                                    <div class=" blank_20"></div>
                                    <!-- <div class="recomlist">
                                         <h4><span>专题推荐</span></h4>
                                         <ul >
                                            <li><a href="###">俄军空袭炸毁土救援车队 致7人死亡</a></li>
                                            <li><a href="###">春运首日火车票开抢 北上广线路秒</a></li>
                                            <li><a href="###">北京艺校学生吸毒 300余人接受路秒</a></li>
                                            <li><a href="###">外媒称美军12月或再次巡航南</a></li>
                                            <li><a href="###">北京提严控人口规模:2300万为"天花板</a></li>
                                         </ul>
                                    </div> -->
                                  </div>
                              </div>
                              <div class="  blank_20"></div>
                              <!--footer-->
                              <#include "/template/foot.ftl" />
                              <!--!footer end-->
                              
                              
                              
                              
                              <!--[if lte IE 8]>
                              <script src="js/ieBetter.js"></script>
                              <![endif]-->
                              </form>
                              </body>
                              <!--                       Javascripts 注意不要改变顺序                      -->
                              <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                              <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                              <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
                              <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                              <!-- 焦点图 -->
                              <script type="text/javascript" src="${htmlFolder}/js/tpl.base.js"></script>
                              <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
                              <script type="text/javascript">
                              $(window).load(function() {
                              	$('#featured').orbit({
                              		bullets : true,
                              		startClockOnMouseOut : true,
                              		captionAnimation : 'slideOpen'
                              	});
                              	$('#sciencescroll').orbit({
                              		bullets : true,
                              		startClockOnMouseOut : true,
                              		captionAnimation : 'slideOpen'
                              	});
                              });
                              </script>
                              <script src="${htmlFolder}/js/slides.min.jquery.js" language="javascript" type="text/javascript"></script>
                              <script src="${htmlFolder}/js/jquery.SuperSlide.2.1.1.js"></script>
                              <script type="text/javascript">
                              jQuery(".slidenews").slide({effect:"fold"});</script>
                              <script type="text/javascript">	
                              //新闻资讯-选卡效果
                              jQuery(".moretabs").slide({ mainCell:".conwrap", targetCell:".more a", effect:"fold"});	
                              </script>
                              
                              
                              <!-- 焦点图 -->
                              <script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
                              <script type="text/javascript">
                              $(window).load(function() {
                              	$('#featured').orbit({
                              		bullets : true,
                              		startClockOnMouseOut : true,
                              		captionAnimation : 'slideOpen'
                              	});
                              	$('#sciencescroll').orbit({
                              		bullets : true,
                              		startClockOnMouseOut : true,
                              		captionAnimation : 'slideOpen'
                              	});
                              });
                              </script>
                              </html>
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 
<!doctype html>
         <html>
         <head>
         <#include "/template/jh-meta.ftl">
         <title>金湖政府网</title>
         <link rel="stylesheet" type="text/css" href="/html/jinhu-static/css/style.css">
         <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.8.0.min.js"></script>
         </head>
         <style >
         	.m_blank{
         		margin-top:20px;	
         	}
         	.gov_affair .new_gov_info_r {
         	    width: 781px;
         	    margin-left: 15px;
         	    margin-top: 33px;
         	}
         	.gov_affair .new_gov_info_r {
         	    min-height: 400px;
         	    float: left;
         	   /* border: 1px solid #d3d3d3;*/
         	}
           .b_h {
           height: inherit;  
           }
         </style>
         <body>
         	<div class="container">
             		<#include "/template/jh-head.ftl"/>
                      <#include "/template/jh-daohang.ftl"/> 
                 <!--主内容区代码-->
                 <section>
                
                   <div class="m_blank"></div>
                     <!--政务公开-->
                     <div class="gov_affair">
                     	
                     	<div class="b_gov_info b_h " style="height: inherit;">
                         	<div class="news_title  b_gov_1">
                             	<a href="#" class="on">${channel.displayName}</a>
                             </div>
                             <div class="b_gov_con">
         		    <@channelListDirective channelId=channel.id order=4 excludeIds="">
         			<#list channels as channel>
         				<#if channel_index%4==0>
         					<dl>
         				</#if>
         				<#if channel.displayName?length lt 11>
         					<dd><a href="${channel.url}" target="_blank">${channel.displayName}</a></dd>
         				</#if>
         				<#if channel.displayName?length gt 10>
         					<dd style="line-height:22px;"><a href="${channel.url}" target="_blank">${channel.displayName?substring(0,6)}</br>${channel.displayName?substring(6)}</a></dd>
         				</#if>
         				<#if channel_index%4==3>
         					</dl>
         				</#if>
         			</#list>
         			</@channelListDirective>
                             	
                                 <div class="clear"></div>
                             </div>		
                         </div>
                         <div class="new_gov_info_r">
         			
                             <div class="new_gov_con">
                             	<ul>
         			<@contentListDirective channelId=channel.id pageSize=7 pageNum=1 order=10>
         				<#list contents as cmsContent>
         					<li><a href="${cmsContent.url}" target="_blank">${cmsContent.title}</a></li>
         				</#list> 
         			</@contentListDirective>
                             		<!--<li><a href="/html/jinhu-static/" target="_blank">我县组织收听收看全省夏粮收购工作视频会议</a></li>
                                 	<li><a href="/html/jinhu-static/" target="_blank">我县部署夏季消防检查和重点行业领域专项检查工作</a></li>
                                 	<li><a href="/html/jinhu-static/" target="_blank">肖进方书记:加快项目推进力度，确保重点指标争先进位</a></li>
                                     <li><a href="/html/jinhu-static/" target="_blank">县委办党支部开展“两学一做”专题学习活动</a></li>
                                 	<li><a href="/html/jinhu-static/" target="_blank">肖进方书记:加速推进全民参保登记计划试点</a></li>
                                 	<li><a href="/html/jinhu-static/" target="_blank">淮安关检一站式服务正式进驻县经济开发区</a></li>
                                     <li><a href="/html/jinhu-static/" target="_blank">我县组织收看全市年度创建文明城市动员部署视频会议</a></li>-->
                             	</ul>
                                 
                             </div>
                         </div>
                         <div class="clear"></div>
         		
                     </div>
                        
                     
                 </div>
                 </section>
                 <div class="xian"></div>
                 <#include "/template/jh-footer.ftl"/>
             </div>
         </body>
         </html>
         
        
       
      
     
    
   
  
 
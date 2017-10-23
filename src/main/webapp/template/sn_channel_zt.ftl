<!doctype html>
 <html>
 <head>
 <#include "/template/sn_head.ftl">
 </head>
 <style>
 	#update-time{
 		float: right;
 		margin-right: 103px;
 	}
 </style>
 <body>
 	<#include "/template/sn_header.ftl">
     <div class="wrapper">
     	<div class="container">
         	
             <div class="row mgt15">
             	<div class="col-md-3" style="padding-left:0px;">
                 	<div class="interact-realT-con">
                     	<p>数据专题</p>
                         <ul id="interact-realT-list">
                         	<@channelListDirective channelId=2>
 							<#list channels as chan>
                         		<li class="${(chan.id==own)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
 							</#list>
 						</@channelListDirective>
                         </ul>
                     </div>
                 </div>
                 <div class="col-md-9" style="padding-right:0px;">
                 	<div class="interact-item">
                     	<div class="position-info">
                         	<span>当前位置：</span>			    
                         <@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&gt;&nbsp;&nbsp;">${current}</@currentLocationDirective>
                         </div>

			 <div class="zt-list clearfix mgt15">
 			<@contentListDirective channelId=own pageSize =200 pageNum=pageNum titleLeft=25>
				<#list contents as con>
				<a href="${con.url!}" title="${con.title!}"><p class="imgBig"><img src="${con.titleImageUrl!}" width="100%" height="120"></p><p class="newTit">
				${con.title!}</p></a>
                                </#list>
                                
                             </@contentListDirective>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
     <#include "/template/sn_footer.ftl">
 </body>
 </html>
 
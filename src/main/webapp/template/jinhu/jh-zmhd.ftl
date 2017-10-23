<!DOCTYPE html>
                                            <html>
                                            <head lang="en">
                        <#include "/template/jh-meta.ftl">
                                            <title>${site.displayName}-${channel.displayName}</title>
                                            <link href="/html/jinhu-static/bootstrap2/css/bootstrap.min.css" rel="stylesheet">
                                              <link href="/html/jinhu-static/css/style.ts.css" type="text/css" rel="stylesheet">
                                            <link href="/html/jinhu-static/css/interact.css" type="text/css" rel="stylesheet">
                                              
                                            <!--[if lt IE 9]>
                                                <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                                                <script src="/html/jinhu-static/js/respond.min.js"></script>
                                                <![endif]-->
                                            </head>
                                            <body>
                                             <#include "/template/jh-head.ftl">
                                               <#include "/template/jh-daohang.ftl">
                                               <div class="container bg-white">
                                               <#include "/template/jh-daohang2.ftl">
                                            <div class="jh-main">
                                            <div class="row">
                                              <div class="col-md-8">
                                                <div class="panel panel-default panel1">
                                                  <@channelDirective channelId=51>
                                                  <#if channel.forbidden=="0">
                                                  <div class="panel-heading panel1-t"><a href="${channel.url!}" target="_blank" class="panel1-ton fontSize18">在线访谈</a></div>
                                                  <div class="panel-body">
                                                    <div class="row">
                                                      <div class="col-md-5"> <a href="${channel.url!}" target="_blank" class="thumbnail thumbnails thumbnailb"> <img src="/html/jinhu-static/img/zxft_pic.png"> </a> </div>
                                                      <div class="col-md-7 pdTop1em">
                                                        <div class="clearfix"> <a href="${channel.url!}" target="_blank" class="color-green fontSize18 pd2 dis-b">最新访谈</a>
                                                          <ul class="panel2-list">
                                                            <@interviewListDirective channelId=51 pageSize=1 pageNum=1 >
                                     	<#list cmsInterviews as  v>
                                     	    <li><span class="jh-dotted">·</span>主题： <a href="${v.url!}" target="_blank" title="${v.title!}"><#if v.title?length gt 22>${v.title?substring(0,20)!}...<#else>${v.title!}</#if></a></li>
                                     	    <li><span class="jh-dotted">·</span title="${v.guests!}">嘉宾：<#if v.guests?length gt 22>${v.guests?substring(0,20)!}...<#else>${v.guests!}</#if>   </li>
                                     	    <li><span class="jh-dotted">·</span>时间：   ${v.startTime?substring(0,19)}—${v.endTime}</li>
                                          <li class="htAuto"><span class="jh-dotted">·</span><#if v.desc?length gt 90>${v.desc?substring(0,87)!}...<#else>${v.desc!}</#if></li>
                                     	</#list>
                                     </@interviewListDirective>
                                                           
                                                            
                                                          </ul>
                                                        </div>
                                                        <div class="borderTop clearfix"> <span  class="color-green fontSize18 pd2 dis-b">下期预告</span>
                                                          <ul class="panel2-list panel2-list-sm">
                                                            <@interviewListDirective channelId=51 pageSize=1 pageNum=1 finish='true'>
                   					 <#if (cmsInterviews?size gt 0)>
                   						<#list cmsInterviews as  v>
                   					     <li><span class="jh-dotted">·</span><a href="${v.url!}" target="_blank">${v.title!}</a></li>
                   						   
                   						</#list>
                   						<#else>
                   						<li><span class="jh-dotted">·</span>[暂无下期]</li>
                   						</#if>
                                     </@interviewListDirective>
                                                            
                                                          </ul>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </div>
                                                  </#if>
                                                    </@channelDirective>
                                                </div>
                                                <div class="panel panel-default panel1"> 
                                                  <!-- Nav tabs -->
                                                  <ul class="nav nav-tabs fontSize16 navTab1 navTab3 navTab1s text-center" role="tablist" id="navTab1">
                   			       <@channelDirective channelId=50>
                                                    <li role="presentation" class="active"> <a href="#lxhf" data-url="${channel.url!}" aria-controls="lxhf" role="tab" data-toggle="tab" style="cursor:pointer;">${channel.displayName!}</a> </li><!--来信回复选编-->
                                                   </@channelDirective>
                   				<@channelDirective channelId=49><#if channel.forbidden=='0'>
                   				 <li role="presentation" > <a href="#blqk"  data-url="${channel.url!}" aria-controls="blqk" role="tab" data-toggle="tab"  style="cursor:pointer;">${channel.displayName!}</a> </li><!--办理情况-->
                                                   </#if> </@channelDirective>
                   				 <li class="navTab3-search" style="float: right;">
                                                      <form action="../../websurvey/findOne" target="_blank" class="form-inline form-inline1" id="emailForm">
                                                       <label>信件查询</label>
                                                       <div class="form-group">
                                                         <input type="text" class="form-control" id="codeId" name="id" placeholder="请输入信件编号">
                                                         <input type="hidden" name="phone" id="phone"/>
                                                       </div>
                                                       <button type="button" id="emailInfo" class="btn">信件查询</button>
                                                     </form>
                                                    </li>
                                                  </ul>
                                                  <!-- Tab panes -->
                                                  <div class="tab-content navTab1-content navTab3-content1 pTextIndent" style="height:254px;">
                                                    <div role="tabpanel" class="tab-pane" id="blqk">
                   				 <@contentListDirective channelId=49 pageSize=5 pageNum=pageNum titleLeft=40 order=2>  
                   				 <ul class="panel2-list">
                                               			    <#list contents as cmsContent>
                                                                               <li><span class="jh-dotted">·</span><a href="${cmsContent.url}" target="_blank">${cmsContent.title}<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
                                               			</#list> 
                   						</ul>
                                               			</@contentListDirective>
                                                       <#-- <table class="table table-bordered table-hover table1">
                                                        <thead>
                                                          <tr>
                                                            
                                                            <th>标题</th>
                                                            <th>类型</th>
                                                            <th>状态</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody>
                                                        <@websurveyListDirective pageNum=1 pageSize=5 type="1,3">
                                                         <#list websurveys as websurvey>
                                                          <tr>
                                                            <td>${websurvey.title!}</td>
                                                            <td>${(websurvey.type=='1')?string('咨询','建议')}</td>
                                                            <td>${(websurvey.state=='0')?string('未回复','已回复')}</td>
                                                          </tr>
                                                          </#list>
                                                          </@websurveyListDirective>
                                                        </tbody>
                                                      </table>-->
                                                    </div>
                                                    <div role="tabpanel " class="tab-pane active" id="lxhf">
                                                      <table class="table table-bordered table-hover table1">
                                                        <thead>
                                                          <tr>
                                                            <#--<th>姓名</th>-->
                                                            <th>标题</th>
                                                            <th>类型</th>
                                                            <th>状态</th>
                                                          </tr>
                                                        </thead>
                                                        <tbody>
                                                          <@websurveyListDirective pageNum=1 pageSize=5 type="1,2,3,4" isOpen='3'>
                                                         <#list websurveys as websurvey>
                                                          <tr>
                                                            <#--<td>${websurvey.username!}</td>-->
                                                            <td><a href="../../websurvey/findOne?id=${websurvey.id}" target= "_blank">${websurvey.title!}</a></td>
                                                            <#if websurvey.type??>
                                                            <#if websurvey.type=="1">
                                                            <td>咨询</td>
                                                            </#if>
                                                            <#if websurvey.type=="2">
                                                            <td>投诉</td>
                                                            </#if>
                                                            <#if websurvey.type=="3">
                                                            <td>建议</td>
                                                            </#if>
                                                            <#if websurvey.type=="4">
                                                            <td>举报</td>
                                                            </#if>
                                                              
                                                            <#else>
                                                              <td>咨询</td>
                                                              </#if>
                                                            <td>${(websurvey.state=='0')?string('未回复','已回复')}</td>
                                                          </tr>
                                                          </#list>
                                                          </@websurveyListDirective>
                                                        </tbody>
                                                       
                                                      </table>
                                                    </div>
                                                  </div>
                                                </div>
                                                <div class="border-gray">
                                                                <!-- Nav tabs -->
                                                                <ul class="nav nav-tabs fontSize16 navTab1 navTab3 navTabWidth3 navTab1s text-center" role="tablist" id="navTab2">
                                            		    <@channelDirective channelId=52><!---->
                                                                       <li role="presentation" class="active"><a href="#zrdl" data-url="${channel.url!}" aria-controls="zrdl" role="tab" data-toggle="tab"  style="cursor:pointer;">${channel.displayName}</a></li>
                                               		 </@channelDirective><!---->
                                            		 <@channelDirective channelId=53><!---->
                                                                       <li role="presentation" class=""><a href="#xzqh" data-url="${channel.url!}" aria-controls="zrdl" role="tab" data-toggle="tab"  style="cursor:pointer;">${channel.displayName}</a></li>
                                               		 </@channelDirective><!---->
                                            		 <@channelDirective channelId=54><!---->
                                                                       <li role="presentation" class=""><a href="#lsyg"  data-url="${channel.url!}" aria-controls="zrdl" role="tab" data-toggle="tab"  style="cursor:pointer;">${channel.displayName}</a></li>
                                               		 </@channelDirective><!--
                                            		 <li role="presentation" class="active"><a href="#zrdl" aria-controls="zrdl" role="tab" data-toggle="tab">网上调查</a></li>
                                                                    <li role="presentation"><a href="#xzqh" aria-controls="xzqh" role="tab" data-toggle="tab">民意征集</a></li>
                                                                    <li role="presentation"><a href="#lsyg" aria-controls="lsyg" role="tab" data-toggle="tab">征集反馈</a></li>
                                                                -->
                                            		</ul>
                                                                <!-- Tab panes -->
                                                                <div class="tab-content navTab1-content navTab3-content pTextIndent" style="height:199px;">
                                                                    <div role="tabpanel" class="tab-pane active" id="zrdl">
                                                                        <ul class="panel2-list">
                                            			     <@voteListDirective channelId=52 pageSize=6 pageNum=pageNum titleLeft=40 order=2>  
                                               			    <#list cmsVotes as cmsContent>
                                                                               <li><span class="jh-dotted">·</span><a href="${cmsContent.filed1}" target="_blank">${cmsContent.title}<span class="panel2-list-time">${cmsContent.publishTime?substring(0,10)}</span></a></li>
                                               			</#list> 
                                               			</@voteListDirective>
                                                                        </ul>
                                                                    </div>
                                                                    <div role="tabpanel" class="tab-pane" id="xzqh">
                                                                        <ul class="panel2-list">
                                                                           <@contentListDirective channelId=53 pageSize=6 pageNum=pageNum titleLeft=40 order=2>  
                                               			    <#list contents as cmsContent>
                                                                               <li><span class="jh-dotted">·</span><a href="${cmsContent.url}" target="_blank">${cmsContent.title}<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a> </li>
                                               			</#list> 
                                               			</@contentListDirective>
                                                                        </ul>
                                                                    </div>
                                                                    <div role="tabpanel" class="tab-pane" id="lsyg">
                                                                        <ul class="panel2-list">
                                            				<@contentListDirective channelId=54 pageSize=6 pageNum=pageNum titleLeft=40 order=2>  
                                               			    <#list contents as cmsContent>
                                                                               <li><span class="jh-dotted">·</span><a href="${cmsContent.url}" target="_blank">${cmsContent.title}<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
                                               			</#list> 
                                               			</@contentListDirective>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                            </div>
                                              <div class="col-md-4">
                                                <div class="row">
                                                  <div class="col-xs-6 col-md-12">
                                                 
                                                 <@channelDirective channelId=45><!--县长--><#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail1">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                            	<@channelDirective channelId=46><!--书记--><#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail1">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                            	<@channelDirective channelId=47><!--部门信箱--><#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail1">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                                  </div>
                                                  <div class="col-xs-6 col-md-12"> 
                                                   <@channelDirective channelId=58><!----><#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail2">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                            	<@channelDirective channelId=59><!--12345--><#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail2">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                            	<@channelDirective channelId=60><!--微博广场-->
                                                  <#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail2">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a></#if>
                                            	</@channelDirective>
                                            	<@channelDirective channelId=57><!--阳光信访-->
                                                  <#if channel.forbidden=='0'>
                                            	   <a href="${channel.url}" target="_blank" class="thumbnail zmhd-thumbnail2">
                                            	       <img src="${channel.channelIcon!}">
                                            	   </a>
                                                    </#if>
                                            	</@channelDirective>
                                            	<!--<a href="#" class="thumbnail zmhd-thumbnail2"> <img src="img/12345zge.png"> </a>
                                            <a href="#" class="thumbnail zmhd-thumbnail2"> <img src="img/sunshine.png"> </a>
                                            <a href="#" class="thumbnail zmhd-thumbnail2"> <img src="img/messenge.png"> </a>
                                            	<a href="#" class="thumbnail zmhd-thumbnail2"> <img src="img/weibo1.png"> </a>
                                            	--></div>
                                                </div>
                                              </div>
                                              </div>
                                              </div>
                                              
                                                  <#include "/template/jh-links.ftl">
                                               </div>
                                                <#include "/template/jh-footer.ftl">
                                            <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script> 
                                            <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script> 
                                            <script type="text/javascript" src="/html/jinhu-static/bootstrap2/js/bootstrap.min.js"></script> 
                                            <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script> 
                                                  
                                                  <script type="text/javascript" src="/html/jinhu-static/layer/layer.min.js"></script> 
                                                   <script type="text/javascript" src="/html/jinhu-static/layer/extend/layer.ext.js"></script>
                                            <script type="text/javascript">
                                                
                                              $(function () {
                                                   $('input, textarea').placeholder();
                                                   $('.ggfw-cycx1').height($('.ggfw-cycx2').height()-1);
                                                   $(window).resize(function() {
                                                       $('.ggfw-cycx1').height($('.ggfw-cycx2').height()-1);
                                                   });
                                                   
                                                   $('#emailInfo').on('click', function(){
                                                    if($("#codeId").val() && $("#codeId").val()!="")
                                                    {
                                                        var tip = layer.prompt({title: '输入任何口令，并确认',type: 1}, function(pass){
                                                           $("#phone").val(pass);
                                                           $("#emailForm").submit();
                                                           layer.close(tip);
                                                        });
                                                    } 
                                                    else{
                                                    alert("请输入信件编号！");
                                                  }
                                                  });
                                                  $('#navTab1 a').hover(function () {
                   				$(this).tab('show');
                   			      });
                   				  $('#navTab1 a').click(function () {
                   				window.open($(this).data('url'));
                   			      });
                   			      $('#navTab2 a').hover(function () {
                   				$(this).tab('show');
                   			      });
                   				  $('#navTab2 a').click(function () {
                   				window.open($(this).data('url'));
                   			      });
                                               });
                                            </script>
                                            </body>
                                            </html>
                                            
                                           
                                          
                                         
                                        
           
          
         
        
       
      
     
    
   
  
 
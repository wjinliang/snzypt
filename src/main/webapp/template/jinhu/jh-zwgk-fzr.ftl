<!DOCTYPE html>
            <html>
            <head lang="en">
      <#include "/template/jh-meta.ftl">
                <title>${site.displayName}-${channel.displayName}</title>
                <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
                <!--[if lt IE 9]>
                <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                <script src="/html/jinhu-static/js/respond.min.js"></script>
                <![endif]-->
            </head>
            <body>
            <#include "/template/jh-head.ftl">
            <#include "/template/jh-daohang.ftl">
            <div class="container bg-white">
            <#include "/template/jh-current.ftl">
                <div class="jh-main">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="panel panel-default panel2">
                                <div class="panel-heading panel2-t panel2-t1 fontSize18">政府信息公开专栏</div>
                                <div class="panel-body">
                                    <div class="zwgk-alink-c">
                                        <div class="col-xs-6 col-md-12 col-lg-6">
                                            <@channelDirective channelId=22>
                                              <a target="_blank" href="${channel.url}" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开指南-->
    
 </@channelDirective>
 
                                            
                                        </div>
                                        <div class="col-xs-6 col-md-12 col-lg-6">
                                          <@channelDirective channelId=23>
                                              <a target="_blank" href="${channel.url}" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开制度-->
    
 </@channelDirective>
                                        </div>
                                        <div class="col-xs-6 col-md-12 col-lg-6">
                                          <@channelDirective channelId=24>
                                              <a target="_blank" href="${channel.url}" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开年报-->
    
 </@channelDirective>
                                        </div>
                                        <div class="col-xs-6 col-md-12 col-lg-6">
                                          <@channelDirective channelId=25>
                                              <a target="_blank" href="${channel.url}" class="zwgk-alink">${channel.displayName}</a><!--依申请公开-->
    
 </@channelDirective>
                                        </div>
                                        <div class="col-xs-12">
                                          <@channelDirective channelId=27>
                                              <a target="_blank" href="${channel.url}" class="zwgk-alink">${channel.displayName}</a><!--政府信息公开工作意见箱-->
    
 </@channelDirective>
                                        </div>
                                    </div>
                                    <div class="clearfix">
                                      <@channelDirective channelId=26>
                                              <a target="_blank" href="${channel.url}" class="color-green fontSize16 pd2 dis-b">${channel.displayName}</a><!--政府信息公开目录-->
    
 </@channelDirective>
                                      
                                        <ul class="panel2-list">
                                          <@channelDirective channelId=85>
                                            <li><span class="jh-dotted">·</span><a  target="_blank" href="${channel.url}">${channel.displayName}</a></li>  
                                            <!--县政府信息公开目录-->
    
 </@channelDirective>
                                          <@channelDirective channelId=86>
                                            <li><span class="jh-dotted">·</span><a target="_blank" href="${channel.url}">${channel.displayName}</a></li>  
                                            <!--县级部门政府信息公开目录-->
    
 </@channelDirective>
                                          <@channelDirective channelId=87>
                                            <li><span class="jh-dotted">·</span><a target="_blank" href="${channel.url}">${channel.displayName}</a></li>  
                                            <!--镇信息公开目录-->
    
 </@channelDirective>
                                        </ul>
                                    </div>
                                </div>
                            </div>
            		<@channelDirective channelId=28 >
                            <div class="color-green fontSize18 pd3 dis-b">${channel.displayName}</div>
                            <div class="row ggfw-btn-pd text-center">
            		<@channelListDirective channelId=channel.id order=1>
            		<#list channels as channel>
                                <div class="col-xs-3">
 			       <a target="_blank" href="${channel.url}" class="ggfw-btn" style="font-size:13px;">${channel.displayName}</a>
                                  <#--<#if channel.displayName?length lt 5>
                                    <a target="_blank" href="${channel.url}" class="ggfw-btn">${channel.displayName}</a>
                                   </#if>
                                  <#if channel.displayName?length gt 4>
                                    <a target="_blank" href="${channel.url}" class="ggfw-btn ">${channel.displayName?substring(0,2)}<span class="fontSmall2">${channel.displayName?substring(2)}</span></a>
                                   </#if>-->
                                </div>
            		</#list >
            		</@channelListDirective>
                            </div>
            		</@channelDirective >
                           <div class="row ggfw-lstd-pd mgt10">
          		<@channelListDirective channelId=5 order=1 excludeIds="20,21,22,23,24,25,26,27,28,29">
          		<#list channels as channel>
          		     <div class="col-xs-3">
                                  <a target="_blank" href="${channel.url}" class="thumbnail thumbnails text-center">
                                      <img src="${channel.channelIcon!}">
                                      <p>${channel.displayName}</p>
                                  </a>
                              </div>
          		</#list >
          		</@channelListDirective> 
                          </div> 
                        </div>
                        <div class="col-md-8 pdTop1em" id="orgContent">
                            
                        </div>
                    </div>
                </div>
                
               <#include "/template/jh-links.ftl">
            </div>
             <#include "/template/jh-footer.ftl">
            <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
            <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
            <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
            <script type="text/javascript">
                $(function () {
                 $("#orgContent").load("../../org/orgList");
                    $('input, textarea').placeholder();
                    $('#navTab1 a').click(function (e) {
                        e.preventDefault();
                        $(this).tab('show');
                    });
                    $('#navTab2 a').click(function (e) {
                        e.preventDefault();
                        $(this).tab('show');
                    });
                    $('#navTab3 a').click(function (e) {
                        e.preventDefault();
                        $(this).tab('show');
                    });
                });
            </script>
            </body>
            </html>
            
           
          
         
        
       
      
     
    
   
  
 
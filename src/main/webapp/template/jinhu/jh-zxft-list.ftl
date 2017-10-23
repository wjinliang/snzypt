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
                     <div class="fontSize18 new-list2-t">在线访谈</div>
             		<@interviewListDirective channelId=51 pageSize=10 pageNum=pageNum>
                     <table class="table table-bordered table-hover table1">
                         <thead>
                         <tr>
                             <th class="text-center" style="width:25%;">访谈标题</th>
                             <th class="text-center" style="width:60%;">邀请嘉宾</th>
                             <th class="text-center" style="width:15%;">访谈时间</th>
                         </tr>
                         </thead>
                         <tbody>
             			
             		 <#list cmsInterviews as v>
                         <tr>
                             <td title="${v.title!}"><a href="${v.url!}" target="_blank">${v.title!}</a></td>
                             <td title="${v.title!}"><a href="${v.url!}" target="_blank">${v.guests!}</a></td>
                             <td class="text-center">${v.startTime?substring(0,10)}</td>
                         </tr>
             		 </#list>
                         
                         </tbody>
                     </table>
                     <div class="text-right new-page">
                        ${pagination!}
                     </div>
             		</@interviewListDirective>
                 
            </div>
             <#include "/template/jh-footer.ftl">
               </div>
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
             
            
           
          
         
        
       
      
     
    
   
  
 
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
         <style type="text/css">
     		.sdss-bg-white{background:#f7f8e6;}
     		.sdss-bg-white .sdss-bg{height:366px; width:100%; background:url(/html/jinhu-static/img/game.jpg) center top no-repeat; background-size:size;}
     		.sdss-bg-white .sdss-logo{text-align:center; padding:75px 0;}
     		.sdss-bg-white .adss_fhsy_div{width:92%; text-align:right;}
     		.sdss-bg-white .sdss_fhsy{ display:inline-block; padding:0.5em 3em 0.8em 2.5em; background:url(/html/jinhu-static/img/yellow.png) no-repeat;}
     		.sdss-bg-white .sdss-panel{width:90%; margin:0 auto;}
     		.sdss-add-border{border-bottom:1px solid #5dae31;}
     	</style>
     </head>
     <body>
     <body class="sdss-bg-white">
     <div class="sdss-bg">
         <div class="sdss-logo">
          	<img src="/html/jinhu-static/img/2016threeg.png">
         </div>
         <div class="adss_fhsy_div"><a href="${site.url}" class="sdss_fhsy" target="_blank" title="返回首页"><返回首页</a></div>
     </div>
     
     <div class="container bg-white">
       <#include "/template/jh-rdzt-current.ftl">
         <div class="jh-main">
              <div class="ztrd3_pd sdss-panel fontSize16">
     		 <@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum>
     			<ul class="panel2-list ztrd3-panel pdb10 sdss-add-border">
     			<#list contents as content>
            			 <li><a href="${content.url}" title="${content.title!}" target="_blank"><span class="panel2-list-content">${content.title!}</span><span class="panel2-list-time">${content.publishDate?string("yyyy-MM-dd")}</span></a></li>
     			</#list>
            		</ul>
     			${pagination}
     
     		 </@contentListDirective>
            		<!--<ul class="panel2-list ztrd3-panel pdb10 sdss-add-border">
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/16815.html " title="县交通运输局“两学一做”助贫困学子“圆梦”" target="_blank"><span class="panel2-list-content">县交通运输局“两学一做”助贫困学子“圆梦”</span><span class="panel2-list-time">2016-09-17</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15637.html " title="吕良：推进“两学一做”增强群众获得感" target="_blank"><span class="panel2-list-content">吕良：推进“两学一做”增强群众获得感</span><span class="panel2-list-time">2016-08-15</span></a></li>
            			 <li><a href="/jinhuadmin/portal/content/15636.htm " title="县城管局：“三四五”全面推进“两学一做”学习教育" target="_blank"><span class="panel2-list-content">县城管局：“三四五”全面推进“两学一做”学习教育</span><span class="panel2-list-time">2016-09-12</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15635.html " title="深入开展“两学一做”活动，着力推进农机监理工作上水平" target="_blank"><span class="panel2-list-content">深入开展“两学一做”活动，着力推进农机监理工作上水平</span><span class="panel2-list-time">2016-08-13</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15634.html " title="县委中心组召开“两学一做”专题学习会" target="_blank"><span class="panel2-list-content">县委中心组召开“两学一做”专题学习会</span><span class="panel2-list-time">2016-08-09</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15632.html " title="金湖经信委扎实“两学一做”增强规矩意识" target="_blank"><span class="panel2-list-content">金湖经信委扎实“两学一做”增强规矩意识</span><span class="panel2-list-time">2016-08-06</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15630.html " title="苏垦米业集团宝应湖分公司践行“两学一做”成效显著" target="_blank"><span class="panel2-list-content">苏垦米业集团宝应湖分公司践行“两学一做”成效显著</span><span class="panel2-list-time">2016-08-06</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15631.html " title="县城管局践行“两学一做” 强化信访受理工作" target="_blank"><span class="panel2-list-content">县城管局践行“两学一做” 强化信访受理工作</span><span class="panel2-list-time">2016-08-06</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15628.html " title="县互联网信息中心党员赴黄花塘参观学习" target="_blank"><span class="panel2-list-content">县互联网信息中心党员赴黄花塘参观学习</span><span class="panel2-list-time">2016-08-05</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15629.html " title="县互联网信息中心党员赴黄花塘接受党性教育" target="_blank"><span class="panel2-list-content">县互联网信息中心党员赴黄花塘接受党性教育</span><span class="panel2-list-time">2016-08-05</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15627.html " title="金湖县国土局“五落实”坚持“两学一做”学习教育常态化" target="_blank"><span class="panel2-list-content">金湖县国土局“五落实”坚持“两学一做”学习教育常态化</span><span class="panel2-list-time">2016-08-03</span></a></li>
            			 <li><a href="/html/jinhu/xwzx/rdzt/lxyz/content/15625.html " title="金湖县人防办“四个环节”狠抓党员学习教育" target="_blank"><span class="panel2-list-content">金湖县人防办“四个环节”狠抓党员学习教育</span><span class="panel2-list-time">2016-08-01</span></a></li>
                        </ul>
                        <div class="text-right new-page"><span class="new-page-pd"><span class="color-green">1/7</span>&nbsp;页</span><span class="new-page-pd">共&nbsp;<span class="color-green">75</span>&nbsp;条记录</span><a href="javascript:;" class="btn btn-link">首页</a><a href="javascript:;" class="btn btn-link">上一页</a><a class="btn btn-link" href="/jinhuadmin/portal/channel/lxyz/217_2.htm">下一页</a><a class="btn btn-link" href="/jinhuadmin/portal/channel/lxyz/217_7.htm">尾页</a></div>
                        -->
                    </div>
                </div>
     </div>
     <#include "/template/jh-footer.ftl">
     <script type="text/javascript" src="/html/jinhu-static/js/visit-record.js"></script>  
     <script type="text/javascript" src="/html/jinhu-static/js/search-jinhu.js"></script>   
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
     
    
   
  
 
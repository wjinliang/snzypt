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
     		.lxyz-bg-white{background:#fffaf0 url(/html/jinhu-static/img/lxyz-bg1.jpg) center top no-repeat;;}
     		.lxyz-bg-white .lxyz_logo{ text-align:left; padding:140px 0 110px 50px;}
     		.lxyz-bg-white .lxyz_fhsy_div{width:80%; text-align:right;}
     		.lxyz-bg-white .lxyz_fhsy{ display:inline-block;}
     		.lxyz-bg-white .lxyz-panel{width:80%; margin:0 auto;}
     		.lxyz-bg-white .ft-bg-red{margin:2.5em 0 3em 0; background:#97040c; height:1em;}
     		.lxyz-bg-white .color-red{color:#97040c;}
     		.lxyz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
           .ft .ft-bg{background-color:#97040c;border-bottom: 3px solid #6B0019;}
               .ft {
                    background-color: #fffaf0; 
               }
               .color-green{color:#97040c;}
               a:focus, a:active, a:hover {
                  color: #97040c;
              }
     		
     	</style>
     </head>
     <body>
     <body class="lxyz-bg-white">
     <div class="lxyz-bg">
     	<div class="lxyz_logo"><img src="/html/jinhu-static/img/lxyz.png"></div>
         <div class="lxyz_fhsy_div"><a href="${site.url}" class="lxyz_fhsy" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
     </div>
     
     <div class="container">
         <#include "/template/jh-rdzt-current.ftl">
         <div class="jh-main">
              <div class="ztrd3_pd lxyz-panel fontSize16">
     		   <@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=2>  
                   <ul class="panel2-list ztrd3-panel pdb10 lxyz-add-border">		   
     		      <#list contents as cmsContent>
     			   <li><a href="${cmsContent.url!} " title="${cmsContent.title!}" target="_blank">
     			   <span class="panel2-list-content">${cmsContent.shortTitle!}</span>
     			   <span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
                   </#list> 
                    </ul>
     			    ${pagination} 
               </@contentListDirective>
     
     		 
     		 <!--
            		<ul class="panel2-list ztrd3-panel pdb10 lxyz-add-border">
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
               <div class="text-right new-page" style="padding-top:2em;"><span class="new-page-pd"><span class="color-red">1/7</span>&nbsp;页</span><span class="new-page-pd">共&nbsp;<span class="color-red">75</span>&nbsp;条记录</span><a href="javascript:;" class="btn btn-link">首页</a><a href="javascript:;" class="btn btn-link">上一页</a><a class="btn btn-link" href="/jinhuadmin/portal/channel/lxyz/217_2.htm">下一页</a><a class="btn btn-link" href="/jinhuadmin/portal/channel/lxyz/217_7.htm">尾页</a></div>          
           -->
     	  
     	  
     	  </div>
       </div>
     </div>
     <!--
     <div class="ft" style="background:#fffaf0">
              <div class="ft-bg-red"></div>
                    <div class="container">
                        <div class="row">
       		 <div class="col-sm-offset-2 col-sm-8 col-md-offset-3 col-md-6 col-lg-offset-4 col-lg-4 text-center fontSize16">
                                <div class="row ft-pd">
                                    <div class="col-xs-4"><a href="/html/jinhu/qita/content/406.html" target="_blank">在线投稿</a><span class="ft-line">|</span></div>
                                    <div class="col-xs-4"><a href="/html/jinhu/qita/content/407.html" target="_blank">联系我们</a><span class="ft-line">|</span></div>
                                    <div class="col-xs-4"><a href="/html/jinhu/qita/content/408.html" target="_blank">网站地图</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="row ft-pd1">
                            <div class="col-md-2">
                                
                                    <div class="thumbnail thumbnails">
                                     <script type="text/javascript">document.write(unescape("%3Cspan id='_ideConac' %3E%3C/span%3E%3Cscript  src='http://dcs.conac.cn/js/11/184/1349/60626310/CA111841349606263100002.js' type='text/javascript'%3E%3C/script%3E"));</script><span id="_ideConac"><a href="//bszs.conac.cn/sitename?method=show&amp;id=26EAF6BE8A587B40E053022819ACB209" target="_blank"><img id="imgConac" vspace="0" hspace="0" border="0" src="//dcs.conac.cn/image/red.png" data-bd-imgshare-binded="1"></a></span><script src="http://dcs.conac.cn/js/11/184/1349/60626310/CA111841349606263100002.js" type="text/javascript"></script><span id="_ideConac"></span>
                                </div>
                            </div>
                            <div class="col-md-9 text-center">
                                <p class="mgt20"><span>&nbsp; 金湖县人民政府主办 &nbsp;</span><span>&nbsp; 金湖县互联网信息中心承办 &nbsp;</span><span>&nbsp; 地址：江苏省金湖县建设路109号（县行政中心大楼）&nbsp;</span><span>&nbsp; 热线：0517--86812345&nbsp;</span></p>
                                <p>备案：苏ICP备06024932号</p>
                            </div>
                            <div class="col-md-2 text-right">
                                <div class="thumbnail thumbnails">
                                    <script id="_jiucuo_" sitecode="3208310001" src="http://pucha.kaipuyun.cn/exposure/jiucuo.js"></script><span id="_span_jiucuo"><img onclick="Link('3208310001')" style="margin:0;border:0;cursor: pointer;" src="http://pucha.kaipuyun.cn/exposure/images/jiucuo.png?v=3208310001"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
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
     
    
   
  
 
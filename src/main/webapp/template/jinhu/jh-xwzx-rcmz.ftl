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
       		.rcmz-bg-white{background:#fffaf0}
       		.rcmz-bg-white .rcmz_bg{height:377px; background:url(/html/jinhu-static/img/wrong_bg.jpg) no-repeat center top;}
       		.rcmz-bg-white .rcmz_logo{padding:150px 0 120px 0; text-align:center;}
       		.rcmz-bg-white .rcmz_fhsy_div{width:80%; text-align:right;}
       		.rcmz-bg-white .zsyz_fhsy{display:inline-block;}
       		.rcmz-bg-white .addwidth{width:90%; margin:0 auto;}
       		.rcmz-bg-white .ft-bg-red{margin:2.5em 0 3em 0; background:#97040c; height:1em;}
       		.rcmz-bg-white .color-green{color:#97040c;}
       		.rcmz-bg-white .lxyz-add-border{border-bottom:1px solid #97040c;}
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
       <body class="rcmz-bg-white">
       <div class="rcmz_bg">
       	<div class="rcmz_logo"><img src="/html/jinhu-static/img/fault.png"></div>
       	<div class="rcmz_fhsy_div"><a href="${site.url}" class="zsyz_fhsy" target="_blank" title="返回首页"><img src="/html/jinhu-static/img/fhsy2.png"></a></div>
       </div>
       
       <div class="container">
           <#include "/template/jh-rdzt-current.ftl">
           <div class="jh-main addwidth">
       	
       		<@channelListDirective channelId=own>
       			<#list channels as channel>
       			  
       			  <div class="col-md-6 pdTop1em pdb20">
                      <div class="wxqd-panel">
       			    
       					 <div class="wxqd-panel-t wxqd-red">
       						<a href="${channel.url}" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">${channel.displayName}</span> </a>
       						<div class="wxqd-panel-tw"></div>
       					  </div>
       				   
       				  <@contentListDirective channelId=channel.id pageSize=6 pageNum=1 titleLeft=20 order=2> 
       					  <div class="wxqd-panel-c bg-white" style="height:200px;">
       						  <ul class="panel2-list panel2-list-pds wxqd-red">
       						   <#list contents as cmsContent>
       							  <li><span class="jh-dotted color-oldgray">·</span>
       							  <a title="${cmsContent.title!}" href="${cmsContent.url!}" target="_blank">
       							  <span class="panel2-list-content">${cmsContent.shortTitle!}</span>
       							  <span class="panel2-list-time">${cmsContent.publishDate?string("yyyy-MM-dd")}</span></a></li>
       							</#list> 
       						  </ul>
       					  </div>
       				  </@contentListDirective>
                       </div>
            	       </div>		  
       			</#list>
       	    </@channelListDirective>
       
       	
       	
             	
       		
       		
       	<!--	
               <div class="col-md-6 pdTop1em pdb10">
                    <div class="wxqd-panel">
                        <div class="wxqd-panel-t wxqd-red">
                            <a href="/jinhuadmin/portal/channel/xzsysf/119_1.htm" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">工作动态</span> </a>
                               <div class="wxqd-panel-tw"></div>
                         </div>
                         <div class="wxqd-panel-c bg-white" style="height:183px;">
                             <ul class="panel2-list panel2-list-pds wxqd-red">
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="各部门、单位比照执行的收费项目目录" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22879.html" target="_blank"><span class="panel2-list-content">各部门、单位比照执行的收费项目目录</span><span class="panel2-list-time">2016-10-08</span></a></li>
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="金湖县行政事业性收费目录清单" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22873.html" target="_blank"><span class="panel2-list-content">金湖县行政事业性收费目录清单</span><span class="panel2-list-time">2016-10-08</span></a></li>
           			      </ul>
                         </div>
                    </div>
            	</div>
               <div class="col-md-6 pdTop1em pdb10">
                    <div class="wxqd-panel">
                        <div class="wxqd-panel-t wxqd-red">
                            <a href="/jinhuadmin/portal/channel/xzsysf/119_1.htm" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">大家谈</span> </a>
                               <div class="wxqd-panel-tw"></div>
                         </div>
                         <div class="wxqd-panel-c bg-white" style="height:183px;">
                             <ul class="panel2-list panel2-list-pds wxqd-red">
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="各部门、单位比照执行的收费项目目录" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22879.html" target="_blank"><span class="panel2-list-content">各部门、单位比照执行的收费项目目录</span><span class="panel2-list-time">2016-10-08</span></a></li>
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="金湖县行政事业性收费目录清单" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22873.html" target="_blank"><span class="panel2-list-content">金湖县行政事业性收费目录清单</span><span class="panel2-list-time">2016-10-08</span></a></li>
           			      </ul>
                         </div>
                    </div>
            	</div>
               <div class="col-md-6 pdTop1em pdb10">
                    <div class="wxqd-panel">
                        <div class="wxqd-panel-t wxqd-red">
                            <a href="/jinhuadmin/portal/channel/xzsysf/119_1.htm" target="_blank" class="wxqd-panel-tbg"><span class="color-white fontSize18">他山之石</span> </a>
                               <div class="wxqd-panel-tw"></div>
                         </div>
                         <div class="wxqd-panel-c bg-white" style="height:183px;">
                             <ul class="panel2-list panel2-list-pds wxqd-red">
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="各部门、单位比照执行的收费项目目录" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22879.html" target="_blank"><span class="panel2-list-content">各部门、单位比照执行的收费项目目录</span><span class="panel2-list-time">2016-10-08</span></a></li>
                                 <li><span class="jh-dotted color-oldgray">·</span><a title="金湖县行政事业性收费目录清单" href="/html/jinhu/ggfw/wzqd/xzsysf/content/22873.html" target="_blank"><span class="panel2-list-content">金湖县行政事业性收费目录清单</span><span class="panel2-list-time">2016-10-08</span></a></li>
           			      </ul>
                         </div>
                    </div>
            	</div>   
       		-->
           </div>
       </div>
       
       <#include "/template/jh-footer.ftl">
       <!--<div class="ft" style="background:#fffaf0">
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
       
      
     
    
   
  
 
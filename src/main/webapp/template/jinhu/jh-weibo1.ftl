<!DOCTYPE html>
       <html>
       <head lang="en">
           <#include "/template/jh-meta.ftl">
           <title>金湖政府网</title>
           <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
           <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
           <!--[if lt IE 9]>
           <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
           <script src="/html/jinhu-static/js/respond.min.js"></script>
           <![endif]-->
   	<style>
   		.add-edage p{height:40px; text-align:center; padding:5px 0;}
   		.border-green-add{margin:25px 0; border:1px solid #5eb326;}
   	</style>
       </head>
       <body>
       <#include "/template/jh-head.ftl">
           <#include "/template/jh-index-daohang.ftl">
           <div class="container bg-white">
           <div class="jh-main">
               <div class="jhgov-list bg-white">
   		<!--app下载-->
        <div class="list-content">
		<div id="containers" style="position: absolute; left: 374px; top: 282px; display: none; z-index:999;"><img width="121" height="121" src="http://open.weixin.qq.com/qr/code/?username=jrmsjq"></div>
        	
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green1.png" style="margin-right:10px;">微博</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.01">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" width="68" height="23"></a>
							</#if>
							<#if micr.qrCode??>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg"></a>
							</#if>
							<#if micr.androidAppUrl??>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" width="68" height="23"></a>
							</#if>
							<#if micr.appleAppUrl??>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" width="68" height="23"></a>
							</#if>
						    </dd>
						</dl>
					</#list>
				</@microcobolListDirective>
				<div class="clear"></div>
			</div>
		</div> 
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green1.png" style="margin-right:10px;">微信</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.02">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" width="68" height="23"></a>
							</#if>
							<#if micr.qrCode??>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg"></a>
							</#if>
							<#if micr.androidAppUrl??>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" width="68" height="23"></a>
							</#if>
							<#if micr.appleAppUrl??>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" width="68" height="23"></a>
							</#if>
						    </dd>
						</dl>
					</#list>
				</@microcobolListDirective>
				<div class="clear"></div>
			</div>
		</div> 
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green1.png" style="margin-right:10px;">App下载</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.03">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" width="68" height="23"></a>
							</#if>
							<#if micr.qrCode??>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg"></a>
							</#if>
							<#if micr.androidAppUrl??>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" width="68" height="23"></a>
							</#if>
							<#if micr.appleAppUrl??>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" width="68" height="23"></a>
							</#if>
						    </dd>
						</dl>
					</#list>
				</@microcobolListDirective>
				<div class="clear"></div>
			</div>
		</div> 
        <!--结束--> 
   		
           </div>
       </div>
       <#--<#include "/template/jh-links.ftl">-->
           </div>
           <#include "/template/jh-footer.ftl">
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
       
      
     
    
   
  
 
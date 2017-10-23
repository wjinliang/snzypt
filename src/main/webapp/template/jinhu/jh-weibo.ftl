<!DOCTYPE html>
       <html>
       <head lang="en">
           <#include "/template/jh-meta.ftl">
           <title>金湖政府网</title>
           <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
           <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
	              <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
           <!--[if lt IE 9]>
           <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
           <script src="/html/jinhu-static/js/respond.min.js"></script>
           <![endif]-->

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
        	
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green.png" style="margin-right:10px;">微博</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.01">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" alt="logo" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<#if micr.link?length gt 0>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" alt="微博" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.qrCode??>
							<#if micr.qrCode?length gt 0>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg" alt="微信" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.androidAppUrl??>
							<#if micr.androidAppUrl?length gt 0>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" alt="安卓App" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.appleAppUrl??>
							<#if micr.appleAppUrl?length gt 0>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" alt="苹果App" width="68" height="23"></a>
							</#if>
							</#if>
						    </dd>
						</dl>
					</#list>
				</@microcobolListDirective>
				<div class="clear"></div>
			</div>
		</div> 
		<div class="list-content">
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green.png" style="margin-right:10px;">微信</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.02">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" alt="logo" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<#if micr.link?length gt 0>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" alt="微博" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.qrCode??>
							<#if micr.qrCode?length gt 0>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg" alt="微信" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.androidAppUrl??>
							<#if micr.androidAppUrl?length gt 0>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" alt="安卓App" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.appleAppUrl??>
							<#if micr.appleAppUrl?length gt 0>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" alt="苹果App" width="68" height="23"></a>
							</#if>
							</#if>
						    </dd>
						</dl>
					</#list>
				</@microcobolListDirective>
				<div class="clear"></div>
			</div>
		</div> 
		<div class="list-content">
		<div class="color-green mgb20"><img src="/html/jinhu-static/img/green.png" style="margin-right:10px;">App下载</div>
			<div class="jddt">
				<@microcobolListDirective siteId=6 type="C02.03">
					<#list microcobols as micr>
						<dl class="jddt_list col-md-2 col-sm-1 col-xs-2">
							<dt><img alt="${micr.name!}" title="${micr.name!}" src="${micr.logo!}" alt="logo" height="70" width="70"></dt>
							<dd><span>${micr.name!}</span><br>
							<#if micr.link??>
							<#if micr.link?length gt 0>
							<a href="${micr.link}" target="_blank"><img src="/html/jinhu-static/img/addgz.gif" alt="微博" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.qrCode??>
							<#if micr.qrCode?length gt 0>
							<a class="weixin" href="${micr.qrCode}" onclick="window.open(this.href,'','width=121,height=121');return false"><img src="/html/jinhu-static/img/wxrwm.jpg" alt="微信" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.androidAppUrl??>
							<#if micr.androidAppUrl?length gt 0>
							<a href="${micr.androidAppUrl}" target="_blank"><img src="/html/jinhu-static/img/androdapp.png" alt="安卓App" width="68" height="23"></a>
							</#if>
							</#if>
							<#if micr.appleAppUrl??>
							<#if micr.appleAppUrl?length gt 0>
							<a href="${micr.appleAppUrl}" target="_blank"><img src="/html/jinhu-static/img/iponeapp.png" alt="苹果App" width="68" height="23"></a>
							</#if>
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
	   <script>
    jQuery(document).ready(function($) {
        $(".jddt_list a").each(function(index, el) {
            if($(this).attr("href") && $(this).attr("href").search(".jpg")>-1){
                $(this).attr('onclick', '');
            }
        });
        
        $(".jddt_list a").click(function(index, el) {
            if($(this).attr("href") && $(this).attr("href").search(".jpg")>-1){
                return false;
            }
        });
        $(".jddt_list a").mouseover(function(index, el) {
            $("#containers").hide();
        });
        $("a.weixin").mouseover(function(index, el) {
                $("#containers img").attr("src",$(this).attr("href"));
                var e = event || window.event;
                var left = event.pageX;
                var right = event.pageY;
                $("#containers").css({
                    left: left,
                    top: right,
                });
                $("#containers").show();
        });
    });
</script>
       </script>
       </body>
       </html>
       
      
     
    
   
  
 
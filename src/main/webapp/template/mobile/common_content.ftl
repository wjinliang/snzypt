<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0,minimum-scale=1.0, user-scalabele=no"/><!-- 手机屏幕网页初始大小占屏幕面积100% -->
<title>详情页</title>
<!--css-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/global.css"><!--全局样式-->
<link type="text/css" rel="stylesheet" href="${htmlFolder}${htmlMobileFolder}/css/main.css">
<!--javaScript-->
<script src="${htmlFolder}${htmlMobileFolder}/js/retina.js"></script><!--适应2倍屏-->
</head>

<body>

<!--头部开始-->

<#include "/template/mobile/daohang.ftl" />
<!-- 头部结束 -->

<div class="mg-a3">
    <div class="f22 cBla3 mg-t3 mg-b4 fn-text-center">${cmsContent.title!}</div>
    <div class="ub lineB cBla2 f16 pd-b2 mg-b2"><span class="mg-r4">${cmsContent.publishDate?string("yyyy-MM-dd HH:mm:ss")}</span><span>${cmsContent.origin!}</span></div>
    <div class="jgzzCont cBla3 lineB">
        ${cmsContent.contentText?default("")}
    </div>
    <div class="ub lineB pd-a3 ub-ac">
      <#if cmsAttachments??>
       <#list cmsAttachments as cmsAttachment>
    	<div class="ub-f1 pd-r4 f16 cBla1">${cmsAttachment.attachmentName?default("未命名")}</div>
       <a href='${cmsAttachment.attachmentUrl}' target="_blank"><div class="down-bg ubwh1 ub ub-ac ub-pc"><div class="ico_down"></div></div></a>
          </#list>                                                                                 
        </#if>  
    </div>
</div>

</body>
<script src="${htmlFolder}${htmlMobileFolder}/js/jquery.min.js"></script><!--Menu-->
<script><!--Menu-->
$(function(){
	$("#header span.right").on("click",function(){
        var val = $(this).attr('class');
        if(val.indexOf('on') == -1){
            $(this).addClass('on');
            $(".menu").show(0).stop().animate({
                height:'34rem'
            },0);
        }else{
            $(this).removeClass('on');
            $(".menu").hide(0).stop().animate({
                height:'0'
            },0);
        }
    })
	
	$(".menu a").on("click",function(){
        $(this).parents(".menu").hide();
        $("#header span.right").removeClass('on');
    })
	
});
</script>
</html>

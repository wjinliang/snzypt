<!doctype html>
<html>
<#include "/template/my-head.ftl"/>

<body>
   <#include "/template/my-daohang.ftl"/>
	<!--文章具体内容-->
    <div class="main-content">	
    <div class="container">
    	<ol class="my-breadcrumb">
            <span>当前位置</span>
	    <@currentLocationDirective contentId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
        </ol>
    	<div class="my-article bg-white mgb20">
        	<h1 class="mgb20">
            	<p><span style="${cmsContent.titleStyle!}">${cmsContent.title?default("")}</span></p>
                <div class="otherInfo pdb10" id="otherInfo">
                	<p>
                    	<span>来源：${cmsContent.origin?default("")}</span>
                        <span>日期：<#if cmsContent.publishDate??>${(cmsContent.publishDate?string("yyyy年MM月dd日"))}</#if></span>
                    </p>
                    <dl>
                    	<script language="JavaScript" type="text/javascript">
                         	function changeSize(size){document.getElementById('zheng_wen').style.fontSize=size+'px';}
                         </script>
                    	【字号&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" style="font-size:16px;" onClick="changeSize(16)">大</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" style="font-size:14px;" onClick="changeSize(14)">中</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="javascript:void(0)" style="font-size:12px" onClick="changeSize(12)">小</a>
                        &nbsp;
                        】
                    </dl>
                  	<div>
                    	<span onClick="doPrint('zheng_wen');">打印</span>
                        <span onClick="AddFavorite(document.URL,document.title);">收藏</span>
                    </div>
                </div>
                <div class="clear"></div>
            </h1>
            <div id="zheng_wen" class="pdb20">
            	<div class="zhen_wen_edit" style="min-height:300px">
		 ${cmsContent.contentText?default("")}
		</div>
		<#if cmsAttachments??>
		<div class="mgb10">
            	附件下载：
        	<#list cmsAttachments as cmsAttachment>
			<a href="/topiecms/cms/attachment/download/${cmsAttachment.id}"><img src="/html/miyun-static/img/download1.png">${cmsAttachment.attachmentName?default("未命名")}</a>&nbsp;&nbsp;
		</#list>
        	</div>	
        	 </#if>
            </div>
            <div class="artivle_bottom">
            	转摘声明：转摘请注明出处并做回链
            </div>	
    	</div>
    </div>
    </div>
   <#include "/template/my-footer.ftl"/>
</body>
</html>

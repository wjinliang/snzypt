<!doctype html>
<html>
<head>
<#include "/template/my_head.ftl">
</head>
<body>
	
<#include "/template/my_header.ftl">
     <div class="wrapper my_bg" id="wrapper">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                    <div class="position-info">
                        <span>您所在的位置：</span>
                         <@currentLocationDirective contentId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                    </div>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12">
                	<div class="my-article bg-white mgb20" id="article">
                        <h1 class="mgb20">
                            <p style="font-size:18px">${cmsContent.title?default("")}</p>
                            <div class="otherInfo pdb10 clearfix" id="otherInfo">
                                <p>
								<span  style="font-size:14px;">来源：${cmsContent.origin?default("")}</span>
                        <span  style="font-size:14px;">日期：<#if cmsContent.publishDate??>${(cmsContent.publishDate?string("yyyy年MM月dd日"))}</#if></span>
                                  
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
                                    <span onClick="printdiv('zheng_wen');">打印</span>
                                    <span onClick="AddFavorite(document.URL,document.title);">收藏</span>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </h1>
                        <div id="zheng_wen" class="pdb20">
                            <div class="zhen_wen_edit">
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
                        <div class="artivle_bottom">
                            转摘声明：转摘请注明出处并做回链
                        </div> 	
                    </div>
                </div>
            </div>
        </div>
    </div>
   <#include "/template/my_footer.ftl">
<script type="text/javascript">
	function AddFavorite(sURL, sTitle)
	{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
          alert("加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}
	function printdiv(printpage)
	{
		var headstr = "<html><head><title></title></head><body>";
		var footstr = "</body>";
		var newstr = document.all.item(printpage).innerHTML;
		var oldstr = document.body.innerHTML;
		document.body.innerHTML = headstr+newstr+footstr;
		window.print(); 
		document.body.innerHTML = oldstr;
		return false;
	}
</script>
</body>
</html>

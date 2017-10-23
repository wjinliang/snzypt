<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>北京涉农资源信息平台</title>
<link rel="stylesheet" type="text/css" href="/html/shenong-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/layout.css">
<script type="text/javascript" src="/html/shenong-static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/html/shenong-static/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<#include "/template/sn_daohang.ftl">
    <div class="con-wrap bg-img-data" style="padding-bottom:15px;">
    	<div class="container">
        	<div class="row">
                <div class="position-info">
                    <span>您所在的位置：</span>
                    <@currentLocationDirective contentId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                </div>
            </div>
            <div class="row">
            	<div class="col-md-12" style="padding-left:0px;">
                	<div class="sn-article" id="article">
                    	<div class="panel-body">
                            <h1 class="clearfix">
                                <p style="font-size:18px;">${cmsContent.title?default("")}</p>
                                <div class="otherInfo pdb10" id="otherInfo">
                                    <span style="font-size:16px;">作者：${cmsContent.author?default("")}</span>
                                    <span style="font-size:16px;">来源：${cmsContent.origin?default("")}</span>
                                    <span style="font-size:16px;">日期：<#if cmsContent.publishDate??>${(cmsContent.publishDate?string("yyyy年MM月dd日"))}</#if></span>
                                </div>
                                <div class="pull-right">
                                    <span onclick="printdiv('article');" class="fontSize14">打印</span>
                                    <span onclick="AddFavorite(document.URL,document.title);" class="fontSize14">收藏</span>
                                </div>
                            </h1>
                            <div id="zheng_wen" class="pdb20">
                                <div class="zhen_wen_edit">
                                    ${cmsContent.contentText?default("")}
                                </div>
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
                    </div>	
                </div>
               <!-- <div class="col-md-4">
                	<div class="hot-data-title icon-bg2">
                    	<span class="blue">实时资讯</span>
                        <a href="/html/shenong-static/" class="pull-right"><img src="/html/shenong-static/img/icona3.png" width="66" height="17"></a>
                        <em class="xian"><img src="/html/shenong-static/img/icon13.png" width="250" height="3"></em>
                    </div>
                    <div class="real-time-info mgt20">
                    	<ul>
                        	<li><a href="/html/shenong-static/" class="clearfix">
                            	
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                            <li><a href="/html/shenong-static/" class="clearfix">
                            	
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                            <li><a href="/html/shenong-static/" class="clearfix">
                            	
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                            <li><a href="/html/shenong-static/" class="clearfix">
                            	
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                            <li><a href="/html/shenong-static/" class="clearfix">
                            	
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                            <li><a href="/html/shenong-static/" class="clearfix">
                                <span>昨日郑糖低位 现货价格稳中有降 </span>
                                <span class="pull-right">2016-12-23</span>
                            	</a>
                            </li>
                        </ul>
                    </div>-->
                    <div><img src="/html/shenong-static/img/icon13.png" style="width:100%;" height="3"></div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/shenong-static/js/qiehuan.js"></script>
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

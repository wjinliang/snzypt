<!doctype html>
<html>
<#include "/template/sn_head.ftl">
</head>

<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<ul class="interact-list clearfix">
                	<#assign enArr = ["DOWNLOAD","DATA SHARE","SURVEY","FEED BACK"] >
		<@channelListDirective channelId=4>
							<#list channels as chan>
                        
                	<li style="padding-left:0px;"><a href="${chan.url!}">${chan.displayName!}<br>${enArr[chan_index]}</a></li>
			</#list>
		</@channelListDirective><!--
                    <li><a href="" target="_blank">数据共享<br>DATA SHARE</a></li>
                    <li><a href="" target="_blank">问卷调查<br>SURVEY</a></li>
                    <li style="padding-right:0px;"><a href="" target="_blank">意见反馈<br>FEED BACK</a></li>-->
                </ul>
            </div>
            <div class="row mgt15">
            	<div class="col-md-3" style="padding-left:0px;">
                	<div class="interact-realT-con">
                    	<p>实时资讯</p>
                        <ul id="interact-realT-list">
						<@channelListDirective channelId=7>
							<#list channels as chan>
                        		<li class="${(chan.id==cmsContent.channelId)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
							</#list>
						</@channelListDirective>
                        	
                        </ul>
                    </div>
                </div>
                <div class="col-md-9" style="padding-right:0px;">
                	<div class="interact-item">
                    	<div class="position-info">
                        	<span>当前位置：</span>
                        <@currentLocationDirective contentId=own divider="&nbsp;&nbsp;&gt;&nbsp;&nbsp;">${current}</@currentLocationDirective>
                        </div>
			
                        <div class="sn-article mgt15" id="article">
                            <div class="panel-body">
                                <h1 class="clearfix">
                                    <p style="font-size:18px;">${cmsContent.title!}</p>
                                    <div class="otherInfo pdb10" id="otherInfo">
                                        <span style="font-size:16px;">作者：${cmsContent.author!}</span>
                                        <!--<span style="font-size:16px;">阅读：<i id="read">5</i>次</span>-->
                                        <span style="font-size:16px;">日期：${cmsContent.publishDate?string("yyyy年MM月dd日")}</span>
                                    </div>
                                    <div class="pull-right">
                                        <span onclick="printdiv('article');" class="fontSize14">打印</span>
                                        <span onclick="AddFavorite(document.URL,document.title);" class="fontSize14">收藏</span>
                                    </div>
                                </h1>
                                <div id="zheng_wen" class="pdb20">
                                    <div class="zhen_wen_edit">
										<#if cmsContent.titleImageUrl!=''>
                                        <p align="center"><img src="${cmsContent.titleImageUrl!}" alt="${cmsContent.titleImageIllustrate!}" width="383" height="255"></p>
										</#if>
                                        <p align="justify" style="text-indent:2em;">
											${cmsContent.contentText!};
										</p>
                                    </div>
                                </div>
                                <div class="mgb20">
									<#if cmsAttachments??>
												附件下载：
											<#list cmsAttachments as cmsAttachment>
											<a href="/topiecms/cms/attachment/download/${cmsAttachment.id?c}"><img src="/html/sn-static/static/image/download1.png"">${cmsAttachment.attachmentName?default("未命名")}</a>&nbsp;&nbsp;
										</#list>
											 </#if>

                                </div>
                            </div>            	
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/sn-static/static/js/webindex.js"></script>
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

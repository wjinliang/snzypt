<!DOCTYPE html>
<html>
<head lang="en">
    <#include "/template/jh-meta.ftl">
    <title></title>
    <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
    <script src="/html/jinhu-static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<#include "/template/jh-head.ftl">
<#include "/template/jh-daohang.ftl">
<div class="container bg-white">
<#include "/template/jh-current.ftl">
    <div class="jh-main">
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default panel2">
                    <div class="panel-heading panel2-t panel2-t1 fontSize18">政府信息公开专栏</div>
                    <div class="panel-body">
                        <div class="zwgk-alink-c">
                            <div class="col-xs-6 col-md-12 col-lg-6">
                                <a href="#" class="zwgk-alink">政府信息公开指南</a>
                            </div>
                            <div class="col-xs-6 col-md-12 col-lg-6">
                                <a href="#" class="zwgk-alink">政府信息公开制度</a>
                            </div>
                            <div class="col-xs-6 col-md-12 col-lg-6">
                                <a href="#" class="zwgk-alink">政府信息公开年报</a>
                            </div>
                            <div class="col-xs-6 col-md-12 col-lg-6">
                                <a href="#" class="zwgk-alink">依申请公开</a>
                            </div>
                            <div class="col-xs-12">
                                <a href="#" class="zwgk-alink">政府信息公开工作意见箱</a>
                            </div>
                        </div>
                        <div class="clearfix">
                            <a href="#" class="color-green fontSize16 pd2 dis-b">政府信息公开目录</a>
                            <ul class="panel2-list">
                                <li><span class="jh-dotted">·</span><a href="#">县政府信息公开目录</a></li>
                                <li><span class="jh-dotted">·</span><a href="#">县级部门政府信息公开目录</a></li>
                                <li><span class="jh-dotted">·</span><a href="#">镇信息公开目录</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
		<@channelDirective channelId=28 >
                <div class="color-green fontSize18 pd3 dis-b">${channel.displayName}</div>
                <div class="row ggfw-btn-pd text-center">
		<@channelListDirective channelId=channel.id order=1>
		<#list channels as channel>
                    <div class="col-xs-3">
                        <a href="${channel.url}" class="ggfw-btn">${channel.displayName}</a>
                    </div>
		</#list >
		</@channelListDirective>
                </div>
		</@channelDirective >
                </div>
                <div class="row ggfw-lstd-pd mgt10">
		<@channelListDirective channelId=5 order=1>
		<#list channels as channel>
		     <div class="col-xs-3">
                        <a href="${channel.url}" class="thumbnail thumbnails text-center">
                            <img src="${channel.channelIcon!}">
                            <p>${channel.displayName}</p>
                        </a>
                    </div>
                    <div class="col-xs-3">
                        <a href="${channel.url}" class="ggfw-btn">${channel.displayName}</a>
                    </div>
		</#list >
		</@channelListDirective> 
                </div>
            </div>
            <div class="col-md-8 pdTop1em">
	   <@channelDirective channelId=88 >
                <div class="fontSize18 new-list2-t">${channel.displayName}</div>
		<@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=2> 
		 <ul class="panel2-list panel2-list-pd news-list2">
		<#list contents as cmsContent>
		<li><a title="${cmsContent.title}" target="_blank" href="${cmsContent.url}">
		<span class="panel2-list-content">${cmsContent.title}</span>
		<span class="panel2-list-time">${cmsContent.publishDate?string("yyyy年MM月dd日")}</span></a></li>
			
		</#list> 
		</ul>
		${pagination} 
		</@contentListDirective>
                
		</@channelDirective>
            </div>
        </div>
    </div>
      
   <#include "/template/jh-links.ftl">
</div>
 <#include "/template/jh-footer.ftl">
<script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
        $('#navTab1 a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $('#navTab2 a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
        $('#navTab3 a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });
    });
</script>
</body>
</html>
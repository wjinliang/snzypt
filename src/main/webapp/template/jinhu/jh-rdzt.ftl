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
	.jh-main{min-height:380px;}
    </style>
</head>
<body class="rdzt-bg">
<div class="rdzt-logo">
    <span class="thumbnail thumbnails">
        <img src="/html/jinhu-static/img/rdzt_logo.png">
    </span>
</div>
<div class="container">
    <div class="jh-main fontSize16 bg-white">
        <div class="border-gray pd7">
            <div class="fontSize18 color-blue mgb10">专题列表</div>
            <div class="row">
				<@channelListDirective channelId=own >
				<#list channels as channel>
				<#if (channel_index==12)>
					<div class="row mgb20 mgt20" ></div>
				</#if>
				
                <div class="col-xs-12 col-sm-6">
                    <ul class="panel2-list panel2-list-sm">
                        <li><span class="jh-dotted">·</span><a href="${channel.url!}" target="_blank">${channel.displayName!}</a></li>
                    </ul>
                </div>
				
				</#list>
				</@channelListDirective>
            </div>
        </div>
    </div>
   </div>
   <#include "/template/jh-footer.ftl">
<script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
        /*添加此JS*/
        $('.jh-link-click').click(function(){
            $('#'+$(this).data('src')).slideToggle('normal').siblings().css('display','none');
        });
    });
</script>
</body>
</html>
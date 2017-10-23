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
</head>
<body>
<#include "/template/jh-head.ftl">
<#include "/template/jh-daohang.ftl">
<div class="container bg-white">
    <#include "/template/jh-current.ftl">
    <div class="jh-main">
        <div class="fontSize18 new-list2-t">${channel.displayName}</div>
        <div class="ggfw-ztfw-list">
			<@contentListDirective channelId=own pageSize=channel.pageSize pageNum=pageNum titleLeft=32 order=2>  				                              		<#list contents as cmsContent>
			<a href="${cmsContent.url}" class="borderBottom">
                <p class="fontSize18 color-green">${cmsContent.title}</p>
		
                <p>${cmsContent.brief?default("")}…<span class="color-green">【详细】</span></p>
                <p class="color-gray">${cmsContent.publishDate?string("yyyy年MM月dd日")}</p>
            </a>
			</#list> 
			</div>
			${pagination} 
			</@contentListDirective>
            <!--<a href="#" class="borderBottom">
                <p class="fontSize18 color-green">创建省城市管理示范路环境综合整治工作方案</p>
                <p>局属各单位、科室：为着力营造“容貌整洁、秩序井然、环境优美、居民满意、富有特色”的道路、社区和城市环境面貌，根据《省政府办公厅关于印发江苏省城市环境综合整治行动实施方案的通知》精神，对照省城市管理示范路检查考核标.…<span class="color-green">【详细】</span></p>
                <p class="color-gray">2016年08月11日</p>
            </a>
        </div>
        <div class="text-center new-page">
            <span class="new-page-pd"><span class="color-green">1/481</span>&nbsp;页</span>
            <span class="new-page-pd">共&nbsp;<span class="color-green">8164</span>&nbsp;条记录</span>
            <button class="btn btn-link">首页</button>
            <button class="btn btn-link">上一页</button>
            <button class="btn btn-link">下一页</button>
            <button class="btn btn-link">尾页</button>
        </div>-->
	
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
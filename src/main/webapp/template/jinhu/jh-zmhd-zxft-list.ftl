<!DOCTYPE html>
<html>
<head lang="en">
     <#include "/template/jh-meta.ftl">
    <title>${site.displayName!}-${channel.displayName!}</title>
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
        <table class="table table-bordered table-hover table1">
            <thead>
            <tr>
                <th class="text-center">访谈标题</th>
                <th class="text-center">邀请嘉宾</th>
                <th class="text-center">访谈时间</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>走进交通运输局</td>
                <td>金湖农业委员会副主任</td>
                <td class="text-center">2016-08-08</td>
            </tr>
            <tr>
                <td>网友走进消防部队</td>
                <td>安全生产监督管理局副局长</td>
                <td class="text-center">2016-08-06</td>
            </tr>
            <tr>
                <td>央视新闻直播间：江苏金湖：全国中小学生手球锦标赛举行</td>
                <td>市科技局副局长</td>
                <td class="text-center">2016-08-05</td>
            </tr>
            <tr>
                <td>手球世界 快乐时光——2016全国中小学生手球锦标赛主题曲</td>
                <td>市住房和城乡建设局副局长</td>
                <td class="text-center">2016-08-05</td>
            </tr>
            <tr>
                <td>2016 年“金马”回眸</td>
                <td>市国土资源局副局长</td>
                <td class="text-center">2016-08-05</td>
            </tr>
            <tr>
                <td>央视新闻直播间：淮安金湖国际半程马拉松赛开赛</td>
                <td>市人力资源和社会保障局党委书记</td>
                <td class="text-center">2016-08-04</td>
            </tr>
            <tr>
                <td>醉美的金湖 最美的马拉松</td>
                <td>安全生产监督管理局副局长</td>
                <td class="text-center">2016-08-03</td>
            </tr>
            <tr>
                <td>城市频道寻味金湖：春天的味道</td>
                <td>市人力资源和社会保障局党委书记</td>
                <td class="text-center">2016-08-03</td>
            </tr>
            <tr>
                <td>金湖农村淘宝宣传片</td>
                <td>金湖农业委员会副主任</td>
                <td class="text-center">2016-08-03</td>
            </tr>
            </tbody>
        </table>
        <div class="text-right new-page">
            <span class="new-page-pd"><span class="color-green">1/481</span>&nbsp;页</span>
            <span class="new-page-pd">共&nbsp;<span class="color-green">8164</span>&nbsp;条记录</span>
            <button class="btn btn-link">首页</button>
            <button class="btn btn-link">上一页</button>
            <button class="btn btn-link">下一页</button>
            <button class="btn btn-link">尾页</button>
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
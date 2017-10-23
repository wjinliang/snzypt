<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>欢迎来到密云综合信息门户！</title>
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/layout.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/style1.css">
<link rel="stylesheet" type="text/css" href="/html/miyun1-static/css/style2.css">
<script type="text/javascript" src="/html/miyun1-static/js/jquery-1.12.1.min.js"></script>
</head>

<body>
	<#include "/template/my-headbox.ftl">
    <div class="con-wrap">
    	<div class="container">
            <div class="row mgt20">
   				<div class="col-md-9" style="padding-left:0px;">
            	<div class="col-md-6">
                	<div class="slide-x" id="slide-x">
                    	<div class="box">
                        	<ul class="list clearfix">
				<@pictureListDirective pageSize=4 pageNum=1 >
				     <#list contents as cmsContent>
					<li>
						<a href="${cmsContent.url}" target="_blank"><img src="${cmsContent.titleImageUrl!}" width="370" height="272"></a>
						<p><a href="${cmsContent.url}" target="_blank">&nbsp;&nbsp;${cmsContent.shortTitle!}</a></p>
					</li>
					</#list> 
				 </@pictureListDirective>
                            	
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                	<div class="hot-news-title">
                    	<span><img src="/html/miyun1-static/img/font.png" width="77" height="22"></span>
                        <span class="more right"><a href="/html/miyun1-static/" target="_blank">更多&gt;&gt;</a></span>
                    </div>
                    <div class="hot-news-con">
                    	<@topOneDirective pageSize=4 pageNum=1 titleLeft=16 >
				     <#list contents as cmsContent>
				     <div class="news-item">
					<p><a href="${cmsContent.url}" target="_blank">${cmsContent.shortTitle!}</a></p>
				    <p><a href="${cmsContent.url}" target="_blank">${cmsContent.bref!}</a></p>
				</div>
					</#list> 
				 </@topOneDirective>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            	<div class="seachText mgb20">
		<form action="/topiecms/portal/search_1.html" method="get">
                    	<input type="text" id="search-keywords" class="search-keywords" name="search-keywords" value="${textValue!}" placeholder="查询内容名称新闻标题">
                        <input type="submit" class="searchBtn">
                        <div class="clear"></div>
                    </form>
                </div>
                
            	<div class="userLogin">
                	<div class="tit">用户登录</div>
                    <div class="panel-body">
                    <form id="userLogin" action="http://139.129.203.216:8080/miyun/j_spring_security_check" method="post" target="_blank" >
                    	<ul>
                        	<li class="mgb20">
                           		<span>用户名</span>
                            	<input type="text" placeholder="用户名" id="j_username" name="j_username" value="">
                            </li>
                            <li class="mgb20">
                            	<span>密&nbsp;&nbsp;&nbsp;码</span>
                                <input type="password" placeholder="密码" id="j_password" name="j_password" value="">
                            </li>
                            <li class="addBtn">
                            	<input type="submit" value="登录">
                            </li>
                        </ul>
                    </form>
                    </div>
                </div>
            </div>         	
         </div>     
         <div class="row mgt20">
            	<div class="col-md-8" style="padding-left:0px">
                	<div class="hot-data-title icon-bg1">
                    	<span class="blue">展示系统</span>
                        <a href="/html/miyun1-static/" class="pull-right"><img src="/html/miyun1-static/img/icona3.png" width="66" height="17"></a>
                        <em class="xian"><img src="/html/miyun1-static/img/icon13.png" width="600" height="3"></em>
                    </div>
                    <div class="hot-data-con mgt20">
                    	<ul class="hot-data-list clearfix">
                        	<li>
                            	<div>
                            	<a href="javascript:tishi();"><img src="/html/miyun1-static/img/chart1.png" style="width:100%;" height="172"></a>
                                <p>水情信息</p>
                                </div>
                            </li>
                            <li>
                            	<div>
                            	<a href="javascript:tishi();"><img src="/html/miyun1-static/img/chart2.png" style="width:100%;" height="172"></a>
                                <p>水工信息</p>
                                </div>
                            </li>
                            <li>
                            	<div>
                            	<a href="javascript:tishi();"><img src="/html/miyun1-static/img/chart3.png" style="width:100%;" height="172"></a>
                                <p>水质</p>
                                </div>
                            </li>
                            <li>
                            	<div>
                            	<a href="javascript:tishi();"><img src="/html/miyun1-static/img/chart3.png" style="width:100%;" height="172"></a>
                                <p>水环境保护</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4">
                	<div class="notice">
			<@channelDirective channelId=6>
			<div class="hot-data-title icon-bg2">
                            <span class="blue">${channel.displayName!}</span>
                            <a href="${channel.url!}" class="pull-right"><img src="/html/miyun1-static/img/icona3.png" width="66" height="17"></a>
                            <em class="xian"><img src="/html/miyun1-static/img/icon13.png" width="250" height="3"></em>
                        </div>
                        <div class="real-time-info mgt20">
                            <ul>
				<@contentListDirective channelId = channel.id pageSize=3 titleLeft=18>
				<#list contents as cont>
					<li><a href="${cont.url!}" target="_blank"  class="clearfix" title="${cont.title!}"><span>${cont.shortTitle!} </span>
                                    <span class="pull-right">${cont.publishDate?string("yyyy-MM-dd")}</span></a></li>
				</#list>
				</@contentListDirective>
			    </ul>
			</div>
			</@channelDirective>  
                    </div>
                    <div class="public-board">
                    	<@channelDirective channelId=5>
				<div class="project-title">
					<span>${channel.displayName!}</span>
				<a href="${channel.url!}" target="_blank" class="right">更多》</a>
				</div>
				<div class="project-con panel-body">
					<ul>
					<@contentListDirective channelId = channel.id pageSize=3 titleLeft=18>
					<#list contents as cont>
						<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a></li>
					</#list>
					</@contentListDirective>
				</ul>
				</div>
				</@channelDirective>
                    </div>
                </div>	
            </div>
            <div class="row mgt10">
            	<div class="col-md-12">
		    <#assign configArr = [7,24,9] >

			<#list configArr as it>

			 <div class="col-md-4" style="padding-left:0px;">
				<@channelDirective channelId=it>
				<div class="project-title">
					<span>${channel.displayName!}</span>
				<a href="${channel.url!}" target="_blank" class="right">更多》</a>
				</div>
				<div class="project-con panel-body">
					<ul>
					<@contentListDirective channelId = channel.id pageSize=3 titleLeft=18>
					<#list contents as cont>
						<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a></li>
					</#list>
					</@contentListDirective>
				</ul>
				</div>
				</@channelDirective>
			</div>
			</#list>
                </div>
            </div>
        
            <#include "/template/my-links.ftl">
        </div>	
    </div>
    <#include "/template/my-footer.ftl">
<script type="text/javascript" src="/html/miyun1-static/js/qiehuan.js"></script>
<script type="text/javascript" src="/html/miyun1-static/js/webjs.js"></script>
<script type="text/javascript">
	function tishi(){
		alert("未开通");
	}
</script>
</body>
</html>

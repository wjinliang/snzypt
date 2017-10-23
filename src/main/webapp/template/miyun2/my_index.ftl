<!doctype html>
<html>
<head>
<#include "/template/my_head.ftl">
</head>

<body>
	<#include "/template/my_header.ftl">
     <div class="wrapper my_bg" id="wrapper">
    	<div class="container">
        	<div class="row mgt20">
            	<div class="col-md-8">
                	<div class="panel-body bg-body">
                    	<div id="slideBox" class="slideBox">
                              <ul class="items">
			      <@pictureListDirective pageSize=4 pageNum=1>
  				     <#list contents as cmsContent>
  					<li>
  						<a href="${cmsContent.url}" target="_blank"><img src="${cmsContent.titleImageUrl!}" width="370" height="272"></a>
  						<p><a href="${cmsContent.url}" target="_blank">&nbsp;&nbsp;${cmsContent.shortTitle!}</a></p>
  					</li>
  					</#list> 
  				 </@pictureListDirective>
                                
                              </ul>
                        </div>
                        <div class="hotNews">
                        	<h2 class="set_font"><span>热点新闻</span><a href="" class="pull-right" style="font-size:16px; margin-top:5px;">更多 >></a></h2>
                            <ul class="hotNews-list">
			    <@topOneDirective pageSize=4 pageNum=1 titleLeft=16 >
  				     <#list contents as cmsContent>
  				     
				<li>
                                	<h2><a href="${cmsContent.url}" target="_blank" class="hot-tit">${cmsContent.shortTitle!}</a></h2>
                                    <div class="hot-abstract pText3">${cmsContent.bref!}</div>
                                </li>
  					</#list> 
  				 </@topOneDirective>
                            	
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                	<div id="loginWrapper">
                    	<h2 class="loginTit">用户登录</h2>
                        <div class="panel-body loginCon">
                            <form id="loginForm" name="loginForm"  action="http://192.168.2.40:8080/miyun/j_spring_security_check" method="post" target="_blank">
                                <label>用户名</label>
                                <input type="text" id="j_username" name="j_username" class="textField">
                                <label>密码</label>
                                <input type="password" id="j_password" name="j_password" class="textField">
                                <div style="text-align:center;"><input type="submit" value="登录" class="login-btn"></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>	
            <div class="row mgt15">
            	<div class="col-md-8">
                	<div class="my-project">
                    	<div class="panel-body clearfix">
			 <#assign configArr = [6,5,7,9] >
  
  			<#list configArr as it>
  
  				<@channelDirective channelId=it>
                            <div class="four-item  secondiv">
                                <h2 class="my-projtTit"><span>${channel.displayName!}</span><a href="${channel.url!}" class="pull-right">更多 >></a></h2>
                                <ul>
				<@contentListDirective channelId = channel.id pageSize=3 titleLeft=15>
  					<#list contents as cont>
						<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a></li>
  					</#list>
  				</@contentListDirective>
                                   
                                </ul>
                            </div>
                           </@channelDirective>
			   </#list>
                            </div>	
                    </div>
                    <div class="friend-links" style="margin-top:18px;">
                    	<h2 class="my-systemTit"><span class="set-font1">友情链接</span></h2>	
                        <div class="panel-body" style="padding-bottom:0;">
                            <div id="links">
                                <ul class="links-list clearfix">
				<@friendlinkDirective siteId=1 pageSize=100 >
					<#list friendlinks as link>
					<li>
                                    <a href="${ link.link}" target="_blank"><img src="${ link.logo!}" width="167" height="63">
                                    	<p>${ link.name}</p>
                                    </a>
                                </li>
					</#list>
				    </@friendlinkDirective >
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                	<div class="three-item">
                    	<div class="show-system">
                        	<div class="panel-body">
                        		<h2 class="my-systemTit"><span class="set-font1">展示系统</span></h2>
                                <ul class="system-list clearfix">
                                    <li class="lione"><a href="/topiecms/portal/channel/ysyqxx/29_1.htm" target="_blank">雨水雨情信息</a></li>
                                    <li class="lifour"><a href="/topiecms/portal/channel/shjbh/26_1.htm">水环境保护</a></li>
                                    <li class="litwo"><a href="javascript:void(0);">实时水位</a></li>
                                    <li class="lithree"><a href="javascript:void(0);">水质信息</a></li>
                                </ul>
                            </div>
                        </div>	
                    </div>
                    <div class="three-item">
                    	<div class="show-system" style="margin-top:10px;">
			<@channelDirective channelId=24>
                        	<div class="panel-body">
                        		<h2 class="my-systemTit"><a href="${channel.url}" target="_blank" class="set-font1">${channel.displayName}</a></h2>
                                <ul class="newsList clearfix">
                                   <@contentListDirective channelId = channel.id pageSize=3 titleLeft=15>
  					<#list contents as cont>
						<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a><span>[${cont.publishDate?string("MM-dd")}]</span></li>
  					</#list>
  				</@contentListDirective>
                                </ul>
                            </div>
			    </@channelDirective>
                        </div>
                    </div>
                    <div class="three-item">
                    	<div class="show-system" style="margin-top:10px;">
			<@channelDirective channelId=28>
                        	<div class="panel-body">
                        		<h2 class="my-systemTit"><a href="${channel.url}" target="_blank" class="set-font1">${channel.displayName!}</a></h2>
                                <ul class="newsList clearfix">
				<@contentListDirective channelId = channel.id pageSize=3 titleLeft=15>
  					<#list contents as cont>
						<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a><span>[${cont.publishDate?string("MM-dd")}]</span></li>
  					</#list>
  				</@contentListDirective>
                                </ul>
                            </div>
			    </@channelDirective>
                        </div>	
                    </div>	
                </div>
            </div>
        </div>
     </div>
    <#include "/template/my_footer.ftl">
<script type="text/javascript" src="/html/miyun-static/static/js/jquery.slideBox.js"></script>
<script>

jQuery(function($){
	$('#slideBox').slideBox({
		duration : 0.3,//滚动持续时间，单位：秒
		easing : 'linear',//swing,linear//滚动特效
		delay : 5,//滚动延迟时间，单位：秒
		hideClickBar : false,//不自动隐藏点选按键
		clickBarRadius : 10
	});
});
</script>
<script type="text/javascript" src="/html/miyun-static/static/js/webindex.js"></script>
</body>
</html>

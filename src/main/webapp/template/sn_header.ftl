<div class="header" >
    	<div class="head-top" id="headtop">
        	<div class="container">
            	<div class="row">
                	<span>您好,欢迎光临北京市涉农信息资源平台</span>
                    <a id="login" href="javascript:void(0)">登录</a>
                    <a id="userInfo" href="javascript:void(0)"></a>
                    <a id="logout" href="javascript:void(0)"></a>
		    <!--|<a href="javascript:void(0)">免费注册</a>-->
                </div>
            </div>
        </div>
        <div class="head-bottom">
        	<div class="container">
            	<div class="row">
                	<div>
                        <span><img src="/html/sn-static/static/image/logo.png"></span>
                        <ul class="nav nav-pills alter-nav">
 <li class="<#if own??><#else> active</#if>"><a href="${site.url}">首页</a></li>
			    <@channelListDirective siteId=1><#list channels as chan>
				<li  class="<#if own??>${(own==chan.id)?string('active','')}</#if>"><a href="${chan.url}">${chan.displayName}</a></li>
				</#list></@channelListDirective>

                        </ul>
                    </div>
                </div>
            </div>
            <div id="container"><div id="output"></div></div>
        </div>
    </div>
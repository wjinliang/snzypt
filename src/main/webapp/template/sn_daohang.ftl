<div class="headBox">
    	<div class="headBar">
        	<div class="container">
            	<h4 class="pull-left">欢迎来到北京市涉农信息资源平台！</h4>
               <!-- <p class="pull-right">
                	<button type="button" class="alter-btn r-radius pull-right">登录</button>
                    <button type="button" class="alter-btn l-radius pull-right btn-active">注册</button>
                </p>-->
            </div>
        </div>
        <div class="headWrap">
        	<div class="head-bg-img">
            	<img src="/html/shenong-static/img/title.png" height="153" style="width:100%;">
            </div>
            <div class="nav-box">
                <div class="container">
                    <div class="row">
                        <ul class="nav nav-pills alter-nav">
                            <li class="active"><a href="${site.url}">首页</a></li>
			    <@channelListDirective siteId=1><#list channels as chan>
				<li  class=""><a href="${chan.url}">${chan.displayName}</a></li>
				</#list></@channelListDirective>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

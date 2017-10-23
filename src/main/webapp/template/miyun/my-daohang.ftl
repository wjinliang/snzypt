<div class="container">
    	<div class="row">
        	<div class="col-md-6 hd-logo">
            	<a href="${site.url}" title="密云水库综合信息门户"><img src="/html/miyun-static/img/hd-logo.png" width="100%" height="100%;"></a>	
            </div>
        </div>
    </div>
    <div class="nav-bg">
    	<div class="container">
        	<div class="col-md-1 col-xs-1 current shouye mgt10">
            	<a href="${site.url}">首页</a>
            </div>
            <div class="col-md-11 col-xs-11" id="nav-list">
            	<div class="row">
		<@channelListDirective siteId=1><#list channels as chan>
			<div class="col-xs-2"><a href="${chan.url}">${chan.displayName}</a></div>
		</#list></@channelListDirective>
                </div>
            </div>
        </div>
    </div>
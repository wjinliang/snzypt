<div class="header">
        <div class="container">
        	<div class="border_blue"></div>
            <div class="headLogo">
            	<a href="#" target="_blank"><img src="/html/miyun-static/static/img/tophead.png" height="78"></a>
                <div class="input-group searchBtn">
<!--		<form action="/topiecms/portal/search_1.html" method="get">-->
					<input type="text" value${textValue!}="" class="form-control" placeholder="搜索新闻标题">
					<span class="input-group-btn">
						<button class="btn btn-default alter_btn" type="submit"><img src="/html/miyun-static/static/img/search.png" style="margin-right:10px; vertical-align:middle;">查询</button>
					</span>
					<!--</form>-->
				</div>
            </div>
            <ul class="my_nav clearfix">
                <li class="active"><a href="${site.url}">首 页</a></li>
		<@channelListDirective siteId=1>
			<#list channels as chan>
			<#if (chan_index==6 ||chan_index==0)>
				<li style="margin-left:14%;"><a href="${chan.url}">${chan.displayName}</a></li>
			<#else>
				<li><a href="${chan.url}">${chan.displayName}</a></li>
			</#if>
			</#list>
		</@channelListDirective>
              
            </ul>    	
        </div>
     </div>
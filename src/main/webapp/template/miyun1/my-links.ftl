<div class="row mgt15">
            	<div class="hot-data-title icon-bg3">
                    <span class="blue">友情链接</span>
                    <a href="/html/miyun1-static/" class="pull-right"><img src="/html/miyun1-static/img/icona3.png" width="66" height="17"></a>
                    <em class="xian"><img src="/html/miyun1-static/img/icon13.png" width="800" height="3"></em>
                 </div>
                 <div class="hot-topic">
                 	<div class="panel-body">
                    	<div class="img-box">
                        	<div id="demo">
                            	<#--<div class="f-link-item left">
                                    <a><img src="/html/miyun1-static/img/bannerimg.png" width="167" height="83">
                                    	<p class="mgt10">链接一名称</p>
                                    </a>
                                </div>
                               -->
				<@friendlinkDirective siteId=1 pageSize=10 >
					<#list friendlinks as link>
					<div class="f-link-item left">
                                    <a href="${ link.link}" target="_blank"><img src="${ link.logo!}" width="167" height="83">
                                    	<p class="mgt10">${ link.name}</p>
                                    </a>
                                </div>
					</#list>
				    </@friendlinkDirective >
                            </div>
                        </div>
                    </div>
			</div>
            </div>
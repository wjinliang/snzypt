<#--<div class="fontSize18 zwgk-ld-t">县政府</div>
                <div class="zwgk-ld-list1" >
                    <div class="zwgk-ld-name clearfix"><span class="fontSize16">姓名：${leader.name}</span></div>
                    <p class="fontSize16">职务：${leader.occupation}</p>
                    <p>分工：${leader.division}</p>
                </div>
                <div class="fontSize16 pd4 color-green">相关新闻</div>
                <ul class="panel2-list panel2-list-pd news-list2">
		<#list news as ne>
			<#if ne_index lt 10>
                    <li><a href="${ne.url}"><span class="panel2-list-content">${ne.title}</span><span class="panel2-list-time">${ne.publishDate}</span></a></li>
		    </#if>
		</#list>
                   
                </ul>-->


<div class="fontSize18 zwgk-ld-t">${leader.org!}</div>
                <div class="row zwgk-ld-list1" style="margin-bottom:0px; border-bottom:none;">
                	<div class="col-md-3">
                    	<img src="${leader.headImg!}" width="140" height="200"; style="max-height:200px; max-width:140px;">
                    </div>
                    <div class="col-md-9" style="position:relative; margin-top:20px;">
                    	<div class="zwgk-ld-name" style="border-bottom:none; margin-bottom:0px;">
                        	<span class="fontSize16">姓&nbsp;&nbsp;&nbsp;&nbsp;名：${leader.name!}</span> 	
                        </div>
                        <div class="fontSize16 ">职&nbsp;&nbsp;&nbsp;&nbsp;务：<span>${leader.occupation}</span></div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="row fontSize16 " style="border-bottom:1px dotted #d3d3d3; margin-bottom:1em; padding:0 0 1.5em 0.5em">分&nbsp;&nbsp;&nbsp;&nbsp;工：<span>${leader.division!}</span></div>
                <div class="fontSize16 pd4 color-green">相关新闻</div>
                <ul class="panel2-list panel2-list-pd news-list2">
		<@leaderContentListDirective leaderId=leader.id pageSize=10>
		    <#list contents as ne>
                    <li><a href="${ne.url}" target="_blank"><span class="panel2-list-content">${ne.title}</span><span class="panel2-list-time">${ne.publishDate?string('yyyy-MM-dd')}</span></a></li>
		    
		</#list>
		</@leaderContentListDirective>
		</ul>
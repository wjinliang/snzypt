<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<style>
	#update-time{
		float: right;
		margin-right: 103px;
	}
</style>
<body>
	<#include "/template/sn_header.ftl">
    <div class="wrapper">
    	<div class="container">
        	<div class="row mgt15">
            	<ul class="interact-list clearfix">
                	<#assign enArr = ["DOWNLOAD","DATA SHARE","SURVEY","FEED BACK"] >
		<@channelListDirective channelId=4>
							<#list channels as chan>
                        
                	<li style="padding-left:0px;"><a href="${chan.url!}">${chan.displayName!}<br>${enArr[chan_index]}</a></li>
			</#list>
		</@channelListDirective><!--
                    <li><a href="" target="_blank">数据共享<br>DATA SHARE</a></li>
                    <li><a href="" target="_blank">问卷调查<br>SURVEY</a></li>
                    <li style="padding-right:0px;"><a href="" target="_blank">意见反馈<br>FEED BACK</a></li>-->
                </ul>
            </div>
            <div class="row mgt15">
            	<div class="col-md-3" style="padding-left:0px;">
                	<div class="interact-realT-con">
                    	<p>实时资讯</p>
                        <ul id="interact-realT-list">
                        	<@channelListDirective channelId=8>
							<#list channels as chan>
                        		<li class="${(chan.id==own)?string('active','')}"><a href="${chan.url}">${chan.displayName}</a></li>
							</#list>
						</@channelListDirective>
                        </ul>
                    </div>
                </div>
                <div class="col-md-9" style="padding-right:0px;">
                	<div class="interact-item">
                    	<div class="position-info">
                        	<span>当前位置：</span>			    
                        <@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&gt;&nbsp;&nbsp;">${current}</@currentLocationDirective>
                        </div>
                        <div class="interact-item-con mgt15">

						<@contentListDirective channelId=own pageSize =5 pageNum=pageNum titleLeft=25 contentLeft=100>
                        	<ul id="interact-con-list">
							<#list contents as con>
                            	<li class="clearfix">
                                	<div class="panel-body">
                                    	<a class="pull-left interact-itemA" href="${con.url!}" target="_blank" title="${con.title!}">
                                        	<img src="/html/sn-static/static/image/realtime1.png" width="120" height="90">
                                            <span>0${con_index+1}</span>
                                        </a>
                                        <div class="interact-box pull-right">
                                            <p>
                                                <a href="${con.url!}" class="fontSize16"> ${con.title!}
                                                <span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                                <span id="update-time"> ${con.publishDate?string("yyyy-MM-dd")}</span></a>
                                            </p>
                                            <p class="pText">${con.brief!}</p>
                                        </div>	
                                    </div>
                                </li>
                               </#list>
                            </ul>
							${pagination!}
                            </@contentListDirective>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/sn_footer.ftl">
</body>
</html>

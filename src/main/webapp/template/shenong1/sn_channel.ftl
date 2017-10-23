<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<title>北京涉农资源信息平台</title>
<link rel="stylesheet" type="text/css" href="/html/shenong-static/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/html/shenong-static/css/layout.css">
<script type="text/javascript" src="/html/shenong-static/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="/html/shenong-static/bootstrap/js/bootstrap.min.js"></script>
</head>

<body>
	<#include "/template/sn_daohang.ftl">
    <div class="con-wrap bg-img-data">
    	<div class="container">
        	<div class="row">
                <div class="position-info">
                    <span>您所在的位置：</span>
                    <@currentLocationDirective channelId=own divider="&nbsp;&nbsp;&nbsp;&gt;&gt;">${current}</@currentLocationDirective>
                </div>
            </div>
            <div class="row">

            	<div class="col-md-3">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default current-nav">
			<#if channel.pid??>
					<@channelDirective channelId=channel.pid>
					 <div class="panel-heading abar-bg alter-title">
						<h4 class="panel-title">
						    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						   ${channel.displayName!}
						    </a>
						</h4>
					    </div>
					<@channelListDirective channelId=channel.id>
					
						<ul  id="collapseOne" class="alter-con panel-collapse collapse in">
						<#if (channels?size>0)>
						<#list channels as chan>
						<li><a href="${chan.url!}" >${chan.displayName!}</a></li>
						</#list>
						<#else>									
										<li><a href="${channel.url}">${channel.displayName!}</a></li>
									</#if>
					    </ul>
					
					</@channelListDirective>
					</@channelDirective>
					
					<#else>
						 <div class="panel-heading abar-bg alter-title">
						<h4 class="panel-title">
						    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
						   ${channel.displayName!}
						    </a>
						</h4>
					    </div>
						<ul  id="collapseOne" class="alter-con panel-collapse collapse in">
							<@channelListDirective channelId=channel.id>
								
									<#if (channels?size>0)>
										<#list channels as chan>
											<li><a href="${chan.url!}">${chan.displayName!}</a></li>
										</#list>
									<#else>									
										<li><a href="${channel.url}">${channel.displayName!}</a></li>
									</#if>
								
							</@channelListDirective>
							</ul>
					</#if>
                        </div>
                    </div>
                </div>
                <div class="col-md-9" style="padding-right:0px;">
			<@contentListDirective channelId=own pageSize=pageSize pageNum=pageNum titleLeft=38>
                	<div class="item" id="item-list">
                            <ul>
			    <#list contents as con>
                            	<li class="catalog-bg clearfix "><!-- data-active -->
                                	<div class="panel-body">
                                    	<a class="pull-left" href="${con.url!}" target="_blank" title="${con.title!}"><img src="<#if con.titleImageUrl??>${con.titleImageUrl}<#else>/html/shenong-static/img/catalog.png</#if>" width="122" height="86"></a>
                                    <div class="catalog-info-box pull-left">
                                    	<p>
                                            <a href="${con.url!}" class="fontSize16">${con.shortTitle!}</a>
                                            <!--<span class="grade">
                                                    <i>&nbsp;</i>
                                                    <i>&nbsp;</i>
                                                    <i>&nbsp;</i>
                                                    <i>&nbsp;</i>
                                            </span>-->
                                		</p>
                                        <p>
                                            <!--所属部门：
                                            <span id="depart">市农业局</span>-->
                                            更新时间:
                                            <span id="update-time">${con.publishDate?string('yyyy-MM-dd')}</span>
                                        </p>
                                    </div>	
                                    </div>
                                </li>
				</#list>
                            </ul>
			    ${paginationlist}
                           <!-- <div class="pagenav pull-right">
                            	<span href="javascript:void(0)">&nbsp;</span>
                                <a href="javascript:void(0)" class="current">1</a>
                                <a href="javascript:void(0)">2</a>
                                <a href="javascript:void(0)">3</a>
                                <a href="javascript:void(0)">4</a>
                                <a href="javascript:void(0)">5</a>
                                ...
                                <a href="javascript:void(0)">12</a>
                                <span href="javascript:void(0)">&nbsp;</span>-->
                            </div>
			    </@contentListDirective>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <#include "/template/sn_footer.ftl">
<script type="text/javascript" src="/html/shenong-static/js/qiehuan.js"></script>   	
</body>
</html>

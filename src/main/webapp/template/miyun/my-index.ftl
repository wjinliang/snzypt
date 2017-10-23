<!doctype html>
<html>
<#include "/template/my-head.ftl"/>

<body>
	<#include "/template/my-daohang.ftl"/>
    <!--内容区-->
    <div class="container">
        <div class="my-main">
        <!--新闻中心-->
        <div class="row mgt20 pdb15" style="border-bottom:1px solid #000;">
        	<div class="col-md-9">
            	<div class="col-md-6" style="padding-left:0px;">
                	<div class="slide-x" id="slide-x">
                    	<div class="box">
                        	<ul class="list">
                            	<@pictureListDirective pageSize=4 pageNum=1 >
				     <#list contents as cmsContent>
					<li>
						<a href="${cmsContent.url}" target="_blank"><img src="${cmsContent.titleImageUrl!}" width="360" height="272"></a>
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
                    	<span>热点新闻</span>
                    </div>
                    <div class="hot-news-con">
                    	 <@pictureListDirective pageSize=4 pageNum=1 >
		     <#list contents as cmsContent>
				<div class="news-item">
					<p><a href="${cmsContent.url}" target="_blank" title="${cmsContent.title!}">${cmsContent.shortTitle!}</a></p>
				    <p><a href="${cmsContent.url}" target="_blank" title="${cmsContent.title!}">${cmsContent.brief!}</a></p>
				</div>
				</#list> 
			 </@pictureListDirective>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
            	<div class="seachText mgb20">
                	<form action="/topiecms/portal/search_1.html" method="get">
                    	<input type="text" id="search-keywords" class="search-keywords" name="keywords" value="${textValue!}" placeholder="查询内容名称新闻标题">
                        <input type="submit" class="searchBtn">
                        <div class="clear"></div>
                    </form>
                </div>
                
            	<div class="userLogin">
                	<div class="tit">用户登录</div>
                    <div class="panel-body">
                    <form id="userLogin" method="post">
                    	<ul>
                        	<li class="mgb20">
                           		<span>用户名</span>
                            	<input type="text" placeholder="用户名" id="memberUid">
                            </li>
                            <li class="mgb20">
                            	<span>密&nbsp;&nbsp;&nbsp;码</span>
                                <input type="text" placeholder="密码" id="memberUpd">
                            </li>
                            <li class="addBtn">
                            	<input type="button" onclick="tishi()" value="登录">
                            </li>
                        </ul>
                    </form>
                    </div>
                </div>
            </div>
        </div>
        <!--项目管理-->
        <div class="row mgt20">
        	<div class="col-md-9">
		<#assign configArr = [23,7,24,5] >

		<#list configArr as it>
		 <div class="col-md-6" style="padding-left:0px;">
			<@channelDirective channelId=it>
            		<div class="project-title">
                		<span>${channel.displayName!}</span>
                    	<a href="${channel.url!}" target="_blank" class="right">更多》</a>
                	</div>
                	<div class="project-con panel-body">
                		<ul>
				<@contentListDirective channelId = channel.id pageSize=3 titleLeft=22>
				<#list contents as cont>
                    			<li><a href="${cont.url!}" target="_blank" title="${cont.title!}">${cont.shortTitle!}</a></li>
				</#list>
				</@contentListDirective>
                    	</ul>
                	</div>
			</@channelDirective>
                </div>
		</#list>
                <!--友情链接-->
                <#include "/template/my-links.ftl"/>

            </div> 				
            <!--展示系统-->
            <div class="col-md-3">
            	<div class="showProject">
            	<div class="show-pject-tit">
                	<span>展示系统</span>
                </div>
                <div class="show-pject-con panel-body mgt10" style="height:140px;">
                	<ul>
                    	<li class="mgb20"><a href="javascript:tishi();" target="_blank">水情信息</a></li>
                        <li class="mgb20"><a href="javascript:tishi();" target="_blank">水工信息</a></li>
                        <li><a href="javascript:tishi();" target="_blank">水&nbsp;&nbsp;&nbsp;&nbsp;质</a></li>
                        <li><a href="javascript:tishi();" target="_blank">水环境保护</a></li>
                    </ul>
                </div>
                </div>
                <!---->
		<#assign configArray = [6,25] >

		<#list configArray as ite>
               <div>
		<@channelDirective channelId=ite>
            		<div class="show-pject-tit">
                		<span><a href="${channel.url!}" target="_blank" class="right">${channel.displayName!}</a></span>
                    	
                	</div>
                	<div class="share-pject panel-body">
                		<ul>
				<@contentListDirective channelId = channel.id pageSize=4 titleLeft=22>
				<#list contents as cont>
                    			<li><a href="${cont.url!}" target="_blank" title="${cont.title!}"><span>${cont.shortTitle!}</span><span class="right">${cont.publishDate!}</span></a></li>
				</#list>
				</@contentListDirective>
                    	</ul>
                	</div>
			</@channelDirective>
                </div>
		</#list>
               
               
            </div>
        </div>
        </div>
    </div>
<#include "/template/my-footer.ftl"/>
</body>
<script type="text/javascript">
$(function(){
	var MyMar;
	var dir=1;
	var speed=20;    //设置滚动速度
	var demo = document.getElementById('demo');
	var demo1 = document.getElementById('demo1');
	var demo2 = document.getElementById('demo2');
	demo2.innerHTML=demo1.innerHTML;  //复制demo1到demo2
	function Marquee(){
		if(dir>0 && (demo2.offsetWidth-demo.scrollLeft)<=0){ //dir>0  dome2.offsetWidth-dome.scrollLeft<=0  向左方向滚动时候  当滚动至dome1与dome2交界时
			demo.scrollLeft=0;
		}
		if(dir<0 &&(demo.scrollLeft<=0)){
			demo.scrollLeft=demo2.offsetWidth;
		} 
		demo.scrollLeft+=dir;
		demo.onmouseover=function(){
							clearTimeout(MyMar);
						}
		demo.onmouseout=function(){
							MyMar=setTimeout(Marquee,speed);
						}
		MyMar = setTimeout(Marquee,speed);
	}
	function left(){
		if (dir=-1)dir=1;
	}
	function right(){
		if (dir=1)dir=-1;
	}
	Marquee();
	});
	function tishi(){
		alert("未开通");
	}
</script>
</html>

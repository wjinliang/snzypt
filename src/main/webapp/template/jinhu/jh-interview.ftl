<!DOCTYPE html>
        <html>
        <head lang="en">
            <#include "/template/jh-meta.ftl">
            <title>${site.displayName!}</title>
          	<meta name="keywords" content="" />
            <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
	    <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
            <script src="/html/jinhu-static/js/respond.min.js"></script>
            <![endif]-->
        </head>
        <body>
        
        <#include "/template/jh-head.ftl"/>
        <#include "/template/jh-daohang.ftl"/>
        <div class="container bg-white">
            
                <div class="jh-main">
			<div class="fontSize18 new-list2-t">在线访谈</div>
			<div class="zmhd-zxft-article fontSize18">
			    <div class="jh-article-title fontSize22 text-center color-green pdt10 mgb20">
			    <span>${cmsInterview.title!}</span></div>
			    <div class="row">
			     <#if (cmsInterview.info.images?size gt 0)>
			    <#list cmsInterview.info.images as image>
				<#if (image_index==0)>
				<div class="col-xs-4">
				    <div class="thumbnail thumbnails">
					<img src="${image.imgUrl!}" class="thumbnail-border-gray">
				    </div>
				</div>
				</#if>
			    </#list>
			     </#if>
				<div class="col-xs-${(cmsInterview.info.images?size gt 0)?string('8','12')}">
			    <p><span>访谈主题：${cmsInterview.title!}</span><#if cmsInterview.status=='2'><span><a href="./question?id=${cmsInterview.id}" style="color:red;margin-left:10px;" target="_blank">[预约提问]</a></span></#if></p>
			    <p>访谈时间：${cmsInterview.startTime!}-${cmsInterview.endTime!}</p>
			    <p>访谈嘉宾：${cmsInterview.guests!}</p>
					 
			    <p>访谈摘要： ${cmsInterview.desc!}</p>
			    </div></div>
			    <div class="border-green"></div>
			    <#if (cmsInterview.info.images?size gt 0)>
			    <div>
				    <span class="zmhd-zxft-bg mgb20" style="margin-right:75%">访谈图片</span>
				    <#if (cmsInterview.info.images?size gt 4)><span class="mores" style="cursor:pointer;" >更多>></span></#if>
			    </div>
			    <div class="row">
				<#list cmsInterview.info.images as image>
				<#if image_index lt 4>
				<div class="col-xs-3">
				    <div class="thumbnail thumbnails">
					<img src="${image.imgUrl!}" class="thumbnail-border-gray" style="width:100%; height:147px;">
				    </div>
				</div>
				</#if>
				</#list>
			    </div>
			<div class="row">
			    <div class="clearfix" id="hidepic" style="display:none;">
				<#list cmsInterview.info.images as image>
				<#if image_index gt 3>
				<div class="col-xs-3" style="margin-top:18px;">
				    <div class="thumbnail thumbnails">
					<img src="${image.imgUrl!}" class="thumbnail-border-gray" style="width:100%; height:147px;">
				    </div>
				</div>
				</#if>
				</#list>
		            </div>
			   </div>
			     <div class="border-dotted-gray"></div>
			    </#if>
			    <#--<#if (cmsInterview.info.records?size gt 0)>-->
			   
			    <div><span class="zmhd-zxft-bg mgb20">文字直播</span></div>
			     <div class="col-md-9">
				<!--<div class="arr_ran">
					<form>
					<span>间隔：</span>
					<select id="select_time">
						<option selected="selected" value="1">30秒</option>
						<option value="2">1分钟</option>
					    <option value="3">2分钟</option>
					    <option value="4">5分钟</option>
					</select>
					<span class="on">自动刷新</span>
					<span class="on">手动刷新</span>
				    </form>
				</div>-->
				<div class="online-talks">
				    <#list cmsInterview.info.records as record>
					<p><span class="color-green">${record.roleName!}<#if record.filed1??>[${record.filed1!}]</#if>：</span>${record.content!}</p>				
				    </#list>
				</div>
			    </div>
			    
			    <!--相关信息-->
			    <div class="col-md-3">
				<div class="panel panel-default panel2 panel-more">
						<div class="color-green pd3 dis-b border-green-1"><span class="color-green"><span class="mgr10"><img src="/html/jinhu-static/img/green.png"></span>相关新闻</span></div>
					<div class="panel-body panel-body-1">
					     <div>
					     <#list cmsInterview.info.abouts as record>
						 <p class="fontSize14"><span class="jh-dotted">·</span><a href="${record.url!}" target="_blank">${record.title!}</a></p>
					     </#list> 
					     </div>
					</div>
				  </div>
			    </div>
			</div>
		    </div>
         </div>
        </div>
        <#include "/template/jh-footer.ftl">
        <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
        <script type="text/javascript">
            $(function () {
                $('input, textarea').placeholder();
		$(".mores").click(function(){
		$("#hidepic").slideToggle('normal').siblings().css('display','none');

			/*if($("#rowId").css("display")=="none"){
				$("#rowId").show();
				}
				else{
					$("#rowId").hide();
				} */
					
			});
            });
        </script>
        </body>
        </html>
        
       
      
     
    
   
  
 
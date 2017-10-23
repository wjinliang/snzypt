<!DOCTYPE html>
               <html>
               <head>
               <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
               <meta http-equiv="X-UA-Compatible" content="IE=edge">
               <title>【蓝海】信息网</title>
               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
               <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/quicklink.css"/>
       		   <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/orbit.other.css"/>
       		    <script type="text/javascript" src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
       	       <script type="text/javascript" src="${htmlFolder}/js/login.js"></script>
               </head>
               
               <body>
              <!--topnav-->
                              <#include "/template/head.ftl"/>
                             <!--header end-->
                             <!--nav-->
                             <div class="nav fn-clear">
                                 <div class="navmain">
                                     <div class="navshop"><a href="###">海洋商城</a></div>
                                     <div class="navbar">
                                     <ul>
                                        <li><a href="${site.url}" >首页</a></li>
                                        <#include "/template/daohang.ftl"/> 
                                     </ul></div>
                                 </div>
                             </div>
                             <!--nav end-->
               <div class="blank_20"></div>
       <!--floor1-->
       <!--searchsite -->
    <div class="searchsite">
    <form class="search-form">
       <div class="searchsite-box">
           <div class="searchsite-main">
            <h4>站内搜索</h4><select class="select-searchsite" name="entity">
   	 <option value="cmsContent">新闻</option>
   	 <option value="cmsNovel">小说</option>
   	 <option value="cmsVideo">视频</option>
   	 <option value="cmsAudio">音乐</option>
   	 </select><select class="select-searchsite" name="days">
   	 <option value="">时间不限</option>
   	 <option value="7">一周</option>
   	 <option value="30">一个月</option>
   	 <option value="90">三个月</option></select>
   	 <input size="" name= "text" class="input-searchsite" type="text"/>
   	 <a href="javascript:void(0);" class="btn-searchsite">搜索</a>
          </div>
       </div>
       <div class="searchsite-tool">
         <div class="searchsite-sort">
         <label><input type="radio" name="sortField" value="" checked=""/><span>默认排序</span></label>
         <label><input type="radio" name="sortField" value="publishDate_desc"/><span>按时间最新</span></label>
         <label><input type="radio" name="sortField" value="publishDate_asc"/><span>按时间最早</span></label>
        
         </div>
       </div>
       <form>
    </div>
    <!--searchsite end-->
    
    <!--list-->
    <div class="newschannel-floor fn-clear">
      <div class="moretabs news-cont tline" >
                     <div class="newslist">
                         
                     </div>
                     <div class="page_wrap"></div>
                         
                     <div class=" blank_20"></div>
                
       </div>
       <!--点击排行-->
       <div class="leftlistwrap">
       <div class="hotlist">
                                        <h4><span>搜索热点排行</span></h4>
                                        <ul >
                                            <@contentVisitListDirective titleLeft=10 channelType=0  pageNum=1  days=7 pageSize=12>
                                                      <#list contentVisitList as cmsContent>
							<#if cmsContent_index &lt; 3>
                                                       <li><em class="top">${cmsContent_index+1}</em><a href="${cmsContent.url}">${cmsContent.title}</a></li>
						       </#if>
						       <#if cmsContent_index &gt; 2>
                                                       <li><em>${cmsContent_index+1}</em><a href="${cmsContent.url}">${cmsContent.title}</a></li>
						       </#if>
                                                      </#list>
                                            </@contentVisitListDirective>
                                        </ul>
                                   </div>
          
          </div>
          </div>
          <div class=" blank_20"></div>
    
		 <!--footer-->
                 <#include "/template/foot.ftl" />
                 <!--!footer end-->
               <!--[if lte IE 8]>
               <script src="${htmlFolder}/js/ieBetter.js"></script>
               <![endif]-->
               </body>
               <!--                       Javascripts 注意不要改变顺序                      -->
               <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
               <script type="text/javascript" src="${htmlFolder}/js/jquery-migrate-1.1.1.min.js"></script>
       	<!-- 焦点图 -->
       	<script type="text/javascript" src="${htmlFolder}/js/jquery.orbit.min.js"></script>
       	<script type="text/javascript">
       	$(window).load(function() {
       		$('#bookscroll').orbit({
       			bullets : true,
       			startClockOnMouseOut : true,
       			captionAnimation : 'slideOpen'
       		});
    		$(".btn-searchsite").on("click",function(){searchFun(1)});
       	});
   	 function searchFun (pageNum) {
   		var data = $(".searchsite .search-form").serialize()+"&pageNum="+pageNum;
   		var value = $(".searchsite-main .input-searchsite").val();
   		if(value==""){
   			$(".newslist").html('<div class="newslist-item"><p><em class="time">请输入搜索关键词</em></p></div>');
   			$(".page_wrap").html('');
   			return false;
   		}
   		var url = basePath+"/searchConfig/search";
   		$.ajax({  
   			url:url,
   			dataType:'json',  
   			data:data,
   			type:"post",
   			success:function(result) { 
   				var htmlstr='<div class="newslist-item"><p><em class="time">共找到'+result.total+'条相关信息</em></p></div>';
   				if(result.status==0){
   					$(".newslist").html(htmlstr);
   					$(".page_wrap").html('');
   					return ;
   				}
   				var list = result.list;
   				for(var i=0;i<list.length;i++){
   					var item = list[i];
   					 htmlstr+='<div class="newslist-item">'
   					  +'<h2><em class="list-descor">'+item.channel
   					  +'</em><a href="'+item.url+'">'+item.title+'</a></h2>'
   					  +item.actor
   					 +' <span>'+item.content+'</span>'
   					  +'<p><em class="interact"></em><em class="time">'+
   					  item.publishDate+'</em></p>'
   					+'</div>';
   			      }
   				
   				$(".newslist").html(htmlstr);
   				var page = getPages(result);
   				$(".page_wrap").html(page);
   			},  
   			timeout:10000  
   		 });
   	}
   	function getPages(result){
   		var pagechild = 6;//显示的页数（偶数）
   		var total = result.total;
   		var currentNum = result.pageNum;
   		var totalPage = result.totalPage;
   		var fristPage='';
   		var endPage='';
   		var prePage = '';
   		if(currentNum>1){
   			prePage ='<a href="javascript:searchFun('+(currentNum-1)+');" class="page_last">上一页</a>';
   		}
   		var nextPage = '';
   		if(currentNum<totalPage){
   			nextPage = '<a href="javascript:searchFun('+(currentNum+1)+');" class="page_next">下一页</a>';
   		}
   		var pages = '';
   		if(totalPage>1&&totalPage<=pagechild){
   			pages = '';
   			for(var i=1;i<=totalPage;i++){
   				if(i == currentNum){
   					pages+='<a href="#"class="page_current">'+i+'</a>';
   				}else{
   					pages+='<a href="javascript:searchFun('+i+');">'+i+'</a>';
   				}
   			}
   		}
   		if(totalPage>pagechild){
   			pages = '';
   			if(pagechild - currentNum<pagechild/2){
   				pages += '<a href="#" class="page_current">'+currentNum+'</a>';
   				
   				var en = currentNum+pagechild/2>totalPage?totalPage:currentNum+pagechild/2;
   				if(en<totalPage){endPage='<a href="javascript:searchFun('+totalPage+');">末页</a>';}
   				for(var i=currentNum+1;i<=en;i++){
   					pages += '<a href="javascript:searchFun('+i+');">'+i+'</a>';
   				}
   				var st = currentNum-1-pagechild/2>0?currentNum-1-pagechild/2:0;
   				st = (en -st)<pagechild?(en-pagechild<0?0:en-pagechild):st;
   				if(st>0){fristPage='<a href="javascript:searchFun(1);">首页</a>';}
   				for(var i=currentNum-1;i>st;i--){
   					pages = '<a href="javascript:searchFun('+i+');">'+i+'</a>'+pages;
   				}
   			}else{
   				endPage='<a href="javascript:searchFun('+totalPage+');">末页</a>';
   				for(var i=1;i<=pagechild;i++){
   					if(i == currentNum){
   						pages+='<a href="#"class="page_current">'+i+'</a>';
   					}else{
   						pages+='<a href="javascript:searchFun('+i+');">'+i+'</a>';
   					}	
   				}
   			}
   		}
   		var page = '<div class="page">'
   				+fristPage
   				+prePage
   				+pages
   				+nextPage
   				+endPage
   				+' </div>';
   		return page;
   	}
       </script>
      
   
       <!-- 右侧栏 
       <script type="text/javascript">
   	$(".quick_links_panel li").mouseenter(function(){
   		$(this).children(".mp_tooltip").animate({left:-92,queue:true});
   		$(this).children(".mp_tooltip").css("visibility","visible");
   		$(this).children(".ibar_login_box").css("display","block");
   	});
   	$(".quick_links_panel li").mouseleave(function(){
   		$(this).children(".mp_tooltip").css("visibility","hidden");
   		$(this).children(".mp_tooltip").animate({left:-121,queue:true});
   		$(this).children(".ibar_login_box").css("display","none");
   	});
   	$(".quick_toggle li").mouseover(function(){
   		$(this).children(".mp_qrcode").show();
   	});
   	$(".quick_toggle li").mouseleave(function(){
   		$(this).children(".mp_qrcode").hide();
   	});
   	</script>-->
   	</script>
       </html>
       
      
     
    
   
  
 
<!DOCTYPE html>
        <html>
        <head lang="en">
             <#include "/template/jh-meta.ftl">
            <title>金湖政府网</title>
          	<meta name="keywords" content="" />
            <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
            <script src="/html/jinhu-static/js/respond.min.js"></script>
            <![endif]-->
        </head>
        <body>
        
        <#include "/template/jh-head.ftl"/>
        <#include "/template/jh-index-daohang.ftl"/>
        <div class="container bg-white">
            <div class="jh-main jh-article">
               <div class="search">
            <form class="form-horizontal ggfw-form" action="./searchText" id = "searchForm">
                <div class="form-group">
		<div class="col-md-2 ">
                       
                    </div>
                    <div class="col-xs-8 col-md-5">
                        <input type="text" id="searchText" name="textValue" class="form-control ht3em" value="${result.textValue!}" placeholder="请输入搜索内容">
			<input type="hidden" value="1" name="pageNum" id = "pageNum">
			<input type="hidden" value="10" name="pageSize" id = "pageSize">
			
                    </div>
                    <div class="col-xs-4 col-md-2">
                        <button type="commit" class="btn btn-lg btn-block fontSize14" >搜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;索</button>
                    </div>
		 </div>
		    <div class="form-group" style="margin-top: -15px;margin-left: 10px;">
					<div class="col-md-2 ">
                       
                    </div>
                    <div class="col-xs-1 col-md-5">
							<label class="checkbox-inline">
                                <input name="searchField" type="checkbox" ${result.title?string('checked=checked','')} value="title"> 标题
                            </label>
                            <label class="checkbox-inline">
                                <input name="searchField" type="checkbox" ${result.content?string('checked=checked','')} value="content"> 内容
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="days" ${(30==result.days)?string('checked=checked','')} id="form-xb1" value="30"> 一月内
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="days" ${(182==result.days)?string('checked=checked','')} id="form-xb2" value="182"> 半年内
                            </label>
			    <label class="radio-inline">
                                <input type="radio" name="days" ${(365==result.days)?string('checked=checked','')} id="form-xb3" value="365"> 一年内
                            </label>
							<label class="radio-inline">
                                <input type="radio" name="days"  id="form-xb2" value="">不选择时间 
                            </label>
					</div>
					</div>
            </form>
        </div>
        <div class="ggfw-ztfw-list">
		<#list result.list as searchResult>
			<a href="${searchResult.url!}" target="_blank" class="borderBottom">
			<p class="fontSize18">${searchResult.title!}</p>
			<p>${searchResult.content!}<span class="color-green">【详细】</span></p>
			<p class="color-gray">${searchResult.publishDate?substring(0,10)}</p>
		    </a>
		</#list>
            
        </div>
        <div class="text-center new-page">
            <span class="new-page-pd"><span class="color-green">${result.pageNum}/${result.totalPage}</span>&nbsp;页</span>
            <span class="new-page-pd">共&nbsp;<span class="color-green">${result.total}</span>&nbsp;条记录</span>
            <button class="btn btn-link" onclick="gopage(1,15);">首页</button>
            <button class="btn btn-link" onclick="gopage(${result.perPage!},15);">上一页</button>
            <button class="btn btn-link" onclick="gopage(${result.nextPage!},15);">下一页</button>
            <button class="btn btn-link" onclick="gopage(${result.totalPage!},15);">尾页</button>
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
            });
		function gopage(pageNum,pageSize){
			window.location.href="./searchText?textValue=${result.textValue!}&pageSize="+pageSize+"&pageNum="+pageNum;
		}
        </script>
        </body>
</html>
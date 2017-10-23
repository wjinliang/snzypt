<!doctype html>
<html>
<#include "/template/my-head.ftl">

<body>
	<#include "/template/my-daohang.ftl">
 <!--主内容区-->
	<div class="main-content pdb20">
    	<div class="container">
        	<div class="my-main">
            	<div class="row">
                    	<div class="col-md-12" style="margin:0 auto">
                        	<div class="seachText newWidth mgt20" style="margin:20px auto 0 auto">
                                <form action="${application}/portal/search_1.html" method="get">
                                    <input type="text" id="search-keywords" class="search-keywords" name="keywords" value="${textValue!}" placeholder="查询内容名称新闻标题">
                                    <input type="submit" class="searchBtn" value="搜&nbsp;素">
                                    <div class="clear"></div>
                                </form>
                			</div>
                            <div class="panel-body">
			    <#list page.data as content>
                                <div class="item border-dash mgb20">
                                    <h4><a href="${content.url!}">${content.title!}</a></h4>
                                    <p>${content.brief!}</p>
                                </div>

				</#list>
                               
                            </div>
			    ${paginationlist!}
                        </div>	
                </div>
            </div>
        </div>
    </div>
    <#include "/template/my-footer.ftl">
</body>
</html>

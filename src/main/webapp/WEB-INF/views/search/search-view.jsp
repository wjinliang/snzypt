<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath =
            request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-">
    <!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">

    <!-- Fonts START -->
    |
    <!-- Fonts END -->
    <link href="<%=basePath%>/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
    .newslist-item{
            margin: 20px 0;
			border-bottom: 1px solid #dddddd;
			padding: 10px 0;
		}
		.newslist-item h2 a {
			font-size: 22px;
			font-weight: normal;
			}
			.newslist {
			margin: 6px 0 0 0;
			}
    </style>
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">
          

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12  margin-top-20 margin-bottom-20" align="center">

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<h1>
							全文<small>搜索引擎</small>
						</h1>
						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">
                    <div class="span6  margin-top-20 margin-bottom-20" align="center">
					<form id="searchForm"  class="form-inline" method="post">
						  <div class="form-group">
						    <input type="text" class="form-control" style="width: 800px;" name="textValue" placeholder="关键字">
						    <input type="hidden" name="pageNum" value="${pageNUm}"/>
						  <button type="submit" class="btn green btn-primary">搜索</button></div>
					</form>
					</div>
				</div>

					<!--end tabbable-->

		</div>
		
		<div class="newslist" align="center">
		    <c:forEach  items="${contents}" var="item"> 
		       <div class="newslist-item">
                         <h2><a href="${item.url}">${item.title}</a></h2>
                         <span>${item.contentText}</span>
               </div>
            </c:forEach>
		</div>
        <%-- <c:if test="${total gt 0}">
        <div class="pagesite" align="center"><div>
			共${total}条记录 ${pageNum}/${totalPage}页
			&nbsp;
			<a onclick="goToPage(1)">首页</a>
			<a onclick="goToPage(${pageNum-1})">上一页</a>
			<a onclick="goToPage(${pageNum+1})">下一页</a> 
			<a  onclick="goToPage(${totalPage})">尾页</a>
			</div></div>
		</c:if>	 --%>
				<!-- END PAGE CONTENT-->
<script>
   function goToPage(num)
   {
    if(num==0)
    {
      alert("已经第一页了！");
      return;
    }
    else if(num-1==${totalPage})
    {
      console.log(num);
      alert("最后一页了");
      return;
    }
       document.getElementsByName("pageNum")[0].value=num;
       document.getElementById("searchForm").submit();
      
   }
</script>
			
			

</body>
<!-- END BODY -->
</html>

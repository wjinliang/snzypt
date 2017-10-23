<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>没有权限</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<%@include file="pages/admin/include/style.jsp"%>
<link rel="stylesheet"
	href="${root}/themes/zTree/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
</head>
<!-- END HEAD -->
	<!-- BEGIN HEADER -->
	<%@include file="pages/admin/include/head.jsp"%>
	<!-- END HEADER -->
		<!-- BEGIN SIDEBAR -->
		<%@include file="pages/admin/include/sidebar.jsp"%>
		<!-- END SIDEBAR -->
		<!-- BEGIN PAGE -->
		<div class="page-content">
			<!-- BEGIN PAGE CONTAINER-->
			<div class="container-fluid">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="page-title">
							错误 <small>${msg }</small>
						</h3>
						<a href="javascript:history.go(-1);">返回</a>
					</div>
				</div>
			</div>
			<!-- END PAGE CONTAINER-->
		</div>
		<!-- END PAGE -->
	<!-- BEGIN FOOTER -->
	<%@include file="pages/admin/include/foot.jsp"%>
	<!-- END FOOTER -->
	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
	<%@include file="pages/admin/include/js.jsp"%>

	<!-- END JAVASCRIPTS -->
</html>

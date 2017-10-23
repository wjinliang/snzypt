<%@ page language="java" pageEncoding="UTF-8"%>
<style>


.logo {
	font-size: 20px;
	line-height: 70px;
	float: left;/* 
	color: #4DB3A4; */
	margin-left: -40px;
	margin-right: 50px;
}
</style>
<div class="page-header">
	<!-- BEGIN HEADER TOP -->
	<div class="page-header-top">
		<div class="container">
			<!-- BEGIN LOGO -->
			<%--  <div class="page-logo">
<a><img src="<%=basePath%>assets/admin/layout3/img/logo-big-white.png" alt="北京市涉农信息资源平台" style="height: 19px;margin-top:28px;"</a>
			</div> 
			 --%>
			<span class="logo"><b style="color:#4db3a4">基础平台管理系统</b><strong style="color:#EC1737;"></strong></span>
			<!-- END LOGO -->
			<!-- BEGIN RESPONSIVE MENU TOGGLER -->
			<a href="javascript:;" class="menu-toggler"></a>
			<!-- END RESPONSIVE MENU TOGGLER -->
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN INBOX DROPDOWN -->
					<li class="dropdown dropdown-extended  dropdown-inbox" id="header_inbox_bar" >
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<span class="circle">0</span>
						<span class="corner"></span>
						</a>
					</li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li id="user-info" class="dropdown dropdown-user">
						<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
						<img alt="" class="img-circle" src="<%=basePath%>assets/dmcms/img/user.png">
						<span class="username username-hide-mobile">用户名</span>
						</a>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
	</div>
	<!-- END HEADER TOP -->
	<!-- BEGIN HEADER MENU -->
	<div class="page-header-menu">
		<div class="container">
			<!-- BEGIN HEADER SEARCH BOX -->
			<!-- <form class="search-form" action="#" method="get">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Search" name="query">
					<span class="input-group-btn">
					<a href="javascript:;" class="btn submit"><i class="icon-magnifier"></i></a>
					</span>
				</div>
			</form> -->
			<!-- END HEADER SEARCH BOX -->
			<!-- BEGIN MEGA MENU -->
			<!-- DOC: Apply "hor-menu-light" class after the "hor-menu" class below to have a horizontal menu with white background -->
			<!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the dropdown opening on mouse hover -->
			<div class="hor-menu">
			</div>
			<!-- END MEGA MENU -->
			<%@include file="./toolbar.jsp"%>
		</div>
	</div>
	<!-- END HEADER MENU -->
</div>


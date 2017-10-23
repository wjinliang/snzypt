<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>后台管理 | 问卷管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>assets/global/plugins/select2/select2.css" />
<%@include file="../../includejsps/style.jsp"%>
<%@include file="../../includejsps/plugin-style.jsp"%>
<style type="text/css">
</style>
</head>
<body>
	<div class="page-container">
		<div class="page-content">
			<div class="container">
				<div class="row margin-top-10">
					<div class="col-md-12 col-sm-12">
						<!-- BEGIN PORTLET-->
						<div class="portlet light">
							<div class="portlet-title">
								<div class="caption caption-md">
									<i class="icon-bar-chart theme-font hide"></i> <span
										class="caption-subject theme-font bold uppercase">问卷选项统计列表</span>
									<span class="caption-helper"></span>
								</div>
							</div>
							<div class="portlet-body" id="org_person_grid">
								<div class="portlet-body">
									<div>
										<table style="width: 100%;border: 1px solid">
											<tbody>
												<tr align="center" valign="middle"
													style="color: White; background-color: Gray;">
													<td>序号</td>
													<td>答案文本</td>
												</tr>
												<c:forEach items="${list }" var="list" varStatus="i">
													<tr style="color: #333333; border:solid;border-color: #999999; font-size: 14px; height: 20px;">
														<td style="color: #000666; height: 18px; width: 146px;" align="center">${i.index+1 }</td>
														<td style="color: Black; height: 18px;">${list}</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<div align="center" style="margin-top: 20px"><input type="button" onclick="window.parent.close();" value="关闭窗口"></div>
									</div>
								</div>
								<!-- <div id="optionsChart" style="width:500px;height:300px;float:left;">
								</div> -->
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../includejsps/foot.jsp"%>
	<%@include file="../../includejsps/js.jsp"%>
	<%@include file="../../includejsps/plugin-js.jsp"%>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>assets/global/plugins/select2/select2.min.js"></script>

</body>
</html>
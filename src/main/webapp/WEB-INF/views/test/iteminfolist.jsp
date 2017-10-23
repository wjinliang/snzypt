<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目详情</title>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
</head>
<body>
	<!-- ,DanjiJbxx,SnqyJbxx,ScyzcJbxx,GyJbxx,HhjdJbxx,JyscJbxx,KjsfhJbxx,KjsfyqJbxx,,NainiuJbxx,
NfscJbxx,NyjstgzJbxx,ScyzcJbxx,SnqyJbxx,SyjyqyJbxx,TzqyJbxx,WlwsdjsJbxx,XqlzcJbxx -->
	<c:choose>
		<c:when test="${not empty  itemsMpJbxxinfolist}">
			<c:forEach items="${itemsMpJbxxinfolist }" var="item"
				varStatus="index">
				<c:out value="${index.index+1 }" />.${item.mpMc }<br>
         		 负责人：${item.mpMc }<br>
				联系电话：${item.lxDh }<br>
				占地面积：${item.zdMj }<br>
				苗木总数：${item.zpmmZsl }
				<hr>
			</c:forEach>
		</c:when>
		<c:when test="${not empty  itemsCsJbxxinfolist}">
			<c:forEach items="${itemsCsJbxxinfolist }" var="item"
				varStatus="index">
				<c:out value="${index.index+1 }" />.${item.dzCqdw }<br> 
         		企业类型：${item.qyLx }<br>
				 联系电话：${item.lxDh }<br>
				注册资本：${item.zcZb }<br>
				经营行业：${item.jyHy }<br>
				营业面积：${item.yyMj }<br>
				法人：${item.csFr }<br>
				注册号：${item.csZch }<br>
				注册全号：${item.csZcqh }<br>
				企业标识码：${item.qyBsm }<br>
				档案号：${item.qyDah }<br>
				筹建证号：${item.cjZh }<br>
				副本号：${item.yeFbs }<br>
				定位标志：${item.dwBz }<br>
				迁出方：${item.csQcf }<br>
				经营范围：${item.jyFw }<br>
				经营场所：${item.jyCs }<br>
	         	成立日期：${item.clRq }<br>
				核准日期：${item.hzRq }<br>
				营业起始日期：${item.yeQssj }<br>
				营业截止日期：${item.yeZzsj }<br>
				变更次数：${item.bgCs }<br>
				备注说明：${item.bzSm }<br>
				从业人数：${item.cyRs }<br>
				外地人数：${item.wdRs }<br>
				下岗人数：${item.xgRs }<br>
				隶属单位：${item.lsDw }<br>
				申请人：${item.qySqr }<br>
				审批机关：${item.spJg }<br>
				审批日期：${item.spRq }<br>
				邮编：${item.qyYb }<br>
				地址：${item.csDz }<br>
				地址产权单位：${item.dzCqdw }<br>
				地址使用期限(年)：${item.dzSyqx }<br> 
				<hr>
			</c:forEach>
		</c:when>
		<c:when test="${not empty  itemsGyJbxxinfolist}">
			<c:forEach items="${itemsGyJbxxinfolist }" var="item"
				varStatus="index">
				<c:out value="${index.index+1 }" />.${item.mc }<br> 
         		占地面积(亩)：${item.zdMj }<br>
				负责人：${item.fzr }<br>
				地址：${item.xxDz }<br>
				果品种类：${item.gpZl }<br>
				认证情况：${item.rzQk }<br>
				是否标准化基地：${item.sfBzhjd }<br>
				是否标准化基地：${item.sfGgczy }<br>
				建设年度：${item.jsNd }<br>
				对象简介：${item.dxJj }<br>
				<hr>
			</c:forEach>
		</c:when>
		<c:otherwise>
  			无查询结果
		</c:otherwise>
	</c:choose>
</body>
</html>
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
<c:choose> 
<c:when test="${not empty  villagelist}">
		<c:forEach items="${villagelist }" var="village" varStatus="index">
		<label><input type="radio" id="selectcode" name="villageCode" value="${village.code }"/>
			<c:out value="${index.index+1 }" />.${village.mc }</label><br>
         		 锁在区县：${village.szQx }<br>
				所在乡镇：${village.szXz }<br>
				所在行政村：${village.szXzC }<br>
				全名：${village.fullname }
				<hr>
		</c:forEach>
		<button title="确认" onclick="confirmSelect()">确认</button>
</c:when>
<c:otherwise>
  无查询结果
</c:otherwise>
</c:choose>
<br><button onclick="window.close()">关闭</button>
<script type="text/javascript">
/**
 * 确认选择
 */
function confirmSelect(){
	var villageCode = $("input[name='villageCode']:checked");
	if(villageCode==null || villageCode.length==0){
		alert("请选择要查看的村庄");
		return false;
	}
	window.opener.selectSearch(villageCode.val());
	window.close();
}
	
</script>
</body>
</html>
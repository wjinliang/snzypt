<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
 <c:if test="${not empty  villagelist}">
    	<!-- <div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        	<h4>行政村列表</h4>
        </div> -->
        <div class="modal-body">
        
            <c:forEach items="${villagelist }" var="village" varStatus="index">
            
        	<div class="part1" style="padding-top:0px;">
            	<label  class="alterInput">
                	<a href="javascript:confirmSelect('${village.code }','${village.mc }');">
                    <span>${index.index+1 }.${village.mc }</span></a>
                </label>
                <ul class="detail-list">
                	<li>
                    	<span>所在县：</span>
                        <span id="detail_address">${village.szQx }</span>
                    </li>
                    <li>
                    	<span>所在乡镇：</span>
                        <span id="principal">${village.szXz }</span>
                    </li>
                    <li>
                    	<span>所在行政村：</span>
                        <span id="detail_address">${village.szXzC }</span>
                    </li>
                    <li>
                    	<span>全名：</span>
                        <span id="detail_address">${village.fullname }</span>
                    </li>
                </ul>
            </div>
           </c:forEach>
        </div>
        </c:if>
       <c:if test="${empty  villagelist}">
       <div class="modal-header">
    		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        	<h4> 无查询到结果</h4>
        </div>
        
       </c:if>  
    <script type="text/javascript">
/**
 * 确认选择
 */
function confirmSelect(svillageCode,name){
	
	init(svillageCode,name);
	$('#myModal11').modal('hide');
}

</script>
</body>
</html>
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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎来到北京涉农平台</title>
<script type="text/javascript" src="/html/sn-static/static/js/jquery-1.12.1.min.js"></script>
<style type="text/css">
*{
	padding:0px;
	margin:0px;
	}
body{font-family:"微软雅黑";}
.modal-header{
	min-height:16px;
	padding:15px;
	border-bottom:1px solid #e5e5e5;
	}
.modal-header h4{color:#3399cc;}
.modal-body{padding:15px;}
.part1 .alterInput{display:inline-block; color:#ff6600; font-size:16px; margin-bottom:10px; cursor:pointer;}
.detail-list li{padding:2px; font-size:14px; list-style:none;}
.detail-list li span:nth-child(2){color:#999;}
.part1{padding:10px; border-bottom:2px solid #e5e5e5;}
.btn{
	cursor:pointer;
	display:inline-block;
	padding:8px 20px;
	border:none;
	color:#fff;
	border-radius:2px;
	font-size:14px;
	margin-right:10px;
	}
.blue{background:#1c8fe5;}
.gray{background:#ccc;}
</style>
</head>
<body>
 <div class="modal">
 <c:if test="${not empty  villagelist}">
    	<div class="modal-header">
        	<h4>行政村列表</h4>
        </div>
        <div class="modal-body">
        
            <c:forEach items="${villagelist }" var="village" varStatus="index">
            
        	<div class="part1" style="padding-top:0px;">
            	<label  class="alterInput">
                	<input type="radio" id="selectcode" name="villageCode"  value="${village.code }">
                    <span>${index.index+1 }.${village.mc }</span>
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
            <div class="modal-body" style="text-align:center">
            	<button class="btn blue" onclick="confirmSelect()">确定</button>
                <button class="btn gray" onclick="window.close()">关闭</button>
            </div>
        </div>
        </c:if>
       <c:if test="${empty  villagelist}">
         无查询到结果
       </c:if>  
    </div>
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
	window.opener.villageCode=villageCode.val();
	window.close();
}
</script>
</body>
</html>
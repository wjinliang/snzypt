
<html>
<head>
<#include "/template/sn_head.ftl">
<style type="text/css">
* {
	padding: 0px;
	margin: 0px;
}

ul li {
	list-style: none;
}

body {
	font-family: "微软雅黑";
}

.modal-header {
	min-height: 16px;
	padding: 15px;
	border-bottom: 1px solid #e5e5e5;
}

.modal-header h4 {
	color: #3399cc;
}

.modal-body {
	padding: 15px;
}

.part1 h4 {
	color: #ff6600;
	font-size: 16px;
	margin-bottom: 10px;
}

.model .part1 table td {
	border: 1px solid #B3B3B3;
	padding: 5px;
}

.model .part1 table td:nth-child(2) {
	color: #999;
}

.part1 {
	padding: 10px;
}
</style>
</head>
<body>
<#include "/template/sn_header.ftl">
<div class="wrapper">
    	<div class="container">
        	<div class="row">
            	<div class="interact-item">
                	<div class="position-info">
                        <span>当前位置：</span>
                        <a href="${site.url!}">首页</a>
                            &nbsp;&gt;&nbsp;
                        <a href="javascript:void(0);"> 农业观光园、民俗旅游、种业和设施农业</a>
                     </div>
                     <div class="base-info mgt15 mgb15">
                     	<div class="panel-body">
	
	<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-spacing: 0; border-collapse: collapse;">
    <tr>
    <td width="150"><span>项目</span></td>
     <td width="150"><span>单位<span></td>
	<td width="150"><span>2010</span></d>
	<td width="150"><span>2011</span></td>
	<td width="150"><span>2012</span></td>
	<td width="150"><span>2013</span></td>
	<td width="150"><span>2014</span></td>								
	</tr>
		<#list tjnymszyssList as tjnymszyss>
		  <tr>
		     <td width="150"><span>${tjnymszyss.xm!}</span></td>
		      <td width="150"><span>${tjnymszyss.dw!}</span></td>
		      <#if tjnymszyss.dw=='(个)'||tjnymszyss.dw=='(人)'||tjnymszyss.dw=='(户)'>
		      <#setting number_format="#.##"> 
	         <td width="150"><span>${tjnymszyss.ELYL?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYY?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYE?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYSAN?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYISI?number}</span></td>	
			<#elseif tjnymszyss.dw=='(公顷)'||tjnymszyss.dw=='(万人次)'||tjnymszyss.dw=='(亿元)'>
		      <#setting number_format="#.00"> 
	         <td width="150"><span>${tjnymszyss.ELYL?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYY?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYE?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYSAN?number}</span></td>
			<td width="150"><span>${tjnymszyss.ELYISI?number}</span></td>	
			 <#else>
	         <td width="150"><span>${tjnymszyss.ELYL!}</span></td>
			<td width="150"><span>${tjnymszyss.ELYY!}</span></td>
			<td width="150"><span>${tjnymszyss.ELYE!}</span></td>
			<td width="150"><span>${tjnymszyss.ELYSAN!}</span></td>
			<td width="150"><span>${tjnymszyss.ELYISI!}</span></td>	
			</#if>
		</tr>						
	  </#list>
		</table>
		</div>
		</div>
		</div>
		</div>
		</div>
<#include "/template/sn_footer.ftl">
</body>
</html>
<!doctype html>
<html>
<head>
<#include "/template/sn_head.ftl">
</head>
<body>
	<#include "/template/sn_header.ftl">
	 <#assign baseStoreArr = ["bCIbFy4Y","8n5CbiZT","a1RtGRtM","znFoIvFr","gtTEogrR","ubQfMxwl","SB7TABfi","tlEgf4kl","c2Ci5cj0","QuHM4Myr","2jA5V8Qh","hznuuul3","oadjmLpy","V5xYUnWp"] >
	 <#assign baseStoreZHArr = ['基础地理信息',
'涉农人员信息',
'涉农机构信息',
'农产品信息',
'政务资讯信息',
'标准规范信息',
'行政办公信息',
'农业生产信息',
'市场行情信息',
'质量安全信息',
'监测预警信息',
'农村经济信息',
'农村科技信息',
'休闲农业信息'] >
    <div class="wrapper" style="background:#f5f5f5;">
    	<div class="container">
        	<div class="row">
            	<div class="data_zh">
                	<h1>涉农数据整合情况</h1>
		
		<@dictItemListDirective  code="C07">
								
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="30%"><div class="data_state"><span class="zh_num">${items?size}</span>大数据来源</div></td>
                            <td width="70%"></td>
                        </tr>
						<#list items as item>
                              <tr><td align="right"><span>[${item.itemDesc!}]</span></td><td>涉农信息资源平台接入<span class="sys">${item.itemName!}</span></td></tr>
						</#list>
                        <!--<tr><td align="right"><span>[2016年10月]</span></td><td>涉农平台接入<span class="sys">北京市211系统</span>数据</td></tr>
                        <tr><td align="right"><span>[2016年10月]</span></td><td>涉农平台接入<span class="sys">北京市211系统</span>数据</td></tr>
                        <tr><td align="right"><span>[2016年10月]</span></td><td>涉农平台接入<span class="sys">北京市211系统</span>数据</td></tr>-->
                    </table>
							
		</@dictItemListDirective>
		<@channelListDirective channelId=2 >
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="30%"><div class="data_state"><span class="zh_num">${channels?size}</span>大数据专题</div></td>
                            <td width="70%"></td>
                        </tr>
			<#list channels as chan>
				<tr><td align="right"><span>${chan.displayName!}</span></td><td>${chan.desc!}</td></tr>
				
			</#list>
                    </table>
		</@channelListDirective>
					
										
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="30%"><div class="data_state"><span class="zh_num">${baseStoreArr?size}</span>大数据目录</div></td>
                            <td width="70%"></td>
                        </tr>	
			<#list baseStoreArr as bs>
						
                        <tr><td align="right"><span>[${baseStoreZHArr[bs_index]}]</span></td>
			<td>该资源库包括<span class="sys"><@directoryNumberDirective pId=bs type="1">${directoryNumber+1}</span></@directoryNumberDirective>个数据目录 &nbsp;合计
			<span class="sys"><@dataResourceRecordDirective id=bs>${record.dataCount!}</@dataResourceRecordDirective></span>条数据</td></tr>
                        </#list>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!--footer开始-->
   <#include "/template/sn_footer.ftl">
    <!--footer结束-->
</body>
</html>
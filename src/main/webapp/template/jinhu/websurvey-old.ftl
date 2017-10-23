<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
           <html>
           <head lang="en">
           <#include "/template/jh-meta.ftl">
           <title>金湖政府网</title>
           <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
           <!--<link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">-->
           <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
          <!--[if lt IE 9]>
                                                             <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
                                                             <script src="/html/jinhu-static/js/respond.min.js"></script>
                                                             <![endif]-->
    
           
           <style>
           table tr {
           	height: 40px;
           }
             .small_bg{background:url(/html/jinhu-static/img/small_bg.jpg) no-repeat;}
.beijing{background:url(/html/jinhu-static/img/bg_img.jpg) no-repeat;}
             
           </style>
           
           <meta name="generator" content="mshtml 11.00.9600.18321">
           </head>
           
           <body>
           	<#include "/template/jh-head.ftl">
           <#include "/template/jh-index-daohang.ftl">
           	<div class="container bg-white">
           		<div class="jh-main">
           			<div>
           				<div class="index-toff border-gray1">
           					<a class="index-ton color-green col-md-3 fontsize30"
           						href="#">政民互动</a>
           					<#if code??>
                                     <#if code=="1">
                                     <a href="/topiecms/portal/websurvey/form.htm?code=1" class="index-ton fontSize30">县长信箱</a>
                                     
                                      <#elseif code=="2">
                                     <a href="/topiecms/portal/websurvey/form.htm?code=2" class="index-ton fontSize30">书记信箱</a>
                                     
                                     <#elseif code =="3">
                                     <a href="/topiecms/portal/websurvey/form.htm?code=3" class="index-ton fontSize30">镇或部门信箱</a>
                                     <#else>
                                     <a href="/topiecms/portal/websurvey/form.htm?code=3" class="index-ton fontSize30">留言</a>
                                     </#if>
                                  </#if>
           				</div>
           				<div class="row">
           					<div class="col-md-3">
           						<div class="panel panel-default panel1">
           							<div class="panel-heading panel1-t">
           								<a class="panel1-ton fontsize18"
           									href="javascript:void(0);">信件查询</a>
           							</div>
           							<div class="panel-body small_bg">
           								<div class="row index-jbzw text-center fontsize14">
           									<form action="../websurvey/findOne" method="post">
           										<div style="margin-bottom: 10px;">
           											<span class="on">编号:</span><input name="id" type="text">
           										</div>
           										<div style="margin-bottom: 10px;">
           											<span class="on">密码:</span><input name="phone" type="text">
           										</div>
           										<div>
           											<input type="submit" value="查询">
           										</div>
           									</form>
           								</div>
           							</div>
           						</div>
           					</div>
           					<!--左边栏 模块结束-->
           
           					<div class="col-md-9 beijing">
           						<form name="letterform" onsubmit="return submitcheck(this)"
           							action="./add" method="post">
           							<div>
           								<input name="org.apache.struts.taglib.html.token" type="hidden"
           									value="1d14616d7163b7e9c56edc7e996394e3">
           							</div>
           							<!--主体内容栏 模块开始-->
           
           							<div class="sub1_mid1_4_1">
           								<div class="sub1_mid1_4_2">
           									<div class="path">
           										<!--您的当前位置：<a href="#">首页</a>&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;<a href="#">政民互动
                            </a>&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;<a href="#">民意征集</a>-->
           									</div>
           									<!--列表 模块开始-->
           
           									<div class="list2_2">
           										<div class="ul10">
           											<div class="space2"></div>
           											<div style="clear: both;">
           												<table width="100%" border="0" cellspacing="8"
           													cellpadding="0">
           													<input name="tmp" style="width: 99%;" type="hidden"
           														value="县领导信箱">
           
           													<tbody>
           														<tr>
           															<td width="49%">
           																<table width="100%" border="0" cellspacing="8"
           																	cellpadding="0">
           																	<tbody>
           																		<tr>
           																			<td width="27%">姓&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
           																			<td><input name="username" type="text">
           																				<span class="link4"> *</span></td>
           																		</tr>
           																		<tr>
           																			<td nowrap="" width="27%">联系电话：</td>
           																			<td><input name="phone" style="width: 92%;"
           																				type="text"> <span class="link4">*</span></td>
           																		</tr>
           																		<tr>
           																			<td width="27%">联系地址：</td>
           																			<td><input name="address" style="width: 92%;"
           																				type="text"></td>
           																		</tr>
           																	</tbody>
           																</table>
           															</td>
           															<td width="49%">
           																<table width="100%" border="0" cellspacing="8"
           																	cellpadding="0">
           																	<tbody>
           																		<tr>
           																			<td>性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
           																			<td><input name="sex" type="radio" checked=""
           																				value="m">男 &nbsp;&nbsp;<input name="sex"
           																				type="radio" value="w">女
           																				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄：<input
           																				name="age" style="width: 25%;" type="text">
           																				<span class="link4"> *</span></td>
           																		</tr>
           																		<tr>
           																			<td nowrap="">电子邮件：</td>
           																			<td><input name="email" style="width: 95%;"
           																				type="text"></td>
           																		</tr>
           																		<tr>
           																			<td nowrap="">邮政编码：</td>
           																			<td><input name="postcode" style="width: 95%;"
           																				type="text"></td>
           																		</tr>
           																	</tbody>
           																</table>
           															</td>
           														</tr>
           													</tbody>
           												</table>
           											</div>
           											<div id="democ1">
           												<table width="100%" align="center" border="0"
           													cellspacing="8" cellpadding="0">
           													<tbody>
           													<#if code??> <#if code=="1">
           														<input type="hidden" name="codeId" value="${leader.id!}" />
           														<#elseif code=="2">
           														<input type="hidden" name="codeId" value="${leader.id!}" />
           														<#elseif code=="3">
           														<tr>
           															<td width="13.48%">选择部门：</td>
           															<td><select name="codeId">
           																	<option>请选择...</option> <#list orgs as org>
           																	<option value="${org.id}">${org.name}</option> </#list>
           															</select><span class="link4"> *</span></td>
           														</tr>
           														<#else>
           														<input name="type" value="5" type="hidden"> </#if>
           														</#if> <#if code!="4">
           														<tr>
           															<td width="13.48%">意见类型：</td>
           															<td><input name="type" value="1" checked=""
           																type="radio">咨询 &nbsp;&nbsp;<input name="type"
           																value="2" type="radio">投诉 &nbsp;&nbsp;<input
           																name="type" value="3" type="radio">建议
           																&nbsp;&nbsp;<input name="type" value="4" type="radio">举报
           																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
           																name="isopen" value="N" type="hidden"></td>
           														</tr>
           														</#if>
           														<tr>
           															<td width="13.48%">主 题：</td>
           															<td><input name="title" style="width: 99%;"
           																type="text"></td>
           														</tr>
           														<tr>
           															<td valign="top" width="13.48%">内 容：</td>
           															<td><textarea name="content" style="width: 99%;"
           																	rows="6"></textarea>(即1000字)</td>
           														</tr>
           														<tr>
           															<td align="center" nowrap="" colspan="2"><input
           																name="button" class="button1" id="button" type="submit"
           																value="提交">&nbsp;&nbsp;&nbsp;&nbsp;<input
           																name="button" class="button1" id="button" type="reset"
           																value="重填"></td>
           														</tr>
           													</tbody>
           												</table>
           											</div>
           											<div class="titlebg13">说明事项</div>
           											<div class="text_p1 padding10_1" id="democ4">
           												1、首先感谢您对金湖的建设和发展提出宝贵意见和建议，欢迎您今后继续 对我们的工作提出建议。<br>2、请您务必遵守中国相关法律和法规，不得填写具有骚扰、中伤、辱骂、恐吓、诽谤、伤害、色情、反动、迷信、危害国家安全等色彩的非
           
           												法信息。<br>3、方框后加“*”号的为必填项，提交信件时不能为空白。<br>4、您在投诉、举报时，请务必留下真实而具体的姓名、联系方式，并详细提供有关情况，以便于有关部门进行核实处理，我们会为您的个人
           
           												资料严格保密。<br>5、请您牢记信件提交后网站反馈给您的“信件编号”和“信件密码”，以便于查询信件办理进展情况和结果。<br>6、如果您不清楚部门的机构职能，请点击网站首页左侧的“机构职能”进行查询。<br>7、请您不要一信多投，也不要重复投信。<br>
           											</div>
           										</div>
           									</div>
           									<div class="list2_3"></div>
           								</div>
           								<!--列表 模块结束-->
           							</div>
           						</form>
           					</div>
           				</div>
           			</div>
           		</div>
           		<!--相关链接-->
           
           		 <#include "/template/jh-links.ftl">
           </div>
            <#include "/template/jh-footer.ftl">
            <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
                                                         
              <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
                                                          
              <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
                                                         
              <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
                                                         
              <script type="text/javascript" src="/html/jinhu-static/js/visit-record.js"></script>  
           	<!--<script type="text/javascript" src="/html/jinhu-static-xxwq/js/jquery.placeholder.min.js"></script>
           
           	<script src="/html/jinhu-static-xxwq/js/bootstrap.min.js" type="text/javascript"></script>-->
           
           	<script type="text/javascript">
           		$(function() {
           			$('input, textarea').placeholder();
           			$('.ggfw-cycx1').height($('.ggfw-cycx2').height() - 1);
           			$(window).resize(function() {
           				$('.ggfw-cycx1').height($('.ggfw-cycx2').height() - 1);
           			});
           		});
           	</script>
           
           
           </body>
           </html>
           
          
         
        
       
      
     
    
   
  
 
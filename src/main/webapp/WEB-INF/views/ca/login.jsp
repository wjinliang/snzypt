<%@page contentType="text/html; charset=GBK"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String ranStr = (String) session.getAttribute("Random");
	out.print(ranStr);
%>
<html>

	<head>
		<title>BJCA证书应用演示环境</title>
		<style type="text/css">
		<!--
		body {
			margin-left: 0px;
			margin-top: 0px;
			margin-right: 0px;
			margin-bottom: 0px;
			font-family: Arial, Helvetica, sans-serif;
			font-size: 14px;
		}
		-->
		</style>
		<link href="style.css" rel="stylesheet" type="text/css" />

		<SCRIPT language=JavaScript src="SecX_Common.js"></SCRIPT>
	</head>
	<body>
		<%@include file="top.jsp"%>
		<table width="957" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td bgcolor="#FEFDFB">
					<table width="70%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="30" colspan="3">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="50" align="right">
								<img src="images/cc.gif" width="43" height="62" />
							</td>
							<td width="20">
								&nbsp;
							</td>
							<td>
								<%@include file="properties.jsp"%>
								<%
									//获得登陆用户cert
									String clientCert = request.getParameter("UserCert");
									String UserSignedData = request.getParameter("UserSignedData");
									String ContainerName = request.getParameter("ContainerName");
									String certPub = sed.getCertInfo(clientCert, 8);

									//验证客户端证书
									try {

										int retValue = sed.validateCert(clientCert);

										if (retValue == 1) {

											session.setAttribute("ContainerName", ContainerName);

											String uniqueIdStr = "";
											try {
												uniqueIdStr = sed.getCertInfo(clientCert, 17);
											} catch (Exception e) {
												out.println("<p><h3>客户端证书验证失败:" + e.getMessage()
														+ "</h3><p>");
											}
											session.setAttribute("UniqueID", uniqueIdStr);

											String uniqueId = "";
											try {
												//获得登陆用户ID
												uniqueId = sed.getCertInfoByOid(clientCert,
														"2.16.840.1.113732.2");
											} catch (Exception e) {
												out.println("<p><h3>客户端证书验证失败:" + e.getMessage()
														+ "</h3><p>");
											}

											out.println("<h3>欢迎您使用本系统!</h3>");
											out.println("<h3>主题通用名：");
											out.println(uniqueIdStr);
											out.println("<br/>证书颁发者(颁发者通用名): ");
											out.println(certPub);
											out.println("<br/>证书唯一标识(备用主题通用名)：");
											out.println(uniqueId);
											out.println("<font color='red'>(实际集成时,会将唯一标识与数据库比对,判断是否为合法用户)</font>");
											out.println("</h3><br/>");
										} else {
											out.println("<h3>客户端证书验证失败！</h3><br/>");
											out.println("<h3><font color='red'>");

											if (retValue == -1) {
												out.println("登录证书的根不被信任");
											} else if (retValue == -2) {
												out.println("登录证书超过有效期");
											} else if (retValue == -3) {
												out.println("登录证书为作废证书");
											} else if (retValue == -4) {
												out.println("登录证书被临时冻结");
											}
											out.println("</font></h3>");
											return;
										}
									} catch (Exception ex) {
										out.println("<p><h3>客户端证书验证失败:" + ex.getMessage() + "</h3><p>");
										return;
									}

									//验证客户端签名
									try {
										if (sed.verifySignedData(clientCert, ranStr, UserSignedData)) {
										
										} else {
											out.println("<h3>验证客户端签名错误！</h3>");
											return;
										}
									} catch (Exception e) {
										out.println("<p><h3>验证客户端签名错误:" + e.getMessage() + "</h3><p>");
										return;
									}
								%>
							</td>
						</tr>
						<tr>
							<td height="30" colspan="3"></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td bgcolor="#FEFDFB">
					<table width="70%" border="0" align="center" cellpadding="1"
						cellspacing="1" class="table1">
						<tr>
							<td background="images/bjb.gif">
								数据本地处理演示
							</td>
							<td background="images/bjb.gif">
								表单提交处理演示
							</td>
						</tr>
						<tr>
							<td>
								<a href="sign.jsp">数据签名</a>
							</td>
							<td>
								<a href="EncryptForm.jsp">表单加密</a>
							</td>

						</tr>
						<tr>
							<td>
								<a href="encrypt.jsp">数据加密</a>
							</td>
							<td>
								<a href="signForm.jsp">表单签名</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="signXML.jsp">XML签名</a>
							</td>
							<td>
								<a href="EncryptSignForm.jsp">表单签名加密</a>
							</td>
						</tr>
						<tr>

							<td>
								<a href="signByP7.jsp">Pkcs7签名</a>
							</td>
							<td>
								<a href="signXMLForm.jsp">XML表单签名</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="P7Enveloped.jsp">pkcs7数字信封</a>
							</td>
							<td>
								<a href="timeStampRequest.jsp">时间戳</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="signfile.jsp">文件签名</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>

						<tr>
							<td background="images/bjb.gif">
								其他功能
							</td>
							<td background="images/bjb.gif">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<a href="viewCert.jsp">解析证书信息</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<a href="modifypwd.jsp">修改证书密码</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>

					</table>
				</td>
			</tr>
			<tr>
				<td colspan="4" height="50"></td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>

</html>


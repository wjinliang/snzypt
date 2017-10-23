<%@page contentType="text/html; charset=GBK"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
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
		<link href="<%=basePath%>/assets/bjca/style.css" rel="stylesheet" type="text/css" />
		<SCRIPT language=JavaScript src="<%=basePath%>/assets/bjca/date.js"></SCRIPT>
		<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
			
			var strServerSignedData = "${strSignedData}";
			var strServerRan = "${strRandom}";
			var strServerCert = "${strServerCert}";
			function LoginForm_onsubmit() {
				var ret;
				var strContainerName = LoginForm.UserList.value;
				var strPin = LoginForm.UserPwd.value;
				
				if(strPin.length<4||strPin.length>16){
					alert("密码长度应该在4-16位之间");
					return false;
				}
				ret = Login(LoginForm,strContainerName,strPin);
				LoginForm.UserPwd.value = "";
				return ret;
			}
			
		</SCRIPT>
		<script Language="javascript" for="window" event="OnLoad">

			function GetList(strListID) {
				var strTemp;
				var strOption;
				var len;
				var strName;
				var strUniqueID;
				var objListID = eval(strListID);
				 
				strTemp = GetUserList();         
	            g_xmluserlist = "";
				while (1) 
				{
					i=strTemp.indexOf("&&&");
					if (i <= 0) {
						break;
					}
					strOption = strTemp.substring(0,i);
					strName = strOption.substring(0, strOption.indexOf("||"));
					strUniqueID = strOption.substring(strOption.indexOf("||") + 2, strOption.length);
					var objItem = new Option(strName,strUniqueID)
					objListID.add(objItem);
					g_xmluserlist = g_xmluserlist +strName +"||";
					g_xmluserlist = g_xmluserlist +strUniqueID +"&&&";
							
					len = strTemp.length;
				    strTemp = strTemp.substring(i+3,len);
				}
				var objListID = null;
			}
	
			GetList("LoginForm.UserList");
		</script>
	</head>

	<body>

		<table width="957" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="60">
					<img src="<%=basePath%>/assets/bjca/images/logo.gif" width="245" height="38" />
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>

					<table width="957" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="64"><img src="<%=basePath%>/assets/bjca/images/z1.gif" width="64" height="221" /></td>
							<td width="304"><img src="<%=basePath%>/assets/bjca/images/z2.gif" width="304" height="221" /></td>
							<td width="338"><img src="<%=basePath%>/assets/bjca/images/z3.gif" width="338" height="221" /></td>
							<td><img src="<%=basePath%>/assets/bjca/images/z4.gif" width="251" height="221" /></td>
						</tr>
						<tr>
							<td valign="top"><img src="<%=basePath%>/assets/bjca/images/m1.gif" width="64" height="151" /></td>
							<td valign="top"><img src="<%=basePath%>/assets/bjca/images/m2.gif" width="304" height="151" /></td>
							<td valign="top" height="151">
								<form method="post" ID="LoginForm" action="login.jsp"
									onsubmit="return LoginForm_onsubmit()">

									<table id="bs" width="90%" border="0" align="center"
										cellpadding="0" cellspacing="0">
										<tr>
											<td height="25" colspan="2"></td>
										</tr>
										<tr>
											<td width="60" class="font1">
												选择证书
											</td>

											<td>
												<select id="UserList" name="userName" style="width:141px;">
												</select>
											</td>

										</tr>
										<tr>
											<td>&nbsp;
												
											</td>
											<td>&nbsp;
												
											</td>
										</tr>
										<tr>
											<td class="font1">
												选择口令
											</td>
											<td>
												<input type="password" name="pwd1" id="UserPwd" size="16" maxlength="16">
											</td>
										</tr>
										<tr>
											<td>&nbsp;
												
											</td>
											<td>&nbsp;
												
											</td>
										</tr>
										<tr>
											<td>&nbsp;
												
											</td>
											<td>
												<input type="submit"
													style="border: none; background: url(/assets/bjca/images/submit.gif) left top no-repeat; width: 58px; height: 33px;"
													value="" name="B1">
												<a href="logout.jsp"><img src="<%=basePath%>/assets/bjca/images/repe.gif"
														width="88" height="30" border="0" />
												</a>

											</td>
										</tr>
										
									</table>
									<input type="hidden" ID="UserSignedData" name="UserSignedData">
									<input type="hidden" ID="UserCert" name="UserCert">
									<input type="hidden" ID="ContainerName" name="ContainerName">
								</form>
							</td>
							<td valign="top"><img src="<%=basePath%>/assets/bjca/images/m4.gif" width="251" height="151" /></td>
						</tr>
						<tr>
							<td><img src="<%=basePath%>/assets/bjca/images/b1.gif" width="64" height="20" /></td>
							<td><img src="<%=basePath%>/assets/bjca/images/b2.gif" width="304" height="20" /></td>
							<td><img src="<%=basePath%>/assets/bjca/images/b3.gif" width="338" height="20" /></td>
							<td><img src="<%=basePath%>/assets/bjca/images/b4.gif" width="251" height="20" /></td>
						</tr>
						<tr>
							<td colspan="4" height="110"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>
</html>
<SCRIPT language=JavaScript src="<%=basePath%>/assets/bjca/SecX_Common.js"></SCRIPT>

<SCRIPT FOR=bjcactrl EVENT=OnUsbkeyChange LANGUAGE=javascript>
	function GetList_pnp(strListID) 
   	{	 
	   	var i;
	   	var strOption;
	   	var strName;
	   	var strUniqueID;
	   	var objListID = eval(strListID);
	   	var n = objListID.length;
	
	   	for(i=0;i<n;i++)
		objListID.remove(0);
	 
	   	var strTemp = bjcactrl.GetUserListPnp();
	   	while (1) 
	  	{
		  	i=strTemp.indexOf("&&&");
		  	if (i <= 0) 
		 	{
				break;
		 	}
			strOption = strTemp.substring(0,i);
			strName = strOption.substring(0, strOption.indexOf("||"));
			strUniqueID = strOption.substring(strOption.indexOf("||") + 2, strOption.length);
			var objItem = new Option(strName,strUniqueID)
			objListID.add(objItem);
			len = strTemp.length;
        	strTemp = strTemp.substring(i+3,len);
	  	}
   	}
   	function OnUsbkeyChange() 
   	{
		GetList_pnp("LoginForm.UserList");
   	}
	
	OnUsbkeyChange();
</SCRIPT>

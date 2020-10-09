<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台管理 | 登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=9,IE=10,IE=11,chrome=1,firefox=1">
    <meta name="renderer" content="ie-comp">
<!--     <meta name="renderer" content="webkit"> -->
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<!--     <meta http-equiv="Content-type" content="text/html; charset=utf-8"> -->
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
	<link type="text/css" rel="stylesheet" href="<%=basePath%>assets/login3/bootstrap/css/bootstrap.min.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>assets/login3/static/css/load.css">
	<script type="text/javascript" src="<%=basePath%>assets/login3/static/js/jquery-1.12.1.min.js"></script>
	<script language="JavaScript" src="<%=basePath%>assets/bjca/data.js"></script>
</head>
<body  style="position:relative;">
<style type="text/css">   
	 	.j_password-error{ }
        #ie6-warning{background:#FF0; position:absolute;top:0; left:0;font-size:12px; line-height:24px; color:#F00; padding:0 10px; }  
        #ie6-warning img{float:right; cursor:pointer; margin-top:4px;} 
        #ie6-warning a{text-decoration:none;color:#2f0 !important}  
        .login-form p select{ width: 100%;
		    box-sizing: border-box;
		    padding: 10px 5px 10px 30px;
		    border: none;
		    }
		.display_none{
			display: none;
		}
</style>
    
	<!--[if lte IE 7]>   
<div id="ie6-warning" style="z-index:100;">
<img src="../../../images/cha.png" width="14" height="14" onclick="closeme();" alt="关闭提示" />
您正在使用 Internet Explorer 7 低版本的IE浏览器。为更好的浏览本页，建议您将浏览器升级到 
<a href="http://www.microsoft.com/china/windows/internet-explorer/ie8howto.aspx" target="_blank">IE8</a>  
或以下浏览器：<a href="http://www.firefox.com.cn/download/">Firefox</a>/ <a href="http://www.google.cn/chrome"> Chrome</a>/ <a href="http://chrome.360.cn/index_main.html">360极速模式</a>
</div>
<script type="text/javascript">  
    togo = 0; 
    function closeme(){    
        var div = document.getElementById("ie6-warning");    
        div.style.display ="none";
    };
    function position_fixed(el, eltop, elleft){
        // check if this is IE6
        if(!window.XMLHttpRequest)
            window.onscroll = function(){
                el.style.top = (document.documentElement.scrollTop + eltop)+"px";
                el.style.left = (document.documentElement.scrollLeft + elleft)+"px";
            }
        else 
            el.style.position = "";
    };
    position_fixed(document.getElementById("ie6-warning"),0, 0);
</script>   
<![endif]-->
<!--[if(gte IE 6)&(lte IE 8)]>
		
      <script type="text/javascript" src="static/js/selectivizr.js"></script>
      <script type="text/javascript" src="static/js/html5shiv.min.js"></script>
      <script type="text/javascript" src="static/js/respond.min.js"></script>
      <style type='text/css'>
      .content .loadForm p.ie8{background:#278fa4; padding:0px;}
      .content .loadForm p .login-btn{background:#278fa4;}
      </style>  
<![endif]-->
<script ID="clientEventHandlersJS" LANGUAGE="javascript">
			
			var strServerSignedData = "${strSignedData}";
			var strServerRan = "${strRandom}";
			var strServerCert = "${strServerCert}";
			function LoginForm_onsubmit() {
				if(!fl){
					return true;
				}
				var ret; 
 				var strContainerName = loadForm1.UserList.value; 
 				var strPin = loadForm1.UserPwd.value; 
				
 				if(strPin.length<4||strPin.length>16){ 
 					alert("密码长度应该在4-16位之间"); 
 					return false; 
				} 
				ret = Login(loadForm1,strContainerName,strPin); 
 				loadForm1.UserPwd.value = ""; 
 				return ret; 
			}
			
		</script>
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
					//alert("检测到（"+strName+"）证书，可使用证书登录！");
					g_xmluserlist = g_xmluserlist +strName +"||";
					g_xmluserlist = g_xmluserlist +strUniqueID +"&&&";
							
					len = strTemp.length;
				    strTemp = strTemp.substring(i+3,len);
				}
				var objListID = null;
			}
	
			GetList("loadForm1.UserList");
		</script>
<div class="loadSystem">
    	<!-- <h1><img src="<%=basePath%>assets/login3/static/image/shenong.png" width="379" height="38"></h1>
    	<div class="title">
        </div> -->
        <div class="content">
        	<div class="slide_content">
            	<div class="tabslider">
                    
                    <div class="content-wrap" rel="zt_rep_pad">
                        <form id="loadForm1" class="loadForm login-form"
                         action="<%=basePath%>j_spring_security_check"
                         onsubmit="return LoginForm_onsubmit()"
                          method="post">
                            <p class="load"><input type="text"  
                            id="username" value="" autocomplete="off" 
                			name="j_username" placeholder="请输入账号" class="alter-text" />
<!--                 			onblur="if(this.value == '')this.value='请输入账号';" -->
<!--                 			onclick="if(this.value == '请输入账号')this.value='';" -->
<!--                 			value="请输入账号" -->
                			</p class="load">
                            <p class="load"><input type="password" value="" id="password" placeholder="请输入密码" class="ater-passwd"
                             name="j_password" />
<!--                              onblur="if(this.value == '')this.value='请输入密码';"  -->
<!--                              onclick="if(this.value == '请输入密码')this.value='';"  -->
<!--                              value="请输入密码" -->
                              
                             </p>
                             <p  class="ca display_none"><select type="text" id="UserList" name="userName" id="UserList" class="ater-passwd"
                             ></select>
                              <input type="hidden" name="ranStr" id="ranStr" placeholder="请输入密码" value="${strRandom }" class="ater-passwd"
                              />
                             </p>
                             <p class="ca display_none"><input type="text" name="pwd1" id="UserPwd" placeholder="请输入证书密码" class="ater-passwd"
                              />
                              
                             </p>	
                             
                           <p class="clearfix load">
                            <input type="text" id="validatation" placeholder="请输入验证码" name="j_captcha" class="ater-yzm"/>
                            <a id="flashImage" title="看不清,换一张" href="javascript:void(0)">
                            <img id="imageF" src="<%=basePath%>randomImage"  width="111" height="35"/></a>
                            </p>
                            <c:if test="${param.error==true}">
				            	<p class="error">${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}</p>
				            </c:if>
				            <c:if test="${param.ca_error==true}">
				            	<p class="error">${param.message}</p>
				            </c:if>
                            <p class="ie8" style="background: transparent;"><input type="submit" value="登录" class="login-btn"></p>
                            <span class="load"><a   href="javascript:showca(0)">证书登录 </a></span>
                            <span class="ca display_none"><a  href="javascript:showload(0)">用户名密码登录</a></span>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
        <div class="footer">
             <!-- <p>北京市农村合作经济经营管理办公室（北京市农村经济研究中心）主办 </p>-->
             
             <p>&nbsp;</p>
             <p>&nbsp;</p>
             <p>北京市城乡经济信息中心技术支持</p>
             <!-- <p>ICP备案编号：京ICP备  京公网安备 </p> -->	
       </div>
    </div>
</body>

<script src="<%=basePath%>assets/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/pages/scripts/base64.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/pages/scripts/login_portal.js"
        type="text/javascript"></script>
<script>

    jQuery(document).ready(function () {
        document.getElementById("username").focus(); 
        DMLogin.init();
    });
    var domain='<%=basePath %>';
    var fl = false;
        var showca = function(){
        	$(".load").hide();
        	$(".ca").show();
        	fl=true;
        	$("#loadForm1").attr("action",domain+'cacheck').attr("onsubmit","return LoginForm_onsubmit()");
        }
        var showload = function(){
        	fl=false;
        	$(".ca").hide();
        	$(".load").show();
        	$("#loadForm1").attr("action",domain+'j_spring_security_check').removeAttr("onsubmit");
        	
        }
</script>

<SCRIPT language=JavaScript src="<%=basePath%>assets/bjca/SecX_Common.js"></SCRIPT>

<SCRIPT FOR="bjcactrl" EVENT="OnUsbkeyChange" LANGUAGE="javascript">

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
			//alert("检测到（"+strName+"）");
			objListID.add(objItem);
			len = strTemp.length;
        	strTemp = strTemp.substring(i+3,len);
	  	}
   	}
   	function OnUsbkeyChange() 
   	{
		GetList_pnp("loadForm1.UserList");
   	}
	
	OnUsbkeyChange();
</SCRIPT>
</body>
</html>

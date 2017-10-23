/////const //////////////////////////

/////define object  /////////////////////////////////
try
{
    document.writeln("<OBJECT classid=\"clsid:FCAA4851-9E71-4BFE-8E55-212B5373F040\" height=1 id=bjcactrl  style=\"HEIGHT: 1px; LEFT: 10px; TOP: 28px; WIDTH: 1px\" width=1 VIEWASTEXT>");
    document.writeln("</OBJECT>");
    bjcactrl.GetUserListPnp();	 
}
catch(e)
{
	//alert("ActiveXObject BJCASECCOM.dll可能没有注册成功！"+e.message);
	console.log("ActiveXObject BJCASECCOM.dll可能没有注册成功！"+e.message);
	console.log("可能当前浏览器不支持CA证书，请使用IE浏览器。");
}

var errorMsg = "请确认插入正确的证书介质或重新登录系统！";

/////组件接口转换为脚本接口////////////////////////
var g_xmluserlist;

//得到用户列表
function GetUserList() {

     try
     {
	    g_xmluserlist = bjcactrl.GetUserList();
     }
     catch(e)
     {
	    g_xmluserlist="";
	    alert(e.message);
    	
     }
	    return g_xmluserlist;
	    
}

//得到用户信息
function GetCertBasicinfo(Cert, Type) 
{

	return bjcactrl.GetCertInfo(Cert,Type);
	
}
function GetExtCertInfoByOID(Cert, oid) 
{
    
    return bjcactrl.GetCertInfoByOid(Cert,oid);
}

//登录
function Login(strFormName,strContainerName,strPin) {
	var ret;
	var objForm = eval(strFormName);

	if (objForm == null) {
		alert("Form Error");
		return false;
	}
	if (strPin == null || strPin == "") {
		alert("请输入Key的保护口令");
		return false;
	}
	//Add a hidden item ...
	var strSignItem = "<input type=\"hidden\" name=\"UserSignedData\" value=\"\">";
	if (objForm.UserSignedData == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strSignItem);
	}
	var strCertItem = "<input type=\"hidden\" name=\"UserCert\" value=\"\">";
	if (objForm.UserCert == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strCertItem);
	}
	var strContainerItem = "<input type=\"hidden\" name=\"ContainerName\" value=\"\">";
	if (objForm.ContainerName == null) {
		objForm.insertAdjacentHTML("BeforeEnd",strContainerItem);
	}


    if(!bjcactrl.UserLogin(strContainerName,strPin))
    {
    	
    	var extLib = bjcactrl.GetUserInfo(strContainerName, 15);
    	
    	var remainTimes = bjcactrl.GetBjcaKeyParam(extLib , 8);
    	if(Number(remainTimes)<=0){
    		alert("您输入了10次错误密码,证书已经被锁死,请尽快联系技术人员解锁");
    		return false;
    	}
        alert("登录失败,剩余密码重试次数：" + remainTimes);
        return false;
    }
    
    strClientSignedData = SignedData(strContainerName,strServerRan);
    //alert("strServerCert:"+strServerCert+"\n\nstrServerRan:"+strServerRan+"\n\nstrServerSignedData:"+strServerSignedData);
    if(!VerifySignedData(strServerCert,strServerRan,strServerSignedData))
    {
        
        alert("验证服务器端信息失败!");
        return false;
    }
    
    objForm.UserSignedData.value = strClientSignedData;
	var varCert =  GetSignCert(strContainerName);
	objForm.UserCert.value =  varCert;
	objForm.ContainerName.value = strContainerName;
    
    return alertValidDay(varCert);
    
}

//根据证书惟一标识，获取Base64编码的证书字符串。指定获取加密（交换）证书。
function GetExchCert(strContainerName)
{  
    var UserCert = bjcactrl.ExportExChangeUserCert(strContainerName);
   
    return UserCert;
}

//签名证书
function GetSignCert(strContainerName)
{  
    var UserCert = bjcactrl.ExportUserCert(strContainerName);
   
    return UserCert;
}


//xml签名
function SignedDataXML(signdata,ContainerName)
{
	return bjcactrl.SignDataXML(ContainerName,signdata);
}

function SignedData(sContainerName,sInData) 
{
	if (sContainerName != null)
		return bjcactrl.SignData(sContainerName,sInData);
	else
		return "";
}


function VerifySignedData(cert,indata,signvalue)
{
    return bjcactrl.VerifySignedData(cert,indata,signvalue);

}


function PubKeyEncrypt(exchCert,inData)
{
	try
	{
		var ret = bjcactrl.PubKeyEncrypt(exchCert,inData);
		return ret;
	}
    catch(e)
    {
    	 
    }
}


function PriKeyDecrypt(sContainerName,inData)
{
	try
	{
		var ret = bjcactrl.PriKeyDecrypt(sContainerName,inData);
		return ret;
	}
    catch(e)
    {
	 
    }
}


function EncryptData(sKey,inData)
{
	try
	{
		var ret = bjcactrl.EncryptData(sKey,inData);
		return ret;
	}
    catch(e)
    {
	 
    }
}


function DecryptData(sKey,inData)
{
	try
	{
		var ret = bjcactrl.DecryptData(sKey,inData);
		return ret;
	}
    catch(e)
    {
	 
    }
}

function GenerateRandom(RandomLen) 
{

	return bjcactrl.GenRandom(RandomLen);
}


//文件签名 返回签名数据
function SignFile(sFileName,sContainerName)
{
	 return bjcactrl.SignFile(sContainerName,sFileName)
}

function VerifySignFile(sFileName,sCert,SignData)
{
	 return bjcactrl.VerifySignedFile(sCert,sFileName,SignData);
}

//修改密码
function ChangeUserPassword(strContainerName,oldPwd,newPwd)
{	
	return bjcactrl.ChangePasswd(strContainerName,oldPwd,newPwd);
}

//xml签名
function SignedDataXML(signdata,ContainerName)
{
	return bjcactrl.SignDataXML(ContainerName,signdata);
}

//xml验证签名
function VerifySignXML(signxml)
{
	return bjcactrl.verifySignedDataXML(signxml);
}

//p7签名
function SignByP7(CertID,InData)
{
    return bjcactrl.SignDataByP7(CertID,InData)
}

//验证p7签名
function VerifyDatabyP7(P7Data)
{
    return bjcactrl.VerifySignedDatabyP7(P7Data);
}

//p7数字信封加密
function EncodeP7Enveloped(Cert,InData)
{
    return bjcactrl.EncodeP7EnvelopedData(Cert,InData);
}

//p7数字信封解密
function DecodeP7Enveloped(CertID,InData)
{ 
    return bjcactrl.DecodeP7EnvelopedData(CertID,InData);
}

//判断证书有效期天数
function alertValidDay(cert){
	var endDate = GetCertBasicinfo(cert,12);
	var nowDate = new Date().Format("yyyy/MM/dd");
	var days = (Date.parse(endDate)-Date.parse(nowDate))/(1000*60*60*24);
	if(days<=60&&days>0){
		alert("您的证书还有"+days+"天过期,请尽快更新");
	}
	if(days<=-45){
		alert("您的证书已经过期"+(-days)+"天,超过了最后使用期限,请尽快更新");
		return false;
	}
	if(days<=0){
		alert("您的证书已经过期"+(-days)+"天,请尽快更新");
	}
	return true;
}

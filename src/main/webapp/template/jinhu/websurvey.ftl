<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
                    <html>
                    <head lang="en">
                    <#include "/template/jh-meta.ftl">
                    <title>金湖政府网</title>
                    <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
                    <!--<link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">-->
                    <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
         	    <link href="/html/jinhu-static/css/style.wq1.css" rel="stylesheet">
         
                   <!--[if lt IE 9]>
         	     <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
         	     <script src="/html/jinhu-static/js/respond.min.js"></script>
         	     <![endif]-->
                    </head>
                    
                    <body>
                    	<#include "/template/jh-head.ftl">
                    <#include "/template/jh-index-daohang.ftl">
                    	<div class="container bg-white">
                    		<div class="jh-main">
         				<div class="clearfix zhuye">
     				
         				<#if code??>
                                              <#if code=="1">
         					<h2 class=" mgb20">县长信箱</h2>
                    				
                                               <#elseif code=="2">
                                              <h2 class=" mgb20">书记信箱</h2>
                                              
                                              <#elseif code =="3">
                                             <h2 class=" mgb20">镇或部门信箱</h2>
                                              <#else>
                                              <h2 class=" mgb20">留言</h2>
                                              </#if>
     					 <#if msg??>
     					<span style="color:#f00;">${msg}</span>
     				</#if>
                                           </#if>
                     <form role="form" id="myForm" class="mgb20"  name="letterform" 
                  							action="./form.htm" method="post">
                       <table class="form-table form-table-width fontSize16">
                           <tr><input name="org.apache.struts.taglib.html.token" type="hidden"
                  									value="1d14616d7163b7e9c56edc7e996394e3">
                               <td style="width: 100px;">姓名<span class="color-red">*</span></td>
                               <td><input type="text" id="username" name="username" value="${(websurvey.username)!''}" class="form-control" placeholder="请输入您的名字" datatype="*"></td>
                               <td style="width: 100px;">年龄 </td>
                               <td><input type="number" id="age" name="age" value="${(websurvey.age)!''}"  class="form-control" placeholder="请输入您的年龄" datatype="n"></td>
                           </tr>
                           <tr>
                               <td>性别<span class="color-red">*</span></td>
                               <td colspan="3">
                                   <label class="radio-inline">
                                       <input type="radio" checked=true name="sex" id="form-xb1" value="m"> 男
                                   </label>
                                   <label class="radio-inline">
                                       <input type="radio" name="sex" id="form-xb2" value="w"> 女
                                   </label>
                               </td>
                           </tr>
                           <tr>
                               <td>联系电话<span class="color-red">*</span></td>
                               <td><input type="tel" id="phone" name="phone" value="${(websurvey.phone)!''}"  class="form-control" placeholder="请输入您的联系电话" datatype="m"></td>
                               <td>电子邮箱 </td>
                               <td><input type="email" name="email" value="${(websurvey.email)!''}"  class="form-control" placeholder="请输入您的电子邮箱" datatype="e"></td>
                           </tr>
                           <tr>
                               <td>联系地址 </td>
                               <td><input type="text" name="address" value="${(websurvey.address)!''}"  class="form-control" placeholder="请输入您的联系地址" datatype="*"></td>
                               <td>邮政编码 </td>
                               <td><input type="text" name="postcode" value="${(websurvey.postcode)!''}"  class="form-control" placeholder="请输入您的邮政编码" ></td>
                           </tr>
                           <input type="hidden" name="code" value="${code}">
       		    <#if code??> <#if code=="1">
       			<#elseif code=="2">
       			<#elseif code=="3">
       			<tr>
       				<td>选择部门<span class="color-red">*</span></td>
       				<td colspan="4"><select name="codeId" id="bumen">
       						<option>请选择...</option> <#list orgs as org>
       						<option value="${org.id}">${org.name}</option> </#list>
       				</select><span class="link4"> *</span></td>
       			</tr>
       			<#else>
       			<input name="type" value="5" type="hidden"> </#if>
       			</#if>
       		    <#if code!="4">
       		    <tr>
                               <td>类型<span class="color-red">*</span></td>
                               <td colspan="4" id="leixing">
                                   <label class="radio-inline">
                                       <input type="radio" name="type" checked=true value="1"> 咨询
                                   </label>
                                   <label class="radio-inline">
                                       <input type="radio" name="type" value="2"> 投诉
                                   </label>
                                   <label class="radio-inline">
                                       <input type="radio" name="type" value="3"> 建议
                                   </label>
                                   <label class="radio-inline">
                                       <input type="radio" name="type" value="4"> 举报
                                   </label>
                               </td>
                           </tr>
       		    </#if> 
                           <tr>
                               <td>是否公开<span class="color-red">*</span></td>
                               <td colspan="4">
                                   <label class="radio-inline">
                                       <input type="radio" name="isOpen" value="1" checked=true> 公开
                                   </label>
                                   <label class="radio-inline">
                                       <input type="radio" name="isOpen" value="0"> 不公开
                                   </label>
                               </td>
                           </tr>
                           <tr>
                               <td>信件标题<span class="color-red">*</span></td>
                               <td colspan="4">
                                   <input type="text" name="title" value="${(websurvey.title)!''}"  id="title" class="form-control" placeholder="请输入您的标题" datatype="*">
                               </td>
                           </tr>
                           <tr>
                               <td valign="top">信件内容<span class="color-red">*</span></td>
                               <td colspan="4">
                                   <textarea name="content" id="content" class="form-control" rows="10" placeholder="请输入您的内容" datatype="*">${(websurvey.content)!''}</textarea>
                               </td>
                           </tr>
   			 <tr>
                               <td valign="top">验证码<span class="color-red">*</span></td>
   			    <td colspan="1">
   				<a id="codeImage" href="javascript:void(0);"><img id="imgR" src="../randomImage"/> 看不清,换一张</a>
                               </td>
                               <td colspan="3">
                                   <input name="viliCode" id="viliCode" class="form-control" placeholder="请输入验证码" datatype="*"/>
                               </td>
                           </tr>
                           <!--<tr>
                               <td valign="top">添加附件 </td>
                               <td colspan="4">
                                   <input type="file" name="fileUpdata" rows="10" placeholder="选择需要上传的附件" datatype="*">
                                  
                               </td>
                           </tr>-->
                           <tr>
                               <td colspan="2" class="text-right">
                                   <input type="button" onclick="validateForm();" class="btn btn-default btn-download1" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                               </td>
                               <td colspan="2">
                                   <input type="reset" class="btn btn-default btn-download" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;填&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">
                               </td>
                           </tr>
                           
                       </table>
                   </form>
                     <div class="attention">
                     	<p>说明事项</p>
                         <p>1、首先感谢您对金湖的建设和发展提出宝贵意见和建议，欢迎您今后继续对我们的工作提出建议。</p>
                         <p>2、请您务必遵守中国相关法律和法规，不得填写具有骚扰、中伤、辱骂、恐吓、诽谤、伤害、色情、反动、迷信、危害国家安全等色彩的非法信息。</p>
                         <p>3、方框后加“*”号的为必填项，提交信件时不能为空白。</p>
                         <p>4、您在投诉、举报时，请务必留下真实而具体的姓名、联系方式，并详细提供有关情况，以便于有关部门进行核实处理，我们会为您的个人资料严格保密。</p>
                         <p>5、请您牢记信件提交后网站反馈给您的“信件编号”和“信件密码”，以便于查询信件办理进展情况和结果。</p>
                         <!--<p>6、如果您不清楚部门的机构职能，请点击“<a href="/html/jinhu/qita/content/23027.html" target="_blank">机构职能</a>”进行查询。</p>-->
                         <p>6、请您不要一信多投，也不要重复投信。</p>
                     </div>
                 </div>
             </div>
                    		<!--相关链接-->
                    </div>
                     <#include "/template/jh-footer.ftl">
                     <script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
                                                                  
                       <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
                                                                   
                       <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
                                                                  
                       <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
         	       <script type="text/javascript" src="/html/jinhu-static/js/Validform_v5.3.2_min.js"></script>
         	     
                                                                  
                       <script type="text/javascript" src="/html/jinhu-static/js/visit-record.js"></script>  
                    	<!--<script type="text/javascript" src="/html/jinhu-static-xxwq/js/jquery.placeholder.min.js"></script>
                    
                    	<script src="/html/jinhu-static-xxwq/js/bootstrap.min.js" type="text/javascript"></script>-->
                    
                    	<script type="text/javascript">
                    		$(function() {
                    			$('input, textarea').placeholder();
                    			 $(".form-table").Validform();
     				$("#codeImage").click(function(){
     					var getTimestamp=new Date().getTime();
     					$("#imgR").attr("src","../randomImage?s="+getTimestamp);
     				});
                    		});
         			//表单提交验证
         function validateForm(){
         	//获取姓名
         		var username=$("#username").val();
         		if(username==""){
         			alert("用户名不能为空!");
         			return false;
         		}
         		var age=$("#age").val();
         		if(age!=""){
         			var agePattern=/[1-9]\d?/;
         			if(!agePattern.test(age)){
         				alert("请输入正确的年龄!");
         				//$("#phone").val("");
         				return false;
         			}
         		}
         		//获取联系电话
         		var phone=$("#phone").val();
         		//电话号码正则表达式（支持手机号码，3-4位区号，7-8位直播号码，1－4位分机号） ((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$) 
         		var phonePattern=/^1[358]\d{9}$/;
         		var telPattern=/^0\d{2,3}-?\d{7,8}$/;
         		if(phone==""){
         			alert("联系电话不能为空！");
         			return false;
         		}
         		//alert(phonePattern.test(phone));
         		if(!phonePattern.test(phone) && !telPattern.test(phone)){
         			alert("请输入正确的联系电话!");
         			//$("#phone").val("");
         			return false;
         		}
         		//部门
         		/*var bumen=$("#bumen").find("option:selected").text();
         		if(bumen.trim()=="请选择..."){
         			alert("请选择部门!");
         			return false;
         		}*/
         		//类型
         		var leixing=$("#leixing").find("input[type='radio']:checked").val();
         		if(leixing==undefined){
         			alert("请选择类型!");
         			return false;
         		}
         		//信件标题
         		var title=$("#title").val();
         		if(title==""){
         			alert("请填写信件标题!");
         			return false;
         		}
         		//信件内容
         		var content=$("#content").val();
         		if(content==""){
         			alert("请填写信件内容!");
         			return false;
         		}
     		
         		//$("#myForm").action="/jinhuadmin/portal/websurvey/add";
         		$("#myForm").submit();
         }
                    	</script>
                    
                    
                    </body>
                    </html>
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 
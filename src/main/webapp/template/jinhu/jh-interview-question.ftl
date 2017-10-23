<!DOCTYPE html>
<html>
<head lang="en">
    <#include "/template/jh-meta.ftl">
            <title>金湖政府网</title>
          	<meta name="keywords" content="" />
            <link href="/html/jinhu-static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
            <link href="/html/jinhu-static/css/style.ts.css" rel="stylesheet">
            <!--[if lt IE 9]>
            <script src="/html/jinhu-static/js/html5shiv.min.js"></script>
            <script src="/html/jinhu-static/js/respond.min.js"></script>
            <![endif]-->
</head>
<body>
<#include "/template/jh-head.ftl"/>
        <#include "/template/jh-index-daohang.ftl"/>
<div class="container bg-white">
    
    <div class="jh-main jh-article">
        <div class="jh-article-title fontSize22 text-center"><span>${cmsInterview.title!}</span></div>
        
        
        <div class="jh-article-p" >
            <p>${cmsInterview.desc!}</p>
			<div style="width:80%;text-align: center;">
				<table  style="width:80%;text-align: left;border-collapse:separate; border-spacing:0px 10px;">
					<tr >
					<td style="width:10%;text-align: right;">姓名：</td ><td ><input name="name" value="" style="border:1px solid #A1BDD7; width:70%;" type="text"><font color="#FF0000">(必填)</font></td>
					</tr>
					<tr><td style="width:10%;text-align: right;">电话：</td ><td ><input name="phone" value="" style="border:1px solid #A1BDD7; width:70%;" type="text"><font color="#FF0000">(必填)</font></td></tr>
					<tr><td style="width:10%;text-align: right;">内容：</td ><td ><textarea name="content" id="content" rows="8" style="border:1px solid #A1BDD7; width:95%;"></textarea></td></tr>
					<tr><td></td><td style="text-align: center;"><a class="btn btn-default btn-lg btn-download color-green" id="insertq"> 提交</a></td></tr>
				</table>

				
			</div>
        </div>
    </div>
   
     <#include "/template/jh-links.ftl">
        </div>
        <#include "/template/jh-footer.ftl">
<script type="text/javascript" src="/html/jinhu-static/js/jquery-1.12.1.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/js/jquery.placeholder.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/html/jinhu-static/js/js.js"></script>
<script type="text/javascript">
    $(function () {
        $('input, textarea').placeholder();
	$("#insertq").bind("click",function(){
		var name =$("input[name='name']").val();
		var phone=$("input[name='phone']").val();
		var content =$("#content").val();
		if(name==''){
			alert("请填写完整信息");
			return false;
		}
		if(phone==''){
			alert("请填写完整信息");
			return false;
		}
		if(content==''){
			alert("请填写完整信息");
			return false;
		}
		
			$.ajax({
				url:"./insertQ",
				data:{name:name,phone:phone,content:content,interviewId:${cmsInterview.id}},
				type:"post",
				success:function(res){
					if(res.status=='1'){
					alert(res.msg);
					window.close();
					}else{
alert(res.msg);
					}

				}
			});
		
	});
    });
   
</script>
</body>
</html>
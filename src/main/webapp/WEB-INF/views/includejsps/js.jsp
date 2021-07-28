<%@ page language="java" pageEncoding="UTF-8" %>
<!-- BEGIN CORE PLUGINS -->
<script type="text/javascript">
    //根路径
    var dm_root = "<%=basePath%>";
</script>
<!--[if lt IE 9]>
<script src="<%=basePath%>assets/global/plugins/respond.min.js"></script>
<script src="<%=basePath%>assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/jquery-ui/jquery-ui.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/bootbox/bootbox.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="<%=basePath%>assets/global/plugins/jquery.tmpl.min.js"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=basePath%>assets/global/scripts/metronic.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/layout3/scripts/layout.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/layout3/scripts/theme.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.mloading.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    bootbox.setDefaults({
        locale: "zh_CN"
    });
    $(document).ready(function () {
        $(".hor-menu").dmMenu({
            url: dm_root + "/loadMenus",callback:dandian
        });
        $("#user-info.dropdown").dmUserInfo({
            url: dm_root + "/userInfo"
        });
        $("#header_inbox_bar").dmInbox({
            url: dm_root + "/inbox/news",
            autoAjax: false,
            interval: "5s"
        });
        Metronic.init(); // init metronic core componets
        Layout.init(); // init layout
        Theme.init();
    });
    function dandian(){
    	if (self != top) {
        	window.parent.postMessage({code:200},"*");
    	}
    	var ele ='<li title="单点登录" class="menu-dropdown classic-menu-dropdown">'
    		+'<a data-hover="megamenu-dropdown" data-close-others="true" '
    		+'data-toggle="dropdown" href="javascript:;" data-url="#" class="hover-initialized" aria-expanded="false">'
    		+'<i class="fa fa-sitemap"></i>单点登录<i class="fa fa-angle-down"></i>'
    		+'</a><ul id="ul_166239" class="dropdown-menu pull-left">'
    		+'<li id="li_151323892" title="数据交换平台"><a href="javascript:datatranslate();" data-url="">'
    		+'<i class="fa fa-random"></i>数据交换平台</a></li><li id="li_18696813" title="互联网采集平台">'
    		+'<a href="javascript:dataspider();" data-url=""><i class="fa fa-stack-overflow"></i>互联网采集平台</a></li>'
    		+'</ul></li>';
    	$(".hor-menu").find("ul.navbar-nav").append(ele);
    		
    }
    function datatranslate(){
    	openPostWindow("数据交换","http://172.26.72.175:81/data-translate/api/main","username","admin","password","admin");
    }
	function dataspider(){
		openPostWindow("数据采集","http://172.26.72.175:82/j_spring_security_check","j_username","admin","j_password","123456");
    }
    
  //以post形式打开新的页面，可以传递多个参数  
    function openPostWindow(windowname,url,username,user,password,pass){           
       var tempForm = document.createElement("form");         
       tempForm.id="tempForm1";           
       tempForm.method="post";          
       tempForm.action=url;         
       //open方法不能设置请求方式，一般网页的post都是通过form来实现的。    
       //如果仅仅模拟form的提交方式，那么open方法里那种可设置窗体属性的参数又不能用。    
       //最后想办法整了这么一个两者结合的方式，将form的target设置成和open的name参数一样的值，通过浏览器自动识别实现了将内容post到新窗口中    
       tempForm.target=windowname;           
       tempForm.innerHTML="<input type='hidden' name='"+username+"' value='"+user+"'/>"+  
       "<input type='hidden' name='"+password+"' value='"+pass+"'/>";    
       // tempForm.attachEvent("onsubmit",function(){ openWindow(name); });     //IE  
       tempForm.addEventListener("onsubmit",function(){ openWindow(windowname); });   //chrome      
       document.body.appendChild(tempForm);            
       //tempForm.fireEvent("onsubmit"); //IE      
       tempForm.dispatchEvent(new Event("onsubmit"));//chrome      
       //必须手动的触发，否则只能看到页面刷新而没有打开新窗口    
       tempForm.submit();         
       document.body.removeChild(tempForm);        
    } 
    function openWindow(name)         
    {         
        window.open('about:blank',name,'height=400, width=400, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');            
    } 
</script>

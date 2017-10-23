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
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台管理 | 重置密码</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link
            href="<%=basePath%>assets/global/plugins/font-awesome/css/font-awesome.min.css"
            rel="stylesheet" type="text/css"/>
    <link
            href="<%=basePath%>assets/global/plugins/simple-line-icons/simple-line-icons.min.css"
            rel="stylesheet" type="text/css"/>
    <link
            href="<%=basePath%>assets/global/plugins/bootstrap/css/bootstrap.min.css"
            rel="stylesheet" type="text/css"/>
    <link
            href="<%=basePath%>assets/global/plugins/uniform/css/uniform.default.css"
            rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="<%=basePath%>assets/admin/pages/css/login2.css"
          rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="<%=basePath%>assets/global/css/components-rounded.css"
          id="style_components" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>assets/global/css/plugins.css" rel="stylesheet"
          type="text/css"/>
    <link href="<%=basePath%>assets/admin/layout/css/layout.css"
          rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>assets/admin/layout/css/themes/default.css"
          rel="stylesheet" type="text/css" id="style_color"/>
    <link href="<%=basePath%>assets/admin/layout/css/custom.css"
          rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="<%=basePath%>favicon.ico" />
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler"></div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="#"> <img
            src="<%=basePath%>assets/admin/layout3/img/logo-big-white.png"
            style="height: 17px;" alt=""/> </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
    <!-- BEGIN REGISTRATION FORM -->
    <form class="register-form" action="<%=basePath%>resetPassword" method="post">
        <div class="form-title">
            <span class="form-title">重置密码</span>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">用户名</label>
            <input class="form-control placeholder-no-fix" type="hidden"
                   autocomplete="off" placeholder="用户名" id="username" name="username" value="${param.user }"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">sid</label>
            <input class="form-control placeholder-no-fix" type="hidden"
                   autocomplete="off" placeholder="用户名" id="sid"  name="sid" value="${param.sid }"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">密码</label>
            <input class="form-control placeholder-no-fix" type="password"
                   autocomplete="off" id="register_password" placeholder="密码"
                   name="password"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">再次输入密码
                Your Password</label> <input class="form-control placeholder-no-fix"
                                             type="password" autocomplete="off"
                                             placeholder="再次输入密码" name="rpassword"/>
        </div>
        <div class="form-group margin-top-20 margin-bottom-20">
            <div id="register_tnc_error"></div>
        </div>
        <div class="form-actions">
            <button type="submit" id="register-submit-btn"
                    class="btn btn-primary uppercase pull-right">修改
            </button>
        </div>
    </form>
    <!-- END REGISTRATION FORM -->
</div>
<div class="copyright hide">2015 © DMCMS. orange.
</div>
<!-- END LOGIN -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=basePath%>assets/global/plugins/respond.min.js"></script>
<script src="<%=basePath%>assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script>
    var dm_root = "<%=basePath%>";
</script>
<script src="<%=basePath%>assets/global/plugins/jquery.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script
        src="<%=basePath%>assets/global/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/global/plugins/jquery.cokie.min.js"
        type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script
        src="<%=basePath%>assets/global/plugins/jquery-validation/js/jquery.validate.min.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=basePath%>assets/global/scripts/metronic.js"
        type="text/javascript"></script>
<script src="<%=basePath%>assets/admin/pages/scripts/login-reset-password.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        Metronic.init(); // init metronic core components
        Resetpassword.init();
    });
</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

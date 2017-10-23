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
<!-- END PAGE LEVEL SCRIPTS -->
<script type="text/javascript">
    bootbox.setDefaults({
        locale: "zh_CN"
    });
    $(document).ready(function () {
        $(".hor-menu").dmMenu({
            url: dm_root + "/loadMenus"
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
</script>

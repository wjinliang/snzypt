<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="/WEB-INF/tlds/c.tld" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>后台管理 | 消息中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta content="width=device-width, initial-scale=1" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <%@include file="../../includejsps/style.jsp" %>
    <%@include file="../../includejsps/plugin-style.jsp" %>
    <link href="<%=basePath%>assets/admin/pages/css/inbox.css"
          rel="stylesheet" type="text/css"/>
    <link
            href="<%=basePath%>/assets/global/plugins/jquery-ui/jquery-ui.min.css"
            rel="stylesheet" type="text/css"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<!-- DOC: Apply "page-header-menu-fixed" class to set the mega menu fixed  -->
<!-- DOC: Apply "page-header-top-fixed" class to set the top menu fixed  -->
<body>
<!-- BEGIN HEADER -->
<%@include file="../../includejsps/head.jsp" %>
<!-- END HEADER -->
<!-- BEGIN PAGE CONTAINER -->
<div class="page-container">
    <!-- BEGIN PAGE HEAD -->
   <%--  <div class="page-head">
        <div class="container">
            <!-- BEGIN PAGE TITLE -->
            <div class="page-title">
                <h1>消息中心</h1>
            </div>
            <!-- END PAGE TITLE -->
            <!-- BEGIN PAGE TOOLBAR -->
            <%@include file="../../includejsps/toolbar.jsp" %>
            <!-- END PAGE TOOLBAR -->
        </div>
    </div> --%>
    <!-- END PAGE HEAD -->
    <!-- BEGIN PAGE CONTENT -->
    <div class="page-content">
        <div class="container">
            <!-- BEGIN PAGE CONTENT INNER -->
            <div class="row margin-top-10">
                <div class="col-md-12 col-sm-12">
                    <div class="portlet light">
                        <div class="portlet-body">
                            <div class="row inbox">
                                <div class="col-md-2">
                                    <ul class="inbox-nav margin-bottom-10">
                                        <li id="compose" class="compose-btn form"
                                            data-title="Compose" data-type="0"><a
                                                href="javascript:;" data-title="Compose" class="btn green">
                                            <i class="fa fa-edit"></i> 写信息 </a>
                                        </li>
                                        <li id="inbox" class="inbox list" data-title="ListInbox"
                                            data-type="1"><a href="javascript:;" class="btn">
                                            收件箱 </a> <b></b>
                                        </li>
                                        <li id="mark" class="inbox list" data-title="ListMark"
                                            data-type="5"><a href="javascript:;" class="btn">
                                            星标邮件 </a> <b></b>
                                        </li>
                                        <li id="sent" class="sent list" data-title="ListSent"
                                            data-type="2"><a class="btn" href="javascript:;">
                                            已发送 </a> <b></b>
                                        </li>
                                        <li id="draft" class="draft list" data-title="ListDraft"
                                            data-type="3"><a class="btn" href="javascript:;">
                                            草稿箱 </a> <b></b>
                                        </li>
                                        <li id="trash" class="trash list" data-title="ListTrash"
                                            data-type="4"><a class="btn" href="javascript:;">
                                            回收站 </a> <b></b>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-10">
                                    <div class="inbox-header">
                                        <h1 class="pull-left" id="title">消息中心</h1>
                                    </div>
                                    <div class="inbox-loading" style="text-align: center;">Loading...</div>
                                    <div class="inbox-content">
                                        <div class="portlet light">
                                            <div class="portlet-body">
                                                <p class="text-left">进入收件箱</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT INNER -->
    </div>
</div>
<!-- END PAGE CONTAINER -->
<!-- BEGIN FOOTER -->
<%@include file="../../includejsps/foot.jsp" %>
<!-- END FOOTER-->
<!-- BEGIN JAVASCRIPTS-->
<%@include file="../../includejsps/js.jsp" %>
<%@include file="../../includejsps/plugin-js.jsp" %>
<script
        src="<%=basePath%>assets/global/plugins/jquery-ui/jquery-ui.min.js"
        type="text/javascript"></script>
<!-- END JAVASCRIPTS -->
<script src="<%=basePath%>assets/admin/project/js/inbox.js"
        type="text/javascript"></script>
<script type="text/javascript">
    var url = window.location.href;
    var r = {
        protocol: /([^\/]+:)\/\/(.*)/i,
        host: /(^[^\:\/]+)((?:\/|:|$)?.*)/,
        port: /\:?([^\/]*)(\/?.*)/,
        pathname: /([^\?#]+)(\??[^#]*)(#?.*)/
    };
    function parseUrl(url) {
        var tmp, res = {};
        res["href"] = url;
        for (p in r) {
            tmp = r[p].exec(url);
            res[p] = tmp[1];
            url = tmp[2];
            if (url === "") {
                url = "/";
            }
            if (p === "pathname") {
                res["pathname"] = tmp[1];
                res["search"] = tmp[2];
                res["hash"] = tmp[3];
            }
        }
        return res;
    }
    ;
    var res = parseUrl(url);
    $(res["hash"]).trigger("click");
</script>

</body>
<!-- END BODY -->
</html>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Head BEGIN -->
<head>
    <meta charset="utf-8">
    <title>${cmsContent.title?default("")}</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta content="Metronic Shop UI description" name="description">
    <meta content="Metronic Shop UI keywords" name="keywords">
    <meta content="keenthemes" name="author">

    <meta property="og:site_name" content="-CUSTOMER VALUE-">
    <meta property="og:title" content="-CUSTOMER VALUE-">
    <meta property="og:description" content="-CUSTOMER VALUE-">
    <meta property="og:type" content="website">
    <meta property="og:image" content="-CUSTOMER VALUE-">
    <!-- link to image for socio -->
    <meta property="og:url" content="-CUSTOMER VALUE-">

    <link rel="shortcut icon" href="favicon.ico">

    <!-- Fonts START -->
    |
    <!-- Fonts END -->

    <!-- Global styles START -->
    <link href="${basePath}/assets/global/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="${basePath}/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Global styles END -->
    <link
            href="${basePath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal.css"
            rel="stylesheet" type="text/css"/>
    <link
            href="${basePath}/assets/global/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css"
            rel="stylesheet" type="text/css"/>
    <!-- Theme styles START -->
    <link href="${basePath}/assets/global/css/components.css" rel="stylesheet">
    <link href="${basePath}/assets/frontend/layout/css/style.css" rel="stylesheet">
    <link href="${basePath}/assets/frontend/layout/css/style-responsive.css" rel="stylesheet">
    <link href="${basePath}/assets/frontend/layout/css/themes/blue.css" rel="stylesheet"
          id="style-color">
    <link href="${basePath}/assets/frontend/layout/css/custom.css" rel="stylesheet">
    <!-- Theme styles END -->
</head>
<!-- Head END -->

<!-- Body BEGIN -->
<body class="corporate">


<!-- BEGIN TOP BAR -->
<div class="pre-header">
    <div class="container">
        <div class="row">
            <!-- BEGIN TOP BAR LEFT PART -->
            <div class="col-md-6 col-sm-6 additional-shop-info">
                <ul class="list-unstyled list-inline">
                    <li><i class="fa fa-phone"></i><span>+1 456 6717</span></li>
                    <li><i class="fa fa-envelope-o"></i><span>info@keenthemes.com</span></li>
                </ul>
            </div>
            <!-- END TOP BAR LEFT PART -->
            <!-- BEGIN TOP BAR MENU -->
            <div class="col-md-6 col-sm-6 additional-nav">
                <ul class="list-unstyled list-inline pull-right">
                    <li class="isLogin" style="display: none;">您好,<span id="userName">用户</span></li>
                    <li class="isLogin" style="display: none;"><a
                            href="javascript:ajaxLogout();">注销</a>
                    </li>
                    <li class="isNotLogin"><a href="javascript:showLogin();">登录</a></li>
                    <li class="isNotLogin"><a href="javascript:registerUser();">注册</a></li>
                </ul>
            </div>
            <!-- END TOP BAR MENU -->
        </div>
    </div>
</div>
<!-- END TOP BAR -->
<!-- BEGIN HEADER -->
<div class="header">
    <div class="container">
        <a class="site-logo" href="index.html"><img
                src="${basePath}/assets/frontend/layout/img/logos/logo-corp-red.png"
                alt="Metronic FrontEnd"></a>

        <a href="javascript:void(0);" class="mobi-toggler"><i class="fa fa-bars"></i></a>

        <!-- BEGIN NAVIGATION -->
        <div class="header-navigation pull-left font-transform-inherit">
            <ul>

                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" data-target="#" href="#">
                        Features

                    </a>

                    <ul class="dropdown-menu">
                        <li><a href="feature-forms.html">首页</a></li>
                        <li class="dropdown-submenu">
                            <a href="index.html">一级菜单<i class="fa fa-angle-right"></i></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="index.html">二级菜单</a></li>
                                <li><a href="index.html">二级菜单</a></li>
                                <li class="dropdown-submenu">
                                    <a class="dropdown-toggle" data-toggle="dropdown"
                                       data-target="#" href="#">
                                        二级菜单
                                        <i class="fa fa-angle-right"></i>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="index.html">三级级菜单</a></li>
                                        <li><a href="index.html">三级级菜单</a></li>
                                        <li><a href="index.html">三级级菜单</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>

                <!-- BEGIN TOP SEARCH -->
                <li class="menu-search">
                    <span class="sep"></span>
                    <i class="fa fa-search search-btn"></i>

                    <div class="search-box">
                        <form action="#">
                            <div class="input-group">
                                <input type="text" placeholder="Search" class="form-control">
                                <span class="input-group-btn">
                                  <button class="btn btn-primary" type="submit">Search</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </li>
                <!-- END TOP SEARCH -->
            </ul>
        </div>
        <!-- END NAVIGATION -->
    </div>
</div>
<!-- Header END -->

<div class="main">
    <div class="container">
        <ul class="breadcrumb">
            <li><a href="index.html">频道</a></li>
            <li><a href="#">频道</a></li>
            <li class="active">内容</li>
        </ul>
        <!-- BEGIN SIDEBAR & CONTENT -->
        <div class="row margin-bottom-40">
            <!-- BEGIN CONTENT -->
            <div class="col-md-12 col-sm-12">
                <h2>${cmsContent.title?default("")}</h2>

                <div class="content-page">
                    <div class="row">
                        <!-- BEGIN LEFT SIDEBAR -->
                        <div class="col-md-9 col-sm-9 blog-item">
                            <ul class="blog-info">
                                <li>来源： ${cmsContent.author?default("")}</li>
                                <li>发布时间： ${cmsContent.publishDate?default("")}</li>

                            </ul>
                        <#if cmsContent.titleImageUrl??>
                            <div class="blog-item-img">
                                <!-- BEGIN CAROUSEL -->
                                <div class="front-carousel">
                                    <div id="myCarousel" class="carousel slide">
                                        <!-- Carousel items -->
                                        <div class="carousel-inner">
                                            <div class="item active">
                                                <img style="width:98%;height:98%;"
                                                     src="${cmsContent.titleImageUrl?default("")}"
                                                     alt="">
                                            </div>
                                        </div>
                                        <p>${cmsContent.titleImageIllustrate?default("")}</p>
                                    </div>
                                </div>
                                <!-- END CAROUSEL -->
                            </div>
                        </#if>

                            <blockquote>
                                <p>${cmsContent.brief?default("")}</p>
                            </blockquote>
                            <p></p>
                        ${cmsContent.contentText?default("")}

                        <#if cmsAttachments??>
                            <div class="portlet">
                                <div class="portlet-title">
                                    <div class="caption">
                                        附件
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <#list cmsAttachments as cmsAttachment>
                                        <div class="well">
                                            <a href="${basePath}/cms/attachment/download/${cmsAttachment.id}">${cmsAttachment.attachmentName?default("未命名")}</a>
                                        </div>
                                    </#list>
                                </div>
                            </div>
                        </#if>



                            <ul class="blog-info">
                                <li>评论： <span id="totalCount">0</span></li>
                                <li>关键字：新闻</li>
                            </ul>


                            <div role="comment">
                                <h2>评论
                                    <small>[<span id="pageNum">1</span>/<span
                                            id="pageCount">10</span>]
                                    </small>
                                </h2>
                                <div class="comments" url="${basePath}/api/cms/comment">


                                </div>
                                <ul class="pager">

                                    <li class="previous disabled">
                                        <a href="javascript:;">
                                            &larr; 上一页 </a>
                                    </li>
                                    <li class="next disabled">
                                        <a href="javascript:;">
                                            下一页 &rarr; </a>
                                    </li>
                                </ul>

                                <div class="post-comment padding-top-40">
                                    <h3>评论</h3>

                                    <form role="form" id="commentForm"
                                          action="${basePath}/api/cms/postComment">
                                        <div class="form-group">
                                            <textarea class="form-control" id="commentText"
                                                      name="commentText"
                                                      rows="8"></textarea>
                                        </div>
                                        <p>
                                            <button id="commentSubmitBtn" class="btn btn-primary"
                                                    type="button">提交
                                            </button>
                                        </p>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- END LEFT SIDEBAR -->


                    </div>
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
        <!-- END SIDEBAR & CONTENT -->
    </div>
</div>

<!-- BEGIN PRE-FOOTER -->
<div class="pre-footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN BOTTOM ABOUT BLOCK -->
            <div class="col-md-4 col-sm-6 pre-footer-col">
                <h2>About us</h2>

                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam sit nonummy
                    nibh euismod tincidunt ut laoreet dolore magna aliquarm erat sit volutpat.</p>
            </div>
            <!-- END BOTTOM ABOUT BLOCK -->

            <!-- BEGIN BOTTOM CONTACTS -->
            <div class="col-md-4 col-sm-6 pre-footer-col">
                <h2>Our Contacts</h2>
                <address class="margin-bottom-40">
                    35, Lorem Lis Street, Park Ave<br>
                    California, US<br>
                    Phone: 300 323 3456<br>
                    Fax: 300 323 1456<br>
                    Email: <a href="mailto:info@metronic.com">info@metronic.com</a><br>
                    Skype: <a href="skype:metronic">metronic</a>
                </address>

                <div class="pre-footer-subscribe-box pre-footer-subscribe-box-vertical">
                    <h2>Newsletter</h2>

                    <p>Subscribe to our newsletter and stay up to date with the latest news and
                        deals!</p>

                    <form action="#">
                        <div class="input-group">
                            <input type="text" placeholder="youremail@mail.com"
                                   class="form-control">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" type="submit">Subscribe</button>
                  </span>
                        </div>
                    </form>
                </div>
            </div>
            <!-- END BOTTOM CONTACTS -->

            <!-- BEGIN TWITTER BLOCK -->
            <div class="col-md-4 col-sm-6 pre-footer-col">
                <h2 class="margin-bottom-0">Latest Tweets</h2>

            </div>
            <!-- END TWITTER BLOCK -->
        </div>
    </div>
</div>
<!-- END PRE-FOOTER -->

<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="container">
        <div class="row">
            <!-- BEGIN COPYRIGHT -->
            <div class="col-md-6 col-sm-6 padding-top-10">
                Metronic Shop UI. ALL Rights Reserved. <a href="#">Privacy Policy</a> | <a
                    href="#">Terms of Service</a>
            </div>
            <!-- END COPYRIGHT -->

        </div>
    </div>
</div>
<!-- END FOOTER -->
<script type="text/javascript">
    var dm_root = "${basePath}";
</script>
<!-- Load javascripts at bottom, this will reduce page load time -->
<!-- BEGIN CORE PLUGINS (REQUIRED FOR ALL PAGES) -->
<!--[if lt IE 9]>
<script src="${basePath}/assets/global/plugins/respond.min.js"></script>
<![endif]-->
<script src="${basePath}/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${basePath}/assets/global/plugins/jquery-migrate.min.js"
        type="text/javascript"></script>
<script src="${basePath}/assets/global/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>

<!-- END CORE PLUGINS -->

<script src="${basePath}/assets/global/scripts/metronic.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="${basePath}/assets/global/plugins/jquery.tmpl.min.js"></script>
<script src="${basePath}/assets/frontend/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${basePath}/assets/frontend/pages/scripts/comment.js" type="text/javascript"></script>
<script type="text/javascript"
        src="${basePath}/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></script>
<script type="text/javascript"
        src="${basePath}/assets/global/plugins/jquery-validation/js/additional-methods.min.js"></script>
<script
        src="${basePath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"
        type="text/javascript"></script>
<script
        src="${basePath}/assets/global/plugins/bootstrap-modal/js/bootstrap-modal.js"
        type="text/javascript"></script>
<script src="${basePath}/assets/dmcms/js/form.js"
        type="text/javascript"></script>
<script src="${basePath}/assets/dmcms/js/modal.js"
        type="text/javascript"></script>
<script type="text/javascript">
    function DmCheck(data) {
        var validate = true;
        if (data.status == "timeout") {
            validate = false;
            alert("session已失效,请重新登录");
            window.location.href = dm_root + "/login";
        }
        if (data.status == 0) {
            if (data.msg != null) {
                validate = false;
                alert(data.msg);
            }
        }
        return validate;
    }
    function showLogin(callback) {
        var modal;
        var formOpts = {
            id: "login_form",//表单id
            name: "login_form",//表单名
            method: "post",//表单method
            action: "${basePath}/ajaxLoginProcess",//表单action
            ajaxSubmit: true,//是否使用ajax提交表单
            labelInline: true,
            rowEleNum: 1,
            beforeSubmit: function () {

            },
            ajaxSuccess: function (data) {
                modal.hide();
                if (typeof(callback) != "undefined") {
                    callback();
                }
                getUserInfo();
            },
            submitText: "登录",//保存按钮的文本
            showReset: false,//是否显示重置按钮
            resetText: "重置",//重置按钮文本
            isValidate: true,//开启验证
            buttons: [{
                type: 'button',
                text: '关闭',
                handle: function () {
                    modal.hide();
                }
            }],
            buttonsAlign: "center",
            //表单元素
            items: [{
                type: 'text',//类型
                name: 'j_username',//name
                id: 'j_username',//id
                label: '用户名',//左边label
                cls: 'input-large',
                rule: {
                    required: true
                },
                message: {
                    required: "请输入登录名"
                }
            }, {
                type: 'password',//类型
                name: 'j_password',//name
                id: 'j_password',//id
                label: '密码',//左边label
                cls: 'input-large',
                rule: {
                    required: true
                },
                message: {
                    required: "请输入密码"
                }
            }]
        };
        modal = $.dmModal({
            id: "loginForm",
            title: "登录",
            width: 600,
            distroy: true
        });
        modal.show();
        var form = modal.$body.dmForm(formOpts);
    }
    function getUserInfo() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: dm_root + "/userInfo",
            success: function (data) {
                if (data.status == "1") {
                    $(".isLogin").show();
                    $(".isNotLogin").hide();
                    $("#userName").text(data.userName);
                } else {
                    $(".isLogin").hide();
                    $(".isNotLogin").show();
                }
            },
            error: function (jqXHR, textStatus, errorMsg) {
            }
        });
    }
    function ajaxLogout() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: dm_root + "/ajaxLogout",
            success: function (data) {
                if (data.status == 1) {
                    $(".isLogin").hide();
                    $(".isNotLogin").show();
                }
            },
            error: function (jqXHR, textStatus, errorMsg) {
            }
        });
    }

    function registerUser() {
        var modal;
        var formOpts = {
            id: "regiester_form",//表单id
            name: "regiester_form",//表单名
            method: "post",//表单method
            action: "${basePath}/ajaxSaveRegister",//表单action
            ajaxSubmit: true,//是否使用ajax提交表单
            labelInline: true,
            rowEleNum: 1,
            beforeSubmit: function () {
            },
            ajaxSuccess: function (data) {
                if (data.status == 1) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: dm_root + "/ajaxLoginProcess",
                        data: {
                            "j_username": $("#username").val(),
                            "j_password": $("#password").val()
                        },
                        success: function (data) {
                            getUserInfo();
                            modal.hide();
                        },
                        error: function (jqXHR, textStatus, errorMsg) {
                        }
                    });
                }
            },
            submitText: "注册",//保存按钮的文本
            showReset: false,//是否显示重置按钮
            resetText: "重置",//重置按钮文本
            isValidate: true,//开启验证
            buttons: [{
                type: 'button',
                text: '关闭',
                handle: function () {
                    modal.hide();
                }
            }],
            buttonsAlign: "center",
            //表单元素
            items: [{
                type: 'text',//类型
                name: 'username',//name
                id: 'username',//id
                label: '登录名',//左边label
                cls: 'input-large'
            }, {
                type: 'password',//类型
                name: 'password',//name
                id: 'password',//id
                label: '密码',//左边label
                cls: 'input-large'
            }, {
                type: 'password',//类型
                name: 'rpassword',//name
                id: 'rpassword',//id
                label: '再次输入密码',//左边label
                cls: 'input-large'
            }, {
                type: 'text',//类型
                name: 'fullname',//name
                id: 'fullname',//id
                label: '昵称',//左边label
                cls: 'input-large'
            }, {
                type: 'text',//类型
                name: 'mobile',//name
                id: 'mobile',//id
                label: '手机',//左边label
                cls: 'input-large'
            }, {
                type: 'text',//类型
                name: 'email',//name
                id: 'email',//id
                label: '电子邮箱',//左边label
                cls: 'input-large'
            }],
            validateOptions: {
                rules: {
                    fullname: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    mobile: {
                        required: true
                    },
                    username: {
                        required: true,
                        remote: {
                            type: "post",
                            url: "${basePath}/checkunique",
                            data: {
                                param: function () {
                                    return $("#username").val();
                                },
                                name: "loginname"
                            },
                            dataType: "html",
                            dataFilter: function (data, type) {
                                if (data == "true")
                                    return true;
                                else
                                    return false;
                            }
                        }
                    },
                    password: {
                        required: true
                    },
                    rpassword: {
                        equalTo: "#password"
                    }
                },
                messages: {
                    fullname: {
                        required: "请输入姓名全称"
                    },
                    username: {
                        required: "请输入用户名",
                        remote: "该用户名已经被注册"
                    },
                    email: {
                        required: "请输入电子邮箱",
                        email: "电子邮箱格式不正确"
                    },
                    mobile: {
                        required: "请输入手机号码"
                    },
                    password: {
                        required: "请输入密码"
                    },
                    rpassword: {
                        equalTo: "密码不一致"
                    }
                }
            }
        };
        modal = $.dmModal({
            id: "registerForm",
            title: "注册用户",
            width: 600,
            distroy: true
        });
        modal.show();
        var form = modal.$body.dmForm(formOpts);
    }
    function getUserInfo() {
        $.ajax({
            type: "POST",
            dataType: "json",
            url: dm_root + "/userInfo",
            success: function (data) {
                if (data.status == "1") {
                    $(".isLogin").show();
                    $(".isNotLogin").hide();
                    $("#userName").text(data.userName);
                } else {
                    $(".isLogin").hide();
                    $(".isNotLogin").show();
                }
            },
            error: function (jqXHR, textStatus, errorMsg) {
            }
        });
    }

    jQuery(document).ready(function () {
        Metronic.init();
        Layout.init();
        Layout.initTwitter();
        Comment.init("${cmsContent.id}", 10);
        getUserInfo();
    });
</script>
<script src="${basePath}/assets/frontend/layout/scripts/back-to-top.js"
        type="text/javascript"></script>
<!-- END PAGE LEVEL JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

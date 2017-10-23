/**
 * Created by cgj on 2015/12/5.
 */
;
var Comment = function (undefined) {

    var pageNum = 1;
    var pageSize = 10;
    var pageCount = 0;
    var contentId;
    var defaultAvatar = dm_root + '/assets/dmcms/img/user.png';

    var convertDate = function (dateTime) {
        if (dateTime == undefined || dateTime == "")
            return "-";
        return new Date(parseInt(dateTime)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " ");
    }

    var commentTmpl = '<div class="media">'
        + '<a href="#" class="pull-left"><img src="${commentUserAvatar_}" alt="头像" class="media-object"></a>'
        + '<div class="media-body">'
        + '<h4 class="media-heading">${commentUserName_} <span>${commentTime_}</span></h4>'
        + '<p class="text"></p>'
        + '<p><br/></p>'
        + '</div></div>';


    var loadComment = function (pageNum, pageSize) {
        var main = $("div[role=comment]").find("div.comments");
        $.ajax({
            type: "GET",
            dataType: "json",
            data: {
                "pageNum": pageNum,
                "pageSize": pageSize,
                "contentId": contentId
            },
            url: main.attr("url"),
            success: function (data) {
                if (data.status == 0) {
                    alert(data.msg);
                    return;
                }
                main.empty();
                var pageInfo = data.pageInfo;
                pageNum = pageInfo.pageNum;
                pageSize = pageInfo.pageSize;
                pageCount = pageInfo.pages;
                $("#pageNum").text(pageNum);
                $("#pageCount").text(pageCount);
                $("#totalCount").text(pageInfo.total);
                if (pageNum <= 1) {
                    $("ul.pager > li.previous").addClass("disabled");
                } else {
                    $("ul.pager > li.previous").removeClass("disabled");
                }
                if (pageNum >= pageCount && pageCount != 0) {
                    $("ul.pager > li.next").addClass("disabled");
                } else {
                    $("ul.pager > li.next").removeClass("disabled");
                }
                var comments = pageInfo.list;
                $.each(comments, function (i, comment) {
                    var commentDiv = $.tmpl(commentTmpl, {
                        "commentUserName_": comment.commentUserName,
                        "commentTime_": convertDate(comment.commentTime),
                        "commentUserAvatar_": (comment.commentUserAvatar == "" ? defaultAvatar : comment.commentUserAvatar)
                    });
                    commentDiv.find("p.text").html(comment.commentText);
                    main.append(commentDiv);
                });
            },
            error: function (jqXHR, textStatus, errorMsg) {
            }
        });
    };

    var postComment = function () {
        if ($.trim($("#commentText").val()) == "") {
            alert("内容不能为空！");
            return;
        }
        $.ajax({
            type: "POST",
            dataType: "json",
            data: {
                "commentText": $("#commentText").val(),
                "contentId": contentId
            },
            url: $("#commentForm").attr("action"),
            success: function (data) {
                if (data.status == "timeout") {
                    alert("当前未登录！请先登录再评论！");
                    showLogin(function () {
                        postComment();
                    });
                    return;
                }
                $("#commentText").val("");
                Metronic.scrollTo($("#pageNum"));
                loadComment(1, pageSize);
            },
            error: function (jqXHR, textStatus, errorMsg) {
            }
        });
    };
    var initEvents = function () {
        $("ul.pager > li.previous").click(function () {
            if ($(this).hasClass("disabled")) {
                return;
            }
            pageNum--;
            loadComment(pageNum, pageSize);
        });
        $("ul.pager > li.next").click(function () {
            if ($(this).hasClass("disabled")) {
                return;
            }
            pageNum++;
            loadComment(pageNum, pageSize);
        });
        $("#commentSubmitBtn").click(function () {
            postComment();
        });
    };

    return {
        //main function to initiate the module
        init: function (contentIdP, pageSizeP) {
            contentId = contentIdP;
            pageSize = pageSizeP;
            loadComment(1, pageSizeP);
            initEvents();
        },
        submitComment: function () {
            postComment();
        }

    };

}();

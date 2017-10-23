;
(function($, window, document, undefined) {
	var root = dm_root + "inbox";
	var currentTitle = "";// 当前导航标题
	var titleRefers = {
		"Compose" : "写信息",
		"ListInbox" : "收件箱",
		"ListSent" : "已发送",
		"ListDraft" : "草稿箱",
		"ListTrash" : "回收站",
		"ListMark" : "星标邮件"
	};
	// all:["checkbox","read","mark","attachment","from","subject","date"]
	var hiddenTds = {
		"ListInbox" : [],
		"ListSent" : [ "read" ],
		"ListDraft" : [ "read", "mark" ],
		"ListTrash" : [],
		"ListMark" : []
	};
	// all:["trash","delete","deleteDraft","forword"]
	var hiddenButtons = {
		"ListInbox" : ["deleteDraft"],
		"ListSent" : [ "deleteDraft" ],
		"ListDraft" : [ "trash", "delete" ],
		"ListTrash" : ["deleteDraft","trash"],
		"ListMark" : ["deleteDraft"]
	};
	var urlRefers = {
		"Compose" : root + "/compose",// 写消息
		"ListInbox" : root + "/listInbox",// 收件箱列表
		"ListSent" : root + "/listSent",// 已发送列表
		"ListDraft" : root + "/listDraft",
		"ListTrash" : root + "/listTrash",
		"ListMark" : root + "/listMark",
		"SendInbox" : root + "/sendInbox",
		"DraftInbox" : root + "/draftInbox",
		"ReadInbox" : root + "/readInbox",
		"Mark" : root + "/mark",
		"CancelMark" : root + "/cancelMark",
		"Trash" : root + "/trash",
		"DeleteInbox" : root + "/deleteInbox",
		"DeleteDraft" : root + "/deleteDraft",
		"CancelTrash" : root + "/cancelTrash",
		"ReplyData" : root + "/replyData",
		"DraftData" : root + "/draftData"
	};
	var typeRefers = {
		"Compose" : "0",
		"ListInbox" : "1",
		"ListSent" : "2",
		"ListDraft" : "3",
		"ListTrash" : "4",
		"ListMark" : "5"
	};
	var tableTmpl = '<table class="table table-striped table-advance table-hover">'
			+ '<thead><tr>'
			+ '<th colspan="${colspan_}">'
			+ '<input type="checkbox" class="mail-group-checkbox" data-set=".mail-checkbox">'
			+ '<div class="btn-group">'
			+ '<button type="button" role="trash" id="trashBtn" class="btn btn-sm default" href="javascript:;">'
			+ '删除</button>'
			+ '<button type="button" role="delete" id="deleteBtn" class="btn btn-sm default" href="javascript:;">'
			+ '彻底删除</button>'
			+ '<button type="button" role="deleteDraft" id="deleteDraftBtn" class="btn btn-sm default" href="javascript:;">'
			+ '删除草稿</button>'
			+ '</div>'
			+ '</th>'
			+ '<th class="pagination-control" colspan="2">'
			+ '<span class="pagination-info"> 当前 ${pageFrom_} 到 ${pageTo_} 共  ${total_} </span> '
			+ '<a class="btn btn-sm blue" role="prev"> <i class="fa fa-angle-left"></i></a> '
			+ '<a class="btn btn-sm blue" role="next"> <i class="fa fa-angle-right"></i> </a>'
			+ '</th>' + '</tr></thead>' + '<tbody></tbody>' + '</table>';
	var trTmpl = '<tr data-messageid="${id_}">'
			+ '<td role="checkbox" style="vertical-align: middle;width:2%;" class="inbox-small-cells"><input type="checkbox" value="${id_}" class="mail-checkbox"/></td>'
			+ '<td role="read" style="vertical-align: middle;width:2%;" class="inbox-small-cells"><i class="fa icon-envelope${open_}"></i></td>'
			+ '<td role="mark" style="vertical-align: middle;width:2%;" class="inbox-small-cells"><i role="mark" mark-state="${markState_}" class="fa fa-star ${mark_}"></i></td>'
			+ '<td role="attachment" style="vertical-align: middle;width:2%;" class="view-message inbox-small-cells attachment"></td>'
			+ '<td role="from" style="vertical-align: middle;width:15%;" class="view-message hidden-xs">${name_}</td>'
			+ '<td role="subject" style="vertical-align: middle;width:42%;" class="view-message">${subject_}</td>'
			+ '<td role="date" style="vertical-align: middle;width:15%;" class="view-message text-right">${date_}</td>'
			+ '</tr>';
	var composeTmpl = '<form class="inbox-compose form-horizontal" id="inboxForm" action="javascript:;" method="POST">'
			+ '<div class="inbox-compose-btn">'
			+ '<button role="sendBtn" type="button" class="btn blue"><i class="fa fa-check"></i>发送</button>'
			+ '<button role="draftBtn" type="button" class="btn">存为草稿</button>'
			+ '</div>'
			+ '<input type="hidden" id="tId" name="tId" />'
			+ '<input type="hidden" id="inboxId" name="inboxId" />'
			+ '<div class="inbox-form-group mail-to">'
			+ '<label class="control-label">收件人:</label>'
			+ '<div class="controls controls-to">'
			+ '<span id="usersSpan"></span>'
			+ '<input type="text" class="form-control" id="toUsers" name="toUsers" style="width:98%;">'
			+ '<span class="inbox-cc-bcc">'
			+ '<span class="inbox-cc"></span>'
			+ '</span>'
			+ '</div>'
			+ '</div>'
			+ '<div class="inbox-form-group">'
			+ '<label class="control-label">主题:</label>'
			+ '<div class="controls">'
			+ '<input type="text" class="form-control" id="subject" name="subject">'
			+ '</div>'
			+ '</div>'
			+ '<div class="inbox-form-group">'
			+ '<textarea class="inbox-editor inbox-wysihtml5 form-control" id="editor_id" name="content" style="height:400px;" rows="12"></textarea>'
			+ '</div>'
			+ '<div class="inbox-compose-attachment">'
			+ '<span class="btn green fileinput-button">'
			+ '<i class="fa fa-plus"></i>'
			+ '<span>添加附件... </span>'
			+ '<input id="fileupload" name="files[]" multiple type="file">'
			+ '</span>'
			+ '<table role="presentation" class="table table-striped margin-top-10"><tbody class="files"></tbody></table>'
			+ '</div>'
			+ '<div class="inbox-compose-attachment"><hr/><input name="saveSent" value="1" checked type="checkbox" class="sent-checkbox"/>保存到已发送</div>'
			+ '<div class="inbox-compose-btn">'
			+ '<button role="sendBtn" type="button" class="btn blue"><i class="fa fa-check"></i>发送</button>'
			+ '<button role="draftBtn" type="button" class="btn">存为草稿</button>'
			+ '</div>';
	var fileTmpl = '<tr class="template-upload fade in">'
			+ '<td style="vertical-align: middle;width:15%;">'
			+ '<p class="name">${fileName_}</p>' + '</td>'
			+ '<td style="vertical-align: middle;width:5%;">'
			+ '    <p class="size">${fileSize_} KB</p>' + '</td>'
			+ '<td style="vertical-align:middle;text-align:center;width:30%;">'
			+ '<p class="progressNum">准备上传</p>' + '</div>' + '</td>'
			+ '<td style="vertical-align: middle;width:40%;">'
			+ '    <button type="button" class="btn btn-primary start">'
			+ '       <i class="icon-upload icon-white"></i>'
			+ '       <span>开始上传</span>' + '    </button>'
			+ '    <button type="button" class="btn btn-warning cancel">'
			+ '       <i class="icon-ban-circle icon-white"></i>'
			+ '       <span >取消</span>' + '    </button>        ' + '</td>'
			+ '<input type="hidden" name="attId" class="att"/>' + '</tr>';
	var fileUploadedTmpl = '<tr class="template-upload fade in">'
			+ '<td style="vertical-align: middle;width:10%;"><span class="preview"><img src="${url_}" width="46" height="40"></span></td>'
			+ '<td style="vertical-align: middle;width:15%;"><p class="name">${name_}</p></td>'
			+ '<td style="vertical-align: middle;width:5%;"><p class="size">${size_}</p></td>'
			+ '<td style="vertical-align:middle;text-align:center;width:30%;"><p class="progressNum">已上传</p></td>'
			+ '<td style="vertical-align: middle;width:40%;"><button type="button" class="btn btn-danger cancel"><span>删除</span></button></td>'
			+ '<input type="hidden" name="attId" class="att" value="${id_}"></tr>';
	var successTmpl = '<div class="portlet light">'
			+ '<div class="portlet-body">' + '<p class="text-left">发送成功！</p>'
			+ '</div></div>';
	var contentTmpl = '<div class="col-md-12">' + '<div class="inbox-content">'
			+ '<div class="inbox-view-info">' + '<div class="row">'
			+ '<div class="col-md-7">'
			+ '<span class="bold">${formUserStr_}</span>'
			+ '发送给 <span class="bold">${toUserStr_}</span>'
			+ '发送时间：<span class="bold">${date_}</span>' + '</div>'
			+ '<div class="col-md-5 inbox-info-btn">'
			+ '<div role="btn-group" class="btn-group">'
			+ '</div></div></div></div>'
			+ '<div class="inbox-view">主题：${subject_}</div>' + '	<hr>'
			+ '<div id="inboxContentDiv" class="inbox-view"></div>' + '	<hr>'
			+ '<div class="inbox-attached">'
			+ '		<div class="margin-bottom-15">'
			+ '			<span>共${aTotal_}个附件</span>'
			+ '			<a id="downloadAll" href="javascript:;">' + '			全部下载 </a>'
			+ '		</div>' + '</div>' + '</div>' + '</div>';
	var attachmentTmpl = '<div class="margin-bottom-25">' + '<div>'
			+ '<strong>${name_}</strong>' + '<span>' + '${size_}</span>'
			+ '<a href="' + dm_root + '/file/download/${id_}">' + '下载 </a>'
			+ '</div>' + '</div>';
	var deleteTmpl = '<span>删除</span>';
	var inboxNav = $(".inbox-nav");// 获取当行的ul元素
	var boxes = inboxNav.find("li.list");// 获取导航的li元素
	var compose = inboxNav.find("li.form");// 获取导航的li元素
	var allNavs = inboxNav.find("li");
	var h1Title = $("#title");// 标题
	var contentDiv = $(".inbox-content");// 内容div
	var loadingDiv = $(".inbox-loading");// 加载中提示的div
	var currentData = {};
	var writeMode = false;
	var pageNum = 1;
	var pageSize = 10;
	// 左侧导航栏注册点击事件
	var regiestClickEvent = function() {
		// 注册非写信息的li点击事件
		$.each(boxes, function(i, item) {
			$(item).on("click", function() {
				currentTitle = $(this).attr("data-title");
				pageNum = 1;
				activeTitle();
				loadContent();
				writeMode = false;
			});
		});
		// 注册写信息点击事件
		compose.on("click", function() {
			currentTitle = $(this).attr("data-title");
			activeTitle();
			initCompose();
		});

		$("body").keydown(function(e) {
			if (e.ctrlKey == true && e.keyCode == 83) {
				if (writeMode) {
					draftInbox();
					return false;
				} else {
					return true;
				}
			}
		});

	};
	// 当点击到某个导航是触发active
	var activeTitle = function() {
		$.each(allNavs, function(i, item) {
			if ($(item).attr("data-title") == currentTitle) {
				$(item).addClass("active");
				h1Title.text(titleRefers[currentTitle]);
			} else {
				$(item).removeClass("active");
			}
		});
	};

	// 加载右侧内容
	var loadContent = function() {
		var url = urlRefers[currentTitle];
		var type = typeRefers[currentTitle];
		readData(url, type);
	};

	// ajax读取内容
	var readData = function(ajaxUrl, type) {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "POST",
			dataType : "json",
			url : ajaxUrl,
			data : {
				"type" : type,
				"pageNum" : pageNum,
				"pageSize" : pageSize
			},
			success : function(data) {
				contentDiv.empty();
				randerContent(data);
				Metronic.unblockUI(contentDiv);
			},
			error : function(e) {
				Metronic.unblockUI(contentDiv);
				alert("异步加载数据异常");
			}
		});
	};
	var markInbox = function(tId, state, callback) {
		$.ajax({
			type : "POST",
			dataType : "json",
			url : urlRefers[state],
			data : {
				"tId" : tId
			},
			success : function(data) {
				if (callback != undefined)
					callback();
			},
			error : function(e) {
				alert("异步加载数据异常");
			}
		});
	};

	var trashInbox = function(tId, state, callback) {
		if (tId.length > 0) {
			bootbox.confirm("确定删除吗？", function(result) {
				if (result) {
					$.ajax({
						type : "POST",
						dataType : "json",
						url : urlRefers[state],
						data : {
							"tId" : String(tId)
						},
						success : function(data) {
							if (callback != undefined)
								callback();
						},
						error : function(e) {
							alert("异步加载数据异常");
						}
					});
				}
			});
		} else {
			bootbox.alert("请选择选项！");
		}
	};

	var deleteInbox = function(tId, state, callback) {
		if (tId.length > 0) {
			$.ajax({
				type : "POST",
				dataType : "json",
				url : urlRefers[state],
				data : {
					"tId" : String(tId)
				},
				success : function(data) {
					if (callback != undefined)
						callback();
				},
				error : function(e) {
					alert("异步加载数据异常");
				}
			});
		} else {
			bootbox.alert("请选择选项！");
		}
	};
	// 渲染表格内容
	var randerContent = function(data) {
		var hTds = hiddenTds[currentTitle];
		var hBts = hiddenButtons[currentTitle];
		var table = $.tmpl(tableTmpl, {
			"colspan_" : (5 - hTds.length),
			"total_" : data.total,
			"pageFrom_" : (data.total == 0 ? "0"
					: ((pageNum - 1) * pageSize + 1)),
			"pageTo_" : ((pageNum * pageSize) > data.total ? data.total
					: (pageNum * pageSize))
		});
		$.each(hBts, function(i, role) {
			table.find("button[role='" + role + "']").remove();
		});
		contentDiv.append(table);
		$.each(data.data, function(i, inbox) {
			var tr = $.tmpl(trTmpl, {
				"id_" : inbox.tId,
				"name_" : inbox.formUserStr,
				"subject_" : inbox.subject,
				"date_" : inbox.formatTime,
				"open_" : (inbox.isRead == "1" ? "-open" : ""),
				"markState_" : inbox.isMark,
				"mark_" : (inbox.isMark == "1" ? "inbox-started" : "")
			});
			$.each(hTds, function(i, role) {
				tr.find("td[role='" + role + "']").remove();
			});
			if (inbox.hasAttachment == "1") {
				var fileIcon = $('<i class="fa fa-paperclip"></i>');
				tr.find("td.attachment").append(fileIcon);
			}
			tr.find("[role='mark']").on(
					"click",
					function(e) {
						var icon = $(this);
						if (icon.attr("mark-state") == "0") {
							markInbox(inbox.tId, "Mark", function() {
								icon.attr("mark-state", "1").attr("class",
										"fa fa-star inbox-started");
							});
						} else {
							markInbox(inbox.tId, "CancelMark", function() {
								icon.attr("mark-state", "0").attr("class",
										"fa fa-star");
							});
						}
						e.stopPropagation();
					});
			tr.click(function() {
				if (inbox.inboxType == typeRefers["ListDraft"]) {
					initCompose(inbox.tId, "draft");
				} else {
					loadInbox(inbox.tId);
				}
			});
			table.find("tbody").append(tr);
		});
		contentDiv.find('.mail-group-checkbox').change(function() {
			var set = $(this).attr("data-set");
			var checked = $(this).is(":checked");
			$(set).each(function() {
				if (checked) {
					$(this).attr("checked", true);
				} else {
					$(this).attr("checked", false);
				}
			});
			$.uniform.update(set);
		});
		contentDiv.find(".mail-checkbox").on("click", function(e) {
			e.stopPropagation();
		});
		var getSelectIds = function() {
			var ids = [];
			var checkboxs = contentDiv.find(".mail-checkbox:checked").each(
					function() {
						ids.push($(this).val());
					});
			return ids;
		};
		$("#trashBtn").on("click", function() {
			var ids = getSelectIds();
			trashInbox(ids, "Trash", function() {
				loadContent();
			});
		});
		$("#deleteBtn").on("click", function() {
			var ids = getSelectIds();
			deleteInbox(ids, "DeleteInbox", function() {
				loadContent();
			});
		});
		$("#deleteDraftBtn").on("click", function() {
			var ids = getSelectIds();
			deleteInbox(ids, "DeleteDraft", function() {
				loadContent();
			});
		});
		table.find("[role='next']").on("click", function() {
			var getTotalPage = function() {
				var totalP = 0;
				var totalcount = data.total;
				if (totalcount % pageSize != 0) {
					totalP = Math.floor(totalcount / pageSize) + 1;
				} else {
					totalP = Math.floor(totalcount / pageSize);
				}
				return totalP;
			};
			if (pageNum < getTotalPage()) {
				pageNum++;
				loadContent();
			}
		});
		table.find("[role='prev']").on("click", function() {
			if (pageNum > 1) {
				pageNum--;
				loadContent();
			}
		});
		uniform();
	};
	// 格式化checkbox
	var uniform = function() {
		if (!$().uniform) {
			return;
		}
		var test = $("input[type=checkbox]:not(.toggle)");
		if (test.size() > 0) {
			test.each(function() {
				$(this).show();
				$(this).uniform();
			});
		}
	};
	// 初始化写信息页面
	var initCompose = function(tId, mode) {
		contentDiv.empty();
		randerCompose();// 渲染内容
		initTags($("#toUsers"));
		initContacts();
		var eidtor = initEditor();// 初始文本功能
		initFileupload();// 初始添加附件功能
		uniform();
		initComposeEvents();
		writeMode = true;
		if (mode == "reply") {
			initReplyInboxData(tId, eidtor);
		} else if (mode == "draft") {
			initDraftInboxData(tId, eidtor);
		} else if (mode == "forward") {
			initForwordInboxData(tId, eidtor);
		}
	};
	// 写信息页面渲染内容
	var randerCompose = function() {
		var composeContent = $.tmpl(composeTmpl, {});
		contentDiv.append(composeContent);
	};
	// 初始添加附件功能
	var initFileupload = function() {
		$('#fileupload').fileupload(
				{
					url : dm_root + '/file/upload',
					autoUpload : true,
					dataType : 'json',
					previewCrop : true,
					add : function(e, data) {
						var templateImpl = $.tmpl(
								fileTmpl,
								{
									"fileName_" : data.files[0].name,
									"fileSize_" : (data.files[0].size / 1000)
											.toFixed(2)
								}).appendTo(".files");
						data.content = templateImpl;
						$(".start", templateImpl).click(function() {
							currentData.bar = templateImpl;
							data.submit();
						});
						$(".cancel", templateImpl).click(function() {
							$('<p/>').text('已取消...').replaceAll($(this));
							data.abort();
							$(templateImpl).remove();
						});

					},
					done : function(e, data) {// 设置文件上传完毕事件的回调函数
						$(".att", data.content).val(data.result.id);
						$(".preview", data.content).find("img").attr("src",
								data.result.fileUrl);
						$(".cancel", data.content).html(deleteTmpl).removeClass("btn-warning").addClass("btn-danger");
						$(".start", currentData.bar).hide();
					},
					progress : function(e, data) {// 设置上传进度事件的回调函数
						var progress = parseInt(data.loaded / data.total * 100,
								10);
						$('.progressNum', currentData.bar).text(
								'上传中，进度：' + progress + '%');
						if (progress == 100) {
							$('.progressNum', currentData.bar).text('上传完毕');
						}
					}
				});
	};
	// 初始文本功能
	var initEditor = function() {
		var editor1;
		KindEditor.ready(function(K) {
			editor1 = K.create('#editor_id', {
				uploadJson : dm_root + '/KE/file_upload',
				fileManagerJson : dm_root + '/KE/file_manager',
				allowFileManager : true,
				items : [
							'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
							'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
							'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
				afterBlur : function() {
					this.sync();
				},
				afterCreate : function() {
					var that = this;
					K.ctrl(this.edit.iframe.get(0).contentWindow.document, 83,
							function() {
								if (writeMode) {
									that.sync();
									draftInbox();
									return false;
								} else {
									return true;
								}
							});
				}
			});
		});
		return editor1;
	};
	// 初始任务信息
	var initTags = function(input) {
		$
				.ajax({
					type : "POST",
					dataType : "json",
					url : dm_root + "/inbox/users",
					success : function(data) {
						var availableTags = data;
						function split(val) {
							return val.split(/;\s*/);
						}
						function extractLast(term) {
							return split(term).pop();
						}
						input
								.bind(
										"keydown",
										function(event) {
											if (event.keyCode === $.ui.keyCode.TAB
													&& $(this).autocomplete(
															"instance").menu.active) {
												event.preventDefault();
											}
										})
								.autocomplete(
										{
											minLength : 1,
											source : function(request, response) {
												response($.ui.autocomplete
														.filter(
																availableTags,
																extractLast(request.term)));
											},
											focus : function() {
												return false;
											},
											select : function(event, ui) {
												var terms = split(this.value);
												terms.pop();
												if (this.value
														.indexOf(ui.item.value) == -1) {
													terms.push(ui.item.value);
												}
												terms.push("");
												this.value = terms.join(";");
												return false;
											}
										});
					},
					error : function(e) {
						alert("加载用户异常");
					}
				});
	};

	var initContacts = function() {
		var button = $('<a class="blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">'
				+ '<i class="icon-users"></i></a>');
		var dropDown = $('<ul class="dropdown-menu pull-right" role="menu"><li><ul class="dropdown-menu-list scroller" style="height: 250px;overflow: auto;" data-handle-color="#637283"></ul></li></ul>');
		$
				.ajax({
					type : "POST",
					dataType : "json",
					url : dm_root + "/inbox/users",
					success : function(data) {
						var users = data;
						var liTmpl = '<li><a href="javascript:;">'
								+ '<span class="details">'
								+ '<span class="label label-sm label-icon label-success" style="padding: 2px;">'
								+ '<i class="fa fa-plus"></i>' + '</span>'
								+ '${user_}</span>' + '</a>' + '</li>';
						/*var spanCard = '<span style="margin: 16px;background-color: rgb(255, 0, 238);">${user_}<a class="close" style="top: 2px;right: initial;position: absolute;" href="javascript:;"></a></span>';*/
						$.each(users, function(i, user) {
							var li = $.tmpl(liTmpl, {
								"user_" : user
							});
							/*var span = $.tmpl(spanCard,{"user_" : user});
							span.find("a").on("click",function(){
								$(this).parent().remove();
								var oldStr = $("#toUsers").val();
								var newStr = oldStr.replace(user+";","");
								$("#toUsers").val(newStr);
							})*/
							li.on("click", function() {
								var oldStr = $("#toUsers").val();
								if (oldStr.indexOf(user) == -1) {
									var newStr = oldStr + user + ";";
									$("#toUsers").val(newStr);
									/*$("#usersSpan").append(span);*/
								}
							});
							dropDown.find(".dropdown-menu-list").append(li);
						});
					}
				});
		contentDiv.find(".inbox-cc").append(button);
		contentDiv.find(".inbox-cc").append(dropDown);
	};
	var initReplyInboxData = function(tId, editor) {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "post",
			url : urlRefers["ReplyData"],
			data : {
				"tId" : tId
			},
			dataType : "json",
			success : function(data) {
				var inbox = data.inbox;
				var attachments = data.attachments;
				var toUserStr = inbox.toUserStr;
				if (toUserStr!=null&&toUserStr!=""&&!toUserStr.endWith(";")) {
					toUserStr += ";";
				}
				$("#toUsers").val(toUserStr);
				$("#subject").val("回复：" + inbox.subject);
				editor.html(inbox.content);
				editor.sync();
				if (attachments.length > 0) {
					$.each(attachments, function(i, attachment) {
						var uploadedFile = $.tmpl(fileUploadedTmpl, {
							"url_" : attachment.url,
							"name_" : attachment.name,
							"size_" : attachment.filesize2,
							"id_" : attachment.id
						}).appendTo(".files");
						$(".cancel", uploadedFile).click(function() {
							$(uploadedFile).remove();
						});
					});
				}
				Metronic.unblockUI(contentDiv);
			},
			error : function(data) {
				alert("异步提交表单错误.");
			}
		});
	};
	var initDraftInboxData = function(tId, editor) {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "post",
			url : urlRefers["DraftData"],
			data : {
				"tId" : tId
			},
			dataType : "json",
			success : function(data) {
				var inbox = data.inbox;
				var attachments = data.attachments;
				var toUserStr = inbox.toUserStr;
				if (toUserStr!=null&&toUserStr!=""&&!toUserStr.endWith(";")) {
					toUserStr += ";";
				}
				$("#toUsers").val(toUserStr);
				$("#subject").val(inbox.subject);
				if (inbox.tId != undefined)
					$("#tId").val(inbox.tId);
				if (inbox.inboxId != undefined)
					$("#inboxId").val(inbox.inboxId);
				editor.html(inbox.content);
				editor.sync();
				if (attachments.length > 0) {
					$.each(attachments, function(i, attachment) {
						var uploadedFile = $.tmpl(fileUploadedTmpl, {
							"url_" : attachment.url,
							"name_" : attachment.name,
							"size_" : attachment.filesize2,
							"id_" : attachment.id
						}).appendTo(".files");
						$(".cancel", uploadedFile).click(function() {
							$(uploadedFile).remove();
						});
					});
				}
				Metronic.unblockUI(contentDiv);
			},
			error : function(data) {
				alert("异步提交表单错误.");
			}
		});
	};

	var initForwordInboxData = function(tId, editor) {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "post",
			url : urlRefers["ReadInbox"],
			data : {
				"tId" : tId
			},
			dataType : "json",
			success : function(data) {
				var inbox = data.inbox;
				var attachments = data.attachments;
				$("#subject").val(inbox.subject);
				if (inbox.tId != undefined)
					$("#tId").val(inbox.tId);
				if (inbox.inboxId != undefined)
					$("#inboxId").val(inbox.inboxId);
				editor.html(inbox.content);
				editor.sync();
				if (attachments.length > 0) {
					$.each(attachments, function(i, attachment) {
						var uploadedFile = $.tmpl(fileUploadedTmpl, {
							"url_" : attachment.url,
							"name_" : attachment.name,
							"size_" : attachment.filesize2,
							"id_" : attachment.id
						}).appendTo(".files");
						$(".cancel", uploadedFile).click(function() {
							$(uploadedFile).remove();
						});
					});
				}
				Metronic.unblockUI(contentDiv);
			},
			error : function(data) {
				alert("异步提交表单错误.");
			}
		});
	};
	var initComposeEvents = function() {
		$("[role='sendBtn']").on("click", function() {
			sendInbox();
		});
		$("[role='draftBtn']").on("click", function() {
			draftInbox();
		});
	};

	var sendInbox = function() {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "post",
			url : urlRefers["SendInbox"],
			data : $('#inboxForm').serialize(),
			dataType : "json",
			success : function(data) {
				Metronic.unblockUI(contentDiv);
				contentDiv.empty();
				var successContent = $.tmpl(successTmpl, {});
				contentDiv.append(successContent);
			},
			error : function(data) {
				alert("异步提交表单错误.");
			}
		});
	};

	var draftInbox = function() {
		Metronic.blockUI({
			target : contentDiv
		});
		$.ajax({
			type : "post",
			url : urlRefers["DraftInbox"],
			data : $('#inboxForm').serialize(),
			dataType : "json",
			success : function(data) {
				Metronic.unblockUI(contentDiv);
				bootbox.alert("保存成功!");
				if (data.tId != undefined)
					$("#tId").val(data.tId);
				if (data.inboxId != undefined)
					$("#inboxId").val(data.inboxId);
			},
			error : function(data) {
				alert("异步提交表单错误.");
			}
		});
	};

	var loadInbox = function(tId) {
		Metronic.blockUI({
			target : contentDiv
		});
		$
				.ajax({
					type : "post",
					url : urlRefers["ReadInbox"],
					data : {
						"tId" : tId
					},
					dataType : "json",
					success : function(data) {
						var inbox = data.inbox;
						var attachments = data.attachments;
						Metronic.unblockUI(contentDiv);
						var content = $.tmpl(contentTmpl, {
							"subject_" : inbox.subject,
							"formUserStr_" : inbox.formUserStr,
							"toUserStr_" : inbox.toUserStr,
							"date_" : inbox.inboxDate,
							"aTotal_" : attachments.length,
							"tId_" : inbox.tId
						});
						if (inbox.inboxType == typeRefers["ListInbox"]) {
							var replyBtn = $('<button class="btn blue reply-btn" id="replyBtn">'
									+ '<i class="fa fa-reply"></i> 回复 </button>');
							content.find('[role="btn-group"]').append(replyBtn);
							var forwardBtn = $('<button class="btn green reply-btn" id="forwardBtn">'
									+ '<i class="fa fa-reply"></i> 转发 </button>');
							content.find('[role="btn-group"]').append(
									forwardBtn);
						} else if (inbox.inboxType == typeRefers["ListSent"]) {
							var forwardBtn = $('<button class="btn green reply-btn" id="forwardBtn">'
									+ '<i class="fa fa-reply"></i> 转发 </button>');
							content.find('[role="btn-group"]').append(
									forwardBtn);
						}
						content.find("#inboxContentDiv").html(inbox.content);
						content.find("#replyBtn").on("click", function() {
							initCompose(inbox.tId, "reply");
						});
						content.find("#forwardBtn").on("click", function() {
							initCompose(inbox.tId, "forward");
						});
						if (attachments.length > 0) {
							$.each(attachments, function(i, attachment) {
								var file = $.tmpl(attachmentTmpl, {
									"url_" : attachment.url,
									"name_" : attachment.name,
									"size_" : attachment.filesize2,
									"id_" : attachment.id
								});
								if (attachment.type == "image/jpeg") {
									var img = $('<img src="' + attachment.url
											+ '">');
									file.prepend(img);
								}
								content.find(".inbox-attached").append(file);
							});
						}
						contentDiv.empty();
						contentDiv.append(content);
					},
					error : function(data) {
						alert("异步提交表单错误.");
					}
				});
	};
	var initJs = function() {
		regiestClickEvent();
	};

	initJs();

})(jQuery, window, document);
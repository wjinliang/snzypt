;
(function($, window, document, undefined) {
	var Inbox = function(element, options) {
		this._setVariable(element, options);
		this._setOptions(this._options);
		this._init();
	};
	Inbox.defaults = {
		maxHeight : '275px',
		viewAllHref : 'javascript:;',
		autoAjax : false,
		interval : "5s"
	};
	Inbox.statics = {
		headTmpl : '<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">'
				+ '<span class="circle">${num_}</span>'
				+ '<span class="corner"></span>' + '</a>',
		ulTmpl : '<ul class="dropdown-menu"></ul>',
		viewAllLiTmpl : '<li class="external">'
				+ '<h3>您有 <strong>${num_}</strong> 条新消息</h3>'
				+ '<a href="${viewAllHref_}">查看所有消息</a>' + '</li>',
		liTmpl : '<li></li>',
		newUlTmpl : '<ul class="dropdown-menu-list scroller" style="height: ${maxHeight_};" data-handle-color="#637283">',
		newLiTmpl : '<li>'
				+ '<a href="javascript:;">'
				+ '<span class="photo"><img src="${avatar_}" class="img-circle" alt="头像"></span>'
				+ '<span class="subject"><span class="from">${userName_}</span><span class="time">${time_}</span></span>'
				+ '<span class="message">${message_}</span>' + '</a>' + '</li>',
		contentTmpl :'<div class="col-md-12">'
					+'<div class="inbox-content">'
					+ '<div class="inbox-view-info">'
					+ '<div class="row">'
					+ '<div class="col-md-12">'
					+ '<span class="bold">${formUserStr_}</span>'
					+ '发送给 <span class="bold">${toUserStr_}</span>'
					+ '发送时间：<span class="bold">${date_}</span>'
					+ '</div>'
					+ '	</div>'
					+ '	</div>'
					+ '	<div class="inbox-view">主题：${subject_}</div>'
					+ '	<hr>'
					+ '	<div class="inbox-view" id="inboxContentDiv"></div>'
					+ '	<hr>'
					+ '	<div class="inbox-attached">'
					+ '		<div class="margin-bottom-15">'
					+ '			<span>共${aTotal_}个附件</span>'
					+ '			<a id="downloadAll" href="javascript:;">'
					+ '			全部下载 </a>'
					+ '		</div>'
					+ '</div>'
					+ '</div>'
					+ '</div>',
		attachmentTmpl : '<div class="margin-bottom-25">'
						+ '<div>'
						+ '<strong>${name_}</strong>'
						+ '<span>'
						+ '${size_}</span>'
						+ '<a href="'+dm_root+'/file/download/${id_}">'
						+ '下载 </a>'
						+ '</div>'
						+ '</div>'
	};
	Inbox.prototype = {
		_setVariable : function(element, options) {
			this.$element = $(element);
			var id = element.id;
			if (id == undefined) {
				id = "dm_inbox_info_" + new Date().getTime();
				this.$element.attr("id", id);
			}
			this._elementId = id;
			this._options = options;
			this._data = undefined;
		},
		_setOptions : function(options) {
			if (options.url == undefined) {
				console.error("url未定义");
				return;
			} else {
				this._url = options.url;
			}
			this._callback = options.callback;
			this._maxHeight = options.maxHeight;
			this._viewAllHref = options.viewAllHref;
			this._autoAjax = options.autoAjax;
			this._interval = options.interval;
		},
		_init : function() {
			this._loadData();
			if (this._autoAjax) {
				this._timerRefresh();
			}
		},
		_timerRefresh : function() {
			var that = this;
			this.$element.everyTime(that._interval, function() {
				that._loadData();
			});
		},
		_loadData : function() {
			var that = this;
			$.ajax({
				type : "POST",
				dataType : "json",
				url : that._url,
				success : function(data) {
					if (!DmCheck(data)) {
						return;
					}
					if (data.status == 1) {
						that.$element.empty();
						that._data = that._dataFormate(data);
						that._renderEles();
						that._regiestEvents();
						that._doCallback();
					} else {
						alert(data.msg);
					}
				},
				error : function(e) {
					alert("异步加载数据异常");
				}
			});
		},
		_dataFormate : function(data) {
			if (data.total == undefined || data.inboxs == undefined) {
				console.error("数据异常");
				return;
			}
			if (data.total > 50) {
				data.total = "N";
			}
			return data;
		},
		_renderEles : function() {
			var that = this;
			var head = $.tmpl(Inbox.statics.headTmpl, {
				"num_" : that._data.total == undefined ? 0 : that._data.total,
			});
			this.$element.append(head);
			var ul = $.tmpl(Inbox.statics.ulTmpl, {});
			// step1
			var viewAllLi = $.tmpl(Inbox.statics.viewAllLiTmpl, {
				"num_" : that._data.total == undefined ? 0 : that._data.total,
				"viewAllHref_" : dm_root+"/inbox/page#inbox"
			});
			ul.append(viewAllLi);

			// step2
			var inboxLi = $.tmpl(Inbox.statics.liTmpl, {});
			var newUl = $.tmpl(Inbox.statics.newUlTmpl, {
				"maxHeight_" : that._maxHeight
			});
			if (this._data.inboxs != undefined) {
				$.each(this._data.inboxs, function(i, inbox) {
					var newLi = $.tmpl(Inbox.statics.newLiTmpl, {
						"avatar_" : inbox.avatar,
						"userName_" : inbox.userName,
						"time_" : inbox.time,
						"message_" : inbox.message
					});
					if (inbox.attch == "1") {
						var fileIcon = $('<i class="fa fa-paperclip"></i>');
						newLi.find(".message").append(fileIcon);
					}
					newLi.on("click",function(){
						that._readInbox(inbox.tId);
					});
					newUl.append(newLi);
				});
			}
			inboxLi.append(newUl);
			ul.append(inboxLi);
			this.$element.append(ul);
		},
		_readInbox : function(tId){
			var that = this;
			$.ajax({
				type : "post",
				url : dm_root + "inbox/readInbox",
				data : {"tId" :tId},
				dataType : "json",
				success : function(data) {
					var inbox = data.inbox;
					var attachments = data.attachments;
					var readModal = $.dmModal({
						title : inbox.subject,
						distroy : true,
						height : "500px"
					});
					var content = $.tmpl(Inbox.statics.contentTmpl, {
						"subject_" : inbox.subject,
						"formUserStr_" : inbox.formUserStr,
						"toUserStr_" : inbox.toUserStr,
						"date_" : inbox.inboxDate,
						"aTotal_" : attachments.length
					});
					content.find("#inboxContentDiv").html(inbox.content);
					if(attachments.length>0){
						$.each(attachments,function(i,attachment){
							var file = $.tmpl(Inbox.statics.attachmentTmpl, {
								"url_" : attachment.url,
								"name_" : attachment.name,
								"size_" : attachment.filesize2,
								"id_" : attachment.id
							});
							if(attachment.type=="image/jpeg"){
								var img= $('<img src="'+attachment.url+'">');
								file.prepend(img);
							}
							content.find(".inbox-attached").append(file);
						});
					}
					readModal.$body.append(content);
					readModal.show();
					that._init();
				},
				error : function(data) {
					alert("异步提交表单错误.");
				}
			});
		},
		_regiestEvents : function() {
			$('[data-hover="dropdown"]').not('.hover-initialized').each(
					function() {
						$(this).dropdownHover();
						$(this).addClass('hover-initialized');
					});
			$('.scroller')
					.each(
							function() {
								if ($(this).attr("data-initialized")) {
									return; // exit
								}
								var height;
								if ($(this).attr("data-height")) {
									height = $(this).attr("data-height");
								} else {
									height = $(this).css('height');
								}
								$(this)
										.slimScroll(
												{
													allowPageScroll : true, 
													size : '7px',
													color : ($(this)
															.attr(
																	"data-handle-color") ? $(
															this)
															.attr(
																	"data-handle-color")
															: '#bbb'),
													wrapperClass : ($(this)
															.attr(
																	"data-wrapper-class") ? $(
															this)
															.attr(
																	"data-wrapper-class")
															: 'slimScrollDiv'),
													railColor : ($(this).attr(
															"data-rail-color") ? $(
															this).attr(
															"data-rail-color")
															: '#eaeaea'),
													position :'right',
													height : height,
													alwaysVisible : ($(this)
															.attr(
																	"data-always-visible") == "1" ? true
															: false),
													railVisible : ($(this)
															.attr(
																	"data-rail-visible") == "1" ? true
															: false),
													disableFadeOut : true
												});

								$(this).attr("data-initialized", "1");
							});
		},
		_doCallback : function() {
			if (this._callback != undefined) {
				this._callback();
			}
		}
	};

	/**
	 * jquery插件扩展 ===================================================
	 */

	var inbox = function(options) {
		options = $.extend(true, {}, Inbox.defaults, options);
		var eles = [];
		this.each(function() {
			var self = this;
			var instance = new Inbox(self, options);
			eles.push(instance);
		});
		return eles[0];
	};

	$.fn.extend({
		'dmInbox' : inbox
	});
})(jQuery, window, document);
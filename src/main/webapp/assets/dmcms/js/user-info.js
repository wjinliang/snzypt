;
(function($, window, document, undefined) {
	var UserInfo = function(element, options) {
		this._setVariable(element, options);
		this._setOptions(this._options);
		this._init();
	};
	UserInfo.defaults = {
		defaultAvatar : dm_root + '/assets/dmcms/img/user.png',
		lis : [ {
			text : "个人中心",
			icon : "icon-user",
			href : dm_root + "center"
		}, {
			text : "退出",
			icon : "icon-key",
			href : dm_root + "logout"
		} ]
	};
	UserInfo.statics = {
		dataTmpl : '<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">'
				+ '<img alt="头像" class="img-circle" src="${avatar_}">'
				+ '<span class="username username-hide-mobile">${userName_}</span>'
				+ '</a>',
		ulTmpl : '<ul class="dropdown-menu dropdown-menu-default"></ul>',
		liTmpl : '<li><a href="${href_}">${text_}</a></li>',
		dividerTmpl : '<li class="divider"></li>',
		badgeTmpl : '<span class="badge badge-danger">${num_}</span>',
		iconTmpl : '<i class="${icon_}"></i>'
	};
	UserInfo.prototype = {

		_setVariable : function(element, options) {
			this.$element = $(element);
			var id = element.id;
			if (id == undefined) {
				id = "dm_user_info_" + new Date().getTime();
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
			this._defaultAvatar = options.defaultAvatar;
			this._lis = options.lis;
			this._callback = options.callback;
		},
		_init : function() {
			this._loadData();
		},
		_loadData : function() {
			var that = this;
			$.ajax({
				type : "POST",
				dataType : "json",
				url : that._url,
				success : function(data) {
					if(!DmCheck(data)){
						return;
					}
					if (data.status == "1") {
						that.$element.empty();
						that._data = data;
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
		_renderEles : function() {
			var that = this;
			// step1
			var dataInfo = $
					.tmpl(
							UserInfo.statics.dataTmpl,
							{
								"avatar_" : (that._data.avatar == undefined||that._data.avatar=="") ? that._defaultAvatar
										: that._data.avatar,
								"userName_" : that._data.userName
							});
			this.$element.append(dataInfo);

			// step2
			var ul = $.tmpl(UserInfo.statics.ulTmpl, {});
			if (this._data.lis != undefined) {
				$.each(this._data.lis, function(i, li) {
					var ele;
					if (li.type == "divider") {
						ele = $.tmpl(UserInfo.statics.dividerTmpl, {});
					} else {
						ele = $.tmpl(UserInfo.statics.liTmpl, {
							"href_" : li.href,
							"text_" : li.text
						});
						if (li.icon != undefined) {
							var icon = $.tmpl(UserInfo.statics.iconTmpl, {
								"icon_" : li.icon
							});
							ele.find("a").prepend(icon);
						}
						if (li.badge != undefined) {
							var badge = $.tmpl(UserInfo.statics.badgeTmpl, {
								"num_" : li.badge
							});
							ele.find("a").append(badge);
						}
					}
					ul.append(ele);
				});
			}
			$.each(this._lis, function(i, li) {
				var ele;
				if (li.type == "divider") {
					ele = $.tmpl(UserInfo.statics.dividerTmpl, {});
				} else {
					ele = $.tmpl(UserInfo.statics.liTmpl, {
						"href_" : li.href,
						"text_" : li.text
					});
					if (li.icon != undefined) {
						var icon = $.tmpl(UserInfo.statics.iconTmpl, {
							"icon_" : li.icon
						});
						ele.find("a").prepend(icon);
					}
					if (li.badge != undefined) {
						var badge = $.tmpl(UserInfo.statics.badgeTmpl, {
							"num_" : li.badge
						});
						ele.find("a").append(badge);
					}
				}
				ul.append(ele);
			});
			this.$element.append(ul);
		},
		_regiestEvents : function() {
			$('[data-hover="dropdown"]').not('.hover-initialized').each(
					function() {
						$(this).dropdownHover();
						$(this).addClass('hover-initialized');
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

	var userInfo = function(options) {
		options = $.extend(true, {}, UserInfo.defaults, options);
		var eles = [];
		this.each(function() {
			var self = this;
			var instance = new UserInfo(self, options);
			eles.push(instance);
		});
		return eles[0];
	};

	$.fn.extend({
		'dmUserInfo' : userInfo
	});
})(jQuery, window, document);

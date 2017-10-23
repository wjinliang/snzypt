;
(function($, window, document, undefined) {
	String.prototype.startWith = function(str) {
		var reg = new RegExp("^" + str);
		return reg.test(this);
	};

	String.prototype.endWith = function(str) {
		var reg = new RegExp(str + "$");
		return reg.test(this);
	};
	// 构造函数
	var DmMenu = function(element, options) {
		// 初始化属性
		this._setVariable(element, options);
		this._setOptions();
		if (this._data != undefined) {
			// 给定数据情况下直接初始化
			this._init();
		} else {
			// 异步加载
			this._load();
		}
	};
	// 默认构造参数
	DmMenu.defaults = {
		iconCls : "fa fa-rss",
		url : undefined,
		activeId : undefined,
		data : undefined,
		leafTmpl : '<li id="li_${id_}" title="${title_}">'
				+ '<a href="javascript:;" data-url="${url_}"><i class="${icon_}"></i>${name_}</a>'
				+ '</li>',
		notLeafTmpl : '<li id="li_${id_}" title="${title_}" class="menu-dropdown classic-menu-dropdown">'
				+ '<a data-hover="megamenu-dropdown" data-close-others="true" data-toggle="dropdown" href="javascript:;" data-url="${url_}"><i class="${icon_}"></i>${name_}<i class="fa fa-angle-down"></i></a>'
				+ '</li>',
		subNotLeafTmpl : '<li id="li_${id_}" title="${title_}" class="dropdown-menu">'
				+ '<a href="javascript:;" data-url="${url_}"><i class="${icon_}"></i>${name_}</a>'
				+ '</li>'
	};
	// 继承属性
	DmMenu.prototype = {
		// 外部调用方法：重新加载菜单
		reload : function(options) {
			this._remove();
			if (options != undefined) {
				this._options = $.extend({}, this._options, options);
				setVariable(this._options, this);
			}
			if (this._url != undefined) {
				this._load();
			} else {
				this._init();
			}
		},
		_setVariable : function(element, options) {
			this.$element = $(element);
			var id = element.id;
			if (id == undefined) {
				id = "dmcms_menu_" + new Date().getTime();
				this.$element.attr("id", id);
			}
			this._elementId = id;
			this._options = options;
			this.$ul = new Object();
		},
		_setOptions : function() {
			if (this._options.data != undefined) {
				// 菜单数据
				if (typeof (this._options.data) == "object") {
					this._data = this._options.data;
				} else {
					this._data = eval("(" + this._options.data + ")");
				}
			}
			// 选中菜单id
			this._activeId = this._options.activeId;
			// 加载菜单路径
			this._url = this._options.url;
			// 菜单默认图标
			this._iconCls = this._options.iconCls;

			this._leafTmpl = this._options.leafTmpl;
			this._notLeafTmpl = this._options.notLeafTmpl;
			this._subNotLeafTmpl = this._options.subNotLeafTmpl;

			this._callback = this._options.callback;
		},
		// 异步加载菜单
		_load : function() {
			var that = this;
			$.ajax({
				type : "POST",
				dataType : "json",
				url : that._url,
				success : function(data) {
					that._data = data;
					that._init();
				},
				error : function(err) {
					console.error(err);
				}
			});
		},
		// 初始化
		_init : function() {
			this._renderVerticalMenus();
			this._initMenuActiveLink();
			this._initEventLisener();
			this._doCallback();
		},
		// 渲染垂直菜单
		_renderVerticalMenus : function() {
			var that = this;
			var ul = $('<ul class="nav navbar-nav"></ul>');
			this.$element.append(ul);
			this.$ul = ul;
			$.each(this._data, function(index, content) {
				if (content.pId == 0) {
					var li;
					if (content.isLeaf) {
						li = $.tmpl(that._leafTmpl, {
							"id_" : content.id,
							"title_" : content.name,
							"url_" : content.url,
							"name_" : content.name,
							"icon_" : (content.icon == undefined ? that.iconCls
									: content.icon)
						});
						that.$ul.append(li);
					} else {
						li = $.tmpl(that._notLeafTmpl, {
							"id_" : content.id,
							"title_" : content.name,
							"url_" : content.url,
							"name_" : content.name,
							"icon_" : (content.icon == undefined ? that.iconCls
									: content.icon)
						});
						that.$ul.append(li);
						that._renderVerticalSubMenus(content.id);
					}
				}
			});
		},
		// 渲染垂直子菜单
		_renderVerticalSubMenus : function(eleId) {
			var that = this;
			$
					.each(
							this._data,
							function(index, content) {
								if (content.pId == eleId) {
									if ($('#ul_' + eleId).length <= 0) {
										$('#li_' + eleId)
												.append(
														'<ul id="ul_'
																+ eleId
																+ '" class="dropdown-menu pull-left"></ul>');
									}
									if (content.isLeaf) {
										li = $
												.tmpl(
														that._leafTmpl,
														{
															"id_" : content.id,
															"title_" : content.name,
															"url_" : content.url,
															"name_" : content.name,
															"icon_" : (content.icon == undefined ? that.iconCls
																	: content.icon)
														});
										$("#ul_" + eleId).append(li);
									} else {
										li = $
												.tmpl(
														that._subNotLeafTmpl,
														{
															"id_" : content.id,
															"title_" : content.name,
															"url_" : content.url,
															"name_" : content.name,
															"icon_" : (content.icon == undefined ? that.iconCls
																	: content.icon)
														});
										$("#ul_" + eleId).append(li);
										that
												._renderVerticalSubMenus(content.id);
									}
								}
							});
		},
		_initMenuActiveLink : function() {
			var url = location.href.toLowerCase();
			var el;
			this.$element
					.find("li > a")
					.each(
							function() {
								var path = $(this).attr("data-url")
										.toLowerCase();
								if (url.indexOf(path) != -1
										&& url.indexOf(path) == (url.length - path.length)) {
									el = $(this);
									return;
								}
							});
			if (!el || el.size() == 0) {
				return;
			}
			// disable active states
			this.$element.find('li.active').removeClass('active');
			this.$element.find('li > a > .selected').remove();
			this.$element.find('li.open').removeClass('open');

			el.parents('li').each(
					function() {
						$(this).addClass('active');
						if ($(this).parent('ul.navbar-nav').size() === 1) {
							$(this).find('> a').append(
									'<span class="selected"></span>');
						}
					});
		},
		// 初始事件
		_initEventLisener : function() {
			// 链接点击事件
			this.$element.find("li > a").on("click", function() {
				var url = $(this).attr("data-url");
				if (url.indexOf("#") == -1) {
					if (url.startWith("/")) {
						url = url.substring(1, url.length);
					}
					var href = dm_root + url;
					window.location.href = href;
				}
			});
			// hover事件
			$('.hor-menu [data-hover="megamenu-dropdown"]').not(
					'.hover-initialized').each(function() {
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
	// 为jquery元素实例添加实例方法
	var menu = function(options) {
		options = $.extend(true, {}, DmMenu.defaults, options);
		var eles = [];
		this.each(function() {
			var self = this;
			var instance = new DmMenu(self, options);
			eles.push(instance);
		});
		return eles[0];
	};
	$.fn.extend({
		'dmMenu' : menu
	});
})(jQuery, window, document);
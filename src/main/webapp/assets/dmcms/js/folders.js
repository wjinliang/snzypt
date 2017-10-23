;
(function($, window, document, undefined) {
	var Folders = function(element, options) {
		this._setVariable(element, options);
		this._setOptions(this._options);
		this._init();
	};

	Folders.defaults = {
		url : undefined,
		cls : "tiles span12",
		bgColor : "yellow",
		itemTmpl : '<div title="${title_}" class="tile bg-${bgColor_}">'
				+ '<div class="tile-body">' 
				+ '<i class="${icon_}"></i>'
				+ '</div>' 
				+ '<div class="tile-object">'
				+ '<div class="name"><font style="font-family: Arial, Helvetica, sans-serif;">${fileName_}</font></div>'
				+ '<div class="number">${createDate_}</div>'
				+ '</div></div>',
		rootPath : "",
		targetPath : "",
		rootFolder : "根目录",
		keyword : "",
		mode : "click", // 点击为click 选择为 select
		rightLis : {}
		
	};
	Folders.statics = {
		"folder" : [ {
			text : "打开",
			handleKey : "open"
		} ],
		"others" : [ {
			text : "下载",
			handleKey : "download"
		}],
		"default" :[{
			text : "重命名",
			handleKey : "rename"
		}]
	};
	Folders.prototype = {
		_init : function() {
			this._wrapCls();
			this._loadData();
		},
		_reload : function(options) {
			if (options != undefined) {
				this._options = $.extend(true,{}, this._options, options);
				this._setOptions(this._options, this);
			}
			this._loadData();
		},
		_setVariable : function(element, options) {
			this.$element = $(element);
			var id = element.id;
			if (id == undefined) {
				id = "metro_folders_" + new Date().getTime();
				this.$element.attr("id", id);
			}
			this._elementId = id;
			this._options = options;

			this.$title = new Object();
			this.$rightMenu = new Object();
			this._rightClickFile = new Object();
			this._liEvents = new Array();
			this._currentFiles = new Array();
			this._currentPath = "";
			this._currentUrl = "";
			this._fakeCurrentPath = "";
		},
		_setOptions : function(options) {
			if (options.url != undefined) {
				this._url = options.url;
			} else {
				console.error("url属性未定义");
				return;
			}
			this._cls = options.cls;
			this._bgColor = options.bgColor;
			this._itemTmpl = options.itemTmpl;
			this._rootPath = options.rootPath;
			this._targetPath = options.targetPath;
			this._mode = options.mode;
			this._rootFolder = options.rootFolder;
			this._keyword = options.keyword;
			this._callback = options.callback;
			this._buttons = options.buttons;
			this._rightLis = options.rightLis;
		},
		_wrapCls : function() {
			this.$element.addClass(this._cls);
		},
		_loadData : function() {
			App.blockUI($("body"));
			var that = this;
			$.ajax({
				type : "POST",
				data : {
					"rootPath" : that._rootPath,
					"targetPath" : that._targetPath,
					"keyword" : that._keyword
				},
				dataType : "json",
				url : that._url,
				success : function(data) {
					if (data.status == "1") {
						that._currentPath = data.currentPath;
						that._currentUrl = data.currentUrl;
						that._fakeCurrentPath = data.fakeCurrentPath;
						that._remove();
						var list = data.list;
						// 按文件类型排序
						list.sort(function(a, b) {
							return b.isFolder - a.isFolder;
						});
						that._currentFiles = list;
						that._render();
						that._regEvents();
						App.unblockUI($("body"));
					} else {
						console.error("请求内部错误");
						App.unblockUI($("body"));
					}
				},
				error : function(err) {
					console.error(err);
					App.unblockUI($("body"));
				}
			});
		},
		_renderTools : function() {
			var that = this;
			var toolsTmpl = '<div class="row-fluid">'
					+ '<div class="span12"><p><h3 style="font-family: Arial, Helvetica, sans-serif;">${bread_}</h3></p></div></div>'
					+ '<div class="row-fluid"><div class="span6">' + '<p class="b">' + '</p>'
					+ '</div>' + '<div class="span6">'
					+ '<form class="form-search">'
					+ '<div class="input-append"></div></form>'
					+ '</div></div>';
			var tools = $.tmpl(toolsTmpl, {
				"bread_" : this._rootFolder + this._fakeCurrentPath
			});

			// 刷新和根目录按钮
			var rootBtn = $('<button type="button" class="btn blue"><i class="icon-home"></i>根目录</button>');
			rootBtn.on("click", function(e) {
				that._reload({
					keyword : "",
					mode : "click",
					targetPath : ""
				});
				e.preventDefault();
			});
			tools.find("p.b").append(rootBtn);
			tools.find("p.b").append("&nbsp;");
			var refreshBtn = $('<button type="button" class="btn blue"><i class="icon-refresh"></i>刷新</button>');
			refreshBtn.on("click", function(e) {
				that._reload({
					mode : "click"
				});
				e.preventDefault();
			});
			tools.find("p.b").append(refreshBtn);
			tools.find("p.b").append("&nbsp;");
			// 刷新和根目录按钮结束
			// 选择文件夹按钮
			var selectBtn = $('<button type="button" show-type="ok" class="btn blue"><i class="icon-ok-circle"></i> 选择文件</button>');
			var selectAllBtn = $('<button type="button" class="btn red"> 全选</button>');
			selectAllBtn.hide();
			selectBtn.on("click", function(e) {
				if ($(this).attr("show-type") == "ok") {
					$(this).removeClass("blue").addClass("red");
					$(this).html('取消');
					$(this).attr("show-type", "cancel");
					selectAllBtn.show();
					that._mode = "select";
				} else {
					$(this).removeClass("red").addClass("blue");
					$(this).html('<i class="icon-ok-circle"></i> 选择文件');
					$(this).attr("show-type", "ok");
					selectAllBtn.hide();
					that._mode = "click";
				}
				that._refreshItemsLinsen();
				e.preventDefault();
			});
			selectAllBtn.on("click", function(e) {
				that.selectAllFiles();
				e.preventDefault();
			});
			tools.find("p.b").append(selectBtn);
			tools.find("p.b").append(selectAllBtn);
			tools.find("p.b").append("&nbsp;");
			// 选择文件夹按钮结束

			// 新建文件夹按钮
			var newFolderBtn = $('<button type="button" class="btn blue">新建文件夹</button>');
			newFolderBtn.on("click", function(e) {
				that._newFolder();
				e.preventDefault();
			});
			tools.find("p.b").append(newFolderBtn);
			tools.find("p.b").append("&nbsp;");
			// 新建文件夹按钮结束

			// 重命名文件夹按钮
			var renameBtn = $('<button type="button" class="btn yellow">重命名</button>');
			renameBtn.on("click", function(e) {
				that._rename();
				e.preventDefault();
			});
			tools.find("p.b").append(renameBtn);
			tools.find("p.b").append("&nbsp;");
			// 重命名文件夹按钮结束

			// 删除文件夹按钮
			var removeBtn = $('<button type="button" class="btn red">删除</button>');
			removeBtn.on("click", function(e) {
				if (that._callback.onRemove != undefined) {
					that._callback.onRemove();
				} else {
					console.error("onRemove方法未定义");
					return;
				}
				e.preventDefault();
			});
			tools.find("p.b").append(removeBtn);
			tools.find("p.b").append("&nbsp;");
			// 删除文件夹按钮结束

			// 加入自定义buttons
			var btnGroup = $('<div class="btn-group"></div>');
			var dropdown = $('<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">'
					+ '操    作  <i class="icon-angle-down"></i></a>');
			var ul = $('<ul class="dropdown-menu"></ul>');
			var liTmpl = '<li title="${text_}"><a href="javascript:void(0);"><i class="${icon_}"></i>${text_}</a></li>';
			if (this._buttons != undefined && this._buttons.length > 0) {
				$.each(this._buttons, function(i, content) {
					var li = $.tmpl(liTmpl, {
						"text_" : content.text,
						"icon_" : content.icon == undefined ? "" : content.icon
					});
					li.on("click", function(e) {
						if (content.handle != undefined) {
							content.handle();
							e.preventDefault();
						}
					});
					li.appendTo(ul);
				});
			}
			btnGroup.append(dropdown);
			btnGroup.append(ul);
			tools.find("p.b").append(btnGroup);
			// 加入自定义buttons结束

			// 搜索栏
			var searchInput = $('<input type="text" placeholder="搜索" class="m-wrap">');
			var searchBtn = $('<button type="button" style="height:34px;" class="btn"><i class="icon-search"></i></button>');
			tools.find("div.input-append").append(searchInput);
			searchInput.val(this._keyword);
			tools.find("div.input-append").append(searchBtn);
			searchBtn.on("click", function(e) {
				that._reload({
					keyword : searchInput.val()
				});
				e.preventDefault();
			});

			this.$element.append(tools);
		},
		_renderBody : function() {
			var that = this;
			var body = $('<div class="row-fluid"><div role="main" class="span12"></div></div>');
			that.$element.append(body);
			data = this._currentFiles;
			if (data.length > 0) {
				$.each(data, function(index, content) {
					var f = new file(that, content, that._itemTmpl);
					if (content.root) {
						that.$element.find("div[role='main']").prepend(
								f.$element);
					} else {
						that.$element.find("div[role='main']").append(
								f.$element);
					}
				});
			}
		},
		_render : function() {
			this._renderTools();
			this._renderBody();
		},
		_regEvents : function() {
			this._rightClickInit();
			this._initLiEvents();
		},
		_refreshItemsLinsen : function() {
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				var f = $(this).data("_instance");
				if (!f._root) {
					f.refreshLinsen();
					f.refresh();
				}
			});
		},
		_newFolder : function() {
			var that = this;
			var content = {
				"fileName" : '新建文件夹',
				"icon" : "icon-folder-close",
			};
			var f = new file(this, content, this._itemTmpl);
			var input = $('<input type="text" class="span12" value="新建文件夹" />');
			input.blur(function(e) {
				if (that._callback.onNewFolder != undefined) {
					that._callback.onNewFolder($(this).val());
				} else {
					console.error("onNewFolder方法未定义");
					return;
				}
				e.preventDefault();
			});
			f.$element.find(".name").html(input);
			this.$element.find("div[role='main']").append(f.$element);
			input.focus();
		},
		_rename : function() {
			var that = this;
			if (this.$element.find("div.selected").length == 0) {
				alert("请选择重命名的文件");
			} else if (this.$element.find("div.selected").length == 1) {
				var f = $(this.$element.find("div.selected")[0]);
				var file = f.data("_instance");
				file._cancelEvents();
				var input = $('<input type="text" class="span12" value="'
						+ file._fileName + '" />');
				input.blur(function(e) {
					if (that._callback.onRename != undefined) {
						that._callback.onRename(that._currentPath,
								file._fileName, $(this).val());
					} else {
						console.error("onRename方法未定义");
						return;
					}
					file._reInitEvents();
					e.preventDefault();
				});
				f.find("div.name").html(input);
				input.focus();
			} else {
				alert("不支持同时重命名多个文件");
			}
		},
		_clickIn : function(targetPath) {
			this._reload({
				targetPath : targetPath,
				mode : "click",
				keyword : ""
			});
		},
		_remove : function() {
			this.$element.html("");
		},
		_rightClickInit : function() {
			var that = this;
			var menu = $('<div id="' + this._elementId + '_rMenu"></div>');
			menu.css({
				"position" : "absolute",
				"visibility" : "hidden",
				"top" : 0,
				"text-align" : "center",
				"padding" : "2px"
			});
			var ul = $('<ul class="dropdown-menu dropdown-context"></ul>');
			menu.append(ul);
			this.$element.append(menu);
			this.$rightMenu = menu;
		},
		_showRMenu : function(x, y) {
			var that = this;
			this.$rightMenu.find("ul").show();
			this.$rightMenu.css({
				"top" : y + "px",
				"left" : x + "px",
				"visibility" : "visible"
			});
			$("body")
					.bind(
							"mousedown",
							function(event) {
								if (!(event.target.id == that._elementId
										+ "_rMenu" || $(event.target).parents(
										"#" + that._elementId + "_rMenu").length > 0)) {
									that.$rightMenu.css({
										"visibility" : "hidden"
									});
								}
							});
		},
		_hideRMenu : function() {
			this.$rightMenu.css({
				"visibility" : "hidden"
			});
			$("body").unbind("mousedown");
		},
		_renderRLis : function(fileTpye) {
			var that = this;
			this.$rightMenu.find("ul").html("");
			if (fileTpye == null || fileTpye == "") {
				fileTpye = "folder";
			}
			var lis;
			if (Folders.statics[fileTpye] == undefined) {
				lis = Folders.statics["others"];
			} else {
				lis = Folders.statics[fileTpye];
			}
			var extraLis;
			if (this._rightLis[fileTpye] == undefined) {
				extraLis = this._rightLis["others"];
			} else {
				extraLis = this._rightLis[fileTpye];
			}
			var extraDefaultLis;
			if(this._rightLis["default"]!=undefined){
				extraDefaultLis = this._rightLis["default"];
			}
			var defaultlis = Folders.statics["default"];
			
			var liTmpl = '<li class="nav-header"><a>${text_}</a></li>';
			if(lis!=undefined&&lis.length>0){
				$.each(lis, function(i, content) {
					var li = $.tmpl(liTmpl, {
						"text_" : content.text
					});
					li.css("cursor", "pointer");
					li.bind("click", function(e) {
						that._hideRMenu();
						that._rightClickFile.select();
						that._liEvents[content.handleKey](that._rightClickFile);
						e.preventDefault();
					});
					that.$rightMenu.find("ul").append(li);
				});
			}
			
			if(extraLis!=undefined&&extraLis.length>0){
				$.each(extraLis, function(i, content) {
					var li = $.tmpl(liTmpl, {
						"text_" : content.text
					});
					li.css("cursor", "pointer");
					li.bind("click", function(e) {
						that._hideRMenu();
						that._rightClickFile.select();
						content.handle(that._rightClickFile);
						e.preventDefault();
					});
					that.$rightMenu.find("ul").append(li);
				});
			}
			
			if(defaultlis!=undefined&&defaultlis.length>0){
				$.each(defaultlis, function(i, content) {
					var li = $.tmpl(liTmpl, {
						"text_" : content.text
					});
					li.css("cursor", "pointer");
					li.bind("click", function(e) {
						that._hideRMenu();
						that._rightClickFile.select();
						that._liEvents[content.handleKey](that._rightClickFile);
						e.preventDefault();
					});
					that.$rightMenu.find("ul").append(li);
				});
			}
			
			if(extraDefaultLis!=undefined&&extraDefaultLis.length>0){
				$.each(extraDefaultLis, function(i, content) {
					var li = $.tmpl(liTmpl, {
						"text_" : content.text
					});
					li.css("cursor", "pointer");
					li.bind("click", function(e) {
						that._hideRMenu();
						that._rightClickFile.select();
						content.handle(that._rightClickFile);
						e.preventDefault();
					});
					that.$rightMenu.find("ul").append(li);
				});
			}
			
		},
		_initLiEvents : function() {
			this._liEvents["open"] = this._openEvent;
			this._liEvents["download"] = this._downloadEvent;
			this._liEvents["rename"] = this._renameEvent;
		},
		_openEvent : function(file) {
			if (file._type == "") {
				file.Folders._reload({
					targetPath : file._filePath,
					mode : "click",
					keyword : ""
				});
			}
		},
		_downloadEvent : function(file) {
			window.open(file._fullUrl);
			file.refresh();
		},
		_renameEvent : function(file){
			file.Folders._rename();
		},
		getAllFiles : function(){
			var files = new Array();
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				var f = $(this).data("_instance");
				if(!f._root)
					files.push(f);
			});
		},
		getSelectedFiles : function() {
			var files = new Array();
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				if($(this).data("selected")){
					var f = $(this).data("_instance");
					files.push(f);
				}
			});
			return files;
		},
		getSelectedFileNames : function() {
			var names = [];
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				if($(this).data("selected")){
					var f = $(this).data("_instance");
					names.push(f._fileName);
				}
			});
			return names;
		},
		selectAllFiles : function(){
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				var f = $(this).data("_instance");
				if(!f._root){
					f.select();	
				}
			});
		},
		refreshFiles : function(){
			this.$element.find(".tile.bg-" + this._bgColor).each(function() {
				if($(this).data("selected")){
					var f = $(this).data("_instance");
					f.refresh();
				}
			});
		},
		reload : function() {
			this._reload({
				mode : "click"
			});
			this._refreshItemsLinsen();
		},
		newFolder : function() {
			this._newFolder();
		}
	};

	/**
	 * 文件部分 ========================================================
	 */
	String.prototype.fileSize = function() {
		var size = parseFloat(this);
		var rank = 0;
		var rankchar = 'B';
		while (size > 1024) {
			size = size / 1024;
			rank++;
		}
		if (rank == 1) {
			rankchar = "KB";
		} else if (rank == 2) {
			rankchar = "MB";
		} else if (rank == 3) {
			rankchar = "GB";
		}
		return size.toFixed(1) + rankchar;
	};
	var file = function(that, content, template) {
		this.Folders = that;
		this._fileName = content.fileName == undefined ? "未命名"
				: content.fileName;
		this._filePath = content.filePath == undefined ? "" : content.filePath;
		this._fullUrl = that._currentUrl + "/" + this._fileName;
		this._fullPath = that._currentPath + "/" + this._fileName;
		this._createDate = content.createDate == undefined ? ""
				: content.createDate;
		this._icon = content.icon == undefined ? "icon-file" : content.icon;
		this._isFolder = content.isFolder == undefined ? false
				: content.isFolder;
		this._root = content.root == undefined ? false : content.root;
		this._size = content.size == undefined ? "0kb" : String(content.size)
				.fileSize();
		var type = "";
		if (!this._isFolder) {
			type = this._fileName.substring(this._fileName.lastIndexOf("."));
		}
		this._type = type;
		this._template = template;
		this.$element = new Object();
		this._init();
	};

	file.prototype = {
		_init : function() {
			this._render();
			this._data();
			this._listen();
		},
		_render : function() {
			var that = this;
			try {
				var fileName = this._fileName;
				if (fileName.length > 11) {
					fileName = fileName.substring(0, 10) + "...";
				}
				var title = this._fileName;
				if (!this._isFolder) {
					title = this._fileName + "," + this._size;
				}
				this.$element = $.tmpl(this._template, {
					"fileName_" : fileName,
					"title_" : title,
					"createDate_" : that._createDate,
					"icon_" : that._icon,
					"bgColor_" : that.Folders._bgColor
				});
			} catch (error) {
				console.error("itemTmpl内部错误");
			}
		},
		_data : function() {
			this.$element.data("_instance", this);
		},
		_regiestClickModeEvents : function() {
			var that = this;
			if (!that._root) {
				this.$element
						.on(
								"contextmenu",
								function(event) {
									var x = event.pageX
											|| (event.clientX + (document.documentElement.scrollLeft || document.body.scrollLeft));
									var y = event.pageY
											|| (event.clientY + (document.documentElement.scrollTop || document.body.scrollTop));
									event.preventDefault();
									that.Folders._rightClickFile = that;
									that.Folders._renderRLis(that._type);
									that.Folders._showRMenu(x, y);
								});
			}
			this.$element.on("click", function(e) {
				if (that._isFolder) {
					that.Folders._clickIn(that._filePath);
				} else {
					if (that.Folders._callback.onFileClick != undefined) {
						that.Folders._callback.onFileClick(
								that.Folders._currentPath, that._fileName,
								that._type);
					} else {
						console.warn("onFileClick方法未定义");
						return;
					}
				}
				e.preventDefault();
			});
		},
		_regiestSelectModeEvents : function() {
			var that = this;
			this.$element.on("click", function(e) {
				if (that._root == false) {
					if ($(this).data("selected") != undefined
							&& $(this).data("selected")) {
						$(this).removeClass("selected");
						$(this).find(".corner").remove();
						$(this).find(".check").remove();
						$(this).data("selected", false);
					} else {
						$(this).addClass("selected");
						var corner = $('<div class="corner"></div>');
						var check = $('<div class="check"></div>');
						$(this).prepend(check);
						$(this).prepend(corner);
						$(this).data("selected", true);
					}
				}
			});
		},
		_listen : function() {
			var that = this;
			if (this.Folders._mode == "click") {
				this._regiestClickModeEvents();
			} else {
				this._regiestSelectModeEvents();
			}
		},
		_cancelEvents : function(){
			this.$element.unbind("click");
			this.$element.unbind("contextmenu");
		},
		_reInitEvents : function(){
			var that = this;
			if (this.Folders._mode == "click") {
				this._regiestClickModeEvents();
			} else {
				this._regiestSelectModeEvents();
			}
		},
		select : function(){
			this.$element.addClass("selected");
			var corner = $('<div class="corner"></div>');
			var check = $('<div class="check"></div>');
			this.$element.prepend(check);
			this.$element.prepend(corner);
			this.$element.data("selected", true);
		},
		refresh : function() {
			var that = this;
			this.$element.removeClass("selected");
			this.$element.find(".corner").remove();
			this.$element.find(".check").remove();
			this.$element.data("selected", false);
			if (this.Folders._mode == "click") {
				this.$element.css("border-color", "");
			} else {
				this.$element.css("border-color", "#FF6A6A");
			}
		},
		refreshLinsen : function() {
			var that = this;
			this._cancelEvents();
			this._reInitEvents();
		}
	};

	/**
	 * jquery插件扩展 ===================================================
	 */

	var folders = function(options) {
		options = $.extend(true,{},Folders.defaults, options);
		var eles = [];
		this.each(function() {
			var self = this;
			var instance = new Folders(self, options);
			eles.push(instance);
		});
		return eles[0];
	};

	$.fn.extend({
		'folders' : folders
	});
})(jQuery, window, document);
/**
 * Created by cgj on 2015/12/9.
 */
;
(function ($, window, document, undefined) {
    'use strict';

    String.prototype.startWith = function (s) {
        if (s == null || s == "" || this.length == 0 || s.length > this.length)
            return false;
        if (this.substr(0, s.length) == s)
            return true;
        else
            return false;
        return true;
    }
    String.prototype.endWith = function (s) {
        if (s == null || s == "" || this.length == 0 || s.length > this.length)
            return false;
        if (this.substring(this.length - s.length) == s)
            return true;
        else
            return false;
        return true;
    }
    var getSimplePath = function (path) {
        if (path == undefined)
            return "";
        path = path.replace(/\\/g, "/").replace(/\/\//g, "/");
        if (path.startWith("/"))
            path = path.substring(1);
        if (path.endWith("/"))
            path = path.substring(0, path.length - 1);
        return path;
    }
    var getPostfix = function (name) {
        return name.substring(name.lastIndexOf(".") + 1).toLowerCase();
    }
    var getWithoutPostfix = function (name) {
        return name.substring(0, name.lastIndexOf("."));
    }
    var getShortName = function (name) {
        return name.substring(0, (name.length > 15 ? 15 : name.length)) + (name.length > 15 ? "..." : "");
    }
    var FileManager = function (element, options) {
        options = options || {};
        this.$element = $(element);
        this.options = $.extend(true, {}, FileManager.defaults, options);
        this.$pathNav;
        this.pathNavArray;
        this.currentFolder;
        this.contextMenu;
        this.currentPath;
        if (!this.validate()) {
            return;
        }
        this.init();
        return this;
    }

    FileManager.defaults = {
        "rootPath": "",
        "currentPath": "",
        "height": 500,
        "useContextMenu": true,
        "contextMenuOption": {}
    }
    FileManager.url = {
        folder: "./folder",
        createFolder: "./createFolder",
        rename: "./rename",
        deleteFile: "./deleteFile",
        deleteFolder: "./deleteFolder",
        download: "./download",
        zip: "./zip",
        unCompress: "./unCompress"
    }

    FileManager.tpl = {
        pathNav: {
            ul: '<ul class="page-breadcrumb breadcrumb"></ul>',
            li: '<li><a href="javascript:void(0);"><font style="font-size:20px;font-family: Arial, Helvetica, sans-serif;">${nav_}</font></a><i style="font-size: 20px;" class="fa fa-angle-right"></i></li>',
            rootNavLi: '<li><a href="javascript:void(0);"><font style="font-size:20px;font-family: Arial, Helvetica, sans-serif;">资源根目录</font></a><i style="font-size: 20px;" class="fa fa-angle-right"></i></li>'
        },
        Folder: {
            container: '<div class="tiles"></div>',
            folder: '<div class="tile bg-yellow-saffron">' +
            '<div class="tile-body"><i class="fa fa-folder-open-o"></i></div>' +
            '<div class="tile-object"><div class="name">返回</div></div>' +
            '</div>'
        },
        File: {
            file: '<div class="tile bg-red-sunglo" title="${title_}">' +
            '<div class="tile-body"> <i class="fa ${icon_}"></i> </div> ' +
            '<div class="tile-object"> <div class="name">${name_} </div></div> ' +
            '</div>',
            folder: '<div class="tile bg-yellow-saffron" title="${title_}">' +
            '<div class="tile-body"> <i class="fa icon-folder"></i> </div> ' +
            '<div class="tile-object"> <div class="name">${name_} </div></div> ' +
            '</div>'
        },
        ContextMenu: {
            container: '<div></div>',
            ul: '<ul class="dropdown-menu" role="menu">',
            file: '<li class="file"><a href="javascript:void(0);"><i class="${icon_}"></i> <span>${text_}</span> </a></li>',
            folder: '<li class="folder"><a href="javascript:void(0);"><i class="${icon_}"></i> <span>${text_}</span> </a></li>',
            fileAndFolder: '<li class="file folder"><a href="javascript:void(0);"><i class="${icon_}"></i> <span>${text_}</span> </a></li>',
            desk: '<li class="desk"><a href="javascript:void(0);"><i class="${icon_}"></i> <span>${text_}</span> </a></li>'
        }
    }

    FileManager.prototype = {
        constructor: FileManager,
        validate: function () {
            this.rootPath = this.options.rootPath;
            this.currentPath = this.options.currentPath;
            return true;
        },
        render: function () {
            this.$element.css("height", this.options.height).addClass("scroller").attr("data-always-visible", 1).attr("data-rail-visible", 1);
            this.contextMenu = this.getContextMenu();
            if (this.contextMenu != null)
                this.$element.parent().append(this.contextMenu.$element);
            this.$pathNav = this.getPathNav(this.currentPath);
            this.$element.append(this.$pathNav);
            this.currentFolder = this.getFolder(this.currentPath);
            this.$element.append(this.currentFolder.$element);
        },
        getContextMenu: function () {
            return this.options.useContextMenu ? new ContextMenu(this.options.contextMenu, this) : null;
        },
        getPathNav: function (currentPath) {
            var that = this;
            var navUl = $.tmpl(FileManager.tpl.pathNav.ul);
            var path = getSimplePath(currentPath);
            var rootNavLi = $.tmpl(FileManager.tpl.pathNav.rootNavLi);
            rootNavLi.data("path", "");
            navUl.append(rootNavLi);
            if (path == "") {
                rootNavLi.find("i").remove()
                return navUl;
            }
            this.pathNavArray = path.split("/");
            var levelPath = "";
            for (var i = 0; i < this.pathNavArray.length; i++) {
                var navLi = $.tmpl(FileManager.tpl.pathNav.li, {
                    "nav_": this.pathNavArray[i]
                });
                if (i == (this.pathNavArray.length - 1)) {
                    navLi.find("i").remove();
                }
                navUl.append(navLi);
                levelPath += (this.pathNavArray[i] + "/");
                navLi.data("path", levelPath);
            }
            return navUl;
        },
        getFolder: function (currentPath) {
            return new Folder(currentPath, this);
        },
        enterFolder: function (targetPath) {
            targetPath = "" + targetPath;
            this.currentPath = targetPath;
            this.$pathNav.remove();
            this.$pathNav = this.getPathNav(targetPath).hide();
            this.$element.append(this.$pathNav.fadeIn());
            this.currentFolder.$element.fadeOut().remove();
            this.currentFolder = this.getFolder(this.currentPath, this);
            this.currentFolder.$element.hide();
            this.$element.append(this.currentFolder.$element.fadeIn());
            this.listen();
        },
        listen: function () {
            var that = this;
            this.$pathNav.find("li").on("click", function (e) {
                e.stopPropagation();
                that.enterFolder($(this).data("path"));
            });
        },
        init: function () {
            this.render();
            this.listen();
        }
    }

    var Folder = function (currentPath, manager) {
        this.manager = manager;
        this.$element;
        this.parentPath;
        this.name;
        this.currentPath = getSimplePath(currentPath);
        this.rootPath = manager.rootPath;
        if (this.currentPath.indexOf("/") != -1) {
            this.parentPath = currentPath.substring(0, currentPath.lastIndexOf("/"));
            this.name = currentPath.substring(currentPath.lastIndexOf("/") + 1);
        } else {
            this.parentPath = "";
            this.name = this.currentPath;
        }
        this.$returnFolder;
        this.files = [];
        this.init();
        return this;
    }

    Folder.prototype = {
        constructor: Folder,
        init: function () {
            this.render();
            this.listen();
        },
        render: function () {
            var that = this;
            //load return folder
            this.$element = $.tmpl(FileManager.tpl.Folder.container);
            if (this.currentPath != "") {
                this.$returnFolder = $.tmpl(FileManager.tpl.Folder.folder);
                this.$element.append(this.$returnFolder);
            }
            Metronic.blockUI({
                target: that.manager.$element
            });
            this.files = [];
            //load files
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.folder,
                data: {
                    "rootPath": this.rootPath,
                    "targetPath": this.currentPath
                },
                success: function (data) {
                    if (data.length > 0) {
                        $.each(data, function (i, file) {
                            var f = new File(file, that);
                            that.$element.append(f.$element);
                            that.files.push(f);
                        });
                    }
                    Metronic.unblockUI(that.manager.$element);
                }
            });
        },
        enterSubFolder: function (subfolderName) {
            this.manager.enterFolder(this.currentPath + "/" + subfolderName)
        },
        returnParent: function () {
            this.manager.enterFolder(this.parentPath);
        },
        getAllFiles: function () {
            return this.files;
        },
        getSelectedFiles: function () {
            var selectedFiles = [];
            $.each(this.getAllFiles(), function (i, file) {
                if (file.selected())
                    selectedFiles.push(file);
            });
            return selectedFiles;
        },
        unSelectAll: function () {
            $.each(this.getAllFiles(), function (i, file) {
                if (file.selected())
                    file.unSelect();
            });
        },
        listen: function () {
            var that = this;
            if (this.currentPath != "") {
                this.$returnFolder.on("click", $.proxy(this.returnParent, this));
            }
        },
        createFolder: function () {
            var newFoldeData = {
                name: "新建文件夹",
                isDirectory: true
            };
            var folder = new File(newFoldeData, this);
            this.$element.append(folder.$element);
            folder.namingFolder();
        },
        zip: function (name, zipName) {
            var that = this;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.zip,
                data: {
                    "folderPath": this.currentPath,
                    "name": name.toString(),
                    "zipName": zipName
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.refresh();
                    }
                }
            });
        },
        refresh: function () {
            this.manager.enterFolder(this.currentPath);
        }
    }

    var File = function (data, folder) {
        this.folder = folder;
        this.$element;
        this.data = data;
        this.name = this.data.name;
        this.isDirectory = this.data.isDirectory
        this.init();
        return this;
    }

    File.icon = {
        ico: "fa-file-image-o",
        gif: "fa-file-image-o",
        png: "fa-file-image-o",
        jpg: "fa-file-image-o",
        jar: "fa-file-zip-o",
        zip: "fa-file-zip-o",
        rar: "fa-file-zip-o",
        css: "fa-css3",
        js: "fa-file-code-o",
        txt: "fa-file-text",
        ftl: "fa-file-text",
        html: "fa-file-text",
        xml: "fa-file-text",
        jsp: "fa-file-text"
    }

    File.prototype = {
        constructor: FileManager,
        init: function () {
            this.render();
            this.listen();
        },
        render: function () {
            var that = this;
            if (this.isDirectory) {
                var folder = $.tmpl(FileManager.tpl.File.folder, {
                    "name_": getShortName(this.data.name),
                    "title_": this.data.name,
                });
                this.$element = folder;
            } else {
                var profix = getPostfix(this.data.name);
                this.$element = $.tmpl(FileManager.tpl.File.file, {
                    "name_": getShortName(this.data.name),
                    "title_": this.data.name,
                    "icon_": File.icon[profix] == undefined ? "fa-file-o" : File.icon[profix]
                });
            }
            this.$element.data("file", this);
        },
        listen: function () {
            var that = this;
            var TimeFn = null;
            this.$element.on("click", $.proxy(function () {
                clearTimeout(TimeFn);
                TimeFn = setTimeout($.proxy(function () {
                    if (this.selected()) {
                        this.unSelect();
                    } else {
                        this.select();
                    }
                }, this), 200);
            }, this));
            this.$element.on("dblclick", $.proxy(function () {
                clearTimeout(TimeFn);
                if (this.isDirectory) {
                    this.enter();
                } else {
                    //todo file ondblclick event
                }
            }, this));
        },
        select: function () {
            var selectDiv = $('<div class="corner"></div><div class="check"></div>');
            this.$element.addClass("selected");
            this.$element.prepend(selectDiv);
        },
        unSelect: function () {
            this.$element.removeClass("selected");
            this.$element.find(".corner,.check").remove();
        },
        selected: function () {
            return this.$element.hasClass("selected") ? true : false;
        },
        open: function () {
            alert("打开->" + this.name);
        },
        enter: function () {
            if (this.isDirectory)
                this.folder.enterSubFolder(this.name);
        },
        namingFolder: function () {
            this.$element.off("click").off("dblclick");
            var text = this.$element.find(".name").text();
            var input = $('<input class="form-control" value="' + text + '">');
            this.$element.find(".name").empty().append(input);
            input.on("blur", $.proxy(this.onNameFolder, this));
            input.select();
        },
        onNameFolder: function () {
            var folderName = this.$element.find(".name > input").val();
            var that = this;
            var dirPath = getSimplePath(this.folder.rootPath + "/" + this.folder.currentPath + "/" + folderName);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.createFolder,
                data: {
                    "dirPath": dirPath
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.folder.refresh();
                    }
                }
            });
        },
        renaming: function () {
            this.$element.off("click").off("dblclick");
            var oldName = this.name;
            var input = $('<input class="form-control" value="' + oldName + '">');
            this.$element.find(".name").empty().append(input);
            input.on("blur", $.proxy(this.onRename, this, oldName));
            input.select();
        },
        onRename: function (oldName) {
            var newName = this.$element.find(".name > input").val();
            var that = this;
            var folderPath = getSimplePath(this.folder.rootPath + "/" + this.folder.currentPath);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.rename,
                data: {
                    "folderPath": folderPath,
                    "oldName": oldName,
                    "newName": newName
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.folder.refresh();
                    }
                }
            });
        },
        deleteFile: function () {
            var that = this;
            var filePath = getSimplePath(that.folder.rootPath + "/" + that.folder.currentPath + "/" + that.name);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.deleteFile,
                data: {
                    "filePath": filePath
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.$element.removeData("file");
                        that.$element.remove();
                    }
                }
            });
        },
        deleteFolder: function () {
            var that = this;
            var dirPath = getSimplePath(that.folder.rootPath + "/" + that.folder.currentPath + "/" + that.name);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.deleteFolder,
                data: {
                    "dirPath": dirPath
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.$element.removeData("file");
                        that.$element.remove();
                    }
                }
            });
        },
        download: function () {
            var folderPath = getSimplePath(this.folder.rootPath + "/" + this.folder.currentPath);
            var fileName = this.name;
            window.open(FileManager.url.download + "?folderPath=" + folderPath + "&fileName=" + fileName);
        },
        unCompress: function () {
            var that = this;
            var folderPath = getSimplePath(that.folder.rootPath + "/" + that.folder.currentPath);
            $.ajax({
                type: "POST",
                dataType: "json",
                url: FileManager.url.unCompress,
                data: {
                    "folderPath": folderPath,
                    "name": that.name
                },
                success: function (data) {
                    if (data.status == 1) {
                        that.folder.refresh();
                    }
                }
            });
        }
    }

    var ContextMenu = function (option, manager) {
        this.$element;
        this.manager = manager;
        this.targetFiles = [];
        this.targetFiles;
        this.init();
        return this;
    }
    ContextMenu.systemOption = {
        items: [
            {
                text: "打开",
                onClick: function (currentFolder, targetFiles, targetFile) {
                    if (targetFile.isDirectory) {
                        currentFolder.enterSubFolder(targetFile.name);
                    } else {
                        targetFile.open();
                    }
                },
                showType: "fileAndFolder"// file,folder,fileAndFolder,desk
            }, {
                text: "解压到当前文件夹",
                onClick: function (currentFolder, targetFiles, targetFile) {
                    if (targetFile.isDirectory) {
                        return;
                    } else {
                        targetFile.unCompress();
                    }
                },
                showType: "file",// file,folder,fileAndFolder,desk
                fileType: "zip,rar"
            }, {
                text: "压缩",
                textHandle: function (currentFolder, targetFiles, targetFile) {
                    if (targetFiles.length == 0) {
                        return "";
                    } else if (targetFiles.length == 1) {
                        if (targetFile.isDirectory) {
                            return "压缩到\"" + targetFile.name + ".zip\"";
                        } else {
                            return "压缩到\"" + getWithoutPostfix(targetFile.name) + ".zip\"";
                        }
                    } else {
                        return "压缩到\"" + (currentFolder.name == "" ? "根目录" : currentFolder.name) + ".zip\"";
                    }
                },
                onClick: function (currentFolder, targetFiles, targetFile) {
                    var zipName;
                    if (targetFiles.length == 0) {
                        return;
                    } else if (targetFiles.length == 1) {
                        if (targetFile.isDirectory) {
                            zipName = targetFile.name;
                        } else {
                            zipName = getWithoutPostfix(targetFile.name);
                        }
                        currentFolder.zip(targetFile.name, zipName);
                    } else {
                        var names = [];
                        $.each(targetFiles, function (i, file) {
                            names.push(file.name);
                        });
                        zipName = currentFolder.name == "" ? "根目录" : currentFolder.name;
                        currentFolder.zip(names, zipName);
                    }
                },
                showType: "fileAndFolder"// file,folder,fileAndFolder,desk
            },
            {
                text: "重命名",
                onClick: function (currentFolder, targetFiles, targetFile) {
                    targetFile.renaming();
                },
                showType: "fileAndFolder"// file,folder,fileAndFolder,desk
            }, {
                text: "删除",
                onClick: function (currentFolder, targetFiles, targetFile) {
                    bootbox.confirm("确定删除吗？", function (result) {
                        if (result) {
                            $.each(targetFiles, function (i, file) {
                                if (file.isDirectory) {
                                    file.deleteFolder();
                                } else {
                                    file.deleteFile();
                                }
                            });
                        }
                    });
                },
                showType: "fileAndFolder"// file,folder,fileAndFolder,desk
            },
            /*{
                text: "下载",
                onClick: function (currentFolder, targetFiles, targetFile) {
                    targetFile.download();
                },
                showType: "file"
            },*/
            {
                text: "刷新",
                onClick: function (currentFolder) {
                    currentFolder.refresh();
                },
                showType: "desk"
            },
            {
                text: "新建文件夹",
                onClick: function (currentFolder) {
                    currentFolder.createFolder();
                },
                showType: "desk"
            }
        ]
    }

    ContextMenu.prototype = {
        init: function () {
            this.render();
            this.listen();
        },
        render: function () {
            var that = this;
            var option = that.manager.options.contextMenuOption;
            var container = $.tmpl(FileManager.tpl.ContextMenu.container, {
                id: option.id == undefined ? new Date().getTime() : option.id
            });
            var menuUl = $.tmpl(FileManager.tpl.ContextMenu.ul);
            $.each(ContextMenu.systemOption.items, function (i, item) {
                var li = $.tmpl(FileManager.tpl.ContextMenu[item.showType], {
                    "text_": item.text
                });
                li.data("onclick", item.onClick);
                if (item.textHandle != undefined) {
                    li.data("textHandle", item.textHandle);
                    li.attr("text-handle", true);
                }
                if (item.fileType != undefined) {
                    li.data("file-type", item.fileType)
                    li.attr("file-type", true);
                }
                menuUl.append(li);
            });
            if (option.items.length > 0) {
                $.each(option.items, function (i, item) {
                    var li = $.tmpl(FileManager.tpl.ContextMenu[item.showType], {
                        "text_": item.text
                    });
                    li.data("onclick", item.onClick);
                    if (item.textHandle != undefined) {
                        li.data("textHandle", item.textHandle);
                        li.attr("text-handle", true);
                    }
                    if (item.fileType != undefined) {
                        li.data("file-type", item.fileType)
                        li.attr("file-type", true);
                    }
                    menuUl.append(li);
                });
            }
            container.append(menuUl);
            this.$element = container;
        },
        listen: function () {
            var that = this;
            this.manager.$element.contextmenu({
                target: that.$element,
                before: function (e) {
                    e.preventDefault();
                    var fileElement = $(e.target).parents("div.tile");
                    if (fileElement.length == 1) {
                        var file = fileElement.data("file");
                        if (file == undefined)
                            return false;
                        that.targetFile = file;
                        if (file.selected()) {
                            that.targetFiles = that.manager.currentFolder.getSelectedFiles();
                        } else {
                            that.manager.currentFolder.unSelectAll();
                            that.targetFiles = [file];
                        }
                        if (that.targetFiles.length > 1) {
                            this.getMenu().find("li.folder").hide();
                            this.getMenu().find("li.file").hide();
                        } else {
                            if (file.isDirectory) {
                                this.getMenu().find("li.folder").show();
                                this.getMenu().find("li.file").hide();
                            } else {
                                this.getMenu().find("li.file").show();
                                this.getMenu().find("li.folder").hide();
                                var fileType = getPostfix(file.name);
                                this.getMenu().find("li[file-type=true]").each(function () {
                                    var show = false;
                                    var fileTypes = $(this).data("file-type").split(",");
                                    for (var i in fileTypes) {
                                        if (fileTypes[i] == fileType) {
                                            show = true;
                                        }
                                    }
                                    if (show) {
                                        $(this).show();
                                    } else {
                                        $(this).hide();
                                    }
                                });
                            }
                        }
                        this.getMenu().find("li.folder.file").show();
                        this.getMenu().find("li.desk").hide();
                    } else {
                        that.manager.currentFolder.unSelectAll();
                        this.getMenu().find("li.file,li.folder").hide();
                        this.getMenu().find("li.desk").show();
                    }
                    this.getMenu().find("li[text-handle=true]").each(function () {
                        var handle = $(this).data("text-handle");
                        var text = handle(that.manager.currentFolder, that.targetFiles, that.targetFile);
                        $(this).find("span").text(text);
                    });
                    return true;
                },
                onItem: function (context, e) {
                    var click = $(e.target).parents("li").data("onclick");
                    click(that.manager.currentFolder, that.targetFiles, that.targetFile);
                    that.manager.currentFolder.unSelectAll();
                }
            });
        }
    }


    $.fn.fileManager = function (option, e) {
        var fileManagers = [];
        this.each(function () {
            var instance = new FileManager(this, option);
            fileManagers.push(instance);
        });
        return fileManagers.length > 1 ? fileManagers : fileManagers[0];
    };
    $.fn.fileManager.Constructor = FileManager;
})(jQuery, window, document);

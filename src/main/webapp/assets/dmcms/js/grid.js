;
(function ($, window, document, undefined) {
    var Grid = function (element, options) {
        this._setVariable(element, options);
        this._setOptions(this._options);
        if (this._url != undefined) {
            this._load();
            return;
        }
        if (this._data != undefined) {
            this._init();
            return;
        }
        console.error("data或url未定义");
        return;
    };
    Grid.defaults = {
        pageNum: 1,
        pageSize: 5,
        showCheck: true,
        checkboxWidth: "2%",
        showIndexNum: true,
        indexNumWidth: "2%",
        indexNumText: "序号",
        showPaging: true,
        dataLength:20,
        actionCloumText: "操作",
        actionCloumAlign: "left",
        actionCloumWidth: "20%",
        pageSelect: [10, 15, 20, 50]
    };
    Grid.statics = {
        toolRowTmpl: '<div class="table-toolbar"><div class="row">'
        + '<div ele-type="tools" class="col-md-6"></div>'
        + '<div ele-type="dropdowns" class="col-md-6"></div>'
        + '</div></div>',
        dropdownTmpl: '<div class="btn-group"><button class="btn ${cls_} dropdown-toggle" data-toggle="dropdown"  aria-expanded="true">${text_}<i class="fa fa-angle-down"></i></button>'
        + '<ul class="dropdown-menu" role="menu"></ul></div>',
        liTmpl: '<li><a href="javascript:;">${text_}</a></li>',
        searchRowTmpl: '<div class="form"><form ele-type="search" role="form">'
        + '<div class="form-body"><div class="row"></div></div>'
        + '<div class="form-actions right" style="background: none;"></div>'
        + '</form></div>',
        searchElementTmpl: '<div class="col-md-${span_}"><div class="form-group">'
        + '</div></div>',
        gridWrapperTmpl: '<div id="${id_}_wrapper" class="dataTables_wrapper no-footer"></div>',
        tableRowTmpl: '<div class="table-scrollable"></div>',
        pagingRowTmpl: '<div class="row"><div role="select" class="col-md-2 col-sm-6"></div><div role="info" class="col-md-3 col-sm-6"></div><div role="page" class="col-md-5 col-sm-6"></div><div role="goPage" class="col-md-2 col-sm-6" style="text-align: right;"></div></div>',
        labelTmpl: '<label>${label_}</label>',
        textTmpl: '<input type="text" name="${name_}" id="${id_}" class="form-control ${span_}" placeholder="${placeholder_}" value="${value_}">',
        passwordTmpl: '<input type="password" class="form-control ${class_}">',
        selectTmpl: '<select name="${name_}" id="${id_}" class="form-control ${class_}"></select>',
        optionTmpl: '<option value="${value_}" ${selected}>${text_}</option>',
        checkboxGroupTmpl: '<div class="checkbox-list" id="${id_}" name="${name_}"></div>',
        checkboxTmpl: '<label>'
        + '<input type="checkbox" id="${id_}" name="${name_}" value="${value_}">${text_}</label>',
        inlineCheckboxTmpl: '<label class="checkbox-inline">'
        + '<input type="checkbox" id="${id_}" name="${name_}" value="${value_}">${text_}</label>',
        radioGroupTmpl: '<div class="radio-list" id="${id_}" name="${name_}"></div>',
        radioTmpl: '<label>'
        + '<input type="radio" id="${id_}" name="${name_}" value="${value_}">${text_}</label>',
        inlineRadioTmpl: '<label class="radio-inline">'
        + '<input type="radio" id="${id_}" name="${name_}" value="${value_}">${text_}</label>',
        displayTmpl: '<p class="form-control-static">${text_}</p>',
        buttonTmpl: '<button type="${type_}" class="${class_}" title="${title_}" ${attribute_}>${text_}</button>',
        tableTmpl: '<table class="table table-striped table-bordered table-hover dataTable no-footer" id="${id_}_table"  aria-describedby="${id_}_info"></table>'
    };
    Grid.prototype = {
        reload: function (options) {
            this._reload(options);
        },
        // 获取当前选中节点id
        getSelectIds: function () {
            var ids = [];
            var checkboxs = this.$gridWrapper.find(".checkboxes:checked").each(
                function () {
                    ids.push($(this).val());
                });
            return ids;
        },
        // 获取选中节点的数据集合
        getSelectDatas: function () {
            var datas = [];
            this.$gridWrapper.find("tr.active").each(function () {
                datas.push($(this).data("data"));
            });
            return datas;
        },
        // 设置变量
        _setVariable: function (element, options) {
            this.$element = $(element);
            var id = element.id;
            if (id == undefined) {
                id = "dm_grid_" + new Date().getTime();
                this.$element.attr("id", id);
            }
            this._elementId = id;
            this._options = options;

            this._grids = new Object();
            this.$searchForm = undefined;
            this.$gridWrapper = new Object();
            this._total = 0;
            // 搜索栏是否初始化
            this._searchInited = false;
            // 工具栏是否初始化
            this._toolsInited = false;

        },
        // 设置属性
        _setOptions: function (options) {
            this._url = options.url;
            if (options.data != undefined) {
                if (options.data.data != undefined
                    || options.data.total != undefined) {
                    console.error("data格式不正确，必须包含data和total");
                    return;
                }
                this._data = options.data;
                this._grids = options.data.data;
                this._total = options.data.total;
            }
            this._cloums = options.cloums;
            this._pageNum = options.pageNum;
            this._pageSize = options.pageSize;
            if (options.idFiled != undefined) {
                this._idFiled = options.idFiled;
            } else {
                console.error("idFiled属性未定义");
                return;
            }
            this._showCheck = options.showCheck;
            this._checkboxWidth = options.checkboxWidth;
            this._showIndexNum = options.showIndexNum;
            this._indexNumWidth = options.indexNumWidth;
            this._indexNumText = options.indexNumText;
            this._showPaging = options.showPaging;
            if (options.dataLength != undefined) {
                // 表格内容显示长度
                this._dataLength = options.dataLength;
            }
            
            if (options.tools != undefined) {
                // 左侧工具栏
                this._tools = options.tools;
            }
            if (options.dropdowns != undefined) {
                // 右侧下拉选项
                this._dropdowns = options.dropdowns;
            }
            if (options.search != undefined) {
                this._search = options.search;
                //console.log(this._search);
            }
            if (options.actionCloums != undefined) {
                // 操作栏
                this._actionCloums = options.actionCloums;
            }
            if (options.actionCloumWidth != undefined) {
                // 操作栏宽度
                this._actionCloumWidth = options.actionCloumWidth;
            }
            if (options.actionCloumAlign != undefined) {
                // 操作栏宽度
                this._actionCloumAlign = options.actionCloumAlign;
            }
            // 操作栏显示文本
            this._actionCloumText = options.actionCloumText;

            this._sort = options.sort;

            this._pageSelect = options.pageSelect;
            this._afterInit = options.afterInit;

        },
        // 实例启动
        _load: function () {
            this._loadData();
        },
        // 异步加载数据
        _loadData: function (callback) {
            var that = this;
            Metronic.blockUI({
                target: this.$element
            });
            var parameters = "";
            if (that._url.indexOf("?") != -1) {
                parameters = "&";
            } else {
                parameters = "?";
            }
            parameters += "pageNum=" + this._pageNum;
            parameters += "&pageSize=" + this._pageSize;
            parameters += "&sort="
                + (this._sort == undefined ? "" : this._sort);
            $.ajax({
                type: "POST",
                dataType: "json",
                data: that.$searchForm == undefined ? {} : that.$searchForm
                    .serialize(),
                url: that._url + (parameters == undefined ? "" : parameters),
                success: function (data) {
                    if (!DmCheck(data)) {
                        return;
                    }
                    that._remove();
                    that._setData(data);
                    that._init();
                    Metronic.unblockUI(that.$element);
                },
                error: function (jqXHR, textStatus, errorMsg) {
                    alert("请求异常！");
                    Metronic.unblockUI(that.$element);
                }
            });
        },
        _setData: function (data) {
            this._data = data;
            this._grids = data.data;
            this._total = data.total;
        },
        // 初始化
        _init: function () {
            this._renderEles();
            this._regiestEvents();
            this._doAfterInit();
        },
        // 渲染元素
        _renderEles: function () {
            if (!this._searchInited) {
                this._renderSearch();
                this._searchInited = true;
            }
            if (!this._toolsInited) {
                this._renderTool();
                this._toolsInited = true;
            }
            this._renderGridWrapper();
        },
        // 渲染工具栏
        _renderTool: function () {
            if (this._tools == undefined && this._dropdowns == undefined) {
                return;
            }
            var that = this;
            var toolRow = $.tmpl(Grid.statics.toolRowTmpl, {});
            this.$element.append(toolRow);

            if (this._dropdowns != undefined) {
                var dropdownBtn = $.tmpl(Grid.statics.dropdownTmpl, {
                    "text_": (this._dropdowns.text == undefined ? "更多操作"
                        : this._dropdowns.text),
                    "cls_": (this._dropdowns.cls == undefined ? "default"
                        : this._dropdowns.cls)
                });
                toolRow.find("[ele-type='tools']").append(dropdownBtn);
                dropdownBtn.after("&nbsp;");
                $.each(this._dropdowns.items, function (index, content) {
                    var li = $.tmpl(Grid.statics.liTmpl, {
                        "text_": content.text
                    });
                    if (content.icon != undefined)
                        li.find("a").prepend(
                            "<i class='" + content.icon + "'><i>");
                    dropdownBtn.find("ul").append(li);
                    li.on("click", function () {
                        content.handle(that);
                    });
                });
            }
            if (this._tools != undefined) {
                $.each(this._tools, function (index, content) {
                    var button = $.tmpl(Grid.statics.buttonTmpl, {
                        "class_": content.cls,
                        "type_": "button",
                        "text_": content.text,
                        "title_": (content.title == undefined ? content.text
                            : content.title),
                        "attribute_": (content.attribute == undefined ? ""
                            : content.attribute)
                    });
                    if (content.icon != undefined)
                        button.prepend("<i class='" + content.icon + "'><i>");
                    toolRow.find("[ele-type='tools']").append(button);
                    if (content.handle != undefined) {
                        button.on("click", function () {
                            content.handle(that);
                        });
                    }
                    button.after("&nbsp;");
                });
                this.$toolsEle = toolRow;
            }
        },
        // 渲染搜索栏
        _renderSearch: function () {
            var rowEleSpan, items, buttons, hide=true;
            if (this._search == undefined) {
                return;
            } else {
                if (this._search.items != undefined) {
                    items = this._search.items;
                } else {
                    return;
                }
                if (this._search.buttons != undefined) {
                    buttons = this._search.buttons;
                }
                var rowEleNum = this._search.rowEleNum == undefined ? 2
                    : this._search.rowEleNum;
                if (12 % rowEleNum == 0) {
                    rowEleSpan = 12 / rowEleNum;
                }
                if(this._search.hide !=undefined){
                	hide = this._search.hide;
                }
            }
            var that = this;
            var searchFormRow = $.tmpl(Grid.statics.searchRowTmpl, {});
            if (items.length > 0) {
                $
                    .each(
                    items,
                    function (index, item) {
                        var itemDiv = $.tmpl(
                            Grid.statics.searchElementTmpl, {
                                "span_": rowEleSpan
                            }).appendTo(searchFormRow);
                        if (item.label != undefined) {
                            var label = $.tmpl(
                                Grid.statics.labelTmpl, {
                                    "label_": item.label
                                });
                            itemDiv.find(".form-group").append(
                                label);
                        }
                        if (item.type == "text") {
                            var ele = $
                                .tmpl(
                                Grid.statics.textTmpl,
                                {
                                    "name_": (item.name == undefined ? ""
                                        : item.name),
                                    "id_": (item.id == undefined ? ""
                                        : item.id),
                                    "placeholder_": (item.placeholder == undefined ? ""
                                        : item.placeholder),
                                    "value_": (item.value == undefined ? ""
                                        : item.value)
                                });
                            itemDiv.find(".form-group").append(ele);
                        } else if (item.type == "select") {
                            var ele = $
                                .tmpl(
                                Grid.statics.selectTmpl,
                                {
                                    "name_": (item.name == undefined ? ""
                                        : item.name),
                                    "id_": (item.id == undefined ? ""
                                        : item.id)
                                });
                            $
                                .each(
                                item.items,
                                function (index, option) {
                                    $
                                        .tmpl(
                                        Grid.statics.optionTmpl,
                                        {
                                            "value_": (option.value == undefined ? ""
                                                : option.value),
                                            "text_": (option.text == undefined ? ""
                                                : option.text)
                                        })
                                        .appendTo(
                                        ele);
                                });
                            itemDiv.find(".form-group").append(ele);
                            if (item.itemsUrl != undefined) {
                                $
                                    .ajax({
                                        type: "POST",
                                        dataType: "json",
                                        url: item.itemsUrl,
                                        success: function (data) {
                                            $
                                                .each(
                                                data,
                                                function (index,
                                                          option) {
                                                    $
                                                        .tmpl(
                                                        Grid.statics.optionTmpl,
                                                        {
                                                            "value_": (option.value == undefined ? ""
                                                                : option.value),
                                                            "text_": (option.text == undefined ? ""
                                                                : option.text)
                                                        })
                                                        .appendTo(
                                                        ele);
                                                });
                                            that._uniform();
                                        },
                                        error: function (err) {
                                            console
                                                .error("请求错误");
                                        }
                                    });
                            }
                        } else if (item.type == "radioGroup") {
                            var ele = $
                                .tmpl(
                                Grid.statics.radioGroupTmpl,
                                {
                                    "name_": (item.name == undefined ? ""
                                        : item.name),
                                    "id_": (item.id == undefined ? ""
                                        : item.id)
                                });
                            $
                                .each(
                                item.items,
                                function (index, option) {
                                    $
                                        .tmpl(
                                        Grid.statics.inlineRadioTmpl,
                                        {
                                            "name_": (item.name == undefined ? ""
                                                : item.name),
                                            "id_": (item.id == undefined ? ""
                                                : item.id),
                                            "value_": (option.value == undefined ? ""
                                                : option.value),
                                            "text_": (option.text == undefined ? ""
                                                : option.text)
                                        })
                                        .appendTo(
                                        ele);
                                });
                            itemDiv.find(".form-group").append(ele);
                            if (item.itemsUrl != undefined) {
                                $
                                    .ajax({
                                        type: "POST",
                                        dataType: "json",
                                        url: item.itemsUrl,
                                        success: function (data) {
                                            $
                                                .each(
                                                data,
                                                function (index,
                                                          option) {
                                                    $
                                                        .tmpl(
                                                        Grid.statics.inlineRadioTmpl,
                                                        {
                                                        	"name_": (item.name == undefined ? ""
                                                                    : item.name),
                                                                "id_": (item.id == undefined ? ""
                                                                    : item.id),
                                                                "value_": (option.value == undefined ? ""
                                                                    : option.value),
                                                                "text_": (option.text == undefined ? ""
                                                                    : option.text)
                                                        })
                                                        .appendTo(
                                                        ele);
                                                });
                                            that._uniform();
                                        },
                                        error: function (err) {
                                            console
                                                .error("请求错误");
                                        }
                                    });
                            }
                        } else if (item.type == "checkboxGroup") {
                            var ele = $
                                .tmpl(
                                Grid.statics.checkboxGroupTmpl,
                                {
                                    "name_": (item.name == undefined ? ""
                                        : item.name),
                                    "id_": (item.id == undefined ? ""
                                        : item.id)
                                });
                            $
                                .each(
                                item.items,
                                function (index, option) {
                                    $
                                        .tmpl(
                                        Grid.statics.inlineCheckboxTmpl,
                                        {
                                            "name_": (item.name == undefined ? ""
                                                : item.name),
                                            "id_": (item.id == undefined ? ""
                                                : item.id),
                                            "value_": (option.value == undefined ? ""
                                                : option.value),
                                            "text_": (option.text == undefined ? ""
                                                : option.text)
                                        })
                                        .appendTo(
                                        ele);
                                });
                            itemDiv.find(".form-group").append(ele);
                            if (item.itemsUrl != undefined) {
                                $
                                    .ajax({
                                        type: "POST",
                                        dataType: "json",
                                        url: item.itemsUrl,
                                        success: function (data) {
                                            $
                                                .each(
                                                data,
                                                function (index,
                                                          option) {
                                                    $
                                                        .tmpl(
                                                        Grid.statics.inlineCheckboxTmpl,
                                                        {
                                                        	"name_": (item.name == undefined ? ""
                                                                    : item.name),
                                                                "id_": (item.id == undefined ? ""
                                                                    : item.id),
                                                                "value_": (option.value == undefined ? ""
                                                                    : option.value),
                                                                "text_": (option.text == undefined ? ""
                                                                    : option.text)
                                                        })
                                                        .appendTo(
                                                        ele);
                                                });
                                            that._uniform();
                                        },
                                        error: function (err) {
                                            console
                                                .error("请求错误");
                                        }
                                    });
                            }
                        } else if (item.type == "datepicker") {
                            var dateTmpl = '<div class="input-group input-medium">'
                                + '<input type="text" role="date-input" id="${id_}" name=${name_} class="form-control">'
                                + '<span role="icon" class="input-group-addon">'
                                + '<i class="fa fa-calendar"></i>'
                                + '</span></div>';
                            var ele = $
                                .tmpl(
                                dateTmpl,
                                {
                                    "id_": (item.id == undefined ? item.name
                                        : item.id),
                                    "name_": item.name,
                                    "cls_": item.cls == undefined ? ""
                                        : item.cls
                                });
                            var min ='';
                            var min = '';
                			if (item.min != undefined) {
                				min = "'" + item.min + "'";
                			}
                			var max = "";
                			if (item.max != undefined) {
                				max = "'" + item.max + "'";
                			}
                            itemDiv.find(".form-group").append(ele);
                            ele
                                .find('[role="date-input"]')
                                .on(
                                "click",
                                function () {
                                	if (item.minDatepickerId != undefined) {
                        				var ite = $('#'+item.minDatepickerId).val();
                        				min = ite;
                        			}
                        			if (item.maxDatepickerId != undefined) {
                        				var ite = $('#'+item.maxDatepickerId).val();
                        				max = ite;
                        			}
                                    laydate({
                                        istime: true,
                                        format: 'YYYY-MM-DD hh:mm:ss',
                                        elem: '#'
                                            + (item.id == undefined ? item.name
                                                : item.id),
                                        min:min,
                                        max:max
                                    });
                                });
                            ele
                                .find('[role="icon"]')
                                .on(
                                "click",
                                function () {
                                    laydate({
                                        istime: true,
                                        format: 'YYYY-MM-DD hh:mm:ss',
                                        elem: '#date'
                                        + (item.id == undefined ? item.name
                                            : item.id)
                                    });
                                });
                        }
                        searchFormRow.find(".row").append(itemDiv);

                       
                    });
            }
            if (buttons != undefined && buttons.length > 0) {
                $.each(buttons, function (index, button) {
                    var btn = $.tmpl(Grid.statics.buttonTmpl, {
                        "class_": (button.cls == undefined ? "btn default"
                            : button.cls),
                        "text_": (button.text == undefined ? "未定义"
                            : button.text),
                        "title_": (button.title == undefined ? button.text
                            : button.title),
                        "type_": (button.type == undefined ? "button"
                            : button.type)
                    });
                    if (button.icon != undefined)
                        btn.prepend("<i class='" + button.icon + "'><i>");
                    if (button.handle != undefined)
                        btn.on("click", function () {
                            button.handle(that);
                        });
                    searchFormRow.find('.form-actions').append(btn);
                    btn.after("&nbsp;");
                });
            }
            if(hide){
            	showBtn = $.tmpl(Grid.statics.buttonTmpl, {
                    "class_": "btn btn-sm blue",
                    "text_": "显示搜索面板",
                    "title_": "显示",
                    "type_": "button"
                }).show();
                hideBtn = $.tmpl(Grid.statics.buttonTmpl, {
                    "class_": "btn btn-sm yellow",
                    "text_": "隐藏搜索面板",
                    "title_": "隐藏",
                    "type_": "button"
                }).hide();
            }else{
	            showBtn = $.tmpl(Grid.statics.buttonTmpl, {
	                "class_": "btn btn-sm blue",
	                "text_": "显示搜索面板",
	                "title_": "显示",
	                "type_": "button"
	            }).hide();
	            hideBtn = $.tmpl(Grid.statics.buttonTmpl, {
	                "class_": "btn btn-sm yellow",
	                "text_": "隐藏搜索面板",
	                "title_": "隐藏",
	                "type_": "button"
	            }).show();
            }
            searchFormRow.find('.form-actions').append(showBtn);
            searchFormRow.find('.form-actions').append(hideBtn);
            hideBtn.after("&nbsp;");
            showBtn.on("click", function () {
                searchFormRow.find('.form-body').slideDown();
                showBtn.toggle();
                hideBtn.toggle();
            });
            hideBtn.on("click", function () {
                searchFormRow.find('.form-body').slideUp();
                showBtn.toggle();
                hideBtn.toggle();
            });
            var resetbtn = $.tmpl(Grid.statics.buttonTmpl, {
                "class_": "btn btn-sm default",
                "text_": "重置",
                "title_": "重置",
                "type_": "reset"
            });
            searchFormRow.find('.form-actions').append(resetbtn);
            resetbtn.after("&nbsp;");

            var searchbtn = $.tmpl(Grid.statics.buttonTmpl, {
                "class_": "btn btn-sm blue",
                "text_": " 搜索",
                "title_": "搜索",
                "type_": "button"
            });
            searchbtn.prepend("<i class='fa fa-search'><i>");
            searchbtn.on("click", function () {
                that._reload({
                    pageNum: 1
                });
                if (that._search.submitHandle != undefined)
                    that._search.submitHandle();
            });
            searchFormRow.find('.form-actions').append(searchbtn);
            searchbtn.after("&nbsp;");
            this.$element.append(searchFormRow);
            this._uniform();
            this.$searchForm = searchFormRow.find("form[ele-type='search']");
            if(hide){
            	searchFormRow.find('.form-body').slideUp(1);
            }
        },
        _renderGridWrapper: function () {
            var that = this;
            var gridWrapper = $.tmpl(Grid.statics.gridWrapperTmpl, {
                "id_": that._elementId
            });
            this.$element.append(gridWrapper);
            this.$gridWrapper = gridWrapper;
            this._renderTable();
            if(this._showPaging){
            	this._renderPaging();
            }
        },
        // 渲染表格
        _renderTable: function () {
            var that = this;
            var head_array = [];
            var head_index = [];
            var formate_array = [];
            var idFiled = that._idFiled;
            $.each(that._cloums, function (index, cloum) {
                head_array.push(cloum.field);
                head_index.push(index);
                formate_array.push(cloum.format);
            });

            var colTmpl = '<col width="${width_}"></col>';
            var trTmpl = '<tr role="row" class="${class_}"></tr>';
            var thTmpl = '<th class="${class_} ${sorting_}" rowspan="1" colspan="1" style="${style_}"></th>';
            var tdTmpl = '<td class="${class_}" style="vertical-align: middle;"></td>';

            var tableRow = $.tmpl(Grid.statics.tableRowTmpl, {});

            var table = $.tmpl(Grid.statics.tableTmpl, {
                "id_": that._elementId
            });
            // colgrop
            var cols = function (width) {
                return $.tmpl(colTmpl, {
                    "width_": width
                });
            };
            var renderColgroup = function (colgroup) {
                if (that._showCheck == true) {
                    colgroup.append(cols(that._checkboxWidth));
                }
                if (that._showIndexNum == true) {
                    colgroup.append(cols(that._indexNumWidth));
                }
                $.each(that._cloums, function (index, cloum) {
                    colgroup.append(cols(cloum.width == undefined ? ""
                        : cloum.width));
                });
                if (that._actionCloums != undefined) {
                    colgroup.append(cols(that._actionCloumWidth));
                }
            };
            var colgroup = $('<colgroup></colgroup>');
            renderColgroup(colgroup);
            table.append(colgroup);

            // thead
            var renderThead = function (thead) {
                var sortField, sortMode;
                if (that._sort != undefined) {
                    if (that._sort.indexOf("_desc") != -1) {
                        sortField = that._sort.replace("_desc", "");
                        sortMode = "desc";
                    } else if (that._sort.indexOf("_asc") != -1) {
                        sortField = that._sort.replace("_asc", "");
                        sortMode = "asc";
                    }
                }
                var tr = $.tmpl(trTmpl, {});
                if (that._showCheck == true) {
                    var checkboxTh = $.tmpl(thTmpl, {
                        "class_": "table-checkbox",
                        "sorting_": "sorting_disabled"
                    });
                    var checkbox = $('<input type="checkbox" class="group-checkable" data-set="#'
                        + that._elementId + ' .checkboxes"/>');
                    checkboxTh.append(checkbox);
                    tr.append(checkboxTh);
                }
                if (that._showIndexNum == true) {
                    var indexTh = $.tmpl(thTmpl, {
                        "sorting_": "sorting_disabled"
                    });
                    indexTh.html(that._indexNumText);
                    tr.append(indexTh);
                }
                $.each(that._cloums, function (index, cloum) {
                    var style = "";
                    var sort = "sorting_disabled";
                    if (cloum.align != undefined) {
                        style += "text-align:" + cloum.align + ";";
                    }
                    if (cloum.sort != undefined && cloum.sort) {
                        sort = "sorting";
                        if (sortField == cloum.field) {
                            sort = "sorting_" + sortMode;
                        }
                    }
                    var text = cloum.title == undefined ? "未定义" : cloum.title;
                    if(text.length<=4){//2017/01/19如果标题字少 可能会出现列太窄,竖着显示字
                    	style+="padding-right:40px;";
                    }
                    var th = $.tmpl(thTmpl, {
                        "style_": style,
                        "sorting_": sort
                    });
                    th.text(text);
                    th.data("field", cloum.field);
                    tr.append(th);
                });
                var actionStyle = "";
                if (that._actionCloums != undefined) {
                    if (that._actionCloumAlign != undefined) {
                        actionStyle += "text-align:" + that._actionCloumAlign
                            + ";";
                    }
                    var actionTh = $.tmpl(thTmpl, {
                        "style_": actionStyle
                    });
                    actionTh.text(that._actionCloumText);
                    tr.append(actionTh);
                }
                thead.append(tr);
            };
            var thead = $('<thead></thead>');
            renderThead(thead);
            table.append(thead);

            // tbody
            var renderTbody = function (tbody, grid, index) {
                var num = (that._pageNum - 1) * that._pageSize + index + 1;
                var tr = $.tmpl(trTmpl, {
                    "class_": "odd gradeX"
                });
                if (that._showCheck == true) {
                    var checkboxTd = $.tmpl(tdTmpl, {});
                    var checkbox = $('<input type="checkbox" class="checkboxes" value="'
                        + grid[that._idFiled] + '"/>');
                    checkboxTd.append(checkbox);
                    tr.append(checkboxTd);
                }
                if (that._showIndexNum == true) {
                    var indexTd = $.tmpl(tdTmpl, {});
                    indexTd.html(num);
                    tr.append(indexTd);
                }
                $.each(that._cloums, function (index, cloum) {
                    var td = $.tmpl(tdTmpl, {});
                    var html = grid[cloum.field];
                    if (cloum.format != undefined) {
                        var fun = cloum.format;
                        if( typeof fun == "string"){//20161220 字符串functionbody定义函数 添加第三个参数id wjl
                        	fun = new Function("index", "data","id",fun);
                        }
                        html = fun(num, grid,grid[that._idFiled]);
                    } else {
                    	if(html)
                    		if(html.length<500)
                    			td.attr("title", html);//如果字数超过200 不加title属性
                    }
                    if(that._dataLength){//添加默认截取表格字数限制20
                    	if(html)
                    		if(html.length>that._dataLength)
                    			html = html.substring(0,that._dataLength)+'...';
                    }
                    td.html(html);
                    tr.append(td);
                });
                if (that._actionCloums != undefined) {
                	//console.log(that._actionCloums);
                    var cltd = $.tmpl(tdTmpl, {});
                    var _index = index;
                    var current_data = grid;
                    $.each(that._actionCloums, function (index, colum) {
                        var visable = true;
                        if (colum.visable != undefined) {
                        	var fun = colum.visable;
                            if( typeof fun == "string"){//20161220 字符串functionbody定义函数 添加第三个参数id wjl
                            	fun = new Function("index", "data","id",fun);
                            }
                            visable = fun(_index, current_data,grid[that._idFiled]);
                        }
                        if (visable == false) {
                            return;
                        }
                        var text = colum.text;
                        if (colum.textHandle != undefined) {
                        	var fun = colum.textHandle;
                            if( typeof fun == "string"){//20161220 字符串functionbody定义函数 添加第三个参数id wjl
                            	fun = new Function("index", "data","id",fun);
                            }
                            text = fun(num, current_data,grid[that._idFiled]);
                        }
                        var button = $.tmpl(Grid.statics.buttonTmpl, {
                            "class_": "btn " + colum.cls,
                            "text_": text,
                            "title_": (colum.title == undefined ? text
                                : colum.title)
                        });
                        if (colum.handle != undefined) {
                            button.click(function (e) {
                            	var fun = colum.handle;
                                if( typeof fun == "string"){//20161220 字符串functionbody定义函数 添加第三个参数id wjl
                                	fun = new Function("index", "data","id",this,fun);
                                }
                                fun(num, current_data,grid[that._idFiled],this);
                                e.stopPropagation();
                            });
                        }
                        cltd.append(button);
                    });
                }
                tr.append(cltd);
                tbody.append(tr);
                tr.data("data", grid);
            };
            var renderEmptyTbody = function (tbody) {
                var tr = $.tmpl(trTmpl, {
                    "class_": "odd gradeX"
                });
                var cols = that._cloums.length + (that._showCheck == true ? 1 : 0) + (that._showIndexNum ? 1 : 0) + (that._actionCloums?that._actionCloums.length:0);
                var td = $.tmpl(tdTmpl, {});
                td.css("text-align", "center");
                td.attr("colspan", cols);
                td.html("暂无数据");
                tr.append(td);
                tbody.append(tr);
            }
            var tbody = $('<tbody></tbody>');
            if (that._grids != undefined && that._grids != null) {
                if (that._grids.length == 0)
                    renderEmptyTbody(tbody);
                $.each(that._grids, function (index, grid) {
                    renderTbody(tbody, grid, index);
                });
            }
            table.append(tbody);

            tableRow.append(table);
            this.$gridWrapper.append(tableRow);
        },
        // 渲染分页
        _renderPaging: function () {
            var that = this;
            var pagingRow = $.tmpl(Grid.statics.pagingRowTmpl, {});
            // select

            var select = $('<div class="dataTables_length"><label><select id="'
                + this._elementId
                + '_length" class="form-control input-xsmall input-inline"></select></label></div>');

            var options = this._pageSelect;
            if (options.indexOf(that._pageSize) == -1) {
                options.push(that._pageSize);
            }
            options.sort(function (a, b) {
                return a > b ? 1 : -1;
            });
            for (var i in options) {
                var option = $.tmpl(Grid.statics.optionTmpl, {
                    "value_": options[i],
                    "text_": options[i],
                    "selected": that._pageSize == options[i] ? "selected" : ""
                });
                select.find("select").append(option);
            }

            pagingRow.find("[role='select']").append(select);
            // info
            var info = $('<div class="dataTables_info" id="' + this._elementId
                + '_info" role="status" aria-live="polite"></div>');
            var text = "<label>当前 "
                + (this._total == 0 ? "0" : ((this._pageNum - 1)
                * this._pageSize + 1))
                + " 到 "
                + ((this._pageNum * this._pageSize) > this._total ? this._total
                    : (this._pageNum * this._pageSize)) + " 共 "
                + this._total + "</label>";
            info.html(text);
            pagingRow.find("[role='info']").append(info);

            // page
            var liTmpl = '<li class="${class_}" aria-controls="${pageto_}" id="${id_}" tabindex="0"><a style="${style_}" href="javascript:;">${num_}</a></li>';
            var renderPageEle = function (ul, pageNum, totalP) {
                var firstLi = $.tmpl(liTmpl, {
                    "class_": pageNum == 1 ? "prev disabled" : "prev",
                    "pageto_": 1,
                    "num_": "1 <<"
                });
                ul.append(firstLi);
                /*var preLi = $.tmpl(liTmpl, {
                    "pageto_": (pageNum - 1) <= 0 ? 1 : (pageNum - 1),
                    "class_": (pageNum - 1) <= 0 ? "prev disabled" : "prev",
                    "num_": "<"
                });
                ul.append(preLi);*/
                if (totalP <= 5 && totalP > 0) {
                    for (var i = 1; i <= totalP; i++) {
                        var li = $.tmpl(liTmpl, {
                            "class_": pageNum == i ? "paginate_button active"
                                : "paginate_button",
                            "id_": "",
                            "pageto_": i,
                            "num_": i
                        });
                        ul.append(li);
                    }
                } else if (totalP > 5) {
                    if (pageNum <= 3) {
                        for (var i = 1; i <= 5; i++) {
                            var li = $
                                .tmpl(
                                liTmpl,
                                {
                                    "class_": pageNum == i ? "paginate_button active"
                                        : "paginate_button",
                                    "id_": "",
                                    "pageto_": i,
                                    "num_": i
                                });
                            ul.append(li);
                        }
                       /* var nextli = $
                            .tmpl(
                            liTmpl,
                            {
                                "id_": "",
                                "class_": "disabled",
                                "style_": "border-top :0px solid #ddd;border-bottom :0px solid #ddd;",
                                "num_": "..."
                            });
                        ul.append(nextli);*/
                    } else if (pageNum > 3 && pageNum < (totalP - 2)) {
                        /*var preli = $
                            .tmpl(
                            liTmpl,
                            {
                                "id_": "",
                                "class_": "disabled",
                                "style_": "border-top :0px solid #ddd;border-bottom :0px solid #ddd;",
                                "num_": "..."
                            });
                        ul.append(preli);*/
                        for (var i = pageNum - 2; i <= pageNum + 2; i++) {
                            var li = $
                                .tmpl(
                                liTmpl,
                                {
                                    "class_": pageNum == i ? "paginate_button active"
                                        : "paginate_button",
                                    "id_": "",
                                    "pageto_": i,
                                    "num_": i
                                });
                            ul.append(li);
                        }
                        /*var nextli = $
                            .tmpl(
                            liTmpl,
                            {
                                "id_": "",
                                "class_": "disabled",
                                "style_": "border-top :0px solid #ddd;border-bottom :0px solid #ddd;",
                                "num_": "..."
                            });
                        ul.append(nextli);*/
                    } else {
                        /*var preli = $
                            .tmpl(
                            liTmpl,
                            {
                                "id_": "",
                                "class_": "disabled",
                                "style_": "border-top :0px solid #ddd;border-bottom :0px solid #ddd;",
                                "num_": "..."
                            });
                        ul.append(preli);*/
                        for (var i = totalP - 4; i <= totalP; i++) {
                            var li = $
                                .tmpl(
                                liTmpl,
                                {
                                    "class_": pageNum == i ? "paginate_button active"
                                        : "paginate_button",
                                    "id_": "",
                                    "pageto_": i,
                                    "num_": i
                                });
                            ul.append(li);
                        }
                    }
                }
                /*var nextLi = $.tmpl(liTmpl,
                    {
                        "pageto_": (pageNum + 1) > totalP ? totalP
                            : (pageNum + 1),
                        "class_": (pageNum + 1) > totalP ? "next disabled"
                            : "next",
                        "num_": ">"
                    });
                ul.append(nextLi);*/
                var lastLi = $.tmpl(liTmpl, {
                    "class_": ((pageNum == totalP) || (totalP == 0)) ? "next disabled" : "next",
                    "pageto_": totalP,
                    "num_": ">> " + ((totalP == 0) ? "1" : totalP)
                });
                ul.append(lastLi);
            };
            var page = $('<div class="dataTables_paginate paging_bootstrap_full_number" id="'
                + this._elementId + '_paginate"></div>');
            var ul = $('<ul class="pagination" style="visibility: visible;"></ul>');
            page.append(ul);
            var totalP = this._getTotalPage();
            renderPageEle(ul, this._pageNum, totalP);
            pagingRow.find("[role='page']").append(page);
            var goPage = $('<div role="goPage"><button class="btn green dropdown-toggle" type="button" data-toggle="dropdown">'
                + '跳转'
                + '</button>'
                + '<div class="dropdown-menu dropdown-content input-mini hold-on-click" role="menu">'
                + '	<form action="javascript:;">'
                + '		<div class="input-group">'
                + '			<input type="text" id="goInput" class="form-control" placeholder="输入跳转页...">'
                + '			<span class="input-group-btn">'
                + '			<button class="btn blue" id="goBtn" type="button">GO</button>'
                + '			</span>' + '		</div>' + '	</form>' + '</div><div>');
            // FIXME 这块其实没有问题，但是问题清单中提出存在问题，建议是去掉。今后如有需要可以打开下面的注释 (.0-0.) --- luotuan 210727
            // pagingRow.find("[role='goPage']").append(goPage);
            this.$gridWrapper.append(pagingRow);
        },
        _getTotalPage: function () {
            var totalP = 0;
            var totalcount = this._total;
            var pagesize = this._pageSize;
            if (totalcount % pagesize != 0) {
                totalP = Math.floor(totalcount / pagesize) + 1;
            } else {
                totalP = Math.floor(totalcount / pagesize);
            }
            return totalP;
        },
        // 注册事件
        _regiestEvents: function () {
            var that = this;
            // checkbox相关
            this.$gridWrapper.find('.group-checkable').change(
                function () {
                    var set = $(this).attr("data-set");
                    var checked = $(this).is(":checked");
                    $(set)
                        .each(
                        function () {
                            if (checked) {
                                $(this).attr("checked", true);
                                $(this).parent().parent()
                                    .parent().parent()
                                    .addClass("active");
                            } else {
                                $(this).attr("checked", false);
                                $(this).parent().parent()
                                    .parent().parent()
                                    .removeClass("active");
                            }
                        });
                    $.uniform.update(set);
                });
            this.$gridWrapper.find(".checkboxes").change(
                function () {
                    var checked = $(this).is(":checked");
                    if (checked) {
                        $(this).parent().parent().parent().parent()
                            .addClass("active");
                    } else {
                        $(this).parent().parent().parent().parent()
                            .removeClass("active");
                    }
                    $.uniform.update($(this));
                });
            // 分页相关
            this.$gridWrapper.find('ul.pagination li').not(".disabled").on(
                "click", function () {
                    var pN = $(this).attr("aria-controls");
                    if (parseFloat(pN)) {
                        that._reload({
                            pageNum: parseFloat(pN)
                        });
                        Metronic.scrollTo(that.$gridWrapper, -200);
                    }
                });
            this.$gridWrapper.find('.dataTables_length select').on("change",
                function () {
                    var pS = $(this).val();
                    if (parseFloat(pS)) {
                        that._reload({
                            pageNum: 1,
                            pageSize: parseFloat(pS)
                        });
                    }
                });
            // 跳转相关
            this.$gridWrapper.find("#goInput").val(this._pageNum);
            this.$gridWrapper.find("#goBtn").on(
                "click",
                function () {
                    var reg = /^[0-9]*[1-9][0-9]*$/;
                    if (reg.test($("#goInput").val())
                        && $("#goInput").val() <= that._getTotalPage()) {
                        that._reload({
                            pageNum: $("#goInput").val()
                        });
                        Metronic.scrollTo(that.$gridWrapper, -200);
                    } else {
                        bootbox.alert("输入有误");
                    }
                });
            // 排序相关
            this.$gridWrapper.find('th.sorting').on("click", function () {
                var field = $(this).data("field");
                that._reload({
                    sort: field + "_asc"
                });
            });
            this.$gridWrapper.find('th.sorting_asc').on("click", function () {
                var field = $(this).data("field");
                that._reload({
                    sort: field + "_desc"
                });
            });
            this.$gridWrapper.find('th.sorting_desc').on("click", function () {
                var field = $(this).data("field");
                that._reload({
                    sort: field + "_asc"
                });
            });

            this._uniform();
        },
        // 执行回调
        _doAfterInit: function () {
            if (this._afterInit != undefined)
                this._afterInit();
        },
        _uniform: function () {
            if (!$().uniform) {
                return;
            }
            var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle)");
            if (test.size() > 0) {
                test.each(function () {
                    $(this).show();
                    $(this).uniform();
                });
            }
        },
        // 销毁
        _remove: function () {
            if (this.$gridWrapper.remove != undefined) {
                this.$gridWrapper.remove();
            }
        },
        // 重新加载
        _reload: function (options) {
            if (options != undefined) {
            	if (options.actionCloums != undefined) {//20170119
                    // 操作栏
                    this._options.actionCloums = [];
                }
            	/*if (options.search != undefined) {//20170119
                    this._options.search=[];
                    this._searchInited = false;//如果列改变 searchForm要重新生成
                    if(this.$searchForm)
                    	this.$searchForm.remove();
                }*/
            	/*if (options.tools != undefined) {//20170119
	            	this._options.tools=[];
	            	this._toolsInited = false;
	            	if(this.$toolsEle)
	            		this.$toolsEle.remove();
            	}*/
            	if(options.cloums !=undefined){
            		this._options.cloums=[];//20161219 清空原来的列wjl
            		this._options.tools=[];
	            	this._toolsInited = false;
	            	if(this.$toolsEle)
	            		this.$toolsEle.remove();
	            	this._options.search=[];
                    this._searchInited = false;//如果列改变 searchForm要重新生成
                    if(this.$searchForm)
                    	this.$searchForm.remove();
            	}
                this._options = $.extend(true, {}, this._options, options);
                //console.log(this._options);
                this._setOptions(this._options, this);
            }
            this._load();
        }
    };

    /**
     * jquery插件扩展 ===================================================
     */
    /**
     * 解决ieindexOf问题
     */
    if (!Array.prototype.indexOf) {
        Array.prototype.indexOf = function (elt) {
            var len = this.length >>> 0;
            var from = Number(arguments[1]) || 0;
            from = (from < 0) ? Math.ceil(from) : Math.floor(from);
            if (from < 0)
                from += len;

            for (; from < len; from++) {
                if (from in this && this[from] === elt)
                    return from;
            }
            return -1;
        };
    }
    var grid = function (options, callback) {
        if (callback != undefined) {
            options.afterInit = callback;
        }
        options = $.extend(true, {}, Grid.defaults, options);
        var eles = [];
        this.each(function () {
            var self = this;
            var instance = new Grid(self, options);
            eles.push(instance);
        });
        return eles[0];
    };

    $.fn.extend({
        'dmGrid': grid
    });
})(jQuery, window, document);
function dateTostr(utc)
{
	if(utc)
		{
     var date = new Date(utc);
     return date.getFullYear()+"-"+((date.getMonth()+1)>=10?date.getMonth()+1:"0"+(date.getMonth()+1))+"-"+(date.getDate()>=10?date.getDate():"0"+date.getDate())+" "+(date.getHours()>=10?date.getHours():"0"+date.getHours())+":"+(date.getMinutes()>=10?date.getMinutes():"0"+date.getMinutes())+":"+(date.getSeconds()>=10?date.getSeconds():"0"+date.getSeconds());
   }
};

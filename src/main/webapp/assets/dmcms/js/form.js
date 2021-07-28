;
(function ($, window, document, undefined) {
    var KE;
    if (typeof (KindEditor) != "undefined") {
        KindEditor.ready(function (K) {
            KE = K;
        });
    }

    var getLowCaseType = function (string) {
        var postfix = string.substring(string.lastIndexOf("."), string.length);
        return postfix.toLowerCase();
    };

    var Form = function (element, options, callback) {
        this._setVariable(element, options);
        this._setOptions(this._options);
        if (callback != undefined) {
            this._callback = callback;
        }
        this._init();
    };
    Form.defaults = {
        method: "post",
        labelInline: true,
        rowEleNum: 1,
        ajaxSubmit: true,
        showSubmit: true,
        submitText: "保存",
        shenheText:"提交审核",
        showShenheButton:false,
        publishText:"直接发布",
        showPublishButton:false,
        resetText: "重置",
        showReset: true,
        isValidate: true,
        viewMode: false
    };
    Form.statics = {
        formDivTmpl: '<div class="portlet light " style="border:#ccc solid 1px;"><div class="portlet-body form"></div></div>',
        formTmpl: '<form id="${id_}" name="${name_}" action="${action_}" method="${method_}" enctype="multipart/form-data" class="${cls_}"></form>',
        formBodyTmpl: '<div class="form-body"></div>',
        formActionTmpl: '<div class="form-actions" style="text-align:${align_};"></div>',
        rowTmpl: '<div data-row=${row_} class="row"></div>',
        eleTmpl: '<div class="col-md-${span_}"><div class="form-group"></div></div>',
        sectionTmpl: '<div class="col-md-12"><h3 class="form-section">${title_}</h3></div>',
        labelTmpl: '<label class="control-label ${cls_}"><font style="font-size: larger;color:red;">${redMsg_}</font>${label_}</label>',
        blockSpanTmpl: '<span class="help-block">${help_}</span>',
        buttonTmpl: '<button type="${type_}" class="btn ${cls_}" ${attribute_}>${text_}</button>'
    };
    Form.prototype = {
        reload: function (options) {
            this._reload(options);
        },
        reset: function () {
            this._reset();
        },
        setValue: function (name, value) {
            this._loadValue(name, value);
        },
        loadLocal: function (data, callback) {
            var that = this;
            this._data = data;
            $.each(this._data, function (i, value) {
                that._loadValue(i, value);
            });
            if (callback != undefined) {
                callback(this._data);
            }
        },
        loadRemote: function (ajaxUrl, callback) {
            var that = this;
            $.ajax({
                type: "POST",
                dataType: "json",
                url: ajaxUrl,
                success: function (data) {
                    if (!DmCheck(data)) {
                        return;
                    }
                    this._data = data;
                    $.each(this._data, function (i, item) {
                        that._loadValue(i, item);
                    });
                    if (callback != undefined) {
                        callback(this._data);
                    }
                },
                error: function (e) {
                    alert("异步加载数据异常");
                }
            });
        },
        setAction: function (action) {
            this._action = action;
        },
        setShenheAction: function (action) {
            this._shenheAction = action;
        },
        setPublishAction: function (action) {
            this._publishAction = action;
        },
        _setVariable: function (element, options) {
            this.$element = $(element);
            var id = element.id;
            if (id == undefined) {
                id = "dm_form_" + new Date().getTime();
                this.$element.attr("id", id);
            }
            this._elementId = id;
            this._options = options;
            this._editor = new Array();
            this._module = new Array();
            this.$form = undefined;
            this._data = undefined;
        },
        _setOptions: function (options) {
            if (options.id == undefined) {
                this._formId = "form_" + new Date().getTime();
            } else {
                this._formId = options.id;
            }
            if (options.name == undefined) {
                this._formName = "form_" + new Date().getTime();
            } else {
                this._formName = options.name;
            }
            this._method = options.method;
            this._action = options.action;
            this._shenheAction = options.shenheAction;
            this._publishAction = options.publishAction;
            this._labelInline = options.labelInline;
            this._rowEleNum = options.rowEleNum;
            this._items = options.items;
            this._buttons = options.buttons;
            this._buttonsAlign = options.buttonsAlign;
            this._ajaxSubmit = options.ajaxSubmit;
            this._ajaxSuccess = options.ajaxSuccess;
            this._beforeSubmit = options.beforeSubmit;
            this._showSubmit = options.showSubmit;
            this._showShenheButton=options.showShenheButton;
            this._shenheText = options.shenheText;
            this._showPublishButton=options.showPublishButton;
            this._publishText = options.publishText;
            this._submitText = options.submitText;
            this._resetText = options.resetText;
            this._showReset = options.showReset;
            this._complete = options.complete;
            this._isValidate = options.isValidate;
            if (options.validateOptions != undefined) {
                this._validateOptions = options.validateOptions;
            } else {
                this._validateOptions = {
                    rules: {},
                    messages: {}
                };
            }
        },
        _init: function () {
            this._renderEles();
            this._regiestEvents();
            this._doCallbacks();
        },
        _renderEles: function () {
            var that = this;
            var formDiv = $.tmpl(Form.statics.formDivTmpl, {});
            var form = $.tmpl(Form.statics.formTmpl, {
                "id_": that._formId,
                "name_": that._formName,
                "method_": that._method,
                "action_": that._action,
                "cls_": that._labelInline ? "form-horizontal"
                    : "horizontal-form"
            });
            formDiv.find(".form").append(form);
            this.$form = form;
            this.$element.append(formDiv);

            // formBody
            var formBody = $.tmpl(Form.statics.formBodyTmpl, {});
            this.$form.append(formBody);
            this._renderFormElements(formBody);

            // formAction
            var formAction = $.tmpl(Form.statics.formActionTmpl, {
                "align_": that._buttonsAlign == undefined ? "left"
                    : that._buttonsAlign
            });
            this.$form.append(formAction);
            this._renderActionButtons(formAction);
        },
        _renderFormElements: function (formBody) {
            if (this._items == undefined || this._items.length == 0) {
                return;
            }
            var that = this;
            /**
             * 计算行元素span
             */
            var rowEleSpan = 12;
            var rowEleNum = this._rowEleNum;
            if (12 % rowEleNum == 0) {
                rowEleSpan = 12 / rowEleNum;
            }
            var count = 0;
            var row;
            $
                .each(
                this._items,
                function (i, item) {
                    if (that._formEles[item.type] != undefined) {
                        if (item.type == "hidden") {
                            var ele = that._formEles[item.type]
                            (item);
                            formBody.append(ele);
                            return;
                        }
                        if(item.type == "files"){
                        	// 计算分
                        	row = $.tmpl(Form.statics.rowTmpl, {
                        			"row_": count
                        		});
                    		formBody.append(row);
                        	if (count % rowEleNum != 0) {
                        		count++;
                        	}
	                        var wrapper = $.tmpl(Form.statics.eleTmpl,
	                            {
	                                "span_": "12"
	                            });
	                        
	                        // 构建元素
	                        that._buildModuleWrapper(wrapper, item);
	                        row.append(wrapper);
                        }else if(item.type == "kindEditor"){
                        	// 计算分
                        	row = $.tmpl(Form.statics.rowTmpl, {
                        			"row_": count
                        		});
                    		formBody.append(row);
                        	if (count % rowEleNum != 0) {
                        		count++;
                        	}
	                        var wrapper = $.tmpl(Form.statics.eleTmpl,
	                            {
	                                "span_": "12"
	                            });
	                        
	                        // 构建元素
	                        that._buildModuleWrapper(wrapper, item);
	                        row.append(wrapper);
                        }else{
                        	// 计算分布
                        	if (count % rowEleNum == 0) {
                        		row = $.tmpl(Form.statics.rowTmpl, {
                        			"row_": count
                        		});
                        		formBody.append(row);
                        	}
                        	count++;
	                        var wrapper = $.tmpl(Form.statics.eleTmpl,
	                            {
	                                "span_": rowEleSpan
	                            });
	                        
	                        // 构建元素
	                        that._buildModuleWrapper(wrapper, item);
	                        row.append(wrapper);
                        }
                        // validate
                        if (item.rule != undefined) {
                            that._validateOptions.rules[item.name] = item.rule;
                        }
                        if (item.message != undefined) {
                            that._validateOptions.messages[item.name] = item.message;
                        }

                    } else {
                        if (item.type == "section") {
                            row = $.tmpl(Form.statics.rowTmpl, {
                                "row_": count
                            });
                            var section = $.tmpl(
                                Form.statics.sectionTmpl, {
                                    "title_": item.title
                                });
                            row.append(section);
                            formBody.append(row);
                            count = 0;
                        }
                    }

                });

        },
        _buildModuleWrapper: function (wrapper, item) {
            var that = this;
            var ele = this._formEles[item.type](item, this);
            if(item.type== "kindEditor"){
            	
            }else{
            var label = $.tmpl(Form.statics.labelTmpl, {
                "cls_": that._labelInline ? "col-md-3" : "",
                "label_": item.label == undefined ? "" : item.label,
               "redMsg_":item.rule==undefined ?"":item.rule.required==undefined ? "" : "*",
            });
            wrapper.find(".form-group").append(label);
            }
            var help;
            if (item.detail != undefined) {
                help = $.tmpl(Form.statics.blockSpanTmpl, {
                    "help_": item.detail
                });
            }
            if (that._labelInline) {
            	var div = $('<div class="col-md-9"></div>');
            	if(item.type== "kindEditor"){
            		div = $('<div class="col-md-12"></div>');
                }else{
                	
                }
                if (item.showIcon) {
                    item.icon = "";
                }
                if (item.icon != undefined) {
                    var iconDiv = $('<div class="input-icon '
                        + (item.iconAlign == undefined ? "right"
                            : item.iconAlign) + '"></div>');
                    if (item.cls != undefined) {
                        iconDiv.addClass(item.cls);
                    }
                    var icon = $('<i class="' + item.icon + '"></i>');
                    iconDiv.append(icon);
                    iconDiv.append(ele);
                    div.append(iconDiv);
                } else {
                    div.append(ele);
                }
                if (help != undefined) {
                    div.append(help);
                }
                wrapper.find(".form-group").append(div);
            } else {
                if (item.icon != undefined) {
                    var iconDiv = $('<div class="input-icon '
                        + (item.iconAlign == undefined ? "right"
                            : item.iconAlign) + '"></div>');
                    if (item.cls != undefined) {
                        iconDiv.addClass(item.cls);
                    }
                    var icon = $('<i class="' + item.icon + '"></i>');
                    iconDiv.append(icon);
                    iconDiv.append(ele);
                    wrapper.find(".form-group").append(iconDiv);
                    if (help != undefined) {
                        wrapper.find(".form-group").append(help);
                    }
                } else {
                    wrapper.find(".form-group").append(ele);
                    if (help != undefined) {
                        wrapper.find(".form-group").append(help);
                    }
                }
            }

            // 记录元素数据
            wrapper.data("data", item);
            this._module[item.name] = wrapper;
        },
        _renderActionButtons: function (formAction) {
            var that = this;
            if (this._showReset) {
                var resetBtn = $.tmpl(Form.statics.buttonTmpl, {
                    "type_": "button",
                    "attribute_": "role=reset",
                    "cls_": "default btn-lg",
                    "text_": that._resetText
                });
                formAction.append(resetBtn);
                resetBtn.on("click", function () {
                    that._reset();
                });
                resetBtn.after("&nbsp;");
            }
            if (this._showSubmit) {
                var submitBtn = $.tmpl(Form.statics.buttonTmpl, {
                    "type_": that._isValidate ? "submit" : "button",
                    "attribute_": "role=submit",
                    "cls_": "blue btn-lg",
                    "text_": that._submitText
                });
                formAction.append(submitBtn);
                submitBtn.after("&nbsp;");
            }
            if (this._showShenheButton) {
                var submitBtn = $.tmpl(Form.statics.buttonTmpl, {
                    "type_": "submit",
                    "attribute_": "role=shenhe",
                    "cls_": "blue btn-lg",
                    "text_": that._shenheText
                });
                submitBtn.on("click", function () {
                	this._action = that._shenheAction;
                });
                formAction.append(submitBtn);
                submitBtn.after("&nbsp;");
            }
            if (this._showPublishButton) {
                var submitBtn = $.tmpl(Form.statics.buttonTmpl, {
                    "type_": "submit" ,
                    "attribute_": "role=publish",
                    "cls_": "blue btn-lg",
                    "text_": that._publishText
                });
                submitBtn.on("click", function () {
                	this._action = that._publishAction
                });
                formAction.append(submitBtn);
                submitBtn.after("&nbsp;");
            }
            if (this._buttons != undefined && this._buttons.length > 0) {
                $.each(this._buttons, function (i, button) {
                    var btn = $.tmpl(Form.statics.buttonTmpl, {
                        "type_": button.type == undefined ? "button"
                            : button.type,
                        "attribute_": button.attribute == undefined ? ""
                            : button.attribute,
                        "cls_": button.cls == undefined ? "default btn-lg"
                            : button.cls,
                        "text_": button.text
                    });
                    if (button.handle != undefined) {
                        btn.on("click", function () {
                            button.handle();
                        });
                    }
                    formAction.append(btn);
                    btn.after("&nbsp;");
                });
            }
        },
        _formEles: {
            'display': function (data, form) {
                var textTmpl = '<p id="${id_}" name="${name_}" ${attribute_} class="form-control-static"></p>';
                var ele = $.tmpl(textTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                ele.data("format", data.format);
                return ele;
            },
            'hidden': function (data, form) {
                var textTmpl = '<input type="hidden" id="${id_}" name="${name_}" class="form-control" ${attribute_}>';
                var ele = $.tmpl(textTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                return ele;
            },
            'text': function (data, form) {
                var textTmpl = '<input type="text" showicon=${showIcon_} id="${id_}" name="${name_}" class="form-control ${cls_}" ${readonly_} ${disabled_} ${attribute_} placeholder="${placeholder_}">';
                var ele = $.tmpl(textTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "showIcon_": data.showIcon == undefined ? false
                        : data.showIcon,
                    "placeholder_": (data.placeholder == undefined ? ""
                        : data.placeholder),
                    "cls_": data.cls == undefined ? ""
                        : (data.icon != undefined ? "" : data.cls),
                    "readonly_": (data.readonly ? "readonly" : ""),
                    "disabled_": (data.disabled ? "disabled" : ""),
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                return ele;
            },
            'textButton': function (data, form) {
                var buttonInputImpl = '<div class="input-icon"><input showicon=${showIcon_} id="${id_}" class="form-control ${cls_}" ${readonly_} ${disabled_} ${attribute_} name="${name_}" placeholder="${placeholder_}" type="text">'
                	+'</div><span class="input-group-btn"><button id="${id_}_button" class="btn btn-success" type="button"> ${buttonName_}</button></span></div></div>';
                var ele = $.tmpl(textTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "showIcon_": data.showIcon == undefined ? false
                        : data.showIcon,
                    "placeholder_": (data.placeholder == undefined ? ""
                        : data.placeholder),
                    "cls_": data.cls == undefined ? ""
                        : (data.icon != undefined ? "" : data.cls),
                    "readonly_": (data.readonly ? "readonly" : ""),
                    "disabled_": (data.disabled ? "disabled" : ""),
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute),
                    "buttonName_":(data.buttonName == undefined ? "按钮":data.buttonName)
                });
                return ele;
            },
            'password': function (data, form) {
                var passwordTmpl = '<input type="password" id="${id_}" name="${name_}" class="form-control ${cls_}" ${readonly_} ${disabled_} ${attribute_} placeholder="${placeholder_}">';
                var ele = $.tmpl(passwordTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "placeholder_": (data.placeholder == undefined ? ""
                        : data.placeholder),
                    "cls_": data.cls == undefined ? ""
                        : (data.icon != undefined ? "" : data.cls),
                    "readonly_": (data.readonly ? "readonly" : ""),
                    "disabled_": (data.disabled ? "disabled" : ""),
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                return ele;
            },
            'textarea': function (data, form) {
                var textareaTmpl = '<textarea id="${id_}" name="${name_}" class="form-control ${cls_}" ${readonly_} ${disabled_} ${attribute_} rows="${rows_}"></textarea>';
                var ele = $.tmpl(textareaTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "rows_": (data.rows == undefined ? "3" : data.rows),
                    "cls_": data.cls == undefined ? "" : data.cls,
                    "readonly_": (data.readonly ? "readonly" : ""),
                    "disabled_": (data.disabled ? "disabled" : ""),
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                return ele;
            },
            'select': function (data, form) {
                var selectTmpl = '<select id="${id_}" name="${name_}" ${attribute_} ${disabled_} class="form-control ${cls_}"></select>';
                var optionTmpl = '<option value=${value_} ${selected}>${text_}</option>';
                var ele = $.tmpl(selectTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "cls_": data.cls == undefined ? "" : data.cls,
                    "disabled_": (data.disabled ? "disabled" : ""),
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                $.each(data.items, function (i, option) {
                    var opt = $.tmpl(optionTmpl, {
                        "value_": option.value,
                        "text_": option.text,
                        "selected": (option.selected ? "selected" : "")
                    });
                    ele.append(opt);
                });
                if (data.itemsUrl != undefined) {
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        async: data.async ? true : false,
                        url: data.itemsUrl,
                        success: function (options) {
                            $.each(options, function (i, option) {
                                var opt = $.tmpl(optionTmpl, {
                                    "value_": option.value,
                                    "text_": option.text,
                                    "selected": (option.selected ? "selected"
                                        : "")
                                });
                                ele.append(opt);
                            });
                        }
                    });
                }
                return ele;
            },
            'checkboxGroup': function (data, form) {
                var inlineCls = "checkbox-inline";
                var wrapperTmpl = '<div id="${id_}_cbg" name="${name_}_cbg" ${attribute_} class="checkbox-list"></div>';
                var checkboxTmpl = '<label class="${inline_}"><input name="${name_}" value="${value_}" type="checkbox" ${checked_} ${attribute_} ${disabled_} >${text_}</label>';
                var ele = $.tmpl(wrapperTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });

                $
                    .each(
                    data.items,
                    function (i, checkbox) {
                        var cb = $
                            .tmpl(
                            checkboxTmpl,
                            {
                                "inline_": data.inline ? inlineCls
                                    : "",
                                "name_": data.name,
                                "value_": checkbox.value,
                                "text_": checkbox.text,
                                "checked_": (checkbox.checked ? "checked=checked"
                                    : ""),
                                "disabled_": (checkbox.disabled ? "disabled"
                                    : ""),
                                "attribute_": (checkbox.attribute == undefined ? ""
                                    : checkbox.attribute)
                            });
                        ele.append(cb);
                    });
                if (data.itemsUrl != undefined) {
                    $
                        .ajax({
                            type: "POST",
                            dataType: "json",
                            async: data.async ? true : false,
                            url: data.itemsUrl,
                            success: function (cbs) {
                                $
                                    .each(
                                    cbs,
                                    function (i, checkbox) {
                                        var cb = $
                                            .tmpl(
                                            checkboxTmpl,
                                            {
                                                "inline_": data.inline ? inlineCls
                                                    : "",
                                                "name_": data.name,
                                                "value_": checkbox.value,
                                                "text_": checkbox.text,
                                                "checked": (checkbox.checked ? "checked=checked"
                                                    : ""),
                                                "disabled_": (checkbox.disabled ? "disabled"
                                                    : ""),
                                                "attribute_": (checkbox.attribute == undefined ? ""
                                                    : checkbox.attribute)
                                            });
                                        ele.append(cb);
                                        Form.prototype
                                            ._uniform();
                                    });
                            }
                        });
                }
                return ele;

            },
            'radioGroup': function (data, form) {
                var inlineCls = "radio-inline";
                var wrapperTmpl = '<div class="radio-list"></div>';
                var radioTmpl = '<label class="${inline_}"><input name="${name_}" value="${value_}" type="radio" ${checked_} ${attribute_}>${text_}</label>';
                var ele = $.tmpl(wrapperTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "attribute_": (data.attribute == undefined ? ""
                        : data.attribute)
                });
                $.each(data.items, function (i, radio) {
                    var rd = $.tmpl(radioTmpl, {
                        "inline_": data.inline ? inlineCls : "",
                        "name_": data.name,
                        "value_": radio.value,
                        "text_": radio.text,
                        "checked_": (radio.checked ? "checked=checked" : ""),
                        "attribute_": (radio.attribute == undefined ? ""
                            : radio.attribute)
                    });
                    ele.append(rd);
                });
                if (data.itemsUrl != undefined) {
                    $
                        .ajax({
                            type: "POST",
                            dataType: "json",
                            async: data.async ? true : false,
                            url: data.itemsUrl,
                            success: function (rds) {
                                $
                                    .each(
                                    rds,
                                    function (i, radio) {
                                        var rd = $
                                            .tmpl(
                                            radioTmpl,
                                            {
                                                "inline_": data.inline ? inlineCls
                                                    : "",
                                                "name_": data.name,
                                                "value_": radio.value,
                                                "text_": radio.text,
                                                "checked_": (radio.checked ? "checked=checked"
                                                    : ""),
                                                "attribute_": (radio.attribute == undefined ? ""
                                                    : radio.attribute)
                                            });
                                        ele.append(rd);
                                        Form.prototype
                                            ._uniform();
                                    });
                            }
                        });
                }
                return ele;
            },
            'tag': function (data, form) {
                var tagTmpl = '<input id="${id_}" name="${name_}" role="tag" type="text" class="form-control tags" value=""/>';
                var ele = $.tmpl(tagTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name
                });
                var option = {
                    'height': data.height == undefined ? '100px' : '', // 设置高度
                    'width': data.width == undefined ? 'auto' : '', // 设置高度
                    'defaultText': data.defaultText == undefined ? '添加标签'
                        : data.defaultText, // 默认文字
                    'minChars': data.min == undefined ? 1 : data.min, // 每个标签的小最字符
                    'maxChars': data.min == undefined ? 0 : data.min, // 每个标签的最大字符，如果不设置或者为0，就是无限大
                    'placeholderColor': data.color == undefined ? '#666666'
                        : data.color
                    // 设置defaultText的颜色
                };
                ele.data("option", option);
                return ele;
            },
            'colorpicker': function (data, form) {
                var colorTmpl = '<input type="text" role="color" id="${id_}" name=${name_} class="form-control input-medium ${cls_}" data-position="bottom left" value="#000000">';
                var ele = $.tmpl(colorTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "cls_": data.cls == undefined ? "" : data.cls
                });
                return ele;
            },
            'datepicker': function (data, form) {
                var dateTmpl = '<div class="input-group input-medium">'
                    + '<input type="text" role="date-input" id="${id_}" name=${name_} class="form-control">'
                    + '<span role="icon" class="input-group-addon">'
                    + '<i class="fa fa-calendar"></i>' + '</span></div>';
                var ele = $.tmpl(dateTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "cls_": data.cls == undefined ? "" : data.cls
                });
                ele.find('[role="date-input"]').on("click", function () {
                    laydate({
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss'
                    });
                });
                ele.find('[role="icon"]').on(
                    "click",
                    function () {
                        laydate({
                            istime: true,
                            format: 'YYYY-MM-DD hh:mm:ss',
                            elem: '#'
                            + (data.id == undefined ? data.name
                                : data.id)
                        });
                    });
                return ele;
            },
            'file': function (data, form) {
                var fileTmpl = '<div><div class="fileinput fileinput-new" data-provides="fileinput">'
                    + '<div class="input-group input-large">'
                    + '<div class="form-control uneditable-input span3" data-trigger="fileinput">'
                    + '<i class="fa fa-file fileinput-exists"></i>&nbsp; <span class="fileinput-filename "></span>'
                    + '</div>'
                    + '<span class="input-group-addon btn default btn-file">'
                    + '<span class="fileinput-new">选择文件 </span>'
                    + '<span class="fileinput-exists">变更 </span>'
                    + '<input type="text" role="file-input" id="${id_}" name="${name_}" value="" style="display:none;"><input type="file" role="file" id="file_${id_}" name="file"/>'
                    + '</span>'
                    + '<a href="javascript:;" class="input-group-addon btn red fileinput-exists" data-dismiss="fileinput">删除 </a>'
                    + '</div></div></div>';
                var ele = $.tmpl(fileTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name
                });
                if (data.isAjaxUpload && data.uploadUrl != undefined) {

                    var uploadFile = function () {
                        if ($("#file_" + data.id).val() == "") {
                            return;
                        }
                        $
                            .ajaxFileUpload({
                                url: data.uploadUrl,
                                type: "POST",
                                secureuri: false,
                                fileElementId: "file_" + data.id,
                                dataType: "json",
                                success: function (json, status) {
                                    if (data.onSuccess != undefined) {
                                        data.onSuccess(json);
                                        successIcon.show();
                                    } else {
                                        if (json.fileUrl != undefined) {
                                            ele.find("[role='file-input']")
                                                .attr("value",
                                                data.fileUrl);
                                            successIcon.show();
                                        } else {
                                            console
                                                .error("返回的json数据中为检测到fileUrl值");
                                        }
                                    }
                                },
                                error: function (data, status, e) {
                                    alert(e);
                                }
                            });
                    };
                    if (data.autoUpload) {
                        ele.find('[role="file"]').on("change", function () {
                            uploadFile();
                        });
                    } else {
                        var upload = $('<a href="javascript:;" role="upload" class="input-group-addon btn green fileinput-exists">上传 </a>');
                        ele.find(".input-group").append(upload);
                        upload.click(function () {
                            uploadFile();
                        });
                    }
                    var successIcon = $('<a href="javascript:;" class="input-group-addon btn" style="border-color: white;background:white;cursor:default;"><i class="fa fa-check" style="color: #45B6AF;cursor:default;"></i></a>');
                    successIcon.hide();
                    ele.find(".input-group").append(successIcon);
                    ele.find('[data-dismiss="fileinput"]').click(function () {
                        form._refreshItem(data.name);
                    });
                }
                return ele;
            },
            'files': function (data, form) {
                var filesTmpl = '<span class="btn green fileinput-button">'
                    + '<i class="fa fa-plus"></i>'
                    + '<span>添加附件... </span>'
                    + '  <input type="file" role="fileuploadInput" id="fileupload_${id_}" name="files[]" multiple="">'
                    + '  </span>';
                var btn = $.tmpl(filesTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id)
                });
                btn.find("input[role=fileuploadInput]").data("data", data);
                var tableTmpl = '<table id="file_table_${id_}" name="'
                    + data.name + '" role="presentation" class="table table-striped clearfix"><tbody class="files"></tbody></table>';
                var table = $.tmpl(tableTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id)
                });
                table.data("data", data);
                var eleTmpl = '<div id="files_div_${id_}" name="files_div_${name_}"></div>';
                var ele = $.tmpl(eleTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                });
                ele.append(btn);
                ele.append(table);
                return ele;
            },
            'image': function (data, form) {
                var imageTmpl = '<div><div class="fileinput fileinput-new" data-provides="fileinput">'
                    + '<div class="fileinput-preview thumbnail" role="preview" data-trigger="fileinput" style="width: 200px; height: 150px; line-height: 150px;"></div>'
                    + '<div role="imageDiv">'
                    + '<span class="btn default btn-file">'
                    + '<span class="fileinput-new">选择图片 </span>'
                    + '<span class="fileinput-exists">更改</span>'
                    + '<input type="text" role="image-input" id="${id_}" name="${name_}" style="display:none;"><input role="file" type="file" id="image_${id_}" name="file"/>'
                    + '</span>'
                    + '<a href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput">删除</a>'
                    + '</div></div></div>';
                var ele = $.tmpl(imageTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name
                });

                if (data.isAjaxUpload && data.uploadUrl != undefined) {
                    // 上传符号
                    var successIcon = $('<a href="javascript:;" class="btn" style="border-color: white;background:white;cursor:default;"><i class="fa fa-check" style="color: #45B6AF;cursor:default;"></i></a>');
                    successIcon.hide();
                    ele.find("[role='imageDiv']").append(successIcon);
                    // 删除事件
                    ele.find('[data-dismiss="fileinput"]').click(function () {
                        form._refreshItem(data.name);
                    });
                    // 上传
                    var uploadFile = function () {
                        if (ele.find("[role='file']").val() == "") {
                            return;
                        } else {
                            var file = ele.find("[role='file']").val();
                            var type = file.substring(file.lastIndexOf("."));
                            if (!(type.toLowerCase() == ".jpg"
                                || type.toLowerCase() == ".png"
                                || type.toLowerCase() == ".bmp" || type
                                    .toLowerCase() == ".jpeg")) {
                                alert("必须是.jpp,.png,.bmp,.jpeg格式中的一种");
                                return;
                            }
                        }
                        $
                            .ajaxFileUpload({
                                url: data.uploadUrl,
                                type: "POST",
                                fileElementId: "image_" + data.id,
                                dataType: "json",
                                success: function (json, status) {
                                    if (ele.find("[role='preview']").length == 0) {
                                        var preview = ele
                                            .find("[role='preview']");
                                        var $img = $('<img>');
                                        $img[0].src = json.fileUrl;
                                        if (preview.css('max-height') != 'none')
                                            $img
                                                .css(
                                                'max-height',
                                                parseInt(
                                                    preview
                                                        .css('max-height'),
                                                    10)
                                                - parseInt(
                                                    preview
                                                        .css('padding-top'),
                                                    10)
                                                - parseInt(
                                                    preview
                                                        .css('padding-bottom'),
                                                    10)
                                                - parseInt(
                                                    preview
                                                        .css('border-top'),
                                                    10)
                                                - parseInt(
                                                    preview
                                                        .css('border-bottom'),
                                                    10))
                                        preview.html($img);
                                    }
                                    if (data.onSuccess != undefined) {
                                        data.onSuccess(json);
                                    } else {
                                        if (json.fileUrl != undefined) {
                                            ele
                                                .find(
                                                "[role='image-input']")
                                                .attr("value",
                                                data.fileUrl);
                                        } else {
                                            console
                                                .error("返回的json数据中为检测到fileUrl值");
                                        }
                                    }
                                    successIcon.show();
                                },
                                error: function (data, status, e) {
                                    alert(e);
                                }
                            });
                    };
                    if (data.autoUpload) {
                        ele.find('[role="file"]').on("change", function () {
                            uploadFile();
                        });
                    } else {
                        var upload = $('<a href="javascript:;" role="upload" class="btn green fileinput-exists">上传 </a>');
                        ele.find("[role='imageDiv']").append(upload);
                        upload.on("click", function () {
                            uploadFile();
                        });
                    }
                }
                return ele;
            },
            'tree': function (data, form) {
                var treeTmp = '<input role="tree_${id_}_input" data-type="tree-input" type="text" id="${id_}" name="${name_}" value="" class="hide"/>'
                    + '<ul id="tree_${id_}" role="tree" class="ztree"></ul>';
                var ele = $.tmpl(treeTmp, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name
                });
                var chkboxType = data.chkboxType==undefined ? {"Y": "p","N": "p"}:data.chkboxType;
                var beforeCheck  =data.beforeCheck ==undefined?function(){}:data.beforeCheck ;
                var setting = {
                    check: {
                        enable: true,
                        chkStyle: data.chkStyle,
                        radioType: "all",
                        chkboxType: chkboxType
                    },
                    data: {
                        simpleData: {
                            enable: true
                        }
                    },
                    async: {
                        enable: true,
                        url: data.url,
                        autoParam: data.autoParam
                    },
                    callback: {
                    	beforeCheck :beforeCheck,
                        onCheck: function (e, treeId, treeNode) {
                            var zTree = $.fn.zTree.getZTreeObj(treeId);
                            nodes = zTree.getCheckedNodes(true);
                            var ids = [];
                            if (nodes.length > 0) {
                                for (var i in nodes) {
                                    ids.push(nodes[i].id);
                                }
                                $("[role='" + treeId + "_input']").val(ids)
                                    .attr("value", ids);
                            } else {
                                $("[role='" + treeId + "_input']").val("")
                                    .attr("value", "");
                            }
                        },
                        onAsyncSuccess: function (event, treeId, treeNode, msg) {
                            var zTree = $.fn.zTree.getZTreeObj(treeId);
                            var value = $("[role='" + treeId + "_input']")
                                .attr("value");
                            if (value != "") {
                                var ids = value.split(",");
                                if (ids.length > 0) {
                                    for (var i in ids) {
                                        var c_node = zTree.getNodeByParam("id",
                                            ids[i], null);
                                        if (c_node) {
                                            zTree
                                                .checkNode(c_node, true,
                                                false);
                                        }
                                    }
                                }
                            }
                            zTree.expandAll(data.expandAll == undefined ? false
                                : data.expandAll);
                        }
                    }
                };
                ele.data("setting", setting);
                return ele;
            },
            'kindEditor': function (data, form) {
                var kindeditorTmpl = '<textarea role="kindEditor" class="form-control" id="${id_}" name="${name_}"></textarea>';
                var ele = $.tmpl(kindeditorTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name
                });
                ele.data("width", data.width == undefined ? "670px"
                    : data.width);
                ele.data("height", data.height == undefined ? "400px"
                    : data.height);
                return ele;
            },
            'fileEditor': function (data, form) {
                var kindeditorTmpl = '<input role="fileEditor" class="form-control" id="${id_}" name="${name_}"></input><input type="button" id="${id_}insertfile" value="${text_}" />';
                var ele = $.tmpl(kindeditorTmpl, {
                    "id_": (data.id == undefined ? data.name : data.id),
                    "name_": data.name,
                    "text_":(data.text == undefined ?"选择文件" :data.text )
                });
                return ele;
            }
        },
        _regiestEvents: function () {
            this._uniform();
            this._tagInput();
            this._minicolors();
            this._initTree();
            this._initKindEditor();
            this._initFileEditor();
            this._initSubmit();
            this._initShowIconText();
            this._initMultiFileUpload();
        },
        _uniform: function () {
            if (!$().uniform) {
                return;
            }
            var test = $("input[type=checkbox]:not(.toggle), input[type=radio]:not(.toggle, .star)");
            if (test.size() > 0) {
                test.each(function () {
                    $(this).show();
                    $(this).uniform();
                });
            }
        },
        _tagInput: function () {
            if (!$().tagsInput) {
                return;
            }
            $('[role="tag"]').each(function () {
                $(this).tagsInput($(this).data("option"));
            });
        },
        _minicolors: function () {
            if (!$().minicolors) {
                return;
            }
            $('[role="color"]')
                .each(
                function () {
                    $(this)
                        .minicolors(
                        {
                            control: $(this).attr(
                                'data-control')
                            || 'hue',
                            defaultValue: $(this)
                                .val()
                            || $(this)
                                .attr(
                                'data-defaultValue'),
                            inline: $(this).attr(
                                'data-inline') === 'true',
                            letterCase: $(this).attr(
                                'data-letterCase')
                            || 'lowercase',
                            opacity: $(this).attr(
                                'data-opacity'),
                            position: $(this).attr(
                                'data-position')
                            || 'bottom left',
                            theme: 'bootstrap'
                        });
                });
        },
        _initTree: function () {
            if (!$.fn.zTree) {
                return;
            }
            $('[role="tree"]').each(function () {
                var tree = $(this);
                $.fn.zTree.init(tree, tree.data("setting"));
            });
        },
        _initKindEditor: function () {
            var that = this;
            if (KE) {
                $('[role="kindEditor"]')
                    .each(
                    function () {
                        var ele = $(this);
                        var editor = KE
                            .create(
                            '#' + ele.attr("id"),
                            {
                                uploadJson: dm_root
                                + '/KE/file_upload',
                                fileManagerJson: dm_root
                                + '/KE/file_manager',
                                width: ele
                                    .data("width") == undefined ? '600'
                                    : ele
                                    .data("width"),
                                height: ele
                                    .data("height") == undefined ? '400'
                                    : ele
                                    .data("height"),
                                allowFileManager: true,
                                afterBlur: function () {
                                    this.sync();
                                },
                                resizeType: 1
                            });
                        that._editor[ele.attr("id")] = editor;
                    });
            }
        },
        _initFileEditor: function () {
            var that = this;
            if (KE) {
                $('[role="fileEditor"]')
                    .each(
                    function () {
                        var ele = $(this);
                        var editor = KE.editor({
        					allowFileManager : true,
        					 uploadJson: dm_root
                             + '/KE/file_upload',
                             fileManagerJson: dm_root
                             + '/KE/file_manager'
        				});
        				KE('#'+ele.attr("id")+'insertfile').click(function() {
        					editor.loadPlugin('insertfile', function() {
    							editor.plugin.fileDialog({
    								fileUrl : KE('#'+ele.attr("id")).val(),
    								clickFn : function(url, title) {
    									KE('#'+ele.attr("id")).val(url);
    									editor.hideDialog();
    								}
    							});
        					});
        				});
                    });
            }
        },
        _initValidate: function () {
            var that = this;
            if (!$().validate) {
                console.error("validate.js未引入");
                return;
            }
            var validateOptions = {
                errorElement: 'span',
                errorClass: 'help-block help-block-error',
                focusInvalid: true,
                ignore: "",
                errorPlacement: function (error, element) {
                    if (element.parent(".input-group").size() > 0) {
                        error.insertAfter(element.parent(".input-group"));
                    } else if (element.attr("data-error-container")) {
                        error.appendTo(element);
                    } else if (element.parents('.radio-list').size() > 0) {
                        error.appendTo(element.parents('.radio-list'));
                    } else if (element.parents('.radio-inline').size() > 0) {
                        error.appendTo(element.parents('.radio-inline'));
                    } else if (element.parents('.checkbox-list').size() > 0) {
                        error.appendTo(element.parents('.checkbox-list'));
                    } else if (element.parents('.checkbox-inline').size() > 0) {
                        error.appendTo(element.parents('.checkbox-inline'));
                    } else {
                        error.appendTo(element.parents(".form-group").find(
                            "div:first"));
                    }
                },
                highlight: function (element) {
                    $(element).closest('.form-group').addClass('has-error');
                },

                unhighlight: function (element) {
                    $(element).closest('.form-group').removeClass('has-error');
                    $(element).closest('.form-group').find('.help-block-error')
                        .empty();
                },

                success: function (label) {
                    label.closest('.form-group').removeClass('has-error');
                },
                submitHandler: function (form) {
                    that._submitForm();
                }
                
            };
            this._validateOptions = $.extend(true, {}, validateOptions,
                this._validateOptions);
            this.$form.validate(this._validateOptions);
        },
        _initSubmit: function () {
            var that = this;
            if (this._isValidate) {
                this._initValidate();
            } else {
                $('button[role="submit"]').on("click", function () {
                    that._submitForm();
                });
                if(that._showPublishButton){
	                $('button[role="publish"]').on("click", function () {
	                    that._submitPublishForm();
	                });
                }
                if(that._showShenheButton){
                $('button[role="shenhe"]').on("click", function () {
                    that._submitShenheForm();
                });
                }
            }
        },
        _initShowIconText: function () {
            var that = this;
            $('input[showicon="true"]').bind("input propertychange",
                function () {
                    $(this).prev().attr("class", $(this).val());
                });
        },
        _submitForm: function () {
            var that = this;
            if (this._beforeSubmit != undefined) {
                var result = that._beforeSubmit();
            } else {

            }
            if (result == false) {
                return;
            }
            if (this._ajaxSubmit) {
                var btn = $('button[role="submit"]');
                var modalbody = $('div .modal-body');
                btn.attr('disabled',true);
                $("body").mLoading("show");
                $.ajax({
                    type: that._method,
                    url: that._action,
                    data: $('#' + that._formId).serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (!DmCheck(data)) {
                            return;
                        }
                        if (that._ajaxSuccess != undefined) {
                            that._ajaxSuccess(data);
                        } else {
                            alert("表单提交成功");
                        }
                        btn.attr('disabled',false);
                        $("body").mLoading("hide");
                    },
                    error: function (data) {
                        alert("异步提交表单错误.");
                        btn.attr('disabled',false);
                        $("body").mLoading("hide");
                    }
                });
            } else {
                that.$form.submit();
            }
        },
        _submitShenheForm: function () {
            var that = this;
            if (this._beforeSubmit != undefined) {
                var result = that._beforeSubmit();
            }
            if (result == false) {
                return;
            }
            if (this._ajaxSubmit) {
                $.ajax({
                    type: that._method,
                    url: that._shenheAction,
                    data: $('#' + that._formId).serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (!DmCheck(data)) {
                            return;
                        }
                        if (that._ajaxSuccess != undefined) {
                            that._ajaxSuccess(data);
                        } else {
                            alert("表单提交成功");
                        }
                    },
                    error: function (data) {
                        alert("异步提交表单错误.");
                    }
                });
            } else {
                that.$form.submit();
            }
        },
        _submitPublishForm: function () {
            var that = this;
            if (this._beforeSubmit != undefined) {
                var result = that._beforeSubmit();
            }
            if (result == false) {
                return;
            }
            if (this._ajaxSubmit) {
                $.ajax({
                    type: that._method,
                    url: that._publishAction,
                    data: $('#' + that._formId).serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (!DmCheck(data)) {
                            return;
                        }
                        if (that._ajaxSuccess != undefined) {
                            that._ajaxSuccess(data);
                        } else {
                            alert("表单提交成功");
                        }
                    },
                    error: function (data) {
                        alert("异步提交表单错误.");
                    }
                });
            } else {
                that.$form.submit();
            }
        },
        _initMultiFileUpload: function () {
            var template = '<tr class="template-upload fade in">'
                + '<td style="width: 20%;">'
                + '<span class="preview"><img alt="${alt_}" width="46" height="40"></span>'
                + '</td>'
                + '<td style="width: 40%;vertical-align: middle;">'
                + '<p class="name">${fileName_}</p>'
                + '<p class="size">${fileSize_} KB</p>'
                + '</td>'
                + '<td style="width: 10%;vertical-align: middle;">'
                + '<span class="progress">0%</span>'
                + '</td>'
                + '<td style="width: 30%;vertical-align: middle;">'
                + '    <button type="button" data-loading-text="上传中..." class="btn btn-primary start">'
                + '       <i class="icon-upload icon-white"></i>'
                + '       <span>开始上传</span>'
                + '    </button>'
                + '    <button type="button" class="btn btn-warning cancel">'
                + '       <i class="icon-ban-circle icon-white"></i>'
                + '       <span >取消</span>' + '    </button>        '
                + '</td>'
                + '<input type="hidden" name="${attName_}" class="att"/>'
                + '</tr>';
            var deleteStr = '<span >删除</span>';
            var uploadUrl = dm_root + 'file/upload';
            var files = $("input[role=fileuploadInput]");
            if (files.length > 0) {
                $.each(files, function (i, file) {
                    var element_data = $(this).data("data");
                    var currentData = {};
                    if (element_data.uploadUrl != undefined)
                        uploadUrl = element_data.uploadUrl;
                    $('#fileupload_' + element_data.id)
                        .fileupload(
                        {
                            url: uploadUrl,
                            autoUpload: true,
                            dataType: 'json',
                            previewCrop: true,
                            success:function(data){
                            	if(data.status=='0'){
                            		alert(data.msg);
                            	}
                            },
                            add: function (e, data) {
                                var type = getLowCaseType(data.files[0].name);
                                var allowType = element_data.allowType == undefined ? "" : element_data.allowType;
                                var flag = false;
                                if (allowType != null && allowType != "") {
                                    var allows = allowType.split(",");
                                    for (var i in allows) {
                                        if (allows != null && allows != "") {
                                            if (allows[i].toLowerCase() == type) {
                                                flag = true;
                                            }
                                        }
                                    }
                                } else {
                                    flag = true;
                                }
                                if (!flag) {
                                    alert("上传格式限制为：" + allowType);
                                    return false;
                                }
                                if (element_data.limit != undefined) {
                                    var currentLength = $("table[name='" + element_data.fileName + "']").find("tbody.files > tr").length;
                                    if (currentLength >= element_data.limit) {
                                        alert("最多只能上传" + element_data.limit + "个附件！");
                                        return;
                                    }
                                }
                                var templateImpl = $
                                    .tmpl(
                                    template,
                                    {
                                        "alt_": type,
                                        "fileName_": data.files[0].name,
                                        "fileSize_": (data.files[0].size / 1000)
                                            .toFixed(2),
                                        "attName_": (element_data.name == undefined ? "attrIds"
                                            : element_data.name)
                                    });
                                $("#file_table_" + element_data.id).find("tbody.files").append(templateImpl);
                                data.content = templateImpl;
                                $(".start", templateImpl).click(
                                    function () {
                                        currentData.bar = templateImpl;
                                        $(this).button('loading');
                                        data.submit();
                                    });
                                $(".cancel", templateImpl).click(
                                    function () {
                                        data.abort();
                                        $(templateImpl).remove();
                                    });

                            },
                            done: function (e, data) {// 设置文件上传完毕事件的回调函数
                                $(".start", data.content).remove();
                               
                                var id = data.result.id;
                                var name = data.result.name;
                                var url = data.result.fileUrl;
                                if (element_data.convertData != undefined) {
                                    var arrays = element_data.convertData(data.result);
                                    id = arrays[0];
                                    name = arrays[1];
                                    url = arrays[2];
                                }
                                $(".att", data.content).val(id);
                                if (getLowCaseType(name) == ".jpg") {
                                    $(".preview", data.content).find("img").attr("src", url);
                                }
                                $(".cancel", data.content).html(deleteStr);
                            },
                            progressall: function (e, data) {// 设置上传进度事件的回调函数
                                var progress = parseInt(data.loaded
                                    / data.total * 100, 10);
                                $('.progress', data.content).text(progress + '%');
                            }
                        });
                });
            }

        },
        _doCallbacks: function () {
            if (this._complete != undefined) {
                this._complete();
            }
            if (this._callback != undefined) {
                this._callback();
            }
        },
        _loadValue: function (name, value) {
        	if(value instanceof Date){
        		value= value.Format();
        	}
            var ele = this.$form.find("[name='" + name + "']");
            if (ele.is('input[type="text"]')) {
                if (ele.attr("data-type") == "tree-input") {
                    ele.attr("value", value);
                    var tree = $.fn.zTree.getZTreeObj("tree_" + ele.attr("id"));
                    if (tree != undefined) {
                        tree.refresh();
                        tree.reAsyncChildNodes(null, "refresh");
                    }
                } else if (ele.attr("role") == "image-input") {
                	if(value!=undefined&&value!=''){
	                    ele.attr("value", value);
	                    preview = ele.parent().parent().parent().find(
	                        "[role='preview']");
	                    var $img = $('<img>');
	                    $img[0].src = value;
	                    if (preview.css('max-height') != 'none')
	                        $img.css('max-height', parseInt(preview
	                                .css('max-height'), 10)
	                            - parseInt(preview.css('padding-top'), 10)
	                            - parseInt(preview.css('padding-bottom'), 10)
	                            - parseInt(preview.css('border-top'), 10)
	                            - parseInt(preview.css('border-bottom'), 10))
	                    preview.html($img);
	                    preview.parent().removeClass("fileinput-new").addClass(
	                        "fileinput-exists");
                	}
                } else if (ele.attr("role") == "file-input") {
                    ele.attr("value", value);
                    ele.parent().parent().parent().removeClass("fileinput-new")
                        .addClass("fileinput-exists");
                    ele.parent().parent().parent().find(
                        "span.fileinput-filename ").text(
                        value.substring(value.lastIndexOf("/") + 1));
                } else if (ele.attr("role") == "color") {
                    ele.next().find(".minicolors-swatch-color").css(
                        "background-color", value);
                    ele.val(value);
                } else if (ele.attr("role") == "tag") {
                    if (value != null) {
                        ele.importTags(value);
                    }
                } else if (ele.attr("showicon") == "true") {
                    ele.val(value);
                    ele.prev().attr("class", value);
                } else {
                    ele.val(value);
                }
            } else if (ele.is('input[type="radio"]')) {
                this.$form.find(
                    "input[type='radio'][name='" + name + "'][value='"
                    + value + "']").attr("checked", true);
            } else if (ele.is('input[type="checkbox"]')) {
            	/*this.$form.find("input[type='checkbox'][name='" + name
                            + "']").removeAttr("checked");*/
                if (value != null) {
                    var values = value.split(",");
                    for (var i in values) {
                        this.$form.find(
                            "input[type='checkbox'][name='" + name
                            + "'][value='" + values[i] + "']")
                            .attr("checked", true);
                    }
                }
            } else if (ele.is('input[type="hidden"]')) {
                if (value != null && value != "") {
                    if (ele.attr("data-type") == "tree-input") {
                        ele.val(value);
                        var tree = $.fn.zTree.getZTreeObj("tree_"
                            + ele.attr("id"));
                        if (tree != undefined) {
                            tree.refresh();
                            tree.reAsyncChildNodes(null, "refresh");
                        }
                    } else if (ele.attr("role") == "image-input") {
                    	if(value!=undefined&&value!=''){
	                        ele.val(value);
	                        var preview = ele.parent().parent().parent().find(
	                            "[role='preview']");
	                        var $img = $('<img>');
	                        $img[0].src = value;
	                        if (preview.css('max-height') != 'none')
	                            $img.css('max-height',
	                                parseInt(preview.css('max-height'), 10)
	                                - parseInt(preview
	                                    .css('padding-top'), 10)
	                                - parseInt(preview
	                                    .css('padding-bottom'), 10)
	                                - parseInt(preview
	                                    .css('border-top'), 10)
	                                - parseInt(preview
	                                    .css('border-bottom'), 10))
	                        preview.html($img);
	                        preview.parent().removeClass("fileinput-new").addClass(
	                            "fileinput-exists");
                    	}
                    } else if (ele.attr("role") == "file-input") {
                        ele.val(value);
                        ele.parent().parent().parent().removeClass(
                            "fileinput-new").addClass("fileinput-exists");
                        ele.parent().parent().parent().find(
                            "span.fileinput-filename ").text(
                            value.substring(value.lastIndexOf("/") + 1));
                    } else {
                        ele.val(value);
                    }
                }
            } else if (ele.is('select')) {
                ele.val(value);
            } else if (ele.is('textarea')) {
                if (ele.attr("role") == "kindEditor") {
                    ele.text(value);
                    if (value != null) {
                        var editor = this._editor[ele.attr("id")];
                        editor.html(value);
                        editor.sync();
                    }
                } else {
                    if (value != null) {
                        ele.text(value);
                    }
                }
            } else if (ele.is('p')) {
                var format = ele.data("format");
                if (format != undefined)
                    value = format(value);
                ele.text(value);
            } else if (ele.is('table')) {
                this._renderMultipleFiles(ele, name, value);
            } else {
                ele.val(value);
            }
            this._uniform();
        },
        _renderMultipleFiles: function (table, fieldName, fileIds) {
            var elementData = $(table).data("data");
            var template = '<tr class="template-upload fade in">'
                + '<td style="width: 20%;">'
                + '<span class="preview"><img alt="${alt_}" width="46" height="40"></span>'
                + '</td>'
                + '<td style="width: 40%;vertical-align: middle;">'
                + '<p class="name">${fileName_}</p>'
                + '<p class="size">${fileSize_} KB</p>'
                + '</td>'
                + '<td style="width: 10%;vertical-align: middle;">'
                + '<span class="progress">100%</span>'
                + '</td>'
                + '<td style="width: 30%;vertical-align: middle;">'
                + '    <button type="button" class="btn btn-warning cancel">删除</button>        '
                + '</td>'
                + '<input type="hidden" name="' + fieldName + '" value="${fileIds_}" class="att"/>'
                + '</tr>';
            if ($.trim(fileIds) == "")
                return;
            var ids = fileIds.split(",");
            var fileInfoUrl = (elementData.fileInfoUrl == undefined ? (dm_root + "file/fileJson") : elementData.fileInfoUrl);
            var dataParam = (elementData.dataParam == undefined ? "fileId" : elementData.dataParam);
            for (var i in ids) {
                var dataParamValue = {};
                dataParamValue[dataParam] = ids[i];
                $.ajax({
                    type: "POST",
                    data: dataParamValue,
                    dataType: "json",
                    url: fileInfoUrl,
                    success: function (data) {
                        if (data.status == 1) {
                            var file = $.tmpl(template, {
                                "fileName_": data.result.name,
                                "fileSize_": (data.result.size / 1000)
                                    .toFixed(2),
                                "fileIds_": data.result.id
                            });
                            if (getLowCaseType(data.result.name) == ".jpg") {
                                file.find(".preview > img").attr("src", data.result.fileUrl);
                            }
                            file.appendTo(table);
                            file.find("button.btn.btn-warning.cancel").bind(
                                "click", function () {
                                    $(this).parent().parent().remove();
                                });
                        }
                    }
                });
            }
        },
        _reset: function () {
            var that = this;
            if (this._data != undefined) {
                $.each(this._data, function (i, value) {
                    that._loadValue(i, value);
                });
            } else {
                if (this.$form != undefined)
                    this.$form[0].reset();
            }
        },
        _reload: function (options) {
            if (options != undefined) {
                this._options = $.extend(true, {}, this._options, options);
                this._setOptions(this._options, this);
            }
            this._remove();
            this._init();
        },
        _remove: function () {
            this.$element.empty();
        },
        _refreshItem: function (name) {
            var module = this._module[name];
            var data = module.data("data");
            module.find(".form-group").empty();
            this._buildModuleWrapper(module, data);
        }
    };

    /**
     * jquery插件扩展 ===================================================
     */

    var form = function (options, callback) {
        options = $.extend(true, {}, Form.defaults, options);
        var eles = [];
        this.each(function () {
            var self = this;
            var instance = new Form(self, options, callback);
            eles.push(instance);
        });
        return eles[0];
    };

    $.fn.extend({
        'dmForm': form
    });
})(jQuery, window, document);
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 

Date.prototype.Format = function (fmt) { //author: meizz 
	if(fmt==undefined){
		fmt="yyyy-MM-dd hh:mm:ss";
	}
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

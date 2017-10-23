;
(function ($, window, document, undefined) {
    var Modal = function (options) {
        this._setVariable(options);
        this._setOptions(this._options);
        this._init();
    };
    Modal.defaults = {
        render: "body",
        title: "视窗",
        color: "#44b6ae",
        showClose: true,
        distroy: false,
        backdrop: true,
        scroll: true,
        keyboard: false,
        maxHeight: "650px"
    };
    Modal.statics = {
        modalTmpl: '<div id="${id_}" class="modal fade container ${scroll_}" style="border: 1px solid ${color_};" ${backdrop_} ${keyboard_}></div>',
        headerTmpl: '<div id="${id_}head" class="modal-header" style="background-color: ${color_};"></div>',
        closeBtnTmpl: '<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>',
        titleTmpl: '<h6 id="${id_}title" class="modal-title" style="font-size: 18px;">${title_}</h6>',
        bodyTmpl: '<div id="${id_}body" class="modal-body"></div>',
        footerTmpl: '<div id="${id_}footer" class="modal-footer"></div>',
        buttonTmpl: '<button type="button" ${attrbute_} class="btn ${cls_}">${text_}</button>'
    };
    Modal.prototype = {
        show: function () {
            this.$modal.modal(this.modalOpts);
            return this;
        },
        hide: function () {
            this.$modal.modal("hide");
            return this;
        },
        content: function (html) {
            this.$body.html(html);
            return this;
        },
        _setVariable: function (options) {
            this._options = options;
            this.$modal = new Object();
            this.$body = new Object();
            this.modalOpts = {};
        },
        _setOptions: function (options) {
            if (options.id == undefined) {
                this._elementId = "dm_modal_" + new Date().getTime();
            } else {
                this._elementId = options.id;
            }
            this._color = options.color;
            this._title = options.title;
            this._showClose = options.showClose;
            this._distroy = options.distroy;
            this._render = options.render;
            this.$render = $(this._render);
            this._buttons = options.buttons;
            this._backdrop = options.backdrop;
            this._scroll = options.scroll;
            this._keyboard = options.keyboard;
            if (options.width != undefined) {
                this.modalOpts.width = options.width;
            }
            if (options.height != undefined) {
                this.modalOpts.height = options.height;
            }
            if (options.maxHeight != undefined) {
                this.modalOpts.maxHeight = options.maxHeight;
            }
        },
        _init: function () {
            this._renderEle();
            this._regiestEvents();
        },
        _regiestEvents: function () {
            var that = this;
            if (this._distroy) {
                this.$modal.on('hidden', function () {
                    that._distroyModal();
                });
            }
        },
        _renderEle: function () {
            var that = this;
            var modal = $.tmpl(Modal.statics.modalTmpl, {
                "id_": that._elementId,
                "scroll_": that._scroll ? "modal-scroll" : "",
                "backdrop_": that._backdrop ? "data-backdrop=static" : "",
                "keyboard_": that._keyboard ? "data-keyboard=true" : "data-keyboard=false",
                "color_": that._color
            });
            this.$render.append(modal);
            this.$modal = modal;
            // header
            var header = $.tmpl(Modal.statics.headerTmpl, {
                "id_": that._elementId,
                "color_": that._color
            });
            if (this._showClose) {
                var close = $.tmpl(Modal.statics.closeBtnTmpl, {});
                header.append(close);
            }
            var title = $.tmpl(Modal.statics.titleTmpl, {
                "id_": that._elementId,
                "title_": that._title
            });
            header.append(title);
            modal.append(header);

            // body
            var body = $.tmpl(Modal.statics.bodyTmpl, {
                "id_": that._elementId
            });
            modal.append(body);
            this.$body = body;

            // footer
            if (this._buttons != undefined) {
                var footer = $.tmpl(Modal.statics.footerTmpl, {
                    "id_": that._elementId
                });
                $.each(this._buttons, function (i, button) {
                    var attribute = "";
                    if (button.hideModal) {
                        attribute += " data-dismiss=modal ";
                    }
                    if (button.attribute != undefined) {
                        attribute += button.attribute;
                    }
                    var btn = $.tmpl(Modal.statics.buttonTmpl, {
                        "attrbute_": attribute,
                        "cls_": button.cls == undefined ? "" : button.cls,
                        "text_": button.text == undefined ? "未定义" : button.text
                    });
                    if (button.handle != undefined) {
                        btn.on("click", function () {
                            button.handle();
                        });
                    }
                    footer.append(btn);
                });
                modal.append(footer);
            }

        },
        _distroyModal: function () {
            if (typeof (KindEditor) != "undefined") {
                KindEditor.remove('textarea[role=kindEditor]');
            }
            this.$modal.remove();
        }
    };

    /**
     * jquery插件扩展 ===================================================
     */

    var modal = function (options) {
        options = $.extend(true, {}, Modal.defaults, options);
        var instance = new Modal(options);
        return instance;
    };

    $.extend({
        'dmModal': modal
    });
})(jQuery, window, document);

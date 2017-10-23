var Login = function() {

    var handleLogin = function() {

        $('.login-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            rules: {
                j_username: {
                    required: true
                },
                j_password: {
                    required: true
                },
                _spring_security_remember_me: {
                    required: false
                }
            },

            messages: {
                j_username: {
                    required: "请输入用户名."
                },
                j_password: {
                    required: "请输入密码."
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit 
            	$('.alert-danger', $('.login-form')).find("span").html("请输入用户名和密码");
                $('.alert-danger', $('.login-form')).show();
            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                form.submit(); // form validation success, call ajax form submit
            }
        });

        $('.login-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.login-form').validate().form()) {
                    $('.login-form').submit(); //form validation success, call ajax form submit
                }
                return false;
            }
        });
    }

    var handleForgetPassword = function() {
        $('.forget-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },

            messages: {
                email: {
                    required: "请输入电子邮箱"
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   

            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-icon'));
            },

            submitHandler: function(form) {
                form.submit();
            }
        });

        $('.forget-form input').keypress(function(e) {
            if (e.which == 13) {
            	var data = $("#resetPassword").serialize();
            	var url="./resetPassword";
            	$.ajax({
            		url:url,
            		data:data,
            		type:"GET",
            		success:function(res){
            			alert(res.msg);
            		}
            		
            	});
                return false;
            }
        });

        jQuery('#forget-password').click(function() {
            jQuery('.login-form').hide();
            jQuery('.forget-form').show();
        });

        jQuery('#back-btn').click(function() {
            jQuery('.login-form').show();
            jQuery('.forget-form').hide();
        });

    }

    var handleRegister = function() {

        $('.register-form').validate({
            errorElement: 'span', //default input error message container
            errorClass: 'help-block', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
                fullname: {
                    required: true
                },
                email: {
                    required: true,
                    email: true
                },
                username: {
                    required: true,
                    usernamereg:true,
                    remote: {
                        type: "post",
                        url: dm_root+"checkunique",
                        data: {
                        	param: function() {
                                return $("#username").val();
                            },
                            name:"loginname"
                        },
                        dataType: "html",
                        dataFilter: function(data, type) {
                            if (data == "true")
                                return true;
                            else
                                return false;
                        }
                    },
                    
                },
                password: {
                	passwordreg:true,
                    required: true
                },
                rpassword: {
                	password:true,
                    equalTo: "#register_password"
                },
                tnc: {
                    required: true
                }
            },

            messages: { // custom messages for radio buttons and checkboxes
                tnc: {
                    required: "请先同意"
                },
                fullname: {
                    required: "请输入姓名全称"
                },
                username: {
                    required: "请输入用户名",
                    remote: "该用户名已经被注册"
                },
                email: {
                    required: "请输入电子邮箱",
                    emial: "电子邮箱格式不正确"
                },
                mobile: {
                    required: "请输入手机号码"
                },
                password: {
                    required: "请输入密码"
                },
                rpassword: {
                    equalTo: "密码不一致"
                }
            },

            invalidHandler: function(event, validator) { //display error alert on form submit   

            },

            highlight: function(element) { // hightlight error inputs
                $(element)
                    .closest('.form-group').addClass('has-error'); // set error class to the control group
            },

            success: function(label) {
                label.closest('.form-group').removeClass('has-error');
                label.remove();
            },

            errorPlacement: function(error, element) {
                if (element.attr("name") == "tnc") { // insert checkbox errors after the container                  
                    error.insertAfter($('#register_tnc_error'));
                } else if (element.closest('.input-icon').size() === 1) {
                    error.insertAfter(element.closest('.input-icon'));
                } else {
                    error.insertAfter(element);
                }
            },

            submitHandler: function(form) {
                form.submit();
            }
        });

        $('.register-form input').keypress(function(e) {
            if (e.which == 13) {
                if ($('.register-form').validate().form()) {
                    $('.register-form').submit();
                }
                return false;
            }
        });

        jQuery('#register-btn').click(function() {
            jQuery('.login-form').hide();
            jQuery('.register-form').show();
        });

        jQuery('#register-back-btn').click(function() {
            jQuery('.login-form').show();
            jQuery('.register-form').hide();
        });
    }
    $("#resetPasswordBtn").click(function(){
    	var data = $("#resetPassword").serialize();
    	var url="./resetPassword";
    	$.ajax({
    		url:url,
    		data:data,
    		type:"GET",
    		success:function(res){
    			alert(res.msg);
    		}
    		
    	});
    	
    });
    return {
        //main function to initiate the module
        init: function() {

            handleLogin();
            handleForgetPassword();
            handleRegister();

        }

    };

}();
$.validator.addMethod(

		"usernamereg",     //自定义规则方法名
		function(value , element , param){   
			var   re =/^[a-zA-Z]\w{5,17}$/;
	        var result=  re.test(value);
			return result;
		},
		'只能以字母开头，长度在6~18之间,不能包含特殊字符'//提示信息

		);
$.validator.addMethod(
		"passwordreg",     //自定义规则方法名
		function(value , element , param){   
			var   re =/\w{6,17}$/;
	        var result=  re.test(value);
			return result;
		},
		'不能包含特殊字符，长度在6~18之间'//提示信息

		);


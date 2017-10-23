var DmCheck = function (data) {
    var validate = true;
    if (data.status == "timeout") {
        validate = false;
        alert("session已失效,请重新登录");
        window.location.href = dm_root + "login";
    }
    if (data.status == 0) {
        if (data.msg != null) {
            validate = false;
            alert(data.msg);
        }
    }
    return validate;
};

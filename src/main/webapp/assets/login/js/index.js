/**
 * Created by wkr on 2016-04-22.
 */
$('#rightContant').height($(window).height()-55);

$(".meun>li").click(function(){
    if($(this).attr("flag") == true) {
        var newclass=$.trim( $(".meun>li.cur").attr("class").replace("h",'').replace("cur",''));
        $(".meun>li.cur").attr("class",newclass);
        $(this).attr("class", "cur "+$(this).attr("class")+"h");
        document.getElementById("rightContant").src=$(this).attr("_href");
    }
});
$(".meun-1>li").click(function(e){
    e.stopPropagation();
    if($(this).attr("flag") == true) {
        var newclass = $.trim($(".meun-1>li.cur").attr("class").replace("h", '').replace("cur", ''));
        $(".meun-1>li.cur").attr("class", newclass);
        $(this).attr("class", "cur " + $(this).attr("class") + "h");
        document.getElementById("rightContant").src = $(this).attr("_href");
    }
});
$(".meun-2>li").click(function(e){
    e.stopPropagation();
    if($(this).attr("flag") == true) {
        var newclass = $.trim($(".meun-2>li.cur").attr("class").replace("h", '').replace("cur", ''));
        $(".meun-2>li.cur").attr("class", newclass);
        $(this).attr("class", "cur " + $(this).attr("class") + "h");
        document.getElementById("rightContant").src = $(this).attr("_href");
    }
});
$(function(){
    $(".meun > li > a").click(function(){
        $(this).parents().siblings().find(".meun-1").hide(300);
        $(this).siblings(".meun-1").toggle(300);

    });
    $(".meun-1 > li > a").click(function(){
        $(this).parent().parent().parent().find("a").removeClass("cur");
        $(this).addClass("cur").parents().siblings().find("a").removeClass("cur");
        $(this).parents().siblings().find(".meun-2").hide(300);
        $(this).siblings(".meun-2").toggle(300);
    });
    $(".meun-2 > li > a").click(function(){
        $(this).parent().parent().parent().find("a").removeClass("cur");
        $(this).addClass("cur").parents().siblings().find("a").removeClass("cur");
    })
});


$('.bg_left').css('height',$(window).height()-50);
$('.focus').mousemove(function(){
	$('.div_code').addClass('block');
	});
$('.focus').mouseout(function(){
	$('.div_code').removeClass('block');
	});
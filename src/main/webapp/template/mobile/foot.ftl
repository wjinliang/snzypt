<script src="${htmlFolder}${htmlMobileFolder}/js/jquery.min.js"></script><!--Menu-->
<script><!--Menu-->
$(function(){
	$("#header span.right").on("click",function(){
        var val = $(this).attr('class');
        if(val.indexOf('on') == -1){
            $(this).addClass('on');
            $(".menu").show(0).stop().animate({
                height:'62rem'
            },0);
        }else{
            $(this).removeClass('on');
            $(".menu").hide(0).stop().animate({
                height:'0'
            },0);
        }
    })
	
	$(".menu a").on("click",function(){
        $(this).parents(".menu").hide();
        $("#header span.right").removeClass('on');
    })
	
});
</script>
<script type="text/javascript" src="${htmlFolder}${htmlMobileFolder}/js/public.js"></script><!--Tab & Public-->
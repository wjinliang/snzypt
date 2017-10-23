// JavaScript Document
$(function(){
	$(".alter-nav li").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
		})
	$("#box-list li").mouseover(function(){
		$(this).addClass("active");
		}).mouseout(function(){
			$(this).removeClass("active");
			})
	$("#real-time-infor li").mouseover(function(){
		$(this).addClass("active").siblings().removeClass("active");
		})
	<!--截取字段--> 
	function wordlimit(cname,wordlength){
　		 for(var i=0;i<cname.length;i++){
　　　　		var nowLength=cname[i].innerHTML.length;
　　　　			if(nowLength>wordlength){
　　　　　　cname[i].innerHTML=cname[i].innerHTML.substr(0,wordlength)+'...';
	　　　　}
	　　}　
	}
	var pText = document.getElementsByClassName("pText");
	wordlimit(pText,90);
	<!--截取字段结束-->
	function wordlimit(cname,wordlength){
　		 for(var i=0;i<cname.length;i++){
　　　　		var nowLength=cname[i].innerHTML.length;
　　　　			if(nowLength>wordlength){
　　　　　　cname[i].innerHTML=cname[i].innerHTML.substr(0,wordlength)+'...';
	　　　　}
	　　}　
	}
	var pText1 = document.getElementsByClassName("pText1");
	wordlimit(pText1,20);
	<!--截取字段开始-->
	function wordlimit(cname,wordlength){
　		 for(var i=0;i<cname.length;i++){
　　　　		var nowLength=cname[i].innerHTML.length;
　　　　			if(nowLength>wordlength){
　　　　　　cname[i].innerHTML=cname[i].innerHTML.substr(0,wordlength)+'...';
	　　　　}
	　　}　
	}
	var pTexta = document.getElementsByClassName("pTexta");
	wordlimit(pTexta,150); 
	<!--截取字段结束-->
	$("#interact-realT-list li").mouseover(function(){
		$(this).addClass("active").siblings().removeClass("active");
		})
	$(".pagenav a").click(function(){
		$(this).addClass("current").siblings().removeClass("current");
		})
	$("#interact-con-list li").mouseover(function(){
		$(this).addClass("active").siblings().removeClass("active");
		})
	$("#ten-database li").hover(function(){
		$(this).addClass("activeone").siblings().removeClass("activeone");
		},function(){
			$(this).removeClass("activeone");	
		});
			
	});
	function onchangeop(that){
	var url = $(that).val();
	if(url=="#")
		return;
	window.open(url);
}


$(document).ready(function(){
	var url = "http://127.0.0.1/dmbase/cmsStatic/addVisited";
	var path = window.location.pathname;
	path = path.split(".")[0];
    if(path.indexOf('index')!=-1){
    	
    }else if(path.indexOf('content_novel')!=-1){
    	var arr = path.split('content_novel/');
    	url+="?contentId="+arr[1]+"&channelType=7";
    }else if(path.indexOf('content_audio')!=-1){
    	var arr = path.split('content_audio/');
    	url+="?contentId="+arr[1]+"&channelType=6";
    }else if(path.indexOf('content_video')!=-1){
    	var arr = path.split('content_video/');
    	url+="?contentId="+arr[1]+"&channelType=5";
    }else if(path.indexOf('content')!=-1){
    	var arr = path.split('content/');
    	url+="?contentId="+arr[1]+"&channelType=0";
    }else{
    	var arr = path.split('/');
    	var i = arr.length-2;
    	if(i>0)
    		url+="?channelEnName="+arr[i];
    }
    $.ajax({  
        url:url,  
        dataType:'jsonp',  
        data:'',   
        jsonpCallback :"JquerycallbackRt",
        success:function(result) { 
        },  
        timeout:3000  
    });    
});
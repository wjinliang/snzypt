;
var pageSize=10;
	var pageNum = 1;
	function sosearch(){
			go(pageSize,1);
	};
	function formatdata(data){
			var list=$('<div class="ggfw-ztfw-list"></div>');
			
			for (var i=0;i<data.list.length;i++)
			{	var news = data.list[i];
				/*var ele = $.tmpl(li, {
				"url_": news.url,
				"title_": news.title,
				"content_": news.content,
				"publishdate_":news.publishDate,
				
				});
				list.append(ele);*/
				var li ='<a href="'
				+news.url+'" target="_blank" class="borderBottom"><p class="fontSize18">'
				+news.title+'</p><p>'
				+news.content+'<span class="color-green">【详细】</span></p><p class="color-gray">'
				+news.publishDate+'</p>';
				list.append(li);
			}
			
			
			var pager = $('<div class="text-center new-page"></div>');
			pager.append('<span class="new-page-pd"><span class="color-green">'+data.pageNum+'/'+data.totalPage+'</span>&nbsp;页</span>');
			pager.append('<span class="new-page-pd">共&nbsp;<span class="color-green">'+data.total+'</span>&nbsp;条记录</span>');
			pager.append('<button class="btn btn-link" onclick="go('+pageSize+',1);">首页</button>');
			
				pager.append('<button class="btn btn-link" onclick="go('+pageSize+','+data.perPage+');">上一页</button>');
		
				pager.append('<button class="btn btn-link" onclick="go('+pageSize+','+data.nextPage+');">下一页</button>');
			
			pager.append('<button class="btn btn-link" onclick="go('+pageSize+','+(data.totalPage)+');">尾页</button>');
			var jinhumain=$(".jh-main");
			jinhumain.html('');
			jinhumain.append(list);
			jinhumain.append(pager);
				
	};
	function go(pageSize,pageNum,callback){
		var textval = $("#searchText").val();
			var data={text:textval,pageNum:pageNum,pageSize:pageSize};
			$.ajax({
				url:"/jinhuadmin/portal/search",
				type:"POST",
				data:data,
				//scriptCharset: 'utf-8',
				dataType: "jsonp",
				contentType: "application/x-www-form-urlencoded; charset=utf-8", 
				jsonp: "callback",
				success:function (data){
					if(data.status=='1'){
						if(callbak==undefined){
							formatdata(data);
						}
						else{
							callback(data);
						}
					}else{
						alert("没有找到结果!");
					}
					
				},
				error:function(){
					alert("出错了,请检查网络!");
				}
			});
	};
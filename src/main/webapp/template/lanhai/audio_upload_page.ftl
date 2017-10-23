<!DOCTYPE html>
                                   <html>
                                   <head>
                                   <meta charset="utf-8" />
                                   <meta http-equiv="pragma" content="no-cache"> 
                                   <meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
                                  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
                                   <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                   <title>【蓝海】信息网</title>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/base.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/indexstyle.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/publicstyle.css"/>
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/self.css"/>
                                 
                                 <link href="${htmlFolder}/css/demo.css" rel="stylesheet" type="text/css">
                                 <link href="${htmlFolder}/css/homepage.css" rel="stylesheet" type="text/css">
                                 <link href="${htmlFolder}/css/sys_menu.css" rel="stylesheet" type="text/css" />
                                 <link type="text/css" rel="stylesheet" href="${htmlFolder}/css/register.css" />
                                  
                                  <script type="text/javascript"  src="${htmlFolder}/js/jquery-1.11.3.min.js"></script>
                                      <!--ckplayer-->
                                  
                                    <script type="text/javascript"  src="${htmlFolder}/js/login.js"></script>
                                   
                                   <script type="text/javascript" src="${htmlFolder}/js/visit-record.js"></script>
                                   <script type="text/javascript"  src="${htmlFolder}/plugins/upload/uploadPreview.js"></script>
                                  <script type="text/javascript"  src="${htmlFolder}/plugins/upload/ajaxfileupload.js"></script>
                                  <script src="${htmlFolder}/plugins/ckeditor/ckeditor.js"></script>
                                  <style>
                                     .vMiddle{
                                      float: left;
                                      height:24px;
                                      line-height: 24px;
                                      padding: 13px 10px 13px 34px;
                                     }
                                     .saveBtn{
                                      width:60px;
                                      margin-left: 0px !important;
                                      
                                     }
                                     .imageContainer{
                                      float:left;
                                      margin:10px 30px;height:200px;
                                     }
                                     .fLeft{
                                      float:left;
                                     }
                                     .btnBlue
                                     {
                                      background-color:#016bc1 !important;
                                      color: white !important;
                                     }
                                     .btn100
                                     {
                                       width:100px !important;
                                     }
                                     .btn60
                                     {
                                       width:60px !important;
                                     }
                                     .imgDiv{
                                      width:180px;
                                      height:150px;
                                      border:1px solid #dddddd;
                                     }
                                     .loading{
                                      background: rgba(0, 0, 0, 0) url("${htmlFolder}/images/loading1.gif") no-repeat scroll left center;
                                      overflow: hidden;
                                     }
                                     select{
                                       background-color: #fafafa;
                                        border: 1px solid #dddddd;
                                        color: #009fe8;
                                        float: left;
                                        font-size: 16px;
                                        font-weight: normal;
                                        height: 38px;
                                        margin: 5px 18px;
                                        overflow: hidden;
                                        padding: 0 10px;
                                        width: 36%;
                                     }
                                 </style> 
                                   <script>
                                   $(function() {
                                        new uploadPreview({ UpBtn: "imageFile", DivShow: "imgdiv", ImgShow: "imgShow" ,callback:showUpImageBtn});
                                         CKEDITOR.replace( 'lyrc',{uiColor: '#9AB8F3'});                        
                                    });
                                    function save(num)
                                    {
                                       var data = CKEDITOR.instances.lyrc.getData();
                                       $("#introduce").val(data);
                                       var form = document.getElementById("videoForm");
                                       var flag =  checkSaveVideo(form);
                                       if(flag)
                                       {
                                          form.action="./saveAudio?status="+num;
                                          form.submit();
                                       }
                                    }
                                    function uploadFile(htmlElement)
                                    {
                                      if($('#videoFile').val().indexOf('mp3')!=-1 || $('#videoFile').val().indexOf('mp4')!=-1)
                                      {
                                       
                                        $(htmlElement).next('span').remove(); 
                                        $(htmlElement).after("<span class='vMiddle loading'>上传中…………<span>");
                                        $.ajaxFileUpload({
                                          url: basePath+"/cms/attachmentOther/multipleUpload?mediaType=audio",
                                          type: "POST",
                                          secureuri: false,
                                          fileElementId: 'videoFile',
                                          dataType: "json",
                                          success: function (json, status) {
                                           $(htmlElement).next('span').remove(); 
                                            $(htmlElement).after('<span class="Validform_checktip Validform_right"></span>');
                                            $('#attachmentIds').val($('#attachmentIds').val()+json.attachment.id);
                                            $(htmlElement).remove();
                                            alert(json.msg);
                                          },
                                          error:function()
                                          {
                                            $(htmlElement).after('<span class="Validform_checktip Validform_right"></span>');
                                          }
                                        })
                                     }
                                     else
                                     {
                                      alert("文件格式需为MP4，mp3");
                                     }
                                    }
                                        
                                    function showUpImageBtn()
                                    {
                                       console.log("!123123");
                                      $("#imageUpShow").html('<input type="button" value="上传" class="saveBtn btn60" onclick="upload(this)"/>');
                                    }

                                    function uploadingShow(file)
                                    {
                                      $("#uploadTip").html('<input type="button" class="saveBtn btn60" value="上传" onclick="uploadFile(this)"/><span class="vMiddle">'+$("#videoFile").val()+'</span>');
                                     
                                    }


                                     function upload(htmlElement)
                                   {

                                  
                                    $.ajaxFileUpload({
                                        url: basePath+"/cms/attachmentOther/singleUpload?mediaType=audio",
                                        type: "POST",
                                        secureuri: false,
                                        fileElementId: 'imageFile',
                                        dataType: "json",
                                        success: function (json, status) {
                                          $("#imageUrl").val(json.attachment.attachmentUrl);
                                          $("#imageUpShow").html('<span class="Validform_checktip Validform_right"></span>');
                                         alert(json.msg);
                                        }
                                      })
                                  
                                   }


                                    function removeNext(htmlElements)
                                      {
                                        var next = $(htmlElements).next('span');
                                        if(next.length>0)
                                        {
                                          next.remove();
                                        }
                                      }
                                        function checkName(htmlElement)
                                      {
                                        var flag = true;
                                        removeNext(htmlElement);
                                        if(htmlElement.value=="")
                                        {
                                          $(htmlElement).after('<span class="Validform_checktip Validform_wrong">必填</span>');
                                          flag=false;
                                        }
                                        else
                                        {
                                          $(htmlElement).after('<span class="Validform_checktip Validform_right">信息通过验证！</span>');
                                        }
                                        return flag;
                                      }
                                        function checkSaveVideo(form)
                                        {
                                          var flag = true;

                                         if(!checkName(form.name))
                                         {
                                           flag = false;
                                         }
                                        if(!checkName(form.singer))
                                         {
                                         
                                              flag = false;
                                         }
                                        
                                         if(!checkName(form.origin))
                                         {
                                              flag = false;
                                         }
                                         if(!checkName(form.imageUrl))
                                         {
                                              flag = false;
                                         }
                                         if(!checkName(form.attachmentIds))
                                         {
                                              flag = false;
                                         }
                                        /*if(form.introduce.value=="")
                                         {
                                            removeNext($(form.introduce).next());
                                              $(form.introduce).next().after('<span class="Validform_checktip Validform_wrong">必填</span>');
                                              flag=false;
                                         }
                                        else
                                            {
                                              $(form.introduce).after('<span class="Validform_checktip Validform_right">信息通过验证！</span>');
                                            }*/
                                            return flag;
                                          }
                                   </script>
                                   </head>
                                   
                                   <body>
                            <#include "/template/head.ftl"/>       
                         <!--nav end-->
                       <div class="videochannel-floor fn-clear">
                          <div class="videosortpannel" style="height:560px;padding-top:20px;">
                                     <div class="slidevideo" id="content">
                                      <form action="./saveAudio" id="videoForm" method="post">
                                         <ul class="zcxyh-list" >
                                            <li>
                                                <label class="label"><span class="need">*</span> 歌名 </label>
                                                <input type="text" value="" name="name" id="audioName" class="inputxt" />
                                            </li>
                                            <li>
                                                <label class="label"><span class="need">*</span> 歌手 </label>
                                                <input type="text" value="" name="singer" id="singer" class="inputxt" />
                                            </li>
                                            
                                            <li>
                                                <label class="label"><span class="need">*</span> 来源 </label>
                                                <input type="text" value="" name="origin" id="origin" class="inputxt" />
                                            </li>
                                            
                                             <li>
                                                <label class="label"><span class="need">*</span> 类型 </label>
                                                <select  name="channelId" id="channelId" class="inputxt">
                                                  <#list types as type>
                                                    <option value="${type.id}">
                                                       ${type.displayName}
                                                    </option> 
                                                  </#list>
                                                </select>  
                                            </li>

                                             <li style="height:220px;">
                                                <label class="label" style="height:200px;line-height:198x;"><span class="need">*</span> 歌曲海报图 </label>
                                                  <div class="imageContainer">
                                                    <div id="imgdiv" class="imgDiv"><img id="imgShow" width="180" height="150" /></div>
                                                     <input type="file" name="file" value=""  style="display:none;" id="imageFile"/>
                                                     <input type="button" value="选择" onclick="$('#imageFile').click();"class="saveBtn"/>
                                                     <div id="imageUpShow" class="fLeft"></div>
                                                  </div>
                                                  <input type="hidden" value="" name="imageUrl" id="imageUrl" class="inputxt" />
                                            </li>
                                             <li style="height:415px;">
                                                <label class="label">歌词</label>
                                                <div style="float:left;width:800px;">
                                                <textarea  id="lyrc" name="lyrc"  rows="10" cols="80"></textarea>
                                                </div>
                                            </li>
                                             <li>
                                                <label class="label"><span class="need">*</span> 上传音乐</label>
                                                <div style="float:left;width:700px">  
                                                <input type="button"  value="选择文件" style="margin-left:20px;" class="saveBtn btn100" onclick="$('#videoFile').click();" />
                                                <input type="file" name="files[]" id="videoFile" style="display:none;" onchange="uploadingShow(this);"/>
                                                <div id="uploadTip"></div>
                                                 <input type="hidden" value="" name="attachmentIds" id="attachmentIds" class="inputxt" />
                                                </div>
                                            </li>
                                            <li>
                                              <label class="label"></label>
                                                <input type="button" class="saveBtn btnBlue btn100" value="保存" onclick="save(0)" />  
                                                <input type="button" class="saveBtn btnBlue btn100"value="保存并提交" onclick="save(1)" />
                                            </li>
                                        </ul>
                                        
                                        <form>
                                      </div>  
                                   </div>
                              </div>
                           </body>
                                   
                                   <!-- Main end-->
                                   <div class="blank_20"></div>
                                   <!--!footer-->
                                   <#include "/template/foot.ftl" />
                                   <!--!footer end-->
        
                                   
                                   
                                   
                                   
                                   <!--[if lte IE 8]>
                                   <script src="/js/ieBetter.js"></script>
                                   <![endif]-->
                                   
                                   
                                   <!--                       Javascripts 注意不要改变顺序                      -->
                                   
           
                                 
                                
                                  
                                   
                                   </html>
                                   
                                  
                                 
                                
                               
                              
                             
                            
                           
                          
                         
                        
                       
                      
                     
                    
                   
                  
                 
                
               
              
             
            
           
          
         
        
       
      
     
    
   
  
 
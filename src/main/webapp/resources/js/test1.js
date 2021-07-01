/**
 * 
 */


function getFileUploadFilenameInput(index, filename){
	var msg = `
		<input name="files[${index}]" type="hidden" value="${filename}">
	`;
	
	return msg;
}


function uploadUpdateForm(getLinkText, filename, getOriginalName){
	
	var src = '';
	
	if (checkImageType(filename)) {
		src ="/displayFile?filename="+filename;
			
	}else {
			src = "/resources/img/썸네일.png";
	}
	
	var msg = `
	<div class = 'col-xs-4'>
	<a target="_blank" href="${getLinkText}">
		<img src="${src}"></a>
	<p class="ellpsisTarget">${getOriginalName}
	<small  class="delFile" data-filename="${filename}" style="cursor:pointer;">&nbsp;
	<span style="color:red;" class="glyphicon glyphicon-remove" aria-hidden="true"></span>
	</small>
	</p>
	</div>`;
	
	return msg;
}


function getLinkText(filename){
	
	if(checkImageType(filename)){
		var idx = filename.indexOf("_");
		var prefix = filename.substring(0, idx);
		var suffix = filename.substring(idx + 2);
		filename = prefix + suffix;
	}
	
	return "/displayFile?filename="+filename;
	
}

function getOriginalName(filename){
	
	  var idx = -1;

   if(checkImageType(filename)){
      idx = filename.indexOf("_s_")+3;
   }else{
      idx = filename.indexOf("_")+1;
   }
   
   return filename.substring(idx);
} 

function checkImageType(filename){
	var idx = filename.lastIndexOf(".")+1;
	var extendName = filename.substring(idx).toUpperCase();
	if(extendName == "PNG" || extendName == "JPEG" || extendName == "GIF" || extendName == "JPG"){
			return true;
	}else{
		return false;
	}
	
}

function uploadViewForm(getLinkText, filename, getOriginalName){
	
	var src = '';
	
	
	
	if (checkImageType(filename)) {
		src ="/displayFile?filename="+filename;
			
	}else {
			src = "/resources/img/썸네일.png";
	}
	
	var msg = `
	<div class = 'col-xs-4'>
	<a target="_blank" href="${getLinkText}">
		<img src="${src}"></a>
	<p class="ellpsisTarget">${getOriginalName}</p>
	</div>`;
	
	return msg;
}

 
function me4(rno, replyer, updatedate, replytext, userId){
	var disabled = replyer==userId?'':'disabled';
   var msg = `
   <div class="panel" style="background-color: #FFF7FC;">
         <div class="panel-heading" style="background-color: #ffe6f3">
		 <span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
		 <span>${rno}번째</span>&nbsp;&nbsp;
		 <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
		 <span>${replyer}</span> <span class="pull-right">
		 <span class="glyphicon glyphicon-time" aria-hidden="true">
		 </span>
		 <span>${updatedate}</span></span></div>
         <div class="panel-body">
            <p>${replytext}</p>
            <div style = "float: right;" data-rno='${rno}' data-replyer ='${replyer}'>
               <a style = "background-color: #b3daff;" class="btn btn-xs reply_btn_update_form 
				${disabled}" data-target="#myModal" data-toggle="modal">
				<strong>수정</strong></a>
               <a class="btn btn-danger btn-xs reply_btn_delete 
				${disabled}">삭제</a>
            </div>
         </div>
      </div>
   `;
   
   return msg;

}

function me3(userId, userPw, userName, email){
   var msg = `<div class="panel panel-primary">
      <div class="panel-heading">
         아이디: ${userId} <span class="pull-right">비밀번호: ${userPw}</span>
      </div>
      <div class="panel-body">
         <h3>이름: ${userName}</h3>
         <h5>이메일: ${email}</h5>
      </div>
   </div>`;
   
   return msg;

} 

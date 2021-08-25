function check(my){
	if(!chkNull(my.title,"제목을")){
		return false;
	}
	if(!chkNull(my.name,"이름을")){
		return false;
	}
	if(!chkNull(my.content,"내용을")){
		return false;
	}
	if(!chkPwd(my.pwd,my.pwd2)){
		return false;
	}
	return true;
}

function chkPwd(pwd,pwd2){
	if(!chkNull(pwd,"비밀번호를")){
		return false;
	}
	if(!chkNull(pwd2,"비밀번호 확인을")){
		return false;
	}
	if(pwd.value != pwd2.value){
		return false;
	}
	return true;
}
//공백체크
function chkNull(str,msg){
	if(str.value == null || str.value == ""){
		alert(msg+" 입력하세요");
		str.focus();
		return false;
	}
	return true;
}
//비밀번호 확인 입력 후 일치하는지 체크
function pwdMsg(my){
	if(my.pwd.value != my.pwd2.value){
		document.getElementById("msg").innerHTML="<b>비번이 틀립니다</b>";
		//document.getElementById("msg").innerText="<b>비번이 틀립니다</b>";	//태그까지 보임
		// $("#msg").text("비번이틀립니다");
		document.getElementById("msg").style.color="red";
		return false;
	}
	if(frm.pwd.value == frm.pwd2.value){
		document.getElementById("msg").innerHTML="<b>비번이 일치합니다</b>";
		document.getElementById("msg").style.color="blue";
		return true;
	}
}
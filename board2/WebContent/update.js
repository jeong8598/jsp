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
	if(!chkNull(my.pwd,"비밀번호를")){
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
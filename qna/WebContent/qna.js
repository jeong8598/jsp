function chkData(){
	if(!chkNull(document.frm.title,"제목을")){
		return false;
	}
	if(!chkNull(document.frm.name,"이름을")){
		return false;
	}
	if(!chkPwd(document.frm.pwd,document.frm.pwd1)){
		return false;
	}
	if(!chkNull(document.frm.content,"내용을")){
		return false;
	}
	return true;
}
//공백확인 함수
function chkNull(str,chk){
	if(str.value==null || str.value=='' || str.value.trim()==null || str.value.trim()==''){
		alert(chk+" 입력하세요.");
		str.focus();
		return false;
	}
	return true;
}
//스페이스바 제한
function chkSpacebar(){
	if(event.keyCode==32){
		event.returnValue=false;
	}
	return true;
}

//비밀번호
function chkPwd(pwd,pwd1){
	if(!chkNull(pwd.value,"비밀번호를")){
		return false;
	}
	if(!chkNull(pwd1.value,"비밀번호 확인을")){
		return false;
	}
	var pwdRegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
    if (!pwdRegExp.test(pwd.value)) {
        alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
        pwd.value = "";
        pwd.focus();
        return false;
    }
    if (pwd.value != pwd1.value) {
        alert("두 비밀번호가 맞지 않습니다.");
        pwd.value = "";
        pwd1.value = "";
        pwd.focus();
        return false;
    }
    return true;
}

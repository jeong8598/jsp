function chkData(){
	if(!chkNull(document.frm.title,"제목을")){
		return false;
	}
	if(!chkNull(document.frm.name,"이름을")){
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
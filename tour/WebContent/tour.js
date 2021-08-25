var g_count =1;
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
            $("#write").on("click",function(e){
                e.preventDefault();
                fn_writeBoard();
            })
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));
            })
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
         
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
         
        function fn_writeBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/writeBoard.do'/>");
            comSubmit.submit();
        }
        function fn_fileDelete(obj){
            obj.parent().remove();
        }
        function fn_fileAdd(){
            var str = "<p><input type='file' name='file_"+(g_count++)+"'/><a href='#this' name='delete' class='btn'>삭제하기</a></p> ";
            $("#fileDiv").append(str);
             
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));         
            })
        }
        
    	var g_count = 1;
    	$(function(){
    		$("#list").on("click",function(e){
    			e.preventDefault();
                openList();
    		})
    		$("#write").on("click",function(e){
    			e.preventDefault();
    			frmSubmit();
    		})
    		$("#add").on("click",function(e){
    			e.preventDefault();
    	        addFile();
    		})
    		
    		$(".btn-del").on("click",function(e){
    			e.preventDefault();
                delFile($(this));
    		})
    	function openList(){
    		href.location="list.jsp";
    	}
    	function frmSubmit(){
    		document.tourFrm.submit();
    	}
    	function addFile(){
    		var str = "<li><input type='file' name='file_"+(g_count++)+"'/><a href='#' id='delete' class='btn btn-del'>X</a></li>";
            $("#fileList").append(str);
    	}
    	function delFile(obj){
    		obj.parent().remove(); 
    	}
    	});
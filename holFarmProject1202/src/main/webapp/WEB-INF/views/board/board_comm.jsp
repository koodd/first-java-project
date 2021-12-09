<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<!-- saved from url=(0054)http://www.wootdali.or.kr/wt_community/notice_list.php -->

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>해피홀팜</title>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script type="text/javascript">
	 function updateBtn(){
		 if(confirm("정말로 게시글을 수정합니까?")){
			 $("#modify").submit();
			 
		 }else{
			 return false;
		 }
	 } 
  </script>	 
    
    <script type="text/javascript">
    function content_btn_report(){
    	if(confirm("신고 하시겠습니까?")){
    		$("#report").submit();
    		alert("신고가 완료 되었습니다.");
    	}else{
    		return false;
    	}
    	
    }
    
    function delete_board_btn(){
    	if(confirm("정말로 삭제 하시겠습니까?")){
    		$("#delete_board").submit();
    		alert("삭제가 완료되었습니다.");
    	}else{
    		return false;
    	}
    	
    }
    
    
    </script>

	



</head>

<body>
		
	<%@ include file="../base/header.jsp" %>



  
    <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
          <c:if test="${map.bDto.boardDto.bc_no==1 }">
            <p>자유 게시판</p>
        </c:if> 
         <c:if test="${map.bDto.boardDto.bc_no==2 }">
            <p>유저 게시판</p>
        </c:if> 
         <c:if test="${map.bDto.boardDto.bc_no==3 }">
            <p>농장주 게시판</p>
        </c:if> 
         <c:if test="${map.bDto.boardDto.bc_no==4 }">
            <p>거래 게시판</p>
        </c:if> 
        </div>

        <div id="content_view">
            <div class="content_view_top">
                <div id="content_view_title"><span>제목 :&nbsp&nbsp&nbsp </span>${map.bDto.boardDto.bt_title}</div>
                <!-- 날짜, hit 값 들어감 -->
                <div id="content_view_date">
                	
                <span style="color: green;"> <c:if test="${map.bDto.memberDto.uc_no==1}">
                    [유저]</c:if>
                    <c:if test="${map.bDto.memberDto.uc_no==2}">[농장주]</c:if>
                    
                    
                   ${map.bDto.memberDto.u_nickname}&nbsp&nbsp&nbsp&nbsp </span>
                
                <span
                        style="padding-right: 20px; border-right: 1px solid #666;">${map.bDto.boardDto.bt_date }</span><span
                        style="padding-left: 20px;">조회수 : </span><span>${map.bDto.boardDto.bt_hit}</span></div>
            </div>
           

			<div id="content_view_mid">${map.bDto.boardDto.bt_content}</div>
			
			<form action="./content_btn_report" name="report" id="report" method="get">
				<div class="board_btn">
					<input type="hidden" name="bt_no" value="${map.bDto.boardDto.bt_no}">
					<input type="hidden" name="bc_no" value="${map.bDto.boardDto.bc_no}">
					
					
					<button type="button" onclick="content_btn_report()" >신고하기</button>
				</div>
			</form>

	<script type="text/javascript">
			
  var userNo = "${session_uno}"; //유저ID
  var userNickname = "${session_nickname}";
  var userucno = "${session_ucno}"
  var bt_no = "${map.bDto.boardDto.bt_no}";        //게시글 번호 

			
  function commentWriteBtn(){
		

	  alert("댓글을 저장합니다.");
 	  $.ajax({
		 url:"/board/commentWrite", // 보내지는 주소
 		 type:"post",  			// 보내는 타입
 		 data:{
 			 "bcm_nickname":"${session_nickname}",		// 아이디
 			 "bt_no":"${map.bDto.boardDto.bt_no}",			// 번호 
 			 "bcm_content":$("#replytype").val()
 		 },
 				 
 		 success:function(data){   //data : commentDto
 			
 		     alert("댓글이 등록되었습니다.");
				
 		     var chtml=""; 		  
			
 		    chtml += "<div id="+data.cDto.boardDto.bcm_no+">"
				if(data.cDto.memberDto.uc_no==1){
			chtml += 	"<div class='content_view_comm_top'>";
			chtml += 	"[유저]"+data.cDto.boardDto.bcm_nickname+"<span>"+data.cDto.boardDto.bcm_date+"</span></div>";
				}
				
				if(data.cDto.memberDto.uc_no==2){
					chtml += 	"<div class='content_view_comm_top'>";
					chtml += 	"[농장주]"+data.cDto.boardDto.bcm_nickname+"<span>"+data.cDto.boardDto.bcm_date+"</span></div>";
					}
				chtml +=   		"<div id='coment_view_comm_modify'>";
				chtml += 		 " <p>"+data.cDto.boardDto.bcm_content +"</p>"; 		
				if(data.cDto.memberDto.u_no==userNo){
				chtml += 		   "<button type='button' onclick='commentDeleteBtn("+data.cDto.boardDto.bcm_no+")'>삭제</button>";
				chtml += 		   "<button type='button' onclick='commentModifyBtn("+data.cDto.boardDto.bcm_no+",\""+data.cDto.boardDto.bcm_nickname+"\",\""+data.cDto.boardDto.bcm_date+"\",\""+data.cDto.boardDto.bcm_content+"\",\""+data.cDto.boardDto.bt_no+"\","+data.cDto.memberDto.uc_no+")' >수정</button>&nbsp;" ;	
				}
				chtml += 						  "</div></div>";											
				console.log(chtml);														
 		     //댓글추가 
 		     $(".coment_view_comm_view").prepend(chtml);
 	
 		 },
 		 error:function(){
 			 alert("실패");
 		 }
	  });//ajax 
  }//댓글 쓰기
			
  
 //댓글 삭제
  function commentDeleteBtn(bcm_no){
	  alert("삭제 번호 : "+bcm_no);
	  if(confirm("댓글을 삭제하시겠습니까?")){
		  $.ajax({
			 url:"./commentDelete",
	 		 type:"post",
	 		 data:{
	 			 "bcm_no":bcm_no
	 		 },
	 		 success:function(data){   //data : commentDto
	 		     //댓글삭제
	 		     alert("정보는? : "+bcm_no);
	 		     $("#"+bcm_no).remove();
	 		
	 		 },
	 		 error:function(){
	 			 alert("실패");
	 		 }
		  });
	  }else{
		  return false;
	  } 
  }//댓글 삭제
   
  
  function commentModifyBtn(bcm_no,bcm_nickname,bcm_date,bcm_content,bt_no,uc_no){
	alert("댓글을 수정합니다.");	  
  
  	
	var chtml="";
				
		chtml += "<div id="+bcm_no+">"
				if(uc_no==1){
		chtml += 	"<div class='content_view_comm_top'>";
		chtml += 	"[유저]"+bcm_nickname+"<span>"+bcm_date+"</span></div>";
			}	
				
		
			if(uc_no==2){
				chtml += 	"<div class='content_view_comm_top'>";
				chtml += 	"[농장주]"+bcm_nickname+"<span>"+bcm_date+"</span></div>";
		       		}
				chtml +=   	"<div id='content_view_comm_textarea'>";
	 			chtml += 	"<textarea  id='updateTxt'>"+bcm_content+"</textarea>"; 
		 		chtml +=	"<button type='button' onclick='commentSaveBtn("+bcm_no+",\""+bcm_nickname+"\",\""+bcm_date+"\",\""+bcm_content+"\"," +bt_no+","+uc_no+")' >저장</button>&nbsp;"; 
		 		chtml +=	"<button type='button'  onclick='commentCancelBtn("+bcm_no+",\""+bcm_nickname+"\",\""+bcm_date+"\",\""+bcm_content+"\"," +bt_no+","+uc_no+")'>취소</button>";
				chtml +=	  	" </div></div>";
  		 
        
			  $("#"+bcm_no).html(chtml);  
 	 alert("댓글을 수정합니다.24");
  } 
  
  function commentSaveBtn(bcm_no,bcm_nickname,bcm_date,bcm_content,bt_no,uc_no){
	 alert("댓글 수정을 저장합니다.");
		  alert(bcm_no);
		  alert(bcm_date);
 		 	  $.ajax({
			 url:"./commentSave",
  type:"post",
 	 	 data:{
 			 "bcm_no":bcm_no,
 			 "bcm_nickname":bcm_nickname,			 		 
	 		 "bcm_date":bcm_date,
			 "bcm_content":$("#updateTxt").val(),
	  	     "bt_no":bt_no
 	 },
 	
		success:function(data){
		 	alert(data.boardDto.bcm_nickname);
		var chtml="";
			
			chtml += "<div id="+data.boardDto.bcm_no+">"
					if(userucno==1){
			chtml += "<div class='content_view_comm_top' >";
			chtml += 	"[유저]"+data.boardDto.bcm_nickname+"<span>"+data.boardDto.bcm_date+"</span></div>";
				}
						alert("2222");
			if(userucno==2){
					chtml += 	"<div class='content_view_comm_top'>";
						chtml += 	"[농장주]"+data.boardDto.bcm_nickname+"<span>"+data.boardDto.bcm_date+"</span></div>";
					}
				chtml +=   		"<div id='content_view_comm_textarea'>";
				chtml += 	 "<p>"+data.boardDto.bcm_content+"<p>"; 
				 chtml +="<button type='button' onclick='commentModifyBtn("+data.boardDto.bcm_no+",\""+data.boardDto.bcm_nickname+"\",\""+data.boardDto.bcm_date+"\",\""+ data.boardDto.bcm_content+"\","+data.boardDto.bt_no+","+data.memberDto.uc_no+")' >수정</button>&nbsp;";
			 	  chtml +=	"<button type='button'  onclick='commentDeleteBtn("+data.boardDto.bcm_no+",\""+data.boardDto.bcm_nickname+"\",\""+data.boardDto.bcm_date+"\",\""+ data.boardDto.bcm_content+"\","+data.boardDto.bt_no+","+data.memberDto.uc_no+")'>삭제</button>";
				chtml +=  " </div>  </div>"; 
	  
	              
				 $("#"+bcm_no).html(chtml);  
				 
		 },
 		 error:function(){
 			 alert("실패");
 		 }
	  });//ajax  
  }//댓글수정저장 
  //댓글 취소
  function commentCancelBtn(bcm_no,bcm_nickname,bcm_date,bcm_content,bt_no,uc_no){
	  alert("댓글 수정을 취소합니다.");
	   alert(userucno);
	  
 	   var chtml="";
		
		chtml+= "<div id="+bcm_no+">"
				if(userucno==1){
		chtml += 	"<div class='content_view_comm_top' >";
		chtml += 	"[유저]"+bcm_nickname+"<span>"+bcm_date+"</span></div>";
			}
				
			
			if(userucno==2){
				chtml += 	"<div id='coment_view_comm_modify'>";
				chtml += 	"[농장주]"+bcm_nickname+"<span>"+bcm_date+"</span></div>";
				}
			chtml += "<div id='content_view_comm_textarea'>";
			chtml += " <p>"+bcm_content +"</p>"; 
			chtml +="<button type='button' onclick='commentModifyBtn("+bcm_no+",\""+bcm_nickname+"\",\""+bcm_date+"\",\""+bcm_content+"\","+bt_no+","+uc_no+")' >수정</button>&nbsp;"; 
			chtml +="<button type='button'  onclick='commentDeleteBtn("+bcm_no+")''>삭제</button>";
			chtml +=	  " </div>  </div>";
	  console.log("취소 수정="+chtml);
	  $("#"+bcm_no).html(chtml);    
 } //댓글 취소
			
             
  
  
  
			
			</script>

			
            <div id="content_view_comm_write">
                <div id="content_view_comm_input">
                    <textarea id="replytype" placeholder="댓글을 입력하세요"></textarea>
                    <button type="button" class="replyBtn" onclick="commentWriteBtn()">등록</button>
                </div>
            </div>
			
			
	
 
				<!--반복문 -->
		  <div class="coment_view_comm_view" >
            <c:forEach items="${map.comm}" var="comm">
            <div id="${comm.boardDto.bcm_no}">
                <div class="content_view_comm_top" >
                    <c:if test="${comm.memberDto.uc_no==1}">
                    [유저]</c:if>
                    <c:if test="${comm.memberDto.uc_no==2}">[농장주]</c:if>
                    
                    ${comm.boardDto.bcm_nickname}<span>${comm.boardDto.bcm_date}</span>
                </div>
                <div id="coment_view_comm_modify">
                  
                   <p> 	${comm.boardDto.bcm_content}</p>
                   <c:if test="${comm.memberDto.u_no==session_uno}">	
                <button type="button" onclick="commentModifyBtn(${comm.boardDto.bcm_no},'${comm.boardDto.bcm_nickname}','${comm.boardDto.bcm_date}','${comm.boardDto.bcm_content}',${comm.boardDto.bt_no},${comm.memberDto.uc_no})">수정</button>
                <button type="button" onclick='commentDeleteBtn(${comm.boardDto.bcm_no})'>삭제</button>
                     </c:if>
                   
                   	</div></div> 
          
			</c:forEach>
  		</div>




            <div id="content_view_bottom1">

                  <div id="content_view_bottom2">
                <label>다음글</label>
                <div id="content_view_next">
             <a href="./board_comm?bc_no=${map.bDto.boardDto.bc_no}&bt_no=${map.preDto.boardDto.bt_no}&page=${nDto.page}&category=${nDto.category}&searchword=${nDto.searchword}">${map.preDto.boardDto.bt_title}</a>        
                  </div>
            </div>
                <label>이전글</label>
                <div id="content_view_prev">
                    <a href="./board_comm?bc_no=${map.bDto.boardDto.bc_no}&bt_no=${map.nextDto.boardDto.bt_no}&page=${nDto.page}&category=${nDto.category}&searchword=${nDto.searchword}">${map.nextDto.boardDto.bt_title}</a>
                </div>
            </div>
          
            <div class="board_btn">
                <button type="button" class="content_btn" onclick="location.href='board_comm_back?bc_no=${map.bDto.boardDto.bc_no}'">목록</button>
                
                <c:if test="${session_uno==map.bDto.memberDto.u_no}">
               <form action="./board_user_Delete" id="delete_board" method="post">
               <input type="hidden" name="bt_no" value="${map.bDto.boardDto.bt_no}">
                <button type="button" class="content_btn" onclick="delete_board_btn()">삭제</button>
              	</form>
              	</c:if>
               </div>
        </div>


    </section>











  

	 <%@ include file="../base/footer.jsp" %>





<link rel="stylesheet" href="../css/board.css">
</body>

</html>




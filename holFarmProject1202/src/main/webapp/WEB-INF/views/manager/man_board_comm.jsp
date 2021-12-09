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
	
	
	 function man_bord_deletebtn(){
	    	if(confirm("삭제 하시겠습니까?")){
	    		$("#delete_board_man").submit();
	    		alert("삭제가 완료되었습니다.");
	    	}else{
	    		return false;
	    	}
	    	
	    }
	
	
	
	 //댓글 삭제
	  function commentDeleteBtn(bcm_no){
		  alert("삭제 번호 : "+bcm_no);
		  if(confirm("댓글을 삭제하시겠습니까?")){
			  $.ajax({
				 url:"./man_board_View_comm_delete",
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
	
	
	
	</script>


</head>

<body>
		
	<%@ include file="../base/managerbase.jsp" %>


    <script src="../js/header.js"></script>

  
    <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>게시글 신고 내역</p>
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
                        style="padding-left: 20px; ">조회수 : </span><span>${map.bDto.boardDto.bt_hit}</span></div>
            </div>
            <div>

            </div>

			<div id="content_view_mid">${map.bDto.boardDto.bt_content}</div>


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
                 
                <button type="button" onclick='commentDeleteBtn(${comm.boardDto.bcm_no})' class="managerbuttoncss">삭제</button>
                    
                   
                   	</div></div> 
          
			</c:forEach>
  		</div>

    
            <div id="content_view_bottom1">

               
            </div>
          
            <div class="board_btn">
                <button type="button" class="content_btn managerbuttoncss" onclick="location.href='man_board_list?bc_no=${map.bDto.boardDto.bc_no}'">목록</button>
                
                <form action="./man_board_View_delete" id="delete_board_man" method="post">
                	<input type="hidden" name="bt_no" value="${map.bDto.boardDto.bt_no}">
                 <button type="button" class="content_btn managerbuttoncss" onclick="man_bord_deletebtn()">삭제</button>
               </form>
               </div>
        </div>
              
        



            

    </section>



<link rel="stylesheet" href="../css/board.css">
</body>

</html>




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
	 function writeBtn(){
		 if(confirm("게시글을 저장하시겠습니까?")){
			 $("#write").submit();
		 }else{
			 return false;
		 }
	 } 
  </script>	 

</head>

<body>

    	<%@ include file="../base/managerbase.jsp" %>



    <section id="contentArea">
        <!--contentArea{-->
        <div class="contentTitle">
            <p>글작성</p>
        </div>


    </section>
    <!--}contentArea-->
  

    <section id="wholewrite">
    <form action="./man_public_write" name="write" id="write" method="post" enctype="multipart/form-data">
        <div class="container">
            <div class="col-lg-3">
                <div class="writearea_md">
                <div id="titlearea">
                    <label>제목</label>
                    <input type="text" placeholder="제목을 입력해주세요" name="bn_title">
                </div>
                <div id="uploadarea">
                    <label>파일명</label>
                    <input type="file" id="file" name="file">
                </div>
                <div class="contentarea">
                    <label>내용</label>
                    <textarea placeholder="내용을 입력하세요" name="bn_content" ></textarea>
                </div>
                <div id="write_logo"><img src="../images/logo.png"></div>
                </div>
            </div>
        </div>
        <div class="button-04_m">

          <div class="button-4">
            <div class="eff-4"></div>
           <a><button type="button"onclick="writeBtn()">등록</button></a>
          </div>
        <div class="button-4">
            <div class="eff-4"></div>
            <a href="javascript:location.href='./man_public_board_list'"> 취소 </a>
          </div>
        </div>
        </form>
    </section>
 





	<link rel="stylesheet" href="../css/board.css">
</body>

</html>




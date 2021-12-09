<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/inquiry.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		if(${result==1}){
    			alert("문의 등록이 완료되었습니다!\n고객님의 의견을 귀담아 듣는 해피홀팜이 되겠습니다.");
    		}
    	});
    </script>
</head>

<body>
<%@ include file="../base/header.jsp" %>
    <!-- contents -->
        <div id="customer">
            <h2><strong id="inquriyTitle">1:1문의</strong><span id="inquriymTitle"><c:if test="${session_id==null }">로그인을 하시고 </c:if>해피홀팜에 문의사항을 남겨주시면 등록된 이메일로 답변해드립니다.</span></h2>
			<form action="send_inquiry">
				<input type="hidden" value="${session_uno }" name="u_no">
	            <div class="checkMt">
	                <table summary="분류, 제목, 상세내용, 첨부파일 순으로 궁금하신 점을 문의 하실수 있습니다." class="checkTable" border="1"
	                    cellspacing="0">
	                    <colgroup>
	                        <col width="19%" class="tw30" />
	                        <col width="*" />
	                    </colgroup>
	                    <tbody>
	                        <tr>
	                            <th scope="row"><span>분류</span></th>
	                            <td>
	                                <select>
	                                    <option value="">선택해주세요.</option>
	                                    <option value="상품관련">상품관련 문의</option>
	                                    <option value="농장관련">농장관련 문의</option>
	                                    <option value="체험관련">체험관련 문의</option>
	                                </select>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><span>제목</span></th>
	                            <td>
	                                <input type="text" class="wlong" name="ci_title"/>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th scope="row"><span>상세 내용</span></th>
	                            <td>
	                                <textarea class="tta" name="ci_content"></textarea>
	                            </td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
				<c:if test="${session_id!=null }">
	            <!-- Btn Area -->
	            <div class="btnArea">
	                <div class="bCenter">
	                    <ul>
	                        <li><a href="../main" class="nbtnbig">취소</a></li>
	                        <li><input type="submit" class="sbtnMini" value="확인" style="border:none; cursor: pointer"></li>
	                    </ul>
	                </div>
	            </div>
	            </c:if>
            </form>
            <!-- //Btn Area -->

        </div>
<%@ include file="../base/footer.jsp" %>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../base/myPage.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/step02.css">
    <style type="text/css">
    	.r10 input{width: 490px;}
    	#memberbd2 {padding: 0;}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script type="text/javascript">
    // 이메일 , 자르고 @ 붙이기
    $(function(){
    	var uEmail = "${mDto.u_email}";
    	//var uEmailSplit = uEmail.split(','); // 이메일자르기
    	var uEmailSplit = uEmail.replace(',','@');

		$("#u_email").val(uEmailSplit);
    });    	
    </script>
    
</head>
<body>
    <section style="margin-left: 310px; width: 1200px; margin-top: 50px;">
        <!-- 내용 여기 입력 -->
        <div class="memberbd" id="memberbd2">
            <table class="memberWrite" border="1" cellspacing="0">
                <colgroup>
                <col width="20%" class="tw30" />
                <col width="*" />
                </colgroup>
                <tbody>
                     <tr>
                        <th scope="row"><span>아이디</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" class="w134" name="u_id" id="u_id" readonly value="${mDto.u_id}"/></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>이름</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" class="w134" name="u_name" id="u_name" readonly value="${mDto.u_name}" /></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>닉네임</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" class="w134" name="u_nickname" id="u_nickname" readonly value="${mDto.u_nickname}" /></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>연락처</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" class="w74" name="u_phone" id="u_phone" maxlength="11" readonly value="${mDto.u_phone}"/></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>이메일</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" class="w134" name="u_email" id="u_email" readonly /></li>
                            </ul>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row"><span>주소</span></th>
                        <td>
                            <ul class="pta">
                                <li class="r10"><input type="text" id="zipcode" name="zipcode" class="w134" readonly value="${mDto.u_addr}" /></li>
                            </ul>
                        </td>
                    </tr>
    		<!-- 농장주에 해당 -->
    				<c:if test="${session_ucno == 2 }">
	                    <tr>
	                        <th scope="row"><span>은행명</span></th>
	                        <td>
	                            <ul class="pta">
	                                <li class="r10"><input type="text" class="w134" name="u_bank" id="u_bank" readonly value="${mDto.u_bank}" /></li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><span>예금주</span></th>
	                        <td>
	                            <ul class="pta">
	                                <li class="r10"><input type="text" class="w134" name="u_account" id="u_account" readonly value="${mDto.u_account}"></li>
	                            </ul>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th scope="row"><span>계좌번호</span></th>
	                        <td>
	                            <ul class="pta">
	                                <li class="r10"><input type="text" class="w134" name="u_accountno" id="u_accountno" readonly value="${mDto.u_accountno}"></li>
	                            </ul>
	                        </td>
	                    </tr>
                	</c:if>
                </tbody>
                </table>
            </div>
    </section>
    <%@ include file="../base/footer.jsp" %>
</body>
</html>
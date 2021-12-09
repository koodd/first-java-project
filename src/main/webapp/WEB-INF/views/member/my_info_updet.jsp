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
    <title>회원정보수정</title>

    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/step02.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style type="text/css">
	input{
		border:1px solid black;
	}
	#u_id, #u_name, #u_regno, #u_email{
		background-color: #ddd;
	}
	.memberbd{
		margin: 100px 0 0 0;
		padding-left: 200px
	}
	.btnBox{
		padding-left: 25px;
	}
	</style>
	
	
    <script> 
		$(function(){

	    	var uEmail = "${mDto.u_email}";
	    	//var uEmailSplit = uEmail.split(','); // 이메일자르기
	    	var uEmailSplit = uEmail.replace(',','@');

			$("#u_email").val(uEmailSplit);

			
    // 가져온 은행 value 값 넣기
		    var ubank = "${mDto.u_bank}";

 			$("#u_bank option").each(function(){
 				if($(this).val() == ubank)
	 					$(this).prop('selected',true);
 			});	
 	// 가져온 수신수단 스플릿으로 자르기		
 			var uInfoWay = "${mDto.u_infoway}";
 			
 			var uInfoWaySplit = uInfoWay.split(',');
 			var uInfoWaySplit2 = uInfoWaySplit[0]; //문자
 			var uInfoWaySplit3 = uInfoWaySplit[1];	// 이메일
 			var chBoxConfirm1 = $("input:checkbox[id='u_infoway1']").val(); //문자
 			var chBoxConfirm2 = $("input:checkbox[id='u_infoway2']").val();	// 이메일
 			// 가져온 문자 비교후 같으면 체크해주기
 			if(uInfoWaySplit2==chBoxConfirm1){
 				$("input:checkbox[id='u_infoway1']").prop("checked", true);
 			}
 			if(uInfoWaySplit3==chBoxConfirm2){
 				$("input:checkbox[id='u_infoway2']").prop("checked", true);
 			}
 			
 			
 	// 스플릿으로 주소 자르기
 				var myAddr = '${mDto.u_addr}';
 				var myAddrSplit = myAddr.split(',');
 				var myAddrSplit2 = myAddrSplit[0];
 				var myAddrSplit3 = myAddrSplit[1];

 				$("#u_addr1").val(myAddrSplit2);
 				$("#u_addr2").val(myAddrSplit3);
 			
 	// 체크박스 확인해주고 체크가 하나라도 되어있으면 라디오 버튼에서 예 버튼으로 체크해주기
 				if(uInfoWaySplit2==chBoxConfirm1){
 					$("input:radio[name='receive']:radio[value='예']").prop('checked', true);
 				}else if(uInfoWaySplit3==chBoxConfirm2){
 					$("input:radio[name='receive']:radio[value='예']").prop('checked', true);
 				}else if(uInfoWaySplit2==chBoxConfirm1 || uInfoWaySplit3==chBoxConfirm2){
 					$("input:radio[name='receive']:radio[value='예']").prop('checked', true);
 				}
		});

        function zipSearch(){
            new daum.Postcode({
                oncomplete: function(data) {
                    $("#zipcode").val(data.zonecode);
                    $("#zipcode").attr("readonly",true);
                    $("#u_addr1").val(data.address);
                    $("#u_addr1").attr("readonly",true);
                    $("#u_addr2").focus();
                }
          }).open(); 
        }

        // 패스워드 일치 확인
       $(function(){
            $("#u_pw2").keyup(function(){
                if($("#u_pw").val()!=$("#u_pw2").val()){
                    $("#pwtxt").css("color","red");
                    $("#pwtxt").css("font-weight","bold");
                    $("#pwtxt").text("* 비밀번호가 일치하지않습니다. 다시 입력하세요.");
                    return false;
                }else{
                    $("#pwtxt").css("color","green");
                    $("#pwtxt").css("font-weight","bold");
                    $("#pwtxt").text("* 비밀번호가 일치합니다.");
                }
            });
       });
       // 정규 표현식

       
       $(function(){

    	   
            $("#memberBtn").click(function(){
                var patternPw=/^[a-zA-Z0-9]{4,15}$/;
                var patternNickname=/^[a-zA-Z가-힣0-9]{2,16}$/;
                var patternPhoneNumber=/^[0]{1}[0-9]{1,2}[0-9]{8}$/;
                var patternRegno=/\b(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}\b/;
                var patternAccount=/^[가-힣]{2,10}$/;
                var patternAccountNo=/^[0-9]{1,14}$/;
                var patternEmail1 =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*$/;
                var patternEmail2 =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

                if(patternPw.test($("#u_pw").val())!=true){
                    alert("비밀번호가 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_pw").focus();
                    /* return false; */
                }else if(patternNickname.test($("#u_nickname").val())!=true){
                    alert("닉네임이 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_nickname").focus();
                    /* return false; */
                }else if(patternPhoneNumber.test($("#u_phone").val())!=true){
                    alert("연락처가 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_phone").focus();
                    /* return false; */
                }else if(patternAccount.test($("#u_account").val())!=true){
                    $("#u_account").focus();
                    /* return false; */
                }else if(patternAccountNo.test($("#u_accountno").val())!=true){
                    alert("계좌번호가 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_accountno").focus();
                    /* return false; */
                }
                
            });
            
            $(function(){
                $("#receive_yes").click(function(){
                    $("input:checkbox[name=u_infoway]").each(function(){
                        if(this.checked==false){
                            this.checked=true;
                        }
                    });
                });
            });
            $(function(){
                $("#receive_no").click(function(){
                    $("input:checkbox[name=u_infoway]").each(function(){
                        if(this.checked==false){
                            this.disabled=true;
                        }
                    });
                });
            });

       });
	// 닉네임 중복체크

	function fn_nicChk(){
		$.ajax({
			url:"/member/nicChk2",
			type:"post",
			dataType:"json",
			data:{
				"u_nickname":$("#u_nickname").val(),
				"u_no":"${session_uno}"
			},
			success:function(data){
				if(data==1){
					alert("중복된 닉네임입니다.");
					$("#u_nickname").val("");
				}else if(data==0){
					$("#nicChk").attr("value","Y");
					alert("사용가능한 닉네임입니다.");
				}
			},
/* 			error:function(){
				alert("에러");
			} */
		});//ajax
	}
    

    </script>

	<script type="text/javascript">
		function myInfoUpdateBtn() {
			if (confirm("회원 정보를 수정하시겠습니까?")) {
				$("#infoUpdet").submit();
			}
		}
	</script>


</head>
<body style="margin: 0 auto; width: 1200px;">
	<h2><strong>회원정보 수정</strong></h2>
      <form action="./infoUpdet" name=infoUpdet id="infoUpdet" method="post">
      <input type="hidden" name="u_no" value="${mDto.u_no}">
	    <div class="memberbd">
		    <!-- 클래스만 남기고 지우기22 -->
	        <table class="memberWrite">
	            <colgroup>
	            <col width="22%" class="tw30" />
	            <col width="*" />
	            </colgroup>
	            <tbody>
	                 <tr>
	                    <th scope="row"><span>아이디 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w134" name="u_id" id="u_id" readonly="readonly" value="${mDto.u_id}"/></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>비밀번호 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="password" class="w134" name="u_pw" id="u_pw" /></li>
	                            <li><span class="mvalign">※ 영문 / 숫자 혼용으로 4~15자 까지 가능.</span></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>비밀번호 확인 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="password" class="w134" name="u_pw2" id="u_pw2"/></li>
	                            <li>
	                                <span id="pwtxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>이름 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w134" name="u_name" id="u_name" readonly="readonly" value="${mDto.u_name}"></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>닉네임 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w134" name="u_nickname" id="u_nickname" value="${mDto.u_nickname}"></li>
	                            <li><a href="javascript:;" class="nbtnMini" id="nicChk" onclick="fn_nicChk()">중복확인</a></li><br><br>
	                            <li><span class="mvalign">※ 영문/숫자/한글 혼용으로 2~16자 가능</span></li><br>
	                            <li><span class="mvalign">※ 수정하실 닉네임을 입력해주세요.</span></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>연락처 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w74" name="u_phone" id="u_phone" maxlength="11" placeholder="'-'를 제외하고 입력해주세요" value="${mDto.u_phone}"/></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>주민번호 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li><input type="text" class="w134" name="u_regno" id="u_regno" readonly="readonly" value="${mDto.u_regno}"/></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>이메일 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li><input type="text" class="w134" name="u_email" id="u_email" readonly="readonly" value="${mDto.u_email }"/></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>정보 수신여부 </span></th>
	                    <td>
	                        <p>해피홀팜에서 진행되는 체험 프로그램과 쇼핑에 대한 정보를 받아보시겠습니까?</p>
	                        <ul class="question">
	                            <li>
	                                <input type="radio" name="receive" id="receive_yes" class="radio_t" value="예"/><label for="receive_yes">예</label>
	                            </li>
	                            <li>
	                                <input type="radio" name="receive" id="receive_no" class="radio_t" value="아니오"/><label for="receive_no">아니오</label>
	                            </li>
	                        </ul>
	                        <p class="gray">* 거래관련 정보는 고객님의 거래안전을 위하여 이메일 수신거부와 관계없이 발송됩니다.</p>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>정보 수신수단 </span></th>
	                    <td>
	                        <ul class="question">
	                            <li>
	                                <input type="checkbox" name="u_infoway" id="u_infoway1" value="문자" /><label for="u_infoway1">문자</label>
	                            </li>
	                            <li>
	                                <input type="checkbox" name="u_infoway" id="u_infoway2" value="이메일" /><label for="u_infoway2">이메일</label>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>주소 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li>
	                                <input type="text" id="zipcode" name="zipcode" class="w134" />&nbsp;
	                            </li>
	                            <!-- # 상단이동 막기 javascript:;" 22 -->
	                            <li><a href=javascript:;" class="addressBtn" onclick="zipSearch()"><span>우편번호 찾기</span></a></li><br><br>
	                            <li class="pt5"><input type="text" id="u_addr1" name="u_addr" /></li><br><br>
	                            <li class="pt5"><input type="text" id="u_addr2" name="u_addr" placeholder="상세주소를 적어주세요" /></li>
	                            <li class="cb">
	                                <span class="mvalign"> ※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	<!-- 농장주에 해당 -->
					<c:if test="${session_ucno==2}">
		                <tr>
		                    <th scope="row"><span>은행명 *</span></th>
		                    <td>
		                    
		                        <ul class="pta">
		                            <li>
		                                <select name="u_bank" id="u_bank" onchange="selectBoxChange(this.value);">		                     
		                                    <option value="우리은행">우리은행</option>
		                                    <option value="기업은행">기업은행</option>
		                                    <option value="새마을금고">새마을금고</option>
		                                    <option value="국민은행">국민은행</option>       
		                                    <option value="외한은행">외한은행</option>    
		                                    <option value="신한은행">신한은행</option>    
		                                    <option value="카카오뱅크">카카오뱅크</option>    
		                                    <option value="농협은행">농협은행</option>    
		                                    <option value="수협은행">수협은행</option>    
		                                    <option value="대구은행">대구은행</option>    
		                                    <option value="부산은행">부산은행</option>    
		                                    <option value="경남은행">경남은행</option>    
		                                    <option value="광주은행">광주은행</option>    
		                                    <option value="전북은행">전북은행</option>    
		                                    <option value="제주은행">제주은행</option>    
		                                </select>
		                            </li>
		                        </ul>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row"><span>예금주 *</span></th>
		                    <td>
		                        <ul class="pta">
		                            <li class="r10"><input type="text" class="w134" name="u_account" id="u_account" value="${mDto.u_account}"></li>
		                        </ul>
		                    </td>
		                </tr>
		                <tr>
		                    <th scope="row"><span>계좌번호 *</span></th>
		                    <td>
		                        <ul class="pta">
		                            <li class="r10"><input type="text" class="w134" name="u_accountno" id="u_accountno" maxlength="14" value="${mDto.u_accountno}"></li>
		                        </ul>
		                    </td>
		                </tr>
	                </c:if>
	            </tbody>
	            </table>
	        </div>
	
	        <div class="btnBox">
	            <div class="bCenter">
	                <ul>
	                    <li>
	                        <button type="button" class="back" onclick="javascript:location.href='./my_index?u_no=${session_uno}'">취소</button>
	                    </li>
	                    <li>
	                        <button type="button" class="next" id="memberBtn" onclick="myInfoUpdateBtn()">회원정보 수정</button>
	                    </li>
	                </ul>
	            </div>
	        </div>
        </form>

  <%@ include file="../base/footer.jsp" %> 
</body>
</html>
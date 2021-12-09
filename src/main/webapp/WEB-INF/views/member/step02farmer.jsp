<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../base/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>step02</title>

    
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap4/bootstrap.min.css">
    <link rel="stylesheet" href="../css/step02.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script>



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

        // 정보 수신여부 확인
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

        // 패스워드 일치 확인
       $(function(){
            $("#u_pw2").keyup(function(){
                var patternPw=/^[a-zA-Z0-9]{4,15}$/;
                
                if($("#u_pw").val()!=$("#u_pw2").val()){
                    $("#pwtxt").css("color","red");
                    $("#pwtxt").css("font-weight","bold");
                    $("#pwtxt").text("* 비밀번호가 일치하지않습니다. 다시 입력하세요.");
                    return false;
                }else if(patternPw.test($("#u_pw").val())!=true){
                    $("#pwtxt").css("color","red");
                    $("#pwtxt").css("font-weight","bold");
                    $("#pwtxt").text("*비밀번호를 올바르게입력하지 않으셨습니다.");
                    return false;
                }else{
                    $("#pwtxt").css("color","green");
                    $("#pwtxt").css("font-weight","bold");
                    $("#pwtxt").text("* 비밀번호를 올바르게 입력하셨습니다.");
                }
                
                
            });
            
            
       });
       // 정규 표현식
      
       $(function(){
    	   $("#u_id").keyup(function(){
               var patternId=/^[a-zA-Z]{1}[a-zA-Z0-9]{3,15}$/;              
               if(patternId.test($("#u_id").val())!=true){
                   $("#idtxt").css("color","red");
                   $("#idtxt").css("font-weight","bold");
                   $("#idtxt").text("* 아이디가 올바르지않습니다. 다시 입력하세요.");

                   return false;
               }else{
                   $("#idtxt").css("color","green");
                   $("#idtxt").css("font-weight","bold");
                   $("#idtxt").text("* 아이디가 올바르게 입력되었습니다.");
               }               
			}); // id
	    	   $("#u_name").keyup(function(){
	                var patternName=/^[가-힣]{2,10}$/;
	               
	               if(patternName.test($("#u_name").val())!=true){
	                   $("#nametxt").css("color","red");
	                   $("#nametxt").css("font-weight","bold");
	                   $("#nametxt").text("* 한글만 입력해주세요.");

	                   return false;
	               }else{
	                   $("#nametxt").css("color","green");
	                   $("#nametxt").css("font-weight","bold");
	                   $("#nametxt").text("* 올바르게 입력되었습니다.");
	               }                        
				}); // name			
		    	$("#u_nickname").keyup(function(){
	                var patternNickname=/^[a-zA-Z가-힣0-9]{2,16}$/;		               
		               if(patternNickname.test($("#u_nickname").val())!=true){
		                   $("#nicknametxt").css("color","red");
		                   $("#nicknametxt").css("font-weight","bold");
		                   $("#nicknametxt").text(" * 위의 양식에 맞게 입력해주세요.");

		                   return false;
		               }else{
		                   $("#nicknametxt").css("color","green");
		                   $("#nicknametxt").css("font-weight","bold");
		                   $("#nicknametxt").text("* 올바르게 입력되었습니다.");
		               }     
					}); // nickname
		    	$("#u_phone").keyup(function(){
	                var patternPhoneNumber=/^[0]{1}[0-9]{1,2}[0-9]{8}$/;		               
		               if(patternPhoneNumber.test($("#u_phone").val())!=true){
		                   $("#phonetxt").css("color","red");
		                   $("#phonetxt").css("font-weight","bold");
		                   $("#phonetxt").text(" * -를 제외하고 입력해주세요.");

		                   return false;
		               }else{
		                   $("#phonetxt").css("color","green");
		                   $("#phonetxt").css("font-weight","bold");
		                   $("#phonetxt").text("* 올바르게 입력되었습니다.");
		               }     
					});	// phone
		    	$("#u_regno").keyup(function(){
	                var patternRegno=/\b(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}\b/;		               
		               if(patternRegno.test($("#u_regno").val())!=true){
		                   $("#regnotxt").css("color","red");
		                   $("#regnotxt").css("font-weight","bold");
		                   $("#regnotxt").text(" * '-(하이픈)' 을 넣고 입력해주세요.");

		                   return false;
		               }else{
		                   $("#regnotxt").css("color","green");
		                   $("#regnotxt").css("font-weight","bold");
		                   $("#regnotxt").text("* 올바르게 입력되었습니다.");
		               }     
					}); // regno
		    	$("#u_account").keyup(function(){
	                var patternAccount=/^[가-힣]{2,10}$/;		               
		               if(patternAccount.test($("#u_account").val())!=true){
		                   $("#accounttxt").css("color","red");
		                   $("#accounttxt").css("font-weight","bold");
		                   $("#accounttxt").text(" * 한글만 입력해주세요.");

		                   return false;
		               }else{
		                   $("#accounttxt").css("color","green");
		                   $("#accounttxt").css("font-weight","bold");
		                   $("#accounttxt").text("* 올바르게 입력되었습니다.");
		               }     
					}); //account
		    	$("#u_accountno").keyup(function(){
	                var patternAccountNo=/^[0-9]{1,14}$/;	               
		               if(patternAccountNo.test($("#u_accountno").val())!=true){
		                   $("#accountnotxt").css("color","red");
		                   $("#accountnotxt").css("font-weight","bold");
		                   $("#accountnotxt").text(" * 숫자만 입력 해주세요.");

		                   return false;
		               }else{
		                   $("#accountnotxt").css("color","green");
		                   $("#accountnotxt").css("font-weight","bold");
		                   $("#accountnotxt").text("* 올바르게 입력되었습니다.");
		               }     
					}); // account no
					

            $("#memberBtn").click(function(){

                var patternEmail1 =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*$/;
                var patternEmail2 =/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;   
         
                if(patternEmail1.test($("#u_email").val())!=true){
                    alert("이메일 앞부분이 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_email").focus();
                    return false;
                }
                if(patternEmail2.test($("#u_email2").val())!=true){
                    alert("이메일뒷부분이 잘못입력되었습니다. 다시입력해주세요.");
                    $("#u_email2").focus();
                    return false;
                }           
            });
       });

       $(function(){
            var $sel = $("#emailList");
            var $email = $("#u_email");
            var $etype = $("#u_email2");

             $sel.change(function(){
                val = $sel.val();
                if(val.length<1){
                    $etype.removeAttr("readonly");
                }else{
                    $etype.attr("readonly",true);

                }
                $etype.val(val);
            });
       });
   	// 농장주 회원가입 
   	function userRegBtn(){
   		if(confirm("회원가입 완료")){
   			$("#farmerReg").submit();
   		}else{
   			return false;
   		}
   	}    
       
   	// 이메일 인증하기
   	function sendEmail(){
   		alert("이메일 인증 메일을 보냈습니다.");
   		$.ajax({
   			url:"sendEmail",
   			type:"post",
   			data:{
   				"u_id":$("#u_id").val(),
   				"u_email":$("#u_email").val(),
   				"u_email2":$("#u_email2").val()
   			},
   			success:function(data){			
   				alert("이메일 전송이 완료되었습니다.");
   				$("#emailCk").val(data);
   			},
   			error:function(textStatus, errorThrown){
   				alert("이메일이 올바르지 않습니다.");
   			}								
   		});// ajax
   	}//sendEmail  
	// 이메일 번호확인
	function sendCheck(){
		alert("이메일 인증이 확인되었습니다.");
	}
	// 닉네임 중복체크
	function fn_idChk(){
		$.ajax({
			url:"/member/idChk",
			type:"post",
			dataType:"json",
			data:{
				"u_id":$("#u_id").val()
			},
			success:function(data){
				if(data==1){
					alert("중복된 아이디입니다.");
					$("#u_id").val("");
				}else if(data==0){
					$("#idChk").attr("value","Y");
					alert("사용가능한 아이디입니다.");
				}
			},
			error:function(){
				alert("에러");
			}
		});//ajax
	}
	function fn_nicChk(){
		$.ajax({
			url:"/member/nicChk",
			type:"post",
			dataType:"json",
			data:{
				"u_nickname":$("#u_nickname").val()
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
			error:function(){
				alert("에러");
			}
		});//ajax
	}
    </script>

</head>
<body style="margin: 0 auto; width: 1200px;">

    <script src="../js/header.js"></script>

    <h2>
        <strong>신규 회원 (농장주) 회원가입</strong>
        <span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span>
    </h2>

    <div class="stepwrap">
        <div class="stepbox">
            <div class="step">
                <p class="web">step 01</p>
                <p class="txt">약관동의</p>
                
            </div>
            <div class="step stepon">
                <p class="web">step 02</p>
                <p class="txt">가입 정보 입력</p>
                <p class="ck">
                    <img src="../images/bg_step.png" alt="">
                </p>
            </div>
            <div class="step">
                <p class="web">step 03</p>
                <p class="txt">회원 가입 완료</p>
            </div>
        </div>
    </div>

    <div class="attention">
        <ul>
            <li>
                * 표시된 항목은 필수 항목이므로 반드시 입력하셔야 회원가입이 진행됩니다.
            </li>
        </ul>
    </div>
    <form action="./farmerReg" name="farmerReg" id="farmerReg" method="post">
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
	                            <li class="r10"><input type="text" class="w134" name="u_id" id="u_id" maxlength="16"/></li>
	                            <li><a href="javascript:;" class="nbtnMini" id="idChk" onclick="fn_idChk()">중복확인</a></li><br>
	                            <li><span class="check_font" id="uid_check"></span></li>
	                            <li class="pt5"><span class="mvalign">※ 첫 글자는 영문으로 4~16자 까지 가능, 영문,숫자만 사용 가능</span></li><br><br>
	                            <li>
	                                <span id="idtxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>비밀번호 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="password" class="w134" name="u_pw" id="u_pw" maxlength="15"/></li>
	                            <li><span class="mvalign">※ 영문 / 숫자 혼용으로 4~15자 까지 가능.</span></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>비밀번호 확인 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="password" class="w134" name="u_pw2" id="u_pw2" maxlength="15"/></li>
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
	                            <li class="r10"><input type="text" class="w134" name="u_name" id="u_name"></li>
	                            <li>
	                                <span id="nametxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>닉네임 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w134" name="u_nickname" id="u_nickname" maxlength="16"></li>
	                            <li><a href="javascript:;" class="nbtnMini" id="nicChk" onclick="fn_nicChk()">중복확인</a></li><br><br>
	                            <li><span class="mvalign">※ 영문/숫자/한글 혼용으로 2~16자 가능.</span></li><br>
	                            <li>
	                                <span id="nicknametxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>연락처 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w74" name="u_phone" id="u_phone" maxlength="11" placeholder="'-'를 제외하고 입력해주세요"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/></li>
	                            <li>
	                                <span id="phonetxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>주민번호 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li><input type="text" class="w134" name="u_regno" id="u_regno" maxlength="14" /></li>
	                            <li>
	                                <span id="regnotxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>이메일 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li><input type="text" class="w134" name="u_email" id="u_email"/></li>
	                            <li><span class="valign">&nbsp;@&nbsp;</span></li>
	                            <li class="r10"><input type="text" class="w134" name="u_email" id="u_email2"/></li>
	                            <li>
	                                <select id="emailList" name="emailList">
	                                    <option value="" selected="selected">::직접입력::</option>
	                                    <option value="naver.com">네이버</option>
	                                    <option value="daum.net">다음</option>
	                                    <option value="hanmail.net">한메일</option>
	                                    <option value="nate.com">네이트</option>       
	                                    <option value="gmail.com">구글</option>    
	                                </select>&nbsp;&nbsp;&nbsp;
	                            </li>
	                            <!-- # 상단이동 막기 javascript:;" 22 -->
	                            <li><a href=javascript:;" class="nbtnMini" onclick="sendEmail()">이메일인증하기</a></li><br><br>
	                            <li><input type="text" class="w134" name="emailCk" id="emailCk" placeholder="인증번호를 입력해주세요.">&nbsp;&nbsp;</li>
	                            <!-- # 상단이동 막기 javascript:;" 22 -->
	                            <!-- 이메일 인증 번호확인버튼 넣어주기 -->
		                        <li><a href=javascript:;" class="nbtnMini" id="sendCheck" onclick="sendCheck()">번호확인</a></li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>정보 수신여부 </span></th>
	                    <td>
	                        <p>해피홀팜에서 진행되는 체험 프로그램과 쇼핑에 대한 정보를 받아보시겠습니까?</p>
	                        <ul class="question">
	                            <li>
	                                <input type="radio" name="receive" id="receive_yes" class="radio_t" /><label for="receive_yes">예</label>
	                            </li>
	                            <li>
	                                <input type="radio" name="receive" id="receive_no" class="radio_t" /><label for="receive_no">아니오</label>
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
	                                <input type="checkbox" name="u_infoway" id="u_infoway" value="문자" />문자
	                            </li>
	                            <li>
	                                <input type="checkbox" name="u_infoway" id="u_infoway" value="이메일" />이메일
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
	                            <li class="pt5"><input type="text" id="u_addr2" name="u_addr" placeholder="상세주소를 적어주세요"/></li>
	                            <li class="cb">
	                                <span class="mvalign">※ 상품 배송 시 받으실 주소입니다. 주소를 정확히 적어 주세요.</span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	<!-- 농장주에 해당 -->
	                <tr>
	                    <th scope="row"><span>은행명 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li>
	                                <select name="u_bank" id="u_bank">
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
	                            <li class="r10"><input type="text" class="w134" name="u_account" id="u_account"></li>
	                        	<li>
	                                <span id="accounttxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th scope="row"><span>계좌번호 *</span></th>
	                    <td>
	                        <ul class="pta">
	                            <li class="r10"><input type="text" class="w134" name="u_accountno" id="u_accountno" maxlength="14" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></li>
	                            <li>
	                                <span id="accountnotxt"></span>
	                            </li>
	                        </ul>
	                    </td>
	                </tr>
	            </tbody>
	            </table>
	        </div>
	
	        <div class="btnBox">
	            <div class="bCenter">
	                <ul>
	                    <li>
	                        <button type="button" class="back" onclick="javascript:location.href='./step01'">이전</button>
	                    </li>
	                    <li>
	                        <button type="button" class="next" id="memberBtn" onclick="userRegBtn()">다음</button>
	                    </li>
	                </ul>
	            </div>
	        </div>
        </form>
  <%@ include file="../base/footer.jsp" %> 
</body>
</html>
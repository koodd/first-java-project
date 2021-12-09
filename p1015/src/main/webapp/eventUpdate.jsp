<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pages - Login</title>
  <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700,900&display=swap&subset=korean" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/write.css">
</head>

<body>
  <header>
    <ul>
      <li>회원가입</li> <span>|</span>
      <li>로그인</li> <span>|</span>
      <li>고객행복센터</li> <span>|</span>
      <li>배송지역검색</li> <span>|</span>
      <li>기프트카드 등록</li>
    </ul>
  </header>

  <nav>
    <div class="logo"></div>

    <div id="search">
      <div class="search"></div><br>
      <span>메뉴찾기</span>
    </div>

    <div id="cart">
      <div class="cart"></div><br>
      <span>장바구니</span>
    </div>

    <div class="nav-menu">
      <ul>
        <li>COOKIT소개</li>
        <li>COOKIT 메뉴</li>
        <li>리뷰</li>
        <li>이벤트</li>
        <li>MY쿡킷</li>
      </ul>  
    </div>
  </nav>

  <section>
    <h1>이벤트 등록</h1>
    <hr>

    <form action="doEventUpdate.do" name="write" method="post" enctype="multipart/form-data">
      <table>
      <input type="hidden" name="eid" value="${eDto.eid}">
      <input type="hidden" name="id" value="${eDto.id}">
      <input type="hidden" name="efileName" value="${eDto.efilename}">
      <input type="hidden" name="efileName2" value="${eDto.efilename2}">
        <colgroup>
          <col width="15%">
          <col width="85%">
        </colgroup>
        <tr>
          <th>진행상태</th>
          <td>
            <div class="category-wrapper">
              <select name="estate" id="estate">
                <option value="진행예정" ${(eDto.estate=='진행예정')?'selected':''}>진행예정</option>
                <option value="진행중" ${(eDto.estate=='진행중')?'selected':''}>진행중</option>
                <option value="진행종료" ${(eDto.estate=='진행종료')?'selected':''}>진행종료</option>
              </select>  
            </div>
          </td>
        </tr>
        <tr>
          <th>시작일</th>
          <td>
            <input type="date" name="startdate" value='<fmt:formatDate value="${eDto.startdate}" pattern="yyyy-MM-dd"/>'>
          </td>
        </tr>
        <tr>
          <th>종료일</th>
          <td>
            <input type="date" name="enddate" value='<fmt:formatDate value="${ eDto.enddate }" pattern="yyyy-MM-dd"/>'>
          </td>
        </tr>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" name="etitle" value="${eDto.etitle }">
          </td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <textarea name="econtent" cols="50" rows="10">${eDto.econtent}</textarea>
          </td>
        </tr>
        <tr>
          <th>썸네일이미지</th>
          <td>
            <input type="file" name="fileName" id="fileName">
          </td>
        </tr>
        <tr>
          <th>썸네일이미지 파일이름</th>
          <td>${eDto.efilename}</td>
        </tr>
        <tr>
          <th>상세이미지</th>
          <td>
            <input type="file" name="fileName2" id="fileName2">
          </td>
        <tr>
          <th>상세이미지 파일이름</th>
          <td>${eDto.efilename2}</td>
        </tr>
        </tr>
      </table>
      <hr>
      <div class="button-wrapper">
        <button type="submit" class="write">작성완료</button>
        <button type="button" class="cancel" onclick="javascript:location.href='eventList.do'">취소</button>
      </div>
    </form>

  </section>

  <footer>
    <div class="wrapper">
      <div class="footer-left">
        <div class="footer-logo"></div>
        <div class="copyright">© COOKIT ALL RIGHTS RESERVED</div>
      </div>
  
      <div class="footer-center">
        <ul class="footer-nav">
          <li class="first-list">이용약관</li>
          <li class="green">개인정보처리 방침</li>
          <li>법적고지</li>
          <li>사업자정보 확인</li>
        </ul>
  
        <ul class="footer-info">
          <li class="first-list">씨제이제일제당(주)</li>
          <li>대표이사 : 손경식,강신호,신현재</li>
          <li>사업자등록번호 : 104-86-09535</li>
          <li class="first-list">주소 : 서울 중구 동호로 330 CJ제일제당 센터 (우) 04560</li>
          <li>통신판매업신고 중구 제 07767호</li>
          <li class="first-list">개인정보보호책임자 : 조영민</li>
          <li>이메일 : cjon@cj.net</li>
          <li>호스팅제공자 : CJ올리브네트웍스㈜</li>
        </ul>
  
        <div id="check">고객님은 안전거래를 위해 현금등으로 결제시 LG U+ 전자 결제의 매매보호(에스크로) 서비스를 이용하실 수 있습니다. <span class="check">가입 사실 확인</span></div>
      </div>
  
      <div class="footer-right">
        <div id="shortcut">
          <span>CJ그룹계열사 바로가기</span>
          <div class="shortcut"></div>
        </div>
  
        <div class="call">고객행복센터 1668-1920</div>
        <div class="inquery">1:1 문의</div>
      </div>
  
    </div>
  </footer>
</body>
</html>
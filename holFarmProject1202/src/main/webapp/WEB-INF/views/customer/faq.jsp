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
<link rel="stylesheet" href="../css/faq.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(function() {
		$(".faqbtn").click(
				function() {
					if ($(this).parent().is(".hover")) {
						$(this).parent().removeClass("hover")
						$(".faqanswer").hide(300)
					} else {
						$(".faqanswer").hide(300)
						$(".faqbtn").parent().removeClass("hover")
						$(this).siblings(".faqanswer").show(300).parent()
								.addClass("hover");
					}
				});
	});
</script>
</head>
<body>
<%@ include file="../base/header.jsp" %>
	<div id="customer">
		<h2>
			<strong>FAQ</strong><span>회원님들께서 자주 묻는 질문들을 모아 놓았습니다.</span>
		</h2>

		<div class="faqTab">
			<ul>
				<li><a href="#" class="on">전체</a></li>
				<li class="dep"><a href="#">회원가입</a></li>
				<li><a href="#">상품</a></li>
				<li class="last"><a href="#">주문</a></li>
			</ul>
		</div>

		<!-- FAQ -->
		<div class="faqList">
			<ul>
				<!-- list -->
				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">상품</div>
							<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>
				<!-- //list -->

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">상품</div>
							<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">회원가입</div>
							<div class="title">회원가입을 하면 어떤 혜택이 있나요?</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">회원가입</div>
							<div class="title">회원 탈퇴를 하고 싶습니다</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">회원가입</div>
							<div class="title">비밀번호를 잊어버렸습니다.</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">주문</div>
							<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">주문</div>
							<div class="title">배송조회가 되지 않습니다.</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div></li>

				<li><a href="javascript:;" class="faqbtn">
						<div class="question">
							<div class="blet">Q</div>
							<div class="category">주문</div>
							<div class="title">배송은 평균 얼마나 걸리나요?</div>
						</div>
				</a>

					<div class="faqanswer">
						<div class="faqbox">
							<div class="blet">A</div>
							<div class="text">
								<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여
								답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다.
							</div>
						</div>
					</div>
				</li>
			</ul>
		</div>
			
</body>
<%@ include file="../base/footer.jsp" %>
</html>
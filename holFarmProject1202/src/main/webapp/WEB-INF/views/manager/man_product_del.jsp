<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 삭제</title>
		<script type="text/javascript">
			var result1 = "${result}";
			if(result1==1){
				alert("상품 삭제가 완료되었습니다!");
				location.href="./man_product_list"
			}
		</script>
		
	</head>
	<body>
		<h2>상품 삭제!</h2>
	
	</body>
</html>
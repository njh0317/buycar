<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>menu bar</title>
	<link rel="stylesheet" href="../assets/css/main.css" />
	<style>
		ul {
			background-color: #8fcbaa;
			width: 150px;
			list-style-type: none;
			margin: 10px;
			padding: 0;
		}
		ul li{
			list-style-type : none;
			
		}
		li a {
			display: block;
			color: #000000;
			padding: 10px;
			text-align: center;
			text-decoration: none;

		}
		li a.current {
			background-color: #6fbf92;
			color: white;
		}
		li a:hover:not(.current) {
			background-color: #949494;
			color: white;
		}
	</style>

</head>
<body>
 	<%
        String pageChange;
    %>


	<ul>
		<li><a class = "current" href="?pageChange=../info/myinfomain.jsp">내 정보</a></li>
		<li><a href="?pageChange=changeinfo.jsp">회원정보 수정</a></li>
		<li><a href="?pageChange=showorder.jsp">구매내역 조회</a></li>
		<li><a href="?pageChange=passchange.jsp">비밀번호 변경</a></li>
		<li><a href="?pageChange=withdrawal.jsp">회원 탈퇴</a></li>
	</ul>
	


</body>
</html>
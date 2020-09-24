<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<title>menu bar</title>
	<link rel="stylesheet" href="../assets/css/main.css" />
	<style>

	#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */ 
	background-color: #8fcbaa;
	width: 150px;
	
	list-style-type: none;
	margin: 20px;
	padding:0;
	
	}

	#topMenu ul li {
	list-style-type : none;
	}
	#topMenu li a {
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
	.submenu { /* 하위 메뉴 스타일 설정 */ 
	
	height: 0px; /* 초기 높이는 0px로 설정 */ 
	overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */ 
	transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */ 
	-webkit-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 크롬/사파라ㅣ) */ 
	-moz-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */ 
	-o-transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */ 
	}

	.topmenu:hover .submenu 
	{ /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
	 
	height: 200px; /* 높이를 93px로 설정 */ 
	}


	</style>

</head>
<body>
 	<%
        String pageChange;
    %>

<nav id="topMenu" >
	<ul>
		<li class = "topmenu"><a class = "current" href="?pageChange=manage.jsp">매니저 정보</a></li>
		
		<li class = "topmenu"><a href="?pageChange=showallorder.jsp">거래내역 조회</a></li>
	
		<li class = "topmenu"><a href="?pageChange=showorderedprice.jsp">매출액 확인</a></li>
		
		<li class = "topmenu"><a href="">차량 관리</a>
		
		<ul class="submenu">
			<li><a href="?pageChange=carmanage/addvehicle.jsp">매물 등록</a></li>
			<li><a href="?pageChange=carmanage/changevehicleinfo.jsp">차량 정보 수정</a></li>
			<li><a href="?pageChange=carmanage/nonvisiblevehicle.jsp">비공개 차량 관리</a></li>
			<li><a href="?pageChange=carmanage/visiblecar.jsp">공개 차량 관리</a></li>
		</ul>
		</li>
		<li class = "topmenu"><a href="?pageChange=mngaccount.jsp">매니저 계정 관리</a></li>
	
		<li class = "topmenu"><a href="?pageChange=mngwithdrawal.jsp">매니저 계정 탈퇴</a></li>
	</ul>
	</nav>


</body>
</html>
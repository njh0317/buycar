<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Add car</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		
</head>
<body class ="subpage">
		<header id="header">
				<div class="inner">
					<a href="../main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						<a href="../main.jsp">Home</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
					<header class="align-center">
						<h2><strong>차량 등록</strong></h2>
						<p>Insert Car information</p>
						
						
		
					</header>
					
						<script type="text/javascript">
						function isValidDate() 
						{
							var patter3 = /^\d{4}-\d{2}-\d{2}$/;	
							if(!patter3.test(document.writeform.Model_year.value) )
							{
								alert( "YYYY-MM-DD과 같은 형태" ); 
								form.Model_year.focus(); 
								return false; 
								return false;
							}
						     var year = Number(document.writeform.Model_year.value.substr(0,4));    
						     var month = Number(document.writeform.Model_year.value.substr(5,2));
						     
						     var day = Number(document.writeform.Model_year.value.substr(8,2));
						     
						     var today = new Date(); // 날자 변수 선언
						     
						     var yearNow = today.getFullYear();
						     
						     var adultYear = yearNow;
						     
						     if (year < 1900 || year > adultYear){
						          alert("년도를 확인하세요. \n("+adultYear+"년생 이전 출생자만 등록 가능합니다.)");
						          return false;
						     }
						     if (month < 1 || month > 12) { 
						          alert("달은 1월부터 12월까지 입력 가능합니다.");
						          return false;
						     }
						    if (day < 1 || day > 31) {
						          alert("일은 1일부터 31일까지 입력가능합니다.");
						          return false;
						     }
						     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
						          alert(month+"월은 31일이 존재하지 않습니다.");
						          return false;
						     }
						     if (month == 2) {
						          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
						          if (day>29 || (day==29 && !isleap)) {
						               alert(year + "년 2월은  " + day + "일이 없습니다.");
						               return false;
						          }
						     }
						     return true;
						}
						</script>
					<form name=writeform method = post action = "carmanage/addcar.jsp" onsubmit="return isValidDate(this);">
					
						<hr><br>
						<div style="position: relative; left:250px; background-color: #f0f5f0; border-radius: 10px; width: 600px; height: 530px; padding: 10px 20px">
									<div style = "width : 48%; float:left">차량번호&nbsp;
										
										<input type="text" name="carnum" id = "carnum" required>
									</div>
									
									<div style = "width : 48%; float:right">Model_year
									
										<input type="text" name="Model_year" id = "Model_year" placeholder="yyyy-mm-dd" required>
									</div><br>
									<div style = "width : 48%; float:left">Mileage&nbsp;
										
										<input type="text" name="mileage" id = "mileage" required>
									</div>
									
									<div style = "width : 48%; float:right">price
									
										<input type="text" name="price" id="price" required>
									</div><br>
									
								 	<div style="width:48%; float:left">Color1&nbsp;
								 	<select id="color1" name="color1">
										<option value="Black" selected>Black</option>
										<option value = "White">White</option>
										<option value = "Gray">Gray</option>
										<option value = "Charcoal">Charcoal</option>
										<option value = "Red">Red</option>
										<option value = "Blue">Blue</option>
									</select></div>
									
									<div style="width:48%; float:right">Color2
								 	<select id="color2" name="color2">
								 		<option value = "" selected></option>
										<option value ="Black">Black</option>
										<option value = "White">White</option>
										<option value = "Gray">Gray</option>
										<option value = "Charcoal">Charcoal</option>
										<option value = "Red">Red</option>
										<option value = "Blue">Blue</option>
									</select></div><br>
									
									<div style="width:48%; float:left">Fuel1&nbsp;
								 	<select id="fuel1" name="fuel1">
										<option value = "Gasoline" selected>Gasoline</option>
										<option value = "Disel">Disel</option>
										<option value = "Electric">Electric</option>
										<option value = "LPG">LPG</option>
										<option value = "Fuel Cell">Fuel Cell</option>
									</select></div>
									
									<div style="width:48%; float:right">Fuel2
								 	<select id="fuel2" name="fuel2">
								 		<option value = "" selected></option>
										<option value = "Gasoline">Gasoline</option>
										<option value = "Disel">Disel</option>
										<option value = "Electric">Electric</option>
										<option value = "LPG">LPG</option>
										<option value = "Fuel Cell">Fuel Cell</option>
									</select></div><br>
									
									
									
									<div style="width:48%; float:left">Category&nbsp;
								 	<select id="category" name="category">
										<option value = "light-weight" selected>light-weight</option>
										<option value = "small-size">small-size</option>
										<option value = "midsize">midsize</option>
										<option value = "full-size">full-size</option>
										<option value = "SUV">SUV</option>
									</select></div>
									
									<div style="width:48%; float:right">Transmission Type
								 	<select id="transmission" name="transmission">
										<option value = "Automatic" selected>Automatic</option>
										<option value = "Manual">Manual</option>
										<option value = "Semi-Auto">Semi-Auto</option>
										<option value = "CVT">CVT</option>
									</select></div><br>
									<div style="width:48%; float:left">Engine_displacement&nbsp;
								 	<select id="engine" name="engine">
										<option value = "1000" selected>1000</option>
										<option value = "1500">1500</option>
										<option value = "2000">2000</option>
										<option value = "2500">2500</option>
										<option value = "3000">3000</option>
										<option value = "4500">4500</option>
									</select></div>
									
									<div style="width:48%; float:right">제조사 
								 	<select id="selectmake" name="make" onchange="makeChange()">
								 		<option value="" selected disabled hidden></option>
										<option>Hyundai</option>
										<option>Kia</option>
										<option>Chevrolet(GM DaeWoo)</option>
										<option>Renault Samsung</option>
										<option>Ssangyong</option>
										<option>Benz</option>
										<option>BMW</option>
										<option>Volkswagen</option>
									</select></div><br>
									
									<div style="width:48%; float:left">모델&nbsp;
								 	<select id="selectmodel" name="model" onchange="modelChange()">
									</select></div>
									
									<div style="width:48%; float:right">세부모델
								 	<select id="selectdmodel" name="dmodel">
										
									</select></div><br>
									
									<div style="width:20%; float:right; padding: 10px 20pxs">
										<br><br><br>
									<input type = "submit" value = "등록">
									</div>
							</div><br>
						
				
						
					</form>
						
					</div>
				
			</section>
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../assets/js/searchcar.js"></script>


</body>
</html>
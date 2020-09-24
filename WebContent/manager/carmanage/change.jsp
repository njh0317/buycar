<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Change car</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
		
</head>
<body>

		<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
					<header class="align-center">
						<h2><strong>차량 정보 수정</strong></h2>
						<p>Change Car information</p>
						
						
		
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
						<% 
						String serverIP = (String)session.getAttribute("serverIP");
						   String strSID = (String)session.getAttribute("strSID");
						   String portNum = (String)session.getAttribute("portNum");
						   String user = (String)session.getAttribute("user");
						   String pass = (String)session.getAttribute("passnum");
						   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						 
						   Connection conn = null;
						   PreparedStatement pstmt;
						   
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						   String carnum = request.getParameter("buyvehicle");
							
							String SQL = "SELECT * FROM VEHICLE WHERE CAR_NUMBER = '"+carnum+"'";
						%>
					<form name=writeform method = post action = "changecar.jsp" onsubmit="return isValidDate(this);">
					<INPUT TYPE="hidden" NAME="carnum" value='<% out.print(carnum);%>'>

						<hr><br>
						<%
							
					      	Statement stmt;
					      	int i=0;
					      	ResultSet rs;
					      	stmt = conn.createStatement();
					      	 String Car_Number;
					            String date = null;
					           
					            int mileage = 0;
					            int price = 0;
					            String color1 =null;
					            String color2 = null;
					            String fuel1 =null;
					            String fuel2 =null;
					            String category=null;
					            String transmission=null;
					            int engine=0;
					            String  make=null;
					            String model=null;
					            String detailed=null;
					        out.print("차량 정보 : ");
					        
					        rs = stmt.executeQuery(SQL);
					        
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
							
							out.println("<th>"+"Model_Year"+"</th>");
							
							out.println("<th>mileage</th>");
							out.println("<th>"+"price"+"</th>");
							
							out.println("<th>color1</th>");
							out.println("<th>"+"color2"+"</th>");
							out.println("<tr>");
							
							
							while(rs.next())
					         {    
					            Car_Number = rs.getString(1);
					            date = rs.getString(2);
					            date = date.substring(0, 10);
					            mileage = rs.getInt(3);
					            price = rs.getInt(4);
					            color1 = rs.getString(5);
					            color2 = rs.getString(6);
					            fuel1 = rs.getString(7);
					            fuel2 = rs.getString(8);
					            category = rs.getString(9);
					            transmission = rs.getString(10);
					            engine = rs.getInt(11);
					            make = rs.getString(12);
					            model = rs.getString(13);
					            detailed = rs.getString(14);
					            if(color2 ==null)
					            	color2="";
					            if(fuel2 ==null)
					            	fuel2="";
					            out.println("<tr><td>"+date+"</td><td>"+mileage+"</td><td>"+price+"</td><td>"+color1+"</td><td>"+color2+"</td></tr></table>");
					            out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
								
								out.println("<th>"+"fuel1"+"</th>");
								
								out.println("<th>fuel2</th>");
								out.println("<th>"+"category"+"</th>");
								
								out.println("<th>transmission</th>");
								out.println("<th>"+"engine_type"+"</th>");
								out.println("<tr>");
								out.println("<tr><td>"+fuel1+"</td><td>"+fuel2+"</td><td>"+category+"</td><td>"+transmission+"</td><td>"+engine+"</td></tr></table>");
								out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
								
								out.println("<th>"+"Maker"+"</th>");
								
								out.println("<th>Model</th>");
								out.println("<th>"+"Detailed Model"+"</th>");
								
								out.println("<tr>");
								out.println("<tr><td>"+make+"</td><td>"+model+"</td><td>"+detailed+"</td></tr></table>");
					            
					         }
							try{
								if(stmt!=null)stmt.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){
								System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
							}
							
						%>
						
						<div style="background-color: #f0f5f0; border-radius: 10px; width: 600px; height: 550px; margin:auto; padding: 10px 20px">
									
									
									<div style = "width : 48%; float:left">Model_year
									
										<input type="text" name="Model_year" id = "Model_year" placeholder="yyyy-mm-dd" value = '<%out.print(date);%>' required>
									</div>
									<div style = "width : 48%; float:right">Mileage&nbsp;
										
										<input type="text" name="mileage" id = "mileage" value = '<%out.print(mileage);%>' required>
									</div><br>
									
									<div style = "width : 48%; float:left">price
									
										<input type="text" name="price" id="price" value = '<%out.print(price);%>' required>
									</div>
									<div style="width:48%; float:right">Category&nbsp;
								 	<select id="category" name="category">
										<option value = "light-weight" selected>light-weight</option>
										<option value = "small-size">small-size</option>
										<option value = "midsize">midsize</option>
										<option value = "full-size">full-size</option>
										<option value = "SUV">SUV</option>
									</select></div><br>
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
									
									
									
									<div style="width:48%; float:left">Transmission Type
								 	<select id="transmission" name="transmission">
										<option value = "Automatic" selected>Automatic</option>
										<option value = "Manual">Manual</option>
										<option value = "Semi-Auto">Semi-Auto</option>
										<option value = "CVT">CVT</option>
									</select></div>
									<div style="width:48%; float:right">Engine_displacement&nbsp;
								 	<select id="engine" name="engine">
										<option value = "1000" selected>1000</option>
										<option value = "1500">1500</option>
										<option value = "2000">2000</option>
										<option value = "2500">2500</option>
										<option value = "3000">3000</option>
										<option value = "4500">4500</option>
									</select></div><br>
									
									<div style="width:48%; float:left">제조사 
								 	<select id="selectmake" name="make" onchange="makeChange()">
										<option selected>Hyundai</option>
										<option>Kia</option>
										<option>Chevrolet(GM DaeWoo)</option>
										<option>Renault Samsung</option>
										<option>Ssangyong</option>
										<option>Benz</option>
										<option>BMW</option>
										<option>Volkswagen</option>
									</select></div>
									
									<div style="width:48%; float:right">모델&nbsp;
								 	<select id="selectmodel" name="model" onchange="modelChange()">
									</select></div><br>
									
									<div style="width:48%; float:left">세부모델
								 	<select id="selectdmodel" name="dmodel">
										
									</select></div><br>
									<br><br>
									
							</div>
							
							<div style="width:130px;  padding: 10px 20px; margin:auto" >
									<br>
										<input type = "submit" value = "수정">
									
							</div>
				
						
					</form>
						
					</div>
				
			</section>
			<script src="../../assets/js/jquery.min.js"></script>
			<script src="../..//assets/js/skel.min.js"></script>
			<script src="../../assets/js/util.js"></script>
			<script src="../../assets/js/main.js"></script>
			<script src="../../assets/js/searchcar.js"></script>


</body>
</html>
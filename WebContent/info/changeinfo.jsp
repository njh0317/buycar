<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.LoginManager" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% LoginManager loginManager = LoginManager.getInstance(); %>
<title>MY INFO Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
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
						<h2><strong>정보 수정</strong></h2>
						<p>This is my information</p>
						
						<script type="text/javascript">
						
						function writeCheck() {
							var form = document.writeform; 
							var patter2 = /^\d{3}-\d{3,4}-\d{4}$/;
							var patter3 = /^\d{4}-\d{2}-\d{2}$/;
							if( !document.writeform.myname.value) // form 에 있는 name 값이 없을 때 
							{ 
								alert( "이름을 적어주세요" ); // 경고창 띄움 
								form.myname.focus(); // form 에 있는 name 위치로 이동 
								return false; 
							} 
							if( !document.writeform.Phonenum.value ) 
							{ 
								alert( "전화번호를 적어주세요" ); 
								form.Phonenum.focus(); 
								return false; 
							} 
							if(!patter2.test(document.writeform.Phonenum.value))
							{
								alert( "000-0000-0000과 같은 형태" ); 
								form.Phonenum.focus(); 
								return false; 
							}	
							if(!patter3.test(document.writeform.Date.value) )
							{
								alert( "YYYY-MM-DD과 같은 형태" ); 
								form.Date.focus(); 
								return false; 
							}
							else if(!document.writeform.Date.value)
								return true;
							
							return true;
							//form.submit(); 
							} 
						</script>
						<script type="text/javascript">
						function isValidDate() 
						{
							
							if(!document.writeform.Date.value) 
								return true;
						     var year = Number(document.writeform.Date.value.substr(0,4));    
						     var month = Number(document.writeform.Date.value.substr(5,2));
						     
						     var day = Number(document.writeform.Date.value.substr(8,2));
						     
						     var today = new Date(); // 날자 변수 선언
						     
						     var yearNow = today.getFullYear();
						     
						     var adultYear = yearNow-20;
						     
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
						<script>
						function inputIdChk()
						{
							document.writeform.idDuplication.value="idUnchecked";
						}
						</script>

						<% 
						//*아이디, *비밀번호, *전화번호, *이름, 주소, 성별, 생년월일, 직업
						out.println("<form name=\"writeform\" method=\"post\" action=\"info_ok.jsp\" onsubmit=\"return !!(writeCheck()&isValidDate());\">");
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
						
							String serverIP = (String)session.getAttribute("serverIP");
							   String strSID = (String)session.getAttribute("strSID");
							   String portNum = (String)session.getAttribute("portNum");
							   String user = (String)session.getAttribute("user");
							   String pass = (String)session.getAttribute("passnum");
							   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						  
						   Connection conn = null;
						   PreparedStatement pstmt;
						   ResultSet rs;
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						%>
					</header>
					
						<hr><br>
						
					
						<%
						String SQL = "SELECT * FROM ACCOUNT WHERE ID = ?";
						String loginID = (String)loginManager.getUserID(session.getId());
						try {
					         pstmt = conn.prepareStatement(SQL);
					         pstmt.setString(1, loginID);
					         // rs:result set 에 결과보관
					         rs = pstmt.executeQuery();
					         // 결과가 존재한다면 실행
					         if (rs.next()) {
					            // 패스워드 일치한다면 실행
					            String blank = "    ";
					            String textare = "<td style=\"border: 0px;\"><input type=\"text\" name=\"myname\" size=\"5\" style=\"width:70%; height:70%; border: 0; \" value = '";
					            String textare2 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Phonenum\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare3 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Addr\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare4 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"text\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare5 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Occupation\" size=\"5\" style=\"width:50%; height:70%; border: 0;\" value = '";
					            String textare6 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Date\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare7 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"date2\" size=\"5\" style=\"width:33%; height:70%; border: 0;\" value = '";
					            String textare8 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"date3\" size=\"5\" style=\"width:33%; height:70%; border: 0;\" value = '";
					            
					            String text = "<td style=\"text-align:left\"><input type=\"radio\" name=\"gender\" value=\"0\" ondblclick=\"this.checked=false\">남자 &emsp; &ensp; <input type=\"radio\" name=\"gender\" value=\"1\" ondblclick=\"this.checked=false\">여자</td>";
					            
					            
					            String id = rs.getString(1);
					            String password = rs.getString(2);
					            String phonenum = rs.getString(3);
					            String gender = rs.getString(4);
					            String occupation = rs.getString(5);
					            String date = rs.getString(6);
					            String name = rs.getString(7);
					            String addr = rs.getString(8);
					            String num = rs.getString(9);
					            if(  gender == null) gender = "";	      
					    		
					            if(  occupation == null) occupation = "";	      
					            if(date != null)
					            {
					               date = date.substring(0, 10);
					            }
					            if(  date == null) date = "";
					            if(  addr == null) addr = "";
					            

					            
					            int count = rs.getInt(9);

								
								out.println("<tr><th>*이름</th> "+textare+name+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>*연락처</th>"+textare2+phonenum+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>주소</th>"+textare3+addr+"'></td><th>"+blank+"</th></tr>");
					     
					            out.println("<tr><th>성별</th>"+text+"<th>"+blank+"</th></tr>");
					            out.println("<tr><th>직업</th>"+textare5+occupation+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>생년월일</th>"+textare6+date+"'></td><th>"+blank+"</th></tr>");
					            
					            
					            out.println("</table>");
					            
					            out.println("<input type=\"submit\" value=\"변경\">");
					            out.println("</form>");
					            try{
									if(pstmt!=null)pstmt.close();
									if(conn!=null)conn.close();
								}catch(Exception ex){
									System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
								}

					         }
					      } catch (Exception e) {
					         e.printStackTrace();
					      }
							
						%>
						
					</div>
				
			</section>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>MY INFO Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<% LoginManager loginManager = LoginManager.getInstance(); %>
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
						<h2><strong>내 정보</strong></h2>
						<p>This is my information</p>
						<% 
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
						String serverIP = (String)session.getAttribute("serverIP");
						   String strSID = (String)session.getAttribute("strSID");
						   String portNum = (String)session.getAttribute("portNum");
						   String user = (String)session.getAttribute("user");
						   String pass = (String)session.getAttribute("passnum");
						   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						   System.out.println(url);
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
					            out.println("<tr><th>이름</th><th>"+name+"</th></tr>");
					            out.println("<tr><th>아이디</th><th>"+id+"</th></tr>");
					            out.println("<tr><th>연락처</th><th>"+phonenum+"</th></tr>");
					            out.println("<tr><th>주소</th><th>"+addr+"</th></tr>");
					            out.println("<tr><th>성별</th><th>"+gender+"</th></tr>");
					            out.println("<tr><th>직업</th><th>"+occupation+"</th></tr>");
					            out.println("<tr><th>생년월일</th><th>"+date+"</th></tr>");
		
					            out.println("<tr><th>거래횟수</th><th>"+num+"</th></tr>");
					            
					            out.println("</table>");

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
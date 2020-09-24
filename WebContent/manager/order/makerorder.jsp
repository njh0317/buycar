<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<html>
<head>
  
    <head>
		<title>Order</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>
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
						<h2><strong>Order Results</strong></h2>
						<p>월별 매출</p>
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
						%>
					</header>
					<div>
						
						<hr><br>
					
						<%
							
						 	String SQL = "select car_make, sum(price) from vehicle where car_number in (select car_num from buy) group by car_make";
					      
					      	Statement stmt;
					      	ResultSet rs = null;
					      	stmt = conn.createStatement();
					       
					        out.print("제조사별 매출액 : ");
					        
					        rs = stmt.executeQuery(SQL);
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
							
							out.println("<th>Make</th><th>매출액</th>");
						
							while(rs.next()){
							   out.println("<tr>");
							   out.println("<td>"+rs.getString(1)+"</td>");
							   out.println("<td>"+rs.getInt(2)+"원</td>");
				
							  
							   out.println("</tr>");      
							}
							out.println("</table>");
						%>
					</div>
				</div>
			</section>
	</body>
</html>





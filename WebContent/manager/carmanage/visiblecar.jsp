<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>차량 공개 처리</title>
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
						<h2><strong>차량 공개 처리</strong></h2>
						<p>Visible Vehicle</p>
						<script type="text/javascript">
						function check() {
							
							if(confirm("공개 처리를 하시겠습니까?"))
							{
					              return true;
					              
					        }else{
					        	return false
					        }			  
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
						%>
					
					</header>
					
						<hr><br>
						<form name="fr" method = post action = "carmanage/visible.jsp" onsubmit="return check();">
						<%
							
							String SQL = "SELECT count(*) FROM VEHICLE WHERE VISIBLE = 'false'";
							String SQL2 = "SELECT Car_Number FROM VEHICLE WHERE VISIBLE = 'false' order by car_number";
					      	Statement stmt;
					      	ResultSet rs;
					      	stmt = conn.createStatement();
					        rs = stmt.executeQuery(SQL);
					        out.print("비공개 처리된 차량 목록 : ");
					        while (rs.next()) {
					            out.println(rs.getInt(1)+" 개" );
					        }
					        rs = null;
					        rs = stmt.executeQuery(SQL2);
					        
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
							
							out.println("<th>"+"CHECK"+"</th>");
							
							out.println("<th>Car_num</th>");
						
							while(rs.next()){
							   out.println("<tr>");
							   String car = rs.getString(1);
							   out.println("<td id =\"ordercheck\"><input type= \"radio\" name=\"buyvehicle\" value=\""+car+"\" style=\"padding: 0 0 0 0;\"></td>");
							   out.println("<td>"+car+"</td>");
							  
							   out.println("</tr>");      
							}
							out.println("</table>");
							
								try{
									if(stmt!=null)stmt.close();
									if(conn!=null)conn.close();
								}catch(Exception ex){
									System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
								}
							

						%>
 
						<input type="submit" value="확인">
						</form>
						
					</div>
				
			</section>


</body>
</html>
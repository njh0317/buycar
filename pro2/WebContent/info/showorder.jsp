<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>
<%@ page import="pro2.LoginManager" %>
<html>
<head>
    <title>주문 내역</title>
    <head>
		<title>Order Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>
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
					<script type="text/javascript">
						window.onload=function(){
							
							var btn = document.getElementById('btn');
							
							//버튼 클릭시 함수 호출
							btn.onclick=function(){
								var xform = document.getElementById('xform');
								
								if(xform.check.length==undefined)
									if(xform.check.checked==true)
									{
										url = "CheckForm.jsp?check="+xform.check.value;
										open(url, "confirm","toolbar=no, location = no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height = 200");
									}
								for(var i=0; i<xform.check.length;i++){
								
									if(xform.check[i].checked == true){
								   	
								   		url = "CheckForm.jsp?check="+xform.check[i].value;
										open(url, "confirm","toolbar=no, location = no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height = 200");
										
									}
								}	
							};
						};
					</script>


					<header class="align-center">
						<h2><strong>Order Results</strong></h2>
						<p>This is result of your search</p>
						<% 
						String serverIP = (String)session.getAttribute("serverIP");
						   String strSID = (String)session.getAttribute("strSID");
						   String portNum = (String)session.getAttribute("portNum");
						   String user = (String)session.getAttribute("user");
						   String pass = (String)session.getAttribute("passnum");
						   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						 
						   Connection conn = null;
						 
						   
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						%>
					</header>
					<div>
						
						<hr><br>
						<form id="xform">
					
						<%
							
							String SQL3 = "SELECT count(*) FROM ACCOUNT, BUY WHERE ID = ? AND ID = Acc_ID";
					       	String SQL2 = "SELECT * FROM VEHICLE WHERE Car_Number IN (SELECT Car_Num FROM ACCOUNT, BUY WHERE ID = ? AND ID = Acc_ID)";
					       	String SQL = "SELECT rownum, Order_Num, Car_Num FROM ACCOUNT, BUY WHERE ID = ? AND ID = Acc_ID";
					       	PreparedStatement pstmt,pstmt2,pstmt3;
					        ResultSet rs, rs2, rs3;
					        String id= (String)loginManager.getUserID(session.getId());
					        String realnow = (String)session.getAttribute("pass");
					        String userPassword;
					      
					         int check = 0;
					        
					           pstmt = conn.prepareStatement(SQL);
					           pstmt2 = conn.prepareStatement(SQL2);
					           pstmt3 = conn.prepareStatement(SQL3);
					           pstmt.setString(1, id);
					           pstmt2.setString(1, id);
					           pstmt3.setString(1,id);
					           rs3 = pstmt3.executeQuery();

					           
					           out.println("거래내역 : ");
					           if(rs3.next())
					           {
					        	   out.println(rs3.getInt(1)+"건");
					           }
					           rs = pstmt.executeQuery();
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
							
							out.println("<th>"+"CHECK"+"</th>");
							
							out.println("<th>num</th><th>Order_num</th><th>Car_num</th>");
						
							while(rs.next()){
							   out.println("<tr>");
							   String carnum = rs.getString(2);
							   String carname = rs.getString(3);
							   out.println("<td id =\"check\"><input type= \"radio\" name=\"check\" value = \""+carname+"\"style=\"padding: 0 0 0 0;\"></td>");
							   out.println("<td>"+rs.getInt(1)+"</td>");
							   out.println("<td>"+carnum+"</td>");
							   out.println("<td>"+carname+"</td>");
							   out.println("</tr>");      
							}
							out.println("</table>");
							try{
								if(pstmt!=null)pstmt.close();
								if(pstmt2!=null)pstmt2.close();
								if(pstmt3!=null)pstmt3.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){
								System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
							}
							
						%>
   
					<input type="button" value="확인" id="btn">
					</form>

					</div>
				</div>
			</section>
	</body>
</html>


  





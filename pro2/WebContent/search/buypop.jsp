<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import = "java.util.Calendar" %>
<%@ page import = "java.util.Date" %> 
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE html>
<html>
<% LoginManager loginManager = LoginManager.getInstance(); %>
	<head>
	<meta charset="EUC-KR">
	</head>
	<body>
		<% 
		String carid = request.getParameter("carid");
		String id= (String)loginManager.getUserID(session.getId());
		System.out.println(carid+id);
		 MemberDAO dao = MemberDAO.getInstance();
		 int check = dao.Buycar(id, carid);
		 if(check == 1){
			    %>
			    <br><br>
			    <font size="5" color="gray">구매완료.</font>
			    <br><br>
			    <input type="button" value="메인으로" onclick="location='../main.jsp'"/>
		    
		    <%   
	        
		        }else{
		    %>
		        <script>
		            alert("구매실패 ");
		            history.go(-1);
		        </script>
		    <%
		        } 
		
			
		%>
	</body>
</html>
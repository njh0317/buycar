<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<html>
<head>
    <title>회원 가입</title>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

		String name = request.getParameter("myname");
	    String phone = request.getParameter("Phonenum");
	    String address = request.getParameter("Addr");
	    String occupation = request.getParameter("Occupation");
	    String date = request.getParameter("Date");
        String id= request.getParameter("id"); 
        String realnow = request.getParameter("pass");
        String gender = request.getParameter("gender");
       System.out.println(gender);
      
        //updateMember(String id, String pw, String Name, String Phone_Number, String Gender, String Occupation,
        //		String Address, String Birth_Date)
        MemberDAO dao = MemberDAO.getInstance();
        
        
        	int check = dao.signupMember(id, realnow, name, phone, occupation, address, date, gender);
        	if(check == 1){
	    %>
		    <br><br>
		    <font size="5" color="gray">가입완료.</font>
		    <br><br>
		    <input type="button" value="메인으로" onclick="javascript:window.location='login.jsp'"/>
	    
	    <%    
 
	        }else{
	    %>
	        <script>
	            alert("가입실패 ");
	            history.go(-1);
	        </script>
	    <%
	        } 
        
        
	    %>


    
</body>
</html>





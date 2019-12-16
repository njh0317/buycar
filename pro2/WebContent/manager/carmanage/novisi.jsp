<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>
<%@ page import="pro2.MemberCar" %>

<html>
<head>
    <title>비공개 차량</title>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

		String carnum = request.getParameter("nonvisible");
	
         MemberCar dao = MemberCar.getInstance();
        
        
        	int check = dao.nonvisible(carnum);
        	if(check == 1){
	    %>
		    <br><br>
		    <font size="5" color="gray">처리완료.</font>
		    <br><br>
		    <input type="button" value="확인" onclick="javascript:window.location='../managerinfo.jsp'"/>
	    
	    <%    
 
	        }else{
	    %>
	        <script>
	            alert("해당 번호는 존재하지 않습니다.");
	            history.go(-1);
	        </script>
	    <%
	        } 
        
        
	    %>

        

    
</body>
</html>





<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%
 
 	session.removeAttribute("pass");
 	session.removeAttribute("mngnum");
 	session.removeAttribute("login"); 
 	//session.invalidate();
 	out.println("<script>alert('�α׾ƿ��Ǿ����ϴ�'); history.back();</script>");
 	response.sendRedirect("../main.jsp");
 %>



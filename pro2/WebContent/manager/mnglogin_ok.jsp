<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.LoginManager" %>
<% LoginManager loginManager = LoginManager.getInstance(); %>

	<% request.setCharacterEncoding("utf-8"); %>
	<%
	String id = request.getParameter("mngid");
	String pass = request.getParameter("mngpass");
	String mng = request.getParameter("mngnumber");
	int mngnum = Integer.parseInt(mng);
	
	System.out.println(mngnum);
	MemberDAO dao = MemberDAO.getInstance();
    int check = dao.mngCheck(id, pass, mngnum);
    System.out.println(check);

	if(check==1){
		if(!loginManager.isUsing(id))
		{
			  loginManager.setSession(session, id);
			  session.setAttribute("pass",pass);
			session.setAttribute("mngnum",mng);
			  response.sendRedirect("manager.jsp");
			  
		}
		else
		{
			out.println("<script>alert('이미 로그인중인 아이디 입니다.'); history.back();</script>");
		}
		
	}else if(check==0){
		out.println("<script>alert('로그인 실패(비밀번호 불일치).'); history.back();</script>");
	}else if(check==2){
		out.println("<script>alert('로그인 실패(해당 아이디가 존재하지 않습니다).'); history.back();</script>");
	}
	else if(check==3){
		out.println("<script>alert('로그인 실패(매니저 번호가 일치하지 않습니다).'); history.back();</script>");
	}
	else if(check==-1){
		out.println("<script>alert('로그인 실패(매니저 번호가 존재하지 않습니다).'); history.back();</script>");
	}
	
%>



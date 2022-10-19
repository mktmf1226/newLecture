<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 template.jsp-->
<h3>* 아이디 찾기 결과 *</h3>
<%
	String mname=request.getParameter("mname").trim();
	String email=request.getParameter("email").trim();
	dto.setMname(mname);
	dto.setEmail(email);
	
	String id=dao.findIDProc(dto);
	if(id==null){//없으면
		out.println("<p style='color:red;'>해당 정보의 아이디가 존재하지 않습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</p>");
	}else{
		out.println("<p>당신의 아이디는 <strong>" + id + "</strong> 입니다</p>");
		out.println("<p>입력하신 이메일주소 <strong>" + email + "</strong> 에게 임시 비밀번호를 전송할까요?</p>");
		out.println("<a href='findPW.jsp' style='color:red;'>임시 비밀번호 전송</a>");
	}//if end
%>
	<hr>
    <a href="loginForm.jsp">로그인 화면으로</a>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
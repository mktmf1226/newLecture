<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberWithdrawProc.jsp-->
<h3>* 회원탈퇴 *</h3>
<%
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd").trim();
	
	dto.setId(id);
	dto.setPasswd(passwd);
	
	int cnt=dao.withdrawProc(dto);
	if(cnt==0) {//실패시
		out.println("<p>비밀번호가 일치하지 않습니다!!</p>");
		out.println("<p><a href='javascript:history.back()'>[다시시도]</a></p>");//전단계로 이동
	}else {//성공시
		out.println("<script>");
		out.println("	alert('회원탈퇴 완료되었습니다');");
		out.println("	location.href='logout.jsp';"); //로그아웃페이지로 이동
		out.println("</script>");
	}//if end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
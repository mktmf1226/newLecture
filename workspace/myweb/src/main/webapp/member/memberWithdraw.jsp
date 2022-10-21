<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberWithdraw.jsp-->
<!-- 아이디(id)와 비밀번호(passwd)가 일치하면 회원탈퇴 -->
<h2>* 회/원/탈/퇴 *</h2>
<%
	//아이디저장 쿠키 확인	--------------------------------------
	Cookie[] cookies=request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
	String c_id="";
	if(cookies!=null){ //쿠키가 존재한다면
		for(int i=0; i<cookies.length; i++){ //모든 쿠키값을 검색
			Cookie cookie=cookies[i]; //쿠키 하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){ //쿠키이름이 c_id인가요?
				c_id=cookie.getValue(); //출력될 값
			}//if end
		}//for end
	}//if end
	//--------------------------------------------------------
	String id=c_id;
%>
<div class="container">
	<form method="post" action="memberWithdrawProc.jsp" onsubmit="return withPWCheck()"><!-- myscript.js -->
		<input type="hidden" name="id" value="<%=id%>">
		<table class="table">
		<tr>
			<th class="success">비밀번호 확인</th>
			<td><input type="password" name="passwd" id="passwd" required></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="회원탈퇴" class="btn btn-danger">
			</td>
		</tr>
		</table>
	</form>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
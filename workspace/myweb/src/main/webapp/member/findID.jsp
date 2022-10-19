<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 본문시작 findID.jsp-->
<h3>* 아이디 찾기 *</h3>
<div class="container-fluid">
	<form name="findIDfrm" id="findIDfrm" action="findIDProc.jsp" onsubmit="return findIDCheck()"><!-- myscript.js -->
		<table class="table">
		<tr>
		    <td>
			   <input type="text" name="mname" id="mname" placeholder="이름" maxlength="20" required>
		    </td>
		</tr>
		<tr>
		   <td>
		      <input type="text" name="email" id="email" placeholder="이메일" maxlength="50" required>
		   </td>
		</tr>
		<tr>
		    <td>
		        <input type="submit" value="아이디 찾기"  class="btn btn-primary"/>
		        <input type="reset"  value="취소"      class="btn btn-primary"/>
		    </td>
		</tr>
		</table>
	</form>
</div>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
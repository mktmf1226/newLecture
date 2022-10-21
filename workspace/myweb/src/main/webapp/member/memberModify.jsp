<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp" %>
<!-- 본문시작 memberModify.jsp-->
<h3>* 회원정보 수정 *</h3>
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
	
	dto=dao.read(c_id);
	if(dto==null){
		out.println("해당 글 없음!!");
	}else{
%>
		<form name="memfrm" id="memfrm" method="post" action="memberModifyProc.jsp" onsubmit="return memberCheck()"><!-- myscript.js -->
		<span style="color:red; font-weight: bold">* 필수입력</span>
		<br>
		<table class="table">
		<tr>
		    <th>아이디</th>
		    <td style="text-align: left">
		      <input type="text" name="id" id="id" value="<%=c_id%>" size="15" style="background-color:lightgray;" readonly>
		    </td>
		</tr>
		<tr>
		    <th>*비밀번호</th>
		    <td style="text-align: left"><input type="password" name="passwd" id="passwd" size="15" required></td>
		</tr>
		<tr>
		    <th>*비밀번호 확인</th>
		    <td style="text-align: left"><input type="password" name="repasswd" id="repasswd" size="15" required></td>
		</tr>
		<tr>
		    <th>이름</th>
		    <td style="text-align: left"><input type="text" name="mname" id="mname" value="<%=dto.getMname()%>" size="15" maxlength="20" style="background-color:lightgray;" readonly></td>
		</tr>
		<tr>
		    <th>이메일</th>
		    <td style="text-align: left">
		      <input type="email" name="email" id="email" value="<%=dto.getEmail()%>" size="30" style="background-color:lightgray;" readonly>
		    </td>
		</tr>
		<tr>
		    <th>전화번호</th>
		    <td style="text-align: left"><input type="text" name="tel" id="tel" value="<%=dto.getTel()%>" size="15"></td>
		</tr>
		<tr>
		    <th>우편번호</th>
		    <td style="text-align: left">
		      <input type="text" name="zipcode" id="zipcode" value="<%=dto.getZipcode()%>" size="7"  readonly>
		      <input type="button" value="주소찾기" onclick="DaumPostcode()">    
		    </td>
		</tr>
		<tr>  
		  <th>주소</th>
		  <td style="text-align: left"><input type="text" name="address1" id="address1" value="<%=dto.getAddress1()%>" size="45" readonly></td>
		</tr>
		<tr>  
		  <th>나머지주소</th>
		  <td style="text-align: left"><input type="text" name="address2" id="address2" value="<%=dto.getAddress1()%>" size="45"></td>
		</tr>
		<tr>  
		  <th>직업</th>
		  <td style="text-align: left">
				<% String job=dto.getJob(); %>
		        <select name="job"  id="job">
		          <option value="0">선택하세요.</option>
		          <option value="A01" <%if (job.equals("A01")) {out.print("selected");}%>>회사원</option>
		          <option value="A02" <%if (job.equals("A02")) {out.print("selected");}%>>IT관련직</option>
		          <option value="A03" <%if (job.equals("A03")) {out.print("selected");}%>>학생</option>
		          <option value="A04" <%if (job.equals("A04")) {out.print("selected");}%>>주부</option>
		          <option value="A05" <%if (job.equals("A05")) {out.print("selected");}%>>기타</option>
		        </select>
		  </td>
		</tr>
		<tr>
		    <td colspan="2">
		        <input type="submit" value="회원정보수정"  class="btn btn-primary"/>
		        <input type="reset"  value="취소"      class="btn btn-primary"/>
		    </td>
		</tr>
		</table>
		
		<!-- ----- DAUM 우편번호 API 시작 ----- -->
		<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:fixed; left:120px; top:200px;">
		  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
		</div>
		
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script>
		    // 우편번호 찾기 화면을 넣을 element
		    var element_wrap = document.getElementById('wrap');
		
		    function foldDaumPostcode() {
		        // iframe을 넣은 element를 안보이게 한다.
		        element_wrap.style.display = 'none';
		    }
		
		    function DaumPostcode() {
		        // 현재 scroll 위치를 저장해놓는다.
		        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var fullAddr = data.address; // 최종 주소 변수
		                var extraAddr = ''; // 조합형 주소 변수
		
		                // 기본 주소가 도로명 타입일때 조합한다.
		                if(data.addressType === 'R'){
		                    //법정동명이 있을 경우 추가한다.
		                    if(data.bname !== ''){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있을 경우 추가한다.
		                    if(data.buildingName !== ''){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
		                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
		                document.getElementById('address1').value = fullAddr;
		
		                // iframe을 넣은 element를 안보이게 한다.
		                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
		                element_wrap.style.display = 'none';
		
		                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
		                document.body.scrollTop = currentScroll;
		                
		                $('#address2').focus();
		            },
		            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
		            onresize : function(size) {
		                element_wrap.style.height = size.height+'px';
		            },
		            width : '100%',
		            height : '100%'
		        }).embed(element_wrap);
		
		        // iframe을 넣은 element를 보이게 한다.
		        element_wrap.style.display = 'block';
		    }
		</script>
		<!-- ----- DAUM 우편번호 API 종료----- -->
		
		</form>
<%
	}//if end
%>
<!-- 본문끝 -->
<%@ include file="../footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>index.jsp</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <!-- 사용자 정의 스타일과 자바스크립트 -->
  <!-- 주의사항 : CSS와 JS는 각 웹브라우저에서 쿠키삭제하고 확인할것 -->
  <!-- layout.css import -->
  <link rel="stylesheet" href="./css/layout.css">
</head>
<body onload="showtimeclock()">

<!-- 메인 카테고리 시작 -->
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">HOME</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./bbs/bbsList.jsp">게시판</a></li>
        <li><a href="./notice/noticeList.jsp">공지사항</a></li>
        <li><a href="./member/loginForm.jsp">로그인</a></li>
        <li><a href="./pds/pdsList.jsp">포토갤러리</a></li>
        <li><a href="./mail/mailForm.jsp">메일보내기</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- First Container 시작 -->
<div class="container-fluid bg-1 text-center">
  <img src="./images/orange.jpg" class="img-responsive margin" style="display:inline; border-radius: 15%;" alt="orange" width="50%">
</div><!-- First Container 끝 -->


<!-- Contents 시작 -->
<div class="container-fluid bg-2 text-center">
  <div class="row">
    <div class="col-xs-12">
    	<!-- 본문시작 -->
    		
    		<script>
    		
	        function showtimeclock(){
	            const d=new Date();                     //const 상수화. 값을 못바꾼다
	            let today="";
	            today += d.getFullYear() + ".";         //2022.
	            if(d.getMonth()+1<10)today += "0";
	            today += (d.getMonth()+1)+".";          //2022.08.
	            if(d.getDate()<10)today += "0";
	            today += d.getDate();                   //2022.08.10
	            switch(d.getDay()){
	                case 0: today+=" (일) "; break;
	                case 1: today+=" (월) "; break;
	                case 2: today+=" (화) "; break;
	                case 3: today+=" (수) "; break;
	                case 4: today+=" (목) "; break;
	                case 5: today+=" (금) "; break;
	                case 6: today+=" (토) "; break;
	            }                                       //2022.08.10 (수)         
	            if(d.getHours()<12){today += "am "}else{today += "pm "};                                //2022.08.10 (수) pm 
	            if(d.getHours()<13){today += d.getHours()+ ":"}else{today += (d.getHours()-12)+ ":"};   //2022.08.10 (수) pm 4:
	            if(d.getMinutes()<10)today += "0";      
	            today += d.getMinutes()+ ":";           //2022.08.10 (수) pm 4:17:
	            if(d.getSeconds()<10)today += "0";
	            today += d.getSeconds();                //2022.08.10 (수) pm 4:17:20
	
	            document.getElementById("digitclock").innerText=today;
	            timer=setTimeout(showtimeclock, 1000);             //1초 후에 showtimeclock 함수를 호출
	        }//showtimeclock() end
	
	        let timer; //전역변수	        
	
	        function killtimeclock(){
	            clearTimeout(timer);    //시간해제
	        }//killtimeclock() end
	    </script>
	    
        <h3>현재 시간은</h3>
        <div id="digitclock"></div>
        

    	<!-- 본문끝 -->
    </div><!--  col 끝 -->
  </div><!-- row 끝 -->
</div><!-- Contents 끝 -->

<!-- Footer -->
<footer class="container-fluid bg-3 text-center">
  Copyright &copy; 2022 MYWEB
</footer>

</body>
</html>
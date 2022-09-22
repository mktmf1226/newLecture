--sungjuk테이블 행 추가

insert into sungjuk(sno, uname, kor, eng, mat, addr, wdate)
values (sungjuk_seq.nextval, '손흥민', 99, 98, 97, 'Seoul', sysdate)

--오라클 콘솔창 예쁘게 출력하기
set linesize 1000;
col uname for a10; --col 칼럼명 for 20자
col addr  for a10; --col 칼럼명 for 20자


select *
from sungjuk
order by sno desc;


--문제) 주소가 서울인 행들의 국영수 평균값을 구하시오
--     (단, 소수점은 반올림해서 둘째자리값까지 표현)

1)주소가 서울인 행 조회하기
select addr, uname, kor, eng, mat
from sungjuk
where addr='Seoul';

2)주소가 서울인 행을 대상으로 국영수 평균구하기
select avg(kor), avg(eng), avg(eng)
from sungjuk
where addr='Seoul';

3)주소가 서울인 행을 대상으로 국영수 평균구하고 반올림해서 소수점 둘째 자리까지 표현
select round(avg(kor),2), round(avg(eng),2), round(avg(mat),2)
from sungjuk
where addr='Seoul';

4)주소가 서울인 행을 대상으로 국영수 평균구하고 반올림해서 소수점 둘째 자리까지 표현하고, 컬럼명 변경하기
select round(avg(kor),2) as avg_kor
	 , round(avg(eng),2) as avg_eng
	 , round(avg(mat),2) as avg_mat
from sungjuk
where addr='Seoul';



--문제) 이름에 '나' 문자 있는 행을 조회
select *
from sungjuk
where uname like '%나%';








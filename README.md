# 🏃‍♂ Aritsta 🏃‍♀

## Artista란 무엇일까?
- 독일어로 예술, 예술가를 의미
- 세련된 전시회 소개 사이트
- 작가들의 작품과 연혁을 소개 시켜주고 작품 판매까지 연결
- 자금이 부족해서 전시회를 갖지 못하는 작가들을 위한 펀딩 시스템
- 결과적으로 사람들에게 예술을 알리고 무명의 작가들에게 더 많은 기회를 제공

<br>

## 만들게 된 배경
- 한국의 예술시장의 규모가 급격하게 높아짐
- 미술품에 대한 펀드 및 투자 역시 급격하게 증가
- 젊은 작가들은 전시 비용이 없어 이름을 알릴 기회가 부족함
- 이처럼 예술에 대한 사람들의 관심이 높아지지만 관련 플랫폼 및 환경의 발전은 따라가지 못함
- 이러한 문제점들을 해결하기 위해서 프로젝트를 진행하게 


<br>

<img src="images/1.PNG" width="200" height="500"/>&ensp;&ensp;&ensp;&ensp;&ensp;<img src="images/2.PNG" width="200" height="500"/>
&ensp;&ensp;&ensp;&ensp;&ensp;<img src="images/3.PNG" width="300" height="500"/>
<br>

# Demo
[![RunningMate Demo](images/image102.PNG)](https://www.youtube.com/watch?v=7uexY16tpgA&t=225s)

<br>

# 프로젝트 일정

<img src="images/image103.PNG" width="800" height="500"/>

<br>

# 기능 구조

<details><summary> <b>다이어그램</b> </summary>
<br>
  
![test](images/diagram.PNG)
  
<br>

</details>

<br>

### 메이트

- 메이트 전체 보기
- 메이트 검색
- 메이트 지도로 검색

<br>

### 오늘의 러닝
- 오늘의 러닝 인증
- 오늘의 러닝 자세히 보기

<br>

### 나처럼 달려
- 나처럼 달려 글 등록
- 나처럼 달려 CRUD
- 검색

<br>

### 자유게시판
- 자유게시판 CRUD
- 댓글 및 좋아요

<br>

### 사용자 
- 마이페이지 (유저)
- 내 활동 및 이력 관리 (유저)
- 탈퇴하기 (유저)
- 회원 리스트 (관리자)
- 신고 리스트 (관리자)
- 회원가입

<br>
<br>


# 클래스 구조

<details><summary> <b>메인페이지</b> </summary>

<img src="images/Main.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>멤버</b> </summary>

<img src="images/Member.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>자유게시판</b> </summary>

<img src="images/FBboard.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>오늘의러닝</b> </summary>

<img src="images/Today.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>메이트구하기</b> </summary>

<img src="images/Mate.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>공통기능</b> </summary>

<img src="images/Sub.PNG" width="100%" height="100%"/>

</details>
<br>

<details><summary> <b>코스공유</b> </summary>

<img src="images/Route.PNG" width="100%" height="100%"/>

</details>
<br>

<br>

# 데이터베이스

![test](images/Picture1.png)

<br>
<br>

# 팀원 및 

<details><summary> <b>채효주(PL)</b> </summary>

* 로그인, 회원가입 CRUD 구현
* 마이페이지 JSP 디자인 설계 및 구현
* 내가 쓴 글 보기
* 회원목록 조회 / 회원 강제 탈퇴
* 신고목록 조회 및 해당 게시물 삭제

</details>
<br>

<details><summary> <b>김상원</b> </summary>

* 메인페이지 JSP 디자인 설계 및 구현
* 최고의 러너 구현(오늘의 러닝) / 번개모임 미리보기
* 자유게시판 CRUD 페이징리스트 구현
* CKEditor5 으로 게시판 구현
* 게시글 검색 기능( 제목, 작성자 , 내용) 
* 댓글 front 구성 설계 및 구현

</details>
<br>

<details><summary> <b>김민정</b> </summary>

* 오늘의 러닝 JSP 구성 설계 및 구현
* 오늘의 러닝 CRUD 페이징 구현
* 게시물 썸네일 기능 구현
* CKEditor5으로 게시물 구현
* 게시물 검색 기능 (제목, 작성자, 내용)

</details>
<br>

<details><summary> <b>홍성호</b> </summary>

* 러닝메이트 구하기 JSP 구성 설계 및 구현
* 번개, 소모임 게시물 CRUD
* 번개 참여 기능, 참여자 리스트 기능
* 게시물 검색 기능(게시물 종류, 제목 등) 
* Kakao map api 사용 : 현재 위치 정보, 지도로 보기 등 구현
  
</details>
<br>

<details><summary> <b>조예선</b> </summary> 

* “나처럼 달려” JSP 구성 설계 및 구현
* “나처럼 달려” 게시물 CRUD 페이징 구현
* CKEditor5 으로 게시물 구현
* Mapbox api 사용하여 코스 그리기
* 전체 댓글 기능 CRUD
* 전체 좋아요, 신고 DB 설계 및 구현

</details>
<br>
<br>

# 기술스택

<details><summary> <b>Back-end</b> </summary>

* JAVA SE-11
* Spring Boot
* Spring MVC
* Tomcat

</details>
<br>

<details><summary> <b>Front-end</b> </summary>

* HTML5
* CSS
* JavaScript
* jQuery
* BootStrap5

</details>
<br>

<details><summary> <b>DBMS</b> </summary>

* MySQL

</details>
<br>

<details><summary> <b>DevOps</b> </summary>

* Git/GitHub
* Naver Works
* oven.app
* erdcloud
* googleSheet

</details>
<br>

<details><summary> <b>API & Library</b> </summary>

* API Docs - mapbox
* Kakao API - KakaoMap
* Ck Editor  
  
</details>

러닝에 대한 여러가지  보를 공유하고
러닝메이트를 구하는 러닝 커뮤니티 사이트


멀티캠퍼스 풀스택 세미프로젝트 

# 사까(Car) 파까(Car)_2019

## Description
>

    2019년 2학기 경북대학교 데이터베이스 수업에서 진행한 프로젝트입니다.
    
    사용자에게 중고차 거래를 가능하게 하는 웹입니다.
    
    차량 추천 서비스도 제공하고 있습니다.
    
## Role

+ 나지혜
  + [sign-in/sign-up] menu
  + [member/manager profile] menu
  + Database construction
  
  
+ 장지현
  + webpage design
  + [search/buy vehicle] menu
  + Database construction
  
  
## Description

+ [메인화면]


    + 검색(Search)과 로그인을 할 수 있다.
    
    + 회원가입, 혹은 매니저 계정으로 로그인을 위해서는 오른쪽 상단의 Sign up/Manager 버튼을 클릭
    
    + 첫 메인 화면 하단에는 차량 추천 기능이 탑재
    
+ [회원 가입]

    + 아이디 등록을 위해 중복 확인을 누르게 되면 사용 가능 여부를 알려줌
    
    + 중복 확인 후 사용하기를 눌러야 가입 가능
    
+ [로그인]

    + 회원가입 된 아이디, 비밀번호로 회원가입 가능
    
    + 아이디 혹은 비밀번호 불일치 시 로그인 불가
    
    + 현재 다른 창에서 로그인 중인 아이디로 다시 로그인 시도 불가
    
+ [내 정보]

    + 로그인 후 메인 화면에서 내 정보 버튼을 클릭하게 되면 내 정보 관리 창으로 넘어가게 됨
    
    + 회원가입 시 등록한 정보를 볼 수 있음
    
    + 정보 수정 가능
    
    + 구매내역 조회 클릭시 구매한 차량정보 확인 가능
    

+ [차량 검색]

    + 메인 화면에서 Search 버튼 클릭 시 차량 검색 화면으로 가게 됨
    
    + 원하는 차량 종류을 고르고 Search 버튼 클릭하면 해당 종류의 차량 목록이 나오게 되는데 세부 옵션을 선택해(예, 색, 연료 등) 원하는 조건의 차량을 다시 검색할 수 있음
    
    + 구매 가능
    
+ [매니저]

    + 매니저 계정으로 로그인 후 관리 버튼을 클릭하게 되면 관리자 창으로 가게 됨
    
    + 거래내역을 조회 가능하고 차량 매물을 등록, 수정할 수 있음
    
    + 매출액 확인 가능 - 월별 매출액, 년도별 매출액, 제조사 별 매출액 확인 가능
    

## Main Function
+ [Concurrency Control]

    + 데이터베이스 등록 시 Concurrency Control 을 해주지 않아 'unique constraint violated' 가 일어나는 경우 발생
      + Ex) Scenario : 두 명의 회원, A, B가 동시에 같은 차를 구매하려고 시도한다.
    
    + Sol) 이를 해결하기 위해 LOCK TABLE BUY IN EXCLUSIVE MODE 로 테이블 LOCK
    
+ [차량 추천 시스템]
    + 사용자의 상태에 따라 다른 추천을 해주는 시스템
    
    + 최근 검색 기록이 있는 사용자
      + [최근 검색한 세부모델명 -> 모델 명 -> 가장 거래가 많이 된 모델/세부모델]순으로 차량 추천
      + EX) JIHYEON 이라는 사용자가 로그인 후 BMW의 X5 F15차량을 검색 함, 차량 추천 배너에 F15 매물 -->X5 매물 순으로 차량 추천
    
    + 만약 최근에 검색한 내역이 없는 사용자 / 로그인 하지 않은 상태
      + [가장 거래가 많이 된 모델/세부모델] 을 기준으로 차량 추천
      
    + 알고리즘 : 사용자가 검색할 때 마다 session 에 최근 검색내역을 <key, value>로 저장
    
## Code development environment
+ [Language]
  + java
  + jsp
  + js
  + html
+ DBMS
  + Oracle
+ IDE
  + Eclipse IDE
  
  
### 자세한 내용은 사용자메뉴얼.pdf 참조

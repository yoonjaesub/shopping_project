# shopping_project
- 쇼핑몰 사이트 jsp 구현 프로젝트

  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">

  ### 메인페이지

  ```
  header 부분을 position fixed로 고정시켜 놓았으며 
  휴대폰 이미지에 5개의 배경 이미지가 차례대로 나타나고 사라지는 
  애니메이션을 Jquery의 .animate 효과로 주었습니다.
  ```


  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/searchBox.PNG" width="800" height="500">

  ### 검색박스 

  ```
  position absolute와 z-index를 주었으며 
  찾으려는 단어를 입력 후 버튼을 누르면 
  게시글(공지사항, 이벤트 등)에서 해당 내용을 찾습니다 
  (기능 추가예정)
  ```


  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/footer.PNG" width="800" height="500">

  ### Footer

  ```
  하단부분 디자인 입니다.
  ```


  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/join.PNG" width="800" height="500">

  ### 회원가입

  ```
  각 input에 값을 넣으면 해당 데이터들을 바탕으로 데이터베이스에 신규회원이 생성됩니다
  insert문을 사용했습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/login.PNG" width="800" height="500">

  ###  로그인 페이지

  ```
  select / where 문을 사용해 
  해당 아이디와 패스워드를 가진 유저가 데이터베이스 내에 있는지 확인 후 
  로그인 처리를 실행하도록 하였습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/alert.PNG" width="800" height="500">
  
  ```
  만약 로그인시 아이디 혹은 패스워드 값이 일치하지 않거나 
  입력하지 않은경우, 회원이 아닌 경우에는
  alert를 띄우고 비어있는 곳에 focus를 주도록 
  자바스크립트로 코드를 구현하였습니다.
  로그인 버튼에는 addEventListener를 사용하였습니다.
  
  추후에는 아이디만 틀렸을경우와 비밀번호만 틀렸을 경우
  해당 내용을 alert로 알리고, 회원이 아닌 경우 회원가입을 해야한다는 알림이 나타나도록
  if문을 이용하여 제작 예정입니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/login_header.PNG" width="800" height="100">
  
  ```
  로그인을 하게 되면 세션에 해당 유저의 아이디와 패스워드값을 저장해놓도록 하였으며 (session.setAttribute)
  세션에 유지중인 아이디와 패스워드가 null값이 아닐경우 
  로그인 / 회원가입이 아닌 로그아웃 / 마이페이지 로 나타나도록 if문을 사용하여 작성하였습니다.
  로그아웃 버튼을 누르면 session.removeAttribute를 통해 세션값을 null값으로 변경하도록 하였습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/mypage.PNG" width="800" height="500">
  
  ###  마이페이지
  
  ```
  select문을 사용하여 패스워드를 제외한 
  데이터베이스 내 기록되어있는 해당 유저의 정보를 나타내도록 하였습니다.
  where 에는 세션에 유지중인 회원의 아이디값이 들어가도록 하였습니다.
  정보 수정과 회원탈퇴는 java script의 location.href로 페이지 이동을 적용하였습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/edit.PNG" width="800" height="500">
  
  ### 정보수정창
  
  ```
  select 문을 이용하여 데이터베이스 내에 정보를 불러오도록 작성하였습니다.
  아이디값의 경우는 세션에 유지중인 아이디를 나타내도록 작성하였습니다.
  작성 후 변경버튼을 누르면 update 문을 사용하여 변경되도록 작성하였고, 
  마찬가지로 where 에는 세션에 유지중인 아이디값을 넣었습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/exit.PNG" width="800" height="500">
  
  ### 회원탈퇴창
  
  ```
  delete문을 이용하여 작성하였으며, where에는 세션에 유지중인 패스워드 값을 넣었습니다.
  세션에 유지중인 패스워드와 다른 값을 입력하면 
  패스워드가 틀렸다고 alert 창을 띄우도록 하였습니다.
  ```
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/company_come.PNG" width="800" height="500">
  
  ### 오시는길 페이지
  
  ```
  카카오에서 제공하는 지도 API를 사용하여 온수역을 좌표값으로 설정하였습니다.
  추가적으로 카카오에서 제공하는 마커기능을 이용하여 마커를 표기하였습니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/cosmatics.PNG" width="800" height="500">
  
  ### 화장품 페이지
  
  ```
  화장품 페이지 입니다.
  실제 데이터 베이스에 있는 상품명, 브랜드, 용량, 가격을 출력하도록 하였으며,
  이미지의 경우 해당 상품의 제품번호를 파일명으로 주어서 while문을 이용하여 데이터베이스 내에 있는 갯수만큼 출력하도록 하였습니다.
  
  ex) 1번브랜드 제품코드 = 100001 부터 시작 -> 이미지파일 = 100001.jpg
  다른 브랜드의 제품코드와 이미지 분류를 위하여 while문을 여러개 삽입하였습니다.
  ex) 2번브랜드 제품코드 = 200001 부터 시작 -> 이미지파일 = 200001.jpg
  
  다만 while문을 한개의 jsp에서 여러번 사용하는것이 비효율 적이라는 지적을 받아
  추후에는 화장품 메뉴바에 브랜드명을 a태그로 삽입하고 해당 값을 getParameter로 받아와서 while문을 여러개 쓰지않아도 되도록 처리할 예정입니다.
  ```
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/admin_index.PNG" width="800" height="500">
  
  ### 관리자페이지
  
  ```
  로그인시 관리자의 아이디와 패스워드로 로그인하면
  관리자 페이지로 이동할 수 있도록 if문과 javascript 의 location을 이용하였습니다.
  관리자 페이지는 현재 작성 예정중에 있습니다.
  ```

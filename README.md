# shopping_project
쇼핑몰 사이트 jsp 구현 프로젝트

<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/index.PNG" width="800 " height="500">
## 메인페이지 입니다.
- header 부분을 position fixed로 고정시켜 놓았으며 휴대폰 배경이미지에 5개의 이미지가 차례대로 나타나고 사라지는 애니메이션을 Jquery의 .animate 효과로 주었습니다.

<img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/searchBox.PNG" width="800" height="500">
## 검색박스입니다. 
- position absolute와 z-index를 주었으며 찾으려는 단어를 입력 후 버튼을 누르면 게시글(공지사항, 이벤트 등)에서 해당 내용을 찾습니다 (기능 추가예정)
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/footer.PNG" width="800" height="500">
  하단부분 디자인 입니다
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/join.PNG" width="800" height="500">
  회원가입 페이지 입니다. 각 input에 값을 넣으면 해당 데이터들을 바탕으로 데이터베이스에 신규회원이 생성됩니다
  insert문 사용
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/login.PNG" width="800" height="500">
  로그인 페이지입니다. select / where 문을 사용해 해당 아이디와 패스워드를 가진 유저가 있는지 확인 한 후 로그인 처리를 실행하도록 하였습니다.
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/alert.PNG" width="800" height="500">
  만약 로그인시 아이디 혹은 패스워드 값이 일치하지 않거나 비어있는 경우 alert를 띄우고 비어있는 곳에 focus를 주도록 자바스크립트로 코드를 구현하였습니다.
  로그인 버튼에는 addEventListener를 사용하였습니다.
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/login_header.PNG" width="800" height="100">
  로그인을 하게 되면 세션에 해당 유저의 아이디와 패스워드값을 저장해놓도록 하였으며 session.setAttribute
  세션에 유지중인 아이디와 패스워드가 null값이 아닐경우 로그인 / 회원가입이 아닌 로그아웃 / 마이페이지 로 나타나도록 if문을 사용하여 작성하였습니다.
  로그아웃 버튼을 누르면 session.removeAttribute를 통해 세션값을 null값으로 변경하도록 하였습니다.
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/mypage.PNG" width="800" height="500">
  마이페이지 화면입니다. select문을 사용하여 패스워드를 제외한 데이터베이스 내 기록되어있는 해당 유저의 정보를 나타내도록 하였습니다.
  정보 수정과 회원탈퇴는 
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/edit.PNG" width="800" height="500">
  
  
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/exit.PNG" width="800" height="500">
  <img src="https://github.com/yoonjaesub/shopping_project/blob/main/img/admin_index.PNG" width="800" height="500">

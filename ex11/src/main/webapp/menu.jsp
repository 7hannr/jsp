<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
  .navbar-nav .nav-link {
    color: white; /* 흰색으로 변경 */
  }
</style>
<nav class="navbar navbar-expand-lg" style="background-color: #212121;">
  <div class="container-fluid">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="/" style="color: white;">home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            상품
          </a>
          <ul class="dropdown-menu">
            <li><a class="nav-link active" aria-current="page" href="/goods/search" id="search-item">상품검색</a></li>
            <li><a class="nav-link active" aria-current="page" href="/goods/list" id="list-item">상품목록</a></li>
          </ul>
        </li>
        <li class="nav-item dropdown">
            <li><a class="nav-link active" aria-current="page" href="/goods/cart" id="cart-item" style="color: white;">장바구니</a></li>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            강의
          </a>
          <ul class="dropdown-menu">
            <li><a class="nav-link active" aria-current="page" href="/cou/list">강의관리</a></li>
            <li><a class="nav-link active" aria-current="page" href="/cou/insert">강의등록</a></li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav  mb-2 mb-lg-0">
        <li class="nav-item" id="login">
           <a class="nav-link" aria-current="page" href="/user/login">로그인</a>
        </li>
        <li class="nav-item" id="uid">
           <a class="nav-link active" aria-current="page" href="/user/mypage" style="color: white"></a>
        </li>
        <li class="nav-item" id="logout">
           <a class="nav-link active" aria-current="page" href="/user/logout" style="color: white">로그아웃</a>
        </li>
      </ul>
    </div>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>
<script>
  const uid=sessionStorage.getItem("uid");
  if(uid){
      $("#login").hide();
      $("#logout").show();
      $("#uid a").html(uid + "님");
      $("#cart-item").show();
   }else{
      $("#login").show();
      $("#logout").hide();
      $("#uid").hide();
      $("#cart-item").hide();
   }
  $("#logout").on("click", "a", function(e){
      e.preventDefault();
      if(confirm("정말로 로그아웃 하시겠습니까?")){
    	  sessionStorage.clear();
         location.href="/user/logout";
      }
   });
  
  if(uid=="admin"){
	  $("#search-item").show();
	  $("#list-item").show();
	  $("#cart-item").hide();
  }else{
	  $("#search-item").hide();
	  $("#list-item").hide();
  }
</script>
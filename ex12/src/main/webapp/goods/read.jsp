<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.bi-arrow-through-heart-fill ,.bi-arrow-through-heart{
   		color:pink;
   		cursor:pointer;
   }
</style>
<div>
	<div class="row my-5">
		<div class="col-md-6 mb-5">
			<img src="${goods.image}" width="80%">
		
		</div>
		<div class="col">
			<h5>
				${goods.title}
				<span class="bi-arrow-through-heart-fill" id="heart" gid="${goods.gid}">
					<span id="fcnt" style="font-size:15px;"></span>
				</span>
			</h5>
			<hr>
			<div class="my-3">상품코드:${goods.gid}</div>
			<div class="my-3">가격:<fmt:formatNumber value="${goods.price}" pattern="#,###원"/></div>
			<div class="my-3">브랜드:${goods.brand}</div>
			<div class="my-3">등록일:${goods.regDate}</div>
			<div class="my-3">배송정보:한진택배</div>
			<div class="my-3">카드할인:하나카드 무이자 최대3개월</div>
			<div class="my-3 text-center">
				<button class="px-3 btn btn-secondary">바로구매</button>
				<button class="px-3 btn btn-outline-danger" id="cart">장바구니</button>
			</div>
		</div>
	</div>
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<button class="nav-link active" id="nav-home-tab"
				data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
				role="tab" aria-controls="nav-home" aria-selected="true">
				상품리뷰
			</button>
			<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
				data-bs-target="#nav-profile" type="button" role="tab"
				aria-controls="nav-profile" aria-selected="false">
				상품설명
			</button>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-home" role="tabpanel"
			aria-labelledby="nav-home-tab" tabindex="0">
			<jsp:include page="review.jsp" />
		</div>
		<div class="tab-pane fade" id="nav-profile" role="tabpanel"
			aria-labelledby="nav-profile-tab" tabindex="0">상품설명</div>
		</div>
	</div>
	<script>
	const gid="${goods.gid}";
	const ucnt="${goods.ucnt}";
	const fcnt="${goods.fcnt}";
	
	$("#fcnt").html(fcnt);
	if(ucnt==0){
		$("#heart").removeClass("bi-arrow-through-heart-fill");
		$("#heart").addClass("bi-arrow-through-heart");
	}else{
		$("#heart").removeClass("bi-arrow-through-heart");
		$("#heart").addClass("bi-arrow-through-heart-fill");
	}
	
	//빈하트 클릭했을때
	$(".bi-arrow-through-heart").on("click",function(){
		const gid=$(this).attr("gid");
		if(uid){
			$.ajax({
				type:"post",
				url:"/favorite/insert",
				data:{uid,gid},
				success:function(){
					alert("조아요 등록")
					//location.href="/goods/read?gid=" + gid;
					location.reload(true); //refresh
				}
			});
		}else{
			const target=window.location.href; //돌아올주소
			alert(target);
			//sessionStorage.setItem("target","/goods/read?gid=" + gid);
			sessionStorage.setItem("target",target);
			location.href="/user/login";
		}
	});
	
	//채워진하트클릭
	$(".bi-arrow-through-heart-fill").on("click",function(){
		const gid=$(this).attr("gid");
		$.ajax({
			type:"post",
			url:"/favorite/delete",
			data:{uid,gid},
			success:function(){
				alert("조아요 취소")
				location.href="/goods/read?gid=" + gid;
		}
	});
});
	//장바구니 버튼을 클릭했을때
	$("#cart").on("click",function(){
		if(uid){
			//장바구니넣기
			$.ajax({
				type:"post",
				url:"/cart/insert",
				data:{uid,gid},
				success:function(data){
					let message="";
					if(data=="true"){
						 message="장바구니에 넣었습니다";
					}else{
						 message="장바구니에 이미 있는 상품입니다!";
					}
					if(confirm(message + "\n장바구니로 이동하실래요?")){
						location.href="/goods/cart";
					}else{
						location.href="/"
					}
				}
			});
		}else{
			sessionStorage.setItem("target","/goods/read?gid=" + gid);
			location.href="/user/login";
		}
	});
</script>
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
			<div class="my-3">��ǰ�ڵ�:${goods.gid}</div>
			<div class="my-3">����:<fmt:formatNumber value="${goods.price}" pattern="#,###��"/></div>
			<div class="my-3">�귣��:${goods.brand}</div>
			<div class="my-3">�����:${goods.regDate}</div>
			<div class="my-3">�������:�����ù�</div>
			<div class="my-3">ī������:�ϳ�ī�� ������ �ִ�3����</div>
			<div class="my-3 text-center">
				<button class="px-3 btn btn-secondary">�ٷα���</button>
				<button class="px-3 btn btn-outline-danger" id="cart">��ٱ���</button>
			</div>
		</div>
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
	
	//����Ʈ Ŭ��������
	$(".bi-arrow-through-heart").on("click",function(){
		const gid=$(this).attr("gid");
		if(uid){
			$.ajax({
				type:"post",
				url:"/favorite/insert",
				data:{uid,gid},
				success:function(){
					alert("���ƿ� ���")
					//location.href="/goods/read?gid=" + gid;
					location.reload(true); //refresh
				}
			});
		}else{
			const target=window.location.href; //���ƿ��ּ�
			alert(target);
			//sessionStorage.setItem("target","/goods/read?gid=" + gid);
			sessionStorage.setItem("target",target);
			location.href="/user/login";
		}
	});
	
	//ä������ƮŬ��
	$(".bi-arrow-through-heart-fill").on("click",function(){
		const gid=$(this).attr("gid");
		$.ajax({
			type:"post",
			url:"/favorite/delete",
			data:{uid,gid},
			success:function(){
				alert("���ƿ� ���")
				location.href="/goods/read?gid=" + gid;
		}
	});
});
	//��ٱ��� ��ư�� Ŭ��������
	$("#cart").on("click",function(){
		if(uid){
			//��ٱ��ϳֱ�
			$.ajax({
				type:"post",
				url:"/cart/insert",
				data:{uid,gid},
				success:function(data){
					let message="";
					if(data=="true"){
						 message="��ٱ��Ͽ� �־����ϴ�";
					}else{
						 message="��ٱ��Ͽ� �̹� �ִ� ��ǰ�Դϴ�!";
					}
					if(confirm(message + "\n��ٱ��Ϸ� �̵��ϽǷ���?")){
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
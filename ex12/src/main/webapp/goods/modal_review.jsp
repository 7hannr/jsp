<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- Modal -->
<div class="modal fade" id="modalReview" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="staticBackdropLabel">
					리뷰작성
				</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<input id="rid" type="hidden">
				<textarea id="content" rows="10" class="form-control" placeholder="내용을 입력하세요."></textarea>
			</div>
			<div class="text-center my-3">
				<button type="button" class="btn btn-outline-dark px-3 " id="btn-update">수정</button>
				<button type="button" class="btn btn-outline-dark px-3 " id="btn-insert">등록</button>
				<button type="button" class="btn btn-outline-danger px-3"
				data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<script>
	$("#btn-insert").on("click",function(){
		const content=$("#content").val();
		if(content==""){
			alert("리뷰내용을 작성하세요!");
			$("#content").focus();
		}else{
			//alert(gid + "\n" + uid + "\n" + content);
			$.ajax({
				type:"post",
				url:"/review/insert",
				data:{uid,gid,content},
				success:function(){
					alert("등록성공!");
					$("#content").val("");
					$("#modalReview").modal("hide");
					getData();
					//getTotal();
				}
			});
		}
	});
</script>
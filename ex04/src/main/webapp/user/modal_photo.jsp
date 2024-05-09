<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<style>
#modalPhoto {
	top: 30%;
}
</style>
<!-- Modal -->
<div class="modal fade" id="modalPhoto" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">사진변경</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
       <div class="modal-body text-center">
      	<c:if test="${user.photo!=null}">
      		<img id="photo" src="${user.photo}" width="200">
      	</c:if>
      	<c:if test="${user.photo==null}">
      		<img id="photo" src="http://via.placeholder.com/200x200" width="200">
      	</c:if>
        <input id="file" type="file" style="display:none;">
      </div>
      <div class="text-center mb-3">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button id="btnsave" type="button" class="btn btn-danger">수정</button>
      </div>
    </div>
  </div>
</div>
<script>
	$("#file").on("change",function(e){
		$("#photo").attr("src",URL.createObjectURL(e.target.files[0]));
	});
	
	$("#photo").on("click",function(){
		$("#file").click();
	})
	
	$("#modalPhoto").on("click","#btnsave",function(){
		if($("#file").val()==""){
			alert("변경할 사진을 선택하세요")
		}else{
			if(confirm("사진을 수정하실래요?")){
			//사진수정하기
			const file=$("#file")[0].files[0];
			const formData = new FormData();
			formData.append("photo",file);
			formData.append("uid",uid);
			$.ajax({
				type:"post",
				url:"/user/upload",
				data:formData,
				processData:false,
				contentType:false,
				success:function(){
					alert("업로드성공");
					location.reload(true);
				}
			});
		}
	}
});
	

</script>
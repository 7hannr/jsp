<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	table .title{
		background:pink;
		color:white;
		text-align:center;
	}
</style>
<div class="row">
	<div class="col">
		<div><h1>강좌정보</h1></div>
		<div class="text-end my-3">
				<button class="btn btn-outline-info me-2" id="update">수정</button>
				<button class="btn btn-outline-danger" id="delete">삭제</button>
			</div>
		<table class="table table-borderd">
			<tr>
				<td class="title">강좌번호</td>
				<td>${cou.lcode}</td>
				<td class="title">강좌이름</td>
				<td colspan="3">${cou.lname}</td>
				
			</tr>
			<tr>
				<td class="title">강의실</td>
				<td>${cou.room}</td>
				<td class="title">신청인원</td>
				<td>${cou.persons}/${cou.capacity}</td>
				<td class="title">담당교수</td>
				<td>${cou.pname}(${cou.instructor})</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="info.jsp"/>
<script>
//수정버튼을 클릭한경우
$("#update").on("click", function(){
	const lcode="${cou.lcode}";
	location.href="/cou/update?lcode=" + lcode;
});
	//삭제버튼을 클릭한경우
	$("#delete").on("click", function(){
		const lcode="${cou.lcode}";
		if(confirm(lcode + "번 강좌를 삭제하실래요?")){
			//학생삭제
			$.ajax({
				type:"post",
				url:"/cou/delete",
				data:{lcode},
				success:function(data){
					if(data=="true"){
						alert("삭제완료!");
						location.href="/cou/list";
					}else{
						alert("이강과를 신청한 학생들이 존재합니다!");
					}
				}
			});
		}
	});
</script>
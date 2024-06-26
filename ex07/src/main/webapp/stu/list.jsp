<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>
	<h1>학생관리</h1>
	<div class="row mt-5 mb-3">
		<form class="col-10 col-md-6" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="scode">학생번호</option>
					<option value="sname" selected>학생이름</option>
					<option value="dept">학과</option>
					<option value="pname">지도교수</option>
				</select>
				<input placeholder="검색어" class="form-control" name="word">		
				<button class="btn btn-outline-danger">검색</button>	
				<span id="total" class="mt-2 ms-3"></span>
			</div>
		</form>
		<div class="col-1">
			<select class="form-select" id="size">
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명</option>
			</select>
		</div>
	</div>
	<div id="div_stu"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_stu" type="x-handlebars-template"> 
	<table class="table table-borderd table-hover text-center">
		<tr>
			<td>학생번호</td>
			<td>학생이름</td>
			<td>학생학과</td>
			<td>학생학년</td>
			<td>생년월일</td>
			<td>지도교수</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{scode}}</td>
			<td><a href="/stu/read?scode={{scode}}">{{sname}}</td>
			<td>{{sdept}}</td>
			<td>{{year}}학년</td>
			<td>{{birthday}}</td>
			<td>{{pname}}({{advisor}})</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=$("#size").val();
	let key=$(frm.key).val();
	let word=$(frm.word).val();
	
	$(frm).on("submit",function(e){
		e.preventDefault();
		page=1;
		size=$("#size").val();
		key=$(frm.key).val();
		word=$(frm.word).val();
		//getData();
		getTotal();
	});
	
	$("#size").on("change",function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	
	//getData();
	getTotal();
	function getData(){
		$.ajax({
			type:"get",
			url:"/stu/list.json",
			dataType:"json",
			data:{page,size,key,word},
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_stu").html());
				$("#div_stu").html(temp(data));
			}
		});
	}
	
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/stu/total",
			data:{key, word},
			success:function(data){
				let total=parseInt(data);
				$("#total").html("검색수:<b>" + total + "</b>")
				if(total==0){
					alert("검색내용이 없습니다");
					return;
				}
				const totalPage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				if(total>size){
					$("#pagination").show();
				}else{
					$("#pagination").hide();
				}
			}
		});
	}
	$('#pagination').twbsPagination({
		totalPages:10, 
		visiblePages: 5, 
		startPage : 1,
		initiateStartPageClick: false, 
		first:'<i class="bi bi-arrow-left-circle-fill"></i>', 
		prev :'<i class="bi bi-arrow-left-circle"></i>',
		next :'<i class="bi bi-arrow-right-circle"></i>',
		last :'<i class="bi bi-arrow-right-circle-fill"></i>',
		onPageClick: function (event, clickPage) {
			 page=clickPage; 
			 getData();
		}
	});
	
</script>
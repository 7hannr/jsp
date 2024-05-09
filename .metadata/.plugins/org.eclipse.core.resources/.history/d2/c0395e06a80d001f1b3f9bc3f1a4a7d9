<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
	#size { 
		width:100px;
		float: right;
	}
</style>
<div>
	<h1>교수관리</h1>
	<div class="row mt-5 mb-3">
		<form class="col-10 col-md-6" name="frm">
			<div class="input-group">
				<select class="form-select me-3" name="key">
					<option value="pcode">교수번호</option>
					<option value="pname" selected>교수이름</option>
					<option value="dept">학과</option>
				</select>
				<input placeholder="검색어" class="form-control" name="word">		
				<button class="btn btn-outline-danger">검색</button>	
			</div>
		</form>
		<div class="col">
			<select class="form-select" id="size">
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5">5명</option>
			</select>
		</div>
	</div>
	<div id="div_pro"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_pro" type="x-handlebars-template">
		<table class="table table-borderd table-hover">
		<tr>
			<td>교수번호</td>
			<td>교수이름</td>
			<td>교수학과</td>
			<td>교수직급</td>
			<td>교수급여</td>
			<td>임용일자</td>
		</tr>
		{{#each .}}
		<tr>
			<td>{{pcode}}</td>
			<td><a href="/pro/read?pcode={{pcode}}">{{pname}}</a></td>
			<td>{{dept}}</td>
			<td>{{title}}</td>
			<td>{{salary}}</td>
			<td>{{hiredate}}</td>
		</tr>
		{{/each}}
	</table>
</script>

<script>
	let page=1;
	let size=$("#size").val();
	let key=$(frm.key).val();
	let word=$(frm.word).val();
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		key=$(frm.key).val();
		word=$(frm.word).val();
		size=$("#size").val();
		page=1;
		getData();
	});
	
	$("#size").on("change", function(){
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
			url:"/pro/list.json",
			data:{page, size, key, word},
			dataType:"json",
			success:function(data){
				console.log(data);
				const temp=Handlebars.compile($("#temp_pro").html());
				$("#div_pro").html(temp(data));
			}
		});
	}
	
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/pro/total",
			data:{key, word},
			success:function(data){
				if(data==0){
					alert("검색내용이 없습니다");
					$(frm.word).val("");
					return;
				}
				
				const totalPage=Math.ceil(data/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				if(parseInt(data)>size){
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
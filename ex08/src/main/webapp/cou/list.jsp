<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
   #size { 
      width:100px;
      float: right;
   }
   .page-link {
     color: #000; 
     background-color: #fff;
     border: 1px solid #fff;
     border-radius : 15%; 
   }
   
   .page-item.active .page-link {
    z-index: 1;
    color: #4A6BD6;
    font-weight:bold;
    background-color: #f1f1f1;
    border-color: #ccc;
    
   }
   
   .page-link:focus, .page-link:hover {
     color: #000;
     background-color: #fafafa; 
     border-color: #ccc;
   }
</style>
<div>
	<h1>강좌관리</h1>
	<div class="row">
		<div class="col-8 col-md-6">
		<form name="frm">
			<div class="input-group mb-2">
				<select name="key" class="form-select">
					<option value="lname">강좌이름</option>
					<option value="lcode">강좌번호</option>
					<option value="pname">담당교수</option>
					<option value="room">강의실</option>
				</select>
				<input name="word" placeholder="검색어" class="form-control ms-2">
				<button class="btn btn-secondary">검색</button>
				<span id="total" class="mt-2 ms-3"></span>
			</div>
		</form>
		</div>
		<div class="col">
			<select class="form-select" id="size">
				<option value="1">1명</option>
				<option value="2">2명</option>
				<option value="3">3명</option>
				<option value="4">4명</option>
				<option value="5" selected>5명</option>
			</select>
		</div>
	</div>
	<div id="div_cou"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_cou" type="x-handlebars-template">
	<table class="table table-borderd table-hover">
		<tr class="text-center">
			<td>강좌번호</td>
			<td>강좌이름</td>
			<td>강의시간</td>
			<td>강의실</td>
			<td>신청인원</td>
			<td>담당교수</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}명/{{capacity}}명</td>
			<td>{{pname}}({{instructor}})</td>
		</tr>
		{{/each}}
	</table>
</script>
<script>
	let page=1;
	let size=5;
	let key="lname";
	let word="";
	
	//size 변경될때
	$("#size").on("change", function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	
	//submit 될때
	$(frm).on("submit", function(e){
		e.preventDefault();
		page=1;
		key=$(frm.key).val();
		word=$(frm.word).val();
		//getData();
		getTotal();
	});
	
	//getData();
	function getData(){
		$.ajax({
			type:"get",
			url:"/cou/list.json",
			data:{page, size, key, word},
			dataType:"json",
			success:function(data){
				const temp=Handlebars.compile($("#temp_cou").html());
				$("#div_cou").html(temp(data));
			}
		});
	}
	
	getTotal();
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/cou/total",
			data:{key, word},
			success:function(data){
				let total=parseInt(data);
				if(total==0) {
					alert("검색데이터가 없습니다!");
					$(frm.word).val("");
					return;
				}
				$("#total").html("검색수: " + total);
				let totalPage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				
				if(total > size){
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
		first:'<i class="bi bi-chevron-double-left"></i>', 
		prev :'<i class="bi bi-chevron-left"></i>',
		next :'<i class="bi bi-chevron-right"></i>',
		last :'<i class="bi bi-chevron-double-right"></i>',
		onPageClick: function (event, clickPage) {
			 page=clickPage; 
			 getData();
		}
	});
</script>
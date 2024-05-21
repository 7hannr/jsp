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
	<h1>���°���</h1>
	<div class="row">
		<div class="col-8 col-md-6">
		<form name="frm">
			<div class="input-group mb-2">
				<select name="key" class="form-select">
					<option value="lname">�����̸�</option>
					<option value="lcode">���¹�ȣ</option>
					<option value="pname">��米��</option>
					<option value="room">���ǽ�</option>
				</select>
				<input name="word" placeholder="�˻���" class="form-control ms-2">
				<button class="btn btn-secondary">�˻�</button>
				<span id="total" class="mt-2 ms-3"></span>
			</div>
		</form>
		</div>
		<div class="col">
			<select class="form-select" id="size">
				<option value="1">1��</option>
				<option value="2">2��</option>
				<option value="3">3��</option>
				<option value="4">4��</option>
				<option value="5" selected>5��</option>
			</select>
		</div>
	</div>
	<div id="div_cou"></div>
	<div id="pagination" class="pagination justify-content-center mt-5"></div>
</div>
<script id="temp_cou" type="x-handlebars-template">
	<table class="table table-borderd table-hover">
		<tr class="text-center">
			<td>���¹�ȣ</td>
			<td>�����̸�</td>
			<td>���ǽð�</td>
			<td>���ǽ�</td>
			<td>��û�ο�</td>
			<td>��米��</td>
		</tr>
		{{#each .}}
		<tr class="text-center">
			<td>{{lcode}}</td>
			<td><a href="/cou/read?lcode={{lcode}}">{{lname}}</td>
			<td>{{hours}}</td>
			<td>{{room}}</td>
			<td>{{persons}}��/{{capacity}}��</td>
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
	
	//size ����ɶ�
	$("#size").on("change", function(){
		size=$("#size").val();
		page=1;
		//getData();
		getTotal();
	});
	
	//submit �ɶ�
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
					alert("�˻������Ͱ� �����ϴ�!");
					$(frm.word).val("");
					return;
				}
				$("#total").html("�˻���: " + total);
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
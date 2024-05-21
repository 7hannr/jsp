<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <style>
    #div_shop img{
    	cursor:pointer;
    	border-radius:10px;
    }
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
   .bi-arrow-through-heart-fill ,.bi-arrow-through-heart{
   		color:pink;
   		float:right;
   		font-size:20px;
   		cursor:pointer;
   }
   
   
</style>  
 <div class="my-5">
 <div class="row mb-3 justify-content-end">
 	 <div class="col-6 col-md-4">
 	 	<form name="frm">
 	 		 <div class="input-group">
 	 		 	<input class="form-control" placeholder="검색어" name="word">
 	 		 	<button class="btn btn-secondary">검색</button>
 	 		 </div>
 	 	</form>
 	 </div>
 </div>
	<div id="div_shop" class="row"></div>	
	<div id="pagination" class="pagination justify-content-center mt-5 pagination-sm"></div>
</div>
<script id="temp_shop" type="x-handelbars-template">
	{{#each .}}
		<div class="col-6 col-md-4 col-lg-2 mb-5">
			<div class="mb-2 text-center">
				<img gid="{{gid}}" src="{{image}}" width="90%" style="cursor:pointer;">
			</div>
			<div class="brand">
				<span>{{brand}} {{gid}}</span>
			</div>
			<div class="ellipsis">{{{title}}}</div>
			<div>
				<b>{{fmtprice price}}원</b>
				<span class="bi {{heart ucnt}}" gid="{{gid}}">
					<span style="font-size:12px;color:red;">{{fcnt}}</span>
				</span>
			</div>
		</div>
	{{/each}}
</script>
<script>
	Handlebars.registerHelper("fmtprice",function(price){
		return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
	});
	Handlebars.registerHelper("heart",function(value){
		if(value==0) return "bi-arrow-through-heart";
		else return "bi-arrow-through-heart-fill";
	});
</script>
<script>
	let size=12;
	let page=1;
	let word="";
	
	getTotal();
	
	
	
	//이미지를클릭한경우
	$("#div_shop").on("click","img",function(){
		const gid=$(this).attr("gid");
		//alert(uid + "/" + gid);
		location.href="/goods/read?gid=" + gid;
	});
	//빈하트클릭
	$("#div_shop").on("click",".bi-arrow-through-heart",function(){
		if(uid){
			const gid=$(this).attr("gid");
			//alert(uid + ":" + gid);
			$.ajax({
				type:"post",
				url:"/favorite/insert",
				data:{uid,gid},
				success:function(){
					alert("조아요 등록")
					getData();
				}
			});
		}else{
			location.href="/user/login";
		}
	});
	//채워진하트 클릭
	$("#div_shop").on("click",".bi-arrow-through-heart-fill",function(){
			const gid=$(this).attr("gid");
			//alert(uid + ":" + gid);
			$.ajax({
				type:"post",
				url:"/favorite/delete",
				data:{uid,gid},
				success:function(){
					alert("조아요 취소")
					getData();
			}
		});
	});
	
	$(frm).on("submit",function(e){
		e.preventDefault();
		word=$(frm.word).val();
		//getData();
		page=1;
		getTotal();
	});
	
	//getData();
	getTotal();
	function getData(){
		$.ajax({
			type:"get",
			url:"/goods/list.json",
			dataType:"json",
			data:{size,page,word,uid},
			success:function(data){
				const temp=Handlebars.compile($("#temp_shop").html());
				$("#div_shop").html(temp(data));
			}
		});
	}
	function getTotal(){
		$.ajax({
			type:"get",
			url:"/goods/total",
			data:{word},
			success:function(data){
				const total=parseInt(data);
				if(total==0) {
					alert("검색한 상품이 없습니다!");
					return;
				}
				const totalPage=Math.ceil(total/size);
				$("#pagination").twbsPagination("changeTotalPages", totalPage, page);
				if(total > size){
					$("#pagination").show();
				}else{
					$("#pagination").hide();
				}
				$("#total").html("검색수: " + total);
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
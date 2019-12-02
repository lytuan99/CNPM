


function myFunctionProduct(cot,id) {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById(id);
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[cot];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
}

function myFunctionUser() {
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput_filter");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    }       
	  }
}
	
	



var Blog = {
		
		addToCart: function(productId) {
			alert(productId);
			var data = {};
			data["productId"] = productId;
			
			$.ajax({
				url: "/rest/api/cart/addToCart",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên RestAPI
													// có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ Rest trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả
												// về dữ liệu.
					if(jsonResult.status == "success") {
						alert('đã thêm sản phẩm vào trong giỏ hàng.')
					}
				}
			});
		},
		
		deleteProduct: function(id,entityId,restApi){
			$( '#'+id ).click(function() {
				
				var data = {};
				data["entityId"] = entityId;
				$.ajax({
					url: restApi,
					type: "post",
					contentType: "application/json", // dữ liệu gửi lên
														// RestAPI có dạng là
														// json.
					data: JSON.stringify(data), // object json -> string json
					
					dataType: "json", // dữ liệu từ Rest trả về là json.
//					success: function(jsonResult) { // được gọi khi web-service
//													// trả về dữ liệu.
//						if(jsonResult.status == "success") {
//							// thành công
////							getElementById("deleteP").location.replace="localhost:8888/gio_hang";     // chỗ này sau khi xóa xong vẫn chưa chuyển hướng đến trang khác được
//							
//						} else {
//							// thất bại
//						}
//					}
				});
				
				
			});
		},
		
		deleteForm: function(modalID, entityId, restApi) {			
			$( "#deleteOk" ).click(function() {
				
				var data = {};
				data["entityId"] = entityId;
				$.ajax({
					url: restApi,
					type: "post",
					contentType: "application/json", // dữ liệu gửi lên
														// RestAPI có dạng là
														// json.
					data: JSON.stringify(data), // object json -> string json
					
					dataType: "json", // dữ liệu từ Rest trả về là json.
					success: function(jsonResult) { // được gọi khi web-service
													// trả về dữ liệu.
						if(jsonResult.status == "success") {
							// thành công
							window.location.reload();
							
						} else {
							// thất bại
						}
					}
				});
				
				
			});
			$('#'+modalID).modal('show');
		},
		
		
		
		userRegister: function() {
			var userName = $( "#userName" ).val();
			var password = $( "#userPassword" ).val();
			
			// đây là json: {userName: "", password: ""}
			var data = {};
			data["userName"] = userName;
			data["password"] = password;
			
			$.ajax({
				url: "/rest/api/user/register",
				type: "post",
				contentType: "application/json",	// dữ liệu gửi lên RestAPI
													// có dạng là json.
				data: JSON.stringify(data), 		// object json -> string
													// json
				
				dataType: "json", 				// dữ liệu từ Rest trả về là
												// json.
				success: function(jsonResult) { // được gọi khi web-service trả
												// về dữ liệu.
					
					if(jsonResult.status == "success"){
					$('#success').show();
					$("#failed").hide();
				}
// alert(jsonResult.status);
// alert(jsonResult.message);
				}
			});
			
		},
		
		login: function(urlpath) {
			var userName = $( "#adminName" ).val();
			var password = $( "#adminPass" ).val();
			
			// đây là json: {userName: "", email: "", password: ""}
			var data = {};
			data["uname"] = userName;
			data["psw"] = password;
			
			$.ajax({
				url: urlpath,
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên RestAPI có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ Rest trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == "success") {
						$("#failed").hide();

//						$('#modalRegisterForm').modal('hide');
//						location.href = "https://www.w3schools.com/jsref/prop_loc_href.asp";
					} else {
						$("#failedMessage").html(jsonResult.message);
					}
				}
			});
		}
}



$(document).ready(function () {


    window.onscroll = function () { scrollFunction()};
    function scrollFunction() {
        if(document.body.scrollTop > 100 || document.documentElement.scrollTop > 100){
            $('#myBtn').css("display","block");
        }
        else{
            $('#myBtn').css("display","none");
        }
    }

    $('#myBtn button').on('click',function (e) {
        e.preventDefault();
        
        $('html,body').animate({ scrollTop: 0} , 300);
                
    });
    
    $("#btnLogin").click(function(event) {

        // Fetch form to apply custom Bootstrap validation
        var form = $("#formLogin")

        if (form[0].checkValidity() === false) {
          event.preventDefault()
          event.stopPropagation()
        }
        
        form.addClass('was-validated');
      });


    $('#my-summernote').summernote();
    
    $('.minus-btn').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var $input = $this.closest('div').find('input');
        var value = parseInt($input.val());
     
        if (value > 1) {
            value = value - 1;
        } else {
            value = 1;
        }
     
      $input.val(value);
     
    });
     
    $('.plus-btn').on('click', function(e) {
        e.preventDefault();
        var $this = $(this);
        var $input = $this.closest('div').find('input');
        var value = parseInt($input.val());
     
        if (value < 100) {
            value = value + 1;
        } else {
            value =100;
        }
     
        $input.val(value);
    });
    
    
    
    
});










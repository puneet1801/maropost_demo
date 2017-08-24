
function match_password(input){
  var password = $("#user_password").val();
  var password_confirmation = $("#user_password_confirmation").val();

  if (password != password_confirmation) {
    $("#user_password_confirmation")[0].setCustomValidity('Password Must be Matching.');
  }else {
    $("#user_password_confirmation")[0].setCustomValidity('');
  }
}

function fetch_images_count() {
	$(".images_count").addClass("bg_yellow");
	$.ajax({
		url: "/galleries/images_count",
		success: function(res){
			$(".images_count #count").html(res.count);
			$(".images_count").removeClass("bg_yellow").addClass("bg_green");
		},error: function(){
			console.log("error");
		}
	})
}

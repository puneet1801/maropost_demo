
$(function(){
	$("#gallery_name").change(function(){
		var src = $("#gallery_name");
		var name = src.val();
		var gallery_id = src.attr("gallery_id");
		$.ajax({
			type: "post",
			url: "/galleries/"+gallery_id+"/update_name",
			data: "name="+name,
			success: function(res){
				console.log(res);
				src.parent().children().remove(".update_status");
				src.parent().append("<div style='color: "+res.color+"' class='update_status'>"+res.message+"<div>");
			},error: function(){
				console.log("Error");
				alert("Something went wrong.");
			}

		})
	})
})
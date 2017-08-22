
function match_password(input){
  var password = $("#user_password").val();
  var password_confirmation = $("#user_password_confirmation").val();

  if (password != password_confirmation) {
    $("#user_password_confirmation")[0].setCustomValidity('Password Must be Matching.');
  }else {
    $("#user_password_confirmation")[0].setCustomValidity('');
  }
}

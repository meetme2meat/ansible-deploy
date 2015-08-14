$(document).ready(function($) {
  $('#slideshow').carousel({
    interval: 5000
  }); 

  $("#user_login_button").on('click', function() {
    $('#main_modal').modal('show');
    $('.login_modal').show();
    $('.forgot_password_modal').hide();
    $('.signup_modal').hide();
  });

  $("#user_signup_button").on('click',function(){
    $('#main_modal').modal('show');
     $('.signup_modal').show();
     $('.login_modal').hide();
      $('.forgot_password_modal').hide();
  })
  /*click on forgot password link hide login and signup modal*/
  $("#forgot_password").on('click',function(){
    event.preventDefault();
    $('.login_modal').hide();
    $('.forgot_password_modal').show();
  })
  /*click on sign up link hide login and forgot modal*/
  $('.sign_up').on('click',function(){
    event.preventDefault();
    $('.forgot_password_modal').hide();
    $('.login_modal').hide();
    $('.signup_modal').show();
  })
  /*click on log in link hide sign up and forgot modal*/
  $('#log_in').on('click',function(){
    event.preventDefault();
    $('.forgot_password_modal').hide();
    $('.login_modal').show();
    $('.signup_modal').hide();
  })
});

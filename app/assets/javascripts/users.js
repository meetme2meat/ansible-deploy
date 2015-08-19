
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Michef = (function (Michef) {

  Michef.Users = function (config) {
    var self = this;
    self.config = config || {};
    self.init();
  };

  Michef.Users.method("init", function () {
  		var self = this;
  			self.initLoginPopup();
  });
  Michef.Users.method("initLoginPopup", function () {
  		$("#user_login_button").on('click', function() {
  		  $('#main_modal').modal('show');
  		  $('.login_modal').show();
        $('.forgot_password_modal, .signup_modal').hide();
  		});
  		/*click on forgot password link hide login and signup modal*/
  		$("#forgot_password").on('click',function(event){
  		  event.preventDefault();
  		  $('.login_modal, .signup_modal').hide();
  		  $('.forgot_password_modal').show();
  		});
  		/*click on sign up link hide login and forgot modal*/
  		$('.sign_up').on('click',function(event){
  		  event.preventDefault();
        $('error-message').hide();
  		  $('.forgot_password_modal, .login_modal').hide();
  		  $('.signup_modal').show();
  		});
  		/*click on log in link hide sign up and forgot modal*/
  		$('.log_in').on('click',function(event){
  		  event.preventDefault();
  		  $('.forgot_password_modal, .signup_modal').hide();
  		  $('.login_modal').show();
  		});

      $('.email-signup').submit(function(e) {

        var signup_form = $('.email-signup');
        e.preventDefault();
        e.stopImmediatePropagation();

        $.ajax({
            url: $(this).attr('action'),
            method: $(this).attr('method'),
            data: $(this).serialize(),
            dataType: 'json',
            success: function (response) {
              if(response.success == false) {
                (response.errors.email) ? signup_form.find('.user_email span.error-message').html(response.errors.email) : signup_form.find('.user_email span.error-message').html('');
                (response.errors.password_confirmation) ? signup_form.find('.confirm_password span.error-message').html(response.errors.password_confirmation) : signup_form.find('.confirm_password span.error-message').html('');
                (response.errors.password) ? signup_form.find('.new_password span.error-message').html(response.errors.password) : signup_form.find('.new_password span.error-message').html('');
                (response.errors.first_name) ? signup_form.find('.firstName span.error-message').html(response.errors.first_name) : signup_form.find('.firstName span.error-message').html('');
                (response.errors.last_name) ? signup_form.find('.lastName span.error-message').html(response.errors.last_name) : signup_form.find('.lastName span.error-message').html('');
                (response.errors.username) ? signup_form.find('.user_name span.error-message').html(response.errors.username) : signup_form.find('.user_name span.error-message').html('');
                }
                else {
                  $('.signup_modal').hide();
                  $('.login_modal').show();
                  $('.login_modal').find('.successfully_registered').html("Successfully Registered!!");
                  setTimeout(function() {
                    $('.successfully_registered').slideUp();
                  }, 3000);                  
                }
              },
            error: function() {
              
            }
         });
        return false;
      });

      $('.email-signin').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: $(this).serialize(),
            dataType: 'json',
            success:function(){
                location.reload();
            },
            error: function() {
              $('.error_message_login').html('Invalid Username or Password').show();
              setTimeout(function() {
                $('.error_message_login').slideUp();
              }, 3000);
            }
        });
    });

      $('.forgot_password').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        $.ajax({
            url: $(this).attr('action'),
            type: $(this).attr('method'),
            data: $(this).serialize(),
            dataType: 'json',
            success:function(response){
              $('.password_requested').html(response.errors);
            },
            error: function() {

            }
        });
    });      
  });
  return Michef;
})(Michef);
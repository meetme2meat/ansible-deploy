
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
  		$("#forgot_password").on('click',function(){
  		  event.preventDefault();
  		  $('.login_modal').hide();
  		  $('.forgot_password_modal').show();
  		});
  		/*click on sign up link hide login and forgot modal*/
  		$('.sign_up').on('click',function(){
  		  event.preventDefault();
        $('error-message').hide();
  		  $('.forgot_password_modal, .login_modal').hide();
  		  $('.signup_modal').show();
  		});
  		/*click on log in link hide sign up and forgot modal*/
  		$('#log_in').on('click',function(){
  		  event.preventDefault();
  		  $('.forgot_password_modal, .signup_modal').hide();
  		  $('.login_modal').show();
  		});

      $('.email-signup').submit(function(e) {
        e.preventDefault();
        e.stopImmediatePropagation();

        $.ajax({
            url: $(this).attr('action'),
            method: $(this).attr('method'),
            data: $(this).serialize(),
            success: function (response) {
              $('.email-signup').html($(response).find('.email-signup').html());
            },
            error: function () {
              $('.registration_form_container').html("Error");
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
            success:function(){
                location.reload();
            },
            error: function() {
              $('.error_message_login').html('Invalid Username or Password').show();
              setTimeout(function() {
                $('.error_message_login').hide();
              }, 3000);
            }
        });
    });
  });
  return Michef;
})(Michef);
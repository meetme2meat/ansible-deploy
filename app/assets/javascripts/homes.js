
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var Michef = (function (Michef) {

  Michef.Homes = function (config) {
    var self = this;
    self.config = config || {};
    self.init();
  };

  Michef.Homes.method("init", function () {
        $('#slideshow').carousel({
            interval: 5000
        }); 
  });

  return Michef;
})(Michef);
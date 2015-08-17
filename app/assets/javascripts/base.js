var Michef = (function () {
  /*
   Base App Class. Lazy Loads child classes aka subApps.
   */
  var App = function (params) {
    this.params = params || {};

    var subApps = {
      "helper": "Helper"
    };

    /*
     Lazy Loading of subApps.
     Goes through subApps and maps a function which initializes the subApp if not initialized,
     otherwise returns the already initialized object of the said class.
     */
    for (var key in subApps) {
      if (!subApps.hasOwnProperty(key)) {
        continue;
      }
      var subAppName = subApps[key];
      App.prototype[key] = (function (subAppName) {
        var obj = '';
        return function (params) {
          if (typeof(obj) === "string") {
            if (App[subAppName]) {
              var SubApp = App[subAppName];
              if (SubApp.get && typeof(SubApp.get) === "function") {
                obj = SubApp.get(params);
              } else {
                obj = new SubApp(params, this);
                if (typeof(obj["init"]) === "function") {
                  obj["init"]();
                }
              }
            } else {
              obj = null;
            }
          }
          return obj;
        };
      }(subAppName));
    }
  };

  App.method("init", function () {
    var self = this;
  
  });
  return App;
})();
app.Router = Backbone.Router.extend({

  routes: {
    '' : 'home'
  },

  home: function() {
    console.log("home page");
  }

});
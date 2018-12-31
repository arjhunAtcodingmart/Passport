app.factory('Passport', ["railsResourceFactory", "railsSerializer", function(railsResourceFactory, railsSerializer) {
  var Passport = railsResourceFactory({
    url: '/passport_form',
    name: 'passport_form'
  });
  return Passport;
}]);

app.factory('View_form', ["railsResourceFactory", function(railsResourceFactory) {
  var View_form = railsResourceFactory({
    url: '/view_form',
    name: 'view_form'
  });
  return View_form;
}]);
app.controller("appController", ["$scope", "$window", "Passport", '$http',"View_form", function ($scope, $window, Passport, $http,View_form) {
  $scope.init = function () {
    if (typeof json != 'undefined') {
      angular.forEach(json, function (value, key) {
        $scope[key] = value;
      })
    }
}
$scope.init();
  stateData = {}
  $scope.initilize = function(){
    $scope.applyFor = ["Fresh Passport", "Re-Issue of Passport"];
    $.getJSON('/state.json',function(data) {
      stateData = data
      $scope.state=Object.keys(data)
    });
    $scope.gender = ["Male","Female"];
    $scope.marital_status = ["Single","Married","Divorced","/Widow/ Widower","Separated"]
    $scope.citizenship = ["Birth","Descent","Registration/ Naturalization"]
    $scope.employment_type=["Government","Homemaker","Not employed","Others","Owners, Partners & Directors of companies which are members of CII, FICCI & ASSOCHAM","Private","PSU","Retired Government Servant","Retired- Private Service","Self Employed","Statutory Body","Student"]
    $scope.gov_servant=['yes','no']
    $scope.edu_qualification=["5th pass or less","Between 6th and 9th standard","10th pass and above","Graduate and above"]
    $scope.non_ecr=["yes","no"]
    $.getJSON('/all_country.json',function(data) {
      countries=[]
      data.forEach(element => {
        if(element.name != "India")
          countries.push(element.name)
      });
      $scope.countries = countries
    })
  }
  $scope.initilize()
  $scope.emailFormat = /^[a-z]+[a-z0-9._]+@[a-z]+\.[a-z.]{2,5}$/;

  $scope.districtData=function(selectedState){
    $scope.district=stateData[selectedState]
  }
  $scope.validate=function(formStatus){
   if(!formStatus){
     if($scope.data.otherData.accept == true ){
       allData = new Passport($scope.data);
           if($scope.data.applicantData.id != undefined){
              allData.id = $scope.data.applicantData.id;
           }
        allData.save().then(function(value){
        if(value.status){
          $window.open("http://localhost:3000/view_form",'_self')
        }
      })
    }
    else{
      alert("Please Accept the policies")
    }
  }
  else{
    console.log("Invalid From")
    alert("please enter the details required")
  }
  }
  $scope.handleDelete = function(value){
    temp = new View_form({id: value.id})
    temp.delete().then(function(){
      $scope.datum.splice($scope.datum.indexOf(value),1)
    })
  }
  $scope.handleShow=function(data){
    $scope.data=data
  }
}])
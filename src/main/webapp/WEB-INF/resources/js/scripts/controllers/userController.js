/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function(){
  "use strict";
  
    
app.controller('LoginCtrl', ['$scope', '$store', '$http', 'userService', 'utilService' , function($scope, $store,$http,userService,utilService) {
    $store.bind($scope, 'username', '');
    $store.bind($scope, 'userID', '');
    $store.bind($scope, 'userType', '');
    $store.bind($scope, 'password', '');
    $scope.user = '';
    $scope.userId = '';
    $scope.password = '';
    $scope.type = '';
    $scope.ConfirmPass = '';
    $scope.newEmail = '';
    $scope.currentUser = '';
    $scope.newPass = '';
    $scope.newPass2 = '';

    $http.get("/loop-XYZ/loop/user/getUser/"+$scope.username+"/"+$scope.userType).success(function(response){
           $scope.currentUser = response; 
    });
        
    $scope.$watch("username", function(newVal) {
        console.log(newVal);
    });
    $scope.$watch("userType", function(newVal) {
        console.log(newVal);
    });
    
     $scope.$watch("userID", function(newVal) {
        console.log(newVal);
    });
    $scope.$watch("password", function(newVal) {
        console.log("password"+newVal);
    });
    $scope.hide = true;
    $scope.clearUser = function(){ 
        $store.remove('username'); 
        $store.remove('userID');
        $store.remove('userType');
    };
    
    $scope.ChangeEmail = function(pass,email) {
        if($scope.currentUser.password===pass) {
        var data = {
          "username": $scope.username,
          "email": email,
          "usertype": $scope.userType
        };    
        $http.post("/loop-XYZ/loop/user/edit",data).success(function(response) {
            alert(response);
        });
        } else {
            alert('Failed to change Email! Confirmed Password failed!');
        }
    }
    
    $scope.ChangePass = function(pass,newpass,newpass2) {
        if($scope.currentUser.password===pass) {
            if(newpass===newpass2) {
        var data = {
          "username": $scope.username,
          "password": newpass,
          "usertype": $scope.userType
        };
        $http.post("/loop-XYZ/loop/user/edit",data).success(function(response) {
            alert(response);
        });
            } else {
                alert('Passwords do not match!');
            }
        } else {
            alert('Failed to change Password! Confirmed Password failed!');
        }
    }

    $scope.signup = function(){
        if($scope.newpass===$scope.newpass2) {

         var data =  {
                username: $scope.username,
                password: $scope.newpass,
                email : $scope.email,
                userType :  $('input[name=optionsRadios]:checked','#defaultForm').val()
        }; 
            $http.post('/loop-XYZ/loop/user/signup',data).success(function(data){
                   if(data === null)
                        alert("Registration unSuccessful!");
                   else if(data !== null){
                       if(data === true)
                        alert("Registration Successful!");
                       else
                        alert("User exists!");
                    }
            });
        };

    };
  $scope.login = function(){
        var data =  {
                username: $scope.username,
                password: $scope.password,
                userType :  $('input[name=optionsRadios]:checked','#login_form').val()
        }; 

      userService.login(data).success(function(data){
            $store.bind($scope, 'username', data.username);
            $store.bind($scope, 'userID', data.id);
            $store.bind($scope, 'userType', data.usertype);
                 if(data === null){
                       $('#loginto').prepend("<p class='alert alert-danger'><i class='icon-warning-sign'></i> Invalid account details. Check your information below.</p>");
                   }
                   else if(data.id !== null){
                        if(data.usertype === "developer")
                            window.location = "/loop-XYZ/store/developer-update";
                        else if(data.usertype === "reviewer")
                            window.location = "/loop-XYZ/store/reviewer-update";
                        else 
                            window.location = "/loop-XYZ/store/admin-view";
                   }
        })
      .error(function(response){
           alert("Data Error! :(");
       });
    };
    
   if($store.get('userID').length === 0 && window.location.toString().split('/store/')[1] !== 'home'){
       window.location = '/loop-XYZ/store/home';
   }
}]);


app.controller('developerAccountCtrl', ['$scope', '$http', 'userService', function($scope, $http,userService) {
    userService.getDeveloper()  
    .success(function(data) {
    	$scope.developerAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

app.controller('reviewerAccountCtrl', ['$scope', '$http', '$rootScope', 'userService', 'utilService', function($scope, $http, $rootScope, userService, utilService) {
    $scope.luckyReviewer = "";
    
    function load() {    
        userService.getReviewer().success(function(response) {
            $scope.reviewerAccount = response;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
        
        if(utilService.getValue("leid")!==null){
            $http.get("/loop-XYZ/loop/LE/getLE/"+utilService.getValue("leid")).success(function(response) {
                  $scope.les = response;
            });
        }
    }
    
    $scope.assignReviewer = function() {
        if(utilService.getValue("leid")!==null){
            $http.post("/loop-XYZ/loop/LE/assignReviewer?leid="+utilService.getValue("leid")+"&"+"reviewer="+$scope.luckyReviewer).success(function(response) {
                alert(response);
                window.location.reload();
            });
        }
    };    
    
    load();
}]);
app.controller('reviewerAccountCtrlLO', ['$scope', '$http', '$rootScope', 'userService', 'utilService', function($scope, $http, $rootScope, userService, utilService) {
    $scope.luckyReviewer = "";
    
    function load() {    
        userService.getReviewer().success(function(response) {
            $scope.reviewerAccount = response;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
        
        if(utilService.getValue("loid")!==null){
            $http.get("/loop-XYZ/loop/LO/getLO/"+utilService.getValue("loid")).success(function(response) {
                  $scope.los = response;
            });
        }
    }
    
    $scope.assignReviewer = function() {
        if(utilService.getValue("loid")!==null){
            $http.post("/loop-XYZ/loop/LO/assignReviewer?loid="+utilService.getValue("loid")+"&"+"reviewer="+$scope.luckyReviewer).success(function(response) {
                alert(response);
                window.location.reload();
            });
        }
    };
    
    load();
}]);
//displays all inactive accounts
app.controller('inactiveAccountCtrl', ['$scope', '$http', 'userService', function($scope, $http, userService) {
    userService.getInactive().success(function(data) {
    	$scope.inactiveAccount = data;
    }).error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

app.controller('reviewerAccountCtrlOldLO', ['$scope', '$http', '$rootScope', 'userService', 'utilService', function($scope, $http, $rootScope, userService, utilService) {
    $scope.luckyReviewer = "";
    
    function load() {    
        userService.getReviewer().success(function(response) {
            $scope.reviewerAccount = response;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
        
        if(utilService.getValue("loid")!==null){
            $http.get("/loop-XYZ/loop/LO/getOldLO/"+utilService.getValue("loid")).success(function(response) {
                  $scope.oldlos = response;
            });
        }
    }
    
    $scope.assignReviewer = function() {
        if(utilService.getValue("loid")!==null){
            $http.post("/loop-XYZ/loop/LO/assignReviewer?loid="+utilService.getValue("loid")+"&"+"reviewer="+$scope.luckyReviewer).success(function(response) {
                alert(response);
            });
        }
    };
    
    load();
}]);


//displays all blocked accounts
app.controller('blockedAccountCtrl', ['$scope', '$http', 'userService',function($scope, $http, userService) {
    userService.getBlocked().success(function(data) {
    	$scope.blockedAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//displays all new accounts
app.controller('newAccountRequestCtrl', ['$scope', '$http', 'userService', function($scope, $http, userService) {
    userService.getNewAccount().success(function(data) {
    	$scope.newAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//block an account
 app.controller('blockCtrl', ['$scope', '$http', '$rootScope', 'userService', function($scope, $http, $rootScope, userService) {
         $rootScope.userBlock = '';
   $scope.blockMe = function(){ 
        userService.blockUser($rootScope.userBlock).success(function(data) {
            window.location.href="admin-view4";
        })
        .error(function(jqXHR, status, error) {
            console.log("BLOCK USER OPERATTION ERROR : "+ error);
        });
   };
   $scope.unblockMe = function(){ 
        userService.unblockUser($rootScope.userBlock).success(function(data) {
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("UNBLOCK USER OPERATTION ERROR : "+ error);
        });
   };
   
   $scope.assignUser = function(developer) {
       $rootScope.userBlock = developer.username;
   };
}]);

//accept an account
app.controller('acceptCtrl', ['$scope', '$http', '$rootScope', 'userService', function($scope, $http, $rootScope, userService) {
    $rootScope.userAccept = '';
    $scope.acceptMe = function(){ 
        userService.acceptUser($rootScope.userAccept).success(function(data) {
            window.location.reload(true);
        }).error(function(jqXHR, status, error) {
            console.log("ACCEPT USER ERROR: "+ error);
        });
   };
    
   $scope.assignUser = function(developer) {
       $rootScope.userAccept = developer.username;
   };
}]);

})();
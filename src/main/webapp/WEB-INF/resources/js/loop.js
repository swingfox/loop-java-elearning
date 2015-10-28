/* global angular, com */

var app = angular.module('loop', ['localStorage'], function($httpProvider) {
  // Use x-www-form-urlencoded Content-Type
  $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded;charset=utf-8';

  /**
   * The workhorse; converts an object to x-www-form-urlencoded serialization.
   * @param {Object} obj
   * @return {String}
   */ 
  var param = function(obj) {
    var query = '', name, value, fullSubName, subName, subValue, innerObj, i;

    for(name in obj) {
      value = obj[name];

      if(value instanceof Array) {
        for(i=0; i<value.length; ++i) {
          subValue = value[i];
          fullSubName = name + '[' + i + ']';
          innerObj = {};
          innerObj[fullSubName] = subValue;
          query += param(innerObj) + '&';
        }
      }
      else if(value instanceof Object) {
        for(subName in value) {
          subValue = value[subName];
          fullSubName = name + '[' + subName + ']';
          innerObj = {};
          innerObj[fullSubName] = subValue;
          query += param(innerObj) + '&';
        }
      }
      else if(value !== undefined && value !== null)
        query += encodeURIComponent(name) + '=' + encodeURIComponent(value) + '&';
    }

    return query.length ? query.substr(0, query.length - 1) : query;
  };

  // Override $http service's default transformRequest
  $httpProvider.defaults.transformRequest = [function(data) {
    return angular.isObject(data) && String(data) !== '[object File]' ? param(data) : data;
  }];
});


app.controller('LoginCtrl', ['$scope', '$store', '$http', function($scope, $store,$http) {
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
        if($scope.currentUser.password==pass) {
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
        if($scope.currentUser.password==pass) {
            if(newpass==newpass2) {
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
        if($scope.newpass==$scope.newpass2) {

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

      $http.post('/loop-XYZ/loop/user/login',data).success(function(data){
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

//change email
 /*eS.controller('change', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
    $rootScope.userAccept = '';
    $scope.email = function(id){    
         alert(user.ID);
        $http.post("/loop-XYZ/loop/user/acceptUser/"+ $rootScope.userAccept)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
   
   $scope.assignUser = function(developer) {
       $rootScope.userAccept = developer.username;
   };
    
   
}]); */

app.controller('LEList', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'le.id', '');
        $store.bind($scope, 'le.title', '');
        $store.bind($scope, 'le.subject', '');
        $store.bind($scope, 'le.uploadDate', ''); 
        $store.bind($scope, 'le.description', ''); 
        $store.bind($scope, 'le.comments', ''); 
        $store.bind($scope, 'le.rating', ''); 
        $store.bind($scope, 'le.rev', ''); 

    $http.get("/loop-XYZ/loop/LE/list")    
    .success(function(data) {
        console.log(JSON.stringify(data));
    	$scope.les = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
    
     $scope.reviewLE = function(le) {
     $http.get('/loop-XYZ/loop/LE/download?id='+ le.id)    
        .success(function(data) {
            $store.bind($scope, 'le.id', data.id); 
            $store.bind($scope, 'le.title', data.title);
            $store.bind($scope, 'le.subject', data.subject); 
            $store.bind($scope, 'le.uploadDate', data.uploadDate); 
            $store.bind($scope, 'le.comments', data.comments);
            $store.bind($scope, 'le.rating', data.rating); 
            $store.bind($scope, 'le.description', data.description); 
            $store.bind($scope, 'le.rev', data.rev); 

             window.location = '/loop-XYZ/store/reviewLE-rev?leid='+data.id;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
     };
    
     $scope.GetLE = function(le) {
        console.log("SULOD....");
        $http.get('/loop-XYZ/loop/LE/download?id='+ le.id)    
        .success(function(data) {
            $store.bind($scope, 'le.id', data.id); 
            $store.bind($scope, 'le.title', data.title);
            $store.bind($scope, 'le.subject', data.subject); 
            $store.bind($scope, 'le.uploadDate', data.uploadDate); 
            $store.bind($scope, 'le.comments', data.comments);
            $store.bind($scope, 'le.rating', data.rating); 
            $store.bind($scope, 'le.description', data.description); 
            $store.bind($scope, 'le.rev', data.rev); 

         if($store.get('userType') === "developer")
             window.location = '/loop-XYZ/store/historyLE-dev?leid='+le.id;
         else
             window.location = '/loop-XYZ/store/downloadLE';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLEDeveloper = function(le) {
        $http.get('/loop-XYZ/loop/LE/download?id=' + le.id)    
        .success(function(data) {
             window.location = '/loop-XYZ/store/downloadLE?leid=' + data.id;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLEDetails_admin = function(le) {
        console.log("SULOD....");
             window.location.href = '/loop-XYZ/store/historyLE-admin?leid='+le.id;
    }; 
    
    $scope.clearLE = function(){ 
        $store.remove('le.id'); 
        $store.remove('le.title');
        $store.remove('le.subject');
        $store.remove('le.uploadDate');
        $store.remove('le.description');
        $store.remove('le.rev');

    };
   
    $scope.DownloadLE = function(le){
        console.log("SULOD");
        $http.get('/loop-XYZ/loop/LE/downloadLE/' + le.id)    
        .success(function(data){
            console.log(data);
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    };
 }]);

app.controller('LOList', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'lo.id', ''); 
            $store.bind($scope, 'lo.title','');
            $store.bind($scope, 'lo.subject',''); 
            $store.bind($scope, 'lo.rating', ''); 
            $store.bind($scope, 'lo.rev', ''); 
            $store.bind($scope, 'lo.comments',''); 
            $store.bind($scope, 'lo.uploadDate', ''); 

    $http.get("/loop-XYZ/loop/LO/list")    
    .success(function(data) {
    	$scope.los = data;
    })
    .error(function(jqXHR, status, error) {
        console.log("why??"+ error);
    });
    
    $scope.DownloadLO = function(name){
        console.log("SULOD");
        $http.get('/loop-XYZ/loop/LO/downloadLO/' + name)    
        .success(function(data){
            console.log(data);
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    };
    
    $scope.reviewLO = function(data){
        $http.get('/loop-XYZ/loop/LO/download?loid=' + data.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.title', data.title);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.rating', data.rating); 
            $store.bind($scope, 'lo.rev', data.rev); 
            $store.bind($scope, 'lo.comments', data.comments); 
            $store.bind($scope, 'lo.uploadDate', data.uploadDate); 

           
            console.log($store.get('name'));
            console.log($store.get('usertype'));
             window.location = '/loop-XYZ/store/reviewLO-rev?loid=' + data.id;
    });
};
    $scope.GetLODetails_admin = function(le) {
             window.location.href = '/loop-XYZ/store/historyLE-admin?title='+le.title;
    }; 
    // this is for reviewer
     $scope.GetLO = function(lo) {
        $http.get('/loop-XYZ/loop/LO/download?loid=' + lo.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.title', data.title);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.rating', data.rating); 
            $store.bind($scope, 'lo.rev', data.rev); 
            $store.bind($scope, 'lo.comments', data.comments); 
            $store.bind($scope, 'lo.uploadDate', data.uploadDate); 

           
            console.log($store.get('name'));
            console.log($store.get('usertype'));
         if($store.get('userType') === "developer")
             window.location = '/loop-XYZ/store/historyLO-dev';
         else
             window.location = '/loop-XYZ/store/download';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.LoHistory = function(lo) {
         //$rootScope.userBlock = lo.name;
        //console.log($rootScope.userBlock);
        $http.get('/loop-XYZ/loop/LO/listHistory/' + lo.name)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.name', data.name);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'lo.rating', data.rating); 
            $store.bind($scope, 'lo.comments', data.comments); 
            $store.bind($scope, 'lo.reviewer', data.reviewer); 
            $store.bind($scope, 'lo.description', data.description);          
         
             window.location = '/loop-XYZ/store/historyLO-dev';
         
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    
    $scope.GetLODeveloper = function(lo) {
        $http.get('/loop-XYZ/loop/LO/download/' + lo.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.name', data.name);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.dateUploaded', data.dateUploaded); 
            console.log($store.bind($scope, 'lo.description', data.description)); 
           
            console.log($store.get('name'));
            console.log($store.get('usertype'));
             window.location = '/loop-XYZ/store/download';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLO_admin = function(lo) {
        $http.get('/loop-XYZ/loop/LO/download/' + lo.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.name', data.name);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'lo.description', data.description); 
            console.log($store.get('username'));
            console.log($store.get('userType'));
            alert(lo.id);
             window.location = '/loop-XYZ/store/historyLO-admin';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    };
    
    $scope.GetLODetails_admin = function(lo) {
        $http.get('/loop-XYZ/loop/LO/download/' + lo.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.title', data.title);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.uploadDate', data.uploadDate); 
            $store.bind($scope, 'lo.description', data.description); 
            $store.bind($scope, 'lo.rev', data.rev); 
            $store.bind($scope, 'lo.rating', data.rating);
            $store.bind($scope, 'lo.status', data.status); 
            console.log($store.get('username'));
            console.log($store.get('userType'));
         if($store.get('userType') === "developer")
             window.location = '/loop-XYZ/store/historyLO-dev';
         else
             window.location = '/loop-XYZ/store/downloadLOAdmin';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.clearLO = function(){ 
        $store.remove('lo.id'); 
        $store.remove('lo.title');
        $store.remove('lo.subject');
        $store.remove('lo.uploadDate');
        $store.remove('lo.description');
        $store.remove('lo.comments');
        $store.remove('lo.rating');
        $store.remove('lo.rev'); 
    };
 }]);
 
 //list of all LO's in developer-update.jsp
 app.controller('LOListHistory', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'lo.id', '');
        $store.bind($scope, 'lo.title', '');
        $store.bind($scope, 'lo.subject', '');
        $store.bind($scope, 'lo.rating', '');
        $store.bind($scope, 'lo.dateUploaded', '');
        $store.bind($scope, 'lo.description', '');
    $http.get("/loop-XYZ/loop/LO/listHistory/")    
    .success(function(data) {
    	$scope.los = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);
 


app.controller('LODisplayDetails', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {
        console.log(""+ $routeParams.loId);
	var loID = $routeParams.loId;

    $http({
        url : '/loop-XYZ/loop/LO/LODetails', 
        method : 'GET',
        params : {id : loID}
    }).success(function(data) {
        $scope.filename = data.name;
        $scope.subject = data.subject;
        $scope.dateUploded = data.dateUploaded;
        $scope.description = data.description;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

app.controller('RevLOListCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/LO/revList", {params:{rev:'rev1'}})    
    .success(function(data) {
    	$scope.los = data;
        //console.log(""+ response);
    	//$scope.filename = data.filename;
        //console.log("" + response);
    })
    .error(function(jqXHR, status, error) {
    	//$scope.tasks = response.taskList;
        console.log(""+ error);
        //console.log("" + response);
    });
}]);


app.controller('DisplayLOCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/LO/download")    
    .success(function(data) {
    	$scope.filename = 'response.taskList';
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

app.controller('developerAccountCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/developer")    
    .success(function(data) {
    	$scope.developerAccount = data;
    })
    .error(function(jqXHR, status, error) {
    	//$scope.tasks = response.taskList;
        console.log(""+ error);
        //console.log("" + response);
    });
}]);

app.controller('reviewerAccountCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
    $scope.luckyReviewer = "";
    
    function load() {    
    $http.get("/loop-XYZ/loop/user/reviewer")    
    .success(function(response) {
    	$scope.reviewerAccount = response;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
    if(getValue("leid")!=null)
    $http.get("/loop-XYZ/loop/LE/getLE/"+getValue("leid")).success(function(response) {
        $scope.les = response;
    });
    }
    
    $scope.assignReviewer = function() {
        $http.post("/loop-XYZ/loop/LE/assignReviewer?leid="+getValue("leid")+"&"+"reviewer="+$scope.luckyReviewer).success(function(response) {
            alert(response);
        });
    }
    
    function getValue(functionType) {
        var currentURL = window.location.toString().split('?')[1];
        if(currentURL != null) {
        var temp = currentURL.split('=');
            if(temp[0] == functionType) {
                return temp[1];
            }
        } else {
            return null;
        }
    }
    
    load();
}]);

//displays all inactive accounts
app.controller('inactiveAccountCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/inactive")    
    .success(function(data) {
    	$scope.inactiveAccount = data;
        //console.log(""+ response);
    	//$scope.filename = data.filename;
        //console.log("" + response);
    })
    .error(function(jqXHR, status, error) {
    	//$scope.tasks = response.taskList;
        console.log(""+ error);
        //console.log("" + response);
    });
}]);


//displays all blocked accounts
app.controller('blockedAccountCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/block")    
    .success(function(data) {
    	$scope.blockedAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//displays all new accounts
app.controller('newAccountRequestCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/newAccountRequests")    
    .success(function(data) {
    	$scope.newAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//block an account
 app.controller('blockCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
         $rootScope.userBlock = '';
   $scope.blockMe = function(){ 
        $http.post("/loop-XYZ/loop/user/blockUser/"+ $rootScope.userBlock)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.href="admin-view4";
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
   $scope.unblockMe = function(){ 
        $http.post("/loop-XYZ/loop/user/unblockUser/"+ $rootScope.userBlock)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
   
   $scope.assignUser = function(developer) {
       $rootScope.userBlock = developer.username;
   };
    
   
}]);

//accept an account
app.controller('acceptCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
    $rootScope.userAccept = '';
    $scope.acceptMe = function(){ 
        $http.post("/loop-XYZ/loop/user/acceptUser/"+ $rootScope.userAccept)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
    
   $scope.assignUser = function(developer) {
       $rootScope.userAccept = developer.username;
   };
    
   
}]);

app.controller('LECtrl', ['$scope', '$store', '$http', '$rootScope', function($scope, $store, $http, $rootScope) {
    $rootScope.LEFunc = '';
    
    $scope.comment = '';
    $scope.rating = '1';
    $scope.submitReviewedLE = function(){
    $http.post("/loop-XYZ/loop/LE/reviewLE?leid="+getValue("leid")+'&'+"rating="+$scope.rating+'&'+"comment="+$scope.comment).success(function(response) {
            alert(response);
            if(response === true)
                windows.location = '/loop-XYZ/store/reviewer-le';
        });
    };
    
     $scope.$watch("rating", function(newVal) {
        console.log(newVal);
    });
    
    $scope.changeRating = function(rate){
      $scope.rating = rate;
    };
    
    function getValue(functionType) {
        var currentURL = window.location.toString().split('?')[1];
        if(currentURL != null) {
        var temp = currentURL.split('=');
            if(temp[0] == functionType) {
                return temp[1];
            }
        } else {
            return null;
        }
    };
    
    $scope.acceptMe = function(){ 
        $http.post("/loop-XYZ/loop/LE/acceptLE/"+ $rootScope.LEFunc)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
   
   $scope.demoteMe = function(){ 
        $http.post("/loop-XYZ/loop/LE/demoteLE/"+ $rootScope.LEFunc)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
    
   $scope.assignUser = function(le) {
       $rootScope.LEFunc = le.id;
   };
    
   
}]);

app.controller('LOCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
    $rootScope.LEFunc = '';
    $scope.comment = '';
    $scope.rating = '1';

    
     $scope.$watch("rating", function(newVal) {
        console.log(newVal);
    });
    
    $scope.changeRating = function(rate){
      $scope.rating = rate;
    };
    $scope.acceptMe = function(){ 
        $http.post("/loop-XYZ/loop/LO/acceptLO/"+ $rootScope.LEFunc)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
   
     
    $scope.submitReviewedLO = function(){
    $http.post("/loop-XYZ/loop/LO/reviewLO?loid="+getValue("loid")+'&'+"rating="+$scope.rating+'&'+"comment="+$scope.comment).success(function(response) {
            if(response === true)
                window.location = '/loop-XYZ/store/reviewer-update';
        });
    };
    
    
    
    function getValue(functionType) {
        var currentURL = window.location.toString().split('?')[1];
        if(currentURL != null) {
        var temp = currentURL.split('=');
            if(temp[0] == functionType) {
                return temp[1];
            }
        } else {
            return null;
        }
    };
   
   $scope.demoteMe = function(){ 
        $http.post("/loop-XYZ/loop/LO/demoteLO/"+ $rootScope.LEFunc)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
    
   $scope.assignUser = function(lo) {
       $rootScope.LEFunc = lo.id;
   };
    
   
}]);

app.controller('demoteLECtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
    $rootScope.LEDemote = '';
    $scope.acceptMe = function(){ 
        $http.post("/loop-XYZ/loop/user/demoteLE/"+ $rootScope.LEDemote)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
   };
    
   $scope.assignUser = function(le) {
       $rootScope.LEDemote = le.id;
   };
    
   
}]);

app.controller('advanceSearchController', ['$scope', '$http', '$rootScope', function($scope,$http,$rootScope) {
    $scope.searchTitle = "";
    $scope.searchSubject = "";
    $scope.searchToDate = "";
    $scope.searchOrderBy = "";
    $scope.showSearchSubject = false;
    $scope.showSearchDate = false;
    $scope.showSearchOrderBy = false;
    $scope.los = [];
    
    $scope.showSubject = function() {
        if($scope.showSearchSubject==false)
            $scope.showSearchSubject = true;
        else
            $scope.showSearchSubject = false;
    }
    
    $scope.showDate = function() {
        if($scope.showSearchDate==false)
            $scope.showSearchDate = true;
        else
            $scope.showSearchDate = false;
    }
    
    $scope.showOrderBy = function() {
        if($scope.showSearchOrderBy==false)
            $scope.showSearchOrderBy = true;
        else
            $scope.showSearchOrderBy = false;
    }
    
    $scope.showResults = function() {
        var URL = "advanced-search-dev?";
        if($scope.searchTitle.length>0)
            URL += "lo=" + $scope.searchTitle + "&";
        if($scope.showSearchSubject==true)
            URL += "subject=" + $scope.searchSubject + "&";
        if($scope.showSearchDate==true) {
            URL += "from=" + document.getElementById("dateFrom").value + "&" + "to=" + document.getElementById("dateTo").value + "&";
        }
        if($scope.showSearchOrderBy==true)
            URL += "orderBy=" + $scope.searchOrderBy + "&";
        URL += "nan";
        window.location.href = URL;
    }
}]);
/*eS.controller('newAccountRequestCtrl', ['$scope', '$store','$http','$rootScope', function($scope, $store,$http, $rootScope) {
     $rootScope.userAccept = '';
     $store.bind($scope, 'userId', '');
     $scope.userId = '';
    $http.get("/loop-XYZ/loop/user/newAccountRequests")    
    .success(function(data) {
    	$scope.userAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
    
    $scope.accept = function() {
        $http.post("/loop-XYZ/loop/user/acceptUser/"+ $rootScope.userAccept)
        .success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("jsjdjs"+ error);
        });
    };      
    
    $scope.assignUser = function(user) {
       $rootScope.userAccept = user.username;
   };
}]);*/

var ls = angular.module('localStorage',[]);
 
ls.factory("$store",function($parse){
	/**
	 * Global Vars
	 */
	var storage = (typeof window.localStorage === 'undefined') ? undefined : window.localStorage,
		supported = !(typeof storage == 'undefined' || typeof window.JSON == 'undefined');

	var privateMethods = {
		/**
		 * Pass any type of a string from the localStorage to be parsed so it returns a usable version (like an Object)
		 * @param res - a string that will be parsed for type
		 * @returns {*} - whatever the real type of stored value was
		 */
		parseValue: function(res) {
			var val;
			try {
				val = JSON.parse(res);
				if (typeof val == 'undefined'){
					val = res;
				}
				if (val == 'true'){
					val = true;
				}
				if (val == 'false'){
					val = false;
				}
				if (parseFloat(val) == val && !angular.isObject(val) ){
					val = parseFloat(val);
				}
			} catch(e){
				val = res;
			}
			return val;
		}
	};
	var publicMethods = {
		/**
		 * Set - let's you set a new localStorage key pair set
		 * @param key - a string that will be used as the accessor for the pair
		 * @param value - the value of the localStorage item
		 * @returns {*} - will return whatever it is you've stored in the local storage
		 */
		set: function(key,value){
			if (!supported){
				try {
					$.cookie(key, value);
					return value;
				} catch(e){
					console.log('Local Storage not supported, make sure you have the $.cookie supported.');
				}
			}
			var saver = JSON.stringify(value);
			 storage.setItem(key, saver);
			return privateMethods.parseValue(saver);
		},
		/**
		 * Get - let's you get the value of any pair you've stored
		 * @param key - the string that you set as accessor for the pair
		 * @returns {*} - Object,String,Float,Boolean depending on what you stored
		 */
		get: function(key){
			if (!supported){
				try {
					return privateMethods.parseValue($.cookie(key));
				} catch(e){
					return null;
				}
			}
			var item = storage.getItem(key);
			return privateMethods.parseValue(item);
		},
		/**
		 * Remove - let's you nuke a value from localStorage
		 * @param key - the accessor value
		 * @returns {boolean} - if everything went as planned
		 */
		remove: function(key) {
			if (!supported){
				try {
					$.cookie(key, null);
					return true;
				} catch(e){
					return false;
				}
			}
			storage.removeItem(key);
			return true;
		},
		/**
	         * Bind - let's you directly bind a localStorage value to a $scope variable
	         * @param $scope - the current scope you want the variable available in
	         * @param key - the name of the variable you are binding
	         * @param def - the default value (OPTIONAL)
	         * @returns {*} - returns whatever the stored value is
	         */
	        bind: function ($scope, key, def) {
	            def = def || '';
	            if (!publicMethods.get(key)) {
	                publicMethods.set(key, def);
	            }
	            $parse(key).assign($scope, publicMethods.get(key));
	            $scope.$watch(key, function (val) {
	                publicMethods.set(key, val);
	            }, true);
	            return publicMethods.get(key);
	        }
	};
	return publicMethods;
});

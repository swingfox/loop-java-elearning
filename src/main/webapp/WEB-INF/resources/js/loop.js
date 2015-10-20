/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* global angular, com */

var eS = angular.module('loop', ['localStorage'], function($httpProvider) {
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


eS.controller('LoginCtrl', ['$scope', '$store', '$http', function($scope, $store,$http) {
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

  $scope.login = function(){
        var data =  {
                            username: $scope.username,
                            password: $scope.password,
                            id : $scope.userID,
                            userType :  $scope.userType,
                            email: $scope.email
                    };
        $http.post("/loop-XYZ/loop/user/login",data).success(function(response){
            alert (response);
            
        }). error(function(response){
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

eS.controller('LEList', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'le.id', '');
        $store.bind($scope, 'le.name', '');
        $store.bind($scope, 'le.subject', '');
        $store.bind($scope, 'le.dateUploaded', '');
        $store.bind($scope, 'le.description', '');
    $http.get("/loop-XYZ/loop/LE/list")    
    .success(function(data) {
        console.log(JSON.stringify(data));
    	$scope.les = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
    
     $scope.GetLE = function(le) {
        console.log("SULOD....");
        $http.get('/loop-XYZ/loop/LE/download/' + le.id)    
        .success(function(data) {
            $store.bind($scope, 'le.id', data.id); 
            $store.bind($scope, 'le.name', data.name);
            $store.bind($scope, 'le.subject', data.subject); 
            $store.bind($scope, 'le.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'le.description', data.description); 
         if($store.get('userType') === "developer")
             window.location = '/loop-XYZ/store/historyLE-dev';
         else
             window.location = '/loop-XYZ/store/downloadLE';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLEDeveloper = function(le) {
        $http.get('/loop-XYZ/loop/LE/download/' + le.id)    
        .success(function(data) {
            $store.bind($scope, 'le.id', data.id); 
            $store.bind($scope, 'le.name', data.name);
            $store.bind($scope, 'le.subject', data.subject); 
            $store.bind($scope, 'le.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'le.description', data.description); 

             window.location = '/loop-XYZ/store/downloadLE';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLEDetails_admin = function(le) {
        console.log("SULOD....");
        $http.get('/loop-XYZ/loop/LE/downloadLE/' + le.id)    
        .success(function(data) {
            $store.bind($scope, 'le.id', data.id); 
            $store.bind($scope, 'le.name', data.name);
            $store.bind($scope, 'le.subject', data.subject); 
            $store.bind($scope, 'le.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'le.description', data.description); 
         
             window.location = '/loop-XYZ/store/historyLE-admin';
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.clearLE = function(){ 
        $store.remove('le.id'); 
        $store.remove('le.name');
        $store.remove('le.subject');
        $store.remove('le.dateUploaded');
        $store.remove('le.description');
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
 

eS.controller('LOList', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'lo.id', '');
        $store.bind($scope, 'lo.name', '');
        $store.bind($scope, 'lo.subject', '');
        $store.bind($scope, 'lo.rating', '');
        $store.bind($scope, 'lo.dateUploaded', '');
        $store.bind($scope, 'lo.description', '');
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
    // this is for reviewer
     $scope.GetLO = function(lo) {
        $http.get('/loop-XYZ/loop/LO/download/' + lo.id)    
        .success(function(data) {
            $store.bind($scope, 'lo.id', data.id); 
            $store.bind($scope, 'lo.name', data.name);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.dateUploaded', data.dateUploaded); 
            console.log($store.bind($scope, 'lo.description', data.description)); 
           
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
            $store.bind($scope, 'lo.name', data.name);
            $store.bind($scope, 'lo.subject', data.subject); 
            $store.bind($scope, 'lo.dateUploaded', data.dateUploaded); 
            $store.bind($scope, 'lo.description', data.description); 
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
        $store.remove('lo.name');
        $store.remove('lo.subject');
        $store.remove('lo.dateUploaded');
        $store.remove('lo.description');
    };
 }]);
 
 //list of all LO's in developer-update.jsp
 eS.controller('LOListHistory', ['$scope', '$store', '$http', function($scope, $store, $http) {
        $store.bind($scope, 'lo.id', '');
        $store.bind($scope, 'lo.name', '');
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
 


eS.controller('LODisplayDetails', ['$scope', '$http', '$routeParams', function($scope, $http, $routeParams) {
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

eS.controller('RevLOListCtrl', ['$scope', '$http', function($scope, $http) {
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


eS.controller('DisplayLOCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/LO/download")    
    .success(function(data) {
    	$scope.filename = 'response.taskList';
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

eS.controller('developerAccountCtrl', ['$scope', '$http', function($scope, $http) {
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

eS.controller('reviewerAccountCtrl', ['$scope', '$http', function($scope, $http) {
    
    function load() {    
    $http.get("/loop-XYZ/loop/user/reviewer")    
    .success(function(data) {
    	$scope.reviewerAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
    $http.get("/loop-XYZ/loop/LE/list").success(function(response) {
       $scope.les = response; 
    });
    }
    
    $scope.assignReviewer = function(reviewer) {
        $http.post("/loop-XYZ/loop/user/assignReviewer?leid="+getValue("leid")+"reviewer="+reviewer).success(function(response) {
            alert(response);
        });
    }
    
    function getValue(functionType) {
        var currentURL = window.location.toString().split('?')[1].split('&');
        var flag = 0;
        for(var i=0; i < currentURL.length; i++) {
            var temp = currentURL[i].split('=')[0];
            if(temp == functionType) {
                return temp[j+1];
            }
        }
    }
    
    load();
}]);

//displays all inactive accounts
eS.controller('inactiveAccountCtrl', ['$scope', '$http', function($scope, $http) {
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
eS.controller('blockedAccountCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/block")    
    .success(function(data) {
    	$scope.blockedAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//displays all new accounts
eS.controller('newAccountRequestCtrl', ['$scope', '$http', function($scope, $http) {
    $http.get("/loop-XYZ/loop/user/newAccountRequests")    
    .success(function(data) {
    	$scope.newAccount = data;
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

//block an account
 eS.controller('blockCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
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
 eS.controller('acceptCtrl', ['$scope', '$http', '$rootScope', function($scope, $http, $rootScope) {
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

eS.controller('advanceSearchController', ['$scope', '$http', '$rootScope', function($scope,$http,$rootScope) {
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

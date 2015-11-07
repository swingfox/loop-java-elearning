/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){
  "use strict";
  
app.controller('LEList', ['$scope', '$store', '$http', 'leService', function($scope, $store, $http,leService) {
    $store.bind($scope, 'le.id', '');
                    $store.bind($scope, 'le.title', '');
                    $store.bind($scope, 'le.subject', '');
                    $store.bind($scope, 'le.uploadDate', ''); 
                    $store.bind($scope, 'le.description', ''); 
                    $store.bind($scope, 'le.comments', ''); 
                    $store.bind($scope, 'le.rating', ''); 
                    $store.bind($scope, 'le.rev', ''); 

    leService.getList().success(function(data) {
    	$scope.les = data;
    })
    .error(function(jqXHR, status, error) {
        console.log("LE LIST ERROR : "+ error);
    });
    
     $scope.reviewLE = function(le) {
     leService.getSpecificLE(le.id)    
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
         console.log("CHECK");
        leService.getSpecificLE(le.id)
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
        leService.getSpecificLE(le.id)    
        .success(function(data) {
             window.location = '/loop-XYZ/store/downloadLE?leid=' + data.id;
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    }; 
    
    $scope.GetLEDetails_admin = function(le) {
            window.location.href = '/loop-XYZ/store/historyLE-admin?leid='+le.id;
    }; 
    
    $scope.clearLE = function(){ 
        $store.remove('le.id'); 
                    $store.remove('le.title');
                    $store.remove('le.subject');
                    $store.remove('le.uploadDate');
                    $store.remove('le.description');
                    $store.remove('le.rev');
                    $store.remove('le.comments');
                    $store.remove('le.rating');
    };
   
    $scope.DownloadLE = function(le){
        $http.get('/loop-XYZ/loop/LE/downloadLE/' + le.id)    
        .success(function(data){
            console.log(data);
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    };
 }]);
 
 app.controller('LECtrl', ['$scope', '$store', '$http', '$rootScope', 'utilService', 'leService', function($scope, $store, $http, $rootScope, utilService, leService) {
    $rootScope.LEFunc = '';
    
    $scope.comment = '';
    $scope.rating = '1';
    $scope.submitReviewedLE = function(){
    var data = {
        id : utilService.getValue("leid"),
        rating : $scope.rating,
        comment : $scope.comment
    };
        leService.reviewLE(data).success(function(response) {
                alert(response);
                if(response === true)
                    window.location = '/loop-XYZ/store/reviewer-le';
        });
    };
    
    $scope.$watch("rating", function(newVal) {
        console.log(newVal);
    });
    
    $scope.changeRating = function(rate){
      $scope.rating = rate;
    };
    
    $scope.acceptMe = function(){ 
        leService.acceptLE($rootScope.LEFunc).success(function(data) {
            console.log("SUCCESS"); 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("ACCEPT LE FAILED : "+ error);
        });
   };
   
   $scope.demoteMe = function(){ 
        leService.demoteLE($rootScope.LEFunc).success(function(data) {
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("DEMOTE LE FAILED : "+ error);
        });
   };
   
   $scope.deleteMe = function(){ 
        leService.deleteLE(utilService.getValue("leid"))
        .success(function(data) { 
            alert("Successfully deleted!");
            window.location.href = 'admin-view6';
        })
        .error(function(jqXHR, status, error) {
            console.log("DELETE LE FAILED : "+ error);
        });
   };
   
   $scope.reviewRedirect = function(){ 
        window.location.href = '/loop-XYZ/store/downloadLEAdmin?leid='+utilService.getValue("leid");
   };
    
   $scope.assignUser = function(le) {
       $rootScope.LEFunc = le.id;
   };
}]);

app.controller('demoteLECtrl', ['$scope', '$http', '$rootScope', 'leService', function($scope, $http, $rootScope,leService) {
    $rootScope.LEDemote = '';
    $scope.acceptMe = function(){ 
        leService.demoteLE($rootScope.LEDemote).success(function(data) {
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("DEMOTE LE FAILED : "+ error);
        });
   };
    
   $scope.assignUser = function(le) {
       $rootScope.LEDemote = le.id;
   };
}]);

})();
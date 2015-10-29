/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function(){
  "use strict";

app.controller('LOList', ['$scope', '$store', '$http' , 'loService', function($scope, $store, $http, loService) {
        $store.bind($scope, 'lo.id', ''); 
            $store.bind($scope, 'lo.title','');
            $store.bind($scope, 'lo.subject',''); 
            $store.bind($scope, 'lo.rating', ''); 
            $store.bind($scope, 'lo.rev', ''); 
            $store.bind($scope, 'lo.comments',''); 
            $store.bind($scope, 'lo.uploadDate', ''); 

    loService.getList().success(function(data) {
    	$scope.los = data;
    })
    .error(function(jqXHR, status, error) {
        console.log("why??"+ error);
    });
    
    $scope.DownloadLO = function(name){
        $http.get('/loop-XYZ/loop/LO/downloadLO/' + name)    
        .success(function(data){
            console.log(data);
        })
        .error(function(jqXHR, status, error) {
            console.log(""+ error);
        });
    };
    
    $scope.reviewLO = function(data){
        loService.getSpecificLO(data).success(function(data) {
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
        loService.getSpecificLO(lo.id).success(function(data) {
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
 app.controller('LOListHistory', ['$scope', '$store', '$http', 'loService' ,function($scope, $store, $http, loService) {
        $store.bind($scope, 'lo.id', '');
        $store.bind($scope, 'lo.title', '');
        $store.bind($scope, 'lo.subject', '');
        $store.bind($scope, 'lo.rating', '');
        $store.bind($scope, 'lo.dateUploaded', '');
        $store.bind($scope, 'lo.description', '');
    loService.loListHistory().success(function(data) {
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
        $scope.dateUploaded = data.dateUploaded;
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
    })
    .error(function(jqXHR, status, error) {
        console.log(""+ error);
    });
}]);

app.controller('LOCtrl', ['$scope', '$http', '$rootScope', 'utilService', 'loService', function($scope, $http, $rootScope, utilService,loService) {
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
        loService.acceptLO($rootScope.LEFunc).success(function(data) {
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("LO ACCEPT FAILED: "+ error);
        });
   };
   
     
    $scope.submitReviewedLO = function(){
        var data = {
            id : utilService.getValue("loid"),
            rating : $scope.rating,
            comment : $scope.comment
        };
        loService.reviewLO(data).success(function(response) {
            if(response === true)
                window.location = '/loop-XYZ/store/reviewer-update';
        });
    };
   
   $scope.demoteMe = function(){ 
        loService.demoteLO($rootScope.LEFunc)
        .success(function(data) { 
            window.location.reload(true);
        })
        .error(function(jqXHR, status, error) {
            console.log("DEMOTE LO FAILED : "+ error);
        });
   };
    
   $scope.assignUser = function(lo) {
       $rootScope.LEFunc = lo.id;
   };
}]);
})();
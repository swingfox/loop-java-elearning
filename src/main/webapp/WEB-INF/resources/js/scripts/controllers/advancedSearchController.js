/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function(){
  "use strict";
app.controller('advanceSearchController', ['$scope', '$http', '$rootScope', 'loService', function($scope,$http,$rootScope, loService) {
    $scope.searchTitle = "";
    $scope.searchSubject = "";
    $scope.searchToDate = "";
    $scope.searchOrderBy = "";
    $scope.showSearchSubject = false;
    $scope.showSearchDate = false;
    $scope.showSearchOrderBy = false;
    $scope.los = [];
    
    $scope.showSubject = function() {
        if($scope.showSearchSubject===false)
            $scope.showSearchSubject = true;
        else
            $scope.showSearchSubject = false;
    };
    
    $scope.showDate = function() {
        if($scope.showSearchDate===false)
            $scope.showSearchDate = true;
        else
            $scope.showSearchDate = false;
    };
    
    $scope.showOrderBy = function() {
        if($scope.showSearchOrderBy===false)
            $scope.showSearchOrderBy = true;
        else
            $scope.showSearchOrderBy = false;
    };
    
    $scope.showResults = function() {
        var URL = "advanced-search-dev-results?";
        if($scope.searchTitle.length>0)
            URL += "lo=" + $scope.searchTitle + "&";
        if($scope.showSearchSubject===true)
            URL += "subject=" + $scope.searchSubject + "&";
        if($scope.showSearchDate===true) {
            URL += "from=" + document.getElementById("dateFrom").value + "&" + "to=" + document.getElementById("dateTo").value + "&";
        }
        if($scope.showSearchOrderBy===true)
            URL += "orderBy=" + $scope.searchOrderBy + "&";
        //URL += "nan";
        window.location.href = URL;
    };       
        
}]);

})();
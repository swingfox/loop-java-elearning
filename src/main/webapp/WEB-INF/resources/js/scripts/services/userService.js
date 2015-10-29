/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
(function(){
  "use strict";
        app.factory('userService', function($http){
            return {
                getReviewer : function(){
                    return $http.get("/loop-XYZ/loop/user/reviewer");
                },
                login: function(data){
                    return $http.post("/loop-XYZ/loop/user/login",data);
                },
                getDeveloper : function(){
                    return $http.get("/loop-XYZ/loop/user/developer");
                },
                getInactive : function(){
                    return $http.get("/loop-XYZ/loop/user/inactive");
                },
                getBlocked : function(){
                    return $http.get("/loop-XYZ/loop/user/block");
                },
                getNewAccount : function(){
                    return $http.get("/loop-XYZ/loop/user/newAccountRequests");
                },
                blockUser : function(data){
                    return $http.post("/loop-XYZ/loop/user/blockUser/"+ data);
                },
                unblockUser : function(data){
                    return $http.post("/loop-XYZ/loop/user/unblockUser/"+ data);
                },
                acceptUser : function(data){
                    return $http.post("/loop-XYZ/loop/user/acceptUser/"+ data);
                }
            };
        });
})();

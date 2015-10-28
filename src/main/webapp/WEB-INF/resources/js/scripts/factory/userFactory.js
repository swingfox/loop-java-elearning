/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.factory('userFactory', function($http){
    return {
        getReviewer : function(){
            return $http.get("/loop-XYZ/loop/user/reviewer");
        },
        login: function(data){
            return $http.post("/loop-XYZ/loop/user/login",data);
        }
    };
});
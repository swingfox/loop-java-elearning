/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function(){
  "use strict";
        app.factory('leService',function($http){
            return {
                getList : function(){
                    return $http.get("/loop-XYZ/loop/LE/list");
                },
                getSpecificLE : function(data){
                    return $http.get('/loop-XYZ/loop/LE/download?id='+ data);    
                },
                reviewLE : function(data){
                    return $http.post("/loop-XYZ/loop/LE/reviewLE?leid="+data.id+'&'+"rating="+data.rating+'&'+"comment="+data.comment);
                },
                acceptLE : function(data){
                    return $http.post("/loop-XYZ/loop/LE/acceptLE/"+ data);
                },
                demoteLE : function(data){
                    return $http.post("/loop-XYZ/loop/LE/demoteLE/"+ data);
                }
            };
        });
})();

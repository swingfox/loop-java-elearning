/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function(){
  "use strict";

  app.factory('loService', function($http){
            return {
                getList : function(){
                    return $http.get("/loop-XYZ/loop/LO/list");
                },
                getSpecificLO: function(data){
                    return $http.get('/loop-XYZ/loop/LO/download?loid=' + data);
                },
                acceptLO : function(data){
                    return $http.post("/loop-XYZ/loop/LO/acceptLO/"+ data);
                },
                demoteLO : function(data){
                    return $http.post("/loop-XYZ/loop/LO/demoteLO/"+ data);
                },
                deleteLO : function(data){
                    return $http.post("/loop-XYZ/loop/LO/deleteLO/"+ data);
                },
                reviewLO : function(data){
                    return $http.post("/loop-XYZ/loop/LO/reviewLO?loid="+data.id+'&'+"rating="+data.rating+'&'+"comment="+data.comment);
                },
                searchLO : function(data){
                    return $http.get("/loop-XYZ/loop/LO/searchLO?lo="+data.lo+'&'+"subject="+data.subject+'&'+"from="+data.from+'&'+"to="+data.to+'&'+"orderBy="+data.orderBy);
                },
                loListHistory : function(){
                    return $http.get("/loop-XYZ/loop/LO/listHistory/");
                }
            };
        });
})();
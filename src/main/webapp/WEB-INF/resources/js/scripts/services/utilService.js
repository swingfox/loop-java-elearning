/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


(function(){
  "use strict";
  
    app.factory('utilService', function(){
        return {
            getValue : function(data){
                try{
                    var currentURL = window.location.toString().split('?')[1];
                        if(currentURL !== null) {
                            var temp = currentURL.split('=');
                            if(temp[0] === data) {
                                return temp[1];
                            }
                        } else {
                            return null;
                        }  
                 }
                 catch(err){
                     return null;
                 }
            },
            getVal : function(data){
                try{
                    var currentURL = window.location.toString().split('?')[1];
                        if(currentURL !== null) {
                            var x = [];
                            var x = currentURL.split('&');
                            var i;
                            for(i = 0; i<x.length; i++) {
                                console.log("JULIE: " + x[i]);
                                var temp = x[i].split('=');
                                if(temp[0] === data) {
                                    return temp[1];
                                }
                            }   
                        } else {
                            return null;
                        }  
                 }
                 catch(err){
                     return null;
                 }
            },
        };
    });
})();
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
        };
    });
})();
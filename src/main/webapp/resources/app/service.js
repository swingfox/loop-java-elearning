/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="model.ts" />
var service;
(function (service) {
    var LoopService = (function () {
        function LoopService($http) {
            this.httpService = $http;
        }
        LoopService.prototype.queryElement = function (searchKey) {
            return this.httpService.get('/query/' + searchKey);
        };
        return LoopService;
    })();
    service.LoopService = LoopService;
    angular.module('serverComm', []).service('loopService', function ($http) { return new LoopService($http); });
})(service || (service = {}));

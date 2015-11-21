/// <reference path="../typings/angularjs/angular.d.ts" />
/// <reference path="model.ts" />
module service {

	import ElementMeta = model.LearningElementMeta;

	export class LoopService {
		httpService: ng.IHttpService;
		constructor($http:ng.IHttpService) {
			this.httpService = $http;
		}

		public queryElement(searchKey:string) : ng.IHttpPromise<ElementMeta> {
			return this.httpService.get('/query/' + searchKey);
		}
	}

	angular.module('serverComm',[]).service('loopService', ($http) => { return new LoopService($http); });
}
app = angular.module("admin-app",["ngRoute"]);

app.config(function($routeProvider){
	$routeProvider
	.when("/product",{
		templateUrl:"/admin/product/index.html",
		controller:"product-ctrl"
	})
	.when("/user",{
		templateUrl:"/admin/user/index.html",
		controller:"account-ctrl"
	})
	.when("/order",{
		templateUrl:"/admin/orders/index.html",
		controller:"order-ctrl"
	})
	.when("/authorize",{
		templateUrl:"/admin/authority/index.html",
		controller:"authority-ctrl"
	})
	
	.otherwise({
		templateUrl:"/admin/Home.html",
	})
	
	
	
})

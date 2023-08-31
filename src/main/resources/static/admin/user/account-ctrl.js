app.controller("account-ctrl", function($scope, $http) {

	$scope.items = [];
	$scope.cates = [];
	$scope.form = {};

	$scope.initialize = function() {
		//load accounts
		$http.get("/rest/accounts").then(resp => {
			$scope.items = resp.data;
			$scope.items.forEach(item => {
				item.date = new Date(item.date)
			})
		});

		
	}
	
	$scope.initialize();

	$scope.reset = function() {
		$scope.form = {};
	}
	$scope.edit = function(item) {
		$scope.form = angular.copy(item);
		$(".nav-tabs a:eq(0)").tab('show')
	}
	$scope.create = function() {
		var item = angular.copy($scope.form);
		$http.post(`/rest/accounts`,item).then(resp =>{
			resp.data.date = new Date(resp.data.date)
			$scope.items.push(resp.data);
			$scope.reset();
		
		}).catch(error =>{
			alert("Lỗi thêm tài khoản")
			console.log("Error",error);
		})
		
	}
	
	$scope.delete = function(item) {
		$http.delete(`/rest/accounts/${item.username}`,item).then(resp=>{
			var index=$scope.items.findIndex(p => p.username==item.username);
			$scope.items.splice(index,1);
			$scope.reset();
		
		}).catch(error=>{
			alert("Lỗi xóa tài khoản");
			console.log("Error",error);
		});
	}
	
	$scope.update = function() {
		var item = angular.copy($scope.form);
		$http.put(`/rest/accounts/${item.username}`,item).then(resp=>{
			var index=$scope.items.findIndex(p => p.username == item.username);
			$scope.items[index]=item;
			
		}).catch(error=>{
			alert("Lỗi cập nhật tài khoản");
			console.log("Error",error);
		});
	}


	$scope.imageChanged = function(files) {

		var data = new FormData();
		data.append('file', files[0]);
		$http.post('/rest/upload/user', data, {
			transformRequest: angular.identity,
			headers: { 'Content-Type': undefined }
		}).then(resp => {
			$scope.form.images = resp.data.name;
		}).catch(error => {
			alert("Lỗi upload hình ảnh")
			console.log("Error", error);
		})

	}
	
	$scope.pager = {
		
		page: 0,
		size: 10,
		get items(){
			
			var start = this.page * this.size;
			return $scope.items.slice(start, start + this.size);
		},
		get count(){
			return Math.celi(1.0 * $scope.items.length / this.size);
		},
		first(){
			this.page = 0;
		},
		prev(){
			this.page--;
			if(this.page < 0){
				this.last();
			}
		},
		next(){
			this.page++;
			if(this.page >= this.count){
				this.first();
			}
		},
		last(){
			this.page = this.count - 1;
		}
		
	}

});
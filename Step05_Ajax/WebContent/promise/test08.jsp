<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/promise/test08.jsp</title>
</head>
<body>
<h1>Promise 테스트</h1>
<script>
	function getPromise(job){
		let p1=new Promise(function(resolve, reject){
			setTimeout(function(){
				console.log(job+" 수행함");
				resolve();
			}, 5000);
		});
		return p1;
	}
	
	getPromise("달리기")
	.then(function(){
		return getPromise("쉬기");
	})
	.then(function(){
		return getPromise("물마시기");
	})
	.then(function(){
		console.log("finish!");
	});
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
// 	function test() {
		$.ajax({
			url:"apitest",
			type:"POST",
			
			success:function(list) {
				var data = JSON.parse(list);
				var	html = '';
				for(var i=0; i<data.length; i++) {
					html += '<h1>'+data[i].movieNm+'</h1>'
				}
				$("#movie").html(html);
			},
			error(data) {
				alert('실패!');
			}
		})
// 	}
</script>
</head>
<body>
	<h1>영화 이름!</h1>
	<label id="movie">
	
	</label>
	<button type="button" onclick="test()">버튼</button>

</body>
</html>
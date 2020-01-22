<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Todo List</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-md-offset-12" id="form">
				<center>
					<b class="registration">Todo Items</b>
				</center>
				<a href="${pageContext.request.contextPath}/todo/create"
					type="button" class="btn btn-primary">New</a>
				<table class="table">
					<thead>
						<tr>
							<td><label>Title</label></td>
							<td><label>Completed</label></td>
							<td><label>Action</label></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="todo" items="${todos}">
							<tr>
								<td>${todo.title}</td>
								<td>${todo.completed}</td>
								<td><a
									href="${pageContext.request.contextPath}/todo/edit/${todo.id}" class="btn btn-primary">Edit</a>
									&nbsp; <a
									href="${pageContext.request.contextPath}/todo/complete/${todo.id}" class="btn btn-primary">Complete</a>
									&nbsp; <a
									href="${pageContext.request.contextPath}/todo/delete/${todo.id}" class="btn btn-danger">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>

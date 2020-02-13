<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/css/style.css">

<title>${modeTitle}Todo</title>
</head>
<body>
<body>
	<nav class="navbar navbar-expand-lg" role="navigation">
		<div class="container">
		<p>
                <a href="${pageContext.request.contextPath}/" class="btn btn-info btn-lg">
                  <span class="glyphicon glyphicon-home"></span> Home
                </a>
              </p>
		</div>
	</nav>
	<div class="container">
		<div class="col-md-12 col-md-offset-12">
			<center>
				<b class="registration">${modeTitle}TODO</b>
			</center>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-md-offset-12" id="form">
				<form:form id="formvalidation"
					action="${pageContext.request.contextPath}/todo/${mode}"
					method="post" modelAttribute="todo">
					<div class="form-group">
						<label>Title: </label> 
						<input type="text" required="required" name="title" id="title" class="form-control text">
						<form:errors path="title"></form:errors>
					</div>
					<div class="form-group">
						<label>Description</label>
						<textarea name="description" id="description" class="form-control" rows="6"></textarea>
						<form:errors path="title"></form:errors>
					</div>
					<div class="form-group">
						<button class="btn btn-warning" name="cancel">Cancel</button>
						&nbsp; <input class="btn btn-primary" type="submit" name="submit"
							value="Submit">
					</div>
				</form:form>
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

	<script src="/js/validation.js"></script>
	<script
		src="https://ajax.aspnetcdn.com/ajax/JQuery/jquery-2.1.3.min.js"></script>
	<script
		src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.19.1/jquery.validate.min.js"></script>
</body>
</html>
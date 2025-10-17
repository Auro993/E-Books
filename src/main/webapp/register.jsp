<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register page</title>
<%@include file="all_component/allcss.jsp"%>

</head>
<body>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
				<div class="card-header text-centre text-white bg-custom">
				<i class="fa fa-user-plus " aria-hidden="true"></i>
				<h4>Registration</h4>
				</div>
				<div class="card-body">
				<form>
				<div class="form-group">
					<label>Enter Full Name</label>
						
						<input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" >
					</div>
					<div class="form-group">
					<label>Enter Email Name</label>
						
						<input
							type="email" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" > 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Enter Password</label> <input
							type="password" class="form-control" id="exampleInputPassword1">
					</div>
					
					<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
				</form>
				
				
				
				
				</div>
				</div>
				</div>
				


			</div>

		</div>


	</div>
<%@include file="all_component/footer.jsp" %>
</body>
</html>
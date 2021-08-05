<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>OneMenu Sign Up</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
.loginform{
       width: 100%;
    max-width: 330px;
    padding: 15px;
    padding-top: 15px;
    padding-right: 15px;
    padding-bottom: 15px;
    padding-left: 15px;
    margin: 0 auto;  
  position: absolute;
    top: 25%;
    left: 50%;
    margin-right: -50%;
    transform: translate(-50%, -50%)  
    }

element.style {
}
.form-signin {
    width: 100%;
    max-width: 330px;
    padding: 15px;
    margin: 0 auto;
}
*, ::after, ::before {
    box-sizing: border-box;
}
user agent stylesheet
form {
    display: block;
    margin-top: 0em;
}
.text-center {
    text-align: center!important;
}
.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: red ;
}
.center {
  text-align: center; 
  color: red ;
}
</style>
</head>
<body class="text-center">


<div class="loginform container">
    <form action="http://18.224.15.115/foodservlet/SignUp" method="post">
    <br>
    <br>
    <br>
    <br>
    <br>
    <div class="center">
    	<i class="fa fa-cutlery  fa-5x" aria-hidden="true"></i>
    
    </div>
        <br>
    
          <h1 class="h3 mb-3 font-weight-normal">Create An Account</h1>
	    <div class="form-group">
	            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" required value=<%=request.getParameter("firstName") != null ? request.getParameter("firstName") : ""%>>
	    </div>
	    <div class="form-group">
            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" required value=<%=request.getParameter("lastName") != null ? request.getParameter("lastName") : ""%>>
        </div>
        <div class="form-group">
            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required value=<%=request.getParameter("email") != null ? request.getParameter("email") : ""%>>
            
            
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Confirm Password" required>
            <span id='message'></span>
        </div>
        
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
        <span class="error" style="color:red" >${error}
            	<%if(request.getAttribute("error") != null) {
            	%>
            	<br>
            		<a href="/foodservlet/login.jsp">Log in here.</a>
            	<% }%>
            </span>
    </form>
</div>
</body>
<script type="text/javascript">
$(document).ready( function () {
	$('#password, #confirm_password').on('keyup', function () {
		 if ($('#password').val() != ""  || $('#confirm_password').val() != ""){
			 if ( $('#password').val() == $('#confirm_password').val() ) {
				    $('#message').html('Passwords match').css('color', 'green');
				  } else 
				    $('#message').html('Passwords do not match').css('color', 'red');
			 
				}
		});
			 
} );
  
</script>
</html>
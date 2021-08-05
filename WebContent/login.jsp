<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>OneMenu Sign-In</title>
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


<div class="loginform">
    <form action="http://18.224.15.115/foodservlet/Login" method="post">
    <div class="center">
    	<i class="fa fa-cutlery  fa-5x" aria-hidden="true"></i>
    
    </div>
        <br>
    
          <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    
        <div class="form-group">
        <span class="error" style="color: red"> ${InvalidLogin} </span>
            <input type="email" class="form-control" id="uname" name="uname" placeholder="Email" required value=<%=request.getParameter("uname") != null ? request.getParameter("uname") : ""%>>
        </div>
        <div class="form-group">
            <input type="password" class="form-control" id="pass" name="pass" placeholder="Password" required>
        </div>
         <div class="form-group">
            New User? <a style="color: red"href="/foodservlet/SignUp.jsp">Sign Up!</a>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </form>
</div>
</body>
</html>
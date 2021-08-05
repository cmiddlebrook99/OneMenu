<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
 
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>

    <title>OneMenu</title>
    
    <style>
	    a, a:link, a:visited ,a:hover ,a:active {
	    	color: red;
	    }
	    .navbar{
	    	color: white !important; 
	    	background-color: red !important;
	    }
	    .error{
        	color:red ;
        }
        body{
    	padding: 1%;
    }	
    </style>
  </head>
<body>
<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
	<%@page import="java.util.Iterator"%> 
	<%@page import="onemenu.FoodItem"%> 
	<%@page import="onemenu.Restaurant"%> 
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top " style="color:red">
      <div class="container">
        <a class="navbar-brand" href="/foodservlet/Menu">OneMenu</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
              <a class="nav-link" href="/foodservlet/AddFoodItem">Update the Menu</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/foodservlet/YourReviews">Your Reviews</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/foodservlet/LogOut">Log out</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>	
    <br>
    <br>
    <br>

<div class="container"> 
<h1>Add Something New to the Menu</h1>
<br>
	<form action="http://18.224.15.115/foodservlet/AddFoodItem" method="post">
		<label for="name">Name:</label>
		<input type="text" name="name" class="form-control" required>
		<div class="form-group">
		<label for="price">Price:</label>
			<div class="input-group">
		
				<div class="input-group-prepend">
				    <span class="input-group-text">$</span>
			  	</div>
				
				<input type="number" min="0.00" max="100.00" step="0.01" name="price" class="form-control" placeholder="0.00" required/>
			</div>
		</div>
		<div class="form-group">
			<label for="restaurant">Restaurant:</label>
			<select name="restaurant" id="restaurant" class="custom-select" required>
				<option value="">Select A Restaurant</option>
					<%ArrayList<Restaurant> RestaurantList = (ArrayList<Restaurant>)request.getAttribute("RestaurantList") ;
					for(int i = 0  ; i < RestaurantList.size() ; i++){
					%>
								  <option value=<%=RestaurantList.get(i).getID()%>>
								  	<%=RestaurantList.get(i).getName()%>
								  </option>
					<%} %>
			</select>
		</div>
		<div class="form-group">
			<label for="type">Food Category:</label>
			<select name="type" id="type" class="custom-select " required>
				<option value="">Select the food's category</option>
			
				<%ArrayList<String> FoodTypes = (ArrayList<String>)request.getAttribute("FoodTypes") ;
				for(int i = 0  ; i < FoodTypes.size() ; i++){
				%>
							  <option value=<%=(i+1)%>>
							  	<%=FoodTypes.get(i)%>
							  </option>
				<%} %>
			</select>
		</div>
		
		<br>
		<button type="submit" style="margin-top:10px;margin-left:5px; background-color:red; color: white; " class="btn btn-lg ">Add To Menu</button>
		
	</form>
	</div>
</body>
</html>
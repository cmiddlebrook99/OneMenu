<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <!-- Font Awesome Icon Library -->
      
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
 
      
 
        <style>
        .checked {
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
        <!-- Navigation -->

    <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top " style="color:red">
      <div class="container">
        <a class="navbar-brand" href="/foodservlet/Menu">OneMenu</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
          
          	<li class="nav-item">
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
    <form action="http://18.224.15.115/foodservlet/AddReview" method="post">
    	<div class="container">
    
	    <span  onmouseover="starmark(this)" onclick="starmark(this)" id="1one" style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
        <span onmouseover="starmark(this)" onclick="starmark(this)" id="2one"  style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
        <span onmouseover="starmark(this)" onclick="starmark(this)" id="3one"  style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
        <span onmouseover="starmark(this)" onclick="starmark(this)" id="4one"  style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
        <span onmouseover="starmark(this)" onclick="starmark(this)" id="5one"  style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
        <br>    
            	<span class="error">${ratingNotFound}</span>
        
        <br/>
        <textarea  style="margin-top:5px;" class="form-control" rows="3" id="comment" name="comment" placeholder="Enter your review"></textarea>
	    <input type="hidden" id="starRating" name="starRating" value="">
	    <input type="hidden" id="foodID" name="foodID" value=<%=request.getParameter("foodID") %>>
	    <button type="submit" style="margin-top:10px;margin-left:5px; background-color:red; color:white;" class="btn btn-lg ">Submit</button>
	    </div>
    </form>
        
    </body>
	
	
    <script>
        var count;

        function starmark(item)
        {
            count=item.id[0];
            var s = document.getElementById("starRating");
            s.value = count;
            var subid= item.id.substring(1);

            for(var i=0;i<5;i++)
            {
                if(i<count)
                {
                document.getElementById((i+1)+subid).style.color="red";
                }
                else
                {
                document.getElementById((i+1)+subid).style.color="black";
                }
            }

        }


    </script>
</html>
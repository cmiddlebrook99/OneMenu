<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
   	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <meta charset="utf-8" />
    <style>
    body{
    	padding: 1%;
    }
    .checked {
	  color: red;
	}
	 .navbar{
	    	color: white !important; 
	    	background-color: red !important; 
	 
	    }
	  
    </style>
    <title>OneMenu</title>
  
    <script type="text/javascript">
        $(document).ready(function(){
        	
                // Check Radio-box
                $(".rating input:radio").attr("checked", false);
            
                $('.rating input').click(function () {
                    $(".rating span").removeClass('checked');
                    $(this).parent().addClass('checked');
                });
            
                $('input:radio').change(
                function(){
                    var userRating = this.value;
                    alert(userRating);
                }); 
            });
    </script>
  
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
            <li class="nav-item active">
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
     
    <br />
       <div class="container">
 
    <h1 style="justify-content: center"><%=request.getSession().getAttribute("username")%> </h1>
    <br />
    
    <%if(request.getAttribute("NoReviewsExist") != null && (Boolean) request.getAttribute("NoReviewsExist") == true){%>    	
    	<h3>You haven't reviewed anything yet!</h3>
    <%}
    else{
    %>
    
     <h3>
     		Your average review score: 
            <%=request.getAttribute("averageRating")%>
            <%Double roundedRating = (Double) request.getAttribute("averageRating") ; %>
            <%for(int i = 0 ; i < roundedRating.intValue() ; i++  ) {%>
            	 <svg name=<%=roundedRating.intValue() %> width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill" fill="red" xmlns="http://www.w3.org/2000/svg">
                	<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
            	</svg>
            <%} %>
            
            <%if(roundedRating.intValue() < 5){ 
            
            if( (Double)request.getAttribute("averageRating") - roundedRating.intValue() >= .8){ %>
	            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-fill" fill="red" xmlns="http://www.w3.org/2000/svg">
                	<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.283.95l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
            	</svg>
            <%
            roundedRating = roundedRating+1 ;

            }
            else if((Double)request.getAttribute("averageRating") - roundedRating.intValue()<= .2){ %>
	            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star" fill="red" xmlns="http://www.w3.org/2000/svg">
	                <path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
	
	            </svg>
        	<%
           		 roundedRating = roundedRating+1 ;

            }
            else{
	            %>
	            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star-half" fill="red" xmlns="http://www.w3.org/2000/svg">
				  <path fill-rule="evenodd" d="M5.354 5.119L7.538.792A.516.516 0 0 1 8 .5c.183 0 .366.097.465.292l2.184 4.327 4.898.696A.537.537 0 0 1 16 6.32a.55.55 0 0 1-.17.445l-3.523 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256a.519.519 0 0 1-.146.05c-.341.06-.668-.254-.6-.642l.83-4.73L.173 6.765a.55.55 0 0 1-.171-.403.59.59 0 0 1 .084-.302.513.513 0 0 1 .37-.245l4.898-.696zM8 12.027c.08 0 .16.018.232.056l3.686 1.894-.694-3.957a.564.564 0 0 1 .163-.505l2.906-2.77-4.052-.576a.525.525 0 0 1-.393-.288L8.002 2.223 8 2.226v9.8z"/>
				</svg>
				
	            <%
	            roundedRating = roundedRating+1 ;
            }
            %>
    
    		<%for(int i = 0 ; i < 5 - roundedRating.intValue() ; i++  ) {%>
            	<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-star" fill="red" xmlns="http://www.w3.org/2000/svg">
	                <path fill-rule="evenodd" d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.523-3.356c.329-.314.158-.888-.283-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767l-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288l1.847-3.658 1.846 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.564.564 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z" />
	
	            </svg>
            <%} 
            
            }%>

        </h3>
    <div class="container" style="display:inline;">
           <h4 class="text-muted"><%=request.getAttribute("totalReviews")%> total reviews</h4>
    </div>
   <%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
	<%@page import="java.util.Iterator"%> 
	<%@page import="onemenu.Review"%> 
	<%@page import="onemenu.ReviewsForFoodItem"%> 
	<%@page import="java.text.SimpleDateFormat" %>
	
	<% ArrayList<Review> ReviewList = (ArrayList<Review>)request.getAttribute("ReviewList") ; %>
	<%SimpleDateFormat dt1 = new SimpleDateFormat("MM/dd/yyyy"); %>

    <div class="list-group">
    <% for(int i =  0; i < ReviewList.size() ; i++){ %>
    	
        <div class="list-group-item flex-column align-items-start">
        	<input type="hidden" name ="starRatingForReviewID<%=ReviewList.get(i).getReviewID()%>" value=<%=ReviewList.get(i).getStarRating() %> >
            <span id ="star1ForReviewID<%=ReviewList.get(i).getReviewID()%>" class='fa fa-star '></span>
           	<span id ="star2ForReviewID<%=ReviewList.get(i).getReviewID()%>" class='fa fa-star '></span>
           	<span id ="star3ForReviewID<%=ReviewList.get(i).getReviewID()%>" class='fa fa-star '></span>
           	<span id ="star4ForReviewID<%=ReviewList.get(i).getReviewID()%>" class='fa fa-star '></span>
           	<span id ="star5ForReviewID<%=ReviewList.get(i).getReviewID()%>" class='fa fa-star '></span>
            
            <div class="d-flex w-100 justify-content-between">
           		
	            <h5  class="mb-1"><%=ReviewList.get(i).getFoodName()%></h5>
	            
                 <small><%= dt1.format(ReviewList.get(i).getDate())%></small>
            </div>
            	            <h6 class="mb-1 text-muted"><%=ReviewList.get(i).getRestaurantName()%></h3>
            
            <p class="mb-1"><%=ReviewList.get(i).getFullDescription()%></p>
        </div>
     <% } 
     %>
    </div>
    <%} %>
    </div>
</body>

</html>
<script type="text/javascript">
$(document).ready( function () {
	
	$("#1").append("<span class='fa fa-star checked'></span>");

	$("input[name^='starRatingForReviewID']").each(function(){
		var starRating = $(this).val() ; 
		var reviewID = $(this).attr("name") ; 
		reviewID = reviewID.split("D")[1];

		for(var i = 1 ; i <= starRating; i++){
			$("#star"+ i +"ForReviewID" + reviewID).addClass("checked") ;
			
		} 
		
	});
	
	
 	
 } );
  
</script>
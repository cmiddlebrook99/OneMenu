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
    <script >
    $(document).ready( function () {
        $('#table_id').DataTable();
        
        $('[data-toggle="tooltip"]').tooltip() ; 
        } );
</script>
    <title>OneMenu</title>
    
    <style>
    	tr{
    		height:  60px ;
    	}
    	
	    a, a:link, a:visited ,a:hover ,a:active {
	    	color: red;
	    }
	    .navbar{
	    	color: white !important; 
	    	background-color: red !important;
	    }
	    .fa-pencil-square-o{
			color: red;
		}
	  
    </style>
  </head>
  <br>
  <br>

     <body>
	<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
	<%@page import="java.util.Iterator"%> 
	<%@page import="onemenu.FoodItem"%> 
	<%@page import="onemenu.Menu"%> 
	
	
    <!-- Navigation -->
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
    <!-- Page Content -->
    <div class="container">
        <table id="table_id" class="row-border">
            <thead>
               <tr style="background-color: #ffbc0d ;">
                    <th>Menu Item</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Restaurant</th>
                    <th>Rating</th>
                </tr>
            </thead>
            
            <tbody>
		        
                <% ArrayList<FoodItem> Menu = (ArrayList<FoodItem>)request.getAttribute("Menu") ; %>
				<% for(int i =  0; i < Menu.size() ; i++){ %>
						<tr>
			                    <td><%=Menu.get(i).getName()%></td>
			                    <td style="white-space: pre; "><%=Menu.get(i).getPrice()%>   <a href=<%= "\"/foodservlet/UpdatePrice?foodID=" + Menu.get(i).id + "\"" %>><i class="fa fa-pencil-square-o " aria-hidden="true" data-toggle="tooltip" data-placement="right" title="Update the price"></i></a></td>
			                    <td><%=Menu.get(i).getFoodType()%></td>
			                    <td><%=Menu.get(i).getRestaurant()%></td>
			                    <%if(Menu.get(i).getRating() == null){ %>
			                    	<td><a href=<%= "\"/foodservlet/AddReview?foodID=" + Menu.get(i).id + "\"" %>> Be the first to review!</a></td>
			                    <% }
			                    else{
			                    %>
			                    
			                    <td>
			                   		<a href=<%= "\"/foodservlet/ReviewsForFoodItem?foodID=" + Menu.get(i).id + "\"" %> ><%=Menu.get(i).getRating() %></a>
			                   	
			                   	</td>
								<%} %>
    							
								
			            </tr>
				<% } %>
			
            </tbody>
        </table>
    
  
    </div>
    <!-- /.container -->
    </body>
</html>

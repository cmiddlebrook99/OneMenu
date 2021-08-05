<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.js"></script>
    <title>Hello, world!</title>
  </head>
  <br>
  <br>

     <body>
	<%@page import="java.util.ArrayList"%>      <%--Importing all the dependent classes--%>
	<%@page import="java.util.Iterator"%> 
	<%@page import="onemenu.FoodItem"%> 
	<%@page import="onemenu.Menu"%> 
	
	
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#"> ${sessionScope.username} </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  <br>
  <br>
    <!-- Page Content -->
    <div class="container">
        <table id="table_id" class="display">
            <thead>
                <tr>
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
			                    <td><%=Menu.get(i).getPrice()%></td>
			                    <td><%=Menu.get(i).getFoodType()%></td>
			                    <td><%=Menu.get(i).getRestaurant()%></td>
			                    <td>5</td>
			            <tr>
				<% } %>
				<tr>
                    <td>Box Combo</td>
                    <td>$7.40</td>
                    <td>Fried Chicken</td>
                    <td>Raising Cane's</td>
                    <td>5</td>
                <tr>
                    <td>Caniac Combo</td>
                    <td>$9.40</td>
                    <td>Fried Chicken</td>
                    <td>Raising Cane's</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    
  
    </div>
    <!-- /.container -->
    </body>
</html>
<script >
    $(document).ready( function () {
        $('#table_id').DataTable();
        } );
</script>
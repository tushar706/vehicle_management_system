<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
	    <div style="width: 70%; float:left; margin-right:30px" id="login-home">
		  <h2>Welcome to Auto Mobile Management System - Dashboard</h2>
		  
		  <!-- Dashboard For Employee Section -->
		  <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) { %>		
		  <ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="list-center.jsp?location_id=0">Search Service Center</a></li>
			<li><a href="report-bill.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Bills</a></li>
			<li><a href="customer.jsp?customer_id=<%=session.getAttribute("customer_id")%>">My Account</a></li>
			<li><a href="model/customer.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		 <!-- Dashboard For Super Admin Section -->
		 <% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>		
		  <ul>
					<li><a href="bill.jsp?bill_id=0">Add Bill</a></li>
					<li><a href="center.jsp?center_id=0">Add Service Center</a></li>
					<li><a href="location.jsp?location_id=0">Add Location</a></li>
					<li><a href="report-center.jsp?location_id=0">Center Reports</a></li>
					<li><a href="report-location.jsp?location_id=0">Location Report</a></li>
					<li><a href="report-customer.jsp">Customer Report</a></li>
					<li><a href="report-pickup.jsp?customer_id=0">Pickup Report</a></li>
					<li><a href="report-bill.jsp?customer_id=0">Bill Report</a></li>
					<li><a href="change-password.jsp">Change Password</a></li>
					<li><a href="login.jsp?act=logout">Logout</a></li>
		  </ul>
		  <% } %>
		  
		</div>
		<div style="float: left">
			<div><img src="images/save_1.jpg" style="width: 250px"></div><br>
			<div><img src="images/save_2.jpg" style="width: 250px"></div>
		</div>
      <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>

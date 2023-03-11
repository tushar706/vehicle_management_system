<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Pickup pickupDetails = new Pickup();
	HashMap Values = pickupDetails.getPickupDetails(request.getParameter("pickup_id"));
	int total = 0;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear">
      <!-- main body -->
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Pickup details</h2>
        <% if(request.getParameter("msg") != null) { %>
        <div class="msg"><%=request.getParameter("msg") %></div>
        <% } %>
					<table>
						<tr>
							<th style="width:50%">Pickup ID</th>
							<td><% out.print(Values.get("pickup_id")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Customer Name</th>
							<td><% out.print(Values.get("pickup_name")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Mobile</th>
							<td><% out.print(Values.get("pickup_mobile")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Email</th>
							<td><% out.print(Values.get("pickup_email")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Center Name</th>
							<td><% out.print(Values.get("center_name")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Center Contact</th>
							<td><% out.print(Values.get("center_contact")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Center Email</th>
							<td><% out.print(Values.get("center_email")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Location Name</th>
							<td><% out.print(Values.get("location_name")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Location</th>
							<td><% out.print(Values.get("center_description")); %></td>
						</tr>
					</table>
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

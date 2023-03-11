<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Pickup pickupDetails = new Pickup();
	int customerID = Integer.parseInt(request.getParameter("customer_id"));
	ArrayList allPickup = pickupDetails.getAllPickup(customerID);
	int total = 0;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>All Pickup Request</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
							<th>ID</th>
              <th>Name</th>
              <th>Email</th>
							<th>Contact</th>
							<th>Pickup Date</th>
							<th>Center Location</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allPickup.size();i++) 
			{ 
				HashMap PickupDetails = new HashMap();
				PickupDetails = (HashMap)allPickup.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(PickupDetails.get("pickup_id")); %></td>
				  <td><% out.print(PickupDetails.get("pickup_name")); %></td>
				  <td><% out.print(PickupDetails.get("pickup_email")); %></td>
					<td><% out.print(PickupDetails.get("pickup_mobile")); %></td>
					<td><% out.print(PickupDetails.get("pickup_date")); %></td>
					<td><% out.print(PickupDetails.get("center_name")); %></td>
				  <td style="text-align:center; width:200px;"> 
						<a href="pickup-details.jsp?pickup_id=<% out.print(PickupDetails.get("pickup_id")); %>">
							View Details
						</a> 
				  </td>
				</tr>
			<%
			}
			%>
        </tbody>
        </table>
        </div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>

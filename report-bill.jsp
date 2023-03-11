<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Bill billDetails = new Bill();
	int customerID = Integer.parseInt(request.getParameter("customer_id"));
	ArrayList allBill = billDetails.getAllBill(customerID);
	int total = 0;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>All Bill Details</h2>
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
							<th>Amount</th>
							<th>Bill Date</th>
							<th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allBill.size();i++) 
			{ 
				HashMap BillDetails = new HashMap();
				BillDetails = (HashMap)allBill.get(i);
				String color = "green";
				if(BillDetails.get("bill_status").equals("Unpaid")) {
					color = "red";
				}
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(BillDetails.get("bill_id")); %></td>
				  <td><% out.print(BillDetails.get("pickup_name")); %></td>
				  <td><% out.print(BillDetails.get("pickup_email")); %></td>
					<td><% out.print(BillDetails.get("pickup_mobile")); %></td>
					<td><% out.print(BillDetails.get("bill_amount")); %>.00/-</td>
					<td><% out.print(BillDetails.get("bill_date")); %></td>
					<td style="background-color:<%=color%>; color:#FFFFFF"><% out.print(BillDetails.get("bill_status")); %></td>
				  <td style="text-align:center; width:200px;"> 
						<a href="bill-details.jsp?bill_id=<% out.print(BillDetails.get("bill_id")); %>">
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

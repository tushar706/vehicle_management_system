<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Bill billDetails = new Bill();
	HashMap Values = billDetails.getBillDetails(request.getParameter("bill_id"));
	int total = 0;
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear">
      <!-- main body -->
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Bill details</h2>
        <% if(request.getParameter("msg") != null) { %>
        <div class="msg"><%=request.getParameter("msg") %></div>
        <% } %>
					<table>
						<tr>
							<th style="width:50%">Bill ID</th>
							<td><% out.print(Values.get("bill_id")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Bill Date</th>
							<td><% out.print(Values.get("bill_date")); %></td>
						</tr>
						<tr>
							<th style="width:50%">Bill Amount</th>
							<td><% out.print(Values.get("bill_amount")); %></td>
						</tr>
						<tr>
								<th style="width:50%">Payment Status</th>
								<td><% out.print(Values.get("bill_status")); %></td>
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
					</table>
					<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4") && Values.get("bill_status").equals("Unpaid")) { %>		
						<div class="my-link-btn"><a href="payment.jsp?bill_id=<% out.print(Values.get("bill_id")); %>">Make Payment</a></div>
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

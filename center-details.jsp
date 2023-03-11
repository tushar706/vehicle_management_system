<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Center centerDetails = new Center();
	int center_id = Integer.parseInt(request.getParameter ("center_id"));
	HashMap Values =  centerDetails.getCenterDetails(center_id);	
	int stock = Integer.parseInt(Values.get("center_email").toString());
%>
<script>
function openEnquiry(id) {
	location.href = "pickup.jsp?pickup_id=0&center_id="+id;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
        <div id="comments" style="width: 98%; float:left; margin-right:30px">
        <h2>Details of <% out.print(Values.get("center_name")); %></h2>
        <form action="model/cart.jsp" method="post">
        <div>
			<div style="float:left"><img src="centerImages/<% out.print(Values.get("center_image")); %>" style="height:320px; width:300px;"></div>
			<div style="float:right; width:65%;">
				<table>
					<tr>
						<td style="width:25%">Name</td>
						<td style="width:75%"><% out.print(Values.get("center_name")); %></td>
					</tr>
					<tr>
						<td>Service Company</td>
						<td><% out.print(Values.get("center_company")); %></td>
					</tr>
					<tr>
						<td>Location</td>
						<td><% out.print(Values.get("center_type")); %></td>
					</tr>
					<tr>
						<td>Contact Number</td>
						<td><% out.print(Values.get("center_contact")); %></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><% out.print(Values.get("center_email")); %></td>
					</tr>
					<tr>
						<td colspan="2">
						<% out.print(Values.get("center_description")); %>
						</td>
					</tr>
				</table>
			</div>
			<div style="clear:both; float:right;">
				<input type="button" value="Submit Pickup Request" onClick="openEnquiry(<% out.print(Values.get("center_id")); %>)">
			</div>
        </div>
        <input type="hidden" name="center_id" value="<% out.print(Values.get("center_id")); %>">
        <input type="hidden" name="center_contact" value="<% out.print(Values.get("center_contact")); %>">
        <input type="hidden" name="act" value="save">
		</form>
		</div>
    <div class="clear"></div>
    </main>
  </div>
</div>
<%@ include file="includes/footer.jsp" %>

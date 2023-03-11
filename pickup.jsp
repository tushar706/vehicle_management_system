<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
  if(session.getAttribute("login_level") == null) {
    response.sendRedirect("customer-login.jsp?customer_id=0&msg=Login to your account to book the pickup of your vehicle");
  }
	Pickup typeDetails = new Pickup();
	String typeLabel = "Save";
	String pickup_id = request.getParameter ("pickup_id");
	if(pickup_id != "0") {
		typeLabel = "Update";
	}
	HashMap Values =  typeDetails.getPickupDetails(pickup_id);	
%>

<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear">
      <!-- main body -->
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Enter your pickup details</h2>
        <% if(request.getParameter("msg") != null) { %>
        <div class="msg"><%=request.getParameter("msg") %></div>
        <% } %>
        <form action="model/pickup.jsp" method="post">
          <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="pickup_name" id="pickup_name" value="<% out.print(Values.get("pickup_name")); %>"
              size="22" style="width:350px;" required>
          </div>
          <div id="empl_id">
            <label for="email">Email<span>*</span></label>
            <input type="text" name="pickup_email" id="pickup_email" value="<% out.print(Values.get("pickup_email")); %>"
              size="22" style="width:350px;" required>
          </div>
          <div id="empl_id">
            <label for="email">Contact Number<span>*</span></label>
            <input type="text" name="pickup_mobile" id="pickup_mobile" value="<% out.print(Values.get("pickup_mobile")); %>"
              size="22" style="width:350px;" required>
          </div>
          <div>
            <label for="email">Pickup Address<span>*</span></label>
            <textarea style="width:350px; height:100px;" name="pickup_address"
              required><% out.print(Values.get("pickup_address")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(typeLabel); %> Pickup">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
          <input type="hidden" name="act" value="Save" />
          <input type="hidden" name="pickup_id" value="<% out.print(Values.get("pickup_id")); %>" />
          <input type="hidden" name="pickup_center_id" value="<% out.print(request.getParameter ("center_id")); %>" />
        </form>
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
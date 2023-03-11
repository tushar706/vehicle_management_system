<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
  if(session.getAttribute("login_level") == null) {
    response.sendRedirect("customer-login.jsp?customer_id=0&msg=Login to your account to book the bill of your vehicle");
  }
	Bill billDetails = new Bill();
	String billLabel = "Save";
	String bill_id = request.getParameter ("bill_id");
	if(bill_id != "0") {
		billLabel = "Update";
	}
	HashMap Values =  billDetails.getBillDetails(bill_id);	
%>
<script>
    jQuery(function() {
      jQuery( "#bill_date" ).datepicker({
        changeMonth: true,
        changeYear: true,
         yearRange: "-0:+1",
         dateFormat: 'd MM,yy'
      });
    });
  </script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear">
      <!-- main body -->
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
        <h2>Generate Bill</h2>
        <% if(request.getParameter("msg") != null) { %>
        <div class="msg"><%=request.getParameter("msg") %></div>
        <% } %>
        <form action="model/bill.jsp" method="post">
          <div>
            <label for="url">Select Pickup ID</label>
            <select style="height: 40px; width:350px" name="bill_pickup_id" required>
				      <% out.print(billDetails.getPickupOption((Integer) Values.get("bill_pickup_id"))); %>
            </select>
          </div>
          <div>
            <label for="email">Date<span>*</span></label>
            <input type="text" name="bill_date" id="bill_date" value="<% out.print(Values.get("bill_date")); %>"
              size="22" style="width:350px;" required>
          </div>
          <div>
            <label for="email">Amount<span>*</span></label>
            <input type="text" name="bill_amount" id="bill_amount" value="<% out.print(Values.get("bill_amount")); %>"
              size="22" style="width:350px;" required>
          </div>
          <div>
            <label for="email">Bill Description<span>*</span></label>
            <textarea style="width:350px; height:100px;" name="bill_description"
              required><% out.print(Values.get("bill_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Bill">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
          <input type="hidden" name="act" value="Save" />
          <input type="hidden" name="bill_id" value="<% out.print(Values.get("bill_id")); %>" />
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
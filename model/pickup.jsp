<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Pickup pickupObj = new Pickup();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) {
		emp_id = (String) session.getAttribute("customer_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		String date = new java.util.Date().toLocaleString();
		results.put("pickup_id",request.getParameter("pickup_id"));
		results.put("pickup_center_id",request.getParameter("pickup_center_id"));
		results.put("pickup_date",date);
		results.put("pickup_customer_id",emp_id);
		results.put("pickup_name",request.getParameter("pickup_name"));
		results.put("pickup_email",request.getParameter("pickup_email"));
		results.put("pickup_mobile",request.getParameter("pickup_mobile"));
		results.put("pickup_address",request.getParameter("pickup_address"));

		if((request.getParameter("pickup_id")).equals(""))
		{
			int pickup_id = pickupObj.savePickup(results);
			response.sendRedirect("../pickup.jsp?pickup_id=0&msg=Your pickup has been scheduled successfully.<br> Your pickup ID is "+pickup_id);
		}
		else
		{
			results.put("pickup_id",request.getParameter("pickup_id"));
			out.println(pickupObj.updatePickup(results));
			response.sendRedirect("../report-pickup.jsp?emp_id=0&msg=Food Category Updated Successfully");
		}
	}
%>

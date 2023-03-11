<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Bill billObj = new Bill();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("4")) {
		emp_id = (String) session.getAttribute("customer_id");
	}
	if((request.getParameter("act")).equals("bill_payment"))
	{
		String bill_id = billObj.updateBillPayment(request.getParameter("bill_id"));
		response.sendRedirect("../bill-details.jsp?bill_id="+request.getParameter("bill_id")+"&msg=You have successfully paid your bill");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
		results.put("bill_id",request.getParameter("bill_id"));
		results.put("bill_pickup_id",request.getParameter("bill_pickup_id"));
		results.put("bill_date",request.getParameter("bill_date"));
		results.put("bill_description",request.getParameter("bill_description"));
		results.put("bill_amount",request.getParameter("bill_amount"));
		
		if((request.getParameter("bill_id")).equals(""))
		{
			String bill_id = billObj.saveBill(results);
			response.sendRedirect("../bill.jsp?bill_id=0&msg=Bill Generated successfully.");
		}
		else
		{
			results.put("bill_id",request.getParameter("bill_id"));
			out.println(billObj.updateBill(results));
			response.sendRedirect("../report-bill.jsp?emp_id=0&msg=Food Category Updated Successfully");
		}
	}
%>

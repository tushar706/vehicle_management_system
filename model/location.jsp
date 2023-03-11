<%@ page import= "Model.*" %>
<%@ page import= "java.util.*" %>

<%
	Location typeObj = new Location();
	String emp_id = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("3")) {
		emp_id = (String) session.getAttribute("login_emp_id");
	}
	if((request.getParameter("act")).equals("Save"))
	{
		HashMap results = new HashMap();
	
		results.put("location_id",request.getParameter("location_id"));
		results.put("location_name",request.getParameter("location_name"));
		results.put("location_description",request.getParameter("location_description"));

		if((request.getParameter("location_id")).equals(""))
		{
			out.println(typeObj.saveType(results));
			response.sendRedirect("../report-location.jsp?emp_id="+emp_id+"&msg=Food Category Saved Successfully");
		}
		else
		{
			results.put("location_id",request.getParameter("location_id"));
			out.println(typeObj.updateType(results));
			response.sendRedirect("../report-location.jsp?emp_id=0&msg=Food Category Updated Successfully");
		}
	}
%>

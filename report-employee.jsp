<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<script>
function gotform(obj) {
	if(obj.value != "") {
		window.location.href = obj.value;
	}
}
</script>
<%
	Employee employeeDetails = new Employee();
	String employeeID = "0";
	if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("2")) {
		employeeID = (String) session.getAttribute("login_emp_id");
	}
	ArrayList allEmployees = employeeDetails.getAllEmployee(employeeID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Empoloyee Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Employee Code</th>
              <th>Name</th>
              <th>Mobile</th>
              <th>Department</th>
              <th>Status</th>
              <th>Email</th>
	      <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allEmployees.size();i++) 
			{ 
				HashMap EmployeeDetails = new HashMap();
				EmployeeDetails = (HashMap)allEmployees.get(i);
				String department = employeeDetails.getDepartment((Integer) EmployeeDetails.get("employee_deparment"));
				String status = employeeDetails.getStatus((Integer) EmployeeDetails.get("employee_status"));
			%>
				<tr>
				  <td><% out.print(EmployeeDetails.get("employee_id")); %></td>
				  <td><% out.print(EmployeeDetails.get("employee_first_name")); %></td>
				  <td><% out.print(EmployeeDetails.get("employee_mobile")); %></td>
				  <td><% out.print(department); %></td>
				  <td><% out.print(status); %></td>
				  <td><% out.print(EmployeeDetails.get("employee_email")); %></td>
				  <td> 
				    <select onchange="gotform(this)">
						<option value="">Select Action</option>
						<option value="employee.jsp?employee_id=<% out.print(EmployeeDetails.get("employee_id")); %>">Edit Employee</option>
						<option value="report-leave.jsp?emp_id=<% out.print(EmployeeDetails.get("employee_id")); %>">View Leaves</option>
						<option value="report-timesheet.jsp?emp_id=<% out.print(EmployeeDetails.get("employee_id")); %>">View Timesheet</option>
						<% if(session.getAttribute("login_level") != null && session.getAttribute("login_level").equals("1")) { %>
						<option value="report-salary.jsp?emp_id=<% out.print(EmployeeDetails.get("employee_id")); %>">View Salary</option>
						<% } %>
				    </select>
					
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

<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Center centerDetails = new Center();
	int typeID = Integer.parseInt(request.getParameter("location_id"));
	ArrayList allCenter = centerDetails.getAllCenter(typeID);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div class="scrollable">
        <h2>Center Report</h2>
		<% if(request.getParameter("msg") != null) { %>
		<div class="msg"><%=request.getParameter("msg") %></div>
		<% } %>
        <table>
          <thead>
            <tr>
              <th>Center Code</th>
              <th>Image</th>
              <th>Name</th>
              <th>Type</th>
              <th>Company</th>
              <th>Price</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
			<% for(int i=0;i<allCenter.size();i++) 
			{ 
				HashMap CenterDetails = new HashMap();
				CenterDetails = (HashMap)allCenter.get(i);
			%>
				<tr>
				  <td style="text-align:center;"><% out.print(CenterDetails.get("center_id")); %></td>
				  <td>
					<a href="center-details.jsp?center_id=<% out.print(CenterDetails.get("center_id")); %>">
						<img src="centerImages/<% out.print(CenterDetails.get("center_image")); %>" style="height:80px; width:80px;">
					</a>
				  </td>
				  <td><% out.print(CenterDetails.get("center_name")); %></td>
				  <td><% out.print(CenterDetails.get("center_type")); %></td>
				  <td><% out.print(CenterDetails.get("center_company")); %></td>
				  <td><% out.print(CenterDetails.get("center_contact")); %></td>
				  <td> <a href="center.jsp?center_id=<% out.print(CenterDetails.get("center_id")); %>">Edit</a> </td>
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

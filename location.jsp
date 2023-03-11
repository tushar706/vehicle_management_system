<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Location typeDetails = new Location();
	String typeLabel = "Save";
	int location_id = Integer.parseInt(request.getParameter ("location_id"));
	if(location_id != 0) {
		typeLabel = "Update";
	}
	HashMap Values =  typeDetails.getTypeDetails(location_id);	
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Location Entry Form</h2>
        <form action="model/location.jsp" method="post">
		  <div id="empl_id">
            <label for="email">Name<span>*</span></label>
            <input type="text" name="location_name" id="location_name" value="<% out.print(Values.get("location_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div>
            <label for="email">Description<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="location_description" required><% out.print(Values.get("location_description")); %></textarea>
          </div>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="<% out.print(typeLabel); %> Type">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="location_id" value="<% out.print(Values.get("location_id")); %>"/>
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

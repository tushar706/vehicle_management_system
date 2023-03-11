<%@ include file="includes/header.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>
<%
	Center centerDetails = new Center();
	int center_id = Integer.parseInt(request.getParameter ("center_id"));
	HashMap Values =  centerDetails.getCenterDetails(center_id);	
%>
<script>
function validImage() {
	var val = $("#center_image").val();
	var id = $("#center_id").val();
	if(id == '' || val != '')
	{
		if(val == '') {
			alert('Choose the Center Image');
			return false;
		}
		if (!val.match(/(?:gif|jpg|png|bmp)$/)) {
			// inputted file path is not an image of one of the above types
			alert("inputted file path is not an image!");
			return false;
		}
	}
	return true;
}
</script>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <div id="comments" style="width: 70%; float:left; margin-right:30px">
      <h2>Service Center Entry Form</h2>
		<form method="post" action="UploadCenter" enctype="multipart/form-data" onsubmit="return validImage()">
          <div class="half_width">
            <label for="email">Service Center Name<span>*</span></label>
            <input type="text" name="center_name" id="center_name" value="<% out.print(Values.get("center_name")); %>" size="22" style="width:300px;" required>
          </div>
          <div class="half_width">
            <label for="email">Location<span>*</span></label>
            <select style="height: 40px; width:300px" name = "center_location_id" id = "center_location_id" required>
            	<% out.print(centerDetails.getTypeOption((Integer) Values.get("center_location_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Automobile Company<span>*</span></label>
            <select style="height: 40px; width:300px" name = "center_company_id" id = "center_company_id" required>
            	<% out.print(centerDetails.getCompanyOption((Integer) Values.get("center_company_id"))); %>
            </select>
          </div>
          <div class="half_width">
            <label for="email">Contact Number<span>*</span></label>
            <input type="text" name="center_contact" id="center_contact" value="<% out.print(Values.get("center_contact")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Image<span>*</span></label>
            <input type="file" name="center_image" id="center_image" style="width:300px">
          </div>
           <div style="clear:both">
            <label for="email">Email ID<span>*</span></label>
            <input type="text" name="center_email" id="center_email" value="<% out.print(Values.get("center_email")); %>" size="22" style="width:300px;" required>
          </div>
          <div style="clear:both">
            <label for="email">Full Address<span>*</span></label>
			<textarea style="width:300px; height:100px;" name="center_description" required><% out.print(Values.get("center_description")); %></textarea>
          </div>
          <% if(!Values.get("center_image").equals("")) { %>
          <div class="half_width">
			<img src="centerImages/<% out.print(Values.get("center_image")); %>" style="height:100px; width:100px;">
          </div>
          <% } %>
          <div class="block clear"></div>
          <div>
            <input name="submit" type="submit" value="Save Center">
            &nbsp;
            <input name="reset" type="reset" value="Reset Form">
          </div>
		  <input type="hidden" name="image_name" value="<% out.print(Values.get("center_image")); %>" />
		  <input type="hidden" name="act" value="Save" />
		  <input type="hidden" name="location_id" value="0" />
		  <input type="hidden" id="center_id" name="center_id" value="<% out.print(Values.get("center_id")); %>"/>
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

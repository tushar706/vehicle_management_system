<%@ include file="includes/header.jsp" %>
<%@ include file="includes/slider.jsp" %>
<%@ page import= "java.util.*" %>
<%@ page import= "Model.*" %>

<%
	Center centerDetails = new Center();
	ArrayList allCenter = centerDetails.getAllCenter(0);
%>
<div class="wrapper row3">
  <div class="rounded">
    <main class="container clear"> 
      <!-- main body --> 
      <!-- ################################################################################################ -->
      <div class="group btmspace-30"> 
        <!-- Left Column -->
        <div class="one_quarter first"> 
          <!-- ################################################################################################ -->
          <ul class="nospace">
            <li class="btmspace-15"><a href="#"><em class="heading">Deals On Car Services</em> 
            <img class="borderedbox" src="images/save_1.jpg" alt=""></a>
		</li>
		</li>
            <li class="btmspace-15"><a href="#"><em class="heading">Great Discounts</em> 
		<img class="borderedbox" src="images/save_2.jpg" alt=""></a></li>
          </ul>
          <!-- ################################################################################################ --> 
        </div>
        <!-- / Left Column --> 
        <!-- Middle Column -->
        <div class="one_half" style="width:70%"> 
          <!-- ################################################################################################ -->
          <h2>All Available Service Centers</h2>          
          <ul class="nospace listing">
          <% for(int i=0;i<allCenter.size();i++) 
			{ 
				HashMap CenterDetails = new HashMap();
				CenterDetails = (HashMap)allCenter.get(i);
			%>
				<li class="center-listing">
					<div class="imgl borderedbox">
					<a href="center-details.jsp?center_id=<% out.print(CenterDetails.get("center_id")); %>">
						<img src="centerImages/<% out.print(CenterDetails.get("center_image")); %>" style="height:140px; width:190px;">
					</a>
					</div>
					<div class="center-price">
						<b>
							<% out.print(CenterDetails.get("center_name")); %> <br>
							<% out.print(CenterDetails.get("center_type")); %> <br>
							Service For : <% out.print(CenterDetails.get("center_company")); %><br>
						</b> 
						Contact &#8377; <% out.print(CenterDetails.get("center_contact")); %>
					</div>
				</li>
			<%
			}
			%>
          </ul>
          
       <!-- ################################################################################################ --> 
        </div>
        <!-- / Middle Column --> 
      </div>
      
      <!-- ################################################################################################ --> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ --> 
      <!-- / main body -->
      <div class="clear"></div>
    </main>
  </div>
</div>

<%@ include file="includes/footer.jsp" %>

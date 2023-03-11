import java.io.File;
import java.io.IOException;
import Model.*;
import java.util.*;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/UploadCenter")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadCenter extends HttpServlet {
    private static final String SAVE_DIR = "centerImages";
     
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//// Logic for Upload the File ////
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
		long unixTime = System.currentTimeMillis() / 1000L;
	
		Part part;
        part = request.getPart("center_image");
        String fileName = extractFileName(part);
        if(!fileName.equals("")) {
			fileName = unixTime+"_"+extractFileName(part);
			part.write(savePath + File.separator + fileName);
		} else {
			fileName = request.getParameter("image_name");
		}
		//// Upload File Complete///
		
		/////Save the Center Details /////
		Center centerObj = new Center();
		String emp_id = "0";
		if((request.getParameter("act")).equals("Save"))
		{
			HashMap results = new HashMap();

			results.put("center_name",request.getParameter("center_name"));
			results.put("center_location_id",request.getParameter("center_location_id"));
			results.put("center_company_id",request.getParameter("center_company_id"));
			results.put("center_description",request.getParameter("center_description"));
			results.put("center_contact",request.getParameter("center_contact"));
			results.put("center_id",request.getParameter("center_id"));
			results.put("center_email",request.getParameter("center_email"));
			results.put("center_image",fileName);
					
			if((request.getParameter("center_id")).equals(""))
			{
				centerObj.saveCenter(results);
				request.setAttribute("message", "Center Saved Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-center.jsp").forward(request, response);
			}
			else
			{
				results.put("center_id",request.getParameter("center_id"));
				centerObj.updateCenter(results);
				request.setAttribute("message", "Center Updated Successfully !!!!");
				getServletContext().getRequestDispatcher("/report-center.jsp").forward(request, response);
			}
		}
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}

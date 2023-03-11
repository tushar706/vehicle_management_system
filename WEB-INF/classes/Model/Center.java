package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Center extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Center()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveCenter(HashMap centerData)
	{
		String SQL = "INSERT INTO `center` (`center_name`, `center_location_id`, `center_company_id`, `center_contact`, `center_image`, `center_description`,`center_email`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) centerData.get("center_name"));
			pstmt.setString(2,(String) centerData.get("center_location_id"));
			pstmt.setString(3,(String) centerData.get("center_company_id"));
			pstmt.setString(4,(String) centerData.get("center_contact"));
			pstmt.setString(5,(String) centerData.get("center_image"));
			pstmt.setString(6,(String) centerData.get("center_description"));
			pstmt.setString(7,(String) centerData.get("center_email"));
			
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getCenterDetails(int center_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
			String SQL = "SELECT * FROM `center`,`company`,`location` WHERE center_company_id = company_id AND center_location_id = location_id AND center_id = "+center_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("center_name",rs.getString("center_name"));
				results.put("center_location_id",Integer.parseInt(rs.getString("center_location_id")));
				results.put("center_company_id",Integer.parseInt(rs.getString("center_company_id")));
				results.put("center_description",rs.getString("center_description"));
				results.put("center_contact",rs.getString("center_contact"));
				results.put("center_id",rs.getString("center_id"));
				results.put("center_image",rs.getString("center_image"));
				results.put("center_company",rs.getString("company_name"));
				results.put("center_type",rs.getString("location_name"));
				results.put("center_email",rs.getString("center_email"));
				
				count++;
            }
			if(count==0)
			{
				results.put("center_name","");
				results.put("center_location_id",0);
				results.put("center_company_id",0);
				results.put("center_description","");
				results.put("center_contact","");
				results.put("center_image","");
				results.put("center_id","");	
				results.put("center_email","");					
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Center ////
	public String updateCenter(HashMap centerData)
	{
		String SQL = "UPDATE `center` SET `center_name` = ?, `center_location_id` = ?, `center_company_id` = ?, `center_contact` = ?, `center_image` = ?, `center_description` = ?, `center_email` = ? WHERE `center_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) centerData.get("center_name"));
			pstmt.setString(2,(String) centerData.get("center_location_id"));
			pstmt.setString(3,(String) centerData.get("center_company_id"));
			pstmt.setString(4,(String) centerData.get("center_contact"));
			pstmt.setString(5,(String) centerData.get("center_image"));
			pstmt.setString(6,(String) centerData.get("center_description"));
			pstmt.setString(7,(String) centerData.get("center_email"));
			pstmt.setString(8,(String) centerData.get("center_id"));
			record = pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		}
		catch(Exception e)
		{
			StringWriter writer = new StringWriter();
			PrintWriter printWriter = new PrintWriter( writer );
			e.printStackTrace( printWriter );
			printWriter.flush();
			String stackTrace = writer.toString();
			error+="Error : "+stackTrace;
			System.out.println(" Error : "+ e.toString());
		}
		return error;
	}
	
	////////////////Function for getting all the Airport Details////////////////////  
    public ArrayList getAllCenter(int typeID)
	{
		int count=0;
		String SQL = "";
		if(typeID != 0)
			SQL = "SELECT * FROM `center`,`company`,`location` WHERE center_company_id = company_id AND center_location_id = location_id AND location_id = "+typeID;
		else 
			SQL = "SELECT * FROM `center`,`company`,`location` WHERE center_company_id = company_id AND center_location_id = location_id";
        ArrayList resultArray = new ArrayList();
        try
		{
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("center_name",rs.getString("center_name"));
				results.put("center_location_id",Integer.parseInt(rs.getString("center_location_id")));
				results.put("center_company_id",Integer.parseInt(rs.getString("center_company_id")));
				results.put("center_description",rs.getString("center_description"));
				results.put("center_contact",rs.getString("center_contact"));
				results.put("center_id",rs.getString("center_id"));
				results.put("center_image",rs.getString("center_image"));
				results.put("center_company",rs.getString("company_name"));
				results.put("center_type",rs.getString("location_name"));
				results.put("center_email",rs.getString("center_email"));
				count++;
                resultArray.add(results);
            }
         }
		catch(Exception e)
		{
            System.out.println("Error is: "+ e);
        }
        return resultArray;
    }
	/////Function for Getting the List////////////
	public String getCompanyOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("company","company_id","company_name","company_id,company_name",selectedID,"1");
    }
    /////Function for Getting the List////////////
	public String getTypeOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("location","location_id","location_name","location_id,location_name",selectedID,"1");
    }
}

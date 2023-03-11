package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Pickup extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Pickup()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public int savePickup(HashMap pickupData)
	{
		String SQL = "INSERT INTO `pickup` (`pickup_name`, `pickup_email`, `pickup_mobile`, `pickup_address`, `pickup_customer_id`, `pickup_date`, `pickup_center_id`) VALUES (?, ?, ?, ?, ?, ?, ?);";
		int record=0, last_inserted_id=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) pickupData.get("pickup_name"));
			pstmt.setString(2,(String) pickupData.get("pickup_email"));
			pstmt.setString(3,(String) pickupData.get("pickup_mobile"));
			pstmt.setString(4,(String) pickupData.get("pickup_address"));
			pstmt.setString(5,(String) pickupData.get("pickup_customer_id"));
			pstmt.setString(6,(String) pickupData.get("pickup_date"));
			pstmt.setString(7,(String) pickupData.get("pickup_center_id"));
			
			
			record = pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				last_inserted_id = rs.getInt(1);
			}
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
		return last_inserted_id;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getPickupDetails(String pickup_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `location`,`pickup`, `customer`, `center` WHERE pickup_center_id = center_id AND pickup_customer_id = customer_id AND location_id = center_location_id AND pickup_id = "+pickup_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("pickup_id",rs.getString("pickup_id"));
				results.put("pickup_name",rs.getString("pickup_name"));
				results.put("pickup_email",rs.getString("pickup_email"));
				results.put("pickup_address",rs.getString("pickup_address"));
				results.put("pickup_mobile",rs.getString("pickup_mobile"));
				results.put("pickup_id",rs.getString("pickup_id"));
				results.put("pickup_name",rs.getString("pickup_name"));
				results.put("pickup_email",rs.getString("pickup_email"));
				results.put("pickup_address",rs.getString("pickup_address"));
				results.put("pickup_mobile",rs.getString("pickup_mobile"));
				results.put("pickup_date",rs.getString("pickup_date"));
				results.put("customer_name",rs.getString("customer_name"));
				results.put("customer_mobile",rs.getString("customer_mobile"));
				results.put("customer_email",rs.getString("customer_email"));
				results.put("customer_password",rs.getString("customer_password"));
				results.put("customer_address",rs.getString("customer_address"));
				results.put("customer_city",rs.getString("customer_city"));
				results.put("customer_state",Integer.parseInt(rs.getString("customer_state")));
				results.put("customer_pincode",rs.getString("customer_pincode"));	
				results.put("customer_id",rs.getString("customer_id"));	
				results.put("center_name",rs.getString("center_name"));
				results.put("center_location_id",Integer.parseInt(rs.getString("center_location_id")));
				results.put("center_company_id",Integer.parseInt(rs.getString("center_company_id")));
				results.put("center_description",rs.getString("center_description"));
				results.put("center_contact",rs.getString("center_contact"));
				results.put("location_name",rs.getString("location_name"));
				results.put("center_id",rs.getString("center_id"));
				results.put("center_image",rs.getString("center_image"));
				results.put("center_email",rs.getString("center_email"));
				count++;
            }
			if(count==0)
			{
				results.put("pickup_id","");
				results.put("pickup_name","");
				results.put("pickup_email","");
				results.put("pickup_address","");
				results.put("pickup_mobile","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Pickup ////
	public String updatePickup(HashMap pickupData)
	{
		String SQL = "UPDATE `pickup` SET `pickup_name` = ?, `pickup_email` = ?, `pickup_mobile` = ?, `pickup_address` = ?, `pickup_customer_id` = ?, `pickup_date` = ?, pickup_center_id = ? WHERE `pickup_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) pickupData.get("pickup_name"));
			pstmt.setString(2,(String) pickupData.get("pickup_email"));
			pstmt.setString(3,(String) pickupData.get("pickup_mobile"));
			pstmt.setString(4,(String) pickupData.get("pickup_address"));
			pstmt.setString(5,(String) pickupData.get("pickup_customer_id"));
			pstmt.setString(6,(String) pickupData.get("pickup_date"));
			pstmt.setString(7,(String) pickupData.get("pickup_center_id"));
			pstmt.setString(8,(String) pickupData.get("pickup_id"));
			
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
    public ArrayList getAllPickup(int customerID)
	{
		String SQL = "SELECT * FROM `pickup`, `customer`, `center` WHERE pickup_center_id = center_id AND pickup_customer_id = customer_id";
		if(customerID != 0)
			SQL = "SELECT * FROM `pickup`, `customer`, `center` WHERE pickup_center_id = center_id AND pickup_customer_id = customer_id AND customer_id = "+customerID;
		
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("pickup_id",rs.getString("pickup_id"));
				results.put("pickup_name",rs.getString("pickup_name"));
				results.put("pickup_email",rs.getString("pickup_email"));
				results.put("pickup_address",rs.getString("pickup_address"));
				results.put("pickup_mobile",rs.getString("pickup_mobile"));
				results.put("pickup_date",rs.getString("pickup_date"));
				results.put("customer_name",rs.getString("customer_name"));
				results.put("customer_mobile",rs.getString("customer_mobile"));
				results.put("customer_email",rs.getString("customer_email"));
				results.put("customer_password",rs.getString("customer_password"));
				results.put("customer_address",rs.getString("customer_address"));
				results.put("customer_city",rs.getString("customer_city"));
				results.put("customer_state",Integer.parseInt(rs.getString("customer_state")));
				results.put("customer_pincode",rs.getString("customer_pincode"));	
				results.put("customer_id",rs.getString("customer_id"));	
				results.put("center_name",rs.getString("center_name"));
				results.put("center_location_id",Integer.parseInt(rs.getString("center_location_id")));
				results.put("center_company_id",Integer.parseInt(rs.getString("center_company_id")));
				results.put("center_description",rs.getString("center_description"));
				results.put("center_contact",rs.getString("center_contact"));
				results.put("center_id",rs.getString("center_id"));
				results.put("center_image",rs.getString("center_image"));
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
}

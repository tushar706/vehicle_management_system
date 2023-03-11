package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Bill extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Bill()
    {
		Connect.connect_mysql();
	}
	public String updateBillPayment(String bill_id) {
		String SQL = "UPDATE `bill` SET `bill_status` = ? WHERE `bill_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1, "Paid");
			pstmt.setString(2, bill_id);
			
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
	//////////Save User Details /////
	public String saveBill(HashMap billData)
	{
		String SQL = "INSERT INTO `bill` (`bill_pickup_id`, `bill_date`, `bill_description`, `bill_amount`) VALUES (?, ?, ?, ?);";
		int record=0, last_inserted_id=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) billData.get("bill_pickup_id"));
			pstmt.setString(2,(String) billData.get("bill_date"));
			pstmt.setString(3,(String) billData.get("bill_description"));
			pstmt.setString(4,(String) billData.get("bill_amount"));
			
			
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
		return error;
	}
	//////////////////Function for getting Users Details//////////	
    public HashMap getBillDetails(String bill_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `pickup`, `bill`, `customer`, `center` WHERE pickup_customer_id AND bill_pickup_id = pickup_id AND pickup_center_id = center_id AND bill_id = "+bill_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("bill_id",rs.getString("bill_id"));
				results.put("bill_pickup_id",rs.getString("bill_pickup_id"));
				results.put("bill_date",rs.getString("bill_date"));
				results.put("bill_amount",rs.getString("bill_amount"));
				results.put("bill_description",rs.getString("bill_description"));
				results.put("center_name",rs.getString("center_name"));
				results.put("center_contact",rs.getString("center_contact"));
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
				results.put("bill_status",rs.getString("bill_status"));
				count++;
            }
			if(count==0)
			{
				results.put("bill_id","");
				results.put("bill_pickup_id",0);
				results.put("bill_date","");
				results.put("bill_amount","");
				results.put("bill_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Bill ////
	public String updateBill(HashMap billData)
	{
		String SQL = "UPDATE `bill` SET `bill_pickup_id` = ?, `bill_date` = ?, `bill_description` = ?, `bill_amount` = ? WHERE `bill_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) billData.get("bill_pickup_id"));
			pstmt.setString(2,(String) billData.get("bill_date"));
			pstmt.setString(3,(String) billData.get("bill_description"));
			pstmt.setString(4,(String) billData.get("bill_amount"));
			pstmt.setString(5,(String) billData.get("bill_id"));
			
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
    public ArrayList getAllBill(int customerID)
	{
		String SQL = "SELECT * FROM `pickup`, `bill`, `customer`, `center` WHERE pickup_customer_id = customer_id AND bill_pickup_id = pickup_id AND pickup_center_id = center_id";
		if(customerID != 0)
			SQL = "SELECT * FROM `pickup`, `bill`, `customer`, `center` WHERE pickup_customer_id = customer_id AND bill_pickup_id = pickup_id AND pickup_center_id = center_id AND customer_id = "+customerID;
		
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("bill_id",rs.getString("bill_id"));
				results.put("bill_pickup_id",rs.getString("bill_pickup_id"));
				results.put("bill_date",rs.getString("bill_date"));
				results.put("bill_amount",rs.getString("bill_amount"));
				results.put("bill_description",rs.getString("bill_description"));
				results.put("bill_date",rs.getString("bill_date"));
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
				results.put("pickup_center_id",Integer.parseInt(rs.getString("pickup_center_id")));
				results.put("center_company_id",Integer.parseInt(rs.getString("center_company_id")));
				results.put("center_description",rs.getString("center_description"));
				results.put("center_contact",rs.getString("center_contact"));
				results.put("center_id",rs.getString("center_id"));
				results.put("center_image",rs.getString("center_image"));
				results.put("center_email",rs.getString("center_email"));
				results.put("pickup_name",rs.getString("pickup_name"));
				results.put("pickup_email",rs.getString("pickup_email"));
				results.put("pickup_address",rs.getString("pickup_address"));
				results.put("bill_status",rs.getString("bill_status"));
				results.put("pickup_id",rs.getString("pickup_id"));
				results.put("pickup_name",rs.getString("pickup_name"));
				results.put("pickup_email",rs.getString("pickup_email"));
				results.put("pickup_address",rs.getString("pickup_address"));
				results.put("pickup_mobile",rs.getString("pickup_mobile"));
				results.put("pickup_date",rs.getString("pickup_date"));
				
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
	public String getPickupOption(Integer SelID)
    {
		int selectedID = SelID.intValue();
    	return Connect.getOptionList("pickup","pickup_id","pickup_id","pickup_id,pickup_id",selectedID,"1");
    }
}

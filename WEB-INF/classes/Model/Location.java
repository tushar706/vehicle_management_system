package Model;

import java.util.*;
import java.sql.*;
import com.*;
import java.io.*;

public class Location extends Connect
{
    /////Function for connect to the MySQL Server Database////////////
	public Location()
    {
		Connect.connect_mysql();
    }
	//////////Save User Details /////
	public String saveType(HashMap typeData)
	{
		String SQL = "INSERT INTO `location` (`location_name`, `location_description`) VALUES (?, ?);";
		int record=0; 
		String error = "";
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			pstmt.setString(1,(String) typeData.get("location_name"));
			pstmt.setString(2,(String) typeData.get("location_description"));
			
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
    public HashMap getTypeDetails(int location_id)
	{
        HashMap results = new HashMap();
        int count=0;
		try
		{
            String SQL =  "SELECT * FROM `location` WHERE location_id = "+location_id ;
            statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{
				results.put("location_id",rs.getString("location_id"));
				results.put("location_name",rs.getString("location_name"));
				results.put("location_description",rs.getString("location_description"));
				count++;
            }
			if(count==0)
			{
				results.put("location_id","");
				results.put("location_name","");
				results.put("location_description","");
			}
         }
		 catch(Exception e)
		 {
            System.out.println("Error is: "+ e);
       	 }
        return results;
    }
    /// Update the Type ////
	public String updateType(HashMap typeData)
	{
		String SQL = "UPDATE `location` SET `location_name` = ?, `location_description` = ? WHERE `location_id` = ?;";
		String error = "";
		
		int record=0;	
		
		try
		{
			pstmt = connection.prepareStatement(SQL);
			
			pstmt.setString(1,(String) typeData.get("location_name"));
			pstmt.setString(2,(String) typeData.get("location_description"));
			pstmt.setString(3,(String) typeData.get("location_id"));
			
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
    public ArrayList getAllType()
	{
		String SQL = "SELECT * FROM `location`";
		int count=0;
        ArrayList resultArray = new ArrayList();
        try
		{			
			statement = connection.createStatement();
            rs = statement.executeQuery(SQL);
            while(rs.next())
			{		
				HashMap results = new HashMap();
				results.put("location_id",rs.getString("location_id"));
				results.put("location_name",rs.getString("location_name"));
				results.put("location_description",rs.getString("location_description"));
				
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

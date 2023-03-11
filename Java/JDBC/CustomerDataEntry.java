package jdbc;

import java.sql.*;
import java.util.*;

public class CustomerDataEntry {
     
	 Connection con;
	 
	 
	
	 void addNew(String custid, String custname, String address, String city, String mobileno, String addinfo) throws Exception
	  {
		   con = DbOps.getConnection();
		   PreparedStatement insertstmt = con.prepareStatement("insert into customer values (?,?,?,?,?,?)");
		   insertstmt.setString(1, custid);
		   insertstmt.setString(2, custname);
		   insertstmt.setString(3, address);
		   insertstmt.setString(4, city);
		   insertstmt.setString(5, mobileno);
		   insertstmt.setString(6, addinfo);
		   //INSERT INTO CUSTOMER VALUES
		   //('C0014','Anurag','Sharda Nagar','Saharanpur','9624354677','OK')
		   insertstmt.executeUpdate();
	   }
	 
	 ResultSet select() throws Exception
	 {
		 con = DbOps.getConnection();
		 PreparedStatement stmt = con.prepareStatement("select * from customer order by custid desc");
		 ResultSet rs = stmt.executeQuery();
		 return rs;
	 }
	
	 
	 
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Scanner scan = new Scanner(System.in);
        System.out.println("Please enter customer id");
        String custid = scan.nextLine();
        System.out.println("Please enter the customer name");
        String custname = scan.nextLine();
        System.out.println("Please enter the customer address");
        String address = scan.nextLine();
        System.out.println("Please enter the customer city");
        String city = scan.nextLine();
        System.out.println("Please enter the mobile no");
        String mobile = scan.nextLine();
        System.out.println("Please enter the Additional Info");
        String addinfo = scan.nextLine();
        
        CustomerDataEntry custdata = new CustomerDataEntry();
        
        try
        {
        custdata.addNew(custid, custname, address, city, mobile, addinfo);
        
        ResultSet rset = custdata.select();
        
        System.out.println("Customer Id \t Customer Name");
        while(rset.next())
        {
        	System.out.println(rset.getString(1)+"\t"+rset.getString(2));
        }
        }
        catch(Exception ex)
        {
        	ex.printStackTrace();
        }
        
        System.out.println("Data Saved");
	}

}

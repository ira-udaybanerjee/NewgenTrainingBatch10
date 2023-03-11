package jdbc;

//import java.sql.Connection;
//import java.sql.DriverManager;

import java.sql.*;

public class DbOps
{
	private static Connection connection;
	
	
	public static Connection getConnection() throws Exception
	{   
		//Register Driver
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//Establish Connection with Database and assign it to a variable
	    connection = DriverManager.getConnection("jdbc:sqlserver://DESKTOP-9312IQB;databaseName=NewgenTraining_B10;trustServerCertificate=true", "sa", "root");
		//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				//Establish Connection with Database and assign it to a variable
		//connection = DriverManager.getConnection("jdbc:odbc:NEWGEN10", "sa", "root");
			    
		
		return connection;
	}
	
}

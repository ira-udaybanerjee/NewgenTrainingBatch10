package session5;

import org.json.simple.*;
import org.json.simple.parser.*;

import java.io.*;

import java.nio.file.*;

import java.util.*;

public class JSONBasic3 {
	
	public static void writeJsonSimpleDemo(String filename) throws Exception
	{
	    JSONObject sampleObject = new JSONObject();
	    sampleObject.put("name", "Ajay");
	    sampleObject.put("age", 35);

	    JSONArray messages = new JSONArray();
	    messages.add("Hi!");
	    messages.add("How are you?");

	    sampleObject.put("messages", messages);
	    
	  
	    Files.write(Paths.get(filename), sampleObject.toJSONString().getBytes());	 
	   
	}
	
	public static Object readJsonSimpleDemo(String filename) throws Exception
	{
	    FileReader reader = new FileReader(filename);
	    
	    JSONParser jsonParser = new JSONParser();	  
	    
	    return jsonParser.parse(reader);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		  
		  try
		  {
		  writeJsonSimpleDemo("C:\\JSONFiles\\example.json");
		  System.out.println("Data Written to JSON File");
		    
		  Scanner scan = new Scanner(System.in);
		  String choice = "n";
		    
		  System.out.println("Read Contents?");
		  choice = scan.nextLine();
		    
		  if(choice.equals("y"))
		  {
			  JSONObject jsonObject = (JSONObject)readJsonSimpleDemo("C:\\JSONFiles\\example.json");
			  
			  //System.out.println(jsonObject);
			  System.out.println(jsonObject.get("name"));
			  //System.out.println(jsonObject.get("messages"));
			  JSONArray msg = (JSONArray)jsonObject.get("messages");
			  System.out.println(msg.get(0));
			  System.out.println(msg.get(1));			  
			  System.out.println(jsonObject.get("age"));
		  }
		  }
		  catch(Exception ex)
		  {
			  
		  }
		    
		
	}

}

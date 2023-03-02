package session5;

import java.util.*;
import org.json.simple.*;

public class JSONBasic2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HashMap obj=new HashMap();    
		obj.put("name","Ajay");    
		obj.put("age",39);    
		obj.put("salary",60000.00d);  
		
		String jsonText = JSONValue.toJSONString(obj);  
		
		System.out.print(jsonText);  
	}

}

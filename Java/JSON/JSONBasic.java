package session5;

import org.json.simple.*;

public class JSONBasic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JSONObject jsonObj = new JSONObject();
		
        JSONArray obj = new JSONArray();
        
        obj.add("Uday");
        obj.add(39);
        obj.add(10000.75f);
        obj.add(true);

        jsonObj.put("Employee Details", obj);
        
        System.out.print(jsonObj);
	}

}

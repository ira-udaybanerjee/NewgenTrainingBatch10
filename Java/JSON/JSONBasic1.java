package session5;

import org.json.simple.*;

public class JSONBasic1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JSONArray root = new JSONArray();
        JSONObject container = new JSONObject();
        
        JSONArray canDetail = new JSONArray();
        
        JSONObject canId = new JSONObject();
        canId.put("candidate id", 1);
        canDetail.add(canId);
        
        JSONObject canName = new JSONObject();
        canName.put("candidate name", "Uday");
        canDetail.add(canName);
        
        JSONArray canQual = new JSONArray();
        canQual.add("B.Tech.");
        canQual.add("M.B.A.");
        canQual.add("Microsoft Certified Associate");
        
        JSONObject canQualList = new JSONObject();
        canQualList.put("candidate qualification", canQual);
        
        canDetail.add(canQualList);
        
        JSONObject canId1 = new JSONObject();
        canId1.put("candidate id", 2);
        canDetail.add(canId1);
        
        JSONObject canName1 = new JSONObject();
        canName1.put("candidate name", "Aditi");
        canDetail.add(canName1);
        
        JSONArray canQual1 = new JSONArray();
        canQual1.add("B.C.A.");       
        canQual1.add("Microsoft Certified Associate");
        
        JSONObject canQualList1 = new JSONObject();
        canQualList1.put("candidate qualification", canQual1);
        canDetail.add(canQualList1);
        
        
        container.put("Candidate Details", canDetail);
        
        root.add(container);
        
        System.out.println(root.toJSONString());
        
	}

}

package session2;

import java.util.*;

public class HashMapDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        
		//Key-Value
		
		HashMap<String, Integer> map = new HashMap<>();
		 
		
        // Adding elements to the Map
        // using standard add() method
        map.put("vishal", 10);
        map.put("sachin", 30);
        map.put("vaibhav", 20);
        map.put("uday", 25);
 
        // Print size and content of the Map
        System.out.println("Size of map is:- " + map.size());
 
        // Printing elements in object of Map
        System.out.println(map);
 
        // Checking if a key is present and if
        // present, print value by passing
        // random element
        if (map.containsKey("vishal"))
        {
 
            // Mapping
            Integer a = map.get("vishal");
 
            // Printing value fr the corresponding key
            
            System.out.println("value for key \"vishal\" is:- " + a);            
            
        }
        
        
       HashMap<Integer, String> hm2 = new HashMap<Integer, String>();

    // Adding elements using put method
    // Custom input elements
   
       hm2.put(11, "New Zealand");
       hm2.put(12, "India");
       hm2.put(13, "Australia");

    
    // Print and display mapping of HashMap 2
       System.out.println("Mapping of HashMap hm2 are : " + hm2);
       
       hm2.remove(12);
       
       System.out.println("New hm2= "+ hm2);
       
       hm2.replace(11, "India");
       System.out.println("Updated hm2= "+ hm2);
       
       System.out.println(hm2.get(11));
	}

}

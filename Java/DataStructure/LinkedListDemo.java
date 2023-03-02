package session2;

import java.util.*;

public class LinkedListDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		LinkedList<String> ll = new LinkedList<String>(); 
	    
        ll.add("HTML"); 
        ll.add("CSS"); 
        
        ll.add(1, "Java Script"); 
    
        System.out.println("Initial LinkedList " + ll); 
    
        ll.set(1, "SQL Server"); 
    
        System.out.println("Updated LinkedList " + ll);
        
        ll.addFirst("Java");
        
        System.out.println("New Linked List v1 "+ll);
        
        ll.addLast("PHP");
        
        System.out.println("New Linked List v2 " + ll);
        
       
        
              
	}

}

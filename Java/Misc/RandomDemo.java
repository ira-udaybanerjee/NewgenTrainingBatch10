package session3;

import java.util.*;

public class RandomDemo {

	public static void main(String[] args) {
	
		// TODO Auto-generated method stub
		System.out.println("1st Random Number: " + Math.random());   
		System.out.println("2nd Random Number: " + Math.random());  
		System.out.println("3rd Random Number: " + Math.random());   
		System.out.println("4th Random Number: " + Math.random());
		
		
		
		Random random = new Random();   
		// Generates random integers 0 to 300
		System.out.println("Randomly Generated Integers Values"); 
		
		for (int i = 1; i <=10; i++)
		{
		  int x = random.nextInt(20);   
		  System.out.println(x); 
		}
		
		 
		   
		// Generates Random doubles values  
		double a = Math.ceil(random.nextDouble()*1000);  
		double b = random.nextDouble();   
		// Prints random double values  
		System.out.println("Randomly Generated Double Values");  
		System.out.println(a);   
		System.out.println(b);    
		// Generates Random float values  
		float f=random.nextFloat();  
		float i=random.nextFloat();  
		// Prints random float values  
		System.out.println("Randomly Generated Float Values");  
		System.out.println(f);   
		System.out.println(i);   
		// Generates Random Long values  
		long p = random.nextLong();   
		long q = random.nextLong();   
		// Prints random long values  
		System.out.println("Randomly Generated Long Values");  
		System.out.println(p);   
		System.out.println(q);    
		// Generates Random boolean values  
		boolean m=random.nextBoolean();  
		boolean n=random.nextBoolean();  
		// Prints random boolean values  
		System.out.println("Randomly Generated Boolean Values");  
		System.out.println(m);   
		System.out.println(n);   
	}

}

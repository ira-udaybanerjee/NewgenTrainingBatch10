package session2;

public class ArrayDemo {

	public static void main(String[] args)
	{
		// TODO Auto-generated method stub
		// declares an Array of integers.
	      //int[] arr;
	          
		 
	      // allocating memory for 5 integers.
	      int[] arr = new int[5];
	          
	      // initialize the first elements of the array
	      arr[0] = 10;
	          
	      // initialize the second elements of the array
	      arr[1] = 20;
	          
	      //so on...
	      arr[2] = 30;
	      arr[3] = 40;
	      arr[4] = 50;
	      
	      System.out.println("Full Array Display: "+arr);
	      
	      // accessing the elements of the specified array
	      
	      System.out.println("\nIterating through Array");
	      System.out.println("_________________________");
	      for (int i = 0; i < arr.length; i++)
	      {
	         System.out.println("Element at index " + i + " : "+ arr[i]);   
	      }
	      
	      
	      
	      
	       // declaring and initializing 2D array
	        int mdarr[][] = { {2,7,9},{3,6,1},{7,4,2},{10,11,12} };
	        
	        //System.out.println("\nValue="+mdarr[4][1]);
	        
	        System.out.println("Full 2D Array:" + mdarr);
	        // printing 2D array
	        System.out.println("\nIterating through MD Array");
		    System.out.println("____________________________");
		    
	        for (int i=0; i< 4 ; i++) //Controls the rows
	        {
	            for (int j=0; j < 3 ; j++) //Controls the columns
	            {
	                System.out.print(mdarr[i][j] + " ");	 
	            }
	           System.out.println();
	        }
	        
	        
	        
	        //Declaring a Character Array and Copy to another array
	        
	        char[] copyFrom = { 'd', 'e', 'c', 'a', 'f', 'f', 'e', 'i', 'n', 'a', 't', 'e', 'd' };  
	        //declaring a destination array  
	        char[] copyTo = new char[7];  
	        //copying array using System.arraycopy() method  
	        System.arraycopy(copyFrom, 0, copyTo, 0, 6);  //Second last represents the starting point in second array Last parameter represents no of elements to be copied
	        //printing the destination array  
	        System.out.println("Copy Array" + copyTo);  
	        
	        //Cloning an array
	        
	        int oarr[]={33,3,4,5};  
	        System.out.println("Printing original array:");
	        
	        //
	        for(int i:oarr) 
	        {
	           System.out.println(i);  
	        }
	          
	        System.out.println("Printing clone of the array:");  
	        int carr[]=oarr.clone();  
	        
	        for(int i:carr)  
	        {
	          System.out.println(i);  
	        }
	        
	}
}

package session2;

import java.util.*;

public class ArrayListDemo 
{

	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
       ArrayList a1=new ArrayList();
       
       //Generic List
       ArrayList<Integer> a2=new ArrayList<Integer>();
       
       ArrayList<String> a3=new ArrayList<String>();
       
      
       ArrayList a4 = new ArrayList();
       
       a1.add(1);
       a1.add("Uday");
       a1.add(2000.00f);
       //
       a1.add(new ArrayDemo());
       
       a2.add(10);
       a2.add(11);
       
       //Error
       //a2.add("Java"); 
       
       a3.add("Java");
       //Error
       //a3.add(100);
       
       a4.add("1");
       a4.add("Python");
       a4.add("Java");
       
       a4.add("C#");
       a4.add("Ruby");
       
       System.out.println("All elements of a4= " + a4);
       
       //Other arraylist functions (Common for all)
       
       //Object o = a1.get(0);
       
       //System.out.println("o="+o);
       
       Integer a = a2.get(1);
       
       System.out.println("a="+a);
       
       a1.clear();            
      
       //Exception expected to occur
        try
        {    	 
    	  Object b = a1.get(1);
          System.out.println(b);
        }
       catch(IndexOutOfBoundsException ex)
       {
    	   System.out.println(ex.getMessage());
       }
       
       int index = a4.indexOf("Java");
       System.out.println("Index="+index);
       
       Object removed=a4.remove(4);
       System.out.println("Removed="+removed);
       
       System.out.println("\nElements of a4");
       System.out.println("_______________");
       for(int ctr=0; ctr<a4.size();ctr++)
       {
    	   System.out.println(a4.get(ctr));
       }
       
       a4.add(1, "JQuery");
       
       System.out.println("New Array List a4= "+a4);
       
       a4.set(1, "AJAX");
       System.out.println("Updated Array List a4= "+a4);
	}

}

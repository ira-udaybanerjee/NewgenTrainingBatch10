package package2;

public class UI {
     
	//Created overloaded function called displayArea
	//that can take an object of either Circle or Rectangle
	//and do the display work
	//Overloading demonstrates static polymorphism
	
	/*public static void displayArea(Circle c)
     {
    	 System.out.println("Circle Area: " + c.getArea());
     }
     
     public static void displayArea(Rectangle r)
     {
    	 System.out.println("Rectangle Area:" + r.getArea());
     }
     
     public static void displayArea(Square s)
     {
    	 System.out.println("Square Area: " + s.getArea());
     }*/
	
	//Demonstrates Dynamic Polymorphism
	public static void displayArea(Shape s)
	{
		System.out.println("Area of " + s.getName()+": " + s.getArea());
	}
}

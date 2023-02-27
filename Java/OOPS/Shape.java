package package2;

public abstract class Shape 
{
   String name;
   
   Shape(String shapename)
   {
	   name = shapename;
   }
   
   public String getName()
   {
	   return name;
   }
	
   public abstract float getArea();  
   
   public abstract float getPerimeter();
  
}

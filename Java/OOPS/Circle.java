package package2;

public class Circle extends Shape
{
   float r;
   Circle(float radius)
   {
	   super("Circle");
	   r = radius;
   }
   
   //Function Overriding
   public float getArea()
   {
	   return 3.14f * r * r;
   }
   
   public float getPerimeter()
   {
	   return 2 * 3.14f * r;
   }
}

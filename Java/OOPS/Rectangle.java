package package2;

public class Rectangle extends Shape {
   
	float l,b;
	
	Rectangle(float length, float breadth)
	{
		super("Rectangle");
		l = length;
		b = breadth;
	}
   
	//Function Overriding
    public float getArea()
    {
    	return l * b;
    }
    
    public float getPerimeter()
    {
    	return 2 * (l + b);
    }
}

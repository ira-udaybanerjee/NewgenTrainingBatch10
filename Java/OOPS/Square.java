package package2;

public class Square extends Shape {
   
	float s;
	Square(float side)
	{
		super("Square");
		s= side;
	}
	
	public float getArea()
	{
		return s * s;
	}
	
	public float getPerimeter()
	{
		return 4 * s;
	}
}

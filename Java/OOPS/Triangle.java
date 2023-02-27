package package2;

public class Triangle extends Shape{
     
	float b, h;
	
	Triangle(float base, float height)
	{
		super("Triangle");
		b = base;
		h = height;
	}
	
	public float getArea()
	{
		return 0.5f * b * h;
	}
	
	public float getPerimeter()
	{
		return 0.0f;
	}
	
	
}

package package3;

//A class can implement more than one interfaces
//but a class can not extend more than one classes
//It can be said that interfaces supports multiple
//inheritence

public class Square implements IShape, ISomething {
     
	float side;
	
	Square(float side)
	{
		this.side = side;
	}
	
	public float getArea()
	{
		return this.side * this.side;
	}
	
	public float getPerimeter()
	{
		return 4 * this.side;
	}
	
	public void dosomething()
	{
		System.out.println("You are doing nothing..");
	}
}

package package6;

public class Person {
    
	private int personid;
	private String personname;
	private float personincome;
	
	//Overloaded constructor
	Person()
	{
		personid = 0;
		personname="";
		personincome=0.0f;
	}
	
	Person(int id, String name, float income) throws Exception
	{
		personid = id;
		personname = name; 
		
		if(income < 100)
		{
			throw new Exception("Income can not be less than 100");
		}
		else
		{
			personincome=income;
		}
			
	}
	
	void setId(int id)
	{
		
		personid = id;
	}
	
	void setName(String name)
	{
		personname = name;
	}
	
	void setIncome(float income) throws Exception
	{
		if(income < 100)
		{
			throw new Exception("Income can not be less than 100");
		}
		personincome = income;
	}
	
	int getId()
	{
		return personid;
	}
	
	String getName()
	{
		return personname;
	}
	
	float getTax()
	{
		if (personincome > 1000000)
		{
			return 0.30f * personincome;
		}
		else
		{
			return 0.10f * personincome;
		}
	}
}

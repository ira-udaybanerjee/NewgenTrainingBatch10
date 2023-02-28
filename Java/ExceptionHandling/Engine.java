package package6;

public class Engine {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//Exceptions are error generated at run time
		//Exceptions cause your program to terminate
		//abruptly
		try
		{
		Person p = new Person();
		p.setId(1);
		p.setName("Uday");
		p.setIncome(20);
		System.out.println("Try ends here");
		}
		catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		finally
		{
			System.out.println("Program complete");
		}
		
	}

}

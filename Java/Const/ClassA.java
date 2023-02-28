package package4;

public class ClassA
{
   int num;
   
   //final makes pi as a constant
   final float pi;
   
   public ClassA()
   {
	   num = 0;
	   pi = 3.14f;
   }
   
   private void doeverything()
   {
	   System.out.println("Do everything");
   }
   
   public final void dosomething()
   {
	   num = 1;
	   //pi = 4.44f;
	   doeverything();
	   System.out.println("Hello All");
   }
   
   void donothing()
   {
	   System.out.println("Do nothing");
   }
}

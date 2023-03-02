package session2;

import java.util.EmptyStackException;
import java.util.Stack;

public class StackLab {

	static void push(Stack st, String a) 
	   {
	      st.push(a);
	      
	      System.out.println("push(" + a + ")");
	      
	      System.out.println("stack: " + st);
	   }

	   static void pop(Stack st) 
	   {
	      System.out.print("pop -> ");
	      String a = st.pop().toString().toUpperCase();
	      //Object a = st.pop();
	      System.out.println(a);
	      System.out.println("stack: " + st);
	   }
	   
	public static void main(String[] args) 
	{
		// TODO Auto-generated method stub
		 Stack st = new Stack();
	      System.out.println("stack: " + st);
	      
	      push(st, "programming");
	      push(st, "of");
	      push(st, "world");
	      push(st, "welcome to the");
	      
	      pop(st);
	      pop(st);
	      pop(st);
	      pop(st);
	      try {
	         pop(st);
	      } catch (EmptyStackException e) {
	         System.out.println("empty stack");
	      }
	}

}

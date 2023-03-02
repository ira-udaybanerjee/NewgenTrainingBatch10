package session4;

import java.util.*;

public class Main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
       
	   Scanner scan = new Scanner(System.in);	
		
	   ArrayList<Candidate> candidateList=new ArrayList<Candidate>();
       
       /*Candidate c1=new Candidate(1, "Shyam");
       candidateList.add(c1);
       
       Candidate c2=new Candidate(2, "Shivam");
       candidateList.add(c2);
       
       Candidate c3=new Candidate(3, "Ayushi");
       candidateList.add(c3);
       
       Candidate c4 = new Candidate(4, "Shivi");
       candidateList.add(c4);*/
	  
	   String choice="y";
	   
	   System.out.println("Please enter the candidate details");
	   System.out.println("__________________________________");
	   do
	   {
		   System.out.println("Candidate No");
		   //int candidateno=scan.nextInt();
		   int candidateno=Integer.parseInt(scan.nextLine());
		   System.out.println("Candidate Name");
		   String candidatename = scan.nextLine();		   
		   
		   for(Candidate c:candidateList)
		   {
			   if(c.getCandidateNo()==candidateno)
			   {
				   throw new Exception("Duplicate Id Entered");
			   }
		   }
		   
		   Candidate c = new Candidate(candidateno, candidatename);
		   candidateList.add(c); 		
		  
		   
		   System.out.println("Do you wish to continue? (Press n for no)");
		   choice=scan.nextLine();
		   
		  
		   
	   }while(!(choice.equals("n")));
	   
       
       System.out.println("Please enter the search id");
       System.out.println("-------------------------");
       
       int searchid=Integer.parseInt(scan.nextLine());      
       
       System.out.println("Candidate No\t\tCandidate Name");
       System.out.println("-------------------------------");
       
       for(Candidate c:candidateList)
       {
    	   System.out.println(c.getCandidateNo()+"\t\t\t"+c.getCandidateName());
       }
       
     /*  for (Candidate c:candidateList)
       {
    	 if(c.getCandidateNo()==searchid)
    	 {
          System.out.println(c.getCandidateNo()+"\t\t\t"+c.getCandidateName());
    	 }
       } */
       
	}
	


}

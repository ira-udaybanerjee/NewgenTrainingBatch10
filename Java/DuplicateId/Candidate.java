package session4;

public class Candidate 
{
   private int candidateno;
   private String candidateName;
   
   public Candidate()
   {
	   candidateno = 0;
	   candidateName="";
   }
   
   public Candidate(int candidateno, String candidatename)
   {
	   this.candidateno=candidateno;
	   this.candidateName=candidatename;
   }
   
   public void setCandidateNo(int candidateno)
   {
	   this.candidateno=candidateno;
   }
   
   public void setCandidateName(String candidatename)
   {
	   this.candidateName=candidatename;
   }
   
   public int getCandidateNo()
   {
	   return this.candidateno;
   }
   
   public String getCandidateName()
   {
	   return this.candidateName;
   }
}

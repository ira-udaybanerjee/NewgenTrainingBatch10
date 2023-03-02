package session3;

public class StringDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        String companyName = "Mawgen Software";
        
        String companyName2 = "Maojen Software";
        
        int arrlength = companyName.length();
        System.out.println("Length of Array: "+ arrlength);
        
        int indexof = companyName.indexOf("Software");
        System.out.println("Index of: "+indexof);
        
        int charat = companyName.charAt(3);
        System.out.println("Char At: " + (char)charat);
        
        int comparison = companyName.compareTo(companyName2);
        System.out.println("Comparison: "+ comparison);
        
        boolean startsWith = companyName.startsWith("M");
        System.out.println("Starts with M?: " + startsWith);
        
        boolean endsWith = companyName.endsWith("f");
        System.out.println("Ends with e?: "+endsWith);
        
        
        String Str = new String("Welcome-to-Newgen-Software");
        System.out.println("Split Return Value :" );      
        
        String newr="";
        for (String r: Str.split("-"))
        {
           //newr=newr.concat(r).concat("\t");   
          System.out.print(r+" ");	
        }
        System.out.println(newr);
        
        String newStr = Str.replace("Software", "Technologies");
        System.out.println("New Str Value: " + newStr);
        
        System.out.println("Lower case Str: " + Str.toLowerCase());
        
        System.out.println("Upper Case Str: " + Str.toUpperCase());
        
        System.out.println("Is Str Empty:" + Str.isEmpty());
        
        System.out.println("Concatenated Strings: " + Str.concat(newStr));
        
        System.out.println("Concatenated Strings 2: "+ Str.concat(" ").concat(newStr));
        
        //System.out.println(Str.concat(" Uday"));
        
        //System.out.println((char)97);
	}
}

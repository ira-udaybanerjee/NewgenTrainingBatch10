package session3;

public class MathDemo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        float num = -1.49f;
        
        float absnum = Math.abs(num);
        System.out.println("Absolute Value: " + absnum);
        
        int roundnum = Math.round(absnum);
        System.out.println("Round Value: " + roundnum);
        
        double ceilnum = Math.ceil(1.00001);
        System.out.println("Ceiling value: " + ceilnum);
        
        double floornum = Math.floor(1.9999999);
        System.out.println("Floor Value: " + floornum);
        
        double sqt = Math.sqrt(9);
        System.out.println("Square Root="+sqt);
        
        double cbt = Math.cbrt(8);
        System.out.println("Cube Root="+cbt);
        
        double pw = Math.pow(3, 4);
        System.out.println("Powered Value="+pw);
        
        
        double minnum = Math.min(1, 5);
        System.out.println("Minimum Value: "+minnum);
        
        double maxnum = Math.max(1.006d, 1.6d);
        System.out.println("Maximum Value: " + maxnum);
        
	}

}

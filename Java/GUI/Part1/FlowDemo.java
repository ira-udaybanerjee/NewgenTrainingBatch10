package package1;

import javax.swing.*;
import java.awt.*;

public class FlowDemo {

	private JFrame f; 
	private JButton b1,b2,b3,b4,b5;

	public FlowDemo()
	{
		f = new JFrame("GUI example");
		b1 = new JButton("Button 1"); 
		b2 = new JButton("Button 2");
		b3 = new JButton("Button 3");  
		b4 = new JButton("Button 4"); 
		b5 = new JButton("Button 5");
	}
	
	void launchFrame()
	{
		f.setLayout(new FlowLayout());		
		f.add(b1);
		f.add(b2);
		f.add(b3); 
		f.add(b4);
		f.add(b5); 
		f.pack();
		f.setVisible(true);

	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		FlowDemo guiWindow = new FlowDemo();
		guiWindow.launchFrame();
	}

}

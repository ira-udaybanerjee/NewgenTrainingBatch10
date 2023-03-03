package package2;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class TestButton {
	 private JFrame f; 
	 private JButton b;
	 
	 public TestButton()
	 {
	 f = new JFrame("Test");
	 b = new JButton("Press Me!");
	 
	 b.setActionCommand("ButtonPressed");
	 }
	 
	 public void launchFrame() 
	 {
	  ButtonHandler handler = new ButtonHandler();
	  b.addActionListener(handler); 
	  f.add(b,BorderLayout.CENTER);
	  f.pack();
	  f.setVisible(true);
	 }

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestButton guiApp = new TestButton();
		guiApp.launchFrame();

	}

}

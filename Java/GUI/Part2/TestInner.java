package package2;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class TestInner {

	 private JFrame f;
	 private JTextField tf;
	  
	 public TestInner() 
	  {
	  f = new JFrame("Inner classes example");
	  tf = new JTextField(30);
	  }
	 
	  class MyMouseMotionListener extends MouseMotionAdapter {
	  public void mouseDragged(MouseEvent e) {
	  String s = "Mouse dragging: X = "+ e.getX()
	  + " Y = " + e.getY();
	  tf.setText(s);
	  }
	  }
	  
	  class MouseClickHandler extends MouseAdapter {
		  public void mouseClicked(MouseEvent e) {
		  String s = "Mouse Clicked";
		  tf.setText(s);
		  }
		  }
	  
	  public void launchFrame() {
	  JLabel label = new JLabel("Click and drag the mouse");
	  // Add components to the frame
	  f.add(label, BorderLayout.NORTH);
	  f.add(tf, BorderLayout.SOUTH);

	  // Add a listener that uses an Inner class
	  f.addMouseMotionListener(new MyMouseMotionListener());
	  f.addMouseListener(new MouseClickHandler());
	 // Size the frame and make it visible
	  f.setSize(300, 200);
	  f.setVisible(true);
	 }
	  

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestInner obj = new TestInner();
	    obj.launchFrame();

	}

}

package package3;

import javax.swing.*;
import java.awt.*;

public class CustomerForm extends JFrame
{
  JLabel lblCustomerId;
  JTextField txtCustomerId;
  JPanel panel;
  
  public CustomerForm()
  {
	  super("Customer Form");
	  panel = new JPanel();
	  
	  lblCustomerId=new JLabel("CustomerId");
	  txtCustomerId=new JTextField(50);
	  
	  panel.add(lblCustomerId);
	  panel.add(txtCustomerId);
	  
	  this.add(panel);
	  
	  this.setSize(300,200);
  }
}

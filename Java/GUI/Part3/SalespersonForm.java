package package3;

import javax.swing.*;
import java.awt.*;

public class SalespersonForm extends JFrame
{
	JLabel lblSalespersonId;
	  JTextField txtSalespersonId;
	  JPanel panel;
	  
	  public SalespersonForm()
	  {
		 
		  super("Salesperson Form");
		  
		  panel = new JPanel();
		  lblSalespersonId=new JLabel("SalespersonId");
		  txtSalespersonId=new JTextField(50);
		  
		  panel.add(lblSalespersonId);
		  panel.add(txtSalespersonId);
		  
		  this.add(panel);
		  
		  this.setSize(300,200);
	  }
}

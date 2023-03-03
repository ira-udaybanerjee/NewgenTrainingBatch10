package package2;

import java.awt.event.*;

public class ButtonHandler implements ActionListener
{
	public void actionPerformed(ActionEvent e)
	{
		
		 System.out.println("Action occurred");
		 System.out.println("Button’s command is: "
		 + e.getActionCommand());	 		 
    }

}

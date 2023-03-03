package package3;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MenuHandler implements ActionListener {

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
        switch(e.getActionCommand())
        {
          case "frm_Customer":
        	 new CustomerForm().setVisible(true);
        	 break;
          case "frm_Salesperson":
        	  new SalespersonForm().setVisible(true);
        	  break;        
        	  
        }
	}

}

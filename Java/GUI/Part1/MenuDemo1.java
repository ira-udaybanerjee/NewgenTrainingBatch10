package package1;

import javax.swing.*;

import java.awt.*;

public class MenuDemo1 {
    
	JFrame frm;
	JMenuBar bar;
	JMenu formsmenu;
	JMenu reportsmenu;
	
	JMenuItem formcustomer;
	JMenuItem formsalesperson;
	
	JMenuItem reportsales;
	JMenuItem reportsalary;
	
	
	
	public MenuDemo1()
	{
		frm = new JFrame("Menu Demo");
		
		bar = new JMenuBar();
		
		formsmenu= new JMenu("Forms");	
	
		
		formcustomer = new JMenuItem("Customer Data");
		formsmenu.add(formcustomer);
		
		formsalesperson = new JMenuItem("Salesperson Data");
		formsmenu.add(formsalesperson);
		
		reportsmenu = new JMenu("Reports");
		
		reportsales = new JMenuItem("Sales Report");
		reportsalary = new JMenuItem("Salary Report");
		
		reportsmenu.add(reportsales);
		reportsmenu.add(reportsalary);
		
		bar.add(formsmenu);
		bar.add(reportsmenu);
		
		frm.add(bar);
		
		frm.setJMenuBar(bar);
		
		frm.setSize(500,300);
		
		frm.setVisible(true);
	}
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        MenuDemo1 md = new MenuDemo1();
	}

}

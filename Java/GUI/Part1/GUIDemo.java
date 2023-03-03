package package1;

import javax.swing.*;
import java.awt.*;

public class GUIDemo {

	JLabel lbl1, lbl2;
	JTextField txtName, txtAddress;
	JComboBox cmbDepartment;
	JRadioButton radMale;
	JRadioButton radFemale;
	ButtonGroup radgrp;
	
	JFrame frm;
	JPanel pnl, pnl2;
	
	public GUIDemo()
	{
		lbl1=new JLabel("Please enter your name");
		txtName = new JTextField(50);
		lbl2 = new JLabel("Please enter your address");
		txtAddress = new JTextField(50);
		
		cmbDepartment = new JComboBox();
		cmbDepartment.addItem("Government");
		cmbDepartment.addItem("Semi Government");
		cmbDepartment.addItem("Private");
		
		radMale = new JRadioButton("Male");
		radFemale = new JRadioButton("Female");
		radgrp = new ButtonGroup();
		radgrp.add(radMale);
		radgrp.add(radFemale);
		
		frm=new JFrame("My Application");
		pnl=new JPanel();
		pnl.add(lbl1);
		pnl.add(txtName);
		pnl.add(lbl2);
		pnl.add(txtAddress);
		pnl.add(cmbDepartment);
		pnl.add(radMale);
		pnl.add(radFemale);
		
		frm.add(pnl);
		
		frm.setSize(500, 300);
		frm.setVisible(true);
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        GUIDemo gui=new GUIDemo();
	}

}

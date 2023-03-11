package jdbc;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;


public class FormCustomer extends JFrame implements ActionListener{
    
	Connection con;
	ResultSet dataset;
	
	
	JPanel topPanel;
	JPanel panel1;
	JPanel panel2;
	JPanel bottomPanel;
	
	JButton btnFirst;
	JButton btnPrevious;
	JButton btnNext;
	JButton btnLast;

	
	JLabel lblcustid;
	JTextField txtcustid;
	
	JLabel lblcustname;
	JTextField txtcustname;
	
	JLabel lbladdress;
	JTextField txtaddress;
	
	JLabel lblcity;
	JComboBox cmbcity;
	
	JLabel lblmobile;
	JTextField txtmobile;
	
	JLabel lbladdinfo;
	JTextField txtaddinfo;
	
	JButton btnNew;
	JButton btnDelete;
	
	JButton btnSave;
	
	int saveFlag=0;
	
	FormCustomer() throws Exception
	{			
		this.launchFrame();	
		
		this.refreshData();
		
		this.showData();		
		
		
		this.setSize(800, 400);
		this.setVisible(true);
	}
	
	public void refreshData() throws Exception
	{
		dataset = CustomerDb.selectAll();	
		dataset.last();
		//dataset.first();
	}
	
	public void showData() throws Exception
	{
		
		txtcustid.setText(dataset.getString(1));
		txtcustname.setText(dataset.getString(2));
		txtaddress.setText(dataset.getString(3));
		cmbcity.setSelectedItem(dataset.getString(4));
		txtmobile.setText(dataset.getString(5));
		txtaddinfo.setText(dataset.getString(6));
		
	
	}
	
	public void launchFrame()
	{
		topPanel = new JPanel();
		panel1 = new JPanel();
		bottomPanel = new JPanel();
		
		btnFirst = new JButton("First");
		btnFirst.setActionCommand("First");
		btnFirst.addActionListener(this);
		
		btnPrevious = new JButton("Previous");
		btnPrevious.setActionCommand("Previous");
		btnPrevious.addActionListener(this);
		
		btnNext = new JButton("Next");
		btnNext.setActionCommand("Next");
		btnNext.addActionListener(this);
		
		btnLast = new JButton("Last");
		btnLast.setActionCommand("Last");
		btnLast.addActionListener(this);
		
		topPanel.add(btnFirst);
		topPanel.add(btnPrevious);
		topPanel.add(btnNext);
		topPanel.add(btnLast);
		topPanel.setLayout(new FlowLayout());
		
		
		lblcustid = new JLabel("Customer Id");
		txtcustid = new JTextField();
		
		lblcustname = new JLabel("Customer Name");
		txtcustname = new JTextField();
		
		lbladdress = new JLabel("Address");
		txtaddress = new JTextField();
		
		lblcity = new JLabel("City");
		cmbcity = new JComboBox();
		cmbcity.addItem("Delhi");
		cmbcity.addItem("Mumbai");
		cmbcity.addItem("Chennai");
		cmbcity.addItem("Bengaluru");
		cmbcity.addItem("Dehradun");
		cmbcity.addItem("Saharanpur");
		
		lblmobile = new JLabel("Mobile No");
		txtmobile = new JTextField();
		
		lbladdinfo = new JLabel("Additional Info");
		txtaddinfo = new JTextField();
		
		btnSave = new JButton("Save");
		btnSave.setActionCommand("Save");
		btnSave.addActionListener(this);
		
		panel1.add(lblcustid);
		panel1.add(txtcustid);
		
		panel1.add(lblcustname);
		panel1.add(txtcustname);
		
		panel1.add(lbladdress);
		panel1.add(txtaddress);
		
		panel1.add(lblcity);
		panel1.add(cmbcity);
		
		panel1.add(lblmobile);
		panel1.add(txtmobile);
		
		panel1.add(lbladdinfo);
		panel1.add(txtaddinfo);	
		
		
		bottomPanel.add(btnSave);
		btnSave.addActionListener(this);
		
		panel1.setLayout(new GridLayout(7,2));
		
		panel2=new JPanel();
		
		btnNew = new JButton("Add New");
		btnNew.setActionCommand("New");
		btnNew.addActionListener(this);
		
		btnDelete = new JButton("Delete");
		btnDelete.setActionCommand("Delete");
		btnDelete.addActionListener(this);
		
		panel2.add(btnNew);
		panel2.add(btnDelete);
		panel2.setLayout(new FlowLayout());
		
		this.add(topPanel);
		this.add(panel1);
		this.add(panel2);
		this.add(bottomPanel);
		
		this.setLayout(new GridLayout(4,1));
	
	}
	
	public void clearControls()
	{
		txtcustid.setText("");
		txtcustname.setText("");
		txtaddress.setText("");
		txtmobile.setText("");
		txtaddinfo.setText("");
	}
	
	public void actionPerformed(ActionEvent e) 
	{
		try
		{
		switch(e.getActionCommand())
		{
		case "Save":	
			if(saveFlag ==  1)
			{
			 this.addNew(txtcustid.getText(), txtcustname.getText(), txtaddress.getText(), cmbcity.getSelectedItem().toString(), txtmobile.getText(), txtaddinfo.getText());
			}
			else if(saveFlag == 0)
			{
		     this.update(txtcustid.getText(), txtcustname.getText(), txtaddress.getText(), cmbcity.getSelectedItem().toString(), txtmobile.getText(), txtaddinfo.getText());
			}
			JOptionPane.showMessageDialog(null, "Data Saved");
			this.refreshData();
			this.showData();
			saveFlag = 0;
			break;
		case "First":
			dataset.first();
			this.showData();
			break;
		case "Previous":
			dataset.previous();
			this.showData();
			break;
		case "Next":
			dataset.next();
			this.showData();
			break;
		case "Last":
			dataset.last();
			this.showData();
			break;
		case "New":
			this.clearControls();
			saveFlag = 1;
			break;
		}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		
	}
	
	 void addNew(String custid, String custname, String address, String city, String mobileno, String addinfo) throws Exception
	  {
		   con = DbOps.getConnection();
		   PreparedStatement insertstmt = con.prepareStatement("insert into customer values (?,?,?,?,?,?)");
		   insertstmt.setString(1, custid);
		   insertstmt.setString(2, custname);
		   insertstmt.setString(3, address);
		   insertstmt.setString(4, city);
		   insertstmt.setString(5, mobileno);
		   insertstmt.setString(6, addinfo);
		   insertstmt.executeUpdate();
	   }
	
	 void update(String custid, String custname, String address, String city, String mobileno, String addinfo) throws Exception
	   {
		   con = DbOps.getConnection();
		   PreparedStatement insertstmt = con.prepareStatement("update customer set customername = ?, address = ?, city = ?, mobileno = ?, additionalinfo = ? where customerid = ?");
		   
		   insertstmt.setString(1, custname);
		   insertstmt.setString(2, address);
		   insertstmt.setString(3, city);
		   insertstmt.setString(4, mobileno);
		   insertstmt.setString(5, addinfo);
		   insertstmt.setString(6, custid);
		   
		   insertstmt.executeUpdate();
	   }
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
        FormCustomer frmcust = new FormCustomer();
        
	}

}

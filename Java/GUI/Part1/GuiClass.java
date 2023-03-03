package package1;

import java.awt.EventQueue;

import javax.swing.JFrame;

import javax.swing.*;


public class GuiClass extends JFrame 
{

	/**
	 * Launch the application.
	 */
	
	JLabel label1,label2,label3;
	JTextField text1,text2; 
	JComboBox choice1;
	JButton ok, cancel;
	JPanel panel1; 
	JFrame frame1;

	
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GuiClass frame = new GuiClass();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public GuiClass() {
		setBounds(100, 100, 450, 300);
		
		frame1=new JFrame("My Window"); 
		panel1=new JPanel();
		frame1.add(panel1); 
		frame1.setSize(200, 300);
		label1=new JLabel("Enter Your Name");
		panel1.add(label1);
		text1=new JTextField(30);
		panel1.add(text1);
		label2=new JLabel("Enter Contact No");
		panel1.add(label2);
		text2=new JTextField(30);
		panel1.add(text2);
		label3=new JLabel("Location"); panel1.add(label3);
		choice1=new JComboBox(); 
		choice1.addItem("New Delhi"); 
		choice1.addItem("Texas");
		choice1.addItem("Melbourne");
		choice1.addItem("Mumbai"); 
		choice1.addItem("Sydney"); 
		choice1.addItem("Milan");
		choice1.addItem("Florida");
		choice1.addItem("Casablanca");
		ok=new JButton("OK");
		cancel=new JButton("CANCEL");
		panel1.add(choice1); 
		panel1.add(ok);
		panel1.add(cancel);
		frame1.setSize(200, 300); 
		frame1.setVisible(true);

		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

}

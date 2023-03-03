package package1;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.*;

public class MenuDemo extends JFrame {

	private JPanel contentPane;
	
	JPanel panel1; JMenuBar mybar;
	JMenu menu1, menu2,menu4;
	JMenuItem menuitem3, menuitem5;


	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MenuDemo frame = new MenuDemo();
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
	public MenuDemo() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
         
		mybar=new JMenuBar(); 
		setJMenuBar(mybar);
		menu1=new JMenu("Color");  
		menu2=new JMenu("Red"); 
		menuitem3=new JMenuItem("Green");
		menu4=new JMenu("Orange");
		menuitem5=new JMenuItem("Black");
		mybar.add(menu1);    
		menu1.add(menu2); 
		menu2.add(menuitem3);
		menu1.addSeparator(); 
		menu1.add(menu4); 
		mybar.add(menuitem5);
		panel1=new JPanel();  
		getContentPane().add(panel1);
		setSize(200,350);  
		setVisible(true);

		setContentPane(contentPane);
	}

}

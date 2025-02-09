import javax.swing.*;
import java.awt.*;
import java.sql.*;
import java.awt.event.*;


public class subject extends JFrame implements ActionListener{
    




    String f;
    // JRadioButton i;
    JButton next;
    String sub[] = new String[20];
    String user="Admin";
    String c;
    int count;
    int i=0;
    int y=50;
    String arr[];
    int j;


    ButtonGroup bg=new ButtonGroup();   
    JRadioButton rb[];


    subject(String user,int count){
    // subject(){

        // JLabel heading = new JLabel("GoroDoro Institute");
        // heading.setBounds(190,130,850,100);
        // heading.setFont(new Font("Mongolian Baiti",Font.PLAIN,72));
        // heading.setForeground(Color.orange);
        // add(heading);
        
        getContentPane().setBackground(Color.white);
        setLayout(null);  

        
        
 

        String query ="select * from users where username= ?";
        // count
        rb=new JRadioButton[count];
        ResultSet rs;
        try{  
            Class.forName("com.mysql.cj.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/quize","root","gaurav@123");  
            // Statement stmt=con.createStatement();  
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user);
            rs=pstmt.executeQuery();
           
          
         
            int j=0;
            arr=new String[count];
            while(rs.next()){ 
                c=rs.getString(3);
                // System.out.println(c);
                // System.out.println(c);
                arr[j]=c;
                j++;
            }
            // System.out.println(f);
            con.close();  
            }catch(Exception e){ 
                System.out.println(e);
            } 

        
            
        next = new JButton("Next");
        next.setBounds(1100,550,200,40);
        next.setFont(new Font("Tahoma",Font.PLAIN,20));
        next.setBackground(new Color(30,144,255));
        next.setForeground(Color.white);
        next.addActionListener(this);
        add(next);

        //  MenuBar mb=new MenuBar();  
        //  Menu menu=new Menu("Menu");  
        //  Menu submenu=new Menu("Sub Menu");  
        //  MenuItem i1=new MenuItem("Item 1");  
        //  MenuItem i2=new MenuItem("Item 2");  
        //  MenuItem i3=new MenuItem("Item 3");  
        //  MenuItem i4=new MenuItem("Item 4");  
        //  MenuItem i5=new MenuItem("Item 5");  
        //  menu.add(i1);  
        //  menu.add(i2);  
        //  menu.add(i3);  
        //  submenu.add(i4);  
        //  submenu.add(i5);  
        //  menu.add(submenu);  
        //  mb.add(menu);  
        //  setMenuBar(mb);

        
            
          
    
            setSize(1500,780);
            setLocation(20,20);
            setVisible(true);


            for(int i=0;i<count;i++){
                rb[i]=new JRadioButton();  
            
            }
            for(int j=0;j<count;j++){
                y=y+50;
                 
                rb[j].setBounds(75,y,100,30); 
                rb[j].setText(arr[j]);
                add(rb[j]);

                
                // System.out.println(rb[j].getActionCommand());
                // System.out.println(rb[j].getActionCommand());
                // System.out.println(rb[j].getActionCommand());
            }

            
            for(i=0;i<count;i++){
                bg.add(rb[i]);
            }

            // JRadioButton i = new JRadioButton(); 
            // System.out.println(bg.getSelection().getActionCommand());
    }
    public void actionPerformed(ActionEvent ae){
        if(ae.getSource()==next){
            System.out.println(rb[i]);
        if(rb[i].isSelected()){
            System.out.println("Hello");
            String sub = new String(rb[j].getActionCommand());
            System.out.println(sub);
            new Quiz(user,sub);
        }
        
        // System.out.println(rb[j].getActionCommand());
        // String sub=new String(bg.getSelection().getActionCommand());
        System.out.println(sub);
            setVisible(false);
          
        }
    }
    
    // public static void main(String args[]){
    //     new subject(String c,int count);
    // }
}




// rs=select * from users;
// while(rs.next()){
//     count++;
// }



// 2nd 




// select * from users 

// i=0;
// while(rs.next){
//     sub[i]=rs.getstring(3);
//     i++;
// }
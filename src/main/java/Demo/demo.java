package demo;
import java.awt.Color;
import java.awt.event.*;
import javax.swing.*;
public class demo extends JFrame{
    JPanel p;
    JButton btnRed,btnGreen,btnYellow;
    public demo() {
        super("一个小测试");
        p = new JPanel();
        btnRed = new JButton("变红");
        btnGreen = new JButton("变绿");
        btnYellow = new JButton("变黄");
        p.add(btnRed);
        p.add(btnGreen);
        p.add(btnYellow);
        ButtonListener b1 = new ButtonListener();
        btnRed.addActionListener(b1);
        btnGreen.addActionListener(b1);
        btnYellow.addActionListener(b1);
        this.add(p);
        this.setSize(300,200);
        this.setLocation(100,100);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


    }
    public class ButtonListener implements ActionListener{
        public void actionPerformed(ActionEvent e) {
            Object source = e.getSource();
            if(source==btnRed) {
                p.setBackground(Color.red);
            }else if(source==btnGreen) {
                p.setBackground(Color.green);
            }else {
                p.setBackground(Color.yellow);
            }
        }
    }
    public static void main(String[] args) {
        demo cf = new demo();
        cf.setVisible(true);
    }

}
package cs532;

import javax.swing.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;

public class FindActor extends JFrame {

    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";

    private static final String USERNAME = "root";
    private static final String PASSWORD = null;
    private static final String CONN_STRING = "jdbc:mysql://localhost/sakila";

    private JTextField jtfId = new JTextField(10);
    private JButton jbtShowActor = new JButton("Show Actor");

    // Statement for executing queries
    private Statement stmt;

    public FindActor() {
        // Initialize database connection and create a Statement object
        initializeDB();

        jbtShowActor.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jbtShowActor_actionPerformed(e);
            }
        });

        JPanel jPanel1 = new JPanel();
        jPanel1.add(new JLabel("Actor ID"));
        jPanel1.add(jtfId);
        jPanel1.add(jbtShowActor);

        add(jPanel1, BorderLayout.CENTER);
    }

    private void initializeDB() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");

            // Establish a connection
           // Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/sakila", "admin", "admin");
            Connection connection = DriverManager.getConnection(CONN_STRING, USERNAME, PASSWORD);

            System.out.println("Database connected");

            // Create a statement
            stmt = connection.createStatement();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void jbtShowActor_actionPerformed(ActionEvent e) {
        String id = jtfId.getText();

        try {
            String queryString = "select first_name, last_name from actor where "
                    + "actor_id = '" + id + "'";

            ResultSet rset = stmt.executeQuery(queryString);

            if (rset.next()) {
                String firstName = rset.getString(1);
                String lastName = rset.getString(2);

                // Display result in a dialog box
                JOptionPane.showMessageDialog(null, id + ":  " + firstName + " " + lastName);
            } else {
                // Display result in a dialog box
                JOptionPane.showMessageDialog(null, "Not found");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    /**
     * Main method
     */
    public static void main(String[] args) {
        FindActor frame = new FindActor();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Find Actor");
        frame.setSize(380, 80);
        frame.setLocationRelativeTo(null); // Center the frame
        frame.setVisible(true);
    }
}

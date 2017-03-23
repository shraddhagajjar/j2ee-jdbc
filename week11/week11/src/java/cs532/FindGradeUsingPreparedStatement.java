package cs532;

import javax.swing.*;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;

public class FindGradeUsingPreparedStatement extends JFrame {

    private JTextField jtfID = new JTextField(9);
    private JTextField jtfCourseId = new JTextField(5);
    private JButton jbtShowGrade = new JButton("Show Grade - PS");

    // PreparedStatement for executing queries
    private PreparedStatement preparedStatement;

    public FindGradeUsingPreparedStatement() {
        // Initialize database connection and create a Statement object
        initializeDB();

        jbtShowGrade.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jbtShowGrade_actionPerformed(e);
            }
        });

        JPanel jPanel1 = new JPanel();
        jPanel1.add(new JLabel("Student ID"));
        jPanel1.add(jtfID);
        jPanel1.add(new JLabel("Course ID"));
        jPanel1.add(jtfCourseId);
        jPanel1.add(jbtShowGrade);

        add(jPanel1, BorderLayout.CENTER);
    }

    private void initializeDB() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded");

            // Establish a connection
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/registration", "admin", "admin");
            System.out.println("Database connected");

            String queryString = "select firstname, lastname, subjectId, courseNumber, grade "
                    + "from student, enrollment, course "
                    + "where student.id = ? and enrollment.courseId = ? "
                    + "and enrollment.courseId = course.courseId "
                    + "and enrollment.id = student.id";

            // Create a statement
            preparedStatement = connection.prepareStatement(queryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void jbtShowGrade_actionPerformed(ActionEvent e) {
        String studentId = jtfID.getText();
        String courseId = jtfCourseId.getText();
        try {
            preparedStatement.setString(1, studentId);
            preparedStatement.setString(2, courseId);
            ResultSet rset = preparedStatement.executeQuery();

            if (rset.next()) {
                String firstName = rset.getString(1);
                String lastName = rset.getString(2);
                String subject = rset.getString(3);
                String number = rset.getString(4);
                String grade = rset.getString(5);

                // Display result in a dialog box
                JOptionPane.showMessageDialog(null, firstName + " " + lastName 
                        + "'s grade on course " + subject + number + " is " + grade);
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
        FindGradeUsingPreparedStatement frame = new FindGradeUsingPreparedStatement();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Find Grade Using PreparedStatement");
        frame.setSize(380, 120);
        frame.setLocationRelativeTo(null); // Center the frame
        frame.setVisible(true);
    }
}

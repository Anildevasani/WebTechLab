<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Retrieve Student Data</title>
</head>
<body>
    <h2>Student Data</h2>
    <%
        String url = "jdbc:mysql://localhost:3306/StudentDB";
        String username = "yourUsername"; // replace with your MySQL username
        String password = "yourPassword"; // replace with your MySQL password
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();
            String sql = "SELECT * FROM Students";
            rs = stmt.executeQuery(sql);
    %>
            <table border="1">
                <tr>
                    <th>Student ID</th>
                    <th>Student Name</th>
                    <th>Course</th>
                    <th>Branch</th>
                    <th>Year</th>
                    <th>Email ID</th>
                </tr>
                <%
                    while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getInt("student_id") %></td>
                    <td><%= rs.getString("student_name") %></td>
                    <td><%= rs.getString("course") %></td>
                    <td><%= rs.getString("branch") %></td>
                    <td><%= rs.getInt("year") %></td>
                    <td><%= rs.getString("studentemailid") %></td>
                </tr>
                <%
                    }
                %>
            </table>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>

<%-- 
    Document   : index
    Created on : 25-08-2023, 4:41:00
    Author     : steph
--%>
<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!-- Boostrap -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <title>Listado de productos</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
        %>

        <div class="container">
            <h1>Productos</h1>
            <table class="table">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Nombre Producto</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Stock</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_almacen?user=root");
                        st = con.createStatement();
                        rs = st.executeQuery("SELECT * FROM tbl_productos");
                        while (rs.next()) {
                    %>
                    <tr>
                        <th scope="row"><%= rs.getInt("id_producto")%></th>
                        <td><%= rs.getString("nombre_producto")%></td>
                        <td><%= rs.getInt("precio_producto")%></td>
                        <td><%= rs.getString("descripción")%></td>
                        <td><%= rs.getInt("stock")%></td>
                    </tr>

                    <% }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>

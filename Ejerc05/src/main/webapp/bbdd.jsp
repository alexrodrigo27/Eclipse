<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BBDD</title>
</head>
<body>

 <%
    // Obtener los parámetros del formulario
    String equipo = request.getParameter("equipo");
    String corredor = request.getParameter("corredores"); // Cambiado a "corredores"
    String acciones = request.getParameter("acciones"); // Cambiado a "acciones"
    String descriptor = request.getParameter("descriptor");
    String terreno = request.getParameter("terreno");
    int inicio = Integer.parseInt(request.getParameter("km_inicio"));
    int finales = Integer.parseInt(request.getParameter("final"));
    String carrera = request.getParameter("carrera");
    String categoria = request.getParameter("categoria");

    
      try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/DAM2", "root", "Sirope1_");
           PreparedStatement preparedStatement = conn.prepareStatement("INSERT INTO ciclismo VALUES(?,?,?,?,?,?,?,?,?)")) {

        preparedStatement.setString(1, equipo);
        preparedStatement.setString(2, corredor);
        preparedStatement.setString(3, acciones);
        preparedStatement.setString(4, descriptor);
        preparedStatement.setString(5, terreno);
        preparedStatement.setInt(6, inicio);
        preparedStatement.setInt(7, finales);
        preparedStatement.setString(8, carrera);
        preparedStatement.setString(9, categoria);

        int rowsAffected = preparedStatement.executeUpdate(); // Ejecutar la inserción en la base de datos

        if (rowsAffected > 0) {
          out.println("Inserción exitosa");
        } else {
          out.println("No se insertaron filas");
        }

      } catch (SQLException e) {
        out.println("Error en la inserción: " + e.getMessage());
      } catch (NumberFormatException e) {
        out.println("Error al convertir a número: " + e.getMessage());
      } catch (Exception e) {
        e.printStackTrace();
      }
     
    
  %>

</body>
</html>
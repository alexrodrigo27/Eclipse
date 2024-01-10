 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
      text-align: center;
      margin: 0;
      padding: 0;
    }

    h1 {
      color: #333;
      margin-top: 20px;
    }

    form {
      background-color: #fff;
      border: 1px solid #ccc;
      border-radius: 8px;
      padding: 20px;
      width: 300px;
      margin: 0 auto;
    }

    label {
      display: block;
      margin-top: 10px;
    }

    select, input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      margin-top: 5px;
    }

    select:focus, input:focus {
      outline: none;
      border-color: #007bff;
    }

    button {
      background-color: #007bff;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      margin-top: 10px;
      cursor: pointer;
    }
  </style>

  <script>
    function mostrarCorredores() {
      var equipoSeleccionado = document.getElementById("equipo").value;
      var corredores = document.getElementById("corredores");
      corredores.innerHTML = ""; // Limpiar opciones anteriores

      var corredoresDisponibles = [];

      if (equipoSeleccionado === "UAE") {
        corredoresDisponibles = ["Tadej Pogacar", "Juan Ayuso", "Joao Almeida"];
      } else if (equipoSeleccionado === "JUMBO VISMA") {
        corredoresDisponibles = ["Jonas Vingegaard", "Wout Van Aert", "Sepp Kuss"];
      } else if (equipoSeleccionado === "MOVISTAR") {
        corredoresDisponibles = ["Enric Mas", "Nairo Quintana", "Ruben Guerreiro"];
      }

      if (corredoresDisponibles.length > 0) {
        var corredorLabel = document.createElement("label");
        corredorLabel.setAttribute("for", "corredor");
        corredorLabel.textContent = "Selecciona un corredor:";
        corredores.appendChild(corredorLabel);

        var corredorSelect = document.createElement("select");
        corredorSelect.setAttribute("id", "corredor");
        corredorSelect.setAttribute("name", "corredor");

        for (var i = 0; i < corredoresDisponibles.length; i++) {
          var option = document.createElement("option");
          option.value = corredoresDisponibles[i];
          option.textContent = corredoresDisponibles[i];
          corredorSelect.appendChild(option);
        }

        corredores.appendChild(corredorSelect);
      }
    }
  </script>
</head>
<body>
  <h1>Formulario de Corredores</h1>
  <form method="post" action="bbdd.jsp">
    <label for="equipo">Selecciona un equipo:</label>
    <select id="equipo" name="equipo" onchange="mostrarCorredores()">
      <option value="">Selecciona un equipo</option>
      <option value="UAE">UAE</option>
      <option value="JUMBO VISMA">JUMBO VISMA</option>
      <option value="MOVISTAR">MOVISTAR</option>
    </select>

    <div id="corredores"></div>

    <label for="acciones">Acciones:</label>
    <select id="acciones" name="acciones">
      <option value="Ataque">Ataque</option>
      <option value="Salir a rueda">Salir a rueda</option>
      <option value="Tirar al frente">Tirar al frente</option>
       <option value="Minimizar">Minimizar</option>
    
    </select>
    
    <label for="descriptor">Descriptor:</label>
    <select id="descriptor" name="descriptor">
      <option value="Romper grupo">Romper grupo</option>
      <option value="Corte delantero">Corte delantero</option>
      <option value="Neutralizar hueco">Neutralizar hueco</option>
      <option value="Seleccionar grupo">Seleccionar grupo</option>
      <option value="Colocación">Colocación</option>
      <option value="Meterse en fuga">Meterse en fuga</option>
      <option value="Lanzamiento sprint">Lanzamiento sprint</option>
      <option value="Sprintar">Sprintar</option>
    </select>

    <label for="terreno">Terreno:</label>
    <select id="terreno" name="terreno">
      <option value="Alta Montaña">Alta Montaña</option>
      <option value="Media Montaña">Media Montaña</option>
      <option value="Llano">Llano</option>
      <option value="Cota">Cota</option>
      <option value="Descenso">Descenso</option>
    </select>

    <label for="km_inicio">Km inicio:</label>
    <input type="number" id="km_inicio" name="km_inicio" />

    <label for="final">Final:</label>
    <input type="number" id="final" name="final" />
    
    <label for="carrera">Carrera</label>
    <input type="text" id="carrera" name="carrera" />

 <label for="categoria">Categoria</label>
    <input type="text" id="categoria" name="categoria" />

    <button type="submit">Enviar</button>
  </form>
  
 
</body>
</html>

<?php include('templates/header.html');   ?>

<body>
  <h1 align="center">Base de Fritos ~ Grupo101</h1>
  <p style="text-align:center;">Aqui no se aceptan bajos</p>

  <br>

  <h3 align="center"> Jefes de tiendas por comuna</h3>

  <form align="center" action="consultas/consulta_nombre_comuna.php" method="post">
    <br/>
    Comuna
    <br/>
    <br/>
    <input type="text" name="nombre_comuna">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  
  <br>
  <br>
  <br>

  <h3 align="center"> Cobertura de tiendas</h3>

  <form align="center" action="consultas/consulta_nombre_tienda.php" method="post">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  
  <br>
  <br>
  <br>

  <h3 align="center"> Usuarios que compraron un producto según su descripción</h3>

  <form align="center" action="consultas/consulta_descripcion.php" method="post">
    Descripción:
    <input type="text" name="descripcion">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  <br>
  <br>
  <br>

  <h3 align="center"> Edad promedio de trabajadores por comuna</h3>

  <form align="center" action="consultas/consulta_edad.php" method="post">
    Descripción:
    <input type="text" name="descripcion">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  <br>
  <br>
  <br>

  <h3 align="center">¿Quieres buscar todos los pokemones por tipo?</h3>

  <?php
  #Primero obtenemos todos los tipos de pokemones
  require("config/conexion.php");
  $result = $db -> prepare("SELECT tiendas.nombre,despacho.comuna_de_cobertura FROM tiendas,despacho WHERE tiendas.id=despacho.tienda_id ORDER BY tiendas.id;");
  $result -> execute();
  $dataCollected = $result -> fetchAll();
  ?>

  <form align="center" action="consultas/consulta_tipo.php" method="post">
    Seleccinar un tipo:
    <select name="tipo">
      <?php
      #Para cada tipo agregamos el tag <option value=value_of_param> visible_value </option>
      foreach ($dataCollected as $d) {
        echo "<option value=$d[0]>$d[0]</option>";
      }
      ?>
    </select>
    <br><br>
    <input type="submit" value="Buscar por tipo">
  </form>

  <br>
  <br>
  <br>
  <br>
</body>
</html>

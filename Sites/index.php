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
    Descripción
    <br/><br/>
    <input type="text" name="descripcion">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  <br>
  <br>
  <br>

  <h3 align="center"> Edad promedio de trabajadores por comuna</h3>

  <form align="center" action="consultas/consulta_edad.php" method="post">
    Comuna
    <br/><br/>
    <input type="text" name="comuna">
    <br/><br/>
    <input type="submit" value="Buscar">
  </form>
  <br>
  <br>
  <br>

  <h3 align="center">Tiendas que venden productos de ese tipo</h3>

  <?php
  require("config/conexion.php");
  $result = $db -> prepare("SELECT DISTINCT productos.tipo FROM productos ORDER BY productos.tipo;");
  $result -> execute();
  $dataCollected = $result -> fetchAll();
  ?>

  <form align="center" action="consultas/consulta_tipo.php" method="post">
    Seleccione un tipo de producto:
    <select name="tipo">
      <?php
      foreach ($dataCollected as $d) {
        echo "<option value=$d[0]>$d[0]</option>";
      }
      ?>
    </select>
    <br><br>
    <input type="submit" value="Buscar por tipo">
  </form>

  <h3 align="center">Tiendas que registran la mayor venta de un producto segun su tipo</h3>

  <?php
  require("config/conexion.php");
  $result = $db -> prepare("SELECT DISTINCT productos.tipo FROM productos ORDER BY productos.tipo;");
  $result -> execute();
  $dataCollected = $result -> fetchAll();
  ?>

  <form align="center" action="consultas/consulta_mayor_venta.php" method="post">
    Seleccione un tipo de producto:
    <select name="tipo">
      <?php
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

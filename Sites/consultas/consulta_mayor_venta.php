<?php include('../templates/header.html');   ?>

<body>

  <?php
  require("../config/conexion.php");

  $var = $_POST["tipo"];
  $query = "SELECT DISTINCT tiendas.nombre, SUM(productos_en_tienda.cantidad) as cantidad FROM tiendas, productos, productos_en_tienda WHERE productos.tipo='$var' AND tiendas.id=productos_en_tienda.tienda_id AND productos.id=productos_en_tienda.producto_id GROUP BY tiendas.id ORDER BY cantidad DESC;";
  $result = $db -> prepare($query);
  $result -> execute();
  $Tiendas = $result -> fetchAll(); 
  ?>

  <table>
    <tr>
      <th>Nombre</th>
      <th>Cantidad</th>
    </tr>
  <?php
  foreach ($Tiendas as $Tienda) {
    echo "<tr> <td>$Tienda[0]</td> <td>$Tienda[1]</td> </tr>";
  }
  ?>
  </table>

<?php include('../templates/footer.html'); ?>
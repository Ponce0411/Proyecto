<?php include('../templates/header.html');   ?>

<body>
<?php

  require("../config/conexion.php");

  $descripcion = $_POST["descripcion"];

 	$query = "SELECT usuarios.nombre FROM productos, usuarios, compras, productos_en_compra WHERE usuarios.id=compras.usuario_id AND productos.descripcion LIKE '%$descripcion%' AND compras.id=productos_en_compra.compra_id AND productos_en_compra.producto_id=productos.id GROUP BY usuarios.nombre ORDER BY usuarios.nombre;";

	$result = $db -> prepare($query);
	$result -> execute();
	$usuarios = $result -> fetchAll();
  ?>

  <table>
    <tr>
      <th>Nombre</th>
    </tr>
  
      <?php

        foreach ($usuarios as $usuario) {
          echo "<tr><td>$usuario[0]</td></tr>";
      }
      ?>
      
  </table>

<?php include('../templates/footer.html'); ?>

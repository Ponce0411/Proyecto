<?php include('../templates/header.html');   ?>

<body>
<?php

  require("../config/conexion.php");

    $comuna = strtolower($_POST["comuna"]);  

 	$query = "SELECT direcciones.comuna, AVG(trabajadores.edad) FROM trabajadores, trabajadores_en_tienda, tiendas, direcciones WHERE direcciones.comuna LIKE '%$comuna%' AND direcciones.id=tiendas.direccion_id AND tiendas.id=trabajadores_en_tienda.tienda_id AND trabajadores_en_tienda.trabajador_id=trabajadores.id GROUP BY direcciones.comuna;";
	$result = $db -> prepare($query);
	$result -> execute();
	$Edad = $result -> fetchAll();
  ?>

	<table>
    <tr>
	  <th>Comuna</th>
      <th>Edad promedio</th>
    </tr>
  <?php
	foreach ($Edad as $e) {
  		echo "<tr><td>$e[0]</td><td>$e[1]</td>";
	}
  ?>
	</table>

<?php include('../templates/footer.html'); ?>
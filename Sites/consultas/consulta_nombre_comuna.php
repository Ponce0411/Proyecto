<?php include('../templates/header.html');   ?>

<body>

<?php
  #Llama a conexión, crea el objeto PDO y obtiene la variable $db
  require("../config/conexion.php");

	$nombre = $_POST["nombre_comuna"];

 	$query = "SELECT tiendas.nombre, trabajadores.nombre, direcciones.comuna FROM tiendas, direcciones, trabajadores WHERE direcciones.comuna=$nombre AND direcciones.id=tiendas.direccion_id AND tiendas.jefe_id=trabajadores.id";
	$result = $db -> prepare($query);
	$result -> execute();
	$jefes = $result -> fetchAll();
  ?>

	<table>
    <tr>
      <th>Tienda</th>
      <th>Jefe</th>
      <th>Comuna</th>
    </tr>
  <?php
	foreach ($jefes as $jefe) {
  		echo "<tr> <td>$jefe[0]</td> <td>$jefe[1]</td> <td>$jefe[2]</td> </tr>";
	}
  ?>
	</table>

<?php include('../templates/footer.html'); ?>

<?php include('../templates/header.html');   ?>

<body>

<?php
  #Llama a conexión, crea el objeto PDO y obtiene la variable $db
  require("../config/conexion.php");

	$nombre = $_POST["nombre_comuna"];

 	$query = "SELECT tiendas.nombre, trabajadores.nombre, direcciones.comuna FROM tiendas, direcciones, trabajdores WHERE direcciones.comuna LIKE '%$nombre%' AND direcciones.id=tiendas.direccion_id AND tiendas.jefe_id=trabajadores.id";
	$result = $db -> prepare($query);
	$result -> execute();
	$pokemones = $result -> fetchAll();
  ?>

	<table>
    <tr>
      <th>Tienda</th>
      <th>Jefe</th>
      <th>Comuna</th>
    </tr>
  <?php
	foreach ($pokemones as $pokemon) {
  		echo "<tr> <td>$pokemon[0]</td> <td>$pokemon[1]</td> <td>$pokemon[2]</td> </tr>";
	}
  ?>
	</table>

<?php include('../templates/footer.html'); ?>

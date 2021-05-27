<?php include('../templates/header.html');   ?>

<body>
<?php
  #Llama a conexión, crea el objeto PDO y obtiene la variable $db
  require("../config/conexion.php");

 	$query = "SELECT tiendas.nombre,despacho.comuna_de_cobertura FROM tiendas,despacho WHERE tiendas.id=despacho.tienda_id ORDER BY tiendas.id;";
	$result = $db -> prepare($query);
	$result -> execute();
	$Tiendas = $result -> fetchAll();
  ?>

	<table>
    <tr>
      <th>Tienda</th>
      <th>Comuna</th>
    </tr>
  <?php
	foreach ($Tiendas as $tienda) {
  		echo "<tr><td>$tienda[0]</td><td>$tienda[1]</td>";
	}
  ?>
	</table>

<?php include('../templates/footer.html'); ?>

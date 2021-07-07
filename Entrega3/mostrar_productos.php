<?php
session_start();
require("../config/conexion.php");

$id = $_POST["Id"];
$stock = FALSE;
$despacho = FALSE;

$query0 = "SELECT usuarios_web.rut FROM usuarios_web;";
$result0 = $db2 -> prepare($query0);
$result0 -> execute();
$data0 = $result0 -> fetchAll();
foreach ($data0 as $d) {
    if ($d[0] == $rut) {
        $ingresado = TRUE;
        $_SESSION['register'] = "ya_ingresado";
        break;
     }
} 

if($id == FALSE AND ($name != "" AND $rut != "" AND $age != "" AND $gender != "" AND $adress != "" AND $comunens != "")){
    settype($age, "integer");
    $query = "IF $id IN SELECT producto_id FROM productos_en_tienda WHERE productos_en_tienda.tienda_id= ;";
    $result = $db2 -> prepare($query);
    $result -> execute();
    $_SESSION['register'] = "joya";
    $_SESSION['reg_status'] = "done";
    header("Location: register.php");
} else {
    $_SESSION['reg_status'] = "done";
    header("Location: register.php");
}

?>
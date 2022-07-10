<?php
require_once("../config/conexion.php");
require_once("../models/Productos.php");
$productos = new Productos();

$body = json_decode(file_get_contents("php://input"), true);

switch ($_GET["opcion"]) {

    case "GetAll":
        $datos = $productos->get_producto();
        echo json_encode($datos);
        break;

    case "GetId":
        $datos = $productos->get_productos_x_id($body["producto_id"]);
        echo json_encode($datos);
        break;

    case "Insert":
        $datos = $productos->insert_producto($body["nombre"], $body["genero"], $body["descripcion"], $body["url"], $body["categoria"]);
        echo json_encode($datos);
        break;

    case "Update":
        $datos = $productos->update_producto($body["id"], $body["nombre"], $body["genero"], $body["descripcion"], $body["url"], $body["categoria"]);
        echo json_encode($datos);
        break;

    case "Delete":
        $datos = $productos->delete_producto($body["id"]);
        echo json_encode($datos);
        break;
}

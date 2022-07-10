<?php
class Productos extends Conectar
{
    public function get_producto()
    {
        $db = parent::conexion();
        parent::set_names();
        $sql = "SELECT * FROM producto WHERE eliminado = 1 ORDER BY id DESC;";
        $sql = $db->prepare($sql);
        $sql->execute();
        $resultado = $sql->fetchAll(PDO::FETCH_OBJ);
        $Array = [];
        foreach ($resultado as $d) {
            $Array[] = [
                'id' => (int)$d->id, 'nombre' => $d->nombre, 'url' => $d->url, 'categoria' => $d->categoria,
                'genero' => $d->genero, 'descripcion' => $d->descripcion, 'fecha' => $d->fecha
            ];
        }
        return $Array;
    }

    public function get_productos_x_id($producto_id)
    {
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "SELECT * FROM producto WHERE id = ?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $producto_id);
        $sql->execute();
        $d = $sql->fetch(PDO::FETCH_OBJ);
        $Array = $d ? [
            'id' => (int)$d->id, 'nombre' => $d->nombre, 'url' => $d->url, 'categoria' => $d->categoria,
            'genero' => $d->genero, 'descripcion' => $d->descripcion, 'fecha' => $d->fecha
        ] : [];
        return $Array;
    }

    public function insert_producto($nombre, $genero, $descripcion, $url, $categoria)
    {
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "INSERT INTO `producto`(`nombre`, `genero`, `descripcion`, `url`, `categoria`) VALUES (?,?,?,?,?);";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $nombre);
        $sql->bindValue(2, $genero);
        $sql->bindValue(3, $descripcion);
        $sql->bindValue(4, $url);
        $sql->bindValue(5, $categoria);
        $resultado['estatus'] =  $sql->execute();
        $lastInserId =  $conectar->lastInsertId();
        if ($lastInserId != "0") {
            $resultado['id'] = (int)$lastInserId;
        }
        return $resultado;
    }

    public function update_producto($id, $nombre, $genero, $descripcion, $url, $categoria)
    {
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "UPDATE `producto` SET `nombre`=?,`genero`=?,`descripcion`=?,`url`=?,`fecha`=NOW(),`categoria`=? WHERE id = ?;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $nombre);
        $sql->bindValue(2, $genero);
        $sql->bindValue(3, $descripcion);
        $sql->bindValue(4, $url);
        $sql->bindValue(5, $categoria);
        $sql->bindValue(6, $id);
        $resultado['estatus'] = $sql->execute();
        return $resultado;
    }

    public function delete_producto($id)
    {
        $conectar = parent::conexion();
        parent::set_names();
        $sql = "UPDATE `producto` SET eliminado=0 WHERE id = ?;;";
        $sql = $conectar->prepare($sql);
        $sql->bindValue(1, $id);
        $resultado['estatus'] = $sql->execute();
        return $resultado;
    }
}

<?php
header("Access-Control-Allow-Origin: *");
header("Content-type: application/json; charset=utf-8");
header("Access-Control-Allow-Headers: *");
class Conectar
{
    protected $db;
    protected function Conexion()
    {
        try {
            $NAMEDB = 'heroku_732d3535c5788f8';
            $HOST = 'us-cdbr-east-06.cleardb.net';
            $USER = 'bcda29a4618951';
            $PASSWORD = '568ed9be';
            $conectar = $this->db = new PDO("mysql:local=$HOST;dbname=$NAMEDB", "$USER", "$PASSWORD");
            return $conectar;
        } catch (Exception $e) {
            print "¡Error BD!: " . $e->getMessage() . "<br/>";
            die();
        }
    }

    public function set_names()
    {
        return $this->db->query("SET NAMES 'utf8'");
    }
}

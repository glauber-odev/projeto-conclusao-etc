<?php

class Conexao{

    public static function getConexao(){

        try{

        return new PDO("mysql:host=localhost;dbname=olimpo", "root","" );

        }catch(\PDOException $e){

            echo "Error: Eerro ao se conectar com o banco de dados olimpo: ".$e->getMessage();
             
        }
        return null;
    }

}
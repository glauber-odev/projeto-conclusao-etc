<?php

class Conexao{
    
    public static function getConexao(){
        try{
            return new PDO("mysql:host=localhost;dbname=olimpo", "root" , "");
        }catch(\PDOException $e){
            echo "Error: não foi possível se conectar ao banco de dados olimpo: ".$e->getMessage();
        }
        return null;
    }

}

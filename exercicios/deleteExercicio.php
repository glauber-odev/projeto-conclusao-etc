<?php

if(isset($_POST['idExercicios']) && isset($_POST['nome'])){

$idExercicios = $_POST['idExercicios'];
$nome = $_POST['nome'];

    include_once "src/conexao.php";
        
    $dbh = Conexao::getConexao();
    
    $query = "DELETE FROM olimpo.exercicios WHERE idExercicios = :idExercicios; ";
    
    $stmt = $dbh->prepare($query);
    $stmt->bindParam(":idExercicios", $idExercicios);
    $stmt->execute();
    $qntRegistros = $stmt->rowCount();

    //exclui o arquivo do exercicio da pasta no PC
    unlink('animacoes/'.$nome);

    header("Location:admPanelExercicios.php?msg=Exercicio Excluído com sucesso!");

}else{
    header("Location:admPanelExercicios.php?msg=Ops! Não foi enviado nenhum exercicio.");
}
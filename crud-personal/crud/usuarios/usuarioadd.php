<?php
    header('Content-Type: text/html; charset=utf-8;');
    
    require_once '../src/conexao.php';

    $email = $_POST['email'];
    $password = md5($_POST['password']);
    $nome = $_POST['nome'];
    $status = 1;

    $dbh = Conexao::getConexao();

    $query = "INSERT INTO olimpo.usuarios (email, password, nome, status) 
                VALUES (:email, :password, :nome, :status);"; 
    
    $stmt = $dbh->prepare($query);

    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':password', $password);
    $stmt->bindParam(':nome', $nome);
    $stmt->bindParam(':status', $status);
    
    $result= $stmt->execute();
    if ($result)
    {
        header('location: index.php');
        exit;
    } else {
        echo '<p>Não foi fossível inserir Usuário!</p>';
        $error = $dbh->errorInfo();
        print_r($error);
    }
    $dbh = null;
    echo "<p><a href='index.php'>Voltar</a></p>";
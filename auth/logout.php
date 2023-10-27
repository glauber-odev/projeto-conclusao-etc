<?php
  session_start();

  $usuario = $_SESSION['usuario'] ?? null;
  if (!$usuario) {
    unset($_SESSION['usuario']);  
  }
  session_destroy();
  header("location: ../index.php");
  exit;

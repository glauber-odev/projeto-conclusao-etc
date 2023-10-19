<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exercicio 03 - Usuários</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <script>
    function mascara_cpf(){
    var cpf = document.getElementById('cpf')
    if(cpf.value.length == 3 || cpf.value.length == 7) {
        cpf.value += "."
    } else if(cpf.value.length == 11){
        cpf.value += "-"
    }
}


    </script>
</head>

<body>
    <header>
        <h1>CRUD - Básico</h1>
        <p>Exercício introdutório exemplificando o crud nas tabelas usuários e perfil. </p>
    </header>
    <nav>
        <a href="#">Home</a>
        <a href="index.php">Usuários</a>
        <a href="#">Perfil</a>
    </nav>
    <main>

        <h1>Novo Usuário</h1>
        <form action="" method="post">
            <label>E-mail</label><br>
            <input type="email" name="email" placeholder="Informe seu e-mail." size="80" required autofocus><br>
            <label>Nome</label><br>
            <input type="text" name="nome" placeholder="Informe seu nome." size="80" required><br>
            <label>Password</label><br>
            <input type="password" name="password" placeholder="Informe sua senha." required><br><br>
            <label>CPF</label>
            <input type="text" name="CPF"  id="cpf" maxlength="14" autocomplete="off" placeholder="Ex: 000.000.000-00" required onkeyup="mascara_cpf()">
            <br><br>

            

            <button class="btn" type="submit">Próximo</button>
        </form>
    </main>
</body>

</html>
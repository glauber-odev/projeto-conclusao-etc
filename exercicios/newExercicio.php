<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Adicionar exercicio </title>
</head>
<?php


isset($_POST['nomeExercicio']) ? $nomeExercicio = $_POST['nomeExercicio'] : $nomeExercicio = "";
// $nomeExercicio = isset($_POST['nomeExercicio']) ?? "";
isset($_POST['atividadeFisica']) ? $atividadeFisica = $_POST['atividadeFisica'] : $atividadeFisica = "";
isset($_POST['linkTutorial']) ? $linkTutorial = $_POST['linkTutorial'] : $linkTutorial = "" ;
isset($_POST['descricao']) ? $descricao = $_POST['descricao'] : $descricao = "";
isset($_FILES['animacao']) ? $animacao = $_FILES['animacao'] : $animacao = "";



if(!empty($nomeExercicio && $atividadeFisica && $linkTutorial && $descricao) && $animacao['size'] > 0){
    
    $patternYT = '#^https://www.youtube.com/embed/(.*)#';
    
    $result = preg_match($patternYT,$linkTutorial,$matches);
    
    if($result):
        
        $linkExtraido = $matches[1];

        
            $nomeAnimacao = $animacao['name'];
            $caminhoExercicio = "animacoes/".$nomeAnimacao;
            $extensaoArquivo = pathinfo($animacao['name'], PATHINFO_EXTENSION);
            $tamanhoPermitido = 150000000;
            
            include_once "src/conexao.php";
            
            $dbh = Conexao::getConexao();
            
            $query = " SELECT * FROM olimpo.exercicios WHERE nome_arq = :nome_arq ; ";
            
            $stmt = $dbh->prepare($query);
            $stmt->bindParam(":nome_arq", $nomeAnimacao);
            $stmt->execute();
            $stmt->fetch();
            $qntRegistros = $stmt->rowCount();

            //verifica se já existe no banco de dados
            if($qntRegistros <= 0){
                
                if(verificaFormato($extensaoArquivo)){
                    //verifica tamanho do arquivo
                    if($animacao['size'] < $tamanhoPermitido){
                        move_uploaded_file($animacao['tmp_name'], $caminhoExercicio);

                        $queryAddExercicio = "INSERT INTO olimpo.exercicios ( nome, ativ_fisica, link_tutorial, descricao, nome_arq)
                        VALUES( :nome, :ativ_fisica, :link_tutorial, :descricao, :nome_arq );";

                        $stmtexercicios = $dbh->prepare($queryAddExercicio);
                        $stmtexercicios->bindParam(':nome', $nomeExercicio);
                        $stmtexercicios->bindParam(':ativ_fisica', $atividadeFisica);
                        $stmtexercicios->bindParam(':link_tutorial', $linkExtraido);
                        $stmtexercicios->bindParam(':descricao', $descricao);
                        $stmtexercicios->bindParam(':nome_arq', $nomeAnimacao);
                        $stmtexercicios->execute();

                        echo "Exercicio adicionado com suesso!";
                    
                        }else{
                            echo "Tamanho excedido!";
                        }
                    }else{
                        echo "Não permitido!";
                    };
                }else{
                    echo "Arquivo já existe no site!";
                }

            else:
                echo "O link inserido não é valido<br>";
                echo "Vá no video do youtube, clique em compartilhar>incorporar e pegue o link que contem https://www.youtube.com/embed/";
            endif;

        }elseif(isset($_POST['nomeExercicio'])){
            echo "<p><font color='red'>Algum campo está em branco!</font></p>";
        };


        
    function verificaFormato($extensaoAqv){

    $arrayFormatosAceitos = [ "gif","mov","mp4","webm" ];
    $permitido = false;

    foreach($arrayFormatosAceitos as $formato){
        if($extensaoAqv == $formato){
            $permitido = true;
        }
    }

    return $permitido;

    }


?>


<body>

    <form action="" method="POST" enctype="multipart/form-data">
        <label for="nomeExercicio">Nome do exercicio: </label>
        <input type="text" name="nomeExercicio" placeholder="Flexão"><br/>
        <label for="atividadeFisica">Atividade física: </label>
        <select name="atividadeFisica">
            <option value="ACADEMIA">Academia</option>
            <option value="CALISTENIA">Calistenia</option>
            <option value="AEROBICO">Aeróbico</option>
            <option value="CROSSFIT">Crossfit</option>
            <option value="BOXE">Boxe</option>
        </select><br/>
        <label for="linkTuorial">Link do tutorial: </label>
        <input type="url" name="linkTutorial" placeholder="Insira um link do youtube" pattern="https://www.youtube.com/embed/.*" size="100" required><br/>
        <label for="descricao">Descrição do exercício:</label><br/>
        <textarea name="descricao" placeholder="Insira os detalhes sobre o exericio."></textarea><br/>
        <label for="animacao">Video de animação:</label><br/>
        <input type="file" name="animacao" accept=".gif,.mp4,.mov,.webm" ><br/>
        <input type="submit" value="Enviar">
    </form>
    
</body>
</html>
             
<?=$dbh=null;
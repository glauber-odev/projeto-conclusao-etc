-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/10/2023 às 02:33
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `olimpo`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `assinaturas`
--

CREATE TABLE `assinaturas` (
  `id` int(11) NOT NULL,
  `tipo` varchar(70) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `exercicios`
--

CREATE TABLE `exercicios` (
  `id` int(11) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `descricao` mediumtext NOT NULL,
  `animacao` blob NOT NULL,
  `link_tutorial` varchar(777) NOT NULL,
  `ativ_fisica` int(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fichas_treino`
--

CREATE TABLE `fichas_treino` (
  `id` int(11) NOT NULL,
  `nome` varchar(77) NOT NULL,
  `data_criacao` datetime NOT NULL,
  `descanso` int(4) NOT NULL,
  `series` int(3) NOT NULL,
  `observacoes` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `perfis`
--

CREATE TABLE `perfis` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacoes`
--

CREATE TABLE `solicitacoes` (
  `id` int(11) NOT NULL,
  `estrelas` float NOT NULL,
  `dt_criacao` datetime NOT NULL,
  `dt_modificacao` datetime NOT NULL,
  `idAvaliador` int(11) NOT NULL,
  `idAvaliado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(80) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_adm`
--

CREATE TABLE `usuario_adm` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_anual`
--

CREATE TABLE `usuario_anual` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `gênero` varchar(100) NOT NULL,
  `peso` float NOT NULL,
  `altura` int(3) NOT NULL,
  `data_nasc` date NOT NULL,
  `foto` blob NOT NULL,
  `creditos_FT` int(1) NOT NULL,
  `tipo_pagamento` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `num_cartao` int(11) NOT NULL,
  `data_assinatura` int(11) NOT NULL,
  `periodo` int(11) NOT NULL,
  `nome_cartao` int(11) NOT NULL,
  `cvv` int(11) NOT NULL,
  `vencimento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_comum`
--

CREATE TABLE `usuario_comum` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `senha` varchar(250) NOT NULL,
  `nome` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario_mensal`
--

CREATE TABLE `usuario_mensal` (
  `id` int(11) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nome` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `peso` float NOT NULL,
  `altura` int(3) NOT NULL,
  `data_nasc` date NOT NULL,
  `CPF` int(14) NOT NULL,
  `tipo_pagamento` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `num_cartao` int(19) NOT NULL,
  `nome_cartao` int(11) NOT NULL,
  `cvv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario_mensal`
--

INSERT INTO `usuario_mensal` (`id`, `email`, `password`, `nome`, `status`, `peso`, `altura`, `data_nasc`, `CPF`, `tipo_pagamento`, `valor`, `num_cartao`, `nome_cartao`, `cvv`) VALUES
(2, 'blablabla@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'blablabla', 1, 0, 0, '0000-00-00', 0, 0, 0, 0, 0, 0),
(3, 'isac@email.com', '202cb962ac59075b964b07152d234b70', 'isac', 1, 0, 0, '0000-00-00', 0, 0, 0, 0, 0, 0);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `assinaturas`
--
ALTER TABLE `assinaturas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `exercicios`
--
ALTER TABLE `exercicios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fichas_treino`
--
ALTER TABLE `fichas_treino`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `perfis`
--
ALTER TABLE `perfis`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario_adm`
--
ALTER TABLE `usuario_adm`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario_anual`
--
ALTER TABLE `usuario_anual`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario_comum`
--
ALTER TABLE `usuario_comum`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuario_mensal`
--
ALTER TABLE `usuario_mensal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `assinaturas`
--
ALTER TABLE `assinaturas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `exercicios`
--
ALTER TABLE `exercicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fichas_treino`
--
ALTER TABLE `fichas_treino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfis`
--
ALTER TABLE `perfis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `solicitacoes`
--
ALTER TABLE `solicitacoes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_adm`
--
ALTER TABLE `usuario_adm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_anual`
--
ALTER TABLE `usuario_anual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_comum`
--
ALTER TABLE `usuario_comum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario_mensal`
--
ALTER TABLE `usuario_mensal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

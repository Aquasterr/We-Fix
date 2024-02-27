-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 27/11/2023 às 00:22
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
-- Banco de dados: `wefixcrud`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(80) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`nome`, `cpf`, `email`, `senha`, `endereco`) VALUES
('Crudder2', '15236845268', 'Crudder2@crud.com.br', 'Curdsad2', 'Crudder Rua CRUD Estrada Crud	Crudder Rua CRUD Estrada Crud'),
('Crudder Amo Crud', '212323213', 'Crudder@crud.com.br', '213213123', 'Crudder Rua CRUD Estrada Crud'),
('Cruddererr', '22222222222', 'HomemCrud@CRUD.com.br', 'CrudCrud', 'Crudder Rua CRUD Estrada Crud'),
('Homem CRUD', '344444324', 'Crudder2@CRUD.com.br', 'asdascsacsa', 'Crudder Crudder Crudder Crudder Crudder Crudder Crudder Crudder amo crud');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empreiteiro`
--

CREATE TABLE `empreiteiro` (
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `certificados` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `empreiteiro`
--

INSERT INTO `empreiteiro` (`nome`, `cpf`, `email`, `senha`, `endereco`, `especialidade`, `certificados`) VALUES
('matheuszilaa', '22222222222', 'matheuszilaa@matheuszilaa.com', 'LaoSOskMrM', 'Rua Rua Estrada Estrada Bairro Bairro', 'Arquiteto', 'Dripromaa'),
('matheuszila', '53363010869', 'matheus.boas@uscsonline.com.br', '25435424654565', 'gbyth,uik.ipl.,gjiuk,', 'yugujyfu', 'yui,fyiu,yijmfyj'),
('matheuszin', '93363010869', 'matheus.boas@uscsonline.com.br', 'sadassd5424654565', 'gbyth,uik.ipl.,gjiuk,', 'yugujyfu', 'yui,fyiu,yijmfyjg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `especialidade` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `equipe`
--

INSERT INTO `equipe` (`nome`, `email`, `senha`, `cpf`, `quantidade`, `especialidade`) VALUES
('mersons', 'merso@gmail2.com', 'emers', '4444444', 32, 'encanador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `portfolio`
--

CREATE TABLE `portfolio` (
  `NomePrestador` varchar(255) NOT NULL,
  `TipoDeReforma` varchar(255) NOT NULL,
  `cpf` varchar(255) NOT NULL,
  `Detalhes` varchar(255) NOT NULL,
  `Funcao` varchar(255) NOT NULL,
  `Imagem` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `portfolio`
--

INSERT INTO `portfolio` (`NomePrestador`, `TipoDeReforma`, `cpf`, `Detalhes`, `Funcao`, `Imagem`) VALUES
('Claudio', 'Reformass', '123456789', 'To com problema na mangueira', 'Pedreiro', 'Mangueiras.png'),
('Claudio Rogerio Undriano Crud', 'Reformas de reformas', '222222222', 'To com problema na mangueira', 'Encanador', 'Mangueiras.png'),
('Claudio Roberto Umberto Dagoberto', 'Mangueira', '51858687837', 'To com problema na mangueira', 'Eletricista', 'asdasdasd');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `empreiteiro`
--
ALTER TABLE `empreiteiro`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `portfolio`
--
ALTER TABLE `portfolio`
  ADD PRIMARY KEY (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/04/2024 às 02:10
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
-- Banco de dados: `wefixdb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `arquiteto`
--

CREATE TABLE `arquiteto` (
  `nome` varchar(100) NOT NULL,
  `cpf_arquiteto` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `certificados` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `id_cau_arquiteto` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nota` decimal(2,1) NOT NULL DEFAULT 5.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `arquiteto`
--

INSERT INTO `arquiteto` (`nome`, `cpf_arquiteto`, `email`, `senha`, `endereco`, `certificados`, `telefone`, `id_cau_arquiteto`, `local`, `nota`) VALUES
('Lara Isis Galvão', '37600419734', 'lara-galvao80@mpcnet.com.br', 'lara123', 'Travessa do Piquizeiro', '', '9936376747', 2147483647, 'São Paulo - SP', 5.0),
('Arquiteto Nome 2', '78978978978', 'Arquiteto2@email.com', 'Arquiteto123', 'Rua Arquiteto2', 'pipipipipopopo', '456456456', 123123123, 'São Caetano do Sul - SP', 5.0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(80) NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `local` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`nome`, `cpf_cliente`, `email`, `senha`, `endereco`, `telefone`, `local`) VALUES
('Davi Renan Ryan da Mota', '32741045747', 'davi_damota@alcastro.com.br', 'davi123', 'Rua Presidente Roosevelt', '(21) 2795-', 'São Paulo - SP'),
('NomeCliente', '45678978978', 'NomeCliente@NomeCliente', 'NomeCliente123', 'Rua NomeCliente', '987987654', 'São Caetano do Sul - SP'),
('ClienteTeste', '45685245612', 'Cliente@email.com', 'Cliente123', 'Rua Cliente', '456456456', 'São Caetano do Sul - SP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `empreiteiro`
--

CREATE TABLE `empreiteiro` (
  `idEmpreiteiro` int(11) NOT NULL,
  `cpfArquiteto` varchar(11) NOT NULL,
  `cpfEngenheiro` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `engenheiro`
--

CREATE TABLE `engenheiro` (
  `nome` varchar(100) NOT NULL,
  `cpf_engenheiro` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `certificados` varchar(255) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `id_crea_engenheiro` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nota` decimal(2,1) NOT NULL DEFAULT 5.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `engenheiro`
--

INSERT INTO `engenheiro` (`nome`, `cpf_engenheiro`, `email`, `senha`, `endereco`, `certificados`, `telefone`, `id_crea_engenheiro`, `local`, `nota`) VALUES
('Fábio Edson Anderson Nunes', '142100262', 'fabioedsonnunes@effem.com', 'fabio123', 'Avenida Guanabara', '', '6936033452', 2147483647, 'São Paulo - SP', 5.0),
('Engenheiro', '98798798778', 'EngenheiroTF2@Engenheiro', 'Engenheiro123', 'Rua Engenheiro Estrada Engenheiro', 'C:\\fakepath\\Android Large - 1.png', '456456456', 2147483647, 'São Paulo - SP', 5.0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe`
--

CREATE TABLE `equipe` (
  `nome_equipe` varchar(100) NOT NULL,
  `email_equipe` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `quantidade_equipe` int(11) NOT NULL,
  `especialidades` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `obra`
--

CREATE TABLE `obra` (
  `id_obra` int(11) NOT NULL,
  `local_obra` varchar(255) NOT NULL,
  `descricao_obra` varchar(255) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date DEFAULT NULL,
  `avaliacao_obra` decimal(2,1) DEFAULT NULL,
  `cpf_arquiteto` varchar(255) DEFAULT NULL,
  `cpf_engenheiro` varchar(255) DEFAULT NULL,
  `cpf_profissional` varchar(255) DEFAULT NULL,
  `cpf_cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `obra`
--

INSERT INTO `obra` (`id_obra`, `local_obra`, `descricao_obra`, `data_inicio`, `data_termino`, `avaliacao_obra`, `cpf_arquiteto`, `cpf_engenheiro`, `cpf_profissional`, `cpf_cliente`) VALUES
(123, 'São Paulo - SP', 'e uma obra', '2024-04-02', '2024-04-30', 5.0, '78978978978', '98798798778', '45645678978', '45685245612'),
(821487, 'São Caetano do Sul - SP', 'asdasdsad', '2322-12-31', '1111-11-11', NULL, NULL, NULL, NULL, '45685245612');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissionais_solicitados`
--

CREATE TABLE `profissionais_solicitados` (
  `id_profissional` int(11) NOT NULL,
  `id_solicitacao` int(11) NOT NULL,
  `cpf_arquiteto` varchar(11) NOT NULL,
  `cpf_engenheiro` varchar(11) NOT NULL,
  `cpf_profissional` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissionalgeral`
--

CREATE TABLE `profissionalgeral` (
  `nome` varchar(100) NOT NULL,
  `cpf_profissional` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `especialidade` varchar(100) NOT NULL,
  `certificados` varchar(255) DEFAULT NULL,
  `telefone` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nota` decimal(2,1) NOT NULL DEFAULT 5.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `profissionalgeral`
--

INSERT INTO `profissionalgeral` (`nome`, `cpf_profissional`, `email`, `senha`, `endereco`, `especialidade`, `certificados`, `telefone`, `local`, `nota`) VALUES
('André Pedro Henrique Rafael Farias', '31238949088', 'andre-farias72@macroengenharia.com', 'andre123', 'Residencial Solar da Chapada', 'Pintor', '', '6599946899', 'São Caetano do Sul - SP', 5.0),
('Josefa Liz Nogueira', '40833523880', 'josefa-nogueira97@imeio.com', 'josefa123', 'Passagem Santo Antônio', 'Mestre de Obra', '', '9699805621', 'São Paulo - SP', 5.0),
('Profissional Teste 2', '45645678978', 'ProfissionalTeste2@mail.com', 'profissional123', 'Rua Profissional Teste 2', 'Mestre de Obra', NULL, '9845625685', 'São Paulo - SP', 5.0),
('Marcos Vinicius Marcelo Almada', '78599340271', 'marcos-almada95@viamoc.com.br', 'marcos123', 'Rua Marechal Deodoro', 'Eletricista', '', '5599787956', 'São Paulo - SP', 5.0),
('Geraldo Victor Lopes', '96335953048', 'geraldo_lopes@hotmail.con', 'geraldo123', 'Rua Homero Viana', 'Encanador', '', '5125024398', 'São Caetano do Sul - SP', 5.0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacao`
--

CREATE TABLE `solicitacao` (
  `id_solicitacao` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `local` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `cpf_cliente` varchar(11) DEFAULT NULL,
  `data_solicitacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `arquiteto`
--
ALTER TABLE `arquiteto`
  ADD PRIMARY KEY (`cpf_arquiteto`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf_cliente`);

--
-- Índices de tabela `empreiteiro`
--
ALTER TABLE `empreiteiro`
  ADD PRIMARY KEY (`idEmpreiteiro`),
  ADD KEY `cpfArquiteto` (`cpfArquiteto`),
  ADD KEY `cpfEngenheiro` (`cpfEngenheiro`);

--
-- Índices de tabela `engenheiro`
--
ALTER TABLE `engenheiro`
  ADD PRIMARY KEY (`cpf_engenheiro`);

--
-- Índices de tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`email_equipe`);

--
-- Índices de tabela `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`id_obra`),
  ADD KEY `cpf_arquiteto` (`cpf_arquiteto`),
  ADD KEY `cpf_engenheiro` (`cpf_engenheiro`),
  ADD KEY `cpf_profissional` (`cpf_profissional`),
  ADD KEY `cpf_cliente` (`cpf_cliente`);

--
-- Índices de tabela `profissionais_solicitados`
--
ALTER TABLE `profissionais_solicitados`
  ADD PRIMARY KEY (`id_profissional`),
  ADD KEY `id_solicitacao` (`id_solicitacao`),
  ADD KEY `cpf_arquiteto` (`cpf_arquiteto`),
  ADD KEY `cpf_engenheiro` (`cpf_engenheiro`),
  ADD KEY `cpf_profissional` (`cpf_profissional`);

--
-- Índices de tabela `profissionalgeral`
--
ALTER TABLE `profissionalgeral`
  ADD PRIMARY KEY (`cpf_profissional`);

--
-- Índices de tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD PRIMARY KEY (`id_solicitacao`),
  ADD KEY `cpf_cliente` (`cpf_cliente`),
  ADD KEY `nome` (`nome`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `empreiteiro`
--
ALTER TABLE `empreiteiro`
  ADD CONSTRAINT `empreiteiro_ibfk_1` FOREIGN KEY (`cpfArquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `empreiteiro_ibfk_2` FOREIGN KEY (`cpfEngenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`);

--
-- Restrições para tabelas `obra`
--
ALTER TABLE `obra`
  ADD CONSTRAINT `obra_ibfk_1` FOREIGN KEY (`cpf_arquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `obra_ibfk_2` FOREIGN KEY (`cpf_engenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`),
  ADD CONSTRAINT `obra_ibfk_3` FOREIGN KEY (`cpf_profissional`) REFERENCES `profissionalgeral` (`cpf_profissional`),
  ADD CONSTRAINT `obra_ibfk_4` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);

--
-- Restrições para tabelas `profissionais_solicitados`
--
ALTER TABLE `profissionais_solicitados`
  ADD CONSTRAINT `profissionais_solicitados_ibfk_5` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacao` (`id_solicitacao`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_6` FOREIGN KEY (`cpf_arquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_7` FOREIGN KEY (`cpf_engenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_8` FOREIGN KEY (`cpf_profissional`) REFERENCES `profissionalgeral` (`cpf_profissional`);

--
-- Restrições para tabelas `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD CONSTRAINT `solicitacao_ibfk_1` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Abr-2024 às 15:54
-- Versão do servidor: 10.3.16-MariaDB
-- versão do PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
-- Estrutura da tabela `arquiteto`
--

CREATE TABLE `arquiteto` (
  `nome` varchar(100) NOT NULL,
  `cpf_arquiteto` varchar(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `certificados` varchar(255) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `id_cau_arquiteto` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nota` decimal(2,1) NOT NULL DEFAULT 5.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `arquiteto`
--

INSERT INTO `arquiteto` (`nome`, `cpf_arquiteto`, `email`, `senha`, `endereco`, `certificados`, `telefone`, `id_cau_arquiteto`, `local`, `nota`) VALUES
('ariwqitpe', '32132132112', 'Arquiote@email', 'jkasdlkjads', 'sadasdsadas', '', '23323232', 456546654, 'São Caetano do Sul - SP', '5.0'),
('Arquiteto Nome 2', '78978978978', 'Arquiteto2@email.com', 'Arquiteto123', 'Rua Arquiteto2', 'pipipipipopopo', '456456456', 123123123, 'São Caetano do Sul - SP', '5.0'),
('Arquiteto Nome 3', '78978978998', 'Arquiteto3@email.com', 'Arquiteto1234', 'Rua Arquiteto33', 'pipipipipopopo232', '456456456', 123321123, 'São Caetano do Sul - SP', '5.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome` varchar(80) NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(10) NOT NULL,
  `local` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`nome`, `cpf_cliente`, `email`, `senha`, `endereco`, `telefone`, `local`) VALUES
('NomeCliente', '45678978978', 'NomeCliente@NomeCliente', 'NomeCliente123', 'Rua NomeCliente', '987987654', 'São Caetano do Sul - SP'),
('Cliente Teste 2', '45685245612', 'Cliente@email.com', 'Cliente123', 'Rua Cliente', '456456456', 'São Caetano do Sul - SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `empreiteiro`
--

CREATE TABLE `empreiteiro` (
  `idEmpreiteiro` int(11) NOT NULL,
  `cpfArquiteto` varchar(11) NOT NULL,
  `cpfEngenheiro` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `engenheiro`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `engenheiro`
--

INSERT INTO `engenheiro` (`nome`, `cpf_engenheiro`, `email`, `senha`, `endereco`, `certificados`, `telefone`, `id_crea_engenheiro`, `local`, `nota`) VALUES
('Engenheiro', '98798798778', 'EngenheiroTF2@Engenheiro', 'Engenheiro123', 'Rua Engenheiro Estrada Engenheiro', 'C:\\fakepath\\Android Large - 1.png', '456456456', 2147483647, 'São Paulo - SP', '5.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipe`
--

CREATE TABLE `equipe` (
  `nome_equipe` varchar(100) NOT NULL,
  `email_equipe` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `quantidade_equipe` int(11) NOT NULL,
  `especialidades` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `obra`
--

CREATE TABLE `obra` (
  `id_obra` int(11) NOT NULL,
  `local_obra` varchar(255) NOT NULL,
  `descricao_obra` varchar(255) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_termino` date DEFAULT NULL,
  `avaliacao_obra` varchar(255) DEFAULT NULL,
  `cpf_arquiteto` varchar(11) NOT NULL,
  `cpf_engenheiro` varchar(11) NOT NULL,
  `cpf_profissional` varchar(11) NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissionais_solicitados`
--

CREATE TABLE `profissionais_solicitados` (
  `id_profissional` int(11) NOT NULL,
  `id_solicitacao` int(11) NOT NULL,
  `cpf_arquiteto` varchar(11) NOT NULL,
  `cpf_engenheiro` varchar(11) NOT NULL,
  `cpf_profissional` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `profissionalgeral`
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `profissionalgeral`
--

INSERT INTO `profissionalgeral` (`nome`, `cpf_profissional`, `email`, `senha`, `endereco`, `especialidade`, `certificados`, `telefone`, `local`, `nota`) VALUES
('Profissional Teste 2', '45645678978', 'ProfissionalTeste2@mail.com', 'profissional123', 'Rua Profissional Teste 2', 'Mestre de Obra', NULL, '9845625685', 'São Paulo - SP', '5.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao`
--

CREATE TABLE `solicitacao` (
  `id_solicitacao` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `regiao` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `cpf_cliente` varchar(11) DEFAULT NULL,
  `data_solicitacao` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `arquiteto`
--
ALTER TABLE `arquiteto`
  ADD PRIMARY KEY (`cpf_arquiteto`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cpf_cliente`);

--
-- Índices para tabela `empreiteiro`
--
ALTER TABLE `empreiteiro`
  ADD PRIMARY KEY (`idEmpreiteiro`),
  ADD KEY `cpfArquiteto` (`cpfArquiteto`),
  ADD KEY `cpfEngenheiro` (`cpfEngenheiro`);

--
-- Índices para tabela `engenheiro`
--
ALTER TABLE `engenheiro`
  ADD PRIMARY KEY (`cpf_engenheiro`);

--
-- Índices para tabela `equipe`
--
ALTER TABLE `equipe`
  ADD PRIMARY KEY (`email_equipe`);

--
-- Índices para tabela `obra`
--
ALTER TABLE `obra`
  ADD PRIMARY KEY (`id_obra`),
  ADD KEY `cpf_arquiteto` (`cpf_arquiteto`),
  ADD KEY `cpf_engenheiro` (`cpf_engenheiro`),
  ADD KEY `cpf_profissional` (`cpf_profissional`),
  ADD KEY `cpf_cliente` (`cpf_cliente`);

--
-- Índices para tabela `profissionais_solicitados`
--
ALTER TABLE `profissionais_solicitados`
  ADD PRIMARY KEY (`id_profissional`),
  ADD KEY `id_solicitacao` (`id_solicitacao`),
  ADD KEY `cpf_arquiteto` (`cpf_arquiteto`),
  ADD KEY `cpf_engenheiro` (`cpf_engenheiro`),
  ADD KEY `cpf_profissional` (`cpf_profissional`);

--
-- Índices para tabela `profissionalgeral`
--
ALTER TABLE `profissionalgeral`
  ADD PRIMARY KEY (`cpf_profissional`);

--
-- Índices para tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD PRIMARY KEY (`id_solicitacao`),
  ADD KEY `cpf_cliente` (`cpf_cliente`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `empreiteiro`
--
ALTER TABLE `empreiteiro`
  ADD CONSTRAINT `empreiteiro_ibfk_1` FOREIGN KEY (`cpfArquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `empreiteiro_ibfk_2` FOREIGN KEY (`cpfEngenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`);

--
-- Limitadores para a tabela `obra`
--
ALTER TABLE `obra`
  ADD CONSTRAINT `obra_ibfk_1` FOREIGN KEY (`cpf_arquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `obra_ibfk_2` FOREIGN KEY (`cpf_engenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`),
  ADD CONSTRAINT `obra_ibfk_3` FOREIGN KEY (`cpf_profissional`) REFERENCES `profissionalgeral` (`cpf_profissional`),
  ADD CONSTRAINT `obra_ibfk_4` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);

--
-- Limitadores para a tabela `profissionais_solicitados`
--
ALTER TABLE `profissionais_solicitados`
  ADD CONSTRAINT `profissionais_solicitados_ibfk_5` FOREIGN KEY (`id_solicitacao`) REFERENCES `solicitacao` (`id_solicitacao`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_6` FOREIGN KEY (`cpf_arquiteto`) REFERENCES `arquiteto` (`cpf_arquiteto`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_7` FOREIGN KEY (`cpf_engenheiro`) REFERENCES `engenheiro` (`cpf_engenheiro`),
  ADD CONSTRAINT `profissionais_solicitados_ibfk_8` FOREIGN KEY (`cpf_profissional`) REFERENCES `profissionalgeral` (`cpf_profissional`);

--
-- Limitadores para a tabela `solicitacao`
--
ALTER TABLE `solicitacao`
  ADD CONSTRAINT `solicitacao_ibfk_1` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

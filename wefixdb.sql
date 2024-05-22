-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Maio-2024 às 15:58
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
  `telefone` varchar(15) NOT NULL,
  `id_cau_arquiteto` int(11) NOT NULL,
  `local` varchar(255) NOT NULL,
  `nota` decimal(2,1) NOT NULL DEFAULT 5.0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `arquiteto`
--

INSERT INTO `arquiteto` (`nome`, `cpf_arquiteto`, `email`, `senha`, `endereco`, `certificados`, `telefone`, `id_cau_arquiteto`, `local`, `nota`) VALUES
('Lara Isis Galvão', '37600419734', 'lara-galvao80@mpcnet.com.br', 'lara123', 'Travessa do Piquizeiro', '', '9936376747', 2147483647, 'São Paulo - SP', '5.0'),
('Daniel Arquiteto', '78978978978', 'Arquiteto2@email.com', 'Arquiteto123', 'Rua Arquiteto2', 'pipipipipopopo', '456456456', 123123123, 'São Caetano do Sul - SP', '5.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `nome_cliente` varchar(100) NOT NULL,
  `cpf_cliente` varchar(11) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `local` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`nome_cliente`, `cpf_cliente`, `email`, `senha`, `endereco`, `telefone`, `local`) VALUES
('Kauê Kaique Heitor Pires', '07781697901', 'kaue_kaique_pires@rjnet.com.br', 'Kaue123', 'Residencial Santa Clara 456', '39913522', 'Selecione a Local'),
('Tomás Theo Jorge Carvalho', '17559839568', 'tomas_theo_carvalho@eton.com.br', 'Tomas123', 'Rua B 988', '29007735', 'São Paulo - SP'),
('Davi Renan Ryan da Mota', '32741045747', 'davi_damota@alcastro.com.br', 'davi123', 'Rua Presidente Roosevelt', '(21) 2795-', 'São Paulo - SP'),
('NomeCliente', '45678978978', 'NomeCliente@NomeCliente', 'NomeCliente123', 'Rua NomeCliente', '987987654', 'São Caetano do Sul - SP'),
('ClienteTeste', '45685245612', 'Cliente@email.com', 'Cliente123', 'Rua Cliente', '456456456', 'São Caetano do Sul - SP'),
('Cliente CRUD', '78945612325', 'clientecrud@email.com', '123', 'sadasdasd', '123123123', 'São Paulo - SP'),
('Gabriel Rafael Thiago Araújo', '85069409743', 'gabriel-araujo97@aol.com', 'gabriel123', 'Avenida Francisco de Souza 985', '26114816', 'Selecione a Local'),
('Martin Bento Drumond', '92449315160', 'martin-drumond92@live.se', 'Martin123', 'Rua São João 596', '92449315160', 'São Paulo - SP');

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
('Fábio Edson Anderson Nunes', '142100262', 'fabioedsonnunes@effem.com', 'fabio123', 'Avenida Guanabara', '', '6936033452', 2147483647, 'São Paulo - SP', '5.0'),
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
  `avaliacao_obra` decimal(2,1) DEFAULT NULL,
  `cpf_arquiteto` varchar(255) DEFAULT NULL,
  `cpf_engenheiro` varchar(255) DEFAULT NULL,
  `cpf_profissional` varchar(255) DEFAULT NULL,
  `cpf_cliente` varchar(255) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `obra`
--

INSERT INTO `obra` (`id_obra`, `local_obra`, `descricao_obra`, `data_inicio`, `data_termino`, `avaliacao_obra`, `cpf_arquiteto`, `cpf_engenheiro`, `cpf_profissional`, `cpf_cliente`, `status`) VALUES
(0, 'São Caetano do Sul - SP', 'Buscando um profissional para construir uma academia de ginástica.', '2024-11-14', NULL, NULL, NULL, NULL, '45645678978', '45685245612', 'EM ANDAMENTO'),
(123, 'São Paulo - SP', 'Necessito de um profissional para construir uma galeria de arte.', '2024-04-02', '2024-04-30', '5.0', '78978978978', '98798798778', '45645678978', '45685245612', 'FINALIZADAS'),
(11111, 'São Paulo - SP', 'Estou buscando um profissional para ampliar minha loja de roupas.', '2024-04-12', '2024-08-15', NULL, NULL, NULL, '31238949088', '45685245612', 'EM ANDAMENTO'),
(123122, 'São Paulo - SP', 'Estou buscando um profissional para ampliar nossa escola infantil.', '2024-11-08', '2025-04-18', NULL, NULL, NULL, '45645678978', '45685245612', 'FINALIZADAS'),
(500869, 'São Paulo - SP', 'Preciso reformar minha clínica médica.', '2024-05-23', '2024-10-17', NULL, '78978978978', NULL, NULL, '92449315160', 'PENDENTE'),
(528047, 'São Caetano do Sul - SP', 'Estou buscando um profissional para reformar meu apartamento.', '2024-04-12', '2024-04-30', NULL, NULL, NULL, '40833523880', '45685245612', 'PENDENTE'),
(579260, 'São Paulo - SP', 'Preciso construir uma casa de campo.', '2024-06-07', '2024-08-21', NULL, '78978978978', NULL, NULL, '85069409743', 'EM ANDAMENTO'),
(588147, 'São Paulo - SP', 'Estou procurando um profissional para reformar meu restaurante.', '2024-05-14', '2024-06-14', NULL, NULL, NULL, '40833523880', '45685245612', 'EM ANDAMENTO'),
(667499, 'São Paulo - SP', 'Preciso de um profissional para construir uma casa de campo.', '2024-03-05', '2024-09-19', NULL, NULL, NULL, '45645678978', '45685245612', 'PENDENTE'),
(738746, 'São Paulo - SP', 'Estou procurando alguem para reformar o meu apartamento', '2024-05-24', '2024-06-08', NULL, NULL, NULL, '31238949088', '32741045747', 'PENDENTE'),
(821487, 'São Caetano do Sul - SP', 'Procurando um profissional para reformar minha loja de conveniência.', '2322-12-31', '1111-11-11', NULL, '37600419734', NULL, NULL, '45685245612', 'PENDENTE');

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
('André Pedro Henrique Rafael Farias', '31238949088', 'andre-farias72@macroengenharia.com', 'andre123', 'Residencial Solar da Chapada', 'Pintor', '', '6599946899', 'São Caetano do Sul - SP', '5.0'),
('Josefa Liz Nogueira', '40833523880', 'josefa-nogueira97@imeio.com', 'josefa123', 'Passagem Santo Antônio', 'Mestre de Obra', '', '9699805621', 'São Paulo - SP', '5.0'),
('Daniel Profissional', '45645678978', 'ProfissionalTeste2@mail.com', 'profissional123', 'Rua Profissional Teste 2', 'Mestre de Obra', NULL, '9845625685', 'São Paulo - SP', '5.0'),
('Marcos Vinicius Marcelo Almada', '78599340271', 'marcos-almada95@viamoc.com.br', 'marcos123', 'Rua Marechal Deodoro', 'Eletricista', '', '5599787956', 'São Paulo - SP', '5.0'),
('Geraldo Victor Lopes', '96335953048', 'geraldo_lopes@hotmail.con', 'geraldo123', 'Rua Homero Viana', 'Encanador', '', '5125024398', 'São Caetano do Sul - SP', '5.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `solicitacao`
--

CREATE TABLE `solicitacao` (
  `id_solicitacao` int(11) NOT NULL,
  `local` varchar(100) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `data_solicitacao` datetime NOT NULL,
  `nome_cliente` varchar(100) DEFAULT NULL,
  `cpf_cliente` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `solicitacao`
--

INSERT INTO `solicitacao` (`id_solicitacao`, `local`, `descricao`, `data_solicitacao`, `nome_cliente`, `cpf_cliente`) VALUES
(340079, 'São Paulo - SP', 'Preciso de um profissional para construir um prédio comercial.\nO prédio terá 5 andares e será usado para escritórios e lojas. Preciso de um projeto moderno e eficiente.', '2024-05-22 10:19:02', 'Gabriel Rafael Thiago Araújo', '85069409743'),
(391135, 'São Paulo - SP', 'Estou buscando um profissional para construir um edifício residencial de médio porte. O projeto inclui apartamentos, áreas comuns e estacionamento.', '2024-05-22 10:14:34', 'Kauê Kaique Heitor Pires', '07781697901'),
(532346, 'São Caetano do Sul - SP', 'Estou procurando um profissional para reformar nosso escritório comercial.\nPrecisamos de uma atualização completa, incluindo pintura, troca de pisos, instalação de divisórias e renovação dos banheiros.', '2024-05-22 10:15:23', 'Tomás Theo Jorge Carvalho', '17559839568'),
(875113, 'São Paulo - SP', 'Preciso de um profissional para construir um galpão industrial.\r\nO galpão terá 1.000m e será usado para armazenamento e logística. Requer fundações sólidas, estrutura metálica e instalações elétricas.', '2024-04-09 22:26:47', 'ClienteTeste', '45685245612'),
(875115, 'São Paulo - SP', 'Estou buscando um profissional para ampliar minha casa.\r\nQuero adicionar um novo quarto, uma área de lazer e uma piscina. A ampliação deve ser integrada ao design existente.', '2024-04-09 22:26:47', 'Davi Renan Ryan da Mota', '32741045747');

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
  ADD PRIMARY KEY (`cpf_cliente`),
  ADD UNIQUE KEY `nome_cliente` (`nome_cliente`);

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
  ADD KEY `fk_cpf_cliente` (`cpf_cliente`),
  ADD KEY `fk_nome_cliente` (`nome_cliente`);

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
  ADD CONSTRAINT `fk_cpf_cliente` FOREIGN KEY (`cpf_cliente`) REFERENCES `cliente` (`cpf_cliente`),
  ADD CONSTRAINT `fk_nome_cliente` FOREIGN KEY (`nome_cliente`) REFERENCES `cliente` (`nome_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

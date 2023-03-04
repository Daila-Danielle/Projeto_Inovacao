-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 22-Dez-2022 às 21:46
-- Versão do servidor: 5.7.36
-- versão do PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargos`
--

DROP TABLE IF EXISTS `cargos`;
CREATE TABLE IF NOT EXISTS `cargos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(25) NOT NULL,
  `desc` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=660 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargos`
--

INSERT INTO `cargos` (`id`, `nome`, `desc`) VALUES
(465, 'Presidente', '\'\''),
(659, 'Gerente', '\'\'');

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `grupos`
--

INSERT INTO `grupos` (`id`, `nome`) VALUES
(45, 'Administrador'),
(68, 'Manutençao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais`
--

DROP TABLE IF EXISTS `materiais`;
CREATE TABLE IF NOT EXISTS `materiais` (
  `id_mat` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id_mat`),
  KEY `tipo_id` (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `materiais`
--

INSERT INTO `materiais` (`id_mat`, `nome`, `tipo_id`) VALUES
(1235, 'Material Danificado', 4),
(3256, 'Base Metal', 3),
(3265, 'Tampa verde', 2),
(4568, 'Tampa Metal', 2),
(5698, 'Base Azul', 3),
(6328, 'Base Verde', 3),
(6548, 'Caixa Verde', 1),
(9746, 'Tampa Azul', 2),
(9864, 'Caixa Metal', 1),
(9875, 'Caixa Azul', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `materiais_producao`
--

DROP TABLE IF EXISTS `materiais_producao`;
CREATE TABLE IF NOT EXISTS `materiais_producao` (
  `id` int(11) NOT NULL,
  `id _prod` int(11) NOT NULL,
  `id_mat` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_mat` (`id_mat`),
  KEY `id _prod` (`id _prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `materiais_producao`
--

INSERT INTO `materiais_producao` (`id`, `id _prod`, `id_mat`, `quantidade`) VALUES
(1, 1670763471, 5698, 200),
(2, 1670763471, 9875, 562),
(3, 1670763471, 1235, 50),
(4, 1670763471, 6548, 214);

-- --------------------------------------------------------

--
-- Estrutura da tabela `mat_tipo`
--

DROP TABLE IF EXISTS `mat_tipo`;
CREATE TABLE IF NOT EXISTS `mat_tipo` (
  `tipo_id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`tipo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `mat_tipo`
--

INSERT INTO `mat_tipo` (`tipo_id`, `nome`) VALUES
(1, 'Caixa'),
(2, 'Tampa'),
(3, 'Base'),
(4, 'Rejeito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `production`
--

DROP TABLE IF EXISTS `production`;
CREATE TABLE IF NOT EXISTS `production` (
  `id_prod` int(11) NOT NULL,
  `initial_date` datetime NOT NULL,
  `final_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `production`
--

INSERT INTO `production` (`id_prod`, `initial_date`, `final_date`) VALUES
(1670763471, '2022-08-05 12:00:00', '2022-08-06 13:00:00'),
(1670763865, '2022-08-05 12:00:00', '2022-08-06 13:00:00'),
(1670763955, '2022-08-05 12:00:00', '2022-08-06 13:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `senha` text NOT NULL,
  `cargo` int(11) NOT NULL,
  `grupo` int(11) NOT NULL,
  `img_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cargo` (`cargo`),
  KEY `grupo` (`grupo`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `senha`, `cargo`, `grupo`, `img_name`) VALUES
(45, 'hugo', '$2b$12$x2h.XnYrZJFnSj2ByUf0iemvdWRgBjFtNxytqrxHXu7m859zNHUZO', 659, 45, 'aaa'),
(46, 'Sabrina', '$2b$12$Phvcp4PXjHkRaFfXpKTI5eSJFkA83GgKDE2G6mvyfNWBfJml9RvCu', 465, 45, 'images.png');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `materiais`
--
ALTER TABLE `materiais`
  ADD CONSTRAINT `tipo_id` FOREIGN KEY (`tipo_id`) REFERENCES `mat_tipo` (`tipo_id`);

--
-- Limitadores para a tabela `materiais_producao`
--
ALTER TABLE `materiais_producao`
  ADD CONSTRAINT `materiais_producao_ibfk_1` FOREIGN KEY (`id_mat`) REFERENCES `materiais` (`id_mat`),
  ADD CONSTRAINT `materiais_producao_ibfk_2` FOREIGN KEY (`id _prod`) REFERENCES `production` (`id_prod`);

--
-- Limitadores para a tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

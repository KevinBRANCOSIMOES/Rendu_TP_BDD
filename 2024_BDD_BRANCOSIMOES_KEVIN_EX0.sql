-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 21 mai 2024 à 16:05
-- Version du serveur :  5.7.26
-- Version de PHP :  5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tp_bdd_branco`
--

-- --------------------------------------------------------

--
-- Structure de la table `associe`
--

DROP TABLE IF EXISTS `associe`;
CREATE TABLE IF NOT EXISTS `associe` (
  `Id_Reservation` int(11) NOT NULL,
  `Id_Materiel` int(11) NOT NULL,
  KEY `Id` (`Id_Reservation`),
  KEY `Id_1` (`Id_Materiel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `associe`
--

INSERT INTO `associe` (`Id_Reservation`, `Id_Materiel`) VALUES
(1, 5),
(1, 3),
(2, 5),
(3, 12),
(4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

DROP TABLE IF EXISTS `materiel`;
CREATE TABLE IF NOT EXISTS `materiel` (
  `id_materiel` int(11) NOT NULL AUTO_INCREMENT,
  `designation_materiel` varchar(50) NOT NULL,
  `quantite` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_materiel`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `materiel`
--

INSERT INTO `materiel` (`id_materiel`, `designation_materiel`, `quantite`, `description`, `type`) VALUES
(1, 'Ordinateur portable', '20', 'Ordinateur portable de dernière génération', 'Informatique'),
(2, 'Imprimante', '15', 'Imprimante laser couleur', 'Informatique'),
(3, 'Projecteur', '10', 'Projecteur HD pour présentations', 'Électronique'),
(4, 'Perceuse', '8', 'Perceuse électrique sans fil', 'Outils'),
(5, 'Scie circulaire', '12', 'Scie circulaire professionnelle', 'Outils'),
(6, 'Caméra', '5', 'Caméra haute définition pour la vidéo-surveillance', 'Électronique'),
(7, 'Ordinateur portable', '20', 'Ordinateur portable de dernière génération', 'Informatique'),
(8, 'Imprimante', '15', 'Imprimante laser couleur', 'Informatique'),
(9, 'Projecteur', '10', 'Projecteur HD pour présentations', 'Électronique'),
(10, 'Perceuse', '8', 'Perceuse électrique sans fil', 'Outils'),
(11, 'Scie circulaire', '12', 'Scie circulaire professionnelle', 'Outils'),
(12, 'Caméra', '5', 'Caméra haute définition', 'Électronique');

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `id_reservation` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` varchar(50) NOT NULL,
  `date_fin` varchar(50) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_reservation`),
  KEY `id_etudiant` (`id_etudiant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_reservation`, `date_debut`, `date_fin`, `id_etudiant`) VALUES
(1, '15-09-2023', '30-09-2023', 1),
(2, '02-09-2023', '05-10-2023', 5),
(3, '30-09-2023', '19-10-2023', 9),
(4, '02-11-2023', '15-12-2023', 8),
(5, '01-10-2023', '18-12-2023', 7);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_etudiant` int(11) NOT NULL,
  `nom_etudiant` varchar(50) NOT NULL,
  `prenom_etudiant` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_etudiant`, `nom_etudiant`, `prenom_etudiant`, `email`) VALUES
(1, 'Doe', 'John', 'john.doe@example.com'),
(2, 'Smith', 'Alice', 'alice.smith@example.com'),
(3, 'Johnson', 'Michael', 'michael.johnson@example.com'),
(4, 'Brown', 'Emily', 'emily.brown@example.com'),
(5, 'Taylor', 'James', 'james.taylor@example.com'),
(6, 'Anderson', 'Sarah', 'sarah.anderson@example.com'),
(7, 'Martinez', 'David', 'david.martinez@example.com'),
(8, 'Jones', 'Jessica', 'jessica.jones@example.com'),
(9, 'Garcia', 'Daniel', 'daniel.garcia@example.com'),
(10, 'Wilson', 'Emma', 'emma.wilson@example.com');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `associe`
--
ALTER TABLE `associe`
  ADD CONSTRAINT `associe_ibfk_1` FOREIGN KEY (`Id_Reservation`) REFERENCES `reservation` (`id_reservation`),
  ADD CONSTRAINT `associe_ibfk_2` FOREIGN KEY (`Id_Materiel`) REFERENCES `materiel` (`id_materiel`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_etudiant`) REFERENCES `utilisateur` (`id_etudiant`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 mai 2021 à 09:15
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion_de_stock`
--
CREATE DATABASE IF NOT EXISTS `gestion_de_stock` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gestion_de_stock`;

-- --------------------------------------------------------

--
-- Structure de la table `bon_entree`
--

DROP TABLE IF EXISTS `bon_entree`;
CREATE TABLE `bon_entree` (
  `id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `num_be` varchar(20) NOT NULL,
  `date_entree` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bon_entree`
--

INSERT INTO `bon_entree` (`id`, `produit_id`, `num_be`, `date_entree`) VALUES
(1, 1, 'BE_01', '2021-02-01'),
(2, 2, 'BE_02', '2021-03-21'),
(3, 3, 'BE_03', '2021-04-28'),
(5, 9, 'BE_05', '2021-05-14'),
(6, 11, 'BE_06', '2021-05-14');

-- --------------------------------------------------------

--
-- Structure de la table `bon_sortie`
--

DROP TABLE IF EXISTS `bon_sortie`;
CREATE TABLE `bon_sortie` (
  `id` int(11) NOT NULL,
  `produit_bsid` int(11) NOT NULL,
  `vente_id` int(11) NOT NULL,
  `num_bs` varchar(20) NOT NULL,
  `date_sortie` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bon_sortie`
--

INSERT INTO `bon_sortie` (`id`, `produit_bsid`, `vente_id`, `num_bs`, `date_sortie`) VALUES
(1, 1, 1, 'BS_01', '2021-02-01'),
(2, 2, 2, 'BS_02', '2021-03-21'),
(4, 9, 3, 'BS_04', '2021-05-15'),
(5, 11, 4, 'BS_05', '2021-05-15');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `code_produit` varchar(20) NOT NULL,
  `reference` varchar(50) NOT NULL,
  `deseignation` varchar(52) NOT NULL,
  `rangement` varchar(50) NOT NULL,
  `fournisseur` varchar(56) NOT NULL,
  `remise` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id`, `code_produit`, `reference`, `deseignation`, `rangement`, `fournisseur`, `remise`, `prix`, `stock`) VALUES
(1, 'PRO_01', 'REF_01', 'tsaramaso', 'R_01', 'F_01', 10, 1200, 70),
(2, 'PRO_02', 'REF_02', 'vary', 'R_02', 'F_02', 10, 700, 100),
(3, 'PRO_03', 'REF_03', 'katsaka', 'R_03', 'F_03', 10, 1600, 100),
(4, 'PRO_04', 'REF_04', 'voanjobory', 'R_04', 'F_04', 10, 900, 50),
(9, 'PRO_05', 'REF_05', 'siasisa', 'R_05', 'F_05', 5, 900, 100),
(11, 'PRO_06', 'REF_06', 'kabaro', 'R_06', 'F_05', 5, 900, 180);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `id_user`, `username`, `password`, `type`) VALUES
(1, 'USER_01', 'root', 'root', 'directeur'),
(2, 'USER_02', 'admin', 'admin', 'Cashier');

-- --------------------------------------------------------

--
-- Structure de la table `vente`
--

DROP TABLE IF EXISTS `vente`;
CREATE TABLE `vente` (
  `id` int(11) NOT NULL,
  `num_facture` varchar(20) NOT NULL,
  `code_produit` varchar(20) NOT NULL,
  `reference` varchar(55) CHARACTER SET latin1 NOT NULL,
  `prix_vente` int(11) NOT NULL,
  `stock_sortie` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vente`
--

INSERT INTO `vente` (`id`, `num_facture`, `code_produit`, `reference`, `prix_vente`, `stock_sortie`, `subtotal`) VALUES
(1, 'F_01', 'PRO_01', 'REF_01', 1200, 10, 20000),
(2, 'F_02', 'PRO_02', 'REF_02', 1500, 20, 10000),
(3, 'F_01', 'PRO_03', 'REF_03', 1440, 20, 28800),
(4, 'F_02', 'PRO_03', 'REF_03', 1440, 20, 28800),
(5, 'F_02', 'PRO_06', 'REF_06', 855, 20, 17100);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bon_entree`
--
ALTER TABLE `bon_entree`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produit_id` (`produit_id`);

--
-- Index pour la table `bon_sortie`
--
ALTER TABLE `bon_sortie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produit_bs_id` (`produit_bsid`),
  ADD KEY `fk_vente_id` (`vente_id`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bon_entree`
--
ALTER TABLE `bon_entree`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `bon_sortie`
--
ALTER TABLE `bon_sortie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `vente`
--
ALTER TABLE `vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bon_entree`
--
ALTER TABLE `bon_entree`
  ADD CONSTRAINT `fk_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `bon_sortie`
--
ALTER TABLE `bon_sortie`
  ADD CONSTRAINT `fk_vente_id` FOREIGN KEY (`vente_id`) REFERENCES `vente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

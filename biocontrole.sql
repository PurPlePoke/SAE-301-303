-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 19 déc. 2024 à 18:46
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `biocontrole`
--

-- --------------------------------------------------------

--
-- Structure de la table `application`
--

CREATE TABLE `application` (
  `id_application` int(11) NOT NULL,
  `nombre_application` int(11) DEFAULT NULL,
  `dose` varchar(255) DEFAULT NULL,
  `id_methode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `caracteristique`
--

CREATE TABLE `caracteristique` (
  `id_caracteristique` int(11) NOT NULL,
  `autres_caracteristiques` varchar(255) DEFAULT NULL,
  `niveau_satisfaction` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `cible`
--

CREATE TABLE `cible` (
  `id_cible` int(11) NOT NULL,
  `groupe_cible` varchar(255) DEFAULT NULL,
  `cible_principale` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `famille`
--

CREATE TABLE `famille` (
  `id_famille` int(11) NOT NULL,
  `nom_famille` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id_filiere` int(11) NOT NULL,
  `filiere` varchar(255) DEFAULT NULL,
  `cultures` varchar(255) DEFAULT NULL,
  `pleine_terre_abri` varchar(255) DEFAULT NULL,
  `id_methode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methodebiocontrole`
--

CREATE TABLE `methodebiocontrole` (
  `id_methode` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `id_sous_famille` int(11) NOT NULL,
  `nom_methode` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `mode_action` varchar(255) DEFAULT NULL,
  `partie_traitee` varchar(255) DEFAULT NULL,
  `etat_application` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `methodecaracteristique`
--

CREATE TABLE `methodecaracteristique` (
  `id_methode` int(11) NOT NULL,
  `id_caracteristique` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `nom_projet` varchar(255) DEFAULT NULL,
  `cp_site` varchar(255) DEFAULT NULL,
  `nom_systeme` varchar(255) DEFAULT NULL,
  `lien_fiche_systeme` varchar(255) DEFAULT NULL,
  `id_cible` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sousfamille`
--

CREATE TABLE `sousfamille` (
  `id_sous_famille` int(11) NOT NULL,
  `id_famille` int(11) NOT NULL,
  `nom_sous_famille` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `application`
--
ALTER TABLE `application`
  ADD PRIMARY KEY (`id_application`),
  ADD KEY `id_methode` (`id_methode`);

--
-- Index pour la table `caracteristique`
--
ALTER TABLE `caracteristique`
  ADD PRIMARY KEY (`id_caracteristique`);

--
-- Index pour la table `cible`
--
ALTER TABLE `cible`
  ADD PRIMARY KEY (`id_cible`);

--
-- Index pour la table `famille`
--
ALTER TABLE `famille`
  ADD PRIMARY KEY (`id_famille`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id_filiere`),
  ADD KEY `id_methode` (`id_methode`);

--
-- Index pour la table `methodebiocontrole`
--
ALTER TABLE `methodebiocontrole`
  ADD PRIMARY KEY (`id_methode`),
  ADD KEY `id_famille` (`id_famille`),
  ADD KEY `id_sous_famille` (`id_sous_famille`);

--
-- Index pour la table `methodecaracteristique`
--
ALTER TABLE `methodecaracteristique`
  ADD PRIMARY KEY (`id_methode`,`id_caracteristique`),
  ADD KEY `id_caracteristique` (`id_caracteristique`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`),
  ADD KEY `id_cible` (`id_cible`);

--
-- Index pour la table `sousfamille`
--
ALTER TABLE `sousfamille`
  ADD PRIMARY KEY (`id_sous_famille`),
  ADD KEY `id_famille` (`id_famille`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `application`
--
ALTER TABLE `application`
  MODIFY `id_application` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `caracteristique`
--
ALTER TABLE `caracteristique`
  MODIFY `id_caracteristique` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `cible`
--
ALTER TABLE `cible`
  MODIFY `id_cible` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `famille`
--
ALTER TABLE `famille`
  MODIFY `id_famille` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `methodebiocontrole`
--
ALTER TABLE `methodebiocontrole`
  MODIFY `id_methode` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sousfamille`
--
ALTER TABLE `sousfamille`
  MODIFY `id_sous_famille` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `application`
--
ALTER TABLE `application`
  ADD CONSTRAINT `application_ibfk_1` FOREIGN KEY (`id_methode`) REFERENCES `methodebiocontrole` (`id_methode`);

--
-- Contraintes pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD CONSTRAINT `filiere_ibfk_1` FOREIGN KEY (`id_methode`) REFERENCES `methodebiocontrole` (`id_methode`);

--
-- Contraintes pour la table `methodebiocontrole`
--
ALTER TABLE `methodebiocontrole`
  ADD CONSTRAINT `methodebiocontrole_ibfk_1` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`),
  ADD CONSTRAINT `methodebiocontrole_ibfk_2` FOREIGN KEY (`id_sous_famille`) REFERENCES `sousfamille` (`id_sous_famille`);

--
-- Contraintes pour la table `methodecaracteristique`
--
ALTER TABLE `methodecaracteristique`
  ADD CONSTRAINT `methodecaracteristique_ibfk_1` FOREIGN KEY (`id_methode`) REFERENCES `methodebiocontrole` (`id_methode`),
  ADD CONSTRAINT `methodecaracteristique_ibfk_2` FOREIGN KEY (`id_caracteristique`) REFERENCES `caracteristique` (`id_caracteristique`);

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`id_cible`) REFERENCES `cible` (`id_cible`);

--
-- Contraintes pour la table `sousfamille`
--
ALTER TABLE `sousfamille`
  ADD CONSTRAINT `sousfamille_ibfk_1` FOREIGN KEY (`id_famille`) REFERENCES `famille` (`id_famille`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

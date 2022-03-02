-- CREATE DATABASE IF NOT EXISTS groupomania CHARACTER SET 'utf8';

-- CREATE TABLE IF NOT EXISTS User (
--     user_id INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     nom VARCHAR(64) NOT NULL,
--     prenom VARCHAR(64) NOT NULL,
--     password VARCHAR(255) NOT NULL,
--     email VARCHAR(255) NOT NULL UNIQUE,
--     -- pseudo VARCHAR(64) NOT NULL,
--     -- poste VARCHAR(255) NOT NULL,
--     -- status CHAR(1) NOT NULL DEFAULT 'E',
--     -- tel CHAR(10) NOT NULL 
--     ) ENGINE = INNODB;

-- CREATE TABLE IF NOT EXISTS Post (
--     post_id INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
--     title VARCHAR(255) NOT NULL,
--     fk_id_user INT(10) UNSIGNED,
--     FOREIGN KEY (fk_id_user) REFERENCES User(user_id)
--     on DELETE CASCADE ON UPDATE CASCADE,
--     media_url VARCHAR(255),
--     content TEXT,
--     category VARCHAR(64) NOT NULL
--    ) ENGINE = INNODB;

-- CREATE TABLE IF NOT EXISTS Comment (
--     comment_id INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     content TINYTEXT NOT NULL,
--     fk_id_user INT(10) UNSIGNED,
--     fk_id_post INT(10) UNSIGNED,
--     fk_id_message INT(10) UNSIGNED,
--     FOREIGN KEY (fk_id_user) REFERENCES User(user_id)
--     ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (fk_id_post) REFERENCES Post(post_id)
--     ON DELETE CASCADE ON UPDATE CASCADE,
--     FOREIGN KEY (fk_id_message) REFERENCES messageperso(message_perso_id)
--     ON DELETE CASCADE ON UPDATE CASCADE
-- )   ENGINE = INNODB;

-- CREATE TABLE IF NOT EXISTS MessagePerso (
--     message_perso_id INT(10) UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
--     prenom VARCHAR(64) NOT NULL,
--     commentaire VARCHAR(255) NOT NULL,
--     FOREIGN KEY (fk_id_user) REFERENCES User(user_id)
--     ON DELETE CASCADE ON UPDATE CASCADE
-- )   ENGINE = INNODB;

-- CREATE TABLE IF NOT EXISTS Likes (
--     like_id INT(10) UNSIGNED NOT NULL,
--     dislike_id INT(10) UNSIGNED NOT NULL,
--     fk_id_user INT(10) UNSIGNED,
--     fk_id_post INT(10) UNSIGNED,
--     fk_id_message INT(10) UNSIGNED,
--     FOREIGN KEY (fk_id_user) REFERENCES User(user_id)
-- ) ENGINE= INNODB


-- -- Sa récupère tous les commentaires associer aux messages dont id ==91 avec les infos de l'user qui la créer(commentaires)
-- SELECT comment.content, comment.comment_id, user.user_id, user.nom, user.prenom FROM Comment JOIN User ON comment.fk_id_user = user.user_id WHERE fk_id_message =91

-- SELECT comment_id, comment.content,comment.fk_id_message,messageperso.message_perso_id,messageperso.commentaire, messageperso.fk_id_user FROM comment JOIN messageperso ON comment.fk_id_message =messageperso.message_perso_id
-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 15 fév. 2022 à 12:51
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `content` tinytext NOT NULL,
  `fk_id_user` int(10) UNSIGNED DEFAULT NULL,
  `fk_id_post` int(10) UNSIGNED DEFAULT NULL,
  `fk_id_message` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`comment_id`, `content`, `fk_id_user`, `fk_id_post`, `fk_id_message`) VALUES
(154, 'moi steve je commente le message à 8h04', 151, NULL, 127),
(155, 'moi steve je commente à 8h05', 151, NULL, 127),
(156, 'moi steve je commente à 8h07', 151, NULL, 127),
(157, 'moi steve je commente à 8h10', 151, NULL, 127);

-- --------------------------------------------------------

--
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `like_id` int(10) UNSIGNED NOT NULL,
  `dislike_id` int(10) UNSIGNED NOT NULL,
  `fk_id_user` int(10) UNSIGNED DEFAULT NULL,
  `fk_id_post` int(10) UNSIGNED DEFAULT NULL,
  `fk_id_message` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `messageperso`
--

CREATE TABLE `messageperso` (
  `message_perso_id` int(10) UNSIGNED NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `commentaire` varchar(255) NOT NULL,
  `fk_id_user` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `messageperso`
--

INSERT INTO `messageperso` (`message_perso_id`, `prenom`, `date`, `commentaire`, `fk_id_user`) VALUES
(127, 'Steve', '2022-02-15 08:04:01', 'Bonjour moi c\'est steve je poste un message à 8h03', 151),
(128, 'Steve', '2022-02-15 08:15:13', 'Moi steve je reposte un message à 8h15', 151);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `title` varchar(255) NOT NULL,
  `fk_id_user` int(10) UNSIGNED DEFAULT NULL,
  `media_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`user_id`, `nom`, `prenom`, `password`, `email`) VALUES
(151, 'Tissier ', 'Steve', '$2b$10$0wDIa7SajvxMFv9Hkl9lBOmQPnPhasSI6om/ij9Zc0f2dMNlYe2Wq', 'test1@steve.fr'),
(155, 'Tissier', 'Steve', '$2b$10$6sj1fp9SIKuz2LQO7CmniOhh7iTOafONvVfnw8kOMhkLlxsZkhYzW', 'test2@steve.fr'),
(156, 'Dupond', 'Hadock', '$2b$10$bH4yzeEqAJp.tCoRDD/MkuNzin4pwARSpRuqn2OFQaWl3/KMrA1hO', 'test3@steve.fr'),
(157, 'Tissier', 'Maeva', '$2b$10$ygf641Cj450eNOO.l0xr6O2vXOuWlwwxtLpzTdR2NLA8NTHyXZqoO', 'test4@maeva.fr'),
(158, 'nath', 'nathanel', '$2b$10$YkuIBqlw6/3VIJ63UYuZUekh5mptvGLCb63pU9LDpoczBXBZIb/xO', 'nath@test.fr');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `fk_id_user` (`fk_id_user`),
  ADD KEY `fk_id_post` (`fk_id_post`),
  ADD KEY `fk_message` (`fk_id_message`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `messageperso`
--
ALTER TABLE `messageperso`
  ADD PRIMARY KEY (`message_perso_id`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_id_user` (`fk_id_user`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT pour la table `messageperso`
--
ALTER TABLE `messageperso`
  MODIFY `message_perso_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`fk_id_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`fk_id_post`) REFERENCES `post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_message` FOREIGN KEY (`fk_id_message`) REFERENCES `messageperso` (`message_perso_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`fk_id_user`) REFERENCES `user` (`user_id`);

--
-- Contraintes pour la table `messageperso`
--
ALTER TABLE `messageperso`
  ADD CONSTRAINT `messageperso_ibfk_1` FOREIGN KEY (`fk_id_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`fk_id_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

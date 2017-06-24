SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Veritabanı: `bwallo`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid_fk` int(11) NOT NULL,
  `comment_ip` varchar(15) NOT NULL,
  `comment_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `postid_fk` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `userid_fk` (`userid_fk`),
  KEY `postid_fk` (`postid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=508 ;

CREATE TABLE `following` (
  `following_id` int(11) NOT NULL AUTO_INCREMENT,
  `following_follower` int(11) NOT NULL,
  `following_followed` int(11) NOT NULL,
  PRIMARY KEY (`following_id`),
  KEY `following_follower` (`following_follower`),
  KEY `following_followed` (`following_followed`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

CREATE TABLE `general_settings` (
  `site_url` varchar(255) NOT NULL,
  `site_title` varchar(255) NOT NULL,
  `site_desc` varchar(300) NOT NULL,
  `site_desc_en` varchar(300) NOT NULL,
  `site_keyw` varchar(300) NOT NULL,
  `site_theme` varchar(255) NOT NULL,
  `site_favicon` varchar(255) NOT NULL,
  `site_status` tinyint(1) NOT NULL,
  `site_email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `general_settings` (`site_url`, `site_title`, `site_desc`, `site_desc_en`, `site_keyw`, `site_theme`, `site_favicon`, `site_status`, `site_email`) VALUES
('http://localhost', 'bwallo.', 'duvarını yarat!', 'create your wall!', 'duvar, pano, bwallo, yarat, blog, miniblog, paylaş', 'v1', 'includes/src/favicon.ico', 1, 'bwallo@bwallo.com');

CREATE TABLE `notifications` (
  `notif_id` int(11) NOT NULL AUTO_INCREMENT,
  `notif_type` int(11) NOT NULL,
  `notif_isread` int(1) NOT NULL DEFAULT '0',
  `notif_text` text NOT NULL,
  `notif_href` varchar(355) NOT NULL,
  `notif_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userid_fk` int(11) NOT NULL,
  PRIMARY KEY (`notif_id`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=150 ;

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid_fk` int(11) NOT NULL,
  `post_ip` varchar(15) NOT NULL,
  `post_hit` int(11) NOT NULL,
  `post_like` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_subtitle` text NOT NULL,
  `post_content` text NOT NULL,
  `post_width` int(11) NOT NULL,
  `post_x` int(11) NOT NULL,
  `post_y` int(11) NOT NULL,
  `post_z` int(11) NOT NULL,
  `post_color` varchar(6) NOT NULL,
  `post_created` datetime NOT NULL,
  `post_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `wallid_fk` int(11) NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `wallid_fk` (`wallid_fk`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=547 ;

CREATE TABLE `reposts` (
  `repost_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_idfk` int(11) NOT NULL,
  `wall_idfk` int(11) NOT NULL,
  `user_idfk` int(11) NOT NULL,
  `repost_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`repost_id`),
  KEY `postid_fk` (`post_idfk`),
  KEY `userid_fk` (`user_idfk`),
  KEY `wallid_fk` (`wall_idfk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_avatar` varchar(355) NOT NULL DEFAULT 'includes/src/default-avatar.png',
  `user_cover` varchar(355) NOT NULL DEFAULT 'includes/src/default-cover.png',
  `user_about` text NOT NULL,
  `user_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_rank` int(11) NOT NULL,
  `user_hash` varchar(32) NOT NULL,
  `user_weeklynotif` tinyint(4) NOT NULL,
  `user_commentnotif` tinyint(4) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

INSERT INTO `users` (`user_id`, `user_fullname`, `user_name`, `user_pass`, `user_email`, `user_avatar`, `user_cover`, `user_about`, `user_time`, `user_rank`, `user_hash`, `user_weeklynotif`, `user_commentnotif`) VALUES
(1, 'İsimsiz', 'İsimsiz', '', '', 'http://localhost/includes/src/default-avatar.png', 'http://localhost/includes/src/default-cover.png', '', '2013-12-20 20:20:52', 0, '', 0, 0),

CREATE TABLE `user_avatars` (
  `avatar_id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar_url` varchar(355) NOT NULL,
  `userid_fk` int(11) NOT NULL,
  `avatar_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`avatar_id`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

CREATE TABLE `user_themes` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(225) NOT NULL,
  `userid_fk` int(11) NOT NULL,
  `theme_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`theme_id`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

CREATE TABLE `user_wallpapers` (
  `wallpaper_id` int(11) NOT NULL AUTO_INCREMENT,
  `wallpaper_url` varchar(355) NOT NULL,
  `userid_fk` int(11) NOT NULL,
  `wallpaper_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`wallpaper_id`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

CREATE TABLE `walls` (
  `wall_id` int(11) NOT NULL AUTO_INCREMENT,
  `wall_title` varchar(255) NOT NULL,
  `wall_desc` text NOT NULL,
  `userid_fk` int(11) NOT NULL,
  `user_ip` varchar(15) NOT NULL,
  `wall_wallpaper` varchar(255) NOT NULL,
  `wall_avatar` varchar(255) NOT NULL,
  `wall_privacy` int(11) NOT NULL,
  `wall_moderatedp` tinyint(1) NOT NULL DEFAULT '0',
  `wall_layout` int(11) NOT NULL,
  `wall_template` varchar(225) NOT NULL DEFAULT 'default',
  `wall_notifs` tinyint(1) NOT NULL DEFAULT '0',
  `wall_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wall_domain` varchar(12) NOT NULL,
  `wall_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`wall_id`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=814 ;

CREATE TABLE `wall_domains` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(225) NOT NULL,
  `wallid_fk` int(11) NOT NULL,
  PRIMARY KEY (`domain_id`),
  KEY `wallid_fk` (`wallid_fk`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

CREATE TABLE `wall_pass` (
  `pass_id` int(11) NOT NULL AUTO_INCREMENT,
  `pass_ip` varchar(15) NOT NULL,
  `wallid_fk` int(11) NOT NULL,
  `userid_fk` int(11) NOT NULL,
  PRIMARY KEY (`pass_id`),
  KEY `wallid_fk` (`wallid_fk`),
  KEY `userid_fk` (`userid_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE `wall_peoples` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `people_ip` varchar(15) NOT NULL,
  `wallid_fk` int(11) NOT NULL,
  `people_authority` int(11) NOT NULL,
  `people_email` varchar(255) NOT NULL,
  PRIMARY KEY (`people_id`),
  KEY `wallid_fk` (`wallid_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postid_fk`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `following`
  ADD CONSTRAINT `following_ibfk_1` FOREIGN KEY (`following_follower`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `following_ibfk_2` FOREIGN KEY (`following_followed`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`wallid_fk`) REFERENCES `walls` (`wall_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `reposts`
  ADD CONSTRAINT `reposts_ibfk_4` FOREIGN KEY (`wall_idfk`) REFERENCES `walls` (`wall_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `reposts_ibfk_5` FOREIGN KEY (`post_idfk`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `reposts_ibfk_6` FOREIGN KEY (`user_idfk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `user_avatars`
  ADD CONSTRAINT `user_avatars_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `user_themes`
  ADD CONSTRAINT `user_themes_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `user_wallpapers`
  ADD CONSTRAINT `user_wallpapers_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `walls`
  ADD CONSTRAINT `walls_ibfk_1` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `wall_domains`
  ADD CONSTRAINT `wall_domains_ibfk_1` FOREIGN KEY (`wallid_fk`) REFERENCES `walls` (`wall_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `wall_pass`
  ADD CONSTRAINT `wall_pass_ibfk_1` FOREIGN KEY (`wallid_fk`) REFERENCES `walls` (`wall_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `wall_pass_ibfk_2` FOREIGN KEY (`userid_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `wall_peoples`
  ADD CONSTRAINT `wall_peoples_ibfk_1` FOREIGN KEY (`wallid_fk`) REFERENCES `walls` (`wall_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

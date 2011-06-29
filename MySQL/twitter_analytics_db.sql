/* 
Copyright 2011 IRMAC Education 
this data model is distributed under the GNU AGPL license
*/

/*
SQLyog Community Edition- MySQL GUI v8.05 
MySQL - 5.1.34-community : Database - topgun_twitter_analytics
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`topgun_twitter_analytics` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `topgun_twitter_analytics`;

/*Table structure for table `bridge_group_double_keywords` */

DROP TABLE IF EXISTS `bridge_group_double_keywords`;

CREATE TABLE `bridge_group_double_keywords` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_double_keyword_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_hashtags` */

DROP TABLE IF EXISTS `bridge_group_hashtags`;

CREATE TABLE `bridge_group_hashtags` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_hashtag_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_quadruple_keywords` */

DROP TABLE IF EXISTS `bridge_group_quadruple_keywords`;

CREATE TABLE `bridge_group_quadruple_keywords` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_quadruple_keyword_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_referred_urls` */

DROP TABLE IF EXISTS `bridge_group_referred_urls`;

CREATE TABLE `bridge_group_referred_urls` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_referred_url_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_single_keywords` */

DROP TABLE IF EXISTS `bridge_group_single_keywords`;

CREATE TABLE `bridge_group_single_keywords` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_single_keyword_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_triple_keywords` */

DROP TABLE IF EXISTS `bridge_group_triple_keywords`;

CREATE TABLE `bridge_group_triple_keywords` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_triple_keyword_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `bridge_group_user_mentions` */

DROP TABLE IF EXISTS `bridge_group_user_mentions`;

CREATE TABLE `bridge_group_user_mentions` (
  `group_id` bigint(20) NOT NULL COMMENT 'ID that is referenced by tweet',
  `dim_user_mention_id` bigint(20) NOT NULL COMMENT 'FK to referred URL',
  `weighting_factor` double NOT NULL COMMENT 'When using this dimension, always multiple any facts by this weighting factor to avoid double-couting',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `group_id_IDX` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `dim_double_keywords` */

DROP TABLE IF EXISTS `dim_double_keywords`;

CREATE TABLE `dim_double_keywords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `double_keywords` varchar(140) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`double_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=113246 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_hashtags` */

DROP TABLE IF EXISTS `dim_hashtags`;

CREATE TABLE `dim_hashtags` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `hashtag` varchar(140) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`hashtag`)
) ENGINE=InnoDB AUTO_INCREMENT=2786 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_location` */

DROP TABLE IF EXISTS `dim_location`;

CREATE TABLE `dim_location` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `raw_location` varchar(127) DEFAULT NULL COMMENT 'Currently this is derived from the Twitter user''s profile.',
  `city` varchar(127) DEFAULT NULL,
  `prov_state` varchar(127) DEFAULT NULL,
  `country` varchar(127) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `is_derived_from_profile` int(11) DEFAULT NULL,
  `eff_begin_dt` datetime DEFAULT NULL,
  `eff_end_dt` datetime DEFAULT NULL,
  `dim_version` int(11) DEFAULT NULL,
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `raw_location_IDX` (`raw_location`)
) ENGINE=InnoDB AUTO_INCREMENT=46688 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_quadruple_keywords` */

DROP TABLE IF EXISTS `dim_quadruple_keywords`;

CREATE TABLE `dim_quadruple_keywords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `quadruple_keywords` varchar(140) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`quadruple_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=110327 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_referred_urls` */

DROP TABLE IF EXISTS `dim_referred_urls`;

CREATE TABLE `dim_referred_urls` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `short_URL` varchar(255) DEFAULT NULL COMMENT 'The original short URL referenced',
  `long_URL` varchar(1023) DEFAULT NULL COMMENT 'The long URL as derived from the http://longurl.org/api service',
  `domain_URL` varchar(255) DEFAULT NULL COMMENT 'The domain portion of the URL, derived from long_URL',
  `page_title` varchar(1023) DEFAULT NULL COMMENT 'The title of the referred page',
  `meta_keywords` varchar(1023) DEFAULT NULL COMMENT 'meta tag keywords derived from the referred web page',
  `meta_description` varchar(1023) DEFAULT NULL COMMENT 'meta tag description as derived from the referred web page',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`short_URL`)
) ENGINE=InnoDB AUTO_INCREMENT=28038 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_single_keywords` */

DROP TABLE IF EXISTS `dim_single_keywords`;

CREATE TABLE `dim_single_keywords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `single_keywords` varchar(140) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`single_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=38031 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_time` */

DROP TABLE IF EXISTS `dim_time`;

CREATE TABLE `dim_time` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `utc_datetime` datetime DEFAULT NULL COMMENT 'The UTC/GMT time, rounded down to the nearest hour.  Forms the first half of the natural key for this dimension',
  `utc_offset` mediumint(9) DEFAULT NULL COMMENT 'The utc_offset, forms the second half of the natural key.',
  `local_datetime` datetime DEFAULT NULL COMMENT 'The local time, derived from the UTC_datetime + UTC_offset',
  `local_day_of_week` tinyint(3) unsigned DEFAULT NULL COMMENT 'The day of week, taken from local time.  (1 = Sunday, 2 = Monday, …, 7 = Saturday)',
  `local_day_number_in_month` tinyint(4) unsigned DEFAULT NULL COMMENT 'The day in the month, taken from local time.  Valid values: 1-31',
  `local_week_number_in_year` tinyint(3) unsigned DEFAULT NULL COMMENT 'The week number in the year, taken from local time. Valid values: 1-53',
  `local_month` tinyint(3) unsigned DEFAULT NULL COMMENT 'The month in the year, taken from local time. Valid values: 1-12',
  `local_quarter` tinyint(3) unsigned DEFAULT NULL COMMENT 'The quarter of the year, taken from local time. Valid values: 1-4',
  `local_weekday_flag` char(1) DEFAULT NULL COMMENT 'Y=weekday, N=weekend.  Taken from local time.',
  `local_last_day_in_month_flag` char(1) DEFAULT NULL COMMENT 'Y=last day of month, N=every other day in month.  Taken from local time.',
  `local_hour` tinyint(4) DEFAULT NULL COMMENT 'The hour (from 0-23) of the local time',
  `placeholder_eff_begin_dt` datetime DEFAULT NULL COMMENT 'A placeholder for Pentaho''s dimension lookup/update step',
  `placeholder_eff_end_dt` datetime DEFAULT NULL COMMENT 'A placeholder for Pentaho''s dimension lookup/update step',
  `placeholder_version` int(11) DEFAULT NULL COMMENT 'A placeholder for Pentaho''s dimension lookup/update step',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created.',
  PRIMARY KEY (`ID`),
  KEY `utc_datetime_offset_IDX` (`utc_datetime`,`utc_offset`)
) ENGINE=InnoDB AUTO_INCREMENT=73978 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_triple_keywords` */

DROP TABLE IF EXISTS `dim_triple_keywords`;

CREATE TABLE `dim_triple_keywords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `triple_keywords` varchar(255) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL,
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`triple_keywords`)
) ENGINE=InnoDB AUTO_INCREMENT=129467 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_tweet_sources` */

DROP TABLE IF EXISTS `dim_tweet_sources`;

CREATE TABLE `dim_tweet_sources` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `source_url` varchar(1024) DEFAULT NULL COMMENT 'Natural key, and URL identifying source application.  NB: Source application can refer to a client app (e.g. Tweetie)',
  `source_name` varchar(1024) DEFAULT NULL COMMENT 'The name of the Twitter client',
  `dim_version` int(11) DEFAULT NULL COMMENT 'Type II Slowly Changing Dimension version',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'Effective begin date of this dimension',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'Effective end date of this dimension',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1262 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_tweets` */

DROP TABLE IF EXISTS `dim_tweets`;

CREATE TABLE `dim_tweets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `tweet_ID` bigint(20) DEFAULT NULL COMMENT 'The tweet''s natural key',
  `tweet_dt` datetime DEFAULT NULL COMMENT 'The time of tweet in UTC/GMT timezone',
  `tweet_status` varchar(255) DEFAULT NULL COMMENT 'The actual tweet message. In theory this should not exceed 140 characters, but there is evidence to suggest longer tweets are possible.',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`ID`),
  KEY `tweet_ID` (`tweet_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=157382 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_twitter_keyword_searches` */

DROP TABLE IF EXISTS `dim_twitter_keyword_searches`;

CREATE TABLE `dim_twitter_keyword_searches` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `effective_begin_date` datetime DEFAULT NULL COMMENT 'When this record is valid from (Type II Slowly Changing Dimension)',
  `effective_end_date` datetime DEFAULT NULL COMMENT 'When this record is valid until (Type II Slowly Changing Dimension)',
  `dim_version` smallint(6) DEFAULT NULL COMMENT 'Version of this record (Type II Slowly Changing Dimension)',
  `source_keyword_id` bigint(20) DEFAULT NULL COMMENT 'The natural key for this dimension',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'keywords to search for',
  `source_topic_id` bigint(20) DEFAULT NULL COMMENT 'The topic this keyword pertains to',
  `source_topic_description` varchar(255) DEFAULT NULL,
  `is_phrase` char(1) DEFAULT NULL COMMENT 'Y=search these keywords as a distinct phrase, N=search these keywords as independent keywords',
  `language_code` char(2) DEFAULT NULL COMMENT 'Restricts tweets to the given language, given by an ISO 639-1 code',
  `latitude` double DEFAULT NULL COMMENT 'Returns tweets by users located within a given radius of the given latitude/longitude, where the user''s location is taken from their Twitter profile.',
  `longitude` double DEFAULT NULL COMMENT 'Returns tweets by users located within a given radius of the given latitude/longitude, where the user''s location is taken from their Twitter profile.',
  `radius` smallint(5) unsigned DEFAULT NULL COMMENT 'The radius to search in units specified by the radius_unit_id',
  `radius_unit_id` char(2) DEFAULT NULL COMMENT 'The unit of measurement used when specifying the search radius. Permitted values: km=kilometers; mi=miles',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_twitter_users` */

DROP TABLE IF EXISTS `dim_twitter_users`;

CREATE TABLE `dim_twitter_users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `effective_begin_date` datetime DEFAULT NULL COMMENT 'The date when the account was created',
  `effective_end_date` datetime DEFAULT NULL COMMENT 'The date this record is no longer effective until',
  `current_version` char(1) DEFAULT NULL COMMENT 'The current version of this record',
  `dim_version` smallint(11) unsigned DEFAULT NULL,
  `twitter_id` bigint(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `screen_name` varchar(15) DEFAULT NULL,
  `location` varchar(127) DEFAULT NULL,
  `description` varchar(1023) DEFAULT NULL,
  `profile_image_url` varchar(400) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT 'More Info URL',
  `utc_offset` mediumint(11) DEFAULT NULL COMMENT 'The number of seconds offset from UTC/GMT',
  `time_zone` varchar(127) DEFAULT NULL,
  `protected` char(1) DEFAULT NULL,
  `profile_background_color` mediumint(20) unsigned DEFAULT NULL,
  `profile_text_color` mediumint(20) unsigned DEFAULT NULL,
  `profile_link_color` mediumint(20) unsigned DEFAULT NULL,
  `profile_sidebar_fill_color` mediumint(20) unsigned DEFAULT NULL,
  `profile_sidebar_border_color` mediumint(20) unsigned DEFAULT NULL,
  `profile_background_image_url` varchar(400) DEFAULT NULL,
  `profile_background_tile` char(1) DEFAULT NULL,
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`ID`),
  KEY `screen_name_IDX` (`screen_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62163 DEFAULT CHARSET=latin1;

/*Table structure for table `dim_user_mentions` */

DROP TABLE IF EXISTS `dim_user_mentions`;

CREATE TABLE `dim_user_mentions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `user_mention` varchar(255) DEFAULT NULL COMMENT 'The original short URL referenced',
  `eff_begin_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `eff_end_dt` datetime DEFAULT NULL COMMENT 'This tag is a placeholder to keep Pentaho happy, as this is a Type I SCD',
  `dim_version` int(11) DEFAULT NULL,
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'timestamp when this record was created',
  PRIMARY KEY (`ID`),
  KEY `short_URL` (`user_mention`)
) ENGINE=InnoDB AUTO_INCREMENT=16431 DEFAULT CHARSET=latin1;

/*Table structure for table `fact_history_twitter_users` */

DROP TABLE IF EXISTS `fact_history_twitter_users`;

CREATE TABLE `fact_history_twitter_users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `dim_twitter_user_id` bigint(20) DEFAULT NULL,
  `dim_location_id` bigint(20) DEFAULT NULL COMMENT 'FK to location dimension',
  `twitter_id` bigint(20) DEFAULT NULL COMMENT 'natural key',
  `followers_count` int(10) unsigned DEFAULT NULL,
  `friends_count` int(10) unsigned DEFAULT NULL,
  `favourites_count` int(10) unsigned DEFAULT NULL,
  `statuses_count` int(10) unsigned DEFAULT NULL COMMENT 'The number of tweets',
  `current_snapshot` char(1) DEFAULT 'N',
  `snapshot_date` datetime DEFAULT NULL,
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `twitter_id_idx` (`twitter_id`),
  KEY `FK_fact_history_twitter_users_dtui` (`dim_twitter_user_id`),
  KEY `FK_fact_history_twitter_users_dli` (`dim_location_id`),
  KEY `current_snapshot_IDX` (`current_snapshot`),
  CONSTRAINT `FK_fact_history_twitter_users_dli` FOREIGN KEY (`dim_location_id`) REFERENCES `dim_location` (`ID`),
  CONSTRAINT `FK_fact_history_twitter_users_dtui` FOREIGN KEY (`dim_twitter_user_id`) REFERENCES `dim_twitter_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=80881 DEFAULT CHARSET=latin1;

/*Table structure for table `fact_tweets` */

DROP TABLE IF EXISTS `fact_tweets`;

CREATE TABLE `fact_tweets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `dim_tweet_id` bigint(20) DEFAULT NULL,
  `tweet_dt` datetime DEFAULT NULL COMMENT 'time of the tweet in UTC/GMT time',
  `dim_twitter_keyword_search_id` bigint(20) DEFAULT NULL COMMENT 'FK to the search that yielded this tweet as a search result',
  `dim_time_id` bigint(20) DEFAULT NULL COMMENT 'FK to the time dimension.  This dimension is based on the local time of the tweet',
  `dim_location_id` bigint(20) DEFAULT NULL COMMENT 'FK to the location dimension.  This dimension is, for now, based on the profile location.',
  `dim_tweet_source_id` bigint(20) DEFAULT NULL COMMENT 'FK to the source of the tweet',
  `from_dim_twitter_user_id` bigint(20) DEFAULT NULL COMMENT 'FK to the user that sent the tweet',
  `bridge_group_referred_url_id` bigint(20) DEFAULT NULL COMMENT 'FK to the referred URL group',
  `bridge_group_single_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to the single keyword',
  `bridge_group_double_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to the double keyword',
  `bridge_group_triple_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to the triple keyword',
  `bridge_group_quadruple_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to the quadruple keyword',
  `bridge_group_user_mention_id` bigint(20) DEFAULT NULL COMMENT 'FK to the user mention',
  `bridge_group_hashtag_id` bigint(20) DEFAULT NULL COMMENT 'FK to the hashtag',
  `num_user_mentions` tinyint(3) unsigned DEFAULT NULL COMMENT 'Boolean.  True if tweet contains 1 or more user mentions',
  `num_hashtags` tinyint(3) unsigned DEFAULT NULL COMMENT 'Boolean.  True if tweet contains hashtag',
  `num_embedded_urls` tinyint(3) unsigned DEFAULT NULL COMMENT 'The number of URLs embedded into the tweet.  Includes repeated URLs',
  `num_bitly_urls` tinyint(4) DEFAULT NULL COMMENT 'The number of unique bit.ly URLs embedded into the tweet.',
  `num_bitly_user_clicks` int(11) DEFAULT NULL COMMENT 'The number of clicks for this specific bit.ly link.',
  `num_bitly_global_clicks` int(11) DEFAULT NULL COMMENT 'The total count of clicks to all bit.ly links that point to the same same long url.',
  `num_keywords` tinyint(3) unsigned DEFAULT NULL COMMENT 'The number of keywords in the tweet, including duplicates, excluding: URLs; user mentions; and hashtags',
  `followers_count` int(10) unsigned DEFAULT NULL COMMENT 'The number of followers this tweet was sent out to',
  `following_count` int(11) DEFAULT NULL COMMENT 'The number of persons being followed.  Twitter also refers to this as the number of Friends.',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created in this database',
  PRIMARY KEY (`ID`),
  KEY `FK_fact_tweets_dtks` (`dim_twitter_keyword_search_id`),
  KEY `FK_fact_tweets_dl` (`dim_location_id`),
  KEY `FK_fact_tweets_dt` (`dim_time_id`),
  KEY `FK_fact_tweets_dts` (`dim_tweet_source_id`),
  KEY `FK_fact_tweets_dtweet` (`dim_tweet_id`),
  KEY `FK_fact_tweets_dtwuser` (`from_dim_twitter_user_id`),
  CONSTRAINT `FK_fact_tweets_dl` FOREIGN KEY (`dim_location_id`) REFERENCES `dim_location` (`ID`),
  CONSTRAINT `FK_fact_tweets_dt` FOREIGN KEY (`dim_time_id`) REFERENCES `dim_time` (`ID`),
  CONSTRAINT `FK_fact_tweets_dtks` FOREIGN KEY (`dim_twitter_keyword_search_id`) REFERENCES `dim_twitter_keyword_searches` (`ID`),
  CONSTRAINT `FK_fact_tweets_dts` FOREIGN KEY (`dim_tweet_source_id`) REFERENCES `dim_tweet_sources` (`ID`),
  CONSTRAINT `FK_fact_tweets_dtweet` FOREIGN KEY (`dim_tweet_id`) REFERENCES `dim_tweets` (`ID`),
  CONSTRAINT `FK_fact_tweets_dtwuser` FOREIGN KEY (`from_dim_twitter_user_id`) REFERENCES `dim_twitter_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=157562 DEFAULT CHARSET=latin1;

/*Table structure for table `job_keyword_searches` */

DROP TABLE IF EXISTS `job_keyword_searches`;

CREATE TABLE `job_keyword_searches` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `source_keyword_id` bigint(20) NOT NULL COMMENT 'FK to source keyword',
  `state_id` char(20) NOT NULL COMMENT 'The current state of the search',
  `max_pages_remaining` int(10) unsigned NOT NULL COMMENT 'The maximum number of pages remaining for this search',
  `current_page` int(10) unsigned NOT NULL COMMENT 'The current page to be retrieved.',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `job_user_lookups` */

DROP TABLE IF EXISTS `job_user_lookups`;

CREATE TABLE `job_user_lookups` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `twitter_screen_name` varchar(15) DEFAULT NULL,
  `state_id` char(20) DEFAULT NULL,
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ref_job_states` */

DROP TABLE IF EXISTS `ref_job_states`;

CREATE TABLE `ref_job_states` (
  `ID` char(20) NOT NULL COMMENT 'PK',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ref_radius_units` */

DROP TABLE IF EXISTS `ref_radius_units`;

CREATE TABLE `ref_radius_units` (
  `ID` char(2) NOT NULL COMMENT 'PK',
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `ref_stopwords` */

DROP TABLE IF EXISTS `ref_stopwords`;

CREATE TABLE `ref_stopwords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `stopword` varchar(63) NOT NULL COMMENT 'commonly found word with little or no analytical significance.  Stopwords are effectively "noise"',
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `stopword_IDX` (`stopword`)
) ENGINE=InnoDB AUTO_INCREMENT=1091 DEFAULT CHARSET=latin1;

/*Table structure for table `settings` */

DROP TABLE IF EXISTS `settings`;

CREATE TABLE `settings` (
  `attribute_id` char(60) DEFAULT NULL,
  `attribute_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `source_keywords` */

DROP TABLE IF EXISTS `source_keywords`;

CREATE TABLE `source_keywords` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `source_topic_id` bigint(20) DEFAULT NULL COMMENT 'FK to the topic this keyword pertains to',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'keywords to search for.  See: http://search.twitter.com/operators for search operator reference',
  `is_phrase` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y=search these keywords as a distinct phrase, N=search these keywords as independent keywords',
  `language_code` char(2) DEFAULT NULL COMMENT 'Restricts tweets to the given language, given by an ISO 639-1 code. NB: This option triggers a bug in Twitter''s own search API when used in conjunction with since_id.  Advised not to use this language attribute without explicit testing.',
  `latitude` double DEFAULT NULL COMMENT 'Returns tweets by users located within a given radius of the given latitude/longitude, where the user''s location is taken from their Twitter profile.',
  `longitude` double DEFAULT NULL COMMENT 'Returns tweets by users located within a given radius of the given latitude/longitude, where the user''s location is taken from their Twitter profile.',
  `radius` smallint(5) unsigned DEFAULT NULL COMMENT 'The radius to search in units specified by the radius_unit_id',
  `radius_unit_id` char(2) DEFAULT NULL COMMENT 'The unit of measurement used when specifying the search radius. Permitted values: km=kilometers; mi=miles',
  `last_tweet_id` bigint(20) DEFAULT NULL COMMENT 'The last tweet ID to search from',
  `priority` int(11) NOT NULL DEFAULT '999999' COMMENT 'Determines prioritization of search term, and what search term is attributed to a tweet, should multiple searches return the same tweet',
  `suspended` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y=suspend this from searches, N=proceed to use this keyword',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`ID`),
  KEY `FK_source_keywords` (`radius_unit_id`),
  KEY `FK_source_keywords_topics` (`source_topic_id`),
  CONSTRAINT `FK_source_keywords` FOREIGN KEY (`radius_unit_id`) REFERENCES `ref_radius_units` (`ID`),
  CONSTRAINT `FK_source_keywords_topics` FOREIGN KEY (`source_topic_id`) REFERENCES `source_topics` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;

/*Table structure for table `source_topics` */

DROP TABLE IF EXISTS `source_topics`;

CREATE TABLE `source_topics` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `topic_description` varchar(255) DEFAULT NULL,
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Table structure for table `staging_candidate_tweets` */

DROP TABLE IF EXISTS `staging_candidate_tweets`;

CREATE TABLE `staging_candidate_tweets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'PK',
  `sort_rank` char(36) DEFAULT NULL COMMENT 'A random string (UUID4).  This field allows us to randomly sample for the population of candidates',
  `tweet_ID` bigint(20) DEFAULT NULL COMMENT 'The tweet''s natural key',
  `dim_twitter_keyword_search_id` bigint(20) DEFAULT NULL COMMENT 'FK to the search that was invoked to produce this search result',
  `from_user_screen_name` varchar(15) DEFAULT NULL COMMENT 'The user''s alias who sent who''s tweet belonged to',
  `tweet_dt` datetime DEFAULT NULL COMMENT 'The time of tweet in UTC/GMT timezone',
  `tweet_status` varchar(255) DEFAULT NULL COMMENT 'The actual tweet message. In theory this should not exceed 140 characters, but there is evidence to suggest longer tweets are possible.',
  `tweet_source` varchar(2048) DEFAULT NULL COMMENT 'The client software or service used to produce this tweet',
  `priority` int(11) DEFAULT NULL COMMENT 'Determines which tweets will be sampled, to ensure searches results can be prioritized',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `staging_fact_tweets` */

DROP TABLE IF EXISTS `staging_fact_tweets`;

CREATE TABLE `staging_fact_tweets` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `dim_tweet_id` bigint(20) DEFAULT NULL,
  `tweet_dt` datetime DEFAULT NULL COMMENT 'time of the tweet in UTC/GMT time',
  `dim_twitter_keyword_search_id` bigint(20) DEFAULT NULL COMMENT 'FK to the search that yielded this tweet as a search result',
  `dim_time_id` bigint(20) DEFAULT NULL COMMENT 'FK to the time dimension.  This dimension is based on the local time of the tweet',
  `dim_location_id` bigint(20) DEFAULT NULL COMMENT 'FK to the location dimension.  This dimension is, for now, based on the profile location.',
  `dim_tweet_source_id` bigint(20) DEFAULT NULL COMMENT 'FK to the source of the tweet',
  `twitter_from_screen_name` varchar(15) DEFAULT NULL COMMENT 'natural key for the Tweet''s Twitter account',
  `from_dim_twitter_user_id` bigint(20) DEFAULT NULL COMMENT 'FK to the user that sent the tweet',
  `bridge_group_referred_url_id` bigint(20) DEFAULT NULL COMMENT 'FK to the referred URL group',
  `bridge_group_single_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to single keyword ID',
  `bridge_group_double_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to double keyword ID',
  `bridge_group_triple_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to triple keyword ID',
  `bridge_group_quadruple_keyword_id` bigint(20) DEFAULT NULL COMMENT 'FK to quadruple keyword',
  `bridge_group_user_mention_id` bigint(20) DEFAULT NULL COMMENT 'FK to user mention ID',
  `bridge_group_hashtag_id` bigint(20) DEFAULT NULL COMMENT 'FK to hashtag ID',
  `num_user_mentions` tinyint(3) unsigned DEFAULT NULL COMMENT 'Boolean.  True if tweet contains 1 or more user mentions',
  `num_hashtags` tinyint(3) unsigned DEFAULT NULL COMMENT 'Boolean.  True if tweet contains hashtag',
  `num_embedded_URLs` tinyint(3) unsigned DEFAULT NULL COMMENT 'The number of URLs embedded into the tweet.  Includes repeated URLs',
  `num_bitly_URLs` tinyint(4) DEFAULT NULL COMMENT 'The number of unique bit.ly URLs embedded into the tweet.',
  `num_bitly_user_clicks` int(11) DEFAULT NULL COMMENT 'The number of clicks for this specific bit.ly link.',
  `num_bitly_global_clicks` int(11) DEFAULT NULL COMMENT 'The total count of clicks to all bit.ly links that point to the same same long url',
  `num_keywords` tinyint(3) unsigned DEFAULT NULL COMMENT 'The number of keywords in the tweet, including duplicates, excluding: URLs; user mentions; and hashtags',
  `followers_count` int(10) unsigned DEFAULT NULL COMMENT 'The number of followers this tweet was sent out to',
  `following_count` int(11) DEFAULT NULL COMMENT 'The number of persons being followed.  Twitter also refers to this as the number of Friends',
  `rec_create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When this record was created in this database',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=latin1;

/*Table structure for table `staging_fact_twitter_users` */

DROP TABLE IF EXISTS `staging_fact_twitter_users`;

CREATE TABLE `staging_fact_twitter_users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `dim_twitter_user_id` bigint(20) DEFAULT NULL,
  `dim_location_id` bigint(20) DEFAULT NULL COMMENT 'FK to location dimension',
  `twitter_id` bigint(20) DEFAULT NULL COMMENT 'natural key',
  `followers_count` int(10) unsigned DEFAULT NULL,
  `friends_count` int(10) unsigned DEFAULT NULL,
  `favourites_count` int(10) unsigned DEFAULT NULL,
  `statuses_count` int(10) unsigned DEFAULT NULL COMMENT 'The number of tweets',
  `current_snapshot` char(1) DEFAULT 'N',
  `snapshot_datetime` datetime DEFAULT NULL,
  `rec_create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;


/*
SQLyog Community Edition- MySQL GUI v8.05 
MySQL - 5.1.34-community : Database - topgun_twitter_analytics
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Data for the table `ref_job_states` */

LOCK TABLES `ref_job_states` WRITE;

insert  into `ref_job_states`(`ID`,`description`) values ('LOOKUPCOMPLETE','The Twitter user lookup completed successfully'),('PENDINGLOOKUP','The Twitter user is pending a lookup call to extract their current profile data'),('PENDINGSEARCH','Keyword is pending search'),('PENDINGURLEXTRACT','Pending URL extraction'),('SEARCHCOMPLETE','The keyword search is complete'),('SEARCHINPROGRESS','The keyword search is in progress'),('URLEXTRACTCOMPLETE','URL extraction is complete');

UNLOCK TABLES;

/*Data for the table `ref_radius_units` */

LOCK TABLES `ref_radius_units` WRITE;

insert  into `ref_radius_units`(`ID`,`Description`) values ('km','kilometres'),('mi','miles');

UNLOCK TABLES;

/*Data for the table `ref_stopwords` */

LOCK TABLES `ref_stopwords` WRITE;

insert  into `ref_stopwords`(`ID`,`stopword`,`rec_create_date`) values (545,'a\'s ','2009-10-05 10:10:57'),(546,'accordingly ','2009-10-05 10:10:57'),(547,'again ','2009-10-05 10:10:57'),(548,'allows ','2009-10-05 10:10:57'),(549,'also ','2009-10-05 10:10:57'),(550,'amongst ','2009-10-05 10:10:57'),(551,'anybody ','2009-10-05 10:10:57'),(552,'anyways ','2009-10-05 10:10:57'),(553,'appropriate ','2009-10-05 10:10:57'),(554,'aside ','2009-10-05 10:10:57'),(555,'available ','2009-10-05 10:10:57'),(556,'because ','2009-10-05 10:10:57'),(557,'before ','2009-10-05 10:10:57'),(558,'below ','2009-10-05 10:10:57'),(559,'between ','2009-10-05 10:10:57'),(560,'by ','2009-10-05 10:10:57'),(561,'can\'t ','2009-10-05 10:10:57'),(562,'certain ','2009-10-05 10:10:57'),(563,'com ','2009-10-05 10:10:57'),(564,'consider ','2009-10-05 10:10:57'),(565,'corresponding ','2009-10-05 10:10:57'),(566,'definitely ','2009-10-05 10:10:57'),(567,'different ','2009-10-05 10:10:57'),(568,'don\'t ','2009-10-05 10:10:57'),(569,'each ','2009-10-05 10:10:57'),(570,'else ','2009-10-05 10:10:57'),(571,'et ','2009-10-05 10:10:57'),(572,'everybody ','2009-10-05 10:10:57'),(573,'exactly ','2009-10-05 10:10:57'),(574,'fifth ','2009-10-05 10:10:57'),(575,'follows ','2009-10-05 10:10:57'),(576,'four ','2009-10-05 10:10:57'),(577,'gets ','2009-10-05 10:10:57'),(578,'goes ','2009-10-05 10:10:57'),(579,'greetings ','2009-10-05 10:10:57'),(580,'has ','2009-10-05 10:10:57'),(581,'he ','2009-10-05 10:10:57'),(582,'her ','2009-10-05 10:10:57'),(583,'herein ','2009-10-05 10:10:57'),(584,'him ','2009-10-05 10:10:57'),(585,'how ','2009-10-05 10:10:57'),(586,'i\'m ','2009-10-05 10:10:57'),(587,'immediate ','2009-10-05 10:10:57'),(588,'indicate ','2009-10-05 10:10:57'),(589,'instead ','2009-10-05 10:10:57'),(590,'it ','2009-10-05 10:10:57'),(591,'itself ','2009-10-05 10:10:57'),(592,'know ','2009-10-05 10:10:57'),(593,'later ','2009-10-05 10:10:57'),(594,'lest ','2009-10-05 10:10:57'),(595,'likely ','2009-10-05 10:10:57'),(596,'ltd ','2009-10-05 10:10:57'),(597,'me ','2009-10-05 10:10:57'),(598,'more ','2009-10-05 10:10:57'),(599,'must ','2009-10-05 10:10:57'),(600,'nd ','2009-10-05 10:10:57'),(601,'needs ','2009-10-05 10:10:57'),(602,'next ','2009-10-05 10:10:57'),(603,'none ','2009-10-05 10:10:57'),(604,'nothing ','2009-10-05 10:10:57'),(605,'of ','2009-10-05 10:10:57'),(606,'okay ','2009-10-05 10:10:57'),(607,'ones ','2009-10-05 10:10:57'),(608,'others ','2009-10-05 10:10:57'),(609,'ourselves ','2009-10-05 10:10:57'),(610,'own ','2009-10-05 10:10:57'),(611,'placed ','2009-10-05 10:10:57'),(612,'probably ','2009-10-05 10:10:57'),(613,'rather ','2009-10-05 10:10:57'),(614,'regarding ','2009-10-05 10:10:57'),(615,'right ','2009-10-05 10:10:57'),(616,'saying ','2009-10-05 10:10:57'),(617,'seeing ','2009-10-05 10:10:57'),(618,'seen ','2009-10-05 10:10:57'),(619,'serious ','2009-10-05 10:10:57'),(620,'she ','2009-10-05 10:10:57'),(621,'so ','2009-10-05 10:10:57'),(622,'something ','2009-10-05 10:10:57'),(623,'soon ','2009-10-05 10:10:57'),(624,'still ','2009-10-05 10:10:57'),(625,'t\'s ','2009-10-05 10:10:57'),(626,'th ','2009-10-05 10:10:57'),(627,'that ','2009-10-05 10:10:57'),(628,'theirs ','2009-10-05 10:10:57'),(629,'there ','2009-10-05 10:10:57'),(630,'therein ','2009-10-05 10:10:57'),(631,'they\'d ','2009-10-05 10:10:57'),(632,'third ','2009-10-05 10:10:57'),(633,'though ','2009-10-05 10:10:57'),(634,'thus ','2009-10-05 10:10:57'),(635,'toward ','2009-10-05 10:10:57'),(636,'try ','2009-10-05 10:10:57'),(637,'under ','2009-10-05 10:10:57'),(638,'unto ','2009-10-05 10:10:57'),(639,'used ','2009-10-05 10:10:57'),(640,'value ','2009-10-05 10:10:57'),(641,'vs ','2009-10-05 10:10:57'),(642,'way ','2009-10-05 10:10:57'),(643,'we\'ve ','2009-10-05 10:10:57'),(644,'weren\'t ','2009-10-05 10:10:57'),(645,'whence ','2009-10-05 10:10:57'),(646,'whereas ','2009-10-05 10:10:57'),(647,'whether ','2009-10-05 10:10:57'),(648,'who\'s ','2009-10-05 10:10:57'),(649,'why ','2009-10-05 10:10:57'),(650,'within ','2009-10-05 10:10:57'),(651,'would ','2009-10-05 10:10:57'),(652,'you\'d ','2009-10-05 10:10:57'),(653,'yours ','2009-10-05 10:10:57'),(654,'able ','2009-10-05 10:10:57'),(655,'across ','2009-10-05 10:10:57'),(656,'against ','2009-10-05 10:10:57'),(657,'almost ','2009-10-05 10:10:57'),(658,'although ','2009-10-05 10:10:57'),(659,'an ','2009-10-05 10:10:57'),(660,'anyhow ','2009-10-05 10:10:57'),(661,'anywhere ','2009-10-05 10:10:57'),(662,'are ','2009-10-05 10:10:57'),(663,'ask ','2009-10-05 10:10:57'),(664,'away ','2009-10-05 10:10:57'),(665,'become ','2009-10-05 10:10:57'),(666,'beforehand ','2009-10-05 10:10:57'),(667,'beside ','2009-10-05 10:10:57'),(668,'beyond ','2009-10-05 10:10:57'),(669,'c\'mon ','2009-10-05 10:10:57'),(670,'cannot ','2009-10-05 10:10:57'),(671,'certainly ','2009-10-05 10:10:57'),(672,'come ','2009-10-05 10:10:57'),(673,'considering ','2009-10-05 10:10:57'),(674,'could ','2009-10-05 10:10:57'),(675,'described ','2009-10-05 10:10:57'),(676,'do ','2009-10-05 10:10:57'),(677,'done ','2009-10-05 10:10:57'),(678,'edu ','2009-10-05 10:10:57'),(679,'elsewhere ','2009-10-05 10:10:57'),(680,'etc ','2009-10-05 10:10:57'),(681,'everyone ','2009-10-05 10:10:57'),(682,'example ','2009-10-05 10:10:57'),(683,'first ','2009-10-05 10:10:57'),(684,'for ','2009-10-05 10:10:57'),(685,'from ','2009-10-05 10:10:57'),(686,'getting ','2009-10-05 10:10:57'),(687,'going ','2009-10-05 10:10:57'),(688,'had ','2009-10-05 10:10:57'),(689,'hasn\'t ','2009-10-05 10:10:57'),(690,'he\'s ','2009-10-05 10:10:57'),(691,'here ','2009-10-05 10:10:57'),(692,'hereupon ','2009-10-05 10:10:57'),(693,'himself ','2009-10-05 10:10:57'),(694,'howbeit ','2009-10-05 10:10:57'),(695,'i\'ve ','2009-10-05 10:10:57'),(696,'in ','2009-10-05 10:10:57'),(697,'indicated ','2009-10-05 10:10:57'),(698,'into ','2009-10-05 10:10:57'),(699,'it\'d ','2009-10-05 10:10:57'),(700,'just ','2009-10-05 10:10:57'),(701,'knows ','2009-10-05 10:10:57'),(702,'latter ','2009-10-05 10:10:57'),(703,'let ','2009-10-05 10:10:57'),(704,'little ','2009-10-05 10:10:57'),(705,'mainly ','2009-10-05 10:10:57'),(706,'mean ','2009-10-05 10:10:57'),(707,'moreover ','2009-10-05 10:10:57'),(708,'my ','2009-10-05 10:10:57'),(709,'near ','2009-10-05 10:10:57'),(710,'neither ','2009-10-05 10:10:57'),(711,'nine ','2009-10-05 10:10:57'),(712,'noone ','2009-10-05 10:10:57'),(713,'novel ','2009-10-05 10:10:57'),(714,'off ','2009-10-05 10:10:57'),(715,'old ','2009-10-05 10:10:57'),(716,'only ','2009-10-05 10:10:57'),(717,'otherwise ','2009-10-05 10:10:57'),(718,'out ','2009-10-05 10:10:57'),(719,'particular ','2009-10-05 10:10:57'),(720,'please ','2009-10-05 10:10:57'),(721,'provides ','2009-10-05 10:10:57'),(722,'rd ','2009-10-05 10:10:57'),(723,'regardless ','2009-10-05 10:10:57'),(724,'said ','2009-10-05 10:10:57'),(725,'says ','2009-10-05 10:10:57'),(726,'seem ','2009-10-05 10:10:57'),(727,'self ','2009-10-05 10:10:57'),(728,'seriously ','2009-10-05 10:10:57'),(729,'should ','2009-10-05 10:10:57'),(730,'some ','2009-10-05 10:10:57'),(731,'sometime ','2009-10-05 10:10:57'),(732,'sorry ','2009-10-05 10:10:57'),(733,'sub ','2009-10-05 10:10:57'),(734,'take ','2009-10-05 10:10:57'),(735,'than ','2009-10-05 10:10:57'),(736,'that\'s ','2009-10-05 10:10:57'),(737,'them ','2009-10-05 10:10:57'),(738,'there\'s ','2009-10-05 10:10:57'),(739,'theres ','2009-10-05 10:10:57'),(740,'they\'ll ','2009-10-05 10:10:57'),(741,'this ','2009-10-05 10:10:57'),(742,'three ','2009-10-05 10:10:57'),(743,'to ','2009-10-05 10:10:57'),(744,'towards ','2009-10-05 10:10:57'),(745,'trying ','2009-10-05 10:10:57'),(746,'unfortunately ','2009-10-05 10:10:57'),(747,'up ','2009-10-05 10:10:57'),(748,'useful ','2009-10-05 10:10:57'),(749,'various ','2009-10-05 10:10:57'),(750,'want ','2009-10-05 10:10:57'),(751,'we ','2009-10-05 10:10:57'),(752,'welcome ','2009-10-05 10:10:57'),(753,'what ','2009-10-05 10:10:57'),(754,'whenever ','2009-10-05 10:10:57'),(755,'whereby ','2009-10-05 10:10:57'),(756,'which ','2009-10-05 10:10:57'),(757,'whoever ','2009-10-05 10:10:57'),(758,'will ','2009-10-05 10:10:57'),(759,'without ','2009-10-05 10:10:57'),(760,'wouldn\'t ','2009-10-05 10:10:57'),(761,'you\'ll ','2009-10-05 10:10:57'),(762,'yourself ','2009-10-05 10:10:57'),(763,'about ','2009-10-05 10:10:57'),(764,'actually ','2009-10-05 10:10:57'),(765,'ain\'t ','2009-10-05 10:10:57'),(766,'alone ','2009-10-05 10:10:57'),(767,'always ','2009-10-05 10:10:57'),(768,'and ','2009-10-05 10:10:57'),(769,'anyone ','2009-10-05 10:10:57'),(770,'apart ','2009-10-05 10:10:57'),(771,'aren\'t ','2009-10-05 10:10:57'),(772,'asking ','2009-10-05 10:10:57'),(773,'awfully ','2009-10-05 10:10:57'),(774,'becomes ','2009-10-05 10:10:57'),(775,'behind ','2009-10-05 10:10:57'),(776,'besides ','2009-10-05 10:10:57'),(777,'both ','2009-10-05 10:10:57'),(778,'c\'s ','2009-10-05 10:10:57'),(779,'cant ','2009-10-05 10:10:57'),(780,'changes ','2009-10-05 10:10:57'),(781,'comes ','2009-10-05 10:10:57'),(782,'contain ','2009-10-05 10:10:57'),(783,'couldn\'t ','2009-10-05 10:10:57'),(784,'despite ','2009-10-05 10:10:57'),(785,'does ','2009-10-05 10:10:57'),(786,'down ','2009-10-05 10:10:57'),(787,'eg ','2009-10-05 10:10:57'),(788,'enough ','2009-10-05 10:10:57'),(789,'even ','2009-10-05 10:10:57'),(790,'everything ','2009-10-05 10:10:57'),(791,'except ','2009-10-05 10:10:57'),(792,'five ','2009-10-05 10:10:57'),(793,'former ','2009-10-05 10:10:57'),(794,'further ','2009-10-05 10:10:57'),(795,'given ','2009-10-05 10:10:57'),(796,'gone ','2009-10-05 10:10:57'),(797,'hadn\'t ','2009-10-05 10:10:57'),(798,'have ','2009-10-05 10:10:57'),(799,'hello ','2009-10-05 10:10:57'),(800,'here\'s ','2009-10-05 10:10:57'),(801,'hers ','2009-10-05 10:10:57'),(802,'his ','2009-10-05 10:10:57'),(803,'however ','2009-10-05 10:10:57'),(804,'ie ','2009-10-05 10:10:57'),(805,'inasmuch ','2009-10-05 10:10:57'),(806,'indicates ','2009-10-05 10:10:57'),(807,'inward ','2009-10-05 10:10:57'),(808,'it\'ll ','2009-10-05 10:10:57'),(809,'keep ','2009-10-05 10:10:57'),(810,'known ','2009-10-05 10:10:57'),(811,'latterly ','2009-10-05 10:10:57'),(812,'let\'s ','2009-10-05 10:10:57'),(813,'look ','2009-10-05 10:10:57'),(814,'many ','2009-10-05 10:10:57'),(815,'meanwhile ','2009-10-05 10:10:57'),(816,'most ','2009-10-05 10:10:57'),(817,'myself ','2009-10-05 10:10:57'),(818,'nearly ','2009-10-05 10:10:57'),(819,'never ','2009-10-05 10:10:57'),(820,'no ','2009-10-05 10:10:57'),(821,'nor ','2009-10-05 10:10:57'),(822,'now ','2009-10-05 10:10:57'),(823,'often ','2009-10-05 10:10:57'),(824,'on ','2009-10-05 10:10:57'),(825,'onto ','2009-10-05 10:10:57'),(826,'ought ','2009-10-05 10:10:57'),(827,'outside ','2009-10-05 10:10:57'),(828,'particularly ','2009-10-05 10:10:57'),(829,'plus ','2009-10-05 10:10:57'),(830,'que ','2009-10-05 10:10:57'),(831,'re ','2009-10-05 10:10:57'),(832,'regards ','2009-10-05 10:10:57'),(833,'same ','2009-10-05 10:10:57'),(834,'second ','2009-10-05 10:10:57'),(835,'seemed ','2009-10-05 10:10:57'),(836,'selves ','2009-10-05 10:10:57'),(837,'seven ','2009-10-05 10:10:57'),(838,'shouldn\'t ','2009-10-05 10:10:57'),(839,'somebody ','2009-10-05 10:10:57'),(840,'sometimes ','2009-10-05 10:10:57'),(841,'specified ','2009-10-05 10:10:57'),(842,'such ','2009-10-05 10:10:57'),(843,'taken ','2009-10-05 10:10:57'),(844,'thank ','2009-10-05 10:10:57'),(845,'thats ','2009-10-05 10:10:57'),(846,'themselves ','2009-10-05 10:10:57'),(847,'thereafter ','2009-10-05 10:10:57'),(848,'thereupon ','2009-10-05 10:10:57'),(849,'they\'re ','2009-10-05 10:10:57'),(850,'thorough ','2009-10-05 10:10:57'),(851,'through ','2009-10-05 10:10:57'),(852,'together ','2009-10-05 10:10:57'),(853,'tried ','2009-10-05 10:10:57'),(854,'twice ','2009-10-05 10:10:57'),(855,'unless ','2009-10-05 10:10:57'),(856,'upon ','2009-10-05 10:10:57'),(857,'uses ','2009-10-05 10:10:57'),(858,'very ','2009-10-05 10:10:57'),(859,'wants ','2009-10-05 10:10:57'),(860,'we\'d ','2009-10-05 10:10:57'),(861,'well ','2009-10-05 10:10:57'),(862,'what\'s ','2009-10-05 10:10:57'),(863,'where ','2009-10-05 10:10:57'),(864,'wherein ','2009-10-05 10:10:57'),(865,'while ','2009-10-05 10:10:57'),(866,'whole ','2009-10-05 10:10:57'),(867,'willing ','2009-10-05 10:10:57'),(868,'won\'t ','2009-10-05 10:10:57'),(869,'yes ','2009-10-05 10:10:57'),(870,'you\'re ','2009-10-05 10:10:57'),(871,'yourselves ','2009-10-05 10:10:57'),(872,'above ','2009-10-05 10:10:57'),(873,'after ','2009-10-05 10:10:57'),(874,'all ','2009-10-05 10:10:57'),(875,'along ','2009-10-05 10:10:57'),(876,'am ','2009-10-05 10:10:57'),(877,'another ','2009-10-05 10:10:57'),(878,'anything ','2009-10-05 10:10:57'),(879,'appear ','2009-10-05 10:10:57'),(880,'around ','2009-10-05 10:10:57'),(881,'associated ','2009-10-05 10:10:57'),(882,'be ','2009-10-05 10:10:57'),(883,'becoming ','2009-10-05 10:10:57'),(884,'being ','2009-10-05 10:10:57'),(885,'best ','2009-10-05 10:10:57'),(886,'brief ','2009-10-05 10:10:57'),(887,'came ','2009-10-05 10:10:57'),(888,'cause ','2009-10-05 10:10:57'),(889,'clearly ','2009-10-05 10:10:57'),(890,'concerning ','2009-10-05 10:10:57'),(891,'containing ','2009-10-05 10:10:57'),(892,'course ','2009-10-05 10:10:57'),(893,'did ','2009-10-05 10:10:57'),(894,'doesn\'t ','2009-10-05 10:10:57'),(895,'downwards ','2009-10-05 10:10:57'),(896,'eight ','2009-10-05 10:10:57'),(897,'entirely ','2009-10-05 10:10:57'),(898,'ever ','2009-10-05 10:10:57'),(899,'everywhere ','2009-10-05 10:10:57'),(900,'far ','2009-10-05 10:10:57'),(901,'followed ','2009-10-05 10:10:57'),(902,'formerly ','2009-10-05 10:10:57'),(903,'furthermore ','2009-10-05 10:10:57'),(904,'gives ','2009-10-05 10:10:57'),(905,'got ','2009-10-05 10:10:57'),(906,'happens ','2009-10-05 10:10:57'),(907,'haven\'t ','2009-10-05 10:10:57'),(908,'help ','2009-10-05 10:10:57'),(909,'hereafter ','2009-10-05 10:10:57'),(910,'herself ','2009-10-05 10:10:57'),(911,'hither ','2009-10-05 10:10:57'),(912,'i\'d ','2009-10-05 10:10:57'),(913,'if ','2009-10-05 10:10:57'),(914,'inc ','2009-10-05 10:10:57'),(915,'inner ','2009-10-05 10:10:57'),(916,'is ','2009-10-05 10:10:57'),(917,'it\'s ','2009-10-05 10:10:57'),(918,'keeps ','2009-10-05 10:10:57'),(919,'last ','2009-10-05 10:10:57'),(920,'least ','2009-10-05 10:10:57'),(921,'like ','2009-10-05 10:10:57'),(922,'looking ','2009-10-05 10:10:57'),(923,'may ','2009-10-05 10:10:57'),(924,'merely ','2009-10-05 10:10:57'),(925,'mostly ','2009-10-05 10:10:57'),(926,'name ','2009-10-05 10:10:57'),(927,'necessary ','2009-10-05 10:10:57'),(928,'nevertheless ','2009-10-05 10:10:57'),(929,'nobody ','2009-10-05 10:10:57'),(930,'normally ','2009-10-05 10:10:57'),(931,'nowhere ','2009-10-05 10:10:57'),(932,'oh ','2009-10-05 10:10:57'),(933,'once ','2009-10-05 10:10:57'),(934,'or ','2009-10-05 10:10:57'),(935,'our ','2009-10-05 10:10:57'),(936,'over ','2009-10-05 10:10:57'),(937,'per ','2009-10-05 10:10:57'),(938,'possible ','2009-10-05 10:10:57'),(939,'quite ','2009-10-05 10:10:57'),(940,'really ','2009-10-05 10:10:57'),(941,'relatively ','2009-10-05 10:10:57'),(942,'saw ','2009-10-05 10:10:57'),(943,'secondly ','2009-10-05 10:10:57'),(944,'seeming ','2009-10-05 10:10:57'),(945,'sensible ','2009-10-05 10:10:57'),(946,'several ','2009-10-05 10:10:57'),(947,'since ','2009-10-05 10:10:57'),(948,'somehow ','2009-10-05 10:10:57'),(949,'somewhat ','2009-10-05 10:10:57'),(950,'specify ','2009-10-05 10:10:57'),(951,'sup ','2009-10-05 10:10:57'),(952,'tell ','2009-10-05 10:10:57'),(953,'thanks ','2009-10-05 10:10:57'),(954,'the ','2009-10-05 10:10:57'),(955,'then ','2009-10-05 10:10:57'),(956,'thereby ','2009-10-05 10:10:57'),(957,'these ','2009-10-05 10:10:57'),(958,'they\'ve ','2009-10-05 10:10:57'),(959,'thoroughly ','2009-10-05 10:10:57'),(960,'throughout ','2009-10-05 10:10:57'),(961,'too ','2009-10-05 10:10:57'),(962,'tries ','2009-10-05 10:10:57'),(963,'two ','2009-10-05 10:10:57'),(964,'unlikely ','2009-10-05 10:10:57'),(965,'us ','2009-10-05 10:10:57'),(966,'using ','2009-10-05 10:10:57'),(967,'via ','2009-10-05 10:10:57'),(968,'was ','2009-10-05 10:10:57'),(969,'we\'ll ','2009-10-05 10:10:57'),(970,'went ','2009-10-05 10:10:57'),(971,'whatever ','2009-10-05 10:10:57'),(972,'where\'s ','2009-10-05 10:10:57'),(973,'whereupon ','2009-10-05 10:10:57'),(974,'whither ','2009-10-05 10:10:57'),(975,'whom ','2009-10-05 10:10:57'),(976,'wish ','2009-10-05 10:10:57'),(977,'wonder ','2009-10-05 10:10:57'),(978,'yet ','2009-10-05 10:10:57'),(979,'you\'ve ','2009-10-05 10:10:57'),(980,'zero ','2009-10-05 10:10:57'),(981,'according','2009-10-05 10:10:57'),(982,'afterwards','2009-10-05 10:10:57'),(983,'allow','2009-10-05 10:10:57'),(984,'already','2009-10-05 10:10:57'),(985,'among','2009-10-05 10:10:57'),(986,'any','2009-10-05 10:10:57'),(987,'anyway','2009-10-05 10:10:57'),(988,'appreciate','2009-10-05 10:10:57'),(989,'as','2009-10-05 10:10:57'),(990,'at','2009-10-05 10:10:57'),(991,'became','2009-10-05 10:10:57'),(992,'been','2009-10-05 10:10:57'),(993,'believe','2009-10-05 10:10:57'),(994,'better','2009-10-05 10:10:57'),(995,'but','2009-10-05 10:10:57'),(996,'can','2009-10-05 10:10:57'),(997,'causes','2009-10-05 10:10:57'),(998,'co','2009-10-05 10:10:57'),(999,'consequently','2009-10-05 10:10:57'),(1000,'contains','2009-10-05 10:10:57'),(1001,'currently','2009-10-05 10:10:57'),(1002,'didn\'t','2009-10-05 10:10:57'),(1003,'doing','2009-10-05 10:10:57'),(1004,'during','2009-10-05 10:10:57'),(1005,'either','2009-10-05 10:10:57'),(1006,'especially','2009-10-05 10:10:57'),(1007,'every','2009-10-05 10:10:57'),(1008,'ex','2009-10-05 10:10:57'),(1009,'few','2009-10-05 10:10:57'),(1010,'following','2009-10-05 10:10:57'),(1011,'forth','2009-10-05 10:10:57'),(1012,'get','2009-10-05 10:10:57'),(1013,'go','2009-10-05 10:10:57'),(1014,'gotten','2009-10-05 10:10:57'),(1015,'hardly','2009-10-05 10:10:57'),(1016,'having','2009-10-05 10:10:57'),(1017,'hence','2009-10-05 10:10:57'),(1018,'hereby','2009-10-05 10:10:57'),(1019,'hi','2009-10-05 10:10:57'),(1020,'hopefully','2009-10-05 10:10:57'),(1021,'i\'ll','2009-10-05 10:10:57'),(1022,'ignored','2009-10-05 10:10:57'),(1023,'indeed','2009-10-05 10:10:57'),(1024,'insofar','2009-10-05 10:10:57'),(1025,'isn\'t','2009-10-05 10:10:57'),(1026,'its','2009-10-05 10:10:57'),(1027,'kept','2009-10-05 10:10:57'),(1028,'lately','2009-10-05 10:10:57'),(1029,'less','2009-10-05 10:10:57'),(1030,'liked','2009-10-05 10:10:57'),(1031,'looks','2009-10-05 10:10:57'),(1032,'maybe','2009-10-05 10:10:57'),(1033,'might','2009-10-05 10:10:57'),(1034,'much','2009-10-05 10:10:57'),(1035,'namely','2009-10-05 10:10:57'),(1036,'need','2009-10-05 10:10:57'),(1037,'new','2009-10-05 10:10:57'),(1038,'non','2009-10-05 10:10:57'),(1039,'not','2009-10-05 10:10:57'),(1040,'obviously','2009-10-05 10:10:57'),(1041,'ok','2009-10-05 10:10:57'),(1042,'one','2009-10-05 10:10:57'),(1043,'other','2009-10-05 10:10:57'),(1044,'ours','2009-10-05 10:10:57'),(1045,'overall','2009-10-05 10:10:57'),(1046,'perhaps','2009-10-05 10:10:57'),(1047,'presumably','2009-10-05 10:10:57'),(1048,'qv','2009-10-05 10:10:57'),(1049,'reasonably','2009-10-05 10:10:57'),(1050,'respectively','2009-10-05 10:10:57'),(1051,'say','2009-10-05 10:10:57'),(1052,'see','2009-10-05 10:10:57'),(1053,'seems','2009-10-05 10:10:57'),(1054,'sent','2009-10-05 10:10:57'),(1055,'shall','2009-10-05 10:10:57'),(1056,'six','2009-10-05 10:10:57'),(1057,'someone','2009-10-05 10:10:57'),(1058,'somewhere','2009-10-05 10:10:57'),(1059,'specifying','2009-10-05 10:10:57'),(1060,'sure','2009-10-05 10:10:57'),(1061,'tends','2009-10-05 10:10:57'),(1062,'thanx','2009-10-05 10:10:57'),(1063,'their','2009-10-05 10:10:57'),(1064,'thence','2009-10-05 10:10:57'),(1065,'therefore','2009-10-05 10:10:57'),(1066,'they','2009-10-05 10:10:57'),(1067,'think','2009-10-05 10:10:57'),(1068,'those','2009-10-05 10:10:57'),(1069,'thru','2009-10-05 10:10:57'),(1070,'took','2009-10-05 10:10:57'),(1071,'truly','2009-10-05 10:10:57'),(1072,'un','2009-10-05 10:10:57'),(1073,'until','2009-10-05 10:10:57'),(1074,'use','2009-10-05 10:10:57'),(1075,'usually','2009-10-05 10:10:57'),(1076,'viz','2009-10-05 10:10:57'),(1077,'wasn\'t','2009-10-05 10:10:57'),(1078,'we\'re','2009-10-05 10:10:57'),(1079,'were','2009-10-05 10:10:57'),(1080,'when','2009-10-05 10:10:57'),(1081,'whereafter','2009-10-05 10:10:57'),(1082,'wherever','2009-10-05 10:10:57'),(1083,'who','2009-10-05 10:10:57'),(1084,'whose','2009-10-05 10:10:57'),(1085,'with','2009-10-05 10:10:57'),(1086,'you','2009-10-05 10:10:57'),(1087,'your','2009-10-05 10:10:57'),(1088,'rt','2009-10-05 12:01:03'),(1089,'a','2009-10-11 21:26:42'),(1090,'I','2009-10-11 21:26:45');

UNLOCK TABLES;

/*Data for the table `settings` */

LOCK TABLES `settings` WRITE;

insert  into `settings`(`attribute_id`,`attribute_value`) values ('RESULTSPERPAGE','100'),('MAX_PAGES','2'),('HOURLYRATELIMIT','150'),('BITLY_LOGIN','Replace this with your bit.ly logon. If you don''t have one, you can get it from here: http://bit.ly/a/sign_up'),('BITLY_DEVKEY','Replace this with your bit.ly developer key.  If you don''t have one, you can get it from here: http://bit.ly/a/your_api_key/');

UNLOCK TABLES;

/*Data for the table `source_keywords` */

LOCK TABLES `source_keywords` WRITE;

insert  into `source_keywords`(`ID`,`source_topic_id`,`keywords`,`is_phrase`,`language_code`,`latitude`,`longitude`,`radius`,`radius_unit_id`,`last_tweet_id`,`priority`,`suspended`,`rec_create_date`) values (186,10,'bigtable','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:00:12'),(187,10,'mongodb','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:00:54'),(188,10,'ravendb','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:01:06'),(189,10,'couchdb','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:01:21'),(190,10,'cassandra db','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:01:47'),(191,10,'hypertable','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:01:58'),(192,10,'triplestore','N',NULL,NULL,NULL,NULL,NULL,NULL,999999,'N','2011-05-10 22:02:23');

UNLOCK TABLES;

/*Data for the table `source_topics` */

LOCK TABLES `source_topics` WRITE;

insert  into `source_topics`(`ID`,`topic_description`,`rec_create_date`) values (10,'NO SQL','2011-05-10 21:59:51');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

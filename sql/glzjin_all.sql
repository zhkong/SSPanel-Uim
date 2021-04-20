SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE TABLE IF NOT EXISTS `alive_ip` (
  `id`       bigint(20)   NOT NULL,
  `nodeid`   int(11)      NOT NULL,
  `userid`   int(11)      NOT NULL,
  `ip`       varchar(182) NOT NULL,
  `datetime` bigint(20)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `announcement` (
  `id`      int(11)  NOT NULL,
  `date`    datetime NOT NULL,
  `content` text     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `blockip` (
  `id`       bigint(20)   NOT NULL,
  `nodeid`   int(11)      NOT NULL,
  `ip`       varchar(182) NOT NULL,
  `datetime` bigint(20)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `code` (
  `id`          bigint(20) NOT NULL,
  `code`        text       NOT NULL,
  `type`        int(11)    NOT NULL,
  `number`      int(11)    NOT NULL,
  `isused`      int(11)    NOT NULL DEFAULT '0',
  `userid`      bigint(20) NOT NULL,
  `usedatetime` datetime   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `link` (
  `id`     bigint(20) NOT NULL,
  `token`  text       NOT NULL,
  `userid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `login_ip` (
  `id`       bigint(20)   NOT NULL,
  `userid`   bigint(20)   NOT NULL,
  `ip`       varchar(182) NOT NULL,
  `datetime` bigint(20)   NOT NULL,
  `type`     int(11)      NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `speedtest` (
  `id`               bigint(20) NOT NULL,
  `nodeid`           int(11)    NOT NULL,
  `datetime`         bigint(20) NOT NULL,
  `telecomping`      text       NOT NULL,
  `telecomeupload`   text       NOT NULL,
  `telecomedownload` text       NOT NULL,
  `unicomping`       text       NOT NULL,
  `unicomupload`     text       NOT NULL,
  `unicomdownload`   text       NOT NULL,
  `cmccping`         text       NOT NULL,
  `cmccupload`       text       NOT NULL,
  `cmccdownload`     text       NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ss_invite_code` (
  `id`         int(11)      NOT NULL,
  `code`       varchar(128) NOT NULL,
  `user_id`    int(11)      NOT NULL,
  `created_at` timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp    NOT NULL DEFAULT '2016-06-01 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ss_node` (
  `id`                      int(11)      NOT NULL,
  `name`                    varchar(128) NOT NULL,
  `type`                    int(3)       NOT NULL,
  `server`                  varchar(128) NOT NULL,
  `method`                  varchar(64)  NOT NULL,
  `info`                    varchar(128) NOT NULL,
  `status`                  varchar(128) NOT NULL,
  `sort`                    int(3)       NOT NULL,
  `custom_method`           tinyint(1)   NOT NULL DEFAULT '0',
  `traffic_rate`            float        NOT NULL DEFAULT '1',
  `node_class`              int(11)      NOT NULL DEFAULT '0',
  `node_speedlimit`         int(11)      NOT NULL DEFAULT '0',
  `node_connector`          int(11)      NOT NULL DEFAULT '0',
  `node_bandwidth`          bigint(20)   NOT NULL DEFAULT '0',
  `node_bandwidth_limit`    bigint(20)   NOT NULL DEFAULT '0',
  `bandwidthlimit_resetday` int(11)      NOT NULL DEFAULT '0',
  `node_heartbeat`          bigint(20)   NOT NULL DEFAULT '0',
  `node_ip`                 varchar(182)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ss_node_info` (
  `id`       int(11)     NOT NULL,
  `node_id`  int(11)     NOT NULL,
  `uptime`   float       NOT NULL,
  `load`     varchar(32) NOT NULL,
  `log_time` int(11)     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ss_node_online_log` (
  `id`          int(11) NOT NULL,
  `node_id`     int(11) NOT NULL,
  `online_user` int(11) NOT NULL,
  `log_time`    int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `ss_password_reset` (
  `id`          int(11)      NOT NULL,
  `email`       varchar(32)  NOT NULL,
  `token`       varchar(128) NOT NULL,
  `init_time`   int(11)      NOT NULL,
  `expire_time` int(11)      NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `unblockip` (
  `id`       bigint(20)   NOT NULL,
  `ip`       varchar(182) NOT NULL,
  `datetime` bigint(20)   NOT NULL,
  `userid`   bigint(20)   NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `user` (
  `id`                  int(11)       NOT NULL,
  `user_name`           varchar(128)  NOT NULL,
  `email`               varchar(32)   NOT NULL,
  `pass`                varchar(256)  NOT NULL,
  `passwd`              varchar(256)   NOT NULL,
  `uuid`                varchar(146)  NOT NULL COMMENT 'UUID',
  `t`                   int(11)       NOT NULL DEFAULT '0',
  `u`                   bigint(20)    NOT NULL,
  `d`                   bigint(20)    NOT NULL,
  `plan`                varchar(2)    NOT NULL DEFAULT 'A',
  `transfer_enable`     bigint(20)    NOT NULL,
  `port`                int(11)       NOT NULL,
  `switch`              tinyint(4)    NOT NULL DEFAULT '1',
  `enable`              tinyint(4)    NOT NULL DEFAULT '1',
  `type`                tinyint(4)    NOT NULL DEFAULT '1',
  `last_get_gift_time`  int(11)       NOT NULL DEFAULT '0',
  `last_check_in_time`  int(11)       NOT NULL DEFAULT '0',
  `last_rest_pass_time` int(11)       NOT NULL DEFAULT '0',
  `reg_date`            datetime      NOT NULL,
  `invite_num`          int(8)        NOT NULL,
  `money`               decimal(12,2) NOT NULL,
  `ref_by`              int(11)       NOT NULL DEFAULT '0',
  `expire_time`         int(11)       NOT NULL DEFAULT '0',
  `method`              varchar(64)   NOT NULL DEFAULT 'rc4-md5',
  `is_email_verify`     tinyint(4)    NOT NULL DEFAULT '0',
  `reg_ip`              varchar(182)  NOT NULL DEFAULT '127.0.0.1',
  `node_speedlimit`     text          NOT NULL,
  `node_connector`      int(11)       NOT NULL DEFAULT '0',
  `is_admin`            int(2)        NOT NULL DEFAULT '0',
  `im_type`             int(11)                DEFAULT '1',
  `im_value`            text,
  `last_day_t`          bigint(20)    NOT NULL DEFAULT '0',
  `sendDailyMail`       int(11)       NOT NULL DEFAULT '0',
  `class`               int(11)       NOT NULL DEFAULT '0',
  `class_expire`        datetime      NOT NULL DEFAULT '1989-06-04 00:05:00',
  `expire_in`           datetime      NOT NULL DEFAULT '2099-06-04 00:05:00',
  `theme`               text          NOT NULL,
  `ga_token`            text          NOT NULL,
  `ga_enable`           int(11)       NOT NULL DEFAULT '0',
  `pac`                 longtext,
  `remark`              text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `user_token` (
  `id`          int(11)      NOT NULL,
  `token`       varchar(256) NOT NULL,
  `user_id`     int(11)      NOT NULL,
  `create_time` int(11)      NOT NULL,
  `expire_time` int(11)      NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `user_traffic_log` (
  `id`       int(11)     NOT NULL,
  `user_id`  int(11)     NOT NULL,
  `u`        int(11)     NOT NULL,
  `d`        int(11)     NOT NULL,
  `node_id`  int(11)     NOT NULL,
  `rate`     float       NOT NULL,
  `traffic`  varchar(32) NOT NULL,
  `log_time` int(11)     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `alive_ip`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `blockip`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `code`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `link`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `login_ip`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `speedtest`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ss_invite_code`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);
ALTER TABLE `ss_node`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ss_node_info`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ss_node_online_log`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `ss_password_reset`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `unblockip`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `uid` (`id`),
  ADD KEY `email` (`email`);
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `user_traffic_log`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `alive_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `blockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `code`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `link`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `login_ip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `speedtest`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ss_invite_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ss_node`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ss_node_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ss_node_online_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `ss_password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `unblockip`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
ALTER TABLE `user_traffic_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

CREATE TABLE IF NOT EXISTS `ss_node` (
  `id`                      int(11)      NOT NULL,
  `name`                    varchar(128) NOT NULL,
  `type`                    int(3)       NOT NULL,
  `server`                  varchar(128) NOT NULL,
  `method`                  varchar(64)  NOT NULL,
  `info`                    varchar(128) NOT NULL,
  `status`                  varchar(128) NOT NULL,
  `sort`                    int(3)       NOT NULL,
  `custom_method`           tinyint(1)   NOT NULL DEFAULT '0',
  `traffic_rate`            float        NOT NULL DEFAULT '1',
  `node_class`              int(11)      NOT NULL DEFAULT '0',
  `node_speedlimit`         int(11)      NOT NULL DEFAULT '0',
  `node_connector`          int(11)      NOT NULL DEFAULT '0',
  `node_bandwidth`          bigint(20)   NOT NULL DEFAULT '0',
  `node_bandwidth_limit`    bigint(20)   NOT NULL DEFAULT '0',
  `bandwidthlimit_resetday` int(11)      NOT NULL DEFAULT '0',
  `node_heartbeat`          bigint(20)   NOT NULL DEFAULT '0',
  `node_ip`                 varchar(182)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user`
  ADD `node_group` INT NOT NULL DEFAULT '0' AFTER `remark`;
ALTER TABLE `ss_node`
  ADD `node_group` INT NOT NULL DEFAULT '0' AFTER `node_ip`;

CREATE TABLE IF NOT EXISTS `payback` (
  `id`       BIGINT        NOT NULL AUTO_INCREMENT,
  `total`    DECIMAL(12,2) NOT NULL,
  `userid`   BIGINT        NOT NULL,
  `ref_by`   BIGINT        NOT NULL,
  `ref_get`  DECIMAL(12,2) NOT NULL,
  `datetime` BIGINT        NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `shop` (
  `id`         BIGINT        NOT NULL AUTO_INCREMENT,
  `name`       TEXT          NOT NULL,
  `price`      DECIMAL(12,2) NOT NULL,
  `content`    TEXT          NOT NULL,
  `auto_renew` INT           NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `coupon` (
  `id`      BIGINT NOT NULL AUTO_INCREMENT,
  `code`    TEXT   NOT NULL,
  `onetime` INT    NOT NULL,
  `expire`  BIGINT NOT NULL,
  `shop`    TEXT   NOT NULL,
  `credit`  INT    NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `bought` (
  `id`       BIGINT NOT NULL AUTO_INCREMENT,
  `userid`   BIGINT NOT NULL,
  `shopid`   BIGINT NOT NULL,
  `datetime` BIGINT NOT NULL,
  `renew`    INT    NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `bought`
  ADD `coupon` TEXT NOT NULL AFTER `renew`, ADD `price` DECIMAL(12,2) NOT NULL AFTER `coupon`;
ALTER TABLE `bought`
  ADD `is_notified` BOOLEAN NOT NULL DEFAULT FALSE AFTER `price`;
ALTER TABLE `bought`
  CHANGE `renew` `renew` BIGINT(11) NOT NULL;
ALTER TABLE `announcement`
  ADD `markdown` LONGTEXT NOT NULL AFTER `content`;
ALTER TABLE `announcement`
  CHANGE `content` `content` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL;

CREATE TABLE IF NOT EXISTS `ticket` (
  `id`       BIGINT   NOT NULL AUTO_INCREMENT,
  `title`    LONGTEXT NOT NULL,
  `content`  LONGTEXT NOT NULL,
  `rootid`   BIGINT   NOT NULL,`userid` BIGINT NOT NULL,
  `datetime` BIGINT   NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `ticket`
  ADD `status` INT NOT NULL DEFAULT '1' AFTER `datetime`;
ALTER TABLE `shop`
  ADD `status` INT NOT NULL DEFAULT '1' AFTER `auto_renew`;
ALTER TABLE `user`
  ADD `auto_reset_day` INT NOT NULL DEFAULT '0' AFTER `node_group`, ADD `auto_reset_bandwidth` DECIMAL(12,2) NOT NULL DEFAULT '0.00' AFTER `auto_reset_day`;
ALTER TABLE `shop`
  ADD `auto_reset_bandwidth` INT NOT NULL DEFAULT '0' AFTER `auto_renew`;
ALTER TABLE `code`
  CHANGE `number` `number` DECIMAL(11,2) NOT NULL;

CREATE TABLE IF NOT EXISTS `auto` (
  `id`       BIGINT   NOT NULL AUTO_INCREMENT,
  `type`     INT      NOT NULL,
  `value`    LONGTEXT NOT NULL,
  `datetime` BIGINT   NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `auto`
  ADD `sign` LONGTEXT NOT NULL AFTER `value`;
ALTER TABLE `ss_node`
  ADD `custom_rss` INT NOT NULL DEFAULT '0' AFTER `node_group`;
ALTER TABLE `user`
  ADD `protocol` VARCHAR(128) NOT NULL DEFAULT 'origin' AFTER `node_group`, ADD `protocol_param` VARCHAR(128) NULL DEFAULT NULL AFTER `protocol`, ADD `obfs` VARCHAR(128) NOT NULL DEFAULT 'plain' AFTER `protocol_param`, ADD `obfs_param` VARCHAR(128) NULL DEFAULT NULL AFTER `obfs`;
ALTER TABLE `user`
  ADD `forbidden_ip` varchar(182) NULL DEFAULT '' AFTER `obfs_param`, ADD `forbidden_port` LONGTEXT NULL DEFAULT '' AFTER `forbidden_ip`;

ALTER TABLE `user`
  CHANGE `node_speedlimit` `node_speedlimit` DECIMAL(12,2) NOT NULL DEFAULT '0.00';
ALTER TABLE `ss_node`
  CHANGE `node_speedlimit` `node_speedlimit` DECIMAL(12,2) NOT NULL DEFAULT '0.00';
ALTER TABLE `user`
  CHANGE `protocol` `protocol` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'origin', CHANGE `obfs` `obfs` VARCHAR(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'plain';

CREATE TABLE IF NOT EXISTS `email_verify` (
  `id`        BIGINT       NOT NULL AUTO_INCREMENT,
  `email`     TEXT         NOT NULL,
  `ip`        varchar(182) NOT NULL,
  `code`      TEXT         NOT NULL,
  `expire_in` BIGINT       NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user`
  ADD `is_hide` INT NOT NULL DEFAULT '0' AFTER `obfs_param`;

CREATE TABLE IF NOT EXISTS `detect_list` (
  `id`    BIGINT   NOT NULL AUTO_INCREMENT,
  `name`  LONGTEXT NOT NULL,
  `text`  LONGTEXT NOT NULL,
  `regex` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `detect_log` (
  `id`       BIGINT NOT NULL AUTO_INCREMENT,
  `user_id`  BIGINT NOT NULL,
  `list_id`  BIGINT NOT NULL,
  `datetime` BIGINT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `detect_list`
  ADD `type` INT NOT NULL AFTER `regex`;
ALTER TABLE `detect_log`
  ADD `node_id` INT NOT NULL AFTER `datetime`;
ALTER TABLE `user`
  ADD `is_multi_user` INT NOT NULL DEFAULT '0' AFTER `is_hide`;
ALTER TABLE `ss_node`
  ADD `mu_only` INT NULL DEFAULT '0' AFTER `custom_rss`;
ALTER TABLE `ss_node`
  ADD `online` BOOLEAN NOT NULL DEFAULT TRUE AFTER `mu_only`, ADD `gfw_block` BOOLEAN NOT NULL DEFAULT FALSE AFTER `online`;

CREATE TABLE IF NOT EXISTS `telegram_session` (
  `id`              BIGINT NOT NULL AUTO_INCREMENT,
  `user_id`         BIGINT NOT NULL,
  `type`            INT    NOT NULL,
  `session_content` TEXT   NOT NULL,
  `datetime`        BIGINT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `user`
  ADD `telegram_id` BIGINT NULL AFTER `is_multi_user`;
ALTER TABLE `user`
  ADD `expire_notified` BOOLEAN NOT NULL DEFAULT FALSE AFTER `telegram_id`, ADD `traffic_notified` BOOLEAN NULL DEFAULT FALSE AFTER `expire_notified`;

CREATE TABLE IF NOT EXISTS `paylist` (
  `id`       bigint(20)    NOT NULL,
  `userid`   bigint(20)    NOT NULL,
  `total`    decimal(12,2) NOT NULL,
  `status`   int(11)       NOT NULL DEFAULT '0',
  `tradeno`  text,
  `datetime` bigint(20)    NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `paylist`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `paylist`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;ALTER TABLE `user_traffic_log` CHANGE `u` `u` BIGINT(20) NOT NULL, CHANGE `d` `d` BIGINT(20) NOT NULL;

--
-- 用户订阅日志
--
CREATE TABLE IF NOT EXISTS `user_subscribe_log` (
  `id`                 int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name`          varchar(128)     NOT NULL COMMENT '用户名',
  `user_id`            int(11)          NOT NULL COMMENT '用户 ID',
  `email`              varchar(32)      NOT NULL COMMENT '用户邮箱',
  `subscribe_type`     varchar(20)      NOT NULL COMMENT '获取的订阅类型',
  `request_ip`         varchar(182)     NOT NULL COMMENT '请求 IP',
  `request_time`       datetime         NOT NULL COMMENT '请求时间',
  `request_user_agent` text                      COMMENT '请求 UA 信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户订阅日志';

--
-- 审计封禁日志
--
CREATE TABLE IF NOT EXISTS `detect_ban_log` (
  `id`                int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name`         varchar(128)     NOT NULL COMMENT '用户名',
  `user_id`           int(11)          NOT NULL COMMENT '用户 ID',
  `email`             varchar(32)      NOT NULL COMMENT '用户邮箱',
  `detect_number`     int(11)          NOT NULL COMMENT '本次违规次数',
  `ban_time`          int(11)          NOT NULL COMMENT '本次封禁时长',
  `start_time`        bigint(20)       NOT NULL COMMENT '统计开始时间',
  `end_time`          bigint(20)       NOT NULL COMMENT '统计结束时间',
  `all_detect_number` int(11)          NOT NULL COMMENT '累计违规次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='审计封禁日志';

ALTER TABLE `user` ADD `last_detect_ban_time` datetime DEFAULT '1989-06-04 00:05:00' AFTER `enable`;
ALTER TABLE `user` ADD `all_detect_number` int(11) NOT NULL DEFAULT '0' AFTER `last_detect_ban_time`;

--
-- 网站配置
--
CREATE TABLE IF NOT EXISTS `gconfig` (
  `id`             int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key`            varchar(128)     NOT NULL COMMENT '配置键名',
  `type`           varchar(32)      NOT NULL COMMENT '值类型',
  `value`          text             NOT NULL COMMENT '配置值',
  `oldvalue`       text             NOT NULL COMMENT '之前的配置值',
  `name`           varchar(128)     NOT NULL COMMENT '配置名称',
  `comment`        text             NOT NULL COMMENT '配置描述',
  `operator_id`    int(11)          NOT NULL COMMENT '操作员 ID',
  `operator_name`  varchar(128)     NOT NULL COMMENT '操作员名称',
  `operator_email` varchar(32)      NOT NULL COMMENT '操作员邮箱',
  `last_update`    bigint(20)       NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='网站配置';

ALTER TABLE `detect_log`
  ADD `status` int(2) NOT NULL DEFAULT '0' AFTER `node_id`;

--
-- Email Queue 發件列表
--
CREATE TABLE IF NOT EXISTS `email_queue` (
  `id`       bigint(20)  NOT NULL,
  `to_email` varchar(32) NOT NULL,
  `subject`  longtext    NOT NULL,
  `template` longtext    NOT NULL,
  `array`    longtext    NOT NULL,
  `time`     int(64)     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Email Queue 發件列表';

ALTER TABLE `email_queue`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `email_queue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

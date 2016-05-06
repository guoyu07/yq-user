/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : yq_user

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-05-06 17:54:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addsheng
-- ----------------------------
DROP TABLE IF EXISTS `addsheng`;
CREATE TABLE `addsheng` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `cg` int(11) DEFAULT NULL,
  `sd` int(11) DEFAULT NULL,
  `zs` int(11) DEFAULT NULL,
  `sh` int(11) DEFAULT NULL,
  `nf` int(11) DEFAULT NULL,
  `zz` int(11) DEFAULT NULL,
  `fz` int(11) DEFAULT NULL,
  `gd` int(11) DEFAULT NULL,
  `gx` int(11) DEFAULT NULL,
  `nn` int(11) DEFAULT NULL,
  `hbs` int(11) DEFAULT NULL,
  `hns` int(11) DEFAULT NULL,
  `hn` int(11) DEFAULT NULL,
  `zx` int(11) DEFAULT NULL,
  `bj` int(11) DEFAULT NULL,
  `tj` int(11) DEFAULT NULL,
  `hb` int(11) DEFAULT NULL,
  `sx` int(11) DEFAULT NULL,
  `nmg` int(11) DEFAULT NULL,
  `ns` int(11) DEFAULT NULL,
  `sj` int(11) DEFAULT NULL,
  `qh` int(11) DEFAULT NULL,
  `sxs` int(11) DEFAULT NULL,
  `js` int(11) DEFAULT NULL,
  `xc` int(11) DEFAULT NULL,
  `un` int(11) DEFAULT NULL,
  `gz` int(11) DEFAULT NULL,
  `xz` int(11) DEFAULT NULL,
  `cq` int(11) DEFAULT NULL,
  `ln` int(11) DEFAULT NULL,
  `jl` int(11) DEFAULT NULL,
  `hlj` int(11) DEFAULT NULL,
  `tw` int(11) DEFAULT NULL,
  `sg` int(11) DEFAULT NULL,
  `om` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for baby_info
-- ----------------------------
DROP TABLE IF EXISTS `baby_info`;
CREATE TABLE `baby_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `baby_name` varchar(30) DEFAULT NULL,
  `baby_age` int(11) DEFAULT NULL,
  `baby_sex` varchar(30) DEFAULT NULL,
  `dady_name` varchar(30) DEFAULT NULL,
  `dady_age` int(11) DEFAULT NULL,
  `dady_call` varchar(30) DEFAULT NULL,
  `mom_name` varchar(30) DEFAULT NULL,
  `mom_age` int(11) DEFAULT NULL,
  `mom_call` varchar(30) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `details` varchar(1024) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `edit_name` varchar(255) DEFAULT NULL,
  `edit_time` datetime DEFAULT NULL,
  `delete_name` varchar(255) DEFAULT NULL,
  `recover_name` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bdbdate
-- ----------------------------
DROP TABLE IF EXISTS `bdbdate`;
CREATE TABLE `bdbdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zuser` varchar(50) DEFAULT NULL,
  `sy` int(11) NOT NULL,
  `jc` int(11) NOT NULL,
  `sybdb` int(11) NOT NULL,
  `ljbdb` int(11) NOT NULL,
  `zaq` int(11) NOT NULL,
  `zbq` int(11) NOT NULL,
  `aq` int(11) NOT NULL,
  `bq` int(11) NOT NULL,
  `bfdate` datetime DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zuser` (`zuser`),
  KEY `bfdate` (`bfdate`)
) ENGINE=InnoDB AUTO_INCREMENT=728209 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cbzyc
-- ----------------------------
DROP TABLE IF EXISTS `cbzyc`;
CREATE TABLE `cbzyc` (
  `id` int(11) NOT NULL,
  `bid` int(11) DEFAULT NULL,
  `buser` varchar(50) DEFAULT NULL,
  `bdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cpuser
-- ----------------------------
DROP TABLE IF EXISTS `cpuser`;
CREATE TABLE `cpuser` (
  `cgid` int(11) NOT NULL,
  `cguser` varchar(50) DEFAULT NULL,
  `cpmq` varchar(50) DEFAULT NULL,
  `jydate` datetime DEFAULT NULL,
  `jyjf` int(11) DEFAULT NULL,
  `jyname` varchar(50) DEFAULT NULL,
  `jyqq` varchar(50) DEFAULT NULL,
  `jycall` varchar(50) DEFAULT NULL,
  `add` varchar(50) DEFAULT NULL,
  `fwdate` datetime DEFAULT NULL,
  PRIMARY KEY (`cgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for cw_user
-- ----------------------------
DROP TABLE IF EXISTS `cw_user`;
CREATE TABLE `cw_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `pass_word` varchar(64) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for datecj
-- ----------------------------
DROP TABLE IF EXISTS `datecj`;
CREATE TABLE `datecj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cjuser` varchar(50) DEFAULT NULL,
  `dqcj` int(11) NOT NULL DEFAULT '0',
  `ljcj` int(11) NOT NULL DEFAULT '0',
  `cjfs` varchar(50) DEFAULT NULL,
  `ifcl` int(11) NOT NULL DEFAULT '0',
  `gc` int(11) DEFAULT NULL,
  `cjdate` datetime DEFAULT NULL,
  `qldate` datetime DEFAULT NULL,
  `cz` varchar(50) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cjuser` (`cjuser`)
) ENGINE=InnoDB AUTO_INCREMENT=21413 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dateip
-- ----------------------------
DROP TABLE IF EXISTS `dateip`;
CREATE TABLE `dateip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(50) DEFAULT NULL,
  `dldate` datetime DEFAULT NULL,
  `tcdate` datetime DEFAULT NULL,
  `dlfs` varchar(50) DEFAULT NULL,
  `dlip` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dldate` (`dldate`)
) ENGINE=InnoDB AUTO_INCREMENT=1126272 DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Table structure for datepay
-- ----------------------------
DROP TABLE IF EXISTS `datepay`;
CREATE TABLE `datepay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `syjz` int(11) DEFAULT NULL,
  `jc` int(11) DEFAULT NULL,
  `jyjz` int(11) DEFAULT NULL,
  `dbjc` int(11) DEFAULT NULL,
  `zff` int(11) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `jydb` int(11) DEFAULT NULL,
  `abdate` datetime DEFAULT NULL,
  `regid` varchar(512) DEFAULT NULL,
  `kjqi` int(11) DEFAULT NULL,
  `bz` int(11) DEFAULT NULL,
  `newbz` int(11) DEFAULT NULL,
  `txbz` int(11) DEFAULT NULL,
  `ration` double(19,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `newbz` (`newbz`),
  KEY `abdate` (`abdate`)
) ENGINE=InnoDB AUTO_INCREMENT=2750789 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dgag
-- ----------------------------
DROP TABLE IF EXISTS `dgag`;
CREATE TABLE `dgag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告表',
  `ggbt` varchar(100) DEFAULT NULL,
  `ggny` longtext,
  `ggdate` datetime DEFAULT NULL,
  `check` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Table structure for dldate
-- ----------------------------
DROP TABLE IF EXISTS `dldate`;
CREATE TABLE `dldate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `syjz` decimal(19,4) DEFAULT NULL,
  `jc` decimal(19,4) DEFAULT NULL,
  `jyjz` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `abdate` datetime DEFAULT NULL,
  `regid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3718 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ejbk
-- ----------------------------
DROP TABLE IF EXISTS `ejbk`;
CREATE TABLE `ejbk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4327 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for epkjdate
-- ----------------------------
DROP TABLE IF EXISTS `epkjdate`;
CREATE TABLE `epkjdate` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `dan` int(11) NOT NULL,
  `shuang` int(11) NOT NULL,
  `dsh` int(11) NOT NULL,
  `da` int(11) NOT NULL,
  `xiao` int(11) NOT NULL,
  `dxh` int(11) NOT NULL,
  `dskj` int(11) NOT NULL,
  `kdxj` int(11) NOT NULL,
  `bz` int(11) NOT NULL,
  `kjdate` datetime DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eptzb
-- ----------------------------
DROP TABLE IF EXISTS `eptzb`;
CREATE TABLE `eptzb` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tzuser` varchar(50) DEFAULT NULL,
  `tzlba` int(11) DEFAULT NULL,
  `tzsla` int(11) DEFAULT NULL,
  `tzdate` datetime DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `sss` (`tzuser`,`tzlba`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fcxt
-- ----------------------------
DROP TABLE IF EXISTS `fcxt`;
CREATE TABLE `fcxt` (
  `id` int(11) NOT NULL,
  `ncjud` varchar(50) DEFAULT NULL,
  `adminusername` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `dqgj` decimal(19,4) DEFAULT NULL,
  `jygj` decimal(19,4) DEFAULT NULL,
  `fsjygsl` int(11) DEFAULT NULL,
  `syjygsl` int(11) DEFAULT NULL,
  `jygsl` int(11) DEFAULT NULL,
  `jy5w` int(11) DEFAULT NULL,
  `zgj` decimal(19,4) DEFAULT NULL,
  `zdj` decimal(19,4) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `payadd` int(11) DEFAULT NULL,
  `jsdate` datetime DEFAULT NULL,
  `cz01` varchar(50) DEFAULT NULL,
  `cz02` varchar(50) DEFAULT NULL,
  `cz03` varchar(50) DEFAULT NULL,
  `cz04` varchar(50) DEFAULT NULL,
  `cz05` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fhdate
-- ----------------------------
DROP TABLE IF EXISTS `fhdate`;
CREATE TABLE `fhdate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abdate` datetime DEFAULT NULL,
  `zly` decimal(19,4) DEFAULT NULL,
  `ly5` decimal(19,4) DEFAULT NULL,
  `fhk` int(11) DEFAULT NULL,
  `vipfhpay` decimal(19,4) DEFAULT NULL,
  `fhpay` decimal(19,4) DEFAULT NULL,
  `tjjt` decimal(19,4) DEFAULT NULL,
  `tjmq` decimal(19,4) DEFAULT NULL,
  `bz` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fhname
-- ----------------------------
DROP TABLE IF EXISTS `fhname`;
CREATE TABLE `fhname` (
  `fhid` int(11) NOT NULL,
  `fhuser` varchar(50) DEFAULT NULL,
  `ljfhpay` decimal(19,4) DEFAULT NULL,
  `txfhpay` decimal(19,4) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fhid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gcfh
-- ----------------------------
DROP TABLE IF EXISTS `gcfh`;
CREATE TABLE `gcfh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) DEFAULT NULL COMMENT '用户名',
  `jtljgc` int(11) NOT NULL DEFAULT '0',
  `sygc` int(11) NOT NULL DEFAULT '0',
  `ljgc` int(11) NOT NULL DEFAULT '0',
  `fhpay` decimal(19,4) unsigned zerofill NOT NULL,
  `syfh` decimal(19,4) unsigned zerofill NOT NULL,
  `ljfhtj` decimal(19,4) unsigned zerofill NOT NULL,
  `abdate` datetime DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `lb` int(11) DEFAULT NULL,
  `sf` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=204834 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gcuser
-- ----------------------------
DROP TABLE IF EXISTS `gcuser`;
CREATE TABLE `gcuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `up` varchar(20) DEFAULT NULL,
  `jb` int(11) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `vipname` varchar(50) DEFAULT NULL,
  `vipljcjb` int(11) NOT NULL DEFAULT '0',
  `vipsycjb` int(11) NOT NULL DEFAULT '0',
  `vipcjcjb` int(11) NOT NULL DEFAULT '0',
  `vipuser` varchar(50) DEFAULT NULL,
  `vipgh` varchar(50) DEFAULT NULL,
  `vipnh` varchar(50) DEFAULT NULL,
  `vipjh` varchar(50) DEFAULT NULL,
  `vipzh` varchar(50) DEFAULT NULL,
  `vipcft` varchar(50) DEFAULT NULL,
  `vipzfb` varchar(50) DEFAULT NULL,
  `cbgc` int(11) DEFAULT NULL,
  `jbpay` int(11) DEFAULT NULL,
  `cbpay` int(11) DEFAULT NULL COMMENT '累计交易一币',
  `pay` int(11) DEFAULT NULL COMMENT '当前可用一币',
  `txpay` int(11) DEFAULT NULL COMMENT '累计使用一币',
  `vippay` int(11) DEFAULT NULL,
  `jjpay` int(11) DEFAULT NULL,
  `fhpay` int(11) DEFAULT NULL,
  `rgpay` int(11) DEFAULT NULL,
  `mcpay` int(11) DEFAULT NULL,
  `ljep` int(11) DEFAULT NULL,
  `syep` int(11) DEFAULT NULL,
  `cjtj` int(11) DEFAULT NULL,
  `ljbdb` int(11) DEFAULT NULL,
  `sybdb` int(11) DEFAULT NULL,
  `payok` int(11) DEFAULT NULL,
  `txdate` datetime DEFAULT NULL,
  `jypay` int(11) DEFAULT NULL,
  `ljsy` int(11) DEFAULT NULL,
  `jjsy` int(11) DEFAULT NULL,
  `sytx` int(11) DEFAULT NULL,
  `dlpay` int(11) DEFAULT NULL,
  `gdgc` int(11) DEFAULT NULL,
  `stopgc` int(11) DEFAULT NULL,
  `fhsy` int(11) DEFAULT NULL,
  `ljfh` int(11) DEFAULT NULL,
  `jyg` int(11) DEFAULT NULL,
  `stopjyg` int(11) DEFAULT NULL,
  `jygdate` datetime DEFAULT NULL,
  `jygt1` int(11) DEFAULT NULL,
  `jydb` int(11) NOT NULL DEFAULT '0',
  `dbdate` datetime DEFAULT NULL,
  `dbt1` int(11) DEFAULT NULL,
  `cfa` int(11) DEFAULT NULL,
  `cfb` decimal(19,4) DEFAULT NULL,
  `cfc` int(11) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `password3` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `dqu` int(11) NOT NULL DEFAULT '0',
  `add9dqu` varchar(50) DEFAULT NULL,
  `addsheng` varchar(50) DEFAULT NULL,
  `addshi` varchar(50) DEFAULT NULL,
  `addqu` varchar(50) DEFAULT NULL,
  `dqutj` int(11) DEFAULT NULL,
  `dqupay` int(11) DEFAULT NULL,
  `dqutx` int(11) DEFAULT NULL,
  `shengtj` int(11) DEFAULT NULL,
  `shengpay` int(11) DEFAULT NULL,
  `shengtx` int(11) DEFAULT NULL,
  `shitj` int(11) DEFAULT NULL,
  `shipay` int(11) DEFAULT NULL,
  `shitx` int(11) DEFAULT NULL,
  `qutj` int(11) DEFAULT NULL,
  `qupay` int(11) DEFAULT NULL,
  `qutx` int(11) DEFAULT NULL,
  `bank` varchar(40) DEFAULT NULL,
  `card` varchar(30) DEFAULT NULL,
  `call` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `userid` varchar(50) DEFAULT NULL COMMENT '身份证号码',
  `fingerid` varchar(50) DEFAULT NULL,
  `gwuid` int(11) DEFAULT NULL,
  `jcname` varchar(50) DEFAULT NULL COMMENT '继承人姓名',
  `jcuserid` varchar(50) DEFAULT NULL COMMENT '继承人用户身份证号码',
  `regtime` datetime DEFAULT NULL,
  `logtime` datetime DEFAULT NULL COMMENT '登录时间',
  `dldate` datetime DEFAULT NULL,
  `dqdate` datetime DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `ga` int(11) DEFAULT NULL,
  `ganew` int(11) DEFAULT NULL,
  `vipsq` varchar(50) DEFAULT NULL COMMENT '短信验证码',
  `pwdate` datetime DEFAULT NULL,
  `hfcjdate` datetime DEFAULT NULL,
  `hfcj` int(11) DEFAULT NULL,
  `bz1` int(11) DEFAULT NULL,
  `bz2` int(11) DEFAULT NULL,
  `cxt` int(11) DEFAULT NULL,
  `cxdate` datetime DEFAULT NULL,
  `txlb` int(11) DEFAULT NULL,
  `cbuser` int(11) DEFAULT NULL,
  `scores` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `idcard` (`userid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66139 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for gpjy
-- ----------------------------
DROP TABLE IF EXISTS `gpjy`;
CREATE TABLE `gpjy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jyid` int(11) DEFAULT NULL,
  `kjqi` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `mysl` decimal(19,4) DEFAULT NULL,
  `mcsl` decimal(19,4) DEFAULT NULL,
  `sysl` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `jypay` decimal(19,4) DEFAULT NULL,
  `abdate` datetime DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `cgdate` datetime DEFAULT NULL,
  `jy` int(11) DEFAULT NULL,
  `dfuser` varchar(50) DEFAULT NULL,
  `dqdate` datetime DEFAULT NULL,
  `newjy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `jyid` (`jyid`),
  KEY `pay` (`pay`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3818548 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gpjy_index_mc
-- ----------------------------
DROP TABLE IF EXISTS `gpjy_index_mc`;
CREATE TABLE `gpjy_index_mc` (
  `id` int(11) NOT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `mcsl` decimal(19,4) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pay` (`pay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gpjy_index_mr
-- ----------------------------
DROP TABLE IF EXISTS `gpjy_index_mr`;
CREATE TABLE `gpjy_index_mr` (
  `id` int(11) NOT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `mysl` decimal(19,4) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pay` (`pay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbk10
-- ----------------------------
DROP TABLE IF EXISTS `jbk10`;
CREATE TABLE `jbk10` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbk100
-- ----------------------------
DROP TABLE IF EXISTS `jbk100`;
CREATE TABLE `jbk100` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbk300
-- ----------------------------
DROP TABLE IF EXISTS `jbk300`;
CREATE TABLE `jbk300` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbk50
-- ----------------------------
DROP TABLE IF EXISTS `jbk50`;
CREATE TABLE `jbk50` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbk500
-- ----------------------------
DROP TABLE IF EXISTS `jbk500`;
CREATE TABLE `jbk500` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `pdpamd5` varchar(50) DEFAULT NULL,
  `fwidmd5` varchar(50) DEFAULT NULL,
  `bzok` int(11) DEFAULT NULL,
  `gpa` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `up` varchar(50) DEFAULT NULL,
  `jhdate` datetime DEFAULT NULL,
  `lqcg` int(11) DEFAULT NULL,
  `bf2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jbkzj
-- ----------------------------
DROP TABLE IF EXISTS `jbkzj`;
CREATE TABLE `jbkzj` (
  `id` int(11) NOT NULL,
  `pdid` varchar(50) DEFAULT NULL,
  `mj` int(11) DEFAULT NULL,
  `gmdate` datetime DEFAULT NULL,
  `yuser` varchar(50) DEFAULT NULL,
  `user01` varchar(50) DEFAULT NULL,
  `zjdate01` datetime DEFAULT NULL,
  `user02` varchar(50) DEFAULT NULL,
  `zjdate02` datetime DEFAULT NULL,
  `user03` varchar(50) DEFAULT NULL,
  `zjdate03` datetime DEFAULT NULL,
  `user04` varchar(50) DEFAULT NULL,
  `zjdate04` datetime DEFAULT NULL,
  `user05` varchar(50) DEFAULT NULL,
  `zjdate05` datetime DEFAULT NULL,
  `zjid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jfcp
-- ----------------------------
DROP TABLE IF EXISTS `jfcp`;
CREATE TABLE `jfcp` (
  `cpbh` int(11) NOT NULL,
  `cpmq` varchar(50) DEFAULT NULL,
  `jysl` int(11) DEFAULT NULL,
  `zepsl` int(11) DEFAULT NULL,
  `dqep` int(11) DEFAULT NULL,
  `zjfsl` int(11) DEFAULT NULL,
  `dqjf` int(11) DEFAULT NULL,
  `cglist` int(11) DEFAULT NULL,
  `cblist` int(11) DEFAULT NULL,
  `jyuser` varchar(50) DEFAULT NULL,
  `cgdate` datetime DEFAULT NULL,
  PRIMARY KEY (`cpbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jfkjdate
-- ----------------------------
DROP TABLE IF EXISTS `jfkjdate`;
CREATE TABLE `jfkjdate` (
  `kid` int(11) NOT NULL AUTO_INCREMENT,
  `dan` int(11) DEFAULT NULL,
  `shuang` int(11) DEFAULT NULL,
  `dsh` int(11) DEFAULT NULL,
  `da` int(11) DEFAULT NULL,
  `xiao` int(11) DEFAULT NULL,
  `dxh` int(11) NOT NULL DEFAULT '0',
  `dskj` int(11) NOT NULL DEFAULT '0',
  `kdxj` int(11) NOT NULL DEFAULT '0',
  `bz` int(11) DEFAULT NULL,
  `kjdate` datetime DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jftzb
-- ----------------------------
DROP TABLE IF EXISTS `jftzb`;
CREATE TABLE `jftzb` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `tzuser` varchar(50) DEFAULT NULL,
  `tzlba` int(11) DEFAULT NULL,
  `tzsla` int(11) DEFAULT NULL,
  `tzdate` datetime DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `ind` (`tzuser`,`tzlba`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lkjl
-- ----------------------------
DROP TABLE IF EXISTS `lkjl`;
CREATE TABLE `lkjl` (
  `lkid` int(11) NOT NULL AUTO_INCREMENT,
  `lkuser` varchar(50) DEFAULT NULL,
  `lksl` int(11) DEFAULT NULL,
  PRIMARY KEY (`lkid`),
  UNIQUE KEY `user` (`lkuser`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mqfh
-- ----------------------------
DROP TABLE IF EXISTS `mqfh`;
CREATE TABLE `mqfh` (
  `pdid` int(11) NOT NULL,
  `pdlbtj` int(11) DEFAULT NULL,
  `pdlb` int(11) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `dqu` int(11) DEFAULT NULL,
  `addsheng` varchar(50) DEFAULT NULL,
  `addshi` varchar(50) DEFAULT NULL,
  `addqu` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pddate` datetime DEFAULT NULL,
  `dqpay` decimal(19,4) DEFAULT NULL,
  `ljpay` decimal(19,4) DEFAULT NULL,
  `ctpay` decimal(19,4) DEFAULT NULL,
  `mqpay` decimal(19,4) DEFAULT NULL,
  `bz` int(11) DEFAULT NULL,
  PRIMARY KEY (`pdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mtfhtj
-- ----------------------------
DROP TABLE IF EXISTS `mtfhtj`;
CREATE TABLE `mtfhtj` (
  `tjid` int(11) NOT NULL AUTO_INCREMENT,
  `fhdate` date DEFAULT NULL,
  `newd` int(11) DEFAULT NULL,
  `zfh` decimal(19,4) DEFAULT NULL,
  `mqfh` decimal(19,4) DEFAULT NULL,
  `tjzj` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`tjid`)
) ENGINE=InnoDB AUTO_INCREMENT=960 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for points_change_log
-- ----------------------------
DROP TABLE IF EXISTS `points_change_log`;
CREATE TABLE `points_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `old_price` varchar(16) NOT NULL DEFAULT '0',
  `new_price` varchar(16) NOT NULL DEFAULT '0',
  `up_ration` varchar(16) NOT NULL,
  `current_num` varchar(16) NOT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `a` int(11) DEFAULT NULL,
  `b` varchar(50) DEFAULT NULL,
  `c` tinyint(4) DEFAULT NULL,
  `area_num` int(11) DEFAULT NULL COMMENT '区域标示',
  `area_name` varchar(50) DEFAULT NULL COMMENT '区域名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='省份地区常量表';

-- ----------------------------
-- Table structure for sgtj
-- ----------------------------
DROP TABLE IF EXISTS `sgtj`;
CREATE TABLE `sgtj` (
  `sgid` int(11) NOT NULL AUTO_INCREMENT,
  `zd` int(11) DEFAULT NULL,
  `nd` int(11) DEFAULT NULL,
  `aq` int(11) DEFAULT NULL,
  `bq` int(11) DEFAULT NULL,
  `zpay` int(11) DEFAULT NULL,
  `abp` int(11) DEFAULT NULL,
  `ldpay` int(11) DEFAULT NULL,
  `jsdate` datetime DEFAULT NULL,
  `ljcb` decimal(19,4) DEFAULT NULL,
  `ljpa` decimal(19,4) DEFAULT NULL,
  `ljtx` int(11) DEFAULT NULL,
  `ljztx` int(11) DEFAULT NULL,
  `ljdb` decimal(19,4) DEFAULT NULL,
  `ljyg` decimal(19,4) DEFAULT NULL,
  `ljfhg` decimal(19,4) DEFAULT NULL,
  `ljzfh` decimal(19,4) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sgid`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxt
-- ----------------------------
DROP TABLE IF EXISTS `sgxt`;
CREATE TABLE `sgxt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `vipuser` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `xxnew` int(11) DEFAULT NULL,
  `down` decimal(19,4) DEFAULT NULL,
  `fhbl` decimal(19,4) DEFAULT NULL,
  `mqfh` decimal(19,4) DEFAULT NULL,
  `zfh` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `fdpay` int(11) DEFAULT NULL,
  `cfd` int(11) DEFAULT NULL,
  `dqzuo` int(11) DEFAULT NULL,
  `dqyou` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `zaq` int(11) DEFAULT NULL,
  `zbq` int(11) DEFAULT NULL,
  `aq` int(11) DEFAULT NULL,
  `bq` int(11) DEFAULT NULL,
  `auid` varchar(50) DEFAULT NULL,
  `buid` varchar(50) DEFAULT NULL,
  `cbpay` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `z1` int(11) DEFAULT NULL,
  `y1` int(11) DEFAULT NULL,
  `z2` int(11) DEFAULT NULL,
  `y2` int(11) DEFAULT NULL,
  `z3` int(11) DEFAULT NULL,
  `y3` int(11) DEFAULT NULL,
  `z4` int(11) DEFAULT NULL,
  `y4` int(11) DEFAULT NULL,
  `z5` int(11) DEFAULT NULL,
  `y5` int(11) DEFAULT NULL,
  `z6` int(11) DEFAULT NULL,
  `y6` int(11) DEFAULT NULL,
  `z7` int(11) DEFAULT NULL,
  `y7` int(11) DEFAULT NULL,
  `z8` int(11) DEFAULT NULL,
  `y8` int(11) DEFAULT NULL,
  `z9` int(11) DEFAULT NULL,
  `y9` int(11) DEFAULT NULL,
  `z10` int(11) DEFAULT NULL,
  `y10` int(11) DEFAULT NULL,
  `z11` int(11) DEFAULT NULL,
  `y11` int(11) DEFAULT NULL,
  `z12` int(11) DEFAULT NULL,
  `y12` int(11) DEFAULT NULL,
  `z13` int(11) DEFAULT NULL,
  `y13` int(11) DEFAULT NULL,
  `z14` int(11) DEFAULT NULL,
  `y14` int(11) DEFAULT NULL,
  `z15` int(11) DEFAULT NULL,
  `y15` int(11) DEFAULT NULL,
  `z16` int(11) DEFAULT NULL,
  `y16` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `auid` (`auid`),
  KEY `buid` (`buid`)
) ENGINE=InnoDB AUTO_INCREMENT=25073 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxt1
-- ----------------------------
DROP TABLE IF EXISTS `sgxt1`;
CREATE TABLE `sgxt1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `vipuser` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `xxnew` int(11) DEFAULT NULL,
  `down` decimal(19,4) DEFAULT NULL,
  `fhbl` decimal(19,4) DEFAULT NULL,
  `mqfh` decimal(19,4) DEFAULT NULL,
  `zfh` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `fdpay` int(11) DEFAULT NULL,
  `cfd` int(11) DEFAULT NULL,
  `dqzuo` int(11) DEFAULT NULL,
  `dqyou` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `zaq` int(11) DEFAULT NULL,
  `zbq` int(11) DEFAULT NULL,
  `aq` int(11) DEFAULT NULL,
  `bq` int(11) DEFAULT NULL,
  `auid` varchar(50) DEFAULT NULL,
  `buid` varchar(50) DEFAULT NULL,
  `cbpay` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `z1` int(11) DEFAULT NULL,
  `y1` int(11) DEFAULT NULL,
  `z2` int(11) DEFAULT NULL,
  `y2` int(11) DEFAULT NULL,
  `z3` int(11) DEFAULT NULL,
  `y3` int(11) DEFAULT NULL,
  `z4` int(11) DEFAULT NULL,
  `y4` int(11) DEFAULT NULL,
  `z5` int(11) DEFAULT NULL,
  `y5` int(11) DEFAULT NULL,
  `z6` int(11) DEFAULT NULL,
  `y6` int(11) DEFAULT NULL,
  `z7` int(11) DEFAULT NULL,
  `y7` int(11) DEFAULT NULL,
  `z8` int(11) DEFAULT NULL,
  `y8` int(11) DEFAULT NULL,
  `z9` int(11) DEFAULT NULL,
  `y9` int(11) DEFAULT NULL,
  `z10` int(11) DEFAULT NULL,
  `y10` int(11) DEFAULT NULL,
  `z11` int(11) DEFAULT NULL,
  `y11` int(11) DEFAULT NULL,
  `z12` int(11) DEFAULT NULL,
  `y12` int(11) DEFAULT NULL,
  `z13` int(11) DEFAULT NULL,
  `y13` int(11) DEFAULT NULL,
  `z14` int(11) DEFAULT NULL,
  `y14` int(11) DEFAULT NULL,
  `z15` int(11) DEFAULT NULL,
  `y15` int(11) DEFAULT NULL,
  `z16` int(11) DEFAULT NULL,
  `y16` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `auid` (`auid`),
  KEY `buid` (`buid`)
) ENGINE=InnoDB AUTO_INCREMENT=25068 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxt2
-- ----------------------------
DROP TABLE IF EXISTS `sgxt2`;
CREATE TABLE `sgxt2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `vipuser` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `xxnew` int(11) DEFAULT NULL,
  `down` decimal(19,4) DEFAULT NULL,
  `fhbl` decimal(19,4) DEFAULT NULL,
  `mqfh` decimal(19,4) DEFAULT NULL,
  `zfh` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `fdpay` int(11) DEFAULT NULL,
  `cfd` int(11) DEFAULT NULL,
  `dqzuo` int(11) DEFAULT NULL,
  `dqyou` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `zaq` int(11) DEFAULT NULL,
  `zbq` int(11) DEFAULT NULL,
  `aq` int(11) DEFAULT NULL,
  `bq` int(11) DEFAULT NULL,
  `auid` varchar(50) DEFAULT NULL,
  `buid` varchar(50) DEFAULT NULL,
  `cbpay` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `z1` int(11) DEFAULT NULL,
  `y1` int(11) DEFAULT NULL,
  `z2` int(11) DEFAULT NULL,
  `y2` int(11) DEFAULT NULL,
  `z3` int(11) DEFAULT NULL,
  `y3` int(11) DEFAULT NULL,
  `z4` int(11) DEFAULT NULL,
  `y4` int(11) DEFAULT NULL,
  `z5` int(11) DEFAULT NULL,
  `y5` int(11) DEFAULT NULL,
  `z6` int(11) DEFAULT NULL,
  `y6` int(11) DEFAULT NULL,
  `z7` int(11) DEFAULT NULL,
  `y7` int(11) DEFAULT NULL,
  `z8` int(11) DEFAULT NULL,
  `y8` int(11) DEFAULT NULL,
  `z9` int(11) DEFAULT NULL,
  `y9` int(11) DEFAULT NULL,
  `z10` int(11) DEFAULT NULL,
  `y10` int(11) DEFAULT NULL,
  `z11` int(11) DEFAULT NULL,
  `y11` int(11) DEFAULT NULL,
  `z12` int(11) DEFAULT NULL,
  `y12` int(11) DEFAULT NULL,
  `z13` int(11) DEFAULT NULL,
  `y13` int(11) DEFAULT NULL,
  `z14` int(11) DEFAULT NULL,
  `y14` int(11) DEFAULT NULL,
  `z15` int(11) DEFAULT NULL,
  `y15` int(11) DEFAULT NULL,
  `z16` int(11) DEFAULT NULL,
  `y16` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `auid` (`auid`),
  KEY `buid` (`buid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxtup
-- ----------------------------
DROP TABLE IF EXISTS `sgxtup`;
CREATE TABLE `sgxtup` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `upname` varchar(50) DEFAULT NULL,
  `upuser` varchar(50) DEFAULT NULL,
  `upcall` varchar(50) DEFAULT NULL,
  `upqq` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxtzy_temp
-- ----------------------------
DROP TABLE IF EXISTS `sgxtzy_temp`;
CREATE TABLE `sgxtzy_temp` (
  `username` varchar(30) NOT NULL,
  `z1` int(11) DEFAULT '0',
  `y1` int(11) DEFAULT '0',
  `z2` int(11) DEFAULT '0',
  `y2` int(11) DEFAULT '0',
  `z3` int(11) DEFAULT '0',
  `y3` int(11) DEFAULT '0',
  `z4` int(11) DEFAULT '0',
  `y4` int(11) DEFAULT '0',
  `z5` int(11) DEFAULT '0',
  `y5` int(11) DEFAULT '0',
  `z6` int(11) DEFAULT '0',
  `y6` int(11) DEFAULT '0',
  `z7` int(11) DEFAULT '0',
  `y7` int(11) DEFAULT '0',
  `z8` int(11) DEFAULT '0',
  `y8` int(11) DEFAULT '0',
  `z9` int(11) DEFAULT '0',
  `y9` int(11) DEFAULT '0',
  `z10` int(11) DEFAULT '0',
  `y10` int(11) DEFAULT '0',
  `z11` int(11) DEFAULT '0',
  `y11` int(11) DEFAULT '0',
  `z12` int(11) DEFAULT '0',
  `y12` int(11) DEFAULT '0',
  `z13` int(11) DEFAULT '0',
  `y13` int(11) DEFAULT '0',
  `z14` int(11) DEFAULT '0',
  `y14` int(11) DEFAULT '0',
  `z15` int(11) DEFAULT '0',
  `y15` int(11) DEFAULT '0',
  `z16` int(11) DEFAULT '0',
  `y16` int(11) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sgxt_20150101
-- ----------------------------
DROP TABLE IF EXISTS `sgxt_20150101`;
CREATE TABLE `sgxt_20150101` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(30) DEFAULT NULL,
  `vip` int(11) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `new` int(11) DEFAULT NULL,
  `down` decimal(19,4) DEFAULT NULL,
  `fhbl` decimal(19,4) DEFAULT NULL,
  `mqfh` decimal(19,4) DEFAULT NULL,
  `zfh` decimal(19,4) DEFAULT NULL,
  `fdpay` int(11) DEFAULT NULL,
  `cfd` int(11) DEFAULT NULL,
  `dqzuo` int(11) DEFAULT NULL,
  `dqyou` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `zaq` int(11) DEFAULT NULL,
  `zbq` int(11) DEFAULT NULL,
  `aq` int(11) DEFAULT NULL,
  `bq` int(11) DEFAULT NULL,
  `auid` varchar(50) DEFAULT NULL,
  `buid` varchar(50) DEFAULT NULL,
  `cbpay` decimal(19,4) DEFAULT NULL,
  `pay` decimal(19,4) DEFAULT NULL,
  `bddate` datetime DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tduser
-- ----------------------------
DROP TABLE IF EXISTS `tduser`;
CREATE TABLE `tduser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gainame` varchar(50) DEFAULT NULL,
  `tdname` varchar(50) DEFAULT NULL,
  `gaiuserid` varchar(50) DEFAULT NULL,
  `tduserid` varchar(50) DEFAULT NULL,
  `tduser` varchar(50) DEFAULT NULL,
  `tdcall` varchar(50) DEFAULT NULL,
  `tdqq` varchar(50) DEFAULT NULL,
  `gai` int(11) DEFAULT '0',
  `tddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tempdatepay
-- ----------------------------
DROP TABLE IF EXISTS `tempdatepay`;
CREATE TABLE `tempdatepay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `newbz` int(11) DEFAULT NULL,
  `regid` varchar(256) DEFAULT NULL,
  `abdate` datetime DEFAULT NULL,
  `syjz` int(11) DEFAULT NULL,
  `chu2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for txifok
-- ----------------------------
DROP TABLE IF EXISTS `txifok`;
CREATE TABLE `txifok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `up` varchar(30) DEFAULT NULL,
  `password3` varchar(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `call` varchar(50) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `txdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=37132 DEFAULT CHARSET=utf8 COMMENT='用户注册后 会向该表插入记录';

-- ----------------------------
-- Table structure for txpay
-- ----------------------------
DROP TABLE IF EXISTS `txpay`;
CREATE TABLE `txpay` (
  `payid` int(11) NOT NULL AUTO_INCREMENT,
  `jyid` int(11) DEFAULT NULL,
  `pdid` int(11) DEFAULT NULL,
  `payusername` varchar(20) DEFAULT NULL,
  `cxt` int(11) DEFAULT NULL,
  `vipname` varchar(50) DEFAULT NULL,
  `paynum` int(11) DEFAULT NULL,
  `paynum9` int(11) DEFAULT NULL,
  `payname` varchar(30) DEFAULT NULL,
  `paybank` varchar(50) DEFAULT NULL,
  `paycard` varchar(20) DEFAULT NULL,
  `dqu` int(11) DEFAULT NULL,
  `bankbz` varchar(50) DEFAULT NULL,
  `paytime` datetime DEFAULT NULL,
  `zftime` datetime DEFAULT NULL,
  `openonoff` varchar(50) DEFAULT NULL,
  `ep` int(11) DEFAULT NULL,
  `rgdate` datetime DEFAULT NULL,
  `dfuser` varchar(50) DEFAULT NULL,
  `kjygid` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  `qlid` int(11) DEFAULT NULL,
  `payonoff` varchar(50) DEFAULT NULL,
  `txip` varchar(50) DEFAULT NULL,
  `clip` varchar(50) DEFAULT NULL,
  `txlb` int(11) DEFAULT NULL,
  `txvip` int(11) DEFAULT NULL,
  `tp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`payid`),
  KEY `dfuser` (`dfuser`) USING BTREE,
  KEY `payusername` (`payusername`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65271 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_daily_gain_log
-- ----------------------------
DROP TABLE IF EXISTS `user_daily_gain_log`;
CREATE TABLE `user_daily_gain_log` (
  `user_daily_gain_log_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) DEFAULT NULL,
  `type` tinyint(4) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_daily_gain_log_id`),
  UNIQUE KEY `user_id_date` (`user_name`,`date`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_extinfo
-- ----------------------------
DROP TABLE IF EXISTS `user_extinfo`;
CREATE TABLE `user_extinfo` (
  `user_name` varchar(32) DEFAULT NULL,
  `need_verify` int(11) DEFAULT NULL,
  KEY `user_name` (`user_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_performance
-- ----------------------------
DROP TABLE IF EXISTS `user_performance`;
CREATE TABLE `user_performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) DEFAULT NULL,
  `sigle_all_performance` int(11) DEFAULT NULL,
  `sigle_time_all_performance` int(11) DEFAULT NULL,
  `five_left_performance` int(11) DEFAULT NULL,
  `five_left_time_performance` int(11) DEFAULT NULL,
  `five_right_performance` int(11) DEFAULT NULL,
  `five_right_time_performance` int(11) DEFAULT NULL,
  `all_time_left_performance` int(11) DEFAULT NULL,
  `all_time_right_performance` int(11) DEFAULT NULL,
  `fu` int(11) DEFAULT NULL,
  `add_time` date DEFAULT NULL,
  `zaq` int(11) DEFAULT NULL,
  `zbq` int(11) DEFAULT NULL,
  `db` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_scores_log
-- ----------------------------
DROP TABLE IF EXISTS `user_scores_log`;
CREATE TABLE `user_scores_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(32) NOT NULL,
  `from_user` varchar(32) NOT NULL DEFAULT '0',
  `change_num` int(11) NOT NULL DEFAULT '0',
  `now_num` int(11) NOT NULL,
  `change_type` int(11) NOT NULL DEFAULT '0',
  `ration` double(19,4) NOT NULL DEFAULT '0.0000',
  `param` varchar(256) DEFAULT NULL,
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_vip_log
-- ----------------------------
DROP TABLE IF EXISTS `user_vip_log`;
CREATE TABLE `user_vip_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(32) NOT NULL COMMENT '被操作的用户',
  `op_type` int(11) NOT NULL DEFAULT '0' COMMENT '操作类型1设置ip  2修改vip信息 3取消vip',
  `op_user` varchar(32) NOT NULL COMMENT '操作的管理员',
  `ip` varchar(64) NOT NULL COMMENT 'ip地址',
  `commit_param` varchar(1024) DEFAULT NULL COMMENT '提交的参数',
  `created_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vipcjgl
-- ----------------------------
DROP TABLE IF EXISTS `vipcjgl`;
CREATE TABLE `vipcjgl` (
  `cjid` int(11) NOT NULL AUTO_INCREMENT,
  `cjuser` varchar(50) DEFAULT NULL,
  `cjjo` int(11) DEFAULT NULL,
  `cjdate` datetime DEFAULT NULL,
  `vipuser` varchar(50) DEFAULT NULL,
  `sycjb` int(11) DEFAULT NULL,
  `bz` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cjid`),
  KEY `vipuser` (`vipuser`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for vipxtgc
-- ----------------------------
DROP TABLE IF EXISTS `vipxtgc`;
CREATE TABLE `vipxtgc` (
  `vipid` int(11) NOT NULL AUTO_INCREMENT,
  `vipname` varchar(50) DEFAULT NULL,
  `vipdate` date DEFAULT NULL,
  `jcyb` int(11) DEFAULT NULL,
  `jcbdb` int(11) DEFAULT NULL,
  PRIMARY KEY (`vipid`),
  UNIQUE KEY `vipname` (`vipname`,`vipdate`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for you_mingxi
-- ----------------------------
DROP TABLE IF EXISTS `you_mingxi`;
CREATE TABLE `you_mingxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tjuser` varchar(50) DEFAULT NULL,
  `down` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tjuser` (`tjuser`),
  KEY `down` (`down`)
) ENGINE=InnoDB AUTO_INCREMENT=791737 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zuo_mingxi
-- ----------------------------
DROP TABLE IF EXISTS `zuo_mingxi`;
CREATE TABLE `zuo_mingxi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tjuser` varchar(50) DEFAULT NULL,
  `down` varchar(50) DEFAULT NULL,
  `sjb` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tjuser` (`tjuser`),
  KEY `down` (`down`)
) ENGINE=InnoDB AUTO_INCREMENT=1765775 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for deleteSgxtUserForNoDown
-- ----------------------------
DROP PROCEDURE IF EXISTS `deleteSgxtUserForNoDown`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSgxtUserForNoDown`(IN `userP` varchar(64))
label_pro:BEGIN
	#Routine body goes here...
  DECLARE sjb_sql VARCHAR(1000); 
  DECLARE rt VARCHAR(1000) DEFAULT NULL;

  SET @USERPARAM=NULL;
  SET @USER_AUID=NULL;
  SET @USER_BUID=NULL;
  SET @sjbParam = NULL;

  SELECT userP;
  -- 判断该用户下面是否有人 如果有 终止执行
  set @juge_sql = CONCAT("select username,auid,buid into @USERPARAM, @USER_AUID,@USER_BUID from sgxt where username='",userP,"'");
  PREPARE stmt from @juge_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  SELECT @USERPARAM,@USER_AUID,@USER_BUID;
  IF @USERPARAM IS NULL THEN
   set rt = CONCAT('该用户不存在');
   select rt as result;
   LEAVE label_pro;
  END IF;
  
  IF @USER_AUID='' THEN
    SET @USER_AUID = NULL;
  END IF;

  IF @USER_BUID='' THEN
    SET @USER_BUID = NULL;
  END IF;
  
  SELECT @USERPARAM,@USER_AUID,@USER_BUID;
  
  IF @USER_AUID is NOT NULL OR @USER_BUID is NOT NULL THEN
   set rt = CONCAT('该用户下面有人，无法删除');
   select rt as result;
   LEAVE label_pro;
  END IF;   

  -- 查询出要处理人的sjb
  set sjb_sql = CONCAT("select sjb into @sjbParam from sgxt where username='",userP,"' limit 1");
  set @select_sjb_sql = sjb_sql;
  select @select_sjb_sql;
  prepare stmt from @select_sjb_sql;
  EXECUTE stmt;
  deallocate prepare stmt;
 
  -- 减上级的aq bq zaq  zbq
  select @sjbParam;
  set @reduce_aq_sql = CONCAT("update sgxt set zaq=zaq-",@sjbParam,",aq=aq-",@sjbParam," where username in(select tjuser from zuo_mingxi where down='",userP,"')");
  set @reduce_bq_sql = CONCAT("update sgxt set zbq=zbq-",@sjbParam,",bq=bq-",@sjbParam," where username in(select tjuser from you_mingxi where down='",userP,"')");
  prepare stmt from @reduce_aq_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  prepare stmt from @reduce_bq_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  -- 删除zuo_mingxi及you_mingxi中的记录
  set @del_zuo_sql =  CONCAT("delete from zuo_mingxi where down='",userP,"'");
  set @del_you_sql =  CONCAT("delete from you_mingxi where down='",userP,"'");

  prepare stmt from @del_zuo_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  prepare stmt from @del_you_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  -- 更新上级用户的auid或buid为null
  set @update_auid_sql =  CONCAT("update sgxt set auid=null where auid='",userP,"' limit 1");
  set @update_buid_sql =  CONCAT("update sgxt set buid=null where buid='",userP,"' limit 1");

  prepare stmt from @update_auid_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  prepare stmt from @update_buid_sql;
  EXECUTE stmt;
  deallocate prepare stmt;

  -- 删除sgxt表中的记录
  set @del_sgxt = CONCAT("delete from sgxt where username='",userP,"' limit 1");
  prepare stmt from @del_sgxt;
  EXECUTE stmt;
  deallocate prepare stmt;
  
END
;;
DELIMITER ;

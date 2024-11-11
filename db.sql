/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - chaoshikucunguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chaoshikucunguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `chaoshikucunguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`create_time`) values (1,'sex_types','性别类型名称',1,'男',NULL,'2021-04-29 16:57:15'),(2,'sex_types','性别类型名称',2,'女',NULL,'2021-04-29 16:57:15'),(3,'gongyingshang_xinyong_types','供应商信用等级名称',1,'等级1',NULL,'2021-04-29 16:57:15'),(4,'gongyingshang_xinyong_types','供应商信用等级名称',2,'等级2',NULL,'2021-04-29 16:57:15'),(5,'gongyingshang_xinyong_types','供应商信用等级名称',3,'等级3',NULL,'2021-04-29 16:57:15'),(6,'goods_types','商品种类名称',1,'海产品',NULL,'2021-04-29 16:57:15'),(7,'goods_types','商品种类名称',2,'日用品',NULL,'2021-04-29 16:57:15'),(8,'goods_types','商品种类名称',3,'果蔬',NULL,'2021-04-29 16:57:15'),(9,'gonggao_types','公告类型名称',1,'日常公告',NULL,'2021-04-29 16:57:15'),(10,'gonggao_types','公告类型名称',2,'紧急公告',NULL,'2021-04-29 16:57:15'),(11,'goods_types','商品种类名称',5,'衣物',NULL,'2021-04-29 21:05:17');

/*Table structure for table `gonggao` */

DROP TABLE IF EXISTS `gonggao`;

CREATE TABLE `gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111 ',
  `gonggao_types` int(11) DEFAULT NULL COMMENT '公告类型 Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告时间',
  `gonggao_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告';

/*Data for the table `gonggao` */

insert  into `gonggao`(`id`,`gonggao_name`,`gonggao_types`,`insert_time`,`gonggao_content`,`create_time`) values (3,'公告1',1,'2021-04-29 19:09:46','公告详情1\r\n','2021-04-29 19:09:46'),(4,'公告2',2,'2021-04-29 19:11:03','公告详情2\r\n','2021-04-29 19:11:03'),(5,'公告3',2,'2021-04-29 21:04:34','公告3的峡谷情\r\n','2021-04-29 21:04:34');

/*Table structure for table `gongyingshang` */

DROP TABLE IF EXISTS `gongyingshang`;

CREATE TABLE `gongyingshang` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gongyingshang_name` varchar(200) DEFAULT NULL COMMENT '供应商名字 Search111 ',
  `gongyingshang_xinyong_types` int(11) DEFAULT NULL COMMENT '信用等级 Search111 ',
  `gongyingshang_content` text COMMENT '供应商详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='供应商';

/*Data for the table `gongyingshang` */

insert  into `gongyingshang`(`id`,`gongyingshang_name`,`gongyingshang_xinyong_types`,`gongyingshang_content`,`insert_time`,`create_time`) values (3,'供应商1',1,'供应商详情1\r\n','2021-04-29 19:08:52','2021-04-29 19:08:52'),(4,'供应商2',2,'供应商相同请2\r\n','2021-04-29 19:09:13','2021-04-29 19:09:13'),(5,'供应商2',3,'供应商2的详情\r\n','2021-04-29 21:04:16','2021-04-29 21:04:16');

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_name` varchar(200) DEFAULT NULL COMMENT '商品名字 Search111 ',
  `goods_types` int(11) DEFAULT NULL COMMENT '商品种类  Search111 ',
  `goods_number` int(11) DEFAULT NULL COMMENT '商品数量  Search111 ',
  `goods_yujing_number` int(11) DEFAULT NULL COMMENT '商品阈值  Search111 ',
  `goods_photo` varchar(200) DEFAULT NULL COMMENT '商品图片',
  `danwei` varchar(200) DEFAULT NULL COMMENT '单位',
  `danjia` decimal(10,2) DEFAULT NULL COMMENT '单价 Search111 ',
  `goods_content` text COMMENT '商品详情',
  `flag` int(11) DEFAULT NULL COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品';

/*Data for the table `goods` */

insert  into `goods`(`id`,`goods_name`,`goods_types`,`goods_number`,`goods_yujing_number`,`goods_photo`,`danwei`,`danjia`,`goods_content`,`flag`,`create_time`) values (1,'T恤',2,102,10,'http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687846319.webp','件','50.00','T恤的详情\r\n',1,'2021-04-29 17:18:05'),(2,'笔记本散热器',2,1011,10,'http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619689396397.webp','个','100.00','笔记本散热器的详情\r\n',1,'2021-04-29 17:44:00'),(3,'电脑主机',2,0,10,'http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619694095311.webp','个','101.00','电脑主机的详情\r\n',1,'2021-04-29 19:02:03'),(4,'茉莉花茶',2,102,10,'http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619701156389.webp','瓶','13.00','茉莉花茶的详情\r\n',1,'2021-04-29 20:59:58');

/*Table structure for table `goods_in` */

DROP TABLE IF EXISTS `goods_in`;

CREATE TABLE `goods_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `gongyingshang_id` int(11) DEFAULT NULL COMMENT '供应商',
  `goods_in_number` int(11) DEFAULT NULL COMMENT '进货数量  Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '进货时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='进货';

/*Data for the table `goods_in` */

insert  into `goods_in`(`id`,`goods_id`,`gongyingshang_id`,`goods_in_number`,`insert_time`,`create_time`) values (1,2,4,11,'2021-04-29 20:43:25','2021-04-29 20:43:25'),(2,1,3,2,'2021-04-29 20:45:28','2021-04-29 20:45:28'),(3,4,4,10,'2021-04-29 21:00:17','2021-04-29 21:00:17');

/*Table structure for table `goods_out` */

DROP TABLE IF EXISTS `goods_out`;

CREATE TABLE `goods_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huiyuan_id` int(11) DEFAULT NULL COMMENT '用户',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品',
  `goods_out_number` int(11) DEFAULT NULL COMMENT '销售数量  Search111 ',
  `goods_out_money` decimal(10,2) DEFAULT NULL COMMENT '销售总价  Search111 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '销售时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='销售';

/*Data for the table `goods_out` */

insert  into `goods_out`(`id`,`huiyuan_id`,`goods_id`,`goods_out_number`,`goods_out_money`,`insert_time`,`create_time`) values (1,3,3,10,'1010.00','2021-04-29 20:54:31','2021-04-29 20:54:31'),(2,5,4,10,'130.00','2021-04-29 21:00:59','2021-04-29 21:00:59'),(3,5,4,2,'26.00','2021-04-29 21:02:10','2021-04-29 21:02:10'),(4,4,4,2,'24.70','2021-04-29 21:03:19','2021-04-29 21:03:19'),(5,NULL,4,2,'26.00','2021-04-29 21:03:35','2021-04-29 21:03:35'),(6,NULL,4,2,'26.00','2021-04-29 21:03:50','2021-04-29 21:03:50');

/*Table structure for table `huiyuan` */

DROP TABLE IF EXISTS `huiyuan`;

CREATE TABLE `huiyuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `huiyuan_name` varchar(200) DEFAULT NULL COMMENT '会员姓名 Search111 ',
  `huiyuan_phone` varchar(200) DEFAULT NULL COMMENT '会员手机号 Search111 ',
  `huiyuan_id_number` varchar(200) DEFAULT NULL COMMENT '会员身份证号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '会员照片',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员';

/*Data for the table `huiyuan` */

insert  into `huiyuan`(`id`,`huiyuan_name`,`huiyuan_phone`,`huiyuan_id_number`,`yonghu_photo`,`sex_types`,`insert_time`,`create_time`) values (1,'a11','17703786911','410224199610232011','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687740619.jpg',1,'2021-04-29 17:15:42','2021-04-29 17:15:42'),(2,'a22','17703786922','410224199610232022','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687778610.jpg',1,'2021-04-29 17:16:20','2021-04-29 17:16:20'),(3,'a33','17703786933','410224199610232033','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687814034.jpg',1,'2021-04-29 17:16:56','2021-04-29 17:16:56'),(4,'a44','17703786944','410224199610232044','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687832227.jpg',2,'2021-04-29 17:17:13','2021-04-29 17:17:13'),(5,'a55','17703786955','410224199610232055','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619701116735.jpg',1,'2021-04-29 20:58:39','2021-04-29 20:58:39');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,6,'admin','users','管理员','of80tzn4m07rxrdtgj0ibhkw9m26s3hf','2021-04-29 17:14:21','2021-04-29 21:57:39'),(2,1,'a1','yonghu','用户','aglmsl5g2s8cdrxr5hxsho2imp5v6x43','2021-04-29 20:55:54','2021-04-29 21:55:54'),(3,2,'a2','yonghu','用户','x2gpm29zja91jdo424o2fnmbiudqp1a6','2021-04-29 21:05:28','2021-04-29 22:05:28');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (6,'admin','123456','管理员','2021-04-27 14:51:13');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '员工姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '员工手机号 Search111 ',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '员工身份证号 Search111 ',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '员工照片',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='员工';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_phone`,`yonghu_id_number`,`yonghu_photo`,`sex_types`,`create_time`) values (1,'a1','123456','张1','17703786901','410224199610232001','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619687715607.jpg',1,'2021-04-29 17:15:18'),(2,'a2','123456','张2','17703786902','410224199610232002','http://localhost:8080/chaoshikucunguanli/file/download?fileName=1619701084199.jpg',2,'2021-04-29 20:58:12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

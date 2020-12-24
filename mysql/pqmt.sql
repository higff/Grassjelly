/*
SQLyog Ultimate v13.1.1 (64 bit)
MySQL - 10.4.11-MariaDB : Database - pqmt
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`pqmt` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `pqmt`;

/*Table structure for table `pq_cart` */

DROP TABLE IF EXISTS `pq_cart`;

CREATE TABLE `pq_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车编号,主键且自增',
  `userid` int(10) NOT NULL COMMENT '外键,用户编号,非空,参照pq_user表',
  `proid` int(10) NOT NULL COMMENT '外键,商品编号,非空,参照pq_product表',
  `pname` varchar(100) NOT NULL COMMENT '商品名称,非空',
  `img` varchar(200) NOT NULL COMMENT '商品主图,url相对地址,非空',
  `price` decimal(20,2) NOT NULL COMMENT '商品价格,保留两位小数,非空',
  `count` int(11) DEFAULT NULL COMMENT '商品数量',
  `is_checked` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否选择:1-已勾选 0-未勾选',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `pq_cart` */

insert  into `pq_cart`(`id`,`userid`,`proid`,`pname`,`img`,`price`,`count`,`is_checked`,`create_time`,`update_time`) values 
(2,1,1,'超级水果茶','01.jpg',15.00,3,1,'2020-12-23 07:09:24','2020-12-23 11:07:47'),
(3,1,11,'书亦烧仙草','11.jpg',16.00,2,1,'2020-12-23 07:09:30','2020-12-23 11:08:00'),
(4,1,21,'葡萄柚益菌多','21.jpg',14.00,2,1,'2020-12-23 07:11:50','2020-12-23 11:07:56'),
(6,1,13,'小芋圆烧仙草','13.jpg',16.00,1,1,'2020-12-23 11:08:16','2020-12-23 11:08:16');

/*Table structure for table `pq_category` */

DROP TABLE IF EXISTS `pq_category`;

CREATE TABLE `pq_category` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品类别编号,主键且自增',
  `cate_name` varchar(9) NOT NULL COMMENT '类别名称,唯一,非空',
  `cate_status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '类别状态:1-正常 0-已废弃,默认1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cate_id` (`id`),
  UNIQUE KEY `cate_name` (`cate_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `pq_category` */

insert  into `pq_category`(`id`,`cate_name`,`cate_status`) values 
(1,'热销',1),
(2,'推荐',1),
(3,'烧仙草系列',1),
(4,'特调奶茶系列',1),
(5,'益菌多系列',1),
(6,'鲜果茶系列',1),
(7,'奶昔系列',1),
(8,'小料',1);

/*Table structure for table `pq_info` */

DROP TABLE IF EXISTS `pq_info`;

CREATE TABLE `pq_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资讯编号,主键且自增',
  `title` varchar(50) NOT NULL COMMENT '文章标题,非空',
  `description` varchar(255) NOT NULL COMMENT '文章简介,非空',
  `content` mediumtext NOT NULL COMMENT '文章正文,非空',
  `image` varchar(50) DEFAULT NULL COMMENT '文章缩略图',
  `author_name` varchar(50) NOT NULL COMMENT '作者名字,非空',
  `info_id` tinyint(2) unsigned NOT NULL COMMENT '外键,文章分类ID,非空,参照pq_nav_item表',
  `create_time` datetime NOT NULL COMMENT '创建时间,非空',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `pq_info` */

insert  into `pq_info`(`id`,`title`,`description`,`content`,`image`,`author_name`,`info_id`,`create_time`) values 
(1,'藏不住了！高调曝光书亦烧仙草新品，椰里椰气的！','火了13年的奶茶，半杯都是料的书亦烧仙草，从学生时代喝到上班，味道一如既往优秀，价格还是接地气...','<p>正文内容</p>',NULL,'admin',13,'2020-11-28 14:15:00'),
(2,'推荐饮品 || 暖冬，就差一杯书亦烧仙草','冬日很慵懒，窗外汽车鸣笛时，微微发亮的日光拂过身躯，打了一个冗长的盹儿，双眼微睁，昨夜未看完的书还停留在那一页...','<p>正文内容</p>',NULL,'admin',13,'2020-10-24 11:37:00'),
(3,'书亦烧仙草加盟费多少钱？','书亦烧仙草加盟条件：年龄在20-40岁之间、大专以上学历，无违法犯罪记录，热爱饮品行业，认同股品牌经营理念，服从公司的统一管理，配合度高...','<p>正文内容</p>',NULL,'admin',13,'2020-10-24 11:20:00'),
(4,'书亦烧仙草 | 中国仙草引领者，打造属于我们的新中式茶饮','近些年，茶饮店似乎已成了网红打卡的必去地点。据统计，去年国内的茶饮市场规模达到537亿元，在这背后诞生出许多知名的茶饮品牌，它们在各地疯狂开店形成大混战...','<p>正文内容</p>',NULL,'admin',13,'2020-10-24 10:58:00'),
(5,'书亦烧仙草——你喜欢的味道吗？','作为当代社畜的生存必备品，少则一天一杯 多则无法估算，毕竟当代社会，不喝奶茶的人，不配有社交...','<p>正文内容</p>',NULL,'admin',13,'2020-09-21 19:02:00'),
(6,'推荐饮品 || 暖冬，就差一杯书亦烧仙草','冬日很慵懒，窗外汽车鸣笛时，微微发亮的日光拂过身躯，打了一个冗长的盹儿，双眼微睁，昨夜未看完的书还停留在那一页...','<p>正文内容</p>',NULL,'admin',14,'2020-09-21 18:53:00'),
(7,'书亦烧仙草|好喝就这么简单','书亦烧仙草成立于2013年，总部位于西南经济中心成都，公司以“科学管理、真诚服务”为准则，“自然、健康、时尚”为产品理念，致力于打造优质茶饮连锁品牌...','<p>正文内容</p>',NULL,'admin',14,'2020-09-21 18:49:00'),
(8,'书亦烧仙草市场依然火爆！！！','2007年，那年的王总才21岁。他带着对创业的憧憬和期待，开始了奶茶创业之旅。13年过去了，当初一间小小的奶茶店成就了一翻大事业...','<p>正文内容</p>',NULL,'admin',14,'2020-08-21 09:27:00'),
(9,'书亦烧仙草——给你夏天的专属味道','对于小学生来说放暑假了就是夏天，放寒假了就是冬天。对于成年人来说夏天到了就是夏天，冬天到了就是冬天。但其实或许夏天应该是橘子汽水的味道...','<p>正文内容</p>',NULL,'admin',14,'2020-08-21 06:57:00'),
(10,'书亦烧仙草为什么口碑这么好?','当谈到网红奶茶店的时候，你首先想到的是什么？人多？拍照？环境？打卡？价格高?事实上，我以前去过很多网红店排队...其实味道也就是..很一般...','<p>正文内容</p>',NULL,'admin',14,'2020-08-21 06:56:00');

/*Table structure for table `pq_nav` */

DROP TABLE IF EXISTS `pq_nav`;

CREATE TABLE `pq_nav` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT COMMENT '一级导航栏类别编号,主键且自增',
  `nav_name` char(12) NOT NULL COMMENT '一级导航栏名称,唯一,非空',
  `link` enum('/','/product','/show','/information','/message','/about','/join','/contact') NOT NULL DEFAULT '/' COMMENT '一级导航栏跳转链接,非空,默认''/''',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nav_name` (`nav_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `pq_nav` */

insert  into `pq_nav`(`id`,`nav_name`,`link`) values 
(1,'网站首页','/'),
(2,'经典推荐','/product'),
(3,'特色饮品','/product'),
(4,'店面风采','/show'),
(5,'新闻资讯','/information'),
(6,'在线留言','/message'),
(7,'关于我们','/about'),
(8,'加盟合作','/join'),
(9,'联系我们','/contact');

/*Table structure for table `pq_nav_item` */

DROP TABLE IF EXISTS `pq_nav_item`;

CREATE TABLE `pq_nav_item` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT COMMENT '二级导航栏编号,主键且自增',
  `nav_item_name` varchar(18) NOT NULL COMMENT '二级导航栏名称,唯一,非空',
  `navid` tinyint(1) DEFAULT NULL COMMENT '外键,二级导航栏类别,参照pq_nav表',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nav_item_name` (`nav_item_name`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `pq_nav_item` */

insert  into `pq_nav_item`(`id`,`nav_item_name`,`navid`) values 
(1,'热销',2),
(2,'推荐',2),
(3,'烧仙草',2),
(4,'奶茶',2),
(5,'益菌多',2),
(6,'鲜果茶',2),
(7,'烧仙草系列',3),
(8,'奶茶系列',3),
(9,'益菌多系列',3),
(10,'鲜果茶系列',3),
(11,'奶昔系列',3),
(12,'小料',3),
(13,'新闻咨询',5),
(14,'行业动态',5),
(15,'企业简介',7),
(16,'品牌介绍',7),
(17,'企业荣誉',7);

/*Table structure for table `pq_order_item` */

DROP TABLE IF EXISTS `pq_order_item`;

CREATE TABLE `pq_order_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '子订单编号,主键且自增',
  `orderid` int(10) NOT NULL COMMENT '外键,订单编号,非空,参照pq_orders表',
  `userid` int(10) NOT NULL COMMENT '外键,用户编号,非空,参照pq_user表',
  `proid` int(10) NOT NULL COMMENT '外键,商品编号,非空,参照pq_product表',
  `proname` varchar(100) NOT NULL COMMENT '商品名称,非空',
  `proimage` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `current_unit_price` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT '生成订单时的商品单价,保留两位小数,非空',
  `quantity` int(11) NOT NULL DEFAULT 1 COMMENT '商品数量,非空',
  `total_price` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT '商品总价,保留两位小数,非空',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pq_order_item` */

/*Table structure for table `pq_orders` */

DROP TABLE IF EXISTS `pq_orders`;

CREATE TABLE `pq_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单编号,主键且自增',
  `userid` int(10) NOT NULL COMMENT '外键,用户编号,非空,参照pq_user表',
  `shoppingid` int(10) NOT NULL COMMENT '外键,收货信息编号,非空,参照pq_shopping表',
  `order_payment` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT '实际付款金额,保留两位小数,非空',
  `order_payment_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '支付类型.1-在线支付,默认1',
  `order_postage` decimal(20,2) NOT NULL DEFAULT 0.00 COMMENT '运费,保留两位小数,非空',
  `order_status` smallint(2) DEFAULT NULL COMMENT '订单状态:0-已取消 10-未付款 20-已付款 30-已发货 40-交易成功 50-交易关闭',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `send_time` datetime DEFAULT NULL COMMENT '发货时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `colse_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pq_orders` */

/*Table structure for table `pq_payinfo` */

DROP TABLE IF EXISTS `pq_payinfo`;

CREATE TABLE `pq_payinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '支付信息编号,主键且自增',
  `orderid` int(10) NOT NULL COMMENT '外键,订单编号,非空,参照pq_orders表',
  `userid` int(10) NOT NULL COMMENT '外键,用户编号,非空,参照pq_user表',
  `pay_platform` tinyint(1) DEFAULT NULL COMMENT '支付平台:1-支付宝 2-微信',
  `platform_number` varchar(200) DEFAULT NULL COMMENT '支付流水号',
  `platform_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '支付状态:0-失败 1-成功,默认1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pq_payinfo` */

/*Table structure for table `pq_product` */

DROP TABLE IF EXISTS `pq_product`;

CREATE TABLE `pq_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号,主键且自增',
  `cate_id` int(10) DEFAULT NULL COMMENT '外键,商品类型,参照pq_category表',
  `pro_name` varchar(100) NOT NULL COMMENT '商品名称,唯一,非空',
  `pro_detail` text DEFAULT NULL COMMENT '商品详情',
  `pro_img` varchar(200) DEFAULT NULL COMMENT '商品主图,url相对地址,非空',
  `pro_price` decimal(20,2) NOT NULL COMMENT '商品价格,保留两位小数,非空',
  `pro_stock` int(11) NOT NULL COMMENT '商品库存数量,非空',
  `pro_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品状态:1-在售 2-下架 3-删除,默认1',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `pro_name` (`pro_name`),
  UNIQUE KEY `pro_img` (`pro_img`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

/*Data for the table `pq_product` */

insert  into `pq_product`(`id`,`cate_id`,`pro_name`,`pro_detail`,`pro_img`,`pro_price`,`pro_stock`,`pro_status`,`create_time`,`update_time`) values 
(1,1,'超级水果茶','好果配好茶，七种水果，满满的维C，超丰富的味觉体验，四季春茶的清香完全不会掩盖水果的味道，浅闻花果香气浓郁，饮时鲜甜之味，瞬间沁入心间。一口茶一口水果，每一丝都是喜悦的味道，解暑新技能GET。','01.jpg',15.00,20,1,'2020-12-14 22:01:03',NULL),
(2,2,'满杯青柠爱玉','滑嫩Q爽爱玉冻，淋上清新柠檬汁，酸甜可口，像盛夏林荫道迎面吹来的微风，或像初夏隐约吹进课堂的栀子花香，甜蜜而美好。爱玉冻冰镇更加爽口哦。','02.jpg',15.00,20,1,'2020-12-14 22:01:28',NULL),
(3,6,'台湾红芭乐','宝岛的新鲜红心芭乐，膳食纤维丰富，热量低，饱腹感强，喝起来绵密爽口，甜而不涩，一杯粉红少女心，是藏不住的甜蜜，颜值与内涵并存。','03.jpg',15.00,20,1,'2020-12-14 22:01:34',NULL),
(4,6,'百香凤梨','简单泡一泡就可以得到清新好味道的百香果，横冲直撞的酸甜果味，是一场味蕾神经的集体狂欢。果肉在唇齿间摩挲，汁液在口腔爆发，纤维丰富的凤梨果肉，在清新的茶汤中上下沉浮，清晰可见的满足感。宝岛的新鲜红心芭乐，膳食纤维丰富，热量低，饱腹感强，喝起来绵密爽口，甜而不涩，一杯粉红少女心，是藏不住的甜蜜，颜值与内涵并存。','04.jpg',15.00,20,1,'2020-12-14 22:02:49',NULL),
(5,6,'鲜橙葡萄柚','葡萄柚具有丰富的营养价值，味偏酸苦，但口感舒适；鲜橙的清甜掩盖了葡萄柚的酸苦，每一口都能俘获你内心盛夏的情绪悸动，唤醒你麻木的味觉体验。','05.jpg',15.00,20,1,'2020-12-14 22:05:10',NULL),
(6,6,'百香优多','百香果不论搭配什么，喝起来都是一种无法言喻的乐趣，加入满满一瓶养乐多，酸涩中多了一份香甜浓郁，让咀嚼的乐趣更加纯粹，满足感MAX。','06.jpg',15.00,20,1,'2020-12-14 22:06:46',NULL),
(7,6,'金菠萝茉莉','金菠萝没有了普通菠萝的酸涩，果肉更饱满多汁，在保留纯粹茉莉清香的同时，甘甜的菠萝，清新和舒畅从喉头滑入，清扫了了疲惫和沉郁，如苔寺一样令人沉醉。','07.jpg',15.00,20,1,'2020-12-14 22:26:08',NULL),
(8,6,'金桔柠檬','大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','08.jpg',15.00,20,1,'2020-12-14 22:27:30',NULL),
(9,6,'蜂蜜柚子茶','大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','09.jpg',15.00,20,1,'2020-12-14 22:28:53',NULL),
(10,6,'水果什锦','金菠萝没有了普通菠萝的酸涩，果肉更饱满多汁，在保留纯粹茉莉清香的同时，甘甜的菠萝，清新和舒畅从喉头滑入，大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','10.jpg',15.00,20,1,'2020-12-14 22:30:16',NULL),
(11,1,'书亦烧仙草','仙草冻、椰果、红豆、珍珠、花生、葡萄干，六种配料，加上定制红茶与甄选牛奶，完美烘托出配料的天然清香，一口尽是层次丰富的满足感。夏日，一杯冰凉的烧仙草就能迅速的赶走一切燥热，寒冬热吃，又能快速驱散寒气。丰富的配料，是对品质的讲究，纯正的味道。','11.jpg',16.00,20,1,'2020-12-14 22:34:48',NULL),
(12,2,'杨枝甘露烧仙草','现切芒果打成绵密果浆，再混合芒果与西柚的果肉粒，缓缓倒入仙草冻打底的杯中，每一口都是果汁与果肉糅合的香甜。浓郁与甘甜的搭配，是永远品不腻的味道。仿佛电影般色调的分层，镜头中只有一副夕阳西下的水墨画，视野能望到的尽头，天地交融。','12.jpg',16.00,20,1,'2020-12-14 22:37:06',NULL),
(13,3,'小芋圆烧仙草','小芋圆烧仙草四川书亦烧仙草作为成都奶茶加盟热销品牌,目前已经拓展到全国饮品市场,直营店多达80多家,烧仙草奶茶加盟店在全国已有2300多家.书亦烧仙草奶茶/珍珠奶茶深受全国各界茶饮人士喜爱。','13.jpg',16.00,20,1,'2020-12-14 22:39:03',NULL),
(14,3,'红豆布丁烧仙草','红豆和抹茶简直就是最治愈的色彩搭配，抹茶和拿铁的青涩与红豆的软糯香甜在舌尖展开一场巅峰较量，最终化为满满的清香和回味，治愈系的一抹绿，不喝会想念，喝了会思念。','14.jpg',16.00,20,1,'2020-12-14 22:40:40',NULL),
(15,3,'椰果烧仙草','仙草冻、椰果、红豆、珍珠、花生、葡萄干，六种配料，加上定制红茶与甄选牛奶，完美烘托出配料的天然清香，一口尽是层次丰富的满足感。夏日，一杯冰凉的烧仙草就能迅速的赶走一切燥热，寒冬热吃，又能快速驱散寒气。丰富的配料，是对品质的讲究，纯正的味道。','15.jpg',16.00,20,1,'2020-12-14 22:42:09',NULL),
(16,3,'乌龙烧仙草','烤茶为底，细闻有一股微微炭烤焦香风味，初饮会觉得其味微苦，再品则甘甜醇厚，最后一道就觉其唇齿流向，令人回味不止，愈品味道愈美；再以鲜奶为形，珍珠为辅，香气浓郁，口感丰富，既能解渴提神，又能消食行气。','16.jpg',16.00,20,1,'2020-12-14 22:43:25',NULL),
(17,3,'黄金珍奶烧仙草','红茶的香气比鲜叶更明显，滋味醇和甘浓，具有助消化、暖胃、消肿等功能，加入百分百木薯圆珍珠。简单的搭配，却能凸显红茶的醇厚，珍珠的Q弹。','17.jpg',16.00,20,1,'2020-12-14 22:44:30',NULL),
(18,3,'百香凤梨烧仙草','简单泡一泡就可以得到清新好味道的百香果，横冲直撞的酸甜果味，是一场味蕾神经的集体狂欢。果肉在唇齿间摩挲，汁液在口腔爆发，纤维丰富的凤梨果肉，在清新的茶汤中上下沉浮，清晰可见的满足感。宝岛的新鲜红心芭乐，膳食纤维丰富，热量低，饱腹感强，喝起来绵密爽口，甜而不涩，一杯粉红少女心，是藏不住的甜蜜，颜值与内涵并存。','18.jpg',16.00,20,1,'2020-12-14 22:45:38',NULL),
(19,3,'金桔柠檬烧仙草','大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','19.jpg',16.00,20,1,'2020-12-14 22:46:44',NULL),
(20,3,'百香优多烧仙草','百香果不论搭配什么，喝起来都是一种无法言喻的乐趣，加入满满一瓶养乐多，酸涩中多了一份香甜浓郁，让咀嚼的乐趣更加纯粹，满足感MAX。','20.jpg',16.00,20,1,'2020-12-14 22:48:50',NULL),
(21,1,'葡萄柚益菌多','新鲜葡萄柚与益菌多的相遇，少了酸爽苦涩的霸气，却多了清甜浓香的小确幸，酸酸甜甜的滋味在唇齿间流转，青春的气息迎面扑来。一杯葡萄柚，是一夏天的生机力量，是满满的粉红少女心。','21.jpg',14.00,20,1,'2020-12-14 22:50:33',NULL),
(22,2,'柠檬益菌多','青柠+黄柠，淡淡的酸甜，幽幽的清香，与益菌多相融，浓郁加倍，佐以椰果，口感更丰富，刺激着你的嗅觉，勾搭着你懒洋洋、食不思的胃。沉淀在嘴里的凉意好像拂面的风，夏日午后来一杯令人心神清爽。','22.jpg',14.00,20,1,'2020-12-14 22:51:43',NULL),
(23,5,'春燕麦奶益菌多','对自己的宠溺，就是追求嘴巴的满足，又同时达到身体的自律。低糖燕麦与四季春茶的奇妙碰撞，焕然一新的味觉冲击。低脂果腹又能满足味蕾，辛苦一天的你，值得片刻的享受。焦糖味的布丁，稍显浓郁的口感，清爽奶绿正好中和了焦糖的苦涩，像是品一杯独特的甜品，在重复的节奏中寻找一丝久违的新鲜感。','23.jpg',14.00,20,1,'2020-12-14 22:52:54',NULL),
(24,5,'焦糖珍奶益菌多','百分百木薯圆珍珠，全发酵红茶，浓郁焦糖风味，口感舒润醇厚，纵然天生绝配的焦糖+奶茶，也难以拒绝Q弹珍珠的加入，每一杯超越味觉的探索都会让人上瘾。','24.jpg',14.00,20,1,'2020-12-14 22:53:51',NULL),
(25,5,'抹茶红豆益菌多','红豆和抹茶简直就是最治愈的色彩搭配，抹茶和拿铁的青涩与红豆的软糯香甜在舌尖展开一场巅峰较量，最终化为满满的清香和回味。最治愈系的一抹绿，不喝会想念，喝了会思念。','25.jpg',14.00,20,1,'2020-12-14 22:54:53',NULL),
(26,5,'水果茶益菌多','好果配好茶，七种水果，满满的维C，超丰富的味觉体验，四季春茶的清香完全不会掩盖水果的味道，浅闻花果香气浓郁，饮时鲜甜之味，瞬间沁入心间。一口茶一口水果，每一丝都是喜悦的味道，解暑新技能GET。','26.jpg',14.00,20,1,'2020-12-14 22:56:03',NULL),
(27,5,'青柠爱玉益菌多','滑嫩Q爽爱玉冻，淋上清新柠檬汁，酸甜可口，像盛夏林荫道迎面吹来的微风，或像初夏隐约吹进课堂的栀子花香，甜蜜而美好。爱玉冻冰镇更加爽口哦。','27.jpg',14.00,20,1,'2020-12-14 22:56:55',NULL),
(28,5,'红芭乐益菌多','宝岛的新鲜红心芭乐，膳食纤维丰富，热量低，饱腹感强，喝起来绵密爽口，甜而不涩，一杯粉红少女心，是藏不住的甜蜜，颜值与内涵并存。','28.jpg',14.00,20,1,'2020-12-14 22:57:58',NULL),
(29,5,'百香凤梨益菌多','简单泡一泡就可以得到清新好味道的百香果，横冲直撞的酸甜果味，是一场味蕾神经的集体狂欢。果肉在唇齿间摩挲，汁液在口腔爆发，纤维丰富的凤梨果肉，在清新的茶汤中上下沉浮，清晰可见的满足感。宝岛的新鲜红心芭乐，膳食纤维丰富，热量低，饱腹感强，喝起来绵密爽口，甜而不涩，一杯粉红少女心，是藏不住的甜蜜，颜值与内涵并存。','29.jpg',14.00,20,1,'2020-12-14 22:59:08',NULL),
(30,5,'鲜橙益菌多','葡萄柚具有丰富的营养价值，味偏酸苦，但口感舒适；鲜橙的清甜掩盖了葡萄柚的酸苦，每一口都能俘获你内心盛夏的情绪悸动，唤醒你麻木的味觉体验。','30.jpg',14.00,20,1,'2020-12-14 23:00:59',NULL),
(31,1,'杨枝甘露奶昔','现切芒果打成绵密果浆，再混合芒果与西柚的果肉粒，缓缓倒入仙草冻打底的杯中，每一口都是果汁与果肉糅合的香甜。浓郁与甘甜的搭配，是永远品不腻的味道。仿佛电影般色调的分层，镜头中只有一副夕阳西下的水墨画，视野能望到的尽头，天地交融。','31.jpg',15.00,20,1,'2020-12-14 23:02:25',NULL),
(32,2,'小芋圆奶昔','小芋圆烧仙草四川书亦烧仙草作为成都奶茶加盟热销品牌,目前已经拓展到全国饮品市场,直营店多达80多家,烧仙草奶茶加盟店在全国已有2300多家.书亦烧仙草奶茶/珍珠奶茶深受全国各界茶饮人士喜爱。','32.jpg',15.00,20,1,'2020-12-14 23:03:26',NULL),
(33,7,'红豆布丁奶昔','红豆和抹茶简直就是最治愈的色彩搭配，抹茶和拿铁的青涩与红豆的软糯香甜在舌尖展开一场巅峰较量，最终化为满满的清香和回味，治愈系的一抹绿，不喝会想念，喝了会思念。','33.jpg',15.00,20,1,'2020-12-14 23:04:39',NULL),
(34,7,'金菠萝奶昔','金菠萝没有了普通菠萝的酸涩，果肉更饱满多汁，在保留纯粹茉莉清香的同时，甘甜的菠萝，清新和舒畅从喉头滑入，清扫了了疲惫和沉郁，如苔寺一样令人沉醉。','34.jpg',15.00,20,1,'2020-12-14 23:05:43',NULL),
(35,7,'金桔柠檬奶昔','大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','35.jpg',15.00,20,1,'2020-12-14 23:06:40',NULL),
(36,7,'蜂蜜柚子奶昔','大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','36.jpg',15.00,20,1,'2020-12-14 23:07:44',NULL),
(37,7,'水果奶昔','金菠萝没有了普通菠萝的酸涩，果肉更饱满多汁，在保留纯粹茉莉清香的同时，甘甜的菠萝，清新和舒畅从喉头滑入，大片橙肉，颗颗饱满，粒粒新鲜，青桔香气浓郁，酸甜适度，清香满溢，再加入淡淡的绿茶，满杯清爽，仿佛夏日雨后的舒适，一口就能让人迅速沦陷。','37.jpg',15.00,20,1,'2020-12-14 23:08:51',NULL),
(38,7,'芝士蜜香红玉奶昔','咸芝士奶盖茶里的当红小生，第一口感受前段芝士的浓郁细腻，第二口品尝后段红茶馥郁的茶香和略带花香的回甘。浓郁但不油腻，清香又不寡淡，全新的味觉享受。','38.jpg',15.00,20,1,'2020-12-14 23:09:45',NULL),
(39,7,'芝士毛尖奶昔','纯正鲜奶与奶盖粉调制而成，上层近5CM厚的奶盖，未经发酵的绿茶，保留了鲜叶的天然营养。绿茶与芝士的碰撞，清淡又浓烈，温柔又炙热，鲜活又跳跃，每一口都是舌尖的沦陷。','39.jpg',15.00,20,1,'2020-12-14 23:10:43',NULL),
(40,7,'芝士抹茶奶昔','抹茶中的贵族——日本宇治抹茶，无香精，无色素，无防腐剂；新西兰进口安家芝士、淡奶油，纯手工打发，健康0添加。苦涩与柔和的碰撞，从初识便认定了是最佳搭档，芝士控+抹茶控怎能放过！','40.jpg',15.00,20,1,'2020-12-14 23:11:44',NULL),
(41,1,'牛魔王黑砖奶茶','焦糖味的果冻搭配经典混合茶，融合了数种上等茶叶，淡淡的佛手柑芬芳，奶和茶完美的配比，无法诉说的口感，却让人浮想联翩。','41.jpg',16.00,20,1,'2020-12-14 23:12:58',NULL),
(42,2,'芒果布丁奶绿','细腻芒果和布丁搭配，香滑中带着甘甜，美味加倍，每一口都带着愉悦的情绪。当滑嫩的布丁和绵密芒果缓缓的滑过舌尖，芒果布丁的浪漫，瞬间侵入每一个细胞。','42.jpg',16.00,20,1,'2020-12-14 23:13:37',NULL),
(43,4,'那么大焦糖布丁','焦糖味的布丁，稍显浓郁的口感，清爽奶绿正好中和了焦糖的苦涩，像是品一杯独特的甜品，在重复的节奏中寻找一丝久违的新鲜感。','43.jpg',16.00,20,1,'2020-12-14 23:14:41',NULL),
(44,4,'四季春燕麦奶茶','对自己的宠溺，就是追求嘴巴的满足，又同时达到身体的自律。低糖燕麦与四季春茶的奇妙碰撞，焕然一新的味觉冲击。低脂果腹又能满足味蕾，辛苦一天的你，值得片刻的享受。焦糖味的布丁，稍显浓郁的口感，清爽奶绿正好中和了焦糖的苦涩，像是品一杯独特的甜品，在重复的节奏中寻找一丝久违的新鲜感。','44.jpg',16.00,20,1,'2020-12-14 23:15:34',NULL),
(45,4,'焦糖珍奶','百分百木薯圆珍珠，全发酵红茶，浓郁焦糖风味，口感舒润醇厚，纵然天生绝配的焦糖+奶茶，也难以拒绝Q弹珍珠的加入，每一杯超越味觉的探索都会让人上瘾。','45.jpg',16.00,20,1,'2020-12-14 23:16:35',NULL),
(46,4,'抹茶红豆拿铁','红豆和抹茶简直就是最治愈的色彩搭配，抹茶和拿铁的青涩与红豆的软糯香甜在舌尖展开一场巅峰较量，最终化为满满的清香和回味。最治愈系的一抹绿，不喝会想念，喝了会思念。','46.jpg',16.00,20,1,'2020-12-14 23:17:29',NULL),
(47,4,'芝士蜜香红玉','咸芝士奶盖茶里的当红小生，第一口感受前段芝士的浓郁细腻，第二口品尝后段红茶馥郁的茶香和略带花香的回甘。浓郁但不油腻，清香又不寡淡，全新的味觉享受。','47.jpg',16.00,20,1,'2020-12-14 23:18:25',NULL),
(48,4,'芝士毛尖茉莉','纯正鲜奶与奶盖粉调制而成，上层近5CM厚的奶盖，未经发酵的绿茶，保留了鲜叶的天然营养。绿茶与芝士的碰撞，清淡又浓烈，温柔又炙热，鲜活又跳跃，每一口都是舌尖的沦陷。','48.jpg',16.00,20,1,'2020-12-14 23:19:17',NULL),
(49,4,'芝士抹茶','抹茶中的贵族——日本宇治抹茶，无香精，无色素，无防腐剂；新西兰进口安家芝士、淡奶油，纯手工打发，健康0添加。苦涩与柔和的碰撞，从初识便认定了是最佳搭档，芝士控+抹茶控怎能放过！','49.jpg',16.00,20,1,'2020-12-14 23:20:17',NULL),
(50,4,'台湾四季春茶','四季春茶加冰，极致的简单才能凸显原料的新鲜，源于天然的素香淡雅，弥散在炎炎夏日，徘徊在唇齿之间，适合喜爱少糖的健康主义。','50.jpg',16.00,20,1,'2020-12-14 23:21:09',NULL),
(51,8,'冰块','冰块','51.jpg',1.00,40,1,'2020-12-14 23:23:18',NULL),
(52,8,'布丁','布丁','52.jpg',1.00,40,1,'2020-12-14 23:24:03',NULL),
(53,8,'红豆','红豆','53.jpg',1.00,40,1,'2020-12-14 23:24:35',NULL),
(54,8,'红糖','红糖','54.jpg',1.00,40,1,'2020-12-14 23:25:10',NULL),
(55,8,'花生','花生','55.jpg',1.00,40,1,'2020-12-14 23:25:40',NULL),
(56,8,'柠檬','柠檬','56.jpg',1.00,40,1,'2020-12-14 23:26:20',NULL),
(57,8,'椰肉','椰肉','57.jpg',1.00,40,1,'2020-12-14 23:27:04',NULL);

/*Table structure for table `pq_shopping` */

DROP TABLE IF EXISTS `pq_shopping`;

CREATE TABLE `pq_shopping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '收货信息编号,主键且自增',
  `userid` int(11) NOT NULL COMMENT '外键,订单编号,非空,外键,参照pq_orders表',
  `orderid` int(11) NOT NULL COMMENT '外键,用户编号,非空,外键,参照pq_user表',
  `receiver_nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `receiver_name` varchar(30) NOT NULL COMMENT '收货人姓名,非空',
  `receiver_phone` varchar(20) NOT NULL COMMENT '收货人电话,非空',
  `receiver_province` varchar(20) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(20) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) NOT NULL COMMENT '详细地址,非空',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `pq_shopping` */

/*Table structure for table `pq_user` */

DROP TABLE IF EXISTS `pq_user`;

CREATE TABLE `pq_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户编号,主键且自增',
  `username` varchar(30) NOT NULL COMMENT '用户名,唯一,非空',
  `password` varchar(32) NOT NULL COMMENT '用户密码,MD5,非空',
  `nickname` varchar(30) DEFAULT NULL COMMENT '用户昵称',
  `phone` varchar(20) NOT NULL COMMENT '用户手机号码,唯一,非空',
  `create_time` datetime NOT NULL COMMENT '创建时间,非空',
  `update_time` datetime NOT NULL COMMENT '更新时间,非空',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `user_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `pq_user` */

insert  into `pq_user`(`id`,`username`,`password`,`nickname`,`phone`,`create_time`,`update_time`) values 
(1,'xiaoming','e10adc3949ba59abbe56e057f20f883e','小明','17312345678','2020-12-14 22:01:03','2020-12-14 22:01:03'),
(2,'xiaohong','e10adc3949ba59abbe56e057f20f883e','小红','17312345679','2020-12-14 22:01:03','2020-12-14 22:01:03'),
(3,'xiaobai','e10adc3949ba59abbe56e057f20f883e','小白','17312345670','2020-12-17 01:35:10','2020-12-17 01:35:10'),
(4,'xiongjie','25f9e794323b453885f5181f1b624d0b','熊杰','18896029866','2020-12-21 08:19:14','2020-12-21 08:19:14');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

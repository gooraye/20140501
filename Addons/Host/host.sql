-- phpMyAdmin SQL Dump
-- version 4.1.13
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-05-12 08:33:00
-- 服务器版本： 5.1.73-log
-- PHP Version: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wechatdb`
--

-- --------------------------------------------------------

--
-- 表的结构 `wp_host`
--

CREATE TABLE IF NOT EXISTS `wp_host` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `title` varchar(255) NOT NULL COMMENT '商家名称',
  `address` varchar(255) NOT NULL COMMENT '商家地址',
  `tel` varchar(255) NOT NULL COMMENT '商家电话',
  `phone` varchar(255) NOT NULL COMMENT '手机号码',
  `ppicurl` int(10) unsigned NOT NULL COMMENT '订单封面图片',
  `headpic` int(10) unsigned NOT NULL COMMENT '订单页头部图片',
  `name` varchar(255) NOT NULL COMMENT '文字描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '商家图片',
  `url` varchar(255) NOT NULL COMMENT '图片跳转地址以http://开头',
  `info` text NOT NULL COMMENT '商家介绍',
  `info2` text NOT NULL COMMENT '订单说明',
  `ctime` int(10) NOT NULL COMMENT '创建时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `wp_host`
--

INSERT INTO `wp_host` (`id`, `keyword`, `title`, `address`, `tel`, `phone`, `ppicurl`, `headpic`, `name`, `picurl`, `url`, `info`, `info2`, `ctime`, `token`) VALUES
(10, '微酒店', '特价酒店预订', '江苏常州', '8888888', '13961269488', 40, 40, '大气', 81, 'http://www.baidu.com', '金狐网络科技有限公司金狐网络科技有限公司！', '特价酒店预订', 1398069120, '5350cf1032072');

-- --------------------------------------------------------

--
-- 表的结构 `wp_host_guanli`
--

CREATE TABLE IF NOT EXISTS `wp_host_guanli` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_people` varchar(255) NOT NULL COMMENT '预订人',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `hid` int(10) unsigned NOT NULL COMMENT '微酒店ID',
  `openid` varchar(255) NOT NULL COMMENT 'Openid',
  `check_in` int(10) NOT NULL COMMENT '入住时间',
  `time_out` int(10) NOT NULL COMMENT '离开时间',
  `room_type` varchar(255) NOT NULL COMMENT '房间类型',
  `book_time` int(10) NOT NULL COMMENT '预订时间',
  `book_num` char(50) NOT NULL COMMENT '预订数量',
  `price` varchar(255) NOT NULL COMMENT '价格',
  `remarks` text NOT NULL COMMENT '备注',
  `tel` varchar(255) NOT NULL COMMENT '电话',
  `order_status` char(50) NOT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=110 ;

--
-- 转存表中的数据 `wp_host_guanli`
--

INSERT INTO `wp_host_guanli` (`id`, `book_people`, `token`, `hid`, `openid`, `check_in`, `time_out`, `room_type`, `book_time`, `book_num`, `price`, `remarks`, `tel`, `order_status`) VALUES
(109, '下班', '5350cf1032072', 10, 'oa2--uG2Gghi0ZREoxNmUgDcYLno', 0, 0, '标准房', 1399612620, '4', '400', '哈哈', '1399766655', '未到');

-- --------------------------------------------------------

--
-- 表的结构 `wp_host_order`
--

CREATE TABLE IF NOT EXISTS `wp_host_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `hid` int(10) unsigned NOT NULL COMMENT '微酒店ID',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `type` varchar(255) NOT NULL COMMENT '订单类型',
  `typeinfo` varchar(255) NOT NULL COMMENT '简要说明',
  `price` varchar(255) NOT NULL COMMENT '原价',
  `yhprice` varchar(255) NOT NULL COMMENT '优惠价',
  `name` varchar(255) NOT NULL COMMENT '文字描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '图片跳转地址以http://开头',
  `info` text NOT NULL COMMENT '配套设施',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `wp_host_order`
--

INSERT INTO `wp_host_order` (`id`, `hid`, `token`, `type`, `typeinfo`, `price`, `yhprice`, `name`, `picurl`, `url`, `info`) VALUES
(11, 10, '5350cf1032072', '标准房', '大床', '213', '100', '234234', 83, 'http://www.baidu.com', '234324234'),
(10, 10, '5350cf1032072', '商务套房', '123123', '324', '200', '312312', 83, 'http://www.baidu.com', '1231231'),
(12, 10, '5350cf1032072', '标准房', '双人床', '400', '300', '大甩卖', 83, '', '空调，冰箱，卫生间');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-05-15 14:25:29
-- 服务器版本： 5.5.37
-- PHP Version: 5.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wp_dbwx`
--

-- --------------------------------------------------------

--
-- 表的结构 `wp_action`
--

CREATE TABLE IF NOT EXISTS `wp_action` (
`id` int(11) unsigned NOT NULL COMMENT '主键',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '行为说明',
  `remark` char(140) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统行为表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `wp_action`
--

INSERT INTO `wp_action` (`id`, `name`, `title`, `remark`, `rule`, `log`, `type`, `status`, `update_time`) VALUES
(1, 'user_login', '用户登陆', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登陆了管理中心', 1, 1, 1393685660),
(2, 'add_article', '发布文章', '积分+5，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:5', '', 2, 0, 1380173180),
(3, 'review', '评论', '评论积分+1，无限制', 'table:member|field:score|condition:uid={$self}|rule:score+1', '', 2, 1, 1383285646),
(4, 'add_document', '发表文档', '积分+10，每天上限5次', 'table:member|field:score|condition:uid={$self}|rule:score+10|cycle:24|max:5', '[user|get_nickname]在[time|time_format]发表了一篇文章。\r\n表[model]，记录编号[record]。', 2, 0, 1386139726),
(5, 'add_document_topic', '发表讨论', '积分+5，每天上限10次', 'table:member|field:score|condition:uid={$self}|rule:score+5|cycle:24|max:10', '', 2, 0, 1383285551),
(6, 'update_config', '更新配置', '新增或修改或删除配置', '', '', 1, 1, 1383294988),
(7, 'update_model', '更新模型', '新增或修改模型', '', '', 1, 1, 1383295057),
(8, 'update_attribute', '更新属性', '新增或更新或删除属性', '', '', 1, 1, 1383295963),
(9, 'update_channel', '更新导航', '新增或修改或删除导航', '', '', 1, 1, 1383296301),
(10, 'update_menu', '更新菜单', '新增或修改或删除菜单', '', '', 1, 1, 1383296392),
(11, 'update_category', '更新分类', '新增或修改或删除分类', '', '', 1, 1, 1383296765),
(12, 'admin_login', '登陆后台', '管理员登陆后台', '', '[user|get_nickname]在[time|time_format]登陆了后台', 2, 1, 1393685618);

-- --------------------------------------------------------

--
-- 表的结构 `wp_action_log`
--

CREATE TABLE IF NOT EXISTS `wp_action_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `action_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='行为日志表' AUTO_INCREMENT=699 ;

--
-- 转存表中的数据 `wp_action_log`
--

INSERT INTO `wp_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(562, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 16:45登陆了管理中心', 1, 1399193156),
(563, 12, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:00登陆了后台', 1, 1399204846),
(564, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:01登陆了管理中心', 1, 1399204881),
(565, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:05登陆了后台', 1, 1399205126),
(566, 10, 1, 2130706433, 'Menu', 93, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205421),
(567, 10, 1, 2130706433, 'Menu', 2, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205432),
(568, 10, 1, 2130706433, 'Menu', 93, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205481),
(569, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:22登陆了后台', 1, 1399206136),
(570, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:26登陆了后台', 1, 1399206418),
(571, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:36登陆了后台', 1, 1399206986),
(572, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:59登陆了管理中心', 1, 1399208366),
(573, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 21:23登陆了后台', 1, 1399209828),
(574, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-05 09:40登陆了后台', 1, 1399254018),
(575, 1, 162, 2130706433, 'member', 162, 'spa001在2014-05-05 09:42登陆了管理中心', 1, 1399254141),
(576, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 14:47登陆了管理中心', 1, 1399272457),
(577, 12, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:05登陆了后台', 1, 1399273549),
(578, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:18登陆了管理中心', 1, 1399274285),
(579, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-05 15:25登陆了后台', 1, 1399274741),
(580, 10, 1, 2130706433, 'Menu', 2, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399274763),
(581, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:51登陆了管理中心', 1, 1399276268),
(582, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-06 10:56登陆了后台', 1, 1399345017),
(583, 10, 1, 2130706433, 'Menu', 130, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399361794),
(584, 10, 1, 2130706433, 'Menu', 130, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399361854),
(585, 10, 1, 2130706433, 'Menu', 131, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399362791),
(586, 10, 1, 2130706433, 'Menu', 130, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399362825),
(587, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399362991),
(588, 10, 1, 2130706433, 'Menu', 131, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399363814),
(589, 10, 1, 2130706433, 'Menu', 131, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364076),
(590, 10, 1, 2130706433, 'Menu', 131, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364387),
(591, 10, 1, 2130706433, 'Menu', 76, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364722),
(592, 10, 1, 2130706433, 'Menu', 80, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364743),
(593, 10, 1, 2130706433, 'Menu', 63, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364754),
(594, 10, 1, 2130706433, 'Menu', 0, '操作url：/gooraye/20140501/index.php?s=/admin/menu/del.html', 1, 1399364837),
(595, 10, 1, 2130706433, 'Menu', 0, '操作url：/gooraye/20140501/index.php?s=/admin/menu/del/id/76.html', 1, 1399364849),
(596, 10, 1, 2130706433, 'Menu', 131, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399364872),
(597, 10, 1, 2130706433, 'Menu', 132, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399364912),
(598, 10, 1, 2130706433, 'Menu', 133, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399364954),
(599, 10, 1, 2130706433, 'Menu', 134, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399364974),
(600, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399365413),
(601, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399365427),
(602, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399365431),
(603, 10, 1, 2130706433, 'Menu', 135, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399367945),
(604, 10, 1, 2130706433, 'Menu', 136, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368030),
(605, 10, 1, 2130706433, 'Menu', 137, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368051),
(606, 10, 1, 2130706433, 'Menu', 138, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368067),
(607, 10, 1, 2130706433, 'Menu', 139, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368087),
(608, 10, 1, 2130706433, 'Menu', 140, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368100),
(609, 10, 1, 2130706433, 'Menu', 0, '操作url：/gooraye/20140501/index.php?s=/admin/menu/del/id/80.html', 1, 1399368132),
(610, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399368370),
(611, 11, 1, 2130706433, 'category', 2, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399368379),
(612, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/add.html', 1, 1399368656),
(613, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399368684),
(614, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-06 20:27登陆了后台', 1, 1399379253),
(615, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399379298),
(616, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399379384),
(617, 1, 1, 2130706433, 'member', 1, 'admin在2014-05-06 20:30登陆了管理中心', 1, 1399379446),
(618, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-06 20:32登陆了管理中心', 1, 1399379532),
(619, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399380671),
(620, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399381213),
(621, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399381668),
(622, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-07 13:12登陆了后台', 1, 1399439525),
(623, 11, 1, 2130706433, 'category', 2, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399439582),
(624, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399439590),
(625, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399439645),
(626, 11, 1, 2130706433, 'category', 2, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399439667),
(627, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399444328),
(628, 6, 1, 2130706433, 'config', 10, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399451392),
(629, 11, 1, 2130706433, 'category', 1, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399453851),
(630, 11, 1, 2130706433, 'category', 41, '操作url：/gooraye/20140501/index.php?s=/admin/category/add.html', 1, 1399453924),
(631, 11, 1, 2130706433, 'category', 42, '操作url：/gooraye/20140501/index.php?s=/admin/category/add.html', 1, 1399453966),
(632, 9, 1, 2130706433, 'channel', 9, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399454585),
(633, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 19:58登陆了后台', 1, 1399463925),
(634, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:03登陆了后台', 1, 1399464233),
(635, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:04登陆了后台', 1, 1399464240),
(636, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:04登陆了后台', 1, 1399464250),
(637, 6, 1, 2130706433, 'config', 47, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399464282),
(638, 6, 1, 2130706433, 'config', 13, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399466330),
(639, 6, 1, 2130706433, 'config', 13, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399467752),
(640, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 11:13登陆了后台', 1, 1399518820),
(641, 11, 1, 2130706433, 'category', 42, '操作url：/gooraye/20140501/index.php?s=/admin/category/remove/id/42.html', 1, 1399519056),
(642, 11, 1, 2130706433, 'category', 43, '操作url：/gooraye/20140501/index.php?s=/admin/category/add.html', 1, 1399519081),
(643, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 14:37登陆了后台', 1, 1399531020),
(644, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 14:47登陆了后台', 1, 1399531636),
(645, 11, 1, 2130706433, 'category', 43, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399532164),
(646, 9, 1, 2130706433, 'channel', 6, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399532237),
(647, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 15:33登陆了后台', 1, 1399534399),
(648, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 19:39登陆了后台', 1, 1399549167),
(649, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-08 19:47登陆了管理中心', 1, 1399549633),
(650, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-08 20:17登陆了后台', 1, 1399551450),
(651, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-08 20:20登陆了后台', 1, 1399551613),
(652, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-08 20:29登陆了管理中心', 1, 1399552179),
(653, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 09:44登陆了管理中心', 1, 1399599892),
(654, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 10:11登陆了后台', 1, 1399601503),
(655, 10, 1, 2061514924, 'Menu', 130, '操作url：/index.php?s=/admin/menu/edit.html', 1, 1399603313),
(656, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 11:17登陆了管理中心', 1, 1399605469),
(657, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 11:26登陆了管理中心', 1, 1399606004),
(658, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 15:32登陆了后台', 1, 1399620766),
(659, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 15:34登陆了管理中心', 1, 1399620898),
(660, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 15:53登陆了后台', 1, 1399622036),
(661, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 15:54登陆了管理中心', 1, 1399622065),
(662, 10, 1, 2061514924, 'Menu', 142, '操作url：/index.php?s=/admin/menu/add.html', 1, 1399641871),
(663, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 22:11登陆了管理中心', 1, 1399644683),
(664, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 22:18登陆了后台', 1, 1399645136),
(665, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-10 19:36登陆了后台', 1, 1399721762),
(666, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-10 19:37登陆了管理中心', 1, 1399721847),
(667, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-10 20:12登陆了后台', 1, 1399723963),
(668, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399724096),
(669, 8, 1, 2061514924, 'attribute', 202, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399724980),
(670, 8, 1, 2061514924, 'attribute', 237, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399725954),
(671, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399731068),
(672, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399731085),
(673, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-12 10:35登陆了管理中心', 1, 1399862145),
(674, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-12 11:24登陆了后台', 1, 1399865062),
(675, 6, 1, 2061514924, 'config', 0, '操作url：/index.php?s=/admin/config/del/id/48.html', 1, 1399865168),
(676, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-12 13:12登陆了管理中心', 1, 1399871550),
(677, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-12 15:21登陆了管理中心', 1, 1399879319),
(678, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-13 09:28登陆了管理中心', 1, 1399944520),
(679, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-14 08:03登陆了管理中心', 1, 1400025832),
(680, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-14 09:12登陆了后台', 1, 1400029959),
(681, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-14 09:18登陆了后台', 1, 1400030294),
(682, 1, 164, 2130706433, 'member', 164, 'dwyspa在2014-05-14 09:46登陆了管理中心', 1, 1400031985),
(683, 1, 164, 2130706433, 'member', 164, 'dwyspa在2014-05-14 09:48登陆了管理中心', 1, 1400032104),
(684, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-14 10:14登陆了后台', 1, 1400033696),
(685, 7, 1, 2130706433, 'model', 38, '操作url：/gooraye/20140501/index.php?s=/admin/model/update.html', 1, 1400033748),
(686, 8, 1, 2130706433, 'attribute', 238, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400033792),
(687, 8, 1, 2130706433, 'attribute', 239, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400033841),
(688, 8, 1, 2130706433, 'attribute', 240, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400033899),
(689, 8, 1, 2130706433, 'attribute', 241, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400033946),
(690, 8, 1, 2130706433, 'attribute', 242, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400033973),
(691, 8, 1, 2130706433, 'attribute', 243, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400034004),
(692, 8, 1, 2130706433, 'attribute', 244, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400034034),
(693, 8, 1, 2130706433, 'attribute', 245, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400034055),
(694, 1, 164, 2130706433, 'member', 164, 'dwyspa在2014-05-14 10:22登陆了管理中心', 1, 1400034134),
(695, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-14 11:02登陆了后台', 1, 1400036538),
(696, 8, 1, 2130706433, 'attribute', 246, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1400036905),
(697, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-14 19:32登陆了管理中心', 1, 1400067145),
(698, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-15 08:49登陆了管理中心', 1, 1400114969);

-- --------------------------------------------------------

--
-- 表的结构 `wp_addons`
--

CREATE TABLE IF NOT EXISTS `wp_addons` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `config` text COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台列表',
  `type` tinyint(1) DEFAULT '0' COMMENT '插件类型 0 普通插件 1 微信插件 2 易信插件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `wp_addons`
--

INSERT INTO `wp_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`, `type`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 0, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512015, 0, 0),
(22, 'DevTeam', '开发团队信息', '开发团队成员信息', 0, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1391687096, 0, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1, 0),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"1910490","comment_short_name_duoshuo":"","comment_form_pos_duoshuo":"buttom","comment_data_list_duoshuo":"10","comment_data_order_duoshuo":"asc"}', 'thinkphp', '0.1', 1380273962, 0, 0),
(16, 'Vote', '投票', '支持文本和图片两类的投票功能', 1, '{"random":"1"}', '地下凡星', '0.1', 1388811198, 1, 1),
(17, 'Chat', '智能聊天', '通过网络上支持的智能API，实现：天气、翻译、藏头诗、笑话、歌词、计算、域名信息/备案/收录查询、IP查询、手机号码归属、人工智能聊天等功能', 1, '{"simsim_key":"41250a68-3cb5-43c8-9aa2-d7b3caf519b1","simsim_url":"http:\\/\\/sandbox.api.simsimi.com\\/request.p","i9_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","rand_reply":"\\u6211\\u4eca\\u5929\\u7d2f\\u4e86\\uff0c\\u660e\\u5929\\u518d\\u966a\\u4f60\\u804a\\u5929\\u5427\\r\\n\\u54c8\\u54c8~~\\r\\n\\u4f60\\u8bdd\\u597d\\u591a\\u554a\\uff0c\\u4e0d\\u8ddf\\u4f60\\u804a\\u4e86\\r\\n\\u867d\\u7136\\u4e0d\\u61c2\\uff0c\\u4f46\\u89c9\\u5f97\\u4f60\\u8bf4\\u5f97\\u5f88\\u5bf9\\r\\n"}', '地下凡星', '0.1', 1389454867, 0, 1),
(18, 'Wecome', '欢迎语', '用户关注公众号时发送的欢迎信息，支持文本，图片，图文的信息', 1, '{"type":"2","title":"ttt","description":"ttt","pic_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","url":"ttt"}', '地下凡星', '0.1', 1389620372, 0, 1),
(19, 'UserCenter', '微信用户中心', '实现3G首页、微信登陆，微信用户绑定，微信用户信息初始化等基本功能', 1, '{"need_truename":"0","need_mobile":"1"}', '地下凡星', '0.1', 1390660425, 1, 1),
(24, 'BaiduStatistics', '百度统计', '这是百度统计功能，只要开启插件并设置统计代码，就可以使用统计功能了', 1, '{"code":"<script type=\\\\\\"text\\/javascript\\\\\\">\\r\\nvar _bdhmProtocol = ((\\\\\\"https:\\\\\\" == document.location.protocol) ? \\\\\\" https:\\/\\/\\\\\\" : \\\\\\" http:\\/\\/\\\\\\");\\r\\ndocument.write(unescape(\\\\\\"%3Cscript src=\\\\''\\\\\\" + _bdhmProtocol + \\\\\\"hm.baidu.com\\/h.js%3F0cf1c3c27eeb3be94102e955574a5a4e\\\\'' type=\\\\''text\\/javascript\\\\''%3E%3C\\/script%3E\\\\\\"));\\r\\n<\\/script>"}', 'weiphp.cn', '1.0', 1393116011, 0, 0),
(43, 'ReturnTop', '返回顶部', '返回顶部', 1, '{"theme":"1"}', '丁丁', '0.1', 1399277452, 0, 0),
(34, 'Suggestions', '建议意见', '用户在微信里输入“建议意见”四个字时，返回一个图文信息，引导用户进入填写建议意见的3G页面，用户填写信息提交后显示感谢之意并提示关闭页面返回微信\r\n管理员可以在管理中心里看到用户反馈的内容列表，并对内容进行编辑，删除操作', 1, '{"need_truename":"0","need_mobile":"0"}', '地下凡星', '0.1', 1394264727, 1, 1),
(29, 'Robot', '机器人聊天', '实现的效果如下 用户输入：“机器人学习时间” 微信回复：“你的问题是？” 用户输入：“这个世界上谁最美？” 微信回复： “你的答案是？” 用户回复： “当然是你啦！” 微信回复：“我明白啊，不信你可以问问我” 用户回复：“这个世界上谁最美？” 微信回复：“当然是你啦！”', 0, 'null', '地下凡星', '0.1', 1393668441, 0, 1),
(37, 'Extensions', '融合第三方', '第三方功能扩展', 1, 'null', '地下凡星', '0.1', 1394266309, 1, 1),
(38, 'CustomReply', '自定义回复', '支持图文回复、多图文回复、文本回复功能', 1, 'null', '凡星', '0.1', 1399209877, 1, 1),
(39, 'Leaflets', '微信宣传页', '微信公众号二维码推广页面，用作推广或者制作广告易拉宝，可以发布到QQ群微博博客论坛等等...', 1, '{"title":"WeiPHP\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7","img":"","info":"\\u5fae\\u4fe1\\u8425\\u9500\\u7ba1\\u7406\\u5e73\\u53f0\\u4e3a\\u4e2a\\u4eba\\u548c\\u4f01\\u4e1a\\u63d0\\u4f9b\\u57fa\\u4e8e\\u5fae\\u4fe1\\u516c\\u4f17\\u5e73\\u53f0\\u7684\\u4e00\\u7cfb\\u5217\\u529f\\u80fd\\uff0c\\u5305\\u62ec\\u667a\\u80fd\\u56de\\u590d\\u3001\\u5fae\\u4fe13G\\u7f51\\u7ad9\\u3001\\u4e92\\u52a8\\u8425\\u9500\\u6d3b\\u52a8\\uff0c\\u4f1a\\u5458\\u7ba1\\u7406\\uff0c\\u5728\\u7ebf\\u8ba2\\u5355\\uff0c\\u6570\\u636e\\u7edf\\u8ba1\\u7b49\\u7cfb\\u7edf\\u529f\\u80fd,\\u5e26\\u7ed9\\u4f60\\u5168\\u65b0\\u7684\\u5fae\\u4fe1\\u4e92\\u52a8\\u8425\\u9500\\u4f53\\u9a8c\\u3002","copyright":"\\u00a92001-2013 WeiPHP\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u7248\\u6743\\u6240\\u6709"}', '凡星', '0.1', 1399209886, 0, 1),
(40, 'WeiSite', '微官网', '微3G网站、支持分类管理，文章管理、底部导航管理、微信引导信息配置，微网站统计代码部署。同时支持首页多模板切换、信息列表多模板切换、信息详情模板切换、底部导航多模板切换。并配置有详细的模板二次开发教程', 1, '{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875","cover":"","info":"","background":"","code":"","template_index":"ColorV1","template_footer":"V1","template_lists":"V1","template_detail":"V1"}', '凡星', '0.1', 1399209902, 0, 1),
(41, 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', 1, 'null', '凡星', '0.1', 1399209906, 1, 1),
(42, 'Card', '会员卡', '提供会员卡基本功能：会员卡制作、会员管理、通知发布、优惠券发布等功能，用户可在此基础上扩展自己的具体业务需求，如积分、充值、签到等', 1, '{"background":"1","title":"\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97VIP\\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97VIP\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97\\u6240\\u6709","address":"","phone":"","url":"","background_custom":null}', '凡星', '0.1', 1399209910, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_attachment`
--

CREATE TABLE IF NOT EXISTS `wp_attachment` (
`id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `dir` int(12) unsigned NOT NULL DEFAULT '0' COMMENT '上级目录ID',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_attribute`
--

CREATE TABLE IF NOT EXISTS `wp_attribute` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '字段名',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '字段注释',
  `field` varchar(100) NOT NULL DEFAULT '' COMMENT '字段定义',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '数据类型',
  `value` varchar(100) NOT NULL DEFAULT '' COMMENT '字段默认值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `is_must` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否必填',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `validate_rule` varchar(255) NOT NULL,
  `validate_time` tinyint(1) unsigned NOT NULL,
  `error_info` varchar(100) NOT NULL,
  `validate_type` varchar(25) NOT NULL,
  `auto_rule` varchar(100) NOT NULL,
  `auto_time` tinyint(1) unsigned NOT NULL,
  `auto_type` varchar(25) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=247 ;

--
-- 转存表中的数据 `wp_attribute`
--

INSERT INTO `wp_attribute` (`id`, `name`, `title`, `field`, `type`, `value`, `remark`, `is_show`, `extra`, `model_id`, `is_must`, `status`, `update_time`, `create_time`, `validate_rule`, `validate_time`, `error_info`, `validate_type`, `auto_rule`, `auto_time`, `auto_type`) VALUES
(1, 'uid', '用户ID', 'int(10) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1384508362, 1383891233, '', 0, '', '', '', 0, ''),
(2, 'name', '标识', 'char(40) NOT NULL ', 'string', '', '同一根节点下标识不重复', 1, '', 1, 0, 1, 1383894743, 1383891233, '', 0, '', '', '', 0, ''),
(3, 'title', '标题', 'char(80) NOT NULL ', 'string', '', '文档标题', 1, '', 1, 0, 1, 1383894778, 1383891233, '', 0, '', '', '', 0, ''),
(4, 'category_id', '所属分类', 'int(10) unsigned NOT NULL ', 'string', '', '', 0, '', 1, 0, 1, 1384508336, 1383891233, '', 0, '', '', '', 0, ''),
(5, 'description', '描述', 'char(140) NOT NULL ', 'textarea', '', '', 1, '', 1, 0, 1, 1383894927, 1383891233, '', 0, '', '', '', 0, ''),
(6, 'root', '根节点', 'int(10) unsigned NOT NULL ', 'num', '0', '该文档的顶级文档编号', 0, '', 1, 0, 1, 1384508323, 1383891233, '', 0, '', '', '', 0, ''),
(7, 'pid', '所属ID', 'int(10) unsigned NOT NULL ', 'num', '0', '父文档编号', 0, '', 1, 0, 1, 1384508543, 1383891233, '', 0, '', '', '', 0, ''),
(8, 'model_id', '内容模型ID', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '该文档所对应的模型', 0, '', 1, 0, 1, 1384508350, 1383891233, '', 0, '', '', '', 0, ''),
(9, 'type', '内容类型', 'tinyint(3) unsigned NOT NULL ', 'select', '2', '', 1, '1:目录\r\n2:主题\r\n3:段落', 1, 0, 1, 1384511157, 1383891233, '', 0, '', '', '', 0, ''),
(10, 'position', '推荐位', 'smallint(5) unsigned NOT NULL ', 'checkbox', '0', '多个推荐则将其推荐值相加', 1, '1:列表推荐\r\n2:频道页推荐\r\n4:首页推荐', 1, 0, 1, 1383895640, 1383891233, '', 0, '', '', '', 0, ''),
(11, 'link_id', '外链', 'int(10) unsigned NOT NULL ', 'num', '0', '0-非外链，大于0-外链ID,需要函数进行链接与编号的转换', 1, '', 1, 0, 1, 1383895757, 1383891233, '', 0, '', '', '', 0, ''),
(12, 'cover_id', '封面', 'int(10) unsigned NOT NULL ', 'picture', '0', '0-无封面，大于0-封面图片ID，需要函数处理', 1, '', 1, 0, 1, 1384147827, 1383891233, '', 0, '', '', '', 0, ''),
(13, 'display', '可见性', 'tinyint(3) unsigned NOT NULL ', 'radio', '1', '', 1, '0:不可见\r\n1:所有人可见', 1, 0, 1, 1386662271, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(14, 'deadline', '截至时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '0-永久有效', 1, '', 1, 0, 1, 1387163248, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(15, 'attach', '附件数量', 'tinyint(3) unsigned NOT NULL ', 'num', '0', '', 0, '', 1, 0, 1, 1387260355, 1383891233, '', 0, '', 'regex', '', 0, 'function'),
(16, 'view', '浏览量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895835, 1383891233, '', 0, '', '', '', 0, ''),
(17, 'comment', '评论数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 1, 0, 1, 1383895846, 1383891233, '', 0, '', '', '', 0, ''),
(18, 'extend', '扩展统计字段', 'int(10) unsigned NOT NULL ', 'num', '0', '根据需求自行使用', 0, '', 1, 0, 1, 1384508264, 1383891233, '', 0, '', '', '', 0, ''),
(19, 'level', '优先级', 'int(10) unsigned NOT NULL ', 'num', '0', '越高排序越靠前', 1, '', 1, 0, 1, 1383895894, 1383891233, '', 0, '', '', '', 0, ''),
(20, 'create_time', '创建时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 1, '', 1, 0, 1, 1383895903, 1383891233, '', 0, '', '', '', 0, ''),
(21, 'update_time', '更新时间', 'int(10) unsigned NOT NULL ', 'datetime', '0', '', 0, '', 1, 0, 1, 1384508277, 1383891233, '', 0, '', '', '', 0, ''),
(22, 'status', '数据状态', 'tinyint(4) NOT NULL ', 'radio', '0', '', 0, '-1:删除\r\n0:禁用\r\n1:正常\r\n2:待审核\r\n3:草稿', 1, 0, 1, 1384508496, 1383891233, '', 0, '', '', '', 0, ''),
(23, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 2, 0, 1, 1384511049, 1383891243, '', 0, '', '', '', 0, ''),
(24, 'content', '文章内容', 'text NOT NULL ', 'editor', '', '', 1, '', 2, 0, 1, 1383896225, 1383891243, '', 0, '', '', '', 0, ''),
(25, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '参照display方法参数的定义', 1, '', 2, 0, 1, 1383896190, 1383891243, '', 0, '', '', '', 0, ''),
(26, 'bookmark', '收藏数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 2, 0, 1, 1383896103, 1383891243, '', 0, '', '', '', 0, ''),
(27, 'parse', '内容解析类型', 'tinyint(3) unsigned NOT NULL ', 'select', '0', '', 0, '0:html\r\n1:ubb\r\n2:markdown', 3, 0, 1, 1387260461, 1383891252, '', 0, '', 'regex', '', 0, 'function'),
(28, 'content', '下载详细描述', 'text NOT NULL ', 'editor', '', '', 1, '', 3, 0, 1, 1383896438, 1383891252, '', 0, '', '', '', 0, ''),
(29, 'template', '详情页显示模板', 'varchar(100) NOT NULL ', 'string', '', '', 1, '', 3, 0, 1, 1383896429, 1383891252, '', 0, '', '', '', 0, ''),
(30, 'file_id', '文件ID', 'int(10) unsigned NOT NULL ', 'file', '0', '需要函数处理', 1, '', 3, 0, 1, 1383896415, 1383891252, '', 0, '', '', '', 0, ''),
(31, 'download', '下载次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 3, 0, 1, 1383896380, 1383891252, '', 0, '', '', '', 0, ''),
(32, 'size', '文件大小', 'bigint(20) unsigned NOT NULL ', 'num', '0', '单位bit', 1, '', 3, 0, 1, 1383896371, 1383891252, '', 0, '', '', '', 0, ''),
(34, 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 1, 1, 1388815953, 1388815953, '', 3, '', 'regex', '', 3, 'function'),
(35, 'addon', '关键词所属插件', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 5, 1, 1, 1388816207, 1388816207, '', 3, '', 'regex', '', 3, 'function'),
(36, 'aim_id', '插件表里的ID值', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 5, 1, 1, 1388816287, 1388816287, '', 3, '', 'regex', '', 3, 'function'),
(37, 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 5, 0, 1, 1388816392, 1388816392, '', 1, '', 'regex', 'time', 1, 'function'),
(38, 'keyword', '关键词', 'varchar(50) NOT NULL', 'string', '', '用户在微信里回复此关键词将会触发此投票。', 1, '', 6, 1, 1, 1392969972, 1388930888, 'keyword_unique', 1, '此关键词已经存在，请换成别的关键词再试试', 'function', '', 3, 'function'),
(39, 'title', '投票标题', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 6, 1, 1, 1388931041, 1388931041, '', 3, '', 'regex', '', 3, 'function'),
(40, 'description', '投票描述', 'text NOT NULL', 'editor', '', '', 1, '', 6, 0, 1, 1388931173, 1388931173, '', 3, '', 'regex', '', 3, 'function'),
(41, 'picurl', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '支持JPG、PNG格式，较好的效果为大图360*200，小图200*200', 1, '', 6, 0, 1, 1388931285, 1388931285, '', 3, '', 'regex', '', 3, 'function'),
(42, 'type', '选择类型', 'char(10) NOT NULL', 'radio', '0', '', 1, '0:单选\r\n1:多选', 6, 1, 1, 1388936429, 1388931487, '', 3, '', 'regex', '', 3, 'function'),
(43, 'start_date', '开始日期', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 6, 0, 1, 1388931734, 1388931734, '', 3, '', 'regex', '', 3, 'function'),
(44, 'end_date', '结束日期', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 6, 0, 1, 1388931769, 1388931769, '', 3, '', 'regex', '', 3, 'function'),
(45, 'is_img', '文字/图片投票', 'tinyint(2) NOT NULL', 'radio', '0', '', 0, '0:文字投票\r\n1:图片投票', 6, 1, 1, 1389081985, 1388931941, '', 3, '', 'regex', '', 3, 'function'),
(46, 'vote_count', '投票数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 6, 0, 1, 1388932035, 1388932035, '', 3, '', 'regex', '', 3, 'function'),
(47, 'cTime', '投票创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 6, 1, 1, 1388932128, 1388932128, '', 1, '', 'regex', 'time', 3, 'function'),
(48, 'vote_id', '投票ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 4, '', 7, 1, 1, 1388982678, 1388933478, '', 3, '', 'regex', '$_REQUEST[''vote_id'']', 3, 'string'),
(49, 'name', '选项标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 7, 1, 1, 1388933552, 1388933552, '', 3, '', 'regex', '', 3, 'function'),
(50, 'image', '图片选项', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 5, '', 7, 0, 1, 1388984467, 1388933679, '', 3, '', 'regex', '', 3, 'function'),
(51, 'opt_count', '当前选项投票数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 7, 0, 1, 1388933860, 1388933860, '', 3, '', 'regex', '', 3, 'function'),
(52, 'order', '选项排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 7, 0, 1, 1388933951, 1388933951, '', 3, '', 'regex', '', 3, 'function'),
(53, 'vote_id', '投票ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 8, 1, 1, 1388934189, 1388934189, '', 3, '', 'regex', '', 3, 'function'),
(54, 'user_id', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 8, 0, 1, 1388934265, 1388934265, '', 3, '', 'regex', '', 3, 'function'),
(55, 'token', '用户TOKEN', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 8, 0, 1, 1388934296, 1388934296, '', 3, '', 'regex', '', 3, 'function'),
(56, 'options', '选择选项', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 8, 1, 1, 1388934351, 1388934351, '', 3, '', 'regex', '', 3, 'function'),
(57, 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 8, 0, 1, 1388934413, 1388934392, '', 3, '', 'regex', 'time', 3, 'function'),
(58, 'mTime', '更新时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 6, 0, 1, 1390634006, 1390634006, '', 3, '', 'regex', '', 3, 'function'),
(78, 'is_use', '是否为当前公众号', 'tinyint(2) NOT NULL', 'bool', '0', '', 0, '0:否\r\n1:是', 11, 0, 1, 1391682184, 1391682184, '', 3, '', 'regex', '', 3, 'function'),
(77, 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', 0, '', 11, 0, 1, 1392946897, 1391597344, '', 3, '', 'unique', '', 3, 'function'),
(66, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 6, 0, 1, 1391397388, 1391397388, '', 3, '', 'regex', '', 3, 'function'),
(67, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 5, 0, 1, 1391399528, 1391399528, '', 3, '', 'regex', '', 3, 'function'),
(68, 'uid', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 11, 1, 1, 1391575873, 1391575210, '', 3, '', 'regex', 'get_mid', 1, 'function'),
(69, 'public_name', '公众号名称', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 11, 1, 1, 1391576452, 1391575955, '', 3, '', 'regex', '', 3, 'function'),
(70, 'public_id', '公众号原始id', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 11, 1, 1, 1391576472, 1391576015, '', 3, '', 'regex', '', 3, 'function'),
(71, 'wechat', '微信号', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 11, 1, 1, 1391576484, 1391576144, '', 3, '', 'regex', '', 3, 'function'),
(72, 'interface_url', '接口地址', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 11, 0, 1, 1392946881, 1391576234, '', 3, '', 'regex', '', 3, 'function'),
(73, 'headface_url', '公众号头像', 'varchar(255) NOT NULL', 'picture', '', '', 1, '', 11, 0, 1, 1391599849, 1391576300, '', 3, '', 'regex', '', 3, 'function'),
(74, 'area', '地区', 'varchar(50) NOT NULL', 'string', '', '', 0, '', 11, 0, 1, 1392946934, 1391576435, '', 3, '', 'regex', '', 3, 'function'),
(75, 'addon_config', '插件配置', 'text NOT NULL', 'textarea', '', '', 0, '', 11, 0, 1, 1391576537, 1391576537, '', 3, '', 'regex', '', 3, 'function'),
(76, 'addon_status', '插件状态', 'text NOT NULL', 'textarea', '', '', 0, '', 11, 0, 1, 1391576571, 1391576571, '', 3, '', 'regex', '', 3, 'function'),
(89, 'extra_text', '文本扩展字段', 'text NOT NULL', 'textarea', '', '', 0, '', 5, 0, 1, 1393662454, 1393662454, '', 3, '', 'regex', '', 3, 'function'),
(90, 'extra_int', '数据扩展字段', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 5, 0, 1, 1393662500, 1393662500, '', 3, '', 'regex', '', 3, 'function'),
(91, 'secret', 'Secret', 'varchar(255) NOT NULL', 'string', '', '认证服务号的Secret', 1, '', 11, 0, 1, 1393718806, 1393718806, '', 3, '', 'regex', '', 3, 'function'),
(92, 'appid', 'AppId', 'varchar(255) NOT NULL', 'string', '', '认证服务号的AppId', 1, '', 11, 0, 1, 1393718830, 1393718735, '', 3, '', 'regex', '', 3, 'function'),
(93, 'type', '公众号类型', 'char(10) NOT NULL', 'radio', '0', '', 1, '0:订阅号\r\n1:服务号', 11, 0, 1, 1393718575, 1393718575, '', 3, '', 'regex', '', 3, 'function'),
(94, 'group_id', '等级ID', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 11, 0, 1, 1397743123, 1393724468, '', 3, '', 'regex', '', 3, 'function'),
(105, 'title', '等级名', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 14, 0, 1, 1393724854, 1393724854, '', 3, '', 'regex', '', 3, 'function'),
(106, 'addon_status', '插件权限', 'text NOT NULL', 'checkbox', '', '', 1, '1:好人\r\n2:环境', 14, 0, 1, 1393731903, 1393725072, '', 3, '', 'regex', '', 3, 'function'),
(107, 'version', '版本号', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 1, '', 15, 1, 1, 1393770457, 1393770457, '', 3, '', 'regex', '', 3, 'function'),
(108, 'title', '升级包名', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 15, 1, 1, 1393770499, 1393770499, '', 3, '', 'regex', '', 3, 'function'),
(109, 'description', '描述', 'text NOT NULL', 'textarea', '', '', 1, '', 15, 0, 1, 1393770546, 1393770546, '', 3, '', 'regex', '', 3, 'function'),
(110, 'create_date', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 15, 0, 1, 1393770591, 1393770591, '', 3, '', 'regex', '', 3, 'function'),
(111, 'download_count', '下载统计', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 15, 0, 1, 1393770659, 1393770659, '', 3, '', 'regex', '', 3, 'function'),
(112, 'package', '升级包地址', 'varchar(255) NOT NULL', 'textarea', '', '', 1, '', 15, 1, 1, 1393812247, 1393770727, '', 3, '', 'regex', '', 3, 'function'),
(113, 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格格开', 1, '', 16, 1, 1, 1393912492, 1393911842, '', 3, '', 'regex', '', 3, 'function'),
(114, 'keyword_filter', '关键词过滤', 'tinyint(2) NOT NULL', 'bool', '0', '如设置电影为触发词,用户输入 电影 美国派 时，如果启用过滤只将美国派这个词发送到的你的接口，如果不过滤 就是整个 电影 美国派全部发送到的接口', 1, '0:不过滤 1:过滤', 16, 0, 1, 1393914345, 1393912057, '', 3, '', 'regex', '', 3, 'function'),
(115, 'output_format', '数据输出格式', 'tinyint(1) NULL', 'select', '0', '', 1, '0:标准微信xml\r\n1:json格式', 16, 0, 1, 1393912288, 1393912288, '', 3, '', 'regex', '', 3, 'function'),
(116, 'api_url', '第三方URL', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 16, 0, 1, 1393912354, 1393912354, '', 3, '', 'regex', '', 3, 'function'),
(117, 'api_token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 16, 0, 1, 1393922455, 1393912408, '', 3, '', 'regex', '', 3, 'function'),
(118, 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 16, 0, 1, 1393913608, 1393913608, '', 3, '', 'regex', 'time', 1, 'function'),
(119, 'keyword_lenght', '关键词长度', 'int(10) UNSIGNED NULL', 'num', '0', '', 0, '', 5, 0, 1, 1393918566, 1393918566, '', 3, '', 'regex', '', 3, 'function'),
(120, 'keyword_type', '匹配类型', 'tinyint(2) NULL', 'select', '0', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 5, 0, 1, 1393979962, 1393919686, '', 3, '', 'regex', '', 3, 'function'),
(121, 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 16, 0, 1, 1393921652, 1393921586, '', 3, '', 'regex', '', 3, 'function'),
(150, 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 21, 0, 1, 1393234678, 1393234678, '', 3, '', 'regex', 'time', 1, 'function'),
(151, 'content', '内容', 'text NOT NULL', 'textarea', '', '', 1, '', 21, 1, 1, 1393234583, 1393234583, '', 3, '', 'regex', '', 3, 'function'),
(152, 'uid', '用户ID', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 21, 0, 1, 1393234534, 1393234534, '', 3, '', 'regex', 'get_mid', 1, 'function'),
(173, 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '0', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 24, 0, 1, 1393921652, 1393921586, '', 3, '', 'regex', '', 3, 'function'),
(172, 'cTime', '创建时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 24, 0, 1, 1393913608, 1393913608, '', 3, '', 'regex', 'time', 1, 'function'),
(171, 'api_token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1393922455, 1393912408, '', 3, '', 'regex', '', 3, 'function'),
(169, 'output_format', '数据输出格式', 'tinyint(1) NULL', 'select', '0', '', 1, '0:标准微信xml\n\n1:json格式', 24, 0, 1, 1393912288, 1393912288, '', 3, '', 'regex', '', 3, 'function'),
(170, 'api_url', '第三方URL', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 24, 0, 1, 1393912354, 1393912354, '', 3, '', 'regex', '', 3, 'function'),
(167, 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格格开', 1, '', 24, 1, 1, 1393912492, 1393911842, '', 3, '', 'regex', '', 3, 'function'),
(168, 'keyword_filter', '关键词过滤', 'tinyint(2) NOT NULL', 'bool', '0', '如设置电影为触发词,用户输入 电影 美国派 时，如果启用过滤只将美国派这个词发送到的你的接口，如果不过滤 就是整个 电影 美国派全部发送到的接口', 1, '0:不过滤\n\n1:过滤', 24, 0, 1, 1393914345, 1393912057, '', 3, '', 'regex', '', 3, 'function'),
(174, 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 28, 0, 1, 1396602514, 1396602514, '', 3, '', 'regex', '', 3, 'function'),
(175, 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 28, 0, 1, 1396602706, 1396602548, '', 3, '', 'regex', '', 3, 'function'),
(176, 'mult_ids', '多图文ID', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 28, 0, 1, 1396602601, 1396602578, '', 3, '', 'regex', '', 3, 'function'),
(177, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 28, 0, 1, 1396602821, 1396602821, '', 3, '', 'regex', 'get_token', 1, 'function'),
(178, 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 29, 1, 1, 1396061575, 1396061575, '', 3, '', 'regex', '', 3, 'function'),
(179, 'keyword_type', '关键词类型', 'tinyint(2) NULL', 'select', '', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 29, 0, 1, 1396061814, 1396061765, '', 3, '', 'regex', '', 3, 'function'),
(180, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 29, 1, 1, 1396061877, 1396061859, '', 3, '', 'regex', '', 3, 'function'),
(181, 'intro', '简介', 'text NULL', 'textarea', '', '', 1, '', 29, 0, 1, 1396061947, 1396061947, '', 3, '', 'regex', '', 3, 'function'),
(182, 'cate_id', '所属类别', 'int(10) UNSIGNED NULL', 'select', '0', '要先在微官网分类里配置好分类才可选择', 1, '0:请选择分类', 29, 0, 1, 1396078914, 1396062003, '', 3, '', 'regex', '', 3, 'function'),
(183, 'cover', '封面图片', 'int(10) UNSIGNED NULL', 'picture', '', '', 1, '', 29, 0, 1, 1396062093, 1396062093, '', 3, '', 'regex', '', 3, 'function'),
(184, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 29, 0, 1, 1396062146, 1396062146, '', 3, '', 'regex', '', 3, 'function'),
(185, 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', 0, '', 29, 0, 1, 1396075102, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(186, 'sort', '排序号', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数值越小越靠前', 1, '', 29, 0, 1, 1396510508, 1396510508, '', 3, '', 'regex', '', 3, 'function'),
(187, 'view_count', '浏览数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 0, '', 29, 0, 1, 1396510630, 1396510630, '', 3, '', 'regex', '', 3, 'function'),
(188, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 29, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(189, 'keyword', '关键词', 'varchar(255) NOT NULL', 'string', '', '多个关键词请用空格分开：例如: 高 富 帅', 1, '', 30, 0, 1, 1396578460, 1396578212, '', 3, '', 'regex', '', 3, 'function'),
(190, 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 30, 0, 1, 1396578526, 1396578249, '', 3, '', 'regex', '', 3, 'function'),
(191, 'content', '回复内容', 'text NOT NULL', 'textarea', '', '请不要多于1000字否则无法发送。支持加超链接，但URL必须带http://', 1, '', 30, 0, 1, 1396607362, 1396578597, '', 3, '', 'regex', '', 3, 'function'),
(192, 'view_count', '浏览数', 'int(10) UNSIGNED NULL', 'num', '0', '', 0, '', 30, 0, 1, 1396580643, 1396580643, '', 3, '', 'regex', '', 3, 'function'),
(193, 'sort', '排序号', 'int(10) UNSIGNED NULL', 'num', '0', '', 1, '', 30, 0, 1, 1396580674, 1396580674, '', 3, '', 'regex', '', 3, 'function'),
(194, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 30, 0, 1, 1396603007, 1396603007, '', 3, '', 'regex', 'get_token', 1, 'function'),
(195, 'title', '分类标题', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 31, 0, 1, 1395988016, 1395988016, '', 3, '', 'regex', '', 3, 'function'),
(196, 'icon', '分类图片', 'int(10) UNSIGNED  NULL', 'picture', '', '', 1, '', 31, 0, 1, 1395988966, 1395988966, '', 3, '', 'regex', '', 3, 'function'),
(197, 'url', '外链', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 31, 0, 1, 1395989660, 1395989660, '', 3, '', 'regex', '', 3, 'function'),
(198, 'is_show', '显示', 'tinyint(2) NOT NULL', 'bool', '1', '', 1, '0: 不显示\r\n1: 显示', 31, 0, 1, 1395989709, 1395989709, '', 3, '', 'regex', '', 3, 'function'),
(199, 'token', 'Token', 'varchar(100)  NULL', 'string', '', '', 0, '', 31, 0, 1, 1395989760, 1395989760, '', 3, '', 'regex', 'get_token', 1, 'function'),
(200, 'sort', '排序号', 'int(10)  NULL', 'num', '0', '数值越小越靠前', 1, '', 31, 0, 1, 1396340334, 1396340334, '', 3, '', 'regex', '', 3, 'function'),
(201, 'title', '标题', 'varchar(255) NULL', 'string', '', '可为空', 1, '', 32, 0, 1, 1396098316, 1396098316, '', 3, '', 'regex', '', 3, 'function'),
(202, 'img', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 32, 0, 1, 1399724980, 1396098349, '', 3, '', 'regex', '', 3, 'function'),
(203, 'url', '链接地址', 'varchar(255) NULL', 'string', '', '', 1, '', 32, 0, 1, 1396098380, 1396098380, '', 3, '', 'regex', '', 3, 'function'),
(204, 'is_show', '是否显示', 'tinyint(2) NULL', 'bool', '1', '', 1, '0:不显示\r\n1:显示', 32, 0, 1, 1396098464, 1396098464, '', 3, '', 'regex', '', 3, 'function'),
(205, 'sort', '排序', 'int(10) UNSIGNED NULL', 'num', '0', '值越小越靠前', 1, '', 32, 0, 1, 1396098682, 1396098682, '', 3, '', 'regex', '', 3, 'function'),
(206, 'token', 'Token', 'varchar(100) NULL', 'string', '', '', 0, '', 32, 0, 1, 1396098747, 1396098747, '', 3, '', 'regex', 'get_token', 1, 'function'),
(207, 'url', '关联URL', 'varchar(255)   NULL', 'string', '', '', 1, '', 33, 0, 1, 1394519090, 1394519090, '', 3, '', 'regex', '', 3, 'function'),
(208, 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', 1, '', 33, 0, 1, 1394519941, 1394518988, '', 3, '', 'regex', '', 3, 'function'),
(209, 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', 1, '0:无', 33, 0, 1, 1394519296, 1394518930, '', 3, '', 'regex', '', 3, 'function'),
(210, 'sort', '排序号', 'tinyint(4)  NULL', 'num', '0', '数值越小越靠前', 1, '', 33, 0, 1, 1394523288, 1394519175, '', 3, '', 'regex', '', 3, 'function'),
(211, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 33, 0, 1, 1394526820, 1394526820, '', 3, '', 'regex', 'get_token', 1, 'function'),
(212, 'icon', '图标', 'int(10) UNSIGNED NULL', 'picture', '', '根据选择的底部模板决定是否需要上传图标', 1, '', 33, 0, 1, 1396506297, 1396506297, '', 3, '', 'regex', '', 3, 'function'),
(213, 'url', '关联URL', 'varchar(255)   NULL', 'string', '', '', 1, '', 34, 0, 1, 1394519090, 1394519090, '', 3, '', 'regex', '', 3, 'function'),
(214, 'keyword', '关联关键词', 'varchar(100) NULL', 'string', '', '关联关键词和关联URL选填一项', 1, '', 34, 0, 1, 1394519232, 1394519054, '', 3, '', 'regex', '', 3, 'function'),
(215, 'title', '菜单名', 'varchar(50) NOT NULL', 'string', '', '可创建最多 3 个一级菜单，每个一级菜单下可创建最多 5 个二级菜单。编辑中的菜单不会马上被用户看到，请放心调试。', 1, '', 34, 0, 1, 1394519941, 1394518988, '', 3, '', 'regex', '', 3, 'function'),
(216, 'pid', '一级菜单', 'tinyint(2) NULL', 'select', '0', '如果是一级菜单，选择“无”即可', 1, '0:无', 34, 0, 1, 1394519296, 1394518930, '', 3, '', 'regex', '', 3, 'function'),
(217, 'sort', '排序号', 'tinyint(4)  NULL', 'num', '0', '数值越小越靠前', 1, '', 34, 0, 1, 1394523288, 1394519175, '', 3, '', 'regex', '', 3, 'function'),
(218, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 34, 0, 1, 1394526820, 1394526820, '', 3, '', 'regex', 'get_token', 1, 'function'),
(219, 'give_type', '发放方式', 'tinyint(2) NOT NULL', 'bool', '0', '人工发放是指管理员要会员管理列表手工进行发放', 0, '0:自动发放\r\n1:人工发放', 35, 0, 1, 1395487734, 1395486034, '', 3, '', 'regex', '', 3, 'function'),
(220, 'title', '优惠券标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 35, 0, 1, 1395485828, 1395485828, '', 3, '', 'regex', '', 3, 'function'),
(221, 'end_date', '结束时间', 'int(10) NULL', 'datetime', '', '', 1, '', 35, 0, 1, 1395486188, 1395486188, '', 3, '', 'regex', '', 3, 'function'),
(222, 'start_date', '开始时间', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 35, 0, 1, 1395486135, 1395486135, '', 3, '', 'regex', '', 3, 'function'),
(223, 'content', '使用说明', 'text NOT NULL', 'editor', '', '', 1, '', 35, 0, 1, 1395486307, 1395486307, '', 3, '', 'regex', '', 3, 'function'),
(224, 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', 0, '', 35, 0, 1, 1395486839, 1395486801, '', 3, '', 'regex', 'time', 1, 'function'),
(225, 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', 0, '', 35, 0, 1, 1395912079, 1395912079, '', 3, '', 'regex', 'get_token', 1, 'function'),
(226, 'cTime', '发布时间', 'int(10) NULL', 'datetime', '', '', 0, '', 36, 0, 1, 1395485303, 1395485303, '', 3, '', 'regex', 'time', 1, 'function'),
(227, 'content', '通知内容', 'text NOT NULL', 'editor', '', '', 1, '', 36, 0, 1, 1395485247, 1395485247, '', 3, '', 'regex', '', 3, 'function'),
(228, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 36, 0, 1, 1395485192, 1395485192, '', 3, '', 'regex', '', 3, 'function'),
(229, 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', 0, '', 36, 0, 1, 1395911896, 1395911896, '', 3, '', 'regex', 'get_token', 1, 'function'),
(230, 'number', '卡号', 'varchar(50) NULL', 'string', '', '', 3, '', 37, 0, 1, 1395484806, 1395483310, '', 3, '', 'regex', '', 3, 'function'),
(231, 'cTime', '加入时间', 'int(10) NULL', 'datetime', '', '', 0, '', 37, 0, 1, 1395484366, 1395484366, '', 3, '', 'regex', 'time', 1, 'function'),
(232, 'phone', '手机号', 'varchar(30) NULL', 'string', '', '', 1, '', 37, 0, 1, 1395483248, 1395483248, '', 3, '', 'regex', '', 3, 'function'),
(233, 'username', '姓名', 'varchar(100) NULL', 'string', '', '', 1, '', 37, 0, 1, 1395483048, 1395483048, '', 3, '', 'regex', '', 3, 'function'),
(234, 'uid', '用户UID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 37, 0, 1, 1395482973, 1395482973, '', 3, '', 'regex', 'get_mid', 1, 'function'),
(235, 'token', 'Token', 'varchar(100) NOT NULL', 'string', '', '', 0, '', 37, 0, 1, 1395973788, 1395912028, '', 3, '', 'regex', 'get_token', 1, 'function'),
(236, 'imgurl', '图片外链', 'varchar(255) ', 'string', '', '图片外链地址，默认使用外链', 1, '', 32, 0, 1, 1399731085, 1399724096, '', 3, '', 'regex', '', 3, 'function'),
(237, 'imgurl', '图片外链', 'varchar(255) NOT NULL', 'string', '', '图片外链地址，外链地址相对图片地址优先', 1, '', 31, 0, 1, 1399725954, 1399725954, '', 3, '', 'regex', '', 3, 'function'),
(238, 'info', '备注', 'text NOT NULL', 'textarea', '', '', 1, '', 38, 0, 1, 1400033793, 1400033793, '', 3, '', 'regex', '', 3, 'function'),
(239, 'type', '选择项目', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 38, 1, 1, 1400033842, 1400033842, '', 3, '', 'regex', '', 3, 'function'),
(240, 'timepart', '时间段', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 38, 0, 1, 1400033900, 1400033900, '', 3, '', 'regex', '', 3, 'function'),
(241, 'dateline', '日期', 'int(10) NOT NULL', 'datetime', '', '', 5, '', 38, 0, 1, 1400033947, 1400033947, '', 3, '', 'regex', '', 3, 'function'),
(242, 'tel', '手机号码', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 38, 1, 1, 1400033974, 1400033974, '', 3, '', 'regex', '', 3, 'function'),
(243, 'truename', '姓名', 'varchar(50) NOT NULL', 'string', '', '', 1, '', 38, 1, 1, 1400034005, 1400034005, '', 3, '', 'regex', '', 3, 'function'),
(244, 'token', 'token', 'varchar(255) NOT NULL', 'string', '', '', 4, '', 38, 1, 1, 1400034035, 1400034035, '', 3, '', 'regex', '', 3, 'function'),
(245, 'openid', 'openid', 'varchar(255) NOT NULL', 'string', '', '', 4, '', 38, 1, 1, 1400034056, 1400034056, '', 3, '', 'regex', '', 3, 'function'),
(246, 'status', '状态', 'char(50) NOT NULL', 'select', '0', '', 3, '0:创建成功\r\n1:审核失败\r\n2:审核成功', 38, 0, 1, 1400036907, 1400036907, '', 3, '', 'regex', '', 3, 'function');

-- --------------------------------------------------------

--
-- 表的结构 `wp_auth_extend`
--

CREATE TABLE IF NOT EXISTS `wp_auth_extend` (
  `group_id` mediumint(10) unsigned NOT NULL COMMENT '用户id',
  `extend_id` mediumint(8) unsigned NOT NULL COMMENT '扩展表中数据的id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '扩展类型标识 1:栏目分类权限;2:模型权限'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组与分类的对应关系表';

--
-- 转存表中的数据 `wp_auth_extend`
--

INSERT INTO `wp_auth_extend` (`group_id`, `extend_id`, `type`) VALUES
(1, 1, 1),
(1, 1, 2),
(1, 2, 1),
(1, 2, 2),
(1, 3, 1),
(1, 3, 2),
(1, 4, 1),
(1, 37, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_auth_group`
--

CREATE TABLE IF NOT EXISTS `wp_auth_group` (
`id` mediumint(8) unsigned NOT NULL COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '用户组所属模块',
  `type` tinyint(4) NOT NULL COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wp_auth_group`
--

INSERT INTO `wp_auth_group` (`id`, `module`, `type`, `title`, `description`, `status`, `rules`) VALUES
(1, 'admin', 1, '默认用户组', '', 1, '1,2,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,81,82,83,84,86,87,88,89,90,91,92,93,94,95,96,97,100,102,103,105,106'),
(2, 'admin', 1, '测试用户', '测试用户', 1, '1,2,5,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,79,80,82,83,84,88,89,90,91,92,93,96,97,100,102,103,195');

-- --------------------------------------------------------

--
-- 表的结构 `wp_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `wp_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wp_auth_rule`
--

CREATE TABLE IF NOT EXISTS `wp_auth_rule` (
`id` mediumint(8) unsigned NOT NULL COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-url;2-主菜单',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=225 ;

--
-- 转存表中的数据 `wp_auth_rule`
--

INSERT INTO `wp_auth_rule` (`id`, `module`, `type`, `name`, `title`, `status`, `condition`) VALUES
(1, 'admin', 2, 'Admin/Index/index', '首页', 1, ''),
(2, 'admin', 2, 'Admin/Article/mydocument', '内容', 1, ''),
(3, 'admin', 2, 'Admin/User/index', '用户', 1, ''),
(4, 'admin', 2, 'Admin/Addons/index', '扩展', -1, ''),
(5, 'admin', 2, 'Admin/Config/group', '系统', 1, ''),
(6, 'admin', 1, 'Admin/Index/index', '首页', -1, ''),
(7, 'admin', 1, 'Admin/article/add', '新增', 1, ''),
(8, 'admin', 1, 'Admin/article/edit', '编辑', 1, ''),
(9, 'admin', 1, 'Admin/article/setStatus', '改变状态', 1, ''),
(10, 'admin', 1, 'Admin/article/update', '保存', 1, ''),
(11, 'admin', 1, 'Admin/article/autoSave', '保存草稿', 1, ''),
(12, 'admin', 1, 'Admin/article/move', '移动', 1, ''),
(13, 'admin', 1, 'Admin/article/copy', '复制', 1, ''),
(14, 'admin', 1, 'Admin/article/paste', '粘贴', 1, ''),
(15, 'admin', 1, 'Admin/article/permit', '还原', 1, ''),
(16, 'admin', 1, 'Admin/article/clear', '清空', 1, ''),
(17, 'admin', 1, 'Admin/article/index', '文档列表', 1, ''),
(18, 'admin', 1, 'Admin/article/recycle', '回收站', 1, ''),
(19, 'admin', 1, 'Admin/User/addaction', '新增用户行为', 1, ''),
(20, 'admin', 1, 'Admin/User/editaction', '编辑用户行为', 1, ''),
(21, 'admin', 1, 'Admin/User/saveAction', '保存用户行为', 1, ''),
(22, 'admin', 1, 'Admin/User/setStatus', '变更行为状态', 1, ''),
(23, 'admin', 1, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', 1, ''),
(24, 'admin', 1, 'Admin/User/changeStatus?method=resumeUser', '启用会员', 1, ''),
(25, 'admin', 1, 'Admin/User/changeStatus?method=deleteUser', '删除会员', 1, ''),
(26, 'admin', 1, 'Admin/User/index', '用户信息', 1, ''),
(27, 'admin', 1, 'Admin/User/action', '用户行为', 1, ''),
(28, 'admin', 1, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', 1, ''),
(29, 'admin', 1, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', 1, ''),
(30, 'admin', 1, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', 1, ''),
(31, 'admin', 1, 'Admin/AuthManager/createGroup', '新增', 1, ''),
(32, 'admin', 1, 'Admin/AuthManager/editGroup', '编辑', 1, ''),
(33, 'admin', 1, 'Admin/AuthManager/writeGroup', '保存用户组', 1, ''),
(34, 'admin', 1, 'Admin/AuthManager/group', '授权', 1, ''),
(35, 'admin', 1, 'Admin/AuthManager/access', '访问授权', 1, ''),
(36, 'admin', 1, 'Admin/AuthManager/user', '成员授权', 1, ''),
(37, 'admin', 1, 'Admin/AuthManager/removeFromGroup', '解除授权', 1, ''),
(38, 'admin', 1, 'Admin/AuthManager/addToGroup', '保存成员授权', 1, ''),
(39, 'admin', 1, 'Admin/AuthManager/category', '分类授权', 1, ''),
(40, 'admin', 1, 'Admin/AuthManager/addToCategory', '保存分类授权', 1, ''),
(41, 'admin', 1, 'Admin/AuthManager/index', '权限管理', 1, ''),
(42, 'admin', 1, 'Admin/Addons/create', '创建', 1, ''),
(43, 'admin', 1, 'Admin/Addons/checkForm', '检测创建', 1, ''),
(44, 'admin', 1, 'Admin/Addons/preview', '预览', 1, ''),
(45, 'admin', 1, 'Admin/Addons/build', '快速生成插件', 1, ''),
(46, 'admin', 1, 'Admin/Addons/config', '设置', 1, ''),
(47, 'admin', 1, 'Admin/Addons/disable', '禁用', 1, ''),
(48, 'admin', 1, 'Admin/Addons/enable', '启用', 1, ''),
(49, 'admin', 1, 'Admin/Addons/install', '安装', 1, ''),
(50, 'admin', 1, 'Admin/Addons/uninstall', '卸载', 1, ''),
(51, 'admin', 1, 'Admin/Addons/saveconfig', '更新配置', 1, ''),
(52, 'admin', 1, 'Admin/Addons/adminList', '插件后台列表', 1, ''),
(53, 'admin', 1, 'Admin/Addons/execute', 'URL方式访问插件', 1, ''),
(54, 'admin', 1, 'Admin/Addons/index', '插件管理', 1, ''),
(55, 'admin', 1, 'Admin/Addons/hooks', '钩子管理', 1, ''),
(56, 'admin', 1, 'Admin/model/add', '新增', 1, ''),
(57, 'admin', 1, 'Admin/model/edit', '编辑', 1, ''),
(58, 'admin', 1, 'Admin/model/setStatus', '改变状态', 1, ''),
(59, 'admin', 1, 'Admin/model/update', '保存数据', 1, ''),
(60, 'admin', 1, 'Admin/Model/index', '模型管理', 1, ''),
(61, 'admin', 1, 'Admin/Config/edit', '编辑', 1, ''),
(62, 'admin', 1, 'Admin/Config/del', '删除', 1, ''),
(63, 'admin', 1, 'Admin/Config/add', '新增', 1, ''),
(64, 'admin', 1, 'Admin/Config/save', '保存', 1, ''),
(65, 'admin', 1, 'Admin/Config/group', '网站设置', 1, ''),
(66, 'admin', 1, 'Admin/Config/index', '配置管理', 1, ''),
(67, 'admin', 1, 'Admin/Channel/add', '新增', 1, ''),
(68, 'admin', 1, 'Admin/Channel/edit', '编辑', 1, ''),
(69, 'admin', 1, 'Admin/Channel/del', '删除', 1, ''),
(70, 'admin', 1, 'Admin/Channel/index', '导航管理', 1, ''),
(71, 'admin', 1, 'Admin/Category/edit', '编辑', 1, ''),
(72, 'admin', 1, 'Admin/Category/add', '新增', 1, ''),
(73, 'admin', 1, 'Admin/Category/remove', '删除', 1, ''),
(74, 'admin', 1, 'Admin/Category/index', '分类管理', 1, ''),
(75, 'admin', 1, 'Admin/file/upload', '上传控件', -1, ''),
(76, 'admin', 1, 'Admin/file/uploadPicture', '上传图片', -1, ''),
(77, 'admin', 1, 'Admin/file/download', '下载', -1, ''),
(94, 'admin', 1, 'Admin/AuthManager/modelauth', '模型授权', 1, ''),
(79, 'admin', 1, 'Admin/article/batchOperate', '导入', 1, ''),
(80, 'admin', 1, 'Admin/Database/index?type=export', '备份数据库', 1, ''),
(81, 'admin', 1, 'Admin/Database/index?type=import', '还原数据库', 1, ''),
(82, 'admin', 1, 'Admin/Database/export', '备份', 1, ''),
(83, 'admin', 1, 'Admin/Database/optimize', '优化表', 1, ''),
(84, 'admin', 1, 'Admin/Database/repair', '修复表', 1, ''),
(86, 'admin', 1, 'Admin/Database/import', '恢复', 1, ''),
(87, 'admin', 1, 'Admin/Database/del', '删除', 1, ''),
(88, 'admin', 1, 'Admin/User/add', '新增用户', 1, ''),
(89, 'admin', 1, 'Admin/Attribute/index', '属性管理', 1, ''),
(90, 'admin', 1, 'Admin/Attribute/add', '新增', 1, ''),
(91, 'admin', 1, 'Admin/Attribute/edit', '编辑', 1, ''),
(92, 'admin', 1, 'Admin/Attribute/setStatus', '改变状态', 1, ''),
(93, 'admin', 1, 'Admin/Attribute/update', '保存数据', 1, ''),
(95, 'admin', 1, 'Admin/AuthManager/addToModel', '保存模型授权', 1, ''),
(96, 'admin', 1, 'Admin/Category/move', '移动', -1, ''),
(97, 'admin', 1, 'Admin/Category/merge', '合并', -1, ''),
(98, 'admin', 1, 'Admin/Config/menu', '后台菜单管理', -1, ''),
(99, 'admin', 1, 'Admin/Article/mydocument', '内容', -1, ''),
(100, 'admin', 1, 'Admin/Menu/index', '菜单管理', 1, ''),
(101, 'admin', 1, 'Admin/other', '其他', -1, ''),
(102, 'admin', 1, 'Admin/Menu/add', '新增', 1, ''),
(103, 'admin', 1, 'Admin/Menu/edit', '编辑', 1, ''),
(104, 'admin', 1, 'Admin/Think/lists?model=article', '文章管理', -1, ''),
(105, 'admin', 1, 'Admin/Think/lists?model=download', '下载管理', 1, ''),
(106, 'admin', 1, 'Admin/Think/lists?model=config', '配置管理', 1, ''),
(107, 'admin', 1, 'Admin/Action/actionlog', '行为日志', 1, ''),
(108, 'admin', 1, 'Admin/User/updatePassword', '修改密码', 1, ''),
(109, 'admin', 1, 'Admin/User/updateNickname', '修改昵称', 1, ''),
(110, 'admin', 1, 'Admin/action/edit', '查看行为日志', 1, ''),
(205, 'admin', 1, 'Admin/think/add', '新增数据', 1, ''),
(111, 'admin', 2, 'Admin/article/index', '文档列表', -1, ''),
(112, 'admin', 2, 'Admin/article/add', '新增', -1, ''),
(113, 'admin', 2, 'Admin/article/edit', '编辑', -1, ''),
(114, 'admin', 2, 'Admin/article/setStatus', '改变状态', -1, ''),
(115, 'admin', 2, 'Admin/article/update', '保存', -1, ''),
(116, 'admin', 2, 'Admin/article/autoSave', '保存草稿', -1, ''),
(117, 'admin', 2, 'Admin/article/move', '移动', -1, ''),
(118, 'admin', 2, 'Admin/article/copy', '复制', -1, ''),
(119, 'admin', 2, 'Admin/article/paste', '粘贴', -1, ''),
(120, 'admin', 2, 'Admin/article/batchOperate', '导入', -1, ''),
(121, 'admin', 2, 'Admin/article/recycle', '回收站', -1, ''),
(122, 'admin', 2, 'Admin/article/permit', '还原', -1, ''),
(123, 'admin', 2, 'Admin/article/clear', '清空', -1, ''),
(124, 'admin', 2, 'Admin/User/add', '新增用户', -1, ''),
(125, 'admin', 2, 'Admin/User/action', '用户行为', -1, ''),
(126, 'admin', 2, 'Admin/User/addAction', '新增用户行为', -1, ''),
(127, 'admin', 2, 'Admin/User/editAction', '编辑用户行为', -1, ''),
(128, 'admin', 2, 'Admin/User/saveAction', '保存用户行为', -1, ''),
(129, 'admin', 2, 'Admin/User/setStatus', '变更行为状态', -1, ''),
(130, 'admin', 2, 'Admin/User/changeStatus?method=forbidUser', '禁用会员', -1, ''),
(131, 'admin', 2, 'Admin/User/changeStatus?method=resumeUser', '启用会员', -1, ''),
(132, 'admin', 2, 'Admin/User/changeStatus?method=deleteUser', '删除会员', -1, ''),
(133, 'admin', 2, 'Admin/AuthManager/index', '权限管理', -1, ''),
(134, 'admin', 2, 'Admin/AuthManager/changeStatus?method=deleteGroup', '删除', -1, ''),
(135, 'admin', 2, 'Admin/AuthManager/changeStatus?method=forbidGroup', '禁用', -1, ''),
(136, 'admin', 2, 'Admin/AuthManager/changeStatus?method=resumeGroup', '恢复', -1, ''),
(137, 'admin', 2, 'Admin/AuthManager/createGroup', '新增', -1, ''),
(138, 'admin', 2, 'Admin/AuthManager/editGroup', '编辑', -1, ''),
(139, 'admin', 2, 'Admin/AuthManager/writeGroup', '保存用户组', -1, ''),
(140, 'admin', 2, 'Admin/AuthManager/group', '授权', -1, ''),
(141, 'admin', 2, 'Admin/AuthManager/access', '访问授权', -1, ''),
(142, 'admin', 2, 'Admin/AuthManager/user', '成员授权', -1, ''),
(143, 'admin', 2, 'Admin/AuthManager/removeFromGroup', '解除授权', -1, ''),
(144, 'admin', 2, 'Admin/AuthManager/addToGroup', '保存成员授权', -1, ''),
(145, 'admin', 2, 'Admin/AuthManager/category', '分类授权', -1, ''),
(146, 'admin', 2, 'Admin/AuthManager/addToCategory', '保存分类授权', -1, ''),
(147, 'admin', 2, 'Admin/AuthManager/modelauth', '模型授权', -1, ''),
(148, 'admin', 2, 'Admin/AuthManager/addToModel', '保存模型授权', -1, ''),
(149, 'admin', 2, 'Admin/Addons/create', '创建', -1, ''),
(150, 'admin', 2, 'Admin/Addons/checkForm', '检测创建', -1, ''),
(151, 'admin', 2, 'Admin/Addons/preview', '预览', -1, ''),
(152, 'admin', 2, 'Admin/Addons/build', '快速生成插件', -1, ''),
(153, 'admin', 2, 'Admin/Addons/config', '设置', -1, ''),
(154, 'admin', 2, 'Admin/Addons/disable', '禁用', -1, ''),
(155, 'admin', 2, 'Admin/Addons/enable', '启用', -1, ''),
(156, 'admin', 2, 'Admin/Addons/install', '安装', -1, ''),
(157, 'admin', 2, 'Admin/Addons/uninstall', '卸载', -1, ''),
(158, 'admin', 2, 'Admin/Addons/saveconfig', '更新配置', -1, ''),
(159, 'admin', 2, 'Admin/Addons/adminList', '插件后台列表', -1, ''),
(160, 'admin', 2, 'Admin/Addons/execute', 'URL方式访问插件', -1, ''),
(161, 'admin', 2, 'Admin/Addons/hooks', '钩子管理', -1, ''),
(162, 'admin', 2, 'Admin/Model/index', '模型管理', -1, ''),
(163, 'admin', 2, 'Admin/model/add', '新增', -1, ''),
(164, 'admin', 2, 'Admin/model/edit', '编辑', -1, ''),
(165, 'admin', 2, 'Admin/model/setStatus', '改变状态', -1, ''),
(166, 'admin', 2, 'Admin/model/update', '保存数据', -1, ''),
(167, 'admin', 2, 'Admin/Attribute/index', '属性管理', -1, ''),
(168, 'admin', 2, 'Admin/Attribute/add', '新增', -1, ''),
(169, 'admin', 2, 'Admin/Attribute/edit', '编辑', -1, ''),
(170, 'admin', 2, 'Admin/Attribute/setStatus', '改变状态', -1, ''),
(171, 'admin', 2, 'Admin/Attribute/update', '保存数据', -1, ''),
(172, 'admin', 2, 'Admin/Config/index', '配置管理', -1, ''),
(173, 'admin', 2, 'Admin/Config/edit', '编辑', -1, ''),
(174, 'admin', 2, 'Admin/Config/del', '删除', -1, ''),
(175, 'admin', 2, 'Admin/Config/add', '新增', -1, ''),
(176, 'admin', 2, 'Admin/Config/save', '保存', -1, ''),
(177, 'admin', 2, 'Admin/Menu/index', '菜单管理', -1, ''),
(178, 'admin', 2, 'Admin/Channel/index', '导航管理', -1, ''),
(179, 'admin', 2, 'Admin/Channel/add', '新增', -1, ''),
(180, 'admin', 2, 'Admin/Channel/edit', '编辑', -1, ''),
(181, 'admin', 2, 'Admin/Channel/del', '删除', -1, ''),
(182, 'admin', 2, 'Admin/Category/index', '分类管理', -1, ''),
(183, 'admin', 2, 'Admin/Category/edit', '编辑', -1, ''),
(184, 'admin', 2, 'Admin/Category/add', '新增', -1, ''),
(185, 'admin', 2, 'Admin/Category/remove', '删除', -1, ''),
(186, 'admin', 2, 'Admin/Category/move', '移动', -1, ''),
(187, 'admin', 2, 'Admin/Category/merge', '合并', -1, ''),
(188, 'admin', 2, 'Admin/Database/index?type=export', '备份数据库', -1, ''),
(189, 'admin', 2, 'Admin/Database/export', '备份', -1, ''),
(190, 'admin', 2, 'Admin/Database/optimize', '优化表', -1, ''),
(191, 'admin', 2, 'Admin/Database/repair', '修复表', -1, ''),
(192, 'admin', 2, 'Admin/Database/index?type=import', '还原数据库', -1, ''),
(193, 'admin', 2, 'Admin/Database/import', '恢复', -1, ''),
(194, 'admin', 2, 'Admin/Database/del', '删除', -1, ''),
(195, 'admin', 2, 'Admin/other', '其他', 1, ''),
(196, 'admin', 2, 'Admin/Menu/add', '新增', -1, ''),
(197, 'admin', 2, 'Admin/Menu/edit', '编辑', -1, ''),
(198, 'admin', 2, 'Admin/Think/lists?model=article', '应用', -1, ''),
(199, 'admin', 2, 'Admin/Think/lists?model=download', '下载管理', -1, ''),
(200, 'admin', 2, 'Admin/Think/lists?model=config', '应用', -1, ''),
(201, 'admin', 2, 'Admin/Action/actionlog', '行为日志', -1, ''),
(202, 'admin', 2, 'Admin/User/updatePassword', '修改密码', -1, ''),
(203, 'admin', 2, 'Admin/User/updateNickname', '修改昵称', -1, ''),
(204, 'admin', 2, 'Admin/action/edit', '查看行为日志', -1, ''),
(206, 'admin', 1, 'Admin/think/edit', '编辑数据', 1, ''),
(207, 'admin', 1, 'Admin/Menu/import', '导入', 1, ''),
(208, 'admin', 1, 'Admin/Model/generate', '生成', 1, ''),
(209, 'admin', 1, 'Admin/Addons/addHook', '新增钩子', 1, ''),
(210, 'admin', 1, 'Admin/Addons/edithook', '编辑钩子', 1, ''),
(211, 'admin', 1, 'Admin/Article/sort', '文档排序', 1, ''),
(212, 'admin', 1, 'Admin/Config/sort', '排序', 1, ''),
(213, 'admin', 1, 'Admin/Menu/sort', '排序', 1, ''),
(214, 'admin', 1, 'Admin/Channel/sort', '排序', 1, ''),
(215, 'admin', 1, 'Admin/Category/operate/type/move', '移动', 1, ''),
(216, 'admin', 1, 'Admin/Category/operate/type/merge', '合并', 1, ''),
(217, 'admin', 1, 'admin/addons/weixin', '微信插件', 1, ''),
(218, 'admin', 2, 'Admin/Addons/weixin', '插件管理', 1, ''),
(219, 'admin', 1, 'admin/PublicGroup/PublicGroup', '公众号等级', 1, ''),
(220, 'admin', 2, 'admin/cms/index', 'CMS管理', 1, ''),
(221, 'admin', 1, 'admin/channel/index?pid=130', '编码管理', 1, ''),
(222, 'admin', 1, 'admin/PublicGroup/PublicAdmin', '公众号管理', 1, ''),
(223, 'admin', 1, 'admin/update/index', '在线升级', 1, ''),
(224, 'admin', 1, 'admin/Update/delcache', '清除缓存', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_card_coupons`
--

CREATE TABLE IF NOT EXISTS `wp_card_coupons` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `give_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '发放方式',
  `title` varchar(255) NOT NULL COMMENT '优惠券标题',
  `end_date` int(10) DEFAULT NULL COMMENT '结束时间',
  `start_date` int(10) NOT NULL COMMENT '开始时间',
  `content` text NOT NULL COMMENT '使用说明',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `token` varchar(100) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wp_card_coupons`
--

INSERT INTO `wp_card_coupons` (`id`, `give_type`, `title`, `end_date`, `start_date`, `content`, `cTime`, `token`) VALUES
(1, 0, '优惠券测试', 1401520800, 1399274400, '优惠券测试', 1399274426, '53663a115a861');

-- --------------------------------------------------------

--
-- 表的结构 `wp_card_member`
--

CREATE TABLE IF NOT EXISTS `wp_card_member` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `number` varchar(50) DEFAULT NULL COMMENT '卡号',
  `cTime` int(10) DEFAULT NULL COMMENT '加入时间',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `username` varchar(100) DEFAULT NULL COMMENT '姓名',
  `uid` int(10) unsigned NOT NULL COMMENT '用户UID',
  `token` varchar(100) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_card_notice`
--

CREATE TABLE IF NOT EXISTS `wp_card_notice` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `content` text NOT NULL COMMENT '通知内容',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `token` varchar(100) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_category`
--

CREATE TABLE IF NOT EXISTS `wp_category` (
`id` int(10) unsigned NOT NULL COMMENT '分类ID',
  `name` varchar(30) NOT NULL COMMENT '标志',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `list_row` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '列表每页行数',
  `meta_title` varchar(50) NOT NULL DEFAULT '' COMMENT 'SEO的网页标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `template_index` varchar(100) NOT NULL COMMENT '频道页模板',
  `template_lists` varchar(100) NOT NULL COMMENT '列表页模板',
  `template_detail` varchar(100) NOT NULL COMMENT '详情页模板',
  `template_edit` varchar(100) NOT NULL COMMENT '编辑页模板',
  `model` varchar(100) NOT NULL DEFAULT '' COMMENT '关联模型',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '允许发布的内容类型',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `allow_publish` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许发布内容',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '可见性',
  `reply` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许回复',
  `check` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发布的文章是否需要审核',
  `reply_model` varchar(100) NOT NULL DEFAULT '',
  `extend` text NOT NULL COMMENT '扩展设置',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态',
  `icon` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类图标'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `wp_category`
--

INSERT INTO `wp_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'news', '古睿', 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 1, 1, 0, 0, '1', '', 1379474947, 1399453851, 1, 0),
(2, 'news_info', '古睿资讯', 1, 1, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1399439667, 1, 31),
(41, 'sevices', '服务', 1, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1399453924, 1399453924, 1, 0),
(43, 'cases', '案例展示', 1, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1399519081, 1399532164, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_channel`
--

CREATE TABLE IF NOT EXISTS `wp_channel` (
`id` int(10) unsigned NOT NULL COMMENT '频道ID',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级频道ID',
  `title` char(30) NOT NULL COMMENT '频道标题',
  `url` char(100) NOT NULL COMMENT '频道连接',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '导航排序',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `target` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '新窗口打开'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `wp_channel`
--

INSERT INTO `wp_channel` (`id`, `pid`, `title`, `url`, `sort`, `create_time`, `update_time`, `status`, `target`) VALUES
(4, 0, '资讯', 'home/article/index?category=2', 1, 1399362975, 1399444328, 1, 0),
(5, 0, '功能', 'home/index/features', 2, 1399365039, 1399365039, 0, 0),
(6, 0, '案例', 'home/index/cases', 3, 1399366270, 1399532237, 1, 0),
(7, 0, '服务', 'home/index/service', 4, 1399366288, 1399366288, 0, 0),
(8, 0, '帮助', 'home/index/help', 5, 1399366306, 1399366306, 0, 0),
(9, 0, '关于', 'home/index/about', 6, 1399366326, 1399454585, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_config`
--

CREATE TABLE IF NOT EXISTS `wp_config` (
`id` int(10) unsigned NOT NULL COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- 转存表中的数据 `wp_config`
--

INSERT INTO `wp_config` (`id`, `name`, `type`, `title`, `group`, `extra`, `remark`, `create_time`, `update_time`, `status`, `value`, `sort`) VALUES
(1, 'WEB_SITE_TITLE', 1, '网站标题', 1, '', '网站标题前台显示标题', 1378898976, 1379235274, 1, '古睿', 0),
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '古睿信息科技', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '古睿，公众平台管理', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1399451392, 1, '浙ICP备14015469号-1', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\ntheme1:似黄色', '后台颜色风格', 1379122533, 1399467752, 1, 'blue_color', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 4, '', '后台数据每页显示记录数', 1379503896, 1391938052, 1, '20', 10),
(26, 'USER_ALLOW_REGISTER', 4, '是否允许用户注册', 3, '0:关闭注册\r\n1:允许注册', '是否开放用户注册', 1379504487, 1379504580, 1, '0', 3),
(27, 'CODEMIRROR_THEME', 4, '预览插件的CodeMirror主题', 4, '3024-day:3024 day\r\n3024-night:3024 night\r\nambiance:ambiance\r\nbase16-dark:base16 dark\r\nbase16-light:base16 light\r\nblackboard:blackboard\r\ncobalt:cobalt\r\neclipse:eclipse\r\nelegant:elegant\r\nerlang-dark:erlang-dark\r\nlesser-dark:lesser-dark\r\nmidnight:midnight', '详情见CodeMirror官网', 1379814385, 1384740813, 1, 'ambiance', 3),
(28, 'DATA_BACKUP_PATH', 1, '数据库备份根路径', 4, '', '路径必须以 / 结尾', 1381482411, 1381482411, 1, './Data/', 5),
(29, 'DATA_BACKUP_PART_SIZE', 0, '数据库备份卷大小', 4, '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', 1381482488, 1381729564, 1, '20971520', 7),
(30, 'DATA_BACKUP_COMPRESS', 4, '数据库备份文件是否启用压缩', 4, '0:不压缩\r\n1:启用压缩', '压缩备份文件需要PHP环境支持gzopen,gzwrite函数', 1381713345, 1381729544, 1, '1', 9),
(31, 'DATA_BACKUP_COMPRESS_LEVEL', 4, '数据库备份文件压缩级别', 4, '1:普通\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', 1381713408, 1381713408, 1, '9', 10),
(32, 'DEVELOP_MODE', 4, '开启开发者模式', 4, '0:关闭\r\n1:开启', '是否开启开发者模式', 1383105995, 1383291877, 1, '0', 11),
(33, 'ALLOW_VISIT', 3, '不受限控制器方法', 0, '', '', 1386644047, 1386644741, 1, '0:article/draftbox\r\n1:article/mydocument\r\n2:Category/tree\r\n3:Index/verify\r\n4:file/upload\r\n5:file/download\r\n6:user/updatePassword\r\n7:user/updateNickname\r\n8:user/submitPassword\r\n9:user/submitNickname', 0),
(34, 'DENY_VISIT', 3, '超管专限控制器方法', 0, '', '仅超级管理员可访问的控制器方法', 1386644141, 1386644659, 1, '0:Addons/addhook\r\n1:Addons/edithook\r\n2:Addons/delhook\r\n3:Addons/updateHook\r\n4:Admin/getMenus\r\n5:Admin/recordList\r\n6:AuthManager/updateRules\r\n7:AuthManager/tree', 0),
(35, 'REPLY_LIST_ROWS', 0, '回复列表每页条数', 2, '', '', 1386645376, 1387178083, 1, '20', 0),
(36, 'ADMIN_ALLOW_IP', 2, '后台允许访问IP', 4, '', '多个用逗号分隔，如果不配置表示不限制IP访问', 1387165454, 1387165553, 1, '', 12),
(37, 'SHOW_PAGE_TRACE', 4, '是否显示页面Trace', 4, '0:关闭\r\n1:开启', '是否显示页面Trace信息', 1387165685, 1387165685, 1, '0', 1),
(38, 'WEB_SITE_VERIFY', 4, '登陆验证码', 1, '0:关闭,1:开启', '登陆时是否需要验证码', 1378898976, 1378898976, 1, '1', 2),
(42, 'ACCESS', 2, '未登陆时可访问的页面', 4, '', '不区分大小写', 1390656601, 1390664079, 1, 'Home/User/*\r\nhome/addons/execute/*\r\nHome/Article/*\r\nFront/User/login\r\nHome/Index/*\r\nhome/weixin/*\r\nadmin/File/*\r\nhome/File/*', 0),
(44, 'DEFAULT_PUBLIC_GROUP_ID', 0, '公众号默认等级ID', 3, '', '前台新增加的公众号的默认等级，值为0表示不做权限控制，公众号拥有全部插件的权限', 1393759885, 1393759981, 1, '0', 1),
(45, 'SYSTEM_UPDATE_REMIND', 4, '系统升级提醒', 4, '0:关闭\r\n1:开启', '开启后官方有新升级信息会及时在后台的网站设置页面头部显示升级提醒', 1393764263, 1394273968, 1, '0', 5),
(46, 'SYSTEM_UPDATRE_VERSION', 0, '系统升级最新版本号', 4, '', '记录当前系统的版本号，这是与官方比较是否有升级包的唯一标识，不熟悉者只勿改变其数值', 1393764702, 1394274087, 1, '20140417', 6),
(47, 'ADMIN_KEY', 2, '后台登陆key', 0, '', '', 1399464016, 1399464282, 1, 'hebidu', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_custom_menu`
--

CREATE TABLE IF NOT EXISTS `wp_custom_menu` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关联关键词',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wp_custom_menu`
--

INSERT INTO `wp_custom_menu` (`id`, `url`, `keyword`, `title`, `pid`, `sort`, `token`) VALUES
(1, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index', '在线预约', '在线预约', 2, 0, '536e0fac9c2c6'),
(2, '', '服务', '在线服务', 0, 5, '536e0fac9c2c6'),
(3, '', '在线留言', '在线留言', 2, 1, '536e0fac9c2c6'),
(4, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2.html', '', '关于戴维营', 0, 0, '536e0fac9c2c6');

-- --------------------------------------------------------

--
-- 表的结构 `wp_custom_reply_mult`
--

CREATE TABLE IF NOT EXISTS `wp_custom_reply_mult` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `mult_ids` varchar(255) NOT NULL COMMENT '多图文ID',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_custom_reply_news`
--

CREATE TABLE IF NOT EXISTS `wp_custom_reply_news` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) DEFAULT NULL COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text COMMENT '简介',
  `cate_id` int(10) unsigned DEFAULT '0' COMMENT '所属类别',
  `cover` int(10) unsigned DEFAULT NULL COMMENT '封面图片',
  `content` text NOT NULL COMMENT '内容',
  `cTime` int(10) DEFAULT NULL COMMENT '发布时间',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序号',
  `view_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览数',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wp_custom_reply_news`
--

INSERT INTO `wp_custom_reply_news` (`id`, `keyword`, `keyword_type`, `title`, `intro`, `cate_id`, `cover`, `content`, `cTime`, `sort`, `view_count`, `token`) VALUES
(1, '古睿', 3, '古睿信息科技有限公司', '客服热线：0575-85060707\r\n办公地址：浙江省绍兴市越城区汤公路186号\r\n建议反馈：QQ:2966442390 QQ:1966236348', 1, 0, '客服热线：0575-85060707<br />\r\n办公地址：浙江省绍兴市越城区汤公路186号<br />\r\n建议反馈：QQ:2966442390 QQ:1966236348<br />', 1399636825, 0, 0, '53663a115a861'),
(2, '企业简介', 0, '戴维营SPA介绍', '戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。', 3, 59, '戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。', 1399899528, 0, 2, '536e0fac9c2c6'),
(3, '内部展示', 0, '大堂展示', '大堂内部', 2, 58, '大堂内部大堂内部大堂内部大堂内部大堂内部', 1399958566, 1, 2, '536e0fac9c2c6'),
(4, '大厅展示', 0, '大厅展示', '大厅展示大厅展示', 2, 57, '<span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示<span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示<span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span><span>大厅展示</span></span></span>', 1399960163, 2, 1, '536e0fac9c2c6');

-- --------------------------------------------------------

--
-- 表的结构 `wp_custom_reply_text`
--

CREATE TABLE IF NOT EXISTS `wp_custom_reply_text` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL COMMENT '关键词类型',
  `content` text NOT NULL COMMENT '回复内容',
  `view_count` int(10) unsigned DEFAULT '0' COMMENT '浏览数',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_document`
--

CREATE TABLE IF NOT EXISTS `wp_document` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '标识',
  `title` char(80) NOT NULL DEFAULT '' COMMENT '标题',
  `category_id` int(10) unsigned NOT NULL COMMENT '所属分类',
  `description` char(140) NOT NULL DEFAULT '' COMMENT '描述',
  `root` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '根节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属ID',
  `model_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容模型ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '2' COMMENT '内容类型',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '推荐位',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '外链',
  `cover_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '封面',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '可见性',
  `deadline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '截至时间',
  `attach` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '附件数量',
  `view` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览量',
  `comment` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '扩展统计字段',
  `level` int(10) NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '数据状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `wp_document`
--

INSERT INTO `wp_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(2, 1, 'news_info', '微​古睿上线了', 2, '微​古睿上线了', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1398862260, 1399519011, -1),
(3, 1, '', '微​古睿上线了', 2, '微​古睿上线了', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1399439741, 1399519011, -1),
(9, 1, 'cases002', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 11, 0, 0, 0, 1399531973, 1399531973, 1),
(5, 1, '', '微​古睿上线了', 2, '微​古睿上线了', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 32, 0, 0, 0, 1393132500, 1399519027, 1),
(10, 1, '', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 15, 0, 0, 0, 1399534414, 1399534414, 1),
(11, 1, '', '汽车/摩托/服务', 43, '汽车/摩托/服务', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 27, 0, 0, 0, 1399534380, 1399534499, 1),
(12, 1, '', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 1399534420, 1399534420, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_document_article`
--

CREATE TABLE IF NOT EXISTS `wp_document_article` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '文章内容',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `bookmark` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型文章表';

--
-- 转存表中的数据 `wp_document_article`
--

INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(10, 0, '<img src="/gooraye/20140501/Uploads/Editor/2014-05-08/536b29933e33f.jpg" alt="" />', '', 0),
(9, 0, '<img src="/gooraye/20140501/Uploads/Editor/2014-05-08/536b29933e33f.jpg" alt="" />', '', 0),
(11, 0, '<h3 style="font-family:''Microsoft YaHei'', 微软雅黑, 宋体;font-weight:normal;color:#333333;font-size:20px;-color:#FFFFFF;">\r\n	正在进行中\r\n</h3>', '', 0),
(12, 0, '<img src="/gooraye/20140501/Uploads/Editor/2014-05-08/536b29933e33f.jpg" alt="" />', '', 0),
(2, 0, '<span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;"><span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;">微</span>古睿-永久免费且功能强大的微信公众服务平台上线啦！</span>', 'Article:read', 0),
(3, 0, '<span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;"><span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;">微</span>古睿-永久免费且功能强大的微信公众服务平台上线啦！ (责任编辑：admin)</span>', 'Article:read', 0),
(5, 0, '<span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;"><span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;">微</span>古睿-永久免费且功能强大的微信公众服务平台上线啦！</span>', 'Article:read', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_document_download`
--

CREATE TABLE IF NOT EXISTS `wp_document_download` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文档ID',
  `parse` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '内容解析类型',
  `content` text NOT NULL COMMENT '下载详细描述',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '详情页显示模板',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文档模型下载表';

-- --------------------------------------------------------

--
-- 表的结构 `wp_extensions`
--

CREATE TABLE IF NOT EXISTS `wp_extensions` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '关键词类型',
  `api_token` varchar(255) NOT NULL COMMENT 'Token',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `api_url` varchar(255) NOT NULL COMMENT '第三方URL',
  `output_format` tinyint(1) DEFAULT '0' COMMENT '数据输出格式',
  `keyword_filter` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词过滤',
  `keyword` varchar(255) NOT NULL COMMENT '关键词'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_file`
--

CREATE TABLE IF NOT EXISTS `wp_file` (
`id` int(10) unsigned NOT NULL COMMENT '文件ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '原始文件名',
  `savename` char(20) NOT NULL DEFAULT '' COMMENT '保存名称',
  `savepath` char(30) NOT NULL DEFAULT '' COMMENT '文件保存路径',
  `ext` char(5) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `mime` char(40) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `location` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '文件保存位置',
  `create_time` int(10) unsigned NOT NULL COMMENT '上传时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文件表' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_hooks`
--

CREATE TABLE IF NOT EXISTS `wp_hooks` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `wp_hooks`
--

INSERT INTO `wp_hooks` (`id`, `name`, `description`, `type`, `update_time`, `addons`) VALUES
(1, 'pageHeader', '页面header钩子，一般用于加载插件CSS文件和代码', 1, 0, ''),
(2, 'pageFooter', '页面footer钩子，一般用于加载插件JS文件和JS代码', 1, 0, 'ReturnTop,BaiduStatistics'),
(3, 'documentEditForm', '添加编辑表单的 扩展内容钩子', 1, 0, 'Attachment'),
(4, 'documentDetailAfter', '文档末尾显示', 1, 0, 'Attachment,SocialComment'),
(5, 'documentDetailBefore', '页面内容前显示用钩子', 1, 0, ''),
(6, 'documentSaveComplete', '保存文档数据后的扩展钩子', 2, 0, 'Attachment'),
(7, 'documentEditFormContent', '添加编辑表单的内容显示钩子', 1, 0, 'Editor'),
(8, 'adminArticleEdit', '后台内容编辑页编辑器', 1, 1378982734, 'EditorForAdmin'),
(13, 'AdminIndex', '首页小格子个性化显示', 1, 1382596073, 'SiteStat,SystemInfo,DevTeam'),
(14, 'topicComment', '评论提交方式扩展钩子。', 1, 1380163518, 'Editor'),
(16, 'app_begin', '应用开始', 2, 1384481614, ''),
(17, 'weixin', '微信插件必须加载的钩子', 1, 1399279384, 'Vote,CustomReply,Chat,Wecome,UserCenter,Suggestions,Extensions,Leaflets,WeiSite,CustomMenu,Card');

-- --------------------------------------------------------

--
-- 表的结构 `wp_host`
--

CREATE TABLE IF NOT EXISTS `wp_host` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '商户名称',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `tel` varchar(255) NOT NULL COMMENT '商户手机号码',
  `phone` varchar(255) NOT NULL COMMENT '商户手机号码',
  `ppicurl` int(10) unsigned NOT NULL COMMENT '订单封面图片',
  `headpic` int(10) unsigned NOT NULL COMMENT '订单页头部图片',
  `name` varchar(255) NOT NULL COMMENT '文字描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '商家图片',
  `info` text NOT NULL COMMENT '商家介绍',
  `url` varchar(255) NOT NULL COMMENT '图片跳转地址以http://开头',
  `info2` text NOT NULL COMMENT '订单说明',
  `ctime` int(10) NOT NULL COMMENT '创建时间',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wp_host`
--

INSERT INTO `wp_host` (`id`, `keyword`, `title`, `address`, `tel`, `phone`, `ppicurl`, `headpic`, `name`, `picurl`, `info`, `url`, `info2`, `ctime`, `token`) VALUES
(1, '微酒店', '古睿信息科技有限公司', '', '13484379290', '13484379290', 0, 0, '13484379290', 2147483647, '13484379290', '', '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_host_guanli`
--

CREATE TABLE IF NOT EXISTS `wp_host_guanli` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `book_people` varchar(255) NOT NULL COMMENT '预订人',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `hid` int(10) unsigned NOT NULL COMMENT '微商户ID',
  `openid` varchar(255) NOT NULL COMMENT 'Openid',
  `check_in` int(10) NOT NULL COMMENT '入住时间',
  `time_out` int(10) unsigned NOT NULL COMMENT '离开时间',
  `room_type` varchar(255) NOT NULL COMMENT '房间类型',
  `book_time` int(10) unsigned NOT NULL COMMENT '预订时间',
  `book_num` varchar(50) NOT NULL COMMENT '预订数量',
  `price` varchar(255) NOT NULL COMMENT '价格',
  `remarks` text NOT NULL COMMENT '备注',
  `tel` varchar(255) NOT NULL COMMENT '电话',
  `order_status` varchar(50) NOT NULL COMMENT '订单状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_host_order`
--

CREATE TABLE IF NOT EXISTS `wp_host_order` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `hid` int(10) unsigned NOT NULL COMMENT '微酒店ID',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `type` varchar(255) NOT NULL COMMENT '订单类型',
  `typeinfo` varchar(255) NOT NULL COMMENT '简要说明',
  `price` varchar(255) NOT NULL COMMENT '原价',
  `yhprice` varchar(255) NOT NULL COMMENT '优惠价',
  `name` varchar(255) NOT NULL COMMENT '文字描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '图片跳转地址以http://开头',
  `info` text NOT NULL COMMENT '配套设施'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_keyword`
--

CREATE TABLE IF NOT EXISTS `wp_keyword` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `addon` varchar(255) NOT NULL COMMENT '关键词所属插件',
  `aim_id` int(10) unsigned NOT NULL COMMENT '插件表里的ID值',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `keyword_lenght` int(10) unsigned DEFAULT '0' COMMENT '关键词长度',
  `keyword_type` tinyint(2) DEFAULT '0' COMMENT '匹配类型',
  `extra_text` text COMMENT '文本扩展',
  `extra_int` int(10) DEFAULT NULL COMMENT '数字扩展'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `wp_keyword`
--

INSERT INTO `wp_keyword` (`id`, `keyword`, `token`, `addon`, `aim_id`, `cTime`, `keyword_lenght`, `keyword_type`, `extra_text`, `extra_int`) VALUES
(12, '机器人学习时间', '0', 'Robot', 0, 1393210483, 0, 0, '', 0),
(40, '古睿', '53663a115a861', 'CustomReply', 1, 1399636825, 6, 3, 'custom_reply_news', 0),
(49, '企业简介', '536e0fac9c2c6', 'WeiSite', 2, 1400026097, 12, 0, 'custom_reply_news', 0),
(47, '内部展示', '536e0fac9c2c6', 'WeiSite', 3, 1399960341, 12, 0, 'custom_reply_news', 0),
(46, '大厅展示', '536e0fac9c2c6', 'WeiSite', 4, 1399960271, 12, 0, 'custom_reply_news', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_member`
--

CREATE TABLE IF NOT EXISTS `wp_member` (
`uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日',
  `qq` char(10) NOT NULL DEFAULT '' COMMENT 'qq号',
  `score` mediumint(8) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登陆次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登陆IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `token` varchar(100) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `truename` varchar(50) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `extra_field` text
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=171 ;

--
-- 转存表中的数据 `wp_member`
--

INSERT INTO `wp_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `token`, `openid`, `truename`, `mobile`, `extra_field`) VALUES
(1, '何必都', 0, '0000-00-00', '', 10, 34, 0, 1399178896, 2130706433, 1400036538, 1, '', '', '', '', ''),
(161, 'gooraye', 0, '0000-00-00', '', 50, 21, 2130706433, 1399193156, 2130706433, 1400114969, 1, '', '', '', '', ''),
(167, 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', '', '', ''),
(163, 'oQJWet3cxXR84wEa2UDrI08eXjug', 0, '0000-00-00', '', 0, 1, 0, 0, 2061514924, 1399643566, 1, '53663a115a861', 'oQJWet3cxXR84wEa2UDrI08eXjug', '', '', ''),
(164, 'dwyspa', 0, '0000-00-00', '', 20, 7, 0, 0, 2130706433, 1400034134, 1, '', '', '', '', ''),
(165, 'oy6EYuNwX9g9u-E-7FQ72-avknmY', 0, '0000-00-00', '', 0, 7, 0, 0, 2061514924, 1400025681, 1, '536e0fac9c2c6', 'oy6EYuNwX9g9u-E-7FQ72-avknmY', '', '', ''),
(166, 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', '', '', ''),
(168, 'oQJWetwWiJTbAt2v-3YojPisYtco', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53663a115a861', 'oQJWetwWiJTbAt2v-3YojPisYtco', '', '', ''),
(169, 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', '', '', ''),
(170, 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_member_public`
--

CREATE TABLE IF NOT EXISTS `wp_member_public` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `public_name` varchar(50) NOT NULL COMMENT '公众号名称',
  `public_id` varchar(100) NOT NULL COMMENT '公众号原始id',
  `wechat` varchar(100) NOT NULL COMMENT '微信号',
  `interface_url` varchar(255) NOT NULL COMMENT '接口地址',
  `headface_url` varchar(255) NOT NULL COMMENT '公众号头像',
  `area` varchar(50) NOT NULL COMMENT '地区',
  `addon_config` text NOT NULL COMMENT '插件配置',
  `addon_status` text NOT NULL COMMENT '插件状态',
  `token` varchar(100) NOT NULL COMMENT 'Token',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为当前公众号',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '公众号类型',
  `appid` varchar(255) NOT NULL COMMENT 'AppId',
  `secret` varchar(255) NOT NULL COMMENT 'Secret',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '等级ID'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `wp_member_public`
--

INSERT INTO `wp_member_public` (`id`, `uid`, `public_name`, `public_id`, `wechat`, `interface_url`, `headface_url`, `area`, `addon_config`, `addon_status`, `token`, `is_use`, `type`, `appid`, `secret`, `group_id`) VALUES
(75, 161, '古睿信息科技', 'gh_0bc75315088e', 'guruixinxikeji', '', '', '', '{"Wecome":{"type":"3","title":"\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8","description":"\\u7ecd\\u5174\\u53e4\\u777f\\u662f\\u4e00\\u5bb6\\u4e13\\u4e1a\\u7684\\u79fb\\u52a8\\u4ea7\\u54c1\\u5f00\\u53d1\\u516c\\u53f8\\uff0c\\u4ece\\u4e8b\\u5168\\u65b9\\u4f4d\\u7684\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u89e3\\u51b3\\u65b9\\u6848\\u7684\\u7814\\u7a76\\u5f00\\u53d1\\u4e0e\\u4e92\\u8054\\u7f51\\u8425\\u9500\\u670d\\u52a1\\uff0c\\u79c9\\u627f\\u79fb\\u52a8\\u4e92\\u8054\\u7f51\\u81ea\\u7531\\u4ee5\\u53ca\\u53d1\\u5c55\\u8fc5\\u901f\\u7684\\u7279\\u5f81\\uff0c\\u4e13\\u6ce8\\u4e8e\\u4ea7\\u54c1\\u4f18\\u5316\\u4ee5\\u53ca\\u65b0\\u6280\\u672f\\u7684\\u5e94\\u7528\\uff0c\\u73b0\\u6709\\u4e1a\\u52a1\\u8303\\u56f4\\u6d89\\u53ca\\u5fae\\u7ad9\\u5f00\\u53d1\\u3001\\u5fae\\u4fe1\\u516c\\u4f17\\u5e73\\u53f0\\u7684\\u4ee3\\u8fd0\\u8425\\u4e0e\\u670d\\u52a1\\uff0c\\u79fb\\u52a8\\u624b\\u673a\\u7ad9\\u5236\\u4f5c\\u4e0e\\u4f18\\u5316\\uff0c\\u624b\\u673a\\u7aef\\u5e94\\u7528\\u5f00\\u53d1\\uff0cPC\\u7aef\\u9ad8\\u7aef\\u7f51\\u9875\\u5236\\u4f5c\\u4ee5\\u53ca\\u4f01\\u4e1a\\u7f51\\u7ad9\\u4f18\\u5316\\u5347\\u7ea7\\u3002","pic_url":"http:\\/\\/f.hiphotos.baidu.com\\/image\\/w%3D310\\/sign=5923dcefcebf6c81f7372ae98c3fb1d7\\/a5c27d1ed21b0ef4de74a0d9dfc451da80cb3e9c.jpg","url":"http:\\/\\/www.gooraye.com"},"UserCenter":{"need_truename":"1","need_mobile":"1"},"Chat":{"rand_reply":"\\u5ba2\\u670d\\u7535\\u8bdd\\uff1a0575-85060707\\r\\nQQ\\uff1a0575-85060707\\r\\n"},"Card":{"background":"10","bg":"","title":"\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u65f6\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97\\u6240\\u6709","address":"","phone":"","url":"","background_custom":""},"Leaflets":{"title":"\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u5fae\\u4fe1\\u5b98\\u65b9","img":"40","info":"","copyright":"\\u00a92014 \\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u516c\\u4f17\\u53f7\\u7248\\u6743\\u6240\\u6709"},"WeiSite":{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875","cover":"41","info":"\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8","background":"","code":"<script type=\\\\\\\\\\\\\\"text\\/javascript\\\\\\\\\\\\\\">\\r\\nvar _bdhmProtocol = ((\\\\\\\\\\\\\\"https:\\\\\\\\\\\\\\" == document.location.protocol) ? \\\\\\\\\\\\\\" https:\\/\\/\\\\\\\\\\\\\\" : \\\\\\\\\\\\\\" http:\\/\\/\\\\\\\\\\\\\\");\\r\\ndocument.write(unescape(\\\\\\\\\\\\\\"%3Cscript src=\\\\\\\\\\\\''\\\\\\\\\\\\\\" + _bdhmProtocol + \\\\\\\\\\\\\\"hm.baidu.com\\/h.js%3F0cf1c3c27eeb3be94102e955574a5a4e\\\\\\\\\\\\'' type=\\\\\\\\\\\\''text\\/javascript\\\\\\\\\\\\''%3E%3C\\/script%3E\\\\\\\\\\\\\\"));\\r\\n<\\/script>\\r\\n","template_index":"ColorV3","template_footer":"V1","template_lists":"V1","template_detail":"V1","cover_url":"http:\\/\\/www.gooraye.net\\/Uploads\\/Picture\\/2014-05-09\\/536c38f97cb25.png"}}', '', '53663a115a861', 0, '0', '', '', 0),
(76, 162, '戴维营spa会所', 'gh_e65caef2c01d', '1589829293', '', '', '', '', '', '5366f118c9fe7', 1, '1', '', '', 0),
(77, 164, '柯桥戴维营spa', 'gh_e65caef2c01d', 'dwy-spa', '', '', '', '{"Wecome":{"type":"3","title":"\\u6b22\\u8fce\\u5173\\u6ce8\\u6234\\u7ef4\\u8425Spa\\u670d\\u52a1\\u53f7","description":"\\u4e13\\u4e1a\\u517b\\u751fSPA\\u4f1a\\u6240\\uff0c\\u4e8e2013\\u5e746\\u6708\\u4efd\\u5f00\\u4e1a\\uff0c\\u4f4d\\u4e8e\\u67ef\\u6865\\u4e07\\u8fbe\\u5e7f\\u573a\\uff0c\\u7ecd\\u5174\\u5e02\\u6234\\u7ef4\\u8425SPA\\u7f8e\\u5bb9\\u4f1a\\u6240\\u4f4d\\u4e8e\\u7ecd\\u5174\\u67ef\\u6865\\u4e07\\u8fbe\\u5e7f\\u573a\\uff0c\\u5468\\u8fb9\\u9ad8\\u697c\\u6797\\u7acb\\uff0c\\u4f1a\\u6240\\u5185\\u5962\\u534e\\u7684\\u88c5\\u4fee\\uff0c\\u7cbe\\u6cb9\\u7684\\u82b3\\u9999\\uff0c\\u6f7a\\u6f7a\\u7684\\u6d41\\u6c34\\uff0c\\u8ba9\\u6240\\u6709\\u8d70\\u8fdb\\u6234\\u7ef4\\u8425\\u7684\\u6bcf\\u4e00\\u4e2a\\u4eba\\u611f\\u53d7\\u5230\\u7684\\u662f\\u4e00\\u79cd\\u7687\\u5ba4\\u8d35\\u65cf\\u7684\\u5c0a\\u8d35\\uff0c\\u4e16\\u5916\\u6843\\u6e90\\u7684\\u5b81\\u9759\\u3002","pic_url":"http:\\/\\/b.hiphotos.baidu.com\\/image\\/w%3D2048%3Bq%3D90\\/sign=5ea149700846f21fc9345953c21c5011\\/a686c9177f3e67094056427439c79f3df9dc55e2.jpg","url":""},"Chat":{"rand_reply":"\\u6234\\u7ef4\\u8425SPA\\r\\n\\u5730\\u5740\\uff1a\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c\\r\\n\\u7535\\u8bdd\\uff1a0575-89871666\\u300113867519285\\r\\n\\u8425\\u4e1a\\u65f6\\u95f4\\uff1a12:00-\\u6b21\\u65e51:00\\r\\n"},"WeiSite":{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875","cover":"60","info":"\\u6234\\u7ef4\\u8425\\u6210\\u7acb\\u4e8e1982\\u5e74\\uff0c\\u662f\\u4e00\\u5bb6\\u96c6\\u517b\\u751f\\uff0cSPA\\u5065\\u5eb7\\u4ea7\\u4e1a\\u3001\\u9152\\u5e97\\u3001\\u8d38\\u6613\\u7b49\\u4e3a\\u4e00\\u4f53\\u7684\\u8de8\\u56fd\\u8fde\\u9501\\u673a\\u6784\\u3002\\u6234\\u7ef4\\u8425\\u79c9\\u627f\\u4f18\\u8d28\\u7684\\u5065\\u5eb7\\u7406\\u5ff5\\uff0c\\u63d0\\u4f9b\\u9ad8\\u6863\\u6b21\\u3001\\u9ad8\\u6c34\\u51c6\\u5e73\\u7684\\u73af\\u5883\\u8bbe\\u65bd\\u548c\\u4fdd\\u5065\\u670d\\u52a1\\u3002\\u7ea2\\u6728\\u3001\\u6c89\\u9999\\u3001\\u53e4\\u73a9\\u7684\\u70b9\\u7f00\\u4f7f\\u5f97\\u4efb\\u4f55\\u4e00\\u5bb6\\u5206\\u516c\\u53f8\\u90fd\\u4f53\\u73b0\\u51fa\\u6d53\\u539a\\u7684\\u4e2d\\u56fd\\u53e4\\u5178\\u97f5\\u5473\\u548c\\u827a\\u672f\\u6c1b\\u56f4\\uff0c\\u662f\\u73b0\\u4ee3\\u4eba\\u58eb\\u54c1\\u53e4\\u8bba\\u4eca\\u3001\\u653e\\u677e\\u8eab\\u5fc3\\u3001\\u517b\\u751f\\u5065\\u4f53\\u7684\\u805a\\u4f1a\\u573a\\u6240\\u3002 \\u4f4d\\u4e8e\\u67ef\\u6865\\u4e16\\u8d38\\u4e2d\\u5fc3\\u7684\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u6240\\uff0c\\u662f\\u6234\\u7ef4\\u8425\\u7684\\u5347\\u7ea7\\u4e4b\\u4f5c\\uff0c\\u5168\\u65b0\\u5f62\\u8c61\\uff0c\\u5168\\u65b0\\u7075\\u9b42\\u3002\\u5e26\\u6765\\u4e0d\\u4e00\\u6837\\u7684\\u5168\\u65b0\\u4f11\\u95f2\\u611f\\u53d7\\u3002\\u4f1a\\u6240\\u4f18\\u9009\\u4e1c\\u65b9\\u53e4\\u8001\\u517b\\u751f\\u6cd5\\u6709\\u673a\\u62a4\\u7406\\u4ea7\\u54c1\\uff0c\\u7ed3\\u5408\\u6280\\u5e08\\u7cbe\\u6e5b\\u7684\\u6280\\u827a\\uff0c\\u5c06\\u517b\\u751f\\u7f8e\\u989c\\u63d0\\u5347\\u5230\\u79d1\\u5b66\\u3001\\u5185\\u5916\\u517c\\u65bd\\u7684\\u81f3\\u9ad8\\u5883\\u754c\\u3002\\u8bbe\\u8ba1\\u5e08\\u4ece\\u4e2d\\u56fd\\u4f20\\u7edf\\u6587\\u5316\\u4e2d\\u6444\\u53d6\\u8bbe\\u8ba1\\u7075\\u611f\\uff0c\\u6253\\u9020\\u51fa\\u4e00\\u5904\\u81ea\\u7136\\u96c5\\u81f4\\uff0c\\u9759\\u8c27\\u548c\\u8c10\\u7684\\u4f11\\u95f2\\u7a7a\\u95f4\\uff0c\\u5e26\\u7ed9\\u4eba\\u5fc3\\u7075\\u7684\\u611f\\u52a8\\u3002","background":"61","code":"","template_index":"ColorV1","template_footer":"V1","template_lists":"V1","template_detail":"V1","telephone":"0575-85060707"},"Card":{"background":"3","bg":"","title":"\\u6234\\u7ef4\\u8425SPA \\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u6234\\u7ef4\\u8425SPA\\u6240\\u6709","address":"\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c","phone":"0575-89871666","url":"","background_custom":""}}', '', '536e0fac9c2c6', 1, '1', 'wxc5a15c2aae5d3d22', 'f0a0d738f4f6f7f3c3bf09a4c6d120df', 0),
(78, 161, '古睿', 'gh_826a00b218bb', 'gooraye', '', '', '', '{"Wecome":{"type":"3","title":"\\u6b22\\u8fce\\u5173\\u6ce8\\u53e4\\u777f","description":"\\u7ecd\\u5174\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u3002\\r\\n\\u5ba2\\u670d\\u7535\\u8bdd\\uff1a0575-85060707\\r\\n\\u5ba2\\u670dQQ 001\\uff1a1966236348\\r\\n\\u5ba2\\u670dQQ 002\\uff1a2966442390\\r\\n","pic_url":"http:\\/\\/gooraye.qiniudn.com\\/gr_logotext.png","url":"http:\\/\\/www.gooraye.net"},"Chat":{"rand_reply":"\\u5ba2\\u670d\\u7535\\u8bdd\\uff1a0575-85060707\\r\\n\\u5ba2\\u670dQQ001\\uff1a1966236348\\r\\n\\u5ba2\\u670dQQ002\\uff1a2966442390\\r\\n\\u90ae\\u7bb1\\uff1asupport@gooraye.net\\r\\n\\u66f4\\u591a\\u529f\\u80fd\\u63a8\\u51fa\\u4e2d...\\r\\n"}}', '', '53705a8fb5564', 1, '1', 'wx58aea38c0796394d', '3e1404c970566df55d7314ecfe9ff437', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_member_public_group`
--

CREATE TABLE IF NOT EXISTS `wp_member_public_group` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(50) NOT NULL COMMENT '等级名',
  `addon_status` text NOT NULL COMMENT '插件权限'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wp_member_public_group`
--

INSERT INTO `wp_member_public_group` (`id`, `title`, `addon_status`) VALUES
(1, '童生', ''),
(2, '秀才', ''),
(3, '状元', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_menu`
--

CREATE TABLE IF NOT EXISTS `wp_menu` (
`id` int(10) unsigned NOT NULL COMMENT '文档ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否仅开发者模式可见'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- 转存表中的数据 `wp_menu`
--

INSERT INTO `wp_menu` (`id`, `title`, `pid`, `sort`, `url`, `hide`, `tip`, `group`, `is_dev`) VALUES
(1, '首页', 0, 0, 'Index/index', 1, '', '', 1),
(2, '内容', 0, 2, 'Article/mydocument', 1, '', '', 0),
(3, '文档列表', 2, 0, 'article/index', 1, '', '内容', 0),
(4, '新增', 3, 0, 'article/add', 0, '', '', 0),
(5, '编辑', 3, 0, 'article/edit', 0, '', '', 0),
(6, '改变状态', 3, 0, 'article/setStatus', 0, '', '', 0),
(7, '保存', 3, 0, 'article/update', 0, '', '', 0),
(8, '保存草稿', 3, 0, 'article/autoSave', 0, '', '', 0),
(9, '移动', 3, 0, 'article/move', 0, '', '', 0),
(10, '复制', 3, 0, 'article/copy', 0, '', '', 0),
(11, '粘贴', 3, 0, 'article/paste', 0, '', '', 0),
(12, '导入', 3, 0, 'article/batchOperate', 0, '', '', 0),
(13, '回收站', 2, 0, 'article/recycle', 1, '', '内容', 0),
(14, '还原', 13, 0, 'article/permit', 0, '', '', 0),
(15, '清空', 13, 0, 'article/clear', 0, '', '', 0),
(16, '用户', 0, 2, 'User/index', 0, '', '', 0),
(17, '用户信息', 16, 0, 'User/index', 0, '', '用户管理', 0),
(18, '新增用户', 17, 0, 'User/add', 0, '添加新用户', '', 0),
(19, '用户行为', 16, 0, 'User/action', 0, '', '行为管理', 0),
(20, '新增用户行为', 19, 0, 'User/addaction', 0, '', '', 0),
(21, '编辑用户行为', 19, 0, 'User/editaction', 0, '', '', 0),
(22, '保存用户行为', 19, 0, 'User/saveAction', 0, '"用户->用户行为"保存编辑和新增的用户行为', '', 0),
(23, '变更行为状态', 19, 0, 'User/setStatus', 0, '"用户->用户行为"中的启用,禁用和删除权限', '', 0),
(24, '禁用会员', 19, 0, 'User/changeStatus?method=forbidUser', 0, '"用户->用户信息"中的禁用', '', 0),
(25, '启用会员', 19, 0, 'User/changeStatus?method=resumeUser', 0, '"用户->用户信息"中的启用', '', 0),
(26, '删除会员', 19, 0, 'User/changeStatus?method=deleteUser', 0, '"用户->用户信息"中的删除', '', 0),
(27, '权限管理', 16, 0, 'AuthManager/index', 0, '', '用户管理', 0),
(28, '删除', 27, 0, 'AuthManager/changeStatus?method=deleteGroup', 0, '删除用户组', '', 0),
(29, '禁用', 27, 0, 'AuthManager/changeStatus?method=forbidGroup', 0, '禁用用户组', '', 0),
(30, '恢复', 27, 0, 'AuthManager/changeStatus?method=resumeGroup', 0, '恢复已禁用的用户组', '', 0),
(31, '新增', 27, 0, 'AuthManager/createGroup', 0, '创建新的用户组', '', 0),
(32, '编辑', 27, 0, 'AuthManager/editGroup', 0, '编辑用户组名称和描述', '', 0),
(33, '保存用户组', 27, 0, 'AuthManager/writeGroup', 0, '新增和编辑用户组的"保存"按钮', '', 0),
(34, '授权', 27, 0, 'AuthManager/group', 0, '"后台 \\ 用户 \\ 用户信息"列表页的"授权"操作按钮,用于设置用户所属用户组', '', 0),
(35, '访问授权', 27, 0, 'AuthManager/access', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"访问授权"操作按钮', '', 0),
(36, '成员授权', 27, 0, 'AuthManager/user', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"成员授权"操作按钮', '', 0),
(37, '解除授权', 27, 0, 'AuthManager/removeFromGroup', 0, '"成员授权"列表页内的解除授权操作按钮', '', 0),
(38, '保存成员授权', 27, 0, 'AuthManager/addToGroup', 0, '"用户信息"列表页"授权"时的"保存"按钮和"成员授权"里右上角的"添加"按钮)', '', 0),
(39, '分类授权', 27, 0, 'AuthManager/category', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"分类授权"操作按钮', '', 0),
(40, '保存分类授权', 27, 0, 'AuthManager/addToCategory', 0, '"分类授权"页面的"保存"按钮', '', 0),
(41, '模型授权', 27, 0, 'AuthManager/modelauth', 0, '"后台 \\ 用户 \\ 权限管理"列表页的"模型授权"操作按钮', '', 0),
(42, '保存模型授权', 27, 0, 'AuthManager/addToModel', 0, '"分类授权"页面的"保存"按钮', '', 0),
(43, '插件管理', 0, 7, 'Addons/weixin', 0, '', '', 0),
(44, '插件管理', 43, 1, 'Addons/index', 0, '', '扩展', 0),
(45, '创建', 44, 0, 'Addons/create', 0, '服务器上创建插件结构向导', '', 0),
(46, '检测创建', 44, 0, 'Addons/checkForm', 0, '检测插件是否可以创建', '', 0),
(47, '预览', 44, 0, 'Addons/preview', 0, '预览插件定义类文件', '', 0),
(48, '快速生成插件', 44, 0, 'Addons/build', 0, '开始生成插件结构', '', 0),
(49, '设置', 44, 0, 'Addons/config', 0, '设置插件配置', '', 0),
(50, '禁用', 44, 0, 'Addons/disable', 0, '禁用插件', '', 0),
(51, '启用', 44, 0, 'Addons/enable', 0, '启用插件', '', 0),
(52, '安装', 44, 0, 'Addons/install', 0, '安装插件', '', 0),
(53, '卸载', 44, 0, 'Addons/uninstall', 0, '卸载插件', '', 0),
(54, '更新配置', 44, 0, 'Addons/saveconfig', 0, '更新插件配置处理', '', 0),
(55, '插件后台列表', 44, 0, 'Addons/adminList', 0, '', '', 0),
(56, 'URL方式访问插件', 44, 0, 'Addons/execute', 0, '控制是否有权限通过url访问插件控制器方法', '', 0),
(57, '钩子管理', 43, 3, 'Addons/hooks', 0, '', '扩展', 0),
(58, '模型管理', 68, 3, 'Model/index', 0, '', '系统设置', 0),
(59, '新增', 58, 0, 'model/add', 0, '', '', 0),
(60, '编辑', 58, 0, 'model/edit', 0, '', '', 0),
(61, '改变状态', 58, 0, 'model/setStatus', 0, '', '', 0),
(62, '保存数据', 58, 0, 'model/update', 0, '', '', 0),
(63, '属性管理', 68, 0, 'Attribute/index', 0, '网站属性配置。', '', 0),
(64, '新增', 63, 0, 'Attribute/add', 0, '', '', 0),
(65, '编辑', 63, 0, 'Attribute/edit', 0, '', '', 0),
(66, '改变状态', 63, 0, 'Attribute/setStatus', 0, '', '', 0),
(67, '保存数据', 63, 0, 'Attribute/update', 0, '', '', 0),
(68, '系统', 0, 1, 'Config/group', 0, '', '', 0),
(69, '网站设置', 68, 1, 'Config/group', 0, '', '系统设置', 0),
(70, '配置管理', 68, 4, 'Config/index', 0, '', '系统设置', 0),
(71, '编辑', 70, 0, 'Config/edit', 0, '新增编辑和保存配置', '', 0),
(72, '删除', 70, 0, 'Config/del', 0, '删除配置', '', 0),
(73, '新增', 70, 0, 'Config/add', 0, '新增配置', '', 0),
(74, '保存', 70, 0, 'Config/save', 0, '保存配置', '', 0),
(75, '菜单管理', 68, 5, 'Menu/index', 0, '', '系统设置', 0),
(133, '编辑', 131, 0, 'Channel/edit', 0, '', '', 0),
(134, '删除', 131, 0, 'Channel/del', 0, '', '', 0),
(141, '内容管理', 130, 0, 'admin/Article/index?cate_id=1', 0, '', '栏目管理', 0),
(81, '编辑', 80, 0, 'Category/edit', 0, '编辑和保存栏目分类', '', 0),
(82, '新增', 80, 0, 'Category/add', 0, '新增栏目分类', '', 0),
(83, '删除', 80, 0, 'Category/remove', 0, '删除栏目分类', '', 0),
(84, '移动', 80, 0, 'Category/operate/type/move', 0, '移动栏目分类', '', 0),
(85, '合并', 80, 0, 'Category/operate/type/merge', 0, '合并栏目分类', '', 0),
(86, '备份数据库', 68, 0, 'Database/index?type=export', 0, '', '数据备份', 0),
(87, '备份', 86, 0, 'Database/export', 0, '备份数据库', '', 0),
(88, '优化表', 86, 0, 'Database/optimize', 0, '优化数据表', '', 0),
(89, '修复表', 86, 0, 'Database/repair', 0, '修复数据表', '', 0),
(90, '还原数据库', 68, 0, 'Database/index?type=import', 0, '', '数据备份', 0),
(91, '恢复', 90, 0, 'Database/import', 0, '数据库恢复', '', 0),
(92, '删除', 90, 0, 'Database/del', 0, '删除备份文件', '', 0),
(93, '其他', 0, 5, 'other', 1, '', '', 0),
(96, '新增', 75, 0, 'Menu/add', 0, '', '系统设置', 0),
(98, '编辑', 75, 0, 'Menu/edit', 0, '', '', 0),
(104, '下载管理', 102, 0, 'Think/lists?model=download', 0, '', '', 0),
(105, '配置管理', 102, 0, 'Think/lists?model=config', 0, '', '', 0),
(106, '行为日志', 16, 0, 'Action/actionlog', 0, '', '行为管理', 0),
(108, '修改密码', 16, 0, 'User/updatePassword', 1, '', '', 0),
(109, '修改昵称', 16, 0, 'User/updateNickname', 1, '', '', 0),
(110, '查看行为日志', 106, 0, 'action/edit', 1, '', '', 0),
(112, '新增数据', 58, 0, 'think/add', 1, '', '', 0),
(113, '编辑数据', 58, 0, 'think/edit', 1, '', '', 0),
(114, '导入', 75, 0, 'Menu/import', 0, '', '', 0),
(115, '生成', 58, 0, 'Model/generate', 0, '', '', 0),
(116, '新增钩子', 57, 0, 'Addons/addHook', 0, '', '', 0),
(117, '编辑钩子', 57, 0, 'Addons/edithook', 0, '', '', 0),
(118, '文档排序', 3, 0, 'Article/sort', 1, '', '', 0),
(119, '排序', 70, 0, 'Config/sort', 1, '', '', 0),
(120, '排序', 75, 0, 'Menu/sort', 1, '', '', 0),
(135, '分类管理', 130, 0, 'Category/index', 0, '主要对前台内容进行分类', '栏目管理', 0),
(124, '微信插件', 43, 0, 'admin/addons/weixin', 0, '', '扩展', 0),
(126, '公众号等级', 16, 0, 'admin/PublicGroup/PublicGroup', 0, '', '公众号管理', 0),
(127, '公众号管理', 16, 1, 'admin/PublicGroup/PublicAdmin', 0, '', '公众号管理', 0),
(128, '在线升级', 68, 5, 'admin/update/index', 0, '', '系统设置', 0),
(129, '清除缓存', 68, 10, 'admin/Update/delcache', 0, '', '系统设置', 0),
(130, 'CMS管理', 0, 0, 'admin/ctrl/index', 0, '前台一级导航', '', 0),
(131, '导航管理', 130, 0, 'admin/channel/index', 0, '前台页面所属的分类管理', '栏目管理', 0),
(132, '新增', 131, 0, 'Channel/add', 0, '', '', 0),
(136, '编辑', 135, 0, 'Category/edit', 0, '', '', 0),
(137, '新增', 135, 0, 'Category/add', 0, '', '', 0),
(138, '删除', 135, 0, 'Category/remove', 0, '', '', 0),
(139, '移动', 135, 0, 'Category/operate/type/move', 0, '', '', 0),
(140, '合并', 135, 0, 'Category/operate/type/merge', 0, '', '', 0),
(142, '微信日志管理', 130, 0, 'admin/WeixinLog/index', 0, '', '日志管理', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_model`
--

CREATE TABLE IF NOT EXISTS `wp_model` (
`id` int(10) unsigned NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '模型标识',
  `title` char(30) NOT NULL DEFAULT '' COMMENT '模型名称',
  `extend` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '继承的模型',
  `relation` varchar(30) NOT NULL DEFAULT '' COMMENT '继承与被继承模型的关联字段',
  `need_pk` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '新建表时是否需要主键字段',
  `field_sort` text NOT NULL COMMENT '表单字段排序',
  `field_group` varchar(255) NOT NULL DEFAULT '1:基础' COMMENT '字段分组',
  `attribute_list` text NOT NULL COMMENT '属性列表（表的字段）',
  `template_list` varchar(100) NOT NULL DEFAULT '' COMMENT '列表模板',
  `template_add` varchar(100) NOT NULL DEFAULT '' COMMENT '新增模板',
  `template_edit` varchar(100) NOT NULL DEFAULT '' COMMENT '编辑模板',
  `list_grid` text NOT NULL COMMENT '列表定义',
  `list_row` smallint(2) unsigned NOT NULL DEFAULT '10' COMMENT '列表数据长度',
  `search_key` varchar(50) NOT NULL DEFAULT '' COMMENT '默认搜索字段',
  `search_list` varchar(255) NOT NULL DEFAULT '' COMMENT '高级搜索的字段',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `engine_type` varchar(25) NOT NULL DEFAULT 'MyISAM' COMMENT '数据库引擎'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `wp_model`
--

INSERT INTO `wp_model` (`id`, `name`, `title`, `extend`, `relation`, `need_pk`, `field_sort`, `field_group`, `attribute_list`, `template_list`, `template_add`, `template_edit`, `list_grid`, `list_row`, `search_key`, `search_list`, `create_time`, `update_time`, `status`, `engine_type`) VALUES
(1, 'document', '基础文档', 0, '', 1, '{"1":["uid","name","title","category_id","description","root","pid","model_id","type","position","link_id","cover_id","display","deadline","attach","view","comment","extend","level","create_time","update_time","status"]}', '1:基础', '', '', '', '', 'id:编号\r\ntitle:标题:article/index?cate_id=[category_id]&pid=[id]\r\ntype|get_document_type:类型\r\nlevel:优先级\r\nupdate_time|time_format:最后更新\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|删除', 0, '', '', 1383891233, 1384507827, 1, 'MyISAM'),
(2, 'article', '文章', 1, '', 1, '{"1":{"1":"content"}}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题:article/edit?cate_id=[category_id]&id=[id]\r\ncontent:内容', 0, '', '', 1383891243, 1388921230, 1, 'MyISAM'),
(6, 'vote', '投票', 0, '', 1, '{"1":["keyword","title","description","picurl","type","start_date","end_date"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\ntitle:投票标题\r\ntype|get_name_by_status:类型\r\nis_img|get_name_by_status:状态\r\nvote_count:投票数\r\nid:操作:show&id=[id]|预览,[EDIT]&id=[id]|编辑,[DELETE]|删除', 20, 'title', 'description', 1388930292, 1391397755, 1, 'MyISAM'),
(3, 'download', '下载', 1, '', 1, '{"1":{"1":"content","2":"file_id","3":"size","6":"download"},"2":{"2":"parse","11":"template"}}', '1:基础,2:扩展', '', '', '', '', 'id:编号\r\ntitle:标题', 0, '', '', 1383891252, 1387260449, 1, 'MyISAM'),
(5, 'keyword', '关键词表', 0, '', 1, '{"1":["keyword","addon","aim_id","cTime"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:关键词\r\naddon:所属插件\r\naim_id:插件数据ID\r\ncTime|time_format:增加时间\r\nstatus_text:状态\r\nview:浏览\r\nid:操作:[EDIT]&cate_id=[category_id]|编辑,article/setstatus?status=-1&ids=[id]|假删除,[DELETE]|删除', 10, 'keyword', '', 1388815871, 1388929956, 1, 'MyISAM'),
(7, 'vote_option', '投票选项', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1388933346, 1388933346, 1, 'MyISAM'),
(8, 'vote_log', '投票记录', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1388934136, 1388934136, 1, 'MyISAM'),
(11, 'member_public', '公众号管理', 0, '', 1, '{"1":["public_name","public_id","wechat","type","appid","secret","headface_url"]}', '1:基础', '', '', '', '', 'public_name:公众号名称\r\nheadface_url:公众号头像\r\ntoken:Token\r\nis_use|get_name_by_status:当前公众号\r\nid:操作:[EDIT]&id=[id]|编辑,[DELETE]&id=[id]|删除,changPublic&id=[id]|切换为当前公众号,help&public_id=[id]#weixin_set|接口配置', 20, 'public_name', '', 1391575109, 1397737988, 1, 'MyISAM'),
(21, 'suggestions', '建议意见', 0, '', 1, '', '1:基础', '', '', '', '', 'uid:姓名\r\ncontent:内容\r\nmobile:联系方式\r\ncTime|time_format:创建时间\r\nid:操作:[EDIT]&amp;id=[id]|编辑,[DELETE]&amp;id=[id]|删除', 10, 'content', '', 1393234169, 1394275161, 1, 'MyISAM'),
(14, 'member_public_group', '公众号等级', 0, '', 1, '{"1":["title","addon_status"]}', '1:基础', '', '', '', '', 'id:等级ID\r\ntitle:等级名\r\naddon_status:授权的插件\r\npublic_count:公众号数\r\nid:操作:editPublicGroup&amp;id=[id]|编辑,delPublicGroup&amp;id=[id]|删除', 10, 'title', '', 1393724788, 1394275640, 1, 'MyISAM'),
(15, 'update_version', '系统版本升级', 0, '', 1, '{"1":["version","title","description","create_date","package"]}', '1:基础', '', '', '', '', 'version:版本号\r\ntitle:升级包名\r\ndescription:描述\r\ncreate_date|time_format:创建时间\r\ndownload_count:下载统计数\r\nid:操作:[EDIT]&amp;id=[id]|编辑,[DELETE]&amp;id=[id]|删除', 10, 'title', '', 1393770420, 1394275597, 1, 'MyISAM'),
(24, 'extensions', '融合第三方', 0, '', 1, '{"1":["keyword","keyword_type","keyword_filter","output_format","api_url","api_token"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_filter|get_name_by_status:关键词过滤\r\noutput_format|get_name_by_status:数据输出格式\r\napi_url:第三方地址\r\napi_token:Token\r\ncTime|time_format:增加时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'keyword', '', 1393911774, 1394776617, 1, 'MyISAM'),
(28, 'custom_reply_mult', '多图文配置', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1396602475, 1396602475, 1, 'MyISAM'),
(29, 'custom_reply_news', '图文回复', 0, '', 1, '{"1":["keyword","keyword_type","title","intro","cate_id","cover","content"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncate_id:所属分类\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1396580496, 1, 'MyISAM'),
(30, 'custom_reply_text', '文本回复', 0, '', 1, '{"1":["keyword","keyword_type","content"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\nsort:排序号\r\nview_count:浏览数\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'keyword', '', 1396578172, 1396580606, 1, 'MyISAM'),
(31, 'weisite_category', '微官网分类', 0, '', 1, '{"1":["title","icon","url","is_show"]}', '1:基础', '', '', '', '', 'title:分类标题\r\nicon:分类图片\r\nurl:外链\r\nsort:排序号\r\nis_show|get_name_by_status:显示\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1395987942, 1396340374, 1, 'MyISAM'),
(32, 'weisite_slideshow', '幻灯片', 0, '', 1, '{"1":["title","img","url","is_show","sort"]}', '1:基础', '', '', '', '', 'title:标题\r\nimg:图片\r\nurl:链接地址\r\nis_show|get_name_by_status:显示\r\nsort:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396098264, 1396099200, 1, 'MyISAM'),
(33, 'weisite_footer', '底部导航', 0, '', 1, '{"1":["pid","title","url","sort"]}', '1:基础', '', '', '', '', 'title:菜单名\r\nicon:图标\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1394518309, 1396507698, 1, 'MyISAM'),
(34, 'custom_menu', '自定义菜单', 0, '', 1, '', '1:基础', '', '', '', '', 'title:菜单名\r\nkeyword:关联关键词\r\nurl:关联URL\r\nsort:排序号\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1394518309, 1394720290, 1, 'MyISAM'),
(35, 'card_coupons', '会员卡优惠券', 0, '', 1, '{"1":["title","give_type","start_date","end_date","content"]}', '1:基础', '', '', '', '', 'title:标题\r\ngive_type|get_name_by_status:发放方式\r\nstart_date|time_format:开始时间\r\nend_date|time_format:结束时间\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1395485774, 1395486719, 1, 'MyISAM'),
(36, 'card_notice', '会员卡通知', 0, '', 1, '{"1":["title","content"]}', '1:基础', '', '', '', '', 'title:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1395485156, 1395485486, 1, 'MyISAM'),
(37, 'card_member', '会员卡成员', 0, '', 1, '{"1":["username","phone"]}', '1:基础', '', '', '', '', 'number:卡号\r\nusername:姓名\r\nphone:手机号\r\ncTime|time_format:加入时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'username', '', 1395482804, 1395484751, 1, 'MyISAM'),
(38, 'online_booking', '在线预约', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1400033748, 1400033748, 1, 'MyISAM');

-- --------------------------------------------------------

--
-- 表的结构 `wp_online_booking`
--

CREATE TABLE IF NOT EXISTS `wp_online_booking` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `info` text NOT NULL COMMENT '备注',
  `type` varchar(255) NOT NULL COMMENT '选择项目',
  `timepart` varchar(255) NOT NULL COMMENT '时间段',
  `dateline` int(10) NOT NULL COMMENT '日期',
  `tel` varchar(50) NOT NULL COMMENT '手机号码',
  `truename` varchar(50) NOT NULL COMMENT '姓名',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `openid` varchar(255) NOT NULL COMMENT 'openid',
  `status` char(50) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wp_online_booking`
--

INSERT INTO `wp_online_booking` (`id`, `info`, `type`, `timepart`, `dateline`, `tel`, `truename`, `token`, `openid`, `status`) VALUES
(1, '', 'house_book', '8:00-9:00', 0, '', '', '', '', '0'),
(2, '11', 'house_book', '17:00-18:00', 0, '12345678900', '11', '53705a8fb5564', '-1', '0'),
(3, '11', 'house_book', '17:00-18:00', 0, '12345678900', '11', '53705a8fb5564', '-1', '0'),
(4, '11', 'house_book', '17:00-18:00', 0, '12345678900', '11', '53705a8fb5564', '-1', '0');

-- --------------------------------------------------------

--
-- 表的结构 `wp_panorama`
--

CREATE TABLE IF NOT EXISTS `wp_panorama` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `keyword_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '关键词类型',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `intro` text NOT NULL COMMENT '封面简介',
  `mTime` int(10) NOT NULL COMMENT '修改时间',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `picture1` int(10) unsigned NOT NULL COMMENT '前',
  `picture2` int(10) unsigned NOT NULL COMMENT '右',
  `picture3` int(10) unsigned NOT NULL COMMENT '后',
  `picture4` int(10) unsigned NOT NULL COMMENT '左',
  `picture5` int(10) unsigned NOT NULL COMMENT '上',
  `picture6` int(10) unsigned NOT NULL COMMENT '下'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_picture`
--

CREATE TABLE IF NOT EXISTS `wp_picture` (
`id` int(10) unsigned NOT NULL COMMENT '主键id自增',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `wp_picture`
--

INSERT INTO `wp_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(39, '/Uploads/Picture/2014-05-09/536c337f58b83.jpg', '', '1fff4370a9dd0fa33a4141c0eb2e575a', 'd0fea195e543c7d7c329bbb2acc2d108f0e8cce2', 1, 1399599999),
(40, '/Uploads/Picture/2014-05-09/536c34b4ee73c.jpg', '', 'f5a3b2ab608ba6b1f63decb23a91fa4f', '1422eb54883fa42c365279a532676f783408ddbf', 1, 1399600308),
(41, '/Uploads/Picture/2014-05-09/536c38f97cb25.png', '', '100fae3f4e302856ed6aef6b46193876', '9d9a520273f74b0acf6cd9f1f5ed607c93a6cb80', 1, 1399601400),
(42, '/Uploads/Picture/2014-05-09/536cbf9d3747f.png', '', '2fb8adfe5e5d0a41cfcb4aeab3ea435b', '7a4fd4c7960b89089ef5bac415aa0ff482808e5b', 1, 1399635869),
(64, 'http://gooraye.qiniudn.com/2014-05-14_5372b811c487f.jpg', 'http://gooraye.qiniudn.com/2014-05-14_5372b811c487f.jpg', '058d77e51b4a560d4a8fef215457668a', 'b764622914d18aff6b9c576a399c82d37b7a547d', 1, 1400027153),
(61, 'http://gooraye.qiniudn.com/2014-05-14_5372b4a0651aa.png', 'http://gooraye.qiniudn.com/2014-05-14_5372b4a0651aa.png', 'b5d2000141bb6764eb63521aaa8957f8', 'cef80c019724a26a9133f365535794cd71be5491', 1, 1400026265),
(50, 'http://gooraye.qiniudn.com/2014-05-13_5371ac1f2d115.png', 'http://gooraye.qiniudn.com/2014-05-13_5371ac1f2d115.png', '8028b19e1693db293b1aef6bce959f6b', 'ec644cf9def8cc025dd4e6e96d79c528a09688e9', 1, 1399958554),
(49, 'http://gooraye.qiniudn.com/2014-05-13_5371abdf92203.png', 'http://gooraye.qiniudn.com/2014-05-13_5371abdf92203.png', 'c1e8ba05e53b982c8554583e0c0e7a05', '186668f69d3d7fabaebb2d1f480032524960064c', 1, 1399958491),
(51, 'http://gooraye.qiniudn.com/2014-05-13_5371ade94420f.png', 'http://gooraye.qiniudn.com/2014-05-13_5371ade94420f.png', '61547644479b92c64d42cf37708d5bd0', '952479e5dfd8f7224eeb67a0d92bfc39fd27e91b', 1, 1399959016),
(52, 'http://gooraye.qiniudn.com/2014-05-13_5371ae002d2f2.png', 'http://gooraye.qiniudn.com/2014-05-13_5371ae002d2f2.png', '46aa20afb6d3415b2b9989316dabafbd', 'dca4ecf3f72c03e1a459a261bf0dafd8659bdd32', 1, 1399959038),
(63, 'http://gooraye.qiniudn.com/2014-05-14_5372b6c0a5314.png', 'http://gooraye.qiniudn.com/2014-05-14_5372b6c0a5314.png', '3c772a5a0e81c4e8b10d396d02b6f528', '66754aee148b1361106b4880d872c6e042065b78', 1, 1400026813),
(62, 'http://gooraye.qiniudn.com/2014-05-14_5372b6b1219a8.png', 'http://gooraye.qiniudn.com/2014-05-14_5372b6b1219a8.png', '73c8b63c6cf5323a3916dba8ed759814', 'b07ffccfe517034cdc0ae2a60b264d5afe9c9f60', 1, 1400026798),
(55, 'http://gooraye.qiniudn.com/2014-05-13_5371ae35ac653.png', 'http://gooraye.qiniudn.com/2014-05-13_5371ae35ac653.png', '57cf6026bb9f1f2dbb875e00940ce674', 'b908664dd3702c0f6ce702c74820769d232de750', 1, 1399959092),
(56, 'http://gooraye.qiniudn.com/2014-05-13_5371ae4bdeb19.png', 'http://gooraye.qiniudn.com/2014-05-13_5371ae4bdeb19.png', 'bfe81c8841123c3e558482a377327deb', 'ddd5571e866055856fd26cfb3b6d164190d5e723', 1, 1399959115),
(60, 'http://gooraye.qiniudn.com/2014-05-14_5372b48d0cb83.png', 'http://gooraye.qiniudn.com/2014-05-14_5372b48d0cb83.png', '3039f5353358f3c938d2fb009c5a87f0', '1aaef4d1b281e0e26defa7dd185f3be0e9af827b', 1, 1400026252);

-- --------------------------------------------------------

--
-- 表的结构 `wp_suggestions`
--

CREATE TABLE IF NOT EXISTS `wp_suggestions` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_ucenter_admin`
--

CREATE TABLE IF NOT EXISTS `wp_ucenter_admin` (
`id` int(10) unsigned NOT NULL COMMENT '管理员ID',
  `member_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员用户ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '管理员状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_ucenter_app`
--

CREATE TABLE IF NOT EXISTS `wp_ucenter_app` (
`id` int(10) unsigned NOT NULL COMMENT '应用ID',
  `title` varchar(30) NOT NULL COMMENT '应用名称',
  `url` varchar(100) NOT NULL COMMENT '应用URL',
  `ip` char(15) NOT NULL COMMENT '应用IP',
  `auth_key` varchar(100) NOT NULL COMMENT '加密KEY',
  `sys_login` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '同步登陆',
  `allow_ip` varchar(255) NOT NULL COMMENT '允许访问的IP',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '应用状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_ucenter_member`
--

CREATE TABLE IF NOT EXISTS `wp_ucenter_member` (
`id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `email` char(32) NOT NULL COMMENT '用户邮箱',
  `mobile` char(15) NOT NULL COMMENT '用户手机',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登陆时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登陆IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=171 ;

--
-- 转存表中的数据 `wp_ucenter_member`
--

INSERT INTO `wp_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '2c9efefa74f29653d9e4afc24f091d9c', '136799711@qq.com', '', 1399178896, 2130706433, 1400036538, 2130706433, 1399178896, 1),
(161, 'gooraye', 'fc2ae5c202e7799c7dfc911c39496397', '346551990@qq.com', '', 1399193143, 2130706433, 1400114969, 2130706433, 1399193143, 1),
(162, 'spa001', '9de72bee866252f0d16bf970c4d328bd', '123456789@qq.com', '', 1399254104, 2130706433, 1399254141, 2130706433, 1399254104, 1),
(163, 'oQJWet3cxXR84wEa2UDrI08eXjug', 'fc2ae5c202e7799c7dfc911c39496397', '1399643566@weiphp.cn', '', 1399643566, 2061514924, 0, 0, 1399643566, 1),
(164, 'dwyspa', 'fc2ae5c202e7799c7dfc911c39496397', '123456@qq.com', '', 1399721823, 2061514924, 1400034134, 2130706433, 1399721823, 1),
(165, 'oy6EYuNwX9g9u-E-7FQ72-avknmY', 'fc2ae5c202e7799c7dfc911c39496397', '1399722875@weiphp.cn', '', 1399722875, 2362390096, 0, 0, 1399722875, 1),
(166, 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', 'fc2ae5c202e7799c7dfc911c39496397', '1399873840@weiphp.cn', '', 1399873840, 2362390094, 0, 0, 1399873840, 1),
(167, 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', 'fc2ae5c202e7799c7dfc911c39496397', '1399963587@weiphp.cn', '', 1399963587, 2362390089, 0, 0, 1399963587, 1),
(168, 'oQJWetwWiJTbAt2v-3YojPisYtco', 'fc2ae5c202e7799c7dfc911c39496397', '1399963709@weiphp.cn', '', 1399963709, 2362390089, 0, 0, 1399963709, 1),
(169, 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', 'fc2ae5c202e7799c7dfc911c39496397', '1399975103@weiphp.cn', '', 1399975103, 2362390089, 0, 0, 1399975103, 1),
(170, 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', 'fc2ae5c202e7799c7dfc911c39496397', '1399976704@weiphp.cn', '', 1399976704, 2362390089, 0, 0, 1399976704, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wp_ucenter_setting`
--

CREATE TABLE IF NOT EXISTS `wp_ucenter_setting` (
`id` int(10) unsigned NOT NULL COMMENT '设置ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型（1-用户配置）',
  `value` text NOT NULL COMMENT '配置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='设置表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_update_version`
--

CREATE TABLE IF NOT EXISTS `wp_update_version` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `version` int(10) unsigned NOT NULL COMMENT '版本号',
  `title` varchar(50) NOT NULL COMMENT '升级包名',
  `description` text NOT NULL COMMENT '描述',
  `create_date` int(10) NOT NULL COMMENT '创建时间',
  `download_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载统计',
  `package` varchar(255) NOT NULL COMMENT '升级包地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_url`
--

CREATE TABLE IF NOT EXISTS `wp_url` (
`id` int(11) unsigned NOT NULL COMMENT '链接唯一标识',
  `url` char(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `short` char(100) NOT NULL DEFAULT '' COMMENT '短网址',
  `status` tinyint(2) NOT NULL DEFAULT '2' COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='链接表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_userdata`
--

CREATE TABLE IF NOT EXISTS `wp_userdata` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型标识',
  `target_id` int(10) unsigned NOT NULL COMMENT '目标id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `wp_vote`
--

CREATE TABLE IF NOT EXISTS `wp_vote` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(50) NOT NULL COMMENT '关键词',
  `title` varchar(100) NOT NULL COMMENT '投票标题',
  `description` text NOT NULL COMMENT '投票描述',
  `picurl` int(10) unsigned NOT NULL COMMENT '封面图片',
  `type` char(10) NOT NULL DEFAULT '0' COMMENT '选择类型',
  `start_date` int(10) NOT NULL COMMENT '开始日期',
  `end_date` int(10) NOT NULL COMMENT '结束日期',
  `is_img` tinyint(2) NOT NULL DEFAULT '0' COMMENT '文字/图片投票',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票数',
  `cTime` int(10) NOT NULL COMMENT '投票创建时间',
  `mTime` int(10) NOT NULL COMMENT '更新时间',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_vote_log`
--

CREATE TABLE IF NOT EXISTS `wp_vote_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `vote_id` int(10) unsigned NOT NULL COMMENT '投票ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `token` varchar(255) NOT NULL COMMENT '用户TOKEN',
  `options` varchar(255) NOT NULL COMMENT '选择选项',
  `cTime` int(10) NOT NULL COMMENT '创建时间'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_vote_option`
--

CREATE TABLE IF NOT EXISTS `wp_vote_option` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `vote_id` int(10) unsigned NOT NULL COMMENT '投票ID',
  `name` varchar(255) NOT NULL COMMENT '选项标题',
  `image` int(10) unsigned NOT NULL COMMENT '图片选项',
  `opt_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前选项投票数',
  `order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '选项排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- 表的结构 `wp_weisite_category`
--

CREATE TABLE IF NOT EXISTS `wp_weisite_category` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '分类标题',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '分类图片',
  `url` varchar(255) NOT NULL COMMENT '外链',
  `is_show` tinyint(2) NOT NULL DEFAULT '1' COMMENT '显示',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `sort` int(10) DEFAULT '0' COMMENT '排序号',
  `imgurl` varchar(255) NOT NULL COMMENT '图片外链'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wp_weisite_category`
--

INSERT INTO `wp_weisite_category` (`id`, `title`, `icon`, `url`, `is_show`, `token`, `sort`, `imgurl`) VALUES
(1, '微官网', 42, '', 1, '53663a115a861', 0, ''),
(2, '内部展示', 49, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/lists/cate_id/2.html', 1, '536e0fac9c2c6', 1, ''),
(3, '企业简介', 64, '', 1, '536e0fac9c2c6', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_weisite_footer`
--

CREATE TABLE IF NOT EXISTS `wp_weisite_footer` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `url` varchar(255) DEFAULT NULL COMMENT '关联URL',
  `title` varchar(50) NOT NULL COMMENT '菜单名',
  `pid` tinyint(2) DEFAULT '0' COMMENT '一级菜单',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序号',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `icon` int(10) unsigned DEFAULT NULL COMMENT '图标'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wp_weisite_footer`
--

INSERT INTO `wp_weisite_footer` (`id`, `url`, `title`, `pid`, `sort`, `token`, `icon`) VALUES
(1, 'http://www.gooraye.com', '公司主页', 0, 1, '53663a115a861', 0),
(2, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index', '首页', 0, 0, '536e0fac9c2c6', 0),
(3, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index', '在线预约', 0, 0, '536e0fac9c2c6', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_weisite_slideshow`
--

CREATE TABLE IF NOT EXISTS `wp_weisite_slideshow` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img` int(10) unsigned NOT NULL COMMENT '图片',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `is_show` tinyint(2) DEFAULT '1' COMMENT '是否显示',
  `sort` int(10) unsigned DEFAULT '0' COMMENT '排序',
  `token` varchar(100) DEFAULT NULL COMMENT 'Token',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片外链'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `wp_weisite_slideshow`
--

INSERT INTO `wp_weisite_slideshow` (`id`, `title`, `img`, `url`, `is_show`, `sort`, `token`, `imgurl`) VALUES
(1, '古睿', 42, '', 1, 0, '53663a115a861', ''),
(2, '001', 51, '', 1, 0, '536e0fac9c2c6', ''),
(3, '002', 52, '', 1, 0, '536e0fac9c2c6', ''),
(4, '003', 63, '', 1, 0, '536e0fac9c2c6', ''),
(5, '004', 62, '', 1, 0, '536e0fac9c2c6', ''),
(6, '005', 55, '', 1, 0, '536e0fac9c2c6', ''),
(7, '006', 56, '', 1, 0, '536e0fac9c2c6', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_weixin_log`
--

CREATE TABLE IF NOT EXISTS `wp_weixin_log` (
`id` int(11) NOT NULL,
  `cTime` int(11) DEFAULT NULL,
  `cTime_format` varchar(30) DEFAULT NULL,
  `data` text,
  `data_post` text
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=220 ;

--
-- 转存表中的数据 `wp_weixin_log`
--

INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(124, 1399648262, '2014-05-09 23:11:02', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet3cxXR84wEa2UDrI08eXjug";s:10:"CreateTime";s:10:"1399648261";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"d";s:5:"MsgId";s:19:"6011443507098543239";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></FromUserName>\n<CreateTime>1399648261</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[d]]></Content>\n<MsgId>6011443507098543239</MsgId>\n</xml>'),
(125, 1399648262, '2014-05-09 23:11:02', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707]]></Content><ToUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399648262</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(126, 1399648307, '2014-05-09 23:11:47', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet3cxXR84wEa2UDrI08eXjug";s:10:"CreateTime";s:10:"1399648307";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"d";s:5:"MsgId";s:19:"6011443704667038860";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></FromUserName>\n<CreateTime>1399648307</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[d]]></Content>\n<MsgId>6011443704667038860</MsgId>\n</xml>'),
(127, 1399648307, '2014-05-09 23:11:47', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707]]></Content><ToUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399648307</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(128, 1399648308, '2014-05-09 23:11:48', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet3cxXR84wEa2UDrI08eXjug";s:10:"CreateTime";s:10:"1399648307";s:7:"MsgType";s:4:"text";s:7:"Content";s:3:"的";s:5:"MsgId";s:19:"6011443704667038861";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></FromUserName>\n<CreateTime>1399648307</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[的]]></Content>\n<MsgId>6011443704667038861</MsgId>\n</xml>'),
(129, 1399648308, '2014-05-09 23:11:48', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707]]></Content><ToUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399648308</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(130, 1399648344, '2014-05-09 23:12:24', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet3cxXR84wEa2UDrI08eXjug";s:10:"CreateTime";s:10:"1399648344";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"df";s:5:"MsgId";s:19:"6011443863580828816";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></FromUserName>\n<CreateTime>1399648344</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[df]]></Content>\n<MsgId>6011443863580828816</MsgId>\n</xml>'),
(131, 1399648344, '2014-05-09 23:12:24', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707QQ：0575-85060707]]></Content><ToUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399648344</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(132, 1399648384, '2014-05-09 23:13:04', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet3cxXR84wEa2UDrI08eXjug";s:10:"CreateTime";s:10:"1399648384";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"d";s:5:"MsgId";s:19:"6011444035379520660";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></FromUserName>\n<CreateTime>1399648384</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[d]]></Content>\n<MsgId>6011444035379520660</MsgId>\n</xml>'),
(133, 1399648384, '2014-05-09 23:13:04', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\nQQ：0575-85060707\n]]></Content><ToUserName><![CDATA[oQJWet3cxXR84wEa2UDrI08eXjug]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399648384</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(134, 1399722856, '2014-05-10 19:54:16', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399722855";s:7:"MsgType";s:5:"event";s:5:"Event";s:11:"unsubscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399722855</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(135, 1399722875, '2014-05-10 19:54:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399722874";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399722874</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(136, 1399722875, '2014-05-10 19:54:35', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399722875</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(137, 1399871725, '2014-05-12 13:15:25', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399871724";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"官网";s:5:"MsgId";s:19:"6012403273375507035";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399871724</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[官网]]></Content>\n<MsgId>6012403273375507035</MsgId>\n</xml>'),
(138, 1399871725, '2014-05-12 13:15:25', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我今天累了，明天再陪你聊天吧\n哈哈~~\n你话好多啊，不跟你聊了\n虽然不懂，但觉得你说得很对\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399871725</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(139, 1399871738, '2014-05-12 13:15:38', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399871737";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微官网";s:5:"MsgId";s:19:"6012403329210081886";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399871737</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微官网]]></Content>\n<MsgId>6012403329210081886</MsgId>\n</xml>'),
(140, 1399871738, '2014-05-12 13:15:38', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[点击进入首页]]></Title><Description></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399871738</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(141, 1399873813, '2014-05-12 13:50:13', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1399873812";s:7:"MsgType";s:5:"event";s:5:"Event";s:11:"unsubscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1399873812</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(142, 1399873840, '2014-05-12 13:50:40', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1399873839";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1399873839</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(143, 1399873840, '2014-05-12 13:50:40', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注古睿]]></Title><Description><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575-85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399873840</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(144, 1399876865, '2014-05-12 14:41:05', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1399876863";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"古睿";s:5:"MsgId";s:19:"6012425345212177526";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1399876863</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[古睿]]></Content>\n<MsgId>6012425345212177526</MsgId>\n</xml>'),
(145, 1399876866, '2014-05-12 14:41:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n企业官网：回复 1\n]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399876865</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(146, 1399876987, '2014-05-12 14:43:07', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1399876986";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"1";s:5:"MsgId";s:19:"6012425873493154937";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1399876986</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[1]]></Content>\n<MsgId>6012425873493154937</MsgId>\n</xml>'),
(147, 1399876987, '2014-05-12 14:43:07', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n企业官网：回复 1\n]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399876987</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(148, 1399886257, '2014-05-12 17:17:37', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886256";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线留言";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886256</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线留言]]></EventKey>\n</xml>'),
(149, 1399886257, '2014-05-12 17:17:37', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我今天累了，明天再陪你聊天吧\n哈哈~~\n你话好多啊，不跟你聊了\n虽然不懂，但觉得你说得很对\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886257</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(150, 1399886323, '2014-05-12 17:18:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886322";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886322</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(151, 1399886323, '2014-05-12 17:18:43', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886322</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(152, 1399886339, '2014-05-12 17:18:59', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886338";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线留言";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886338</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线留言]]></EventKey>\n</xml>'),
(153, 1399886339, '2014-05-12 17:18:59', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886339</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(154, 1399886341, '2014-05-12 17:19:01', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886341";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线预约";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886341</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线预约]]></EventKey>\n</xml>'),
(155, 1399886341, '2014-05-12 17:19:01', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886341</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(156, 1399886425, '2014-05-12 17:20:25', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886424";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886424</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(157, 1399886425, '2014-05-12 17:20:25', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886425</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(158, 1399886429, '2014-05-12 17:20:29', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886428";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线留言";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886428</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线留言]]></EventKey>\n</xml>'),
(159, 1399886429, '2014-05-12 17:20:29', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886429</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(160, 1399886430, '2014-05-12 17:20:30', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886430";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线预约";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886430</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线预约]]></EventKey>\n</xml>'),
(161, 1399886430, '2014-05-12 17:20:30', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886430</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(162, 1399886433, '2014-05-12 17:20:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886432";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886432</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(163, 1399886433, '2014-05-12 17:20:33', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886433</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(164, 1399886435, '2014-05-12 17:20:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886435";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886435</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(165, 1399886435, '2014-05-12 17:20:35', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886435</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(166, 1399886574, '2014-05-12 17:22:54', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886574";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886574</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(167, 1399886575, '2014-05-12 17:22:55', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886574</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(168, 1399886578, '2014-05-12 17:22:58', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886578";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886578</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(169, 1399886578, '2014-05-12 17:22:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886578</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(170, 1399886582, '2014-05-12 17:23:02', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886582";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线预约";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886582</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线预约]]></EventKey>\n</xml>'),
(171, 1399886582, '2014-05-12 17:23:02', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886582</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(172, 1399886586, '2014-05-12 17:23:06', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886585";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线留言";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886585</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线留言]]></EventKey>\n</xml>'),
(173, 1399886586, '2014-05-12 17:23:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886586</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(174, 1399886590, '2014-05-12 17:23:10', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886589";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线预约";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886589</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线预约]]></EventKey>\n</xml>'),
(175, 1399886590, '2014-05-12 17:23:10', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886590</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(176, 1399886592, '2014-05-12 17:23:12', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399886591";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399886591</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(177, 1399886592, '2014-05-12 17:23:12', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399886592</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(178, 1399886673, '2014-05-12 17:24:33', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1399886672";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"b";s:5:"MsgId";s:19:"6012467474546384116";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1399886672</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[b]]></Content>\n<MsgId>6012467474546384116</MsgId>\n</xml>'),
(179, 1399886673, '2014-05-12 17:24:33', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399886673</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(180, 1399950463, '2014-05-13 11:07:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399950463";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399950463</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(181, 1399950463, '2014-05-13 11:07:43', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399950463</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(182, 1399950495, '2014-05-13 11:08:15', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399950494";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"企业简介";s:5:"MsgId";s:19:"6012741587949416053";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399950494</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[企业简介]]></Content>\n<MsgId>6012741587949416053</MsgId>\n</xml>'),
(183, 1399950495, '2014-05-13 11:08:15', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[点击进入首页]]></Title><Description><![CDATA[戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。]]></Description><PicUrl><![CDATA[http://www.gooraye.net]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399950495</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(184, 1399957480, '2014-05-13 13:04:40', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399957478";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399957478</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(185, 1399957480, '2014-05-13 13:04:40', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399957480</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(186, 1399957497, '2014-05-13 13:04:57', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399957497";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微官网";s:5:"MsgId";s:19:"6012771665605390346";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399957497</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微官网]]></Content>\n<MsgId>6012771665605390346</MsgId>\n</xml>'),
(187, 1399957497, '2014-05-13 13:04:57', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[点击进入首页]]></Title><Description><![CDATA[戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。]]></Description><PicUrl><![CDATA[http://www.gooraye.nethttp://gooraye.qiniudn.com/2014-05-13_5371929ce6c7b.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399957497</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(188, 1399963587, '2014-05-13 14:46:27', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963586";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963586</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(189, 1399963587, '2014-05-13 14:46:27', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注古睿]]></Title><Description><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575-85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net]]></Url></item></Articles><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963587</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(190, 1399963596, '2014-05-13 14:46:36', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963596";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"hi";s:5:"MsgId";s:19:"6012797860610664270";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963596</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[hi]]></Content>\n<MsgId>6012797860610664270</MsgId>\n</xml>'),
(191, 1399963596, '2014-05-13 14:46:36', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963596</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(192, 1399963613, '2014-05-13 14:46:53', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963612";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"你妈逼";s:5:"MsgId";s:19:"6012797929330141008";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963612</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你妈逼]]></Content>\n<MsgId>6012797929330141008</MsgId>\n</xml>'),
(193, 1399963613, '2014-05-13 14:46:53', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963613</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(194, 1399963626, '2014-05-13 14:47:06', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963626";s:7:"MsgType";s:4:"text";s:7:"Content";s:22:" 怎么还是这个？";s:5:"MsgId";s:19:"6012797989459683154";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963626</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ 怎么还是这个？]]></Content>\n<MsgId>6012797989459683154</MsgId>\n</xml>'),
(195, 1399963626, '2014-05-13 14:47:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963626</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(196, 1399963635, '2014-05-13 14:47:15', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963635";s:7:"MsgType";s:4:"text";s:7:"Content";s:10:" 有病啊";s:5:"MsgId";s:19:"6012798028114388820";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963635</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ 有病啊]]></Content>\n<MsgId>6012798028114388820</MsgId>\n</xml>'),
(197, 1399963635, '2014-05-13 14:47:15', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963635</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(198, 1399963669, '2014-05-13 14:47:49', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963667";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"好吧";s:5:"MsgId";s:19:"6012798165553342294";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963667</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[好吧]]></Content>\n<MsgId>6012798165553342294</MsgId>\n</xml>'),
(199, 1399963669, '2014-05-13 14:47:49', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963669</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(200, 1399963682, '2014-05-13 14:48:02', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVtwY-VcGBTx-UcxZBONSnz8w";s:10:"CreateTime";s:10:"1399963682";s:7:"MsgType";s:4:"text";s:7:"Content";s:16:" 你好，小孩";s:5:"MsgId";s:19:"6012798229977851736";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></FromUserName>\n<CreateTime>1399963682</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ 你好，小孩]]></Content>\n<MsgId>6012798229977851736</MsgId>\n</xml>'),
(201, 1399963682, '2014-05-13 14:48:02', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVtwY-VcGBTx-UcxZBONSnz8w]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399963682</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(202, 1399963709, '2014-05-13 14:48:29', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWetwWiJTbAt2v-3YojPisYtco";s:10:"CreateTime";s:10:"1399963709";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWetwWiJTbAt2v-3YojPisYtco]]></FromUserName>\n<CreateTime>1399963709</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(203, 1399963709, '2014-05-13 14:48:29', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[古睿信息科技有限公司]]></Title><Description><![CDATA[绍兴古睿是一家专业的移动产品开发公司，从事全方位的移动互联网解决方案的研究开发与互联网营销服务，秉承移动互联网自由以及发展迅速的特征，专注于产品优化以及新技术的应用，现有业务范围涉及微站开发、微信公众平台的代运营与服务，移动手机站制作与优化，手机端应用开发，PC端高端网页制作以及企业网站优化升级。]]></Description><PicUrl><![CDATA[http://f.hiphotos.baidu.com/image/w%3D310/sign=5923dcefcebf6c81f7372ae98c3fb1d7/a5c27d1ed21b0ef4de74a0d9dfc451da80cb3e9c.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.com]]></Url></item></Articles><ToUserName><![CDATA[oQJWetwWiJTbAt2v-3YojPisYtco]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1399963709</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(204, 1399975103, '2014-05-13 17:58:23', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1399975103";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1399975103</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(205, 1399975103, '2014-05-13 17:58:23', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注古睿]]></Title><Description><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575-85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399975103</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(206, 1399976536, '2014-05-13 18:22:16', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1399976536";s:7:"MsgType";s:4:"text";s:7:"Content";s:3:"比";s:5:"MsgId";s:19:"6012853437487474938";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1399976536</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[比]]></Content>\n<MsgId>6012853437487474938</MsgId>\n</xml>'),
(207, 1399976536, '2014-05-13 18:22:16', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399976536</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(208, 1399976704, '2014-05-13 18:25:04', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1399976704";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1399976704</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(209, 1399976704, '2014-05-13 18:25:04', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注古睿]]></Title><Description><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575-85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399976704</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(210, 1399976712, '2014-05-13 18:25:12', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1399976711";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"你好";s:5:"MsgId";s:19:"6012854189106751749";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1399976711</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你好]]></Content>\n<MsgId>6012854189106751749</MsgId>\n</xml>'),
(211, 1399976712, '2014-05-13 18:25:12', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399976712</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(212, 1399976741, '2014-05-13 18:25:41', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1399976739";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"hi";s:5:"MsgId";s:19:"6012854309365836039";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1399976739</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[hi]]></Content>\n<MsgId>6012854309365836039</MsgId>\n</xml>'),
(213, 1399976741, '2014-05-13 18:25:41', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1399976741</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(214, 1399980884, '2014-05-13 19:34:44', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399980883";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"简介";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399980883</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[简介]]></EventKey>\n</xml>'),
(215, 1399980884, '2014-05-13 19:34:44', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399980884</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(216, 1399980892, '2014-05-13 19:34:52', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1399980892";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"在线预约";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1399980892</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[在线预约]]></EventKey>\n</xml>'),
(217, 1399980892, '2014-05-13 19:34:52', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1399980892</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(218, 1400021794, '2014-05-14 06:56:34', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1400021791";s:7:"MsgType";s:4:"text";s:7:"Content";s:3:"啊";s:5:"MsgId";s:19:"6013047806232456052";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1400021791</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[啊]]></Content>\n<MsgId>6013047806232456052</MsgId>\n</xml>'),
(219, 1400021794, '2014-05-14 06:56:34', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400021794</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `wp_action`
--
ALTER TABLE `wp_action`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_action_log`
--
ALTER TABLE `wp_action_log`
 ADD PRIMARY KEY (`id`), ADD KEY `action_ip_ix` (`action_ip`), ADD KEY `action_id_ix` (`action_id`), ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `wp_addons`
--
ALTER TABLE `wp_addons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_attachment`
--
ALTER TABLE `wp_attachment`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_record_status` (`record_id`,`status`);

--
-- Indexes for table `wp_attribute`
--
ALTER TABLE `wp_attribute`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_auth_extend`
--
ALTER TABLE `wp_auth_extend`
 ADD UNIQUE KEY `group_extend_type` (`group_id`,`extend_id`,`type`), ADD KEY `uid` (`group_id`), ADD KEY `group_id` (`extend_id`);

--
-- Indexes for table `wp_auth_group`
--
ALTER TABLE `wp_auth_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_auth_group_access`
--
ALTER TABLE `wp_auth_group_access`
 ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`), ADD KEY `uid` (`uid`), ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `wp_auth_rule`
--
ALTER TABLE `wp_auth_rule`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `name` (`module`,`name`,`type`);

--
-- Indexes for table `wp_card_coupons`
--
ALTER TABLE `wp_card_coupons`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_card_member`
--
ALTER TABLE `wp_card_member`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_card_notice`
--
ALTER TABLE `wp_card_notice`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_category`
--
ALTER TABLE `wp_category`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`);

--
-- Indexes for table `wp_channel`
--
ALTER TABLE `wp_channel`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_config`
--
ALTER TABLE `wp_config`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_name` (`name`);

--
-- Indexes for table `wp_custom_menu`
--
ALTER TABLE `wp_custom_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_custom_reply_mult`
--
ALTER TABLE `wp_custom_reply_mult`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_custom_reply_news`
--
ALTER TABLE `wp_custom_reply_news`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_custom_reply_text`
--
ALTER TABLE `wp_custom_reply_text`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_document`
--
ALTER TABLE `wp_document`
 ADD PRIMARY KEY (`id`), ADD KEY `idx_name` (`name`), ADD KEY `idx_category_status` (`category_id`,`status`), ADD KEY `idx_status_type_pid` (`status`,`type`,`pid`);

--
-- Indexes for table `wp_document_article`
--
ALTER TABLE `wp_document_article`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_document_download`
--
ALTER TABLE `wp_document_download`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_extensions`
--
ALTER TABLE `wp_extensions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_file`
--
ALTER TABLE `wp_file`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `uk_md5` (`md5`);

--
-- Indexes for table `wp_hooks`
--
ALTER TABLE `wp_hooks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `搜索索引` (`name`);

--
-- Indexes for table `wp_host`
--
ALTER TABLE `wp_host`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_host_guanli`
--
ALTER TABLE `wp_host_guanli`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_host_order`
--
ALTER TABLE `wp_host_order`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_keyword`
--
ALTER TABLE `wp_keyword`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `keyword_token` (`keyword`,`token`);

--
-- Indexes for table `wp_member`
--
ALTER TABLE `wp_member`
 ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `wp_member_public`
--
ALTER TABLE `wp_member_public`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_member_public_group`
--
ALTER TABLE `wp_member_public_group`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_menu`
--
ALTER TABLE `wp_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_model`
--
ALTER TABLE `wp_model`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_online_booking`
--
ALTER TABLE `wp_online_booking`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_panorama`
--
ALTER TABLE `wp_panorama`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_picture`
--
ALTER TABLE `wp_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_suggestions`
--
ALTER TABLE `wp_suggestions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ucenter_admin`
--
ALTER TABLE `wp_ucenter_admin`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_ucenter_app`
--
ALTER TABLE `wp_ucenter_app`
 ADD PRIMARY KEY (`id`), ADD KEY `status` (`status`);

--
-- Indexes for table `wp_ucenter_member`
--
ALTER TABLE `wp_ucenter_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`), ADD KEY `status` (`status`);

--
-- Indexes for table `wp_ucenter_setting`
--
ALTER TABLE `wp_ucenter_setting`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_update_version`
--
ALTER TABLE `wp_update_version`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_url`
--
ALTER TABLE `wp_url`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `idx_url` (`url`);

--
-- Indexes for table `wp_userdata`
--
ALTER TABLE `wp_userdata`
 ADD UNIQUE KEY `uid` (`uid`,`type`,`target_id`);

--
-- Indexes for table `wp_vote`
--
ALTER TABLE `wp_vote`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_vote_log`
--
ALTER TABLE `wp_vote_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_vote_option`
--
ALTER TABLE `wp_vote_option`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_weisite_category`
--
ALTER TABLE `wp_weisite_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_weisite_footer`
--
ALTER TABLE `wp_weisite_footer`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_weisite_slideshow`
--
ALTER TABLE `wp_weisite_slideshow`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_weixin_log`
--
ALTER TABLE `wp_weixin_log`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wp_action`
--
ALTER TABLE `wp_action`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wp_action_log`
--
ALTER TABLE `wp_action_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=699;
--
-- AUTO_INCREMENT for table `wp_addons`
--
ALTER TABLE `wp_addons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `wp_attachment`
--
ALTER TABLE `wp_attachment`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_attribute`
--
ALTER TABLE `wp_attribute`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `wp_auth_group`
--
ALTER TABLE `wp_auth_group`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_auth_rule`
--
ALTER TABLE `wp_auth_rule`
MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',AUTO_INCREMENT=225;
--
-- AUTO_INCREMENT for table `wp_card_coupons`
--
ALTER TABLE `wp_card_coupons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_card_member`
--
ALTER TABLE `wp_card_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_card_notice`
--
ALTER TABLE `wp_card_notice`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_category`
--
ALTER TABLE `wp_category`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `wp_channel`
--
ALTER TABLE `wp_channel`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '频道ID',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `wp_config`
--
ALTER TABLE `wp_config`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `wp_custom_menu`
--
ALTER TABLE `wp_custom_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_custom_reply_mult`
--
ALTER TABLE `wp_custom_reply_mult`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_custom_reply_news`
--
ALTER TABLE `wp_custom_reply_news`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_custom_reply_text`
--
ALTER TABLE `wp_custom_reply_text`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_document`
--
ALTER TABLE `wp_document`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `wp_extensions`
--
ALTER TABLE `wp_extensions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_file`
--
ALTER TABLE `wp_file`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_hooks`
--
ALTER TABLE `wp_hooks`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `wp_host`
--
ALTER TABLE `wp_host`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_host_guanli`
--
ALTER TABLE `wp_host_guanli`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_host_order`
--
ALTER TABLE `wp_host_order`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_keyword`
--
ALTER TABLE `wp_keyword`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `wp_member`
--
ALTER TABLE `wp_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `wp_member_public`
--
ALTER TABLE `wp_member_public`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `wp_member_public_group`
--
ALTER TABLE `wp_member_public_group`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_menu`
--
ALTER TABLE `wp_menu`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `wp_model`
--
ALTER TABLE `wp_model`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `wp_online_booking`
--
ALTER TABLE `wp_online_booking`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_panorama`
--
ALTER TABLE `wp_panorama`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_picture`
--
ALTER TABLE `wp_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `wp_suggestions`
--
ALTER TABLE `wp_suggestions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_ucenter_admin`
--
ALTER TABLE `wp_ucenter_admin`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员ID';
--
-- AUTO_INCREMENT for table `wp_ucenter_app`
--
ALTER TABLE `wp_ucenter_app`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用ID';
--
-- AUTO_INCREMENT for table `wp_ucenter_member`
--
ALTER TABLE `wp_ucenter_member`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `wp_ucenter_setting`
--
ALTER TABLE `wp_ucenter_setting`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '设置ID';
--
-- AUTO_INCREMENT for table `wp_update_version`
--
ALTER TABLE `wp_update_version`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_url`
--
ALTER TABLE `wp_url`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '链接唯一标识';
--
-- AUTO_INCREMENT for table `wp_vote`
--
ALTER TABLE `wp_vote`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `wp_vote_log`
--
ALTER TABLE `wp_vote_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wp_vote_option`
--
ALTER TABLE `wp_vote_option`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `wp_weisite_category`
--
ALTER TABLE `wp_weisite_category`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_weisite_footer`
--
ALTER TABLE `wp_weisite_footer`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_weisite_slideshow`
--
ALTER TABLE `wp_weisite_slideshow`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_weixin_log`
--
ALTER TABLE `wp_weixin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=220;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

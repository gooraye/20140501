-- phpMyAdmin SQL Dump
-- version 4.2.0-alpha2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2014-05-29 19:20:12
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
(1, 'user_login', '用户登录', '积分+10，每天一次', 'table:member|field:score|condition:uid={$self} AND status>-1|rule:score+10|cycle:24|max:1;', '[user|get_nickname]在[time|time_format]登录了管理中心', 1, 1, 1393685660),
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
(12, 'admin_login', '登录后台', '管理员登录后台', '', '[user|get_nickname]在[time|time_format]登录了后台', 2, 1, 1393685618);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='行为日志表' AUTO_INCREMENT=798 ;

--
-- 转存表中的数据 `wp_action_log`
--

INSERT INTO `wp_action_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(562, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 16:45登录了管理中心', 1, 1399193156),
(563, 12, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:00登录了后台', 1, 1399204846),
(564, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:01登录了管理中心', 1, 1399204881),
(565, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:05登录了后台', 1, 1399205126),
(566, 10, 1, 2130706433, 'Menu', 93, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205421),
(567, 10, 1, 2130706433, 'Menu', 2, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205432),
(568, 10, 1, 2130706433, 'Menu', 93, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399205481),
(569, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:22登录了后台', 1, 1399206136),
(570, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:26登录了后台', 1, 1399206418),
(571, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 20:36登录了后台', 1, 1399206986),
(572, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-04 20:59登录了管理中心', 1, 1399208366),
(573, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-04 21:23登录了后台', 1, 1399209828),
(574, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-05 09:40登录了后台', 1, 1399254018),
(575, 1, 162, 2130706433, 'member', 162, 'spa001在2014-05-05 09:42登录了管理中心', 1, 1399254141),
(576, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 14:47登录了管理中心', 1, 1399272457),
(577, 12, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:05登录了后台', 1, 1399273549),
(578, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:18登录了管理中心', 1, 1399274285),
(579, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-05 15:25登录了后台', 1, 1399274741),
(580, 10, 1, 2130706433, 'Menu', 2, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399274763),
(581, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-05 15:51登录了管理中心', 1, 1399276268),
(582, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-06 10:56登录了后台', 1, 1399345017),
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
(614, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-06 20:27登录了后台', 1, 1399379253),
(615, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399379298),
(616, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399379384),
(617, 1, 1, 2130706433, 'member', 1, 'admin在2014-05-06 20:30登录了管理中心', 1, 1399379446),
(618, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-06 20:32登录了管理中心', 1, 1399379532),
(619, 10, 1, 2130706433, 'Menu', 141, '操作url：/gooraye/20140501/index.php?s=/admin/menu/edit.html', 1, 1399380671),
(620, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399381213),
(621, 9, 1, 2130706433, 'channel', 4, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399381668),
(622, 12, 1, 2130706433, 'member', 1, 'admin在2014-05-07 13:12登录了后台', 1, 1399439525),
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
(633, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 19:58登录了后台', 1, 1399463925),
(634, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:03登录了后台', 1, 1399464233),
(635, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:04登录了后台', 1, 1399464240),
(636, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-07 20:04登录了后台', 1, 1399464250),
(637, 6, 1, 2130706433, 'config', 47, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399464282),
(638, 6, 1, 2130706433, 'config', 13, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399466330),
(639, 6, 1, 2130706433, 'config', 13, '操作url：/gooraye/20140501/index.php?s=/admin/config/edit.html', 1, 1399467752),
(640, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 11:13登录了后台', 1, 1399518820),
(641, 11, 1, 2130706433, 'category', 42, '操作url：/gooraye/20140501/index.php?s=/admin/category/remove/id/42.html', 1, 1399519056),
(642, 11, 1, 2130706433, 'category', 43, '操作url：/gooraye/20140501/index.php?s=/admin/category/add.html', 1, 1399519081),
(643, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 14:37登录了后台', 1, 1399531020),
(644, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 14:47登录了后台', 1, 1399531636),
(645, 11, 1, 2130706433, 'category', 43, '操作url：/gooraye/20140501/index.php?s=/admin/category/edit.html', 1, 1399532164),
(646, 9, 1, 2130706433, 'channel', 6, '操作url：/gooraye/20140501/index.php?s=/admin/channel/edit.html', 1, 1399532237),
(647, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 15:33登录了后台', 1, 1399534399),
(648, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-08 19:39登录了后台', 1, 1399549167),
(649, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-08 19:47登录了管理中心', 1, 1399549633),
(650, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-08 20:17登录了后台', 1, 1399551450),
(651, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-08 20:20登录了后台', 1, 1399551613),
(652, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-08 20:29登录了管理中心', 1, 1399552179),
(653, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 09:44登录了管理中心', 1, 1399599892),
(654, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 10:11登录了后台', 1, 1399601503),
(655, 10, 1, 2061514924, 'Menu', 130, '操作url：/index.php?s=/admin/menu/edit.html', 1, 1399603313),
(656, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 11:17登录了管理中心', 1, 1399605469),
(657, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 11:26登录了管理中心', 1, 1399606004),
(658, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 15:32登录了后台', 1, 1399620766),
(659, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 15:34登录了管理中心', 1, 1399620898),
(660, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 15:53登录了后台', 1, 1399622036),
(661, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 15:54登录了管理中心', 1, 1399622065),
(662, 10, 1, 2061514924, 'Menu', 142, '操作url：/index.php?s=/admin/menu/add.html', 1, 1399641871),
(663, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-09 22:11登录了管理中心', 1, 1399644683),
(664, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-09 22:18登录了后台', 1, 1399645136),
(665, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-10 19:36登录了后台', 1, 1399721762),
(666, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-10 19:37登录了管理中心', 1, 1399721847),
(667, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-10 20:12登录了后台', 1, 1399723963),
(668, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399724096),
(669, 8, 1, 2061514924, 'attribute', 202, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399724980),
(670, 8, 1, 2061514924, 'attribute', 237, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399725954),
(671, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399731068),
(672, 8, 1, 2061514924, 'attribute', 236, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1399731085),
(673, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-12 10:35登录了管理中心', 1, 1399862145),
(674, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-12 11:24登录了后台', 1, 1399865062),
(675, 6, 1, 2061514924, 'config', 0, '操作url：/index.php?s=/admin/config/del/id/48.html', 1, 1399865168),
(676, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-12 13:12登录了管理中心', 1, 1399871550),
(677, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-12 15:21登录了管理中心', 1, 1399879319),
(678, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-13 09:28登录了管理中心', 1, 1399944520),
(679, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-14 08:03登录了管理中心', 1, 1400025832),
(680, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-14 09:12登录了后台', 1, 1400029959),
(681, 1, 1, 2061514924, 'member', 1, '何必都在2014-05-14 12:50登录了管理中心', 1, 1400043020),
(682, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-15 09:45登录了管理中心', 1, 1400118331),
(683, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-15 15:03登录了管理中心', 1, 1400137400),
(684, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-15 15:24登录了管理中心', 1, 1400138684),
(685, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-15 16:35登录了管理中心', 1, 1400142936),
(686, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-15 19:40登录了后台', 1, 1400154020),
(687, 1, 1, 2061514924, 'member', 1, '何必都在2014-05-15 22:11登录了管理中心', 1, 1400163086),
(688, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-16 08:39登录了管理中心', 1, 1400200795),
(689, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-16 08:43登录了后台', 1, 1400201004),
(690, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 08:52登录了管理中心', 1, 1400201561),
(691, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 14:58登录了管理中心', 1, 1400223538),
(692, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 15:08登录了管理中心', 1, 1400224109),
(693, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-16 16:16登录了后台', 1, 1400228180),
(694, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 19:26登录了管理中心', 1, 1400239562),
(695, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-16 20:26登录了后台', 1, 1400243217),
(696, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-16 20:27登录了管理中心', 1, 1400243278),
(697, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 20:28登录了管理中心', 1, 1400243292),
(698, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 21:08登录了管理中心', 1, 1400245686),
(699, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-16 21:25登录了管理中心', 1, 1400246733),
(700, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 14:38登录了管理中心', 1, 1400308729),
(701, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-17 16:15登录了管理中心', 1, 1400314523),
(702, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 16:15登录了管理中心', 1, 1400314536),
(703, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-17 16:16登录了后台', 1, 1400314590),
(704, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 16:17登录了管理中心', 1, 1400314652),
(705, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 16:20登录了管理中心', 1, 1400314834),
(706, 1, 1, 2061514924, 'member', 1, '何必都在2014-05-17 22:25登录了管理中心', 1, 1400336708),
(707, 8, 1, 2061514924, 'attribute', 247, '操作url：/index.php?s=/admin/attribute/update.html', 1, 1400336764),
(708, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 22:30登录了管理中心', 1, 1400337057),
(709, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-17 22:54登录了管理中心', 1, 1400338443),
(710, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-17 23:25登录了管理中心', 1, 1400340311),
(711, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-18 09:47登录了管理中心', 1, 1400377652),
(712, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-18 09:51登录了后台', 1, 1400377885),
(713, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-18 12:17登录了管理中心', 1, 1400386658),
(714, 12, 1, 2061514924, 'member', 1, '何必都在2014-05-18 17:58登录了后台', 1, 1400407087),
(715, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-18 18:45登录了管理中心', 1, 1400409935),
(716, 1, 161, 2061514924, 'member', 161, 'gooraye在2014-05-19 15:45登录了管理中心', 1, 1400485542),
(717, 1, 164, 2061514924, 'member', 164, 'dwyspa在2014-05-19 16:17登录了管理中心', 1, 1400487428),
(718, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-19 20:53登录了管理中心', 1, 1400504012),
(719, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-20 08:59登录了管理中心', 1, 1400547599),
(720, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-20 09:08登录了后台', 1, 1400548094),
(721, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-20 09:12登录了管理中心', 1, 1400548329),
(722, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-20 09:22登录了管理中心', 1, 1400548951),
(723, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-20 09:23登录了管理中心', 1, 1400548988),
(724, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-20 09:31登录了管理中心', 1, 1400549460),
(725, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-20 09:54登录了管理中心', 1, 1400550872),
(726, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-20 14:07登录了管理中心', 1, 1400566062),
(727, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-20 14:10登录了管理中心', 1, 1400566254),
(728, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-20 20:31登录了后台', 1, 1400589064),
(729, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-20 21:22登录了后台', 1, 1400592174),
(730, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-21 09:20登录了管理中心', 1, 1400635240),
(731, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-21 13:17登录了后台', 1, 1400649473),
(732, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-21 13:20登录了后台', 1, 1400649611),
(733, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-21 15:41登录了管理中心', 1, 1400658078),
(734, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-21 16:16登录了管理中心', 1, 1400660198),
(735, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-21 16:58登录了管理中心', 1, 1400662718),
(736, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-21 17:04登录了管理中心', 1, 1400663081),
(737, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-21 20:07登录了管理中心', 1, 1400674052),
(738, 1, 1, 2062312170, 'member', 1, '何必都在2014-05-21 20:37登录了管理中心', 1, 1400675864),
(739, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-22 09:08登录了管理中心', 1, 1400720925),
(740, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-22 10:31登录了后台', 1, 1400725897),
(741, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-22 10:45登录了管理中心', 1, 1400726727),
(742, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-22 18:18登录了管理中心', 1, 1400753900),
(743, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-22 18:51登录了管理中心', 1, 1400755866),
(744, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-22 19:02登录了后台', 1, 1400756556),
(745, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-22 19:07登录了管理中心', 1, 1400756864),
(746, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-22 20:59登录了后台', 1, 1400763584),
(747, 1, 1, 2062312170, 'member', 1, '何必都在2014-05-22 21:17登录了管理中心', 1, 1400764678),
(748, 12, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-22 21:34登录了后台', 1, 1400765691),
(749, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 09:08登录了后台', 1, 1400807313),
(750, 6, 1, 2062312170, 'config', 13, '操作url：/index.php?s=/admin/config/edit.html', 1, 1400807938),
(751, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 09:31登录了管理中心', 1, 1400808681),
(752, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 09:32登录了后台', 1, 1400808758),
(753, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 09:35登录了管理中心', 1, 1400808919),
(754, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 09:37登录了后台', 1, 1400809028),
(755, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 09:51登录了管理中心', 1, 1400809913),
(756, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 10:04登录了管理中心', 1, 1400810654),
(757, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 11:14登录了后台', 1, 1400814863),
(758, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 13:02登录了管理中心', 1, 1400821340),
(759, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 13:04登录了管理中心', 1, 1400821482),
(760, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 13:10登录了管理中心', 1, 1400821852),
(761, 1, 1, 2062312170, 'member', 1, '何必都在2014-05-23 13:14登录了管理中心', 1, 1400822060),
(762, 11, 1, 2062312170, 'category', 2, '操作url：/index.php?s=/admin/category/edit.html', 1, 1400823170),
(763, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 13:45登录了管理中心', 1, 1400823946),
(764, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 14:01登录了后台', 1, 1400824868),
(765, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 14:08登录了管理中心', 1, 1400825295),
(766, 1, 1, 2062312170, 'member', 1, '何必都在2014-05-23 14:13登录了管理中心', 1, 1400825586),
(767, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 14:19登录了管理中心', 1, 1400825956),
(768, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 14:44登录了后台', 1, 1400827491),
(769, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 15:00登录了管理中心', 1, 1400828401),
(770, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 15:57登录了后台', 1, 1400831823),
(771, 1, 164, 2062312170, 'member', 164, 'dwyspa在2014-05-23 16:08登录了管理中心', 1, 1400832519),
(772, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-23 16:39登录了后台', 1, 1400834379),
(773, 12, 1, 2062312170, 'member', 1, '何必都在2014-05-24 13:23登录了后台', 1, 1400908990),
(774, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-24 16:37登录了管理中心', 1, 1400920678),
(775, 1, 161, 2062312170, 'member', 161, 'gooraye在2014-05-26 15:03登录了管理中心', 1, 1401087790),
(776, 1, 1, 2062319442, 'member', 1, '何必都在2014-05-28 11:36登录了管理中心', 1, 1401248193),
(777, 12, 1, 2062319442, 'member', 1, '何必都在2014-05-28 13:44登录了后台', 1, 1401255850),
(778, 12, 1, 2062319442, 'member', 1, '何必都在2014-05-28 17:00登录了后台', 1, 1401267617),
(779, 12, 1, 2062319442, 'member', 1, '何必都在2014-05-28 17:03登录了后台', 1, 1401267799),
(780, 12, 1, 2062319442, 'member', 1, '何必都在2014-05-28 20:59登录了后台', 1, 1401281974),
(781, 11, 1, 2062319442, 'category', 44, '操作url：/index.php?s=/admin/category/add.html', 1, 1401282013),
(782, 9, 1, 2062319442, 'channel', 7, '操作url：/index.php?s=/admin/channel/edit.html', 1, 1401282056),
(783, 9, 1, 2062319442, 'channel', 7, '操作url：/index.php?s=/admin/channel/edit.html', 1, 1401282072),
(784, 9, 1, 2062319442, 'channel', 7, '操作url：/index.php?s=/admin/channel/edit.html', 1, 1401282086),
(785, 12, 1, 2062319442, 'member', 1, '何必都在2014-05-29 15:08登录了后台', 1, 1401347333),
(786, 7, 1, 2130706433, 'model', 47, '操作url：/gooraye/20140501/index.php?s=/admin/model/update.html', 1, 1401347837),
(787, 8, 1, 2130706433, 'attribute', 321, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/remove/id/321.html', 1, 1401347843),
(788, 8, 1, 2130706433, 'attribute', 320, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/remove/id/320.html', 1, 1401347852),
(789, 8, 1, 2130706433, 'attribute', 319, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/remove/id/319.html', 1, 1401347858),
(790, 8, 1, 2130706433, 'attribute', 317, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/remove/id/317.html', 1, 1401347874),
(791, 8, 1, 2130706433, 'attribute', 325, '操作url：/gooraye/20140501/index.php?s=/admin/attribute/update.html', 1, 1401347914),
(792, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-29 15:20登录了管理中心', 1, 1401348016),
(793, 12, 1, 2130706433, 'member', 1, '何必都在2014-05-29 15:20登录了后台', 1, 1401348053),
(794, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-29 15:21登录了管理中心', 1, 1401348110),
(795, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-29 15:33登录了管理中心', 1, 1401348790),
(796, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-29 15:33登录了管理中心', 1, 1401348791),
(797, 1, 161, 2130706433, 'member', 161, 'gooraye在2014-05-29 15:45登录了管理中心', 1, 1401349533);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='插件表' AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `wp_addons`
--

INSERT INTO `wp_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `create_time`, `has_adminlist`, `type`) VALUES
(15, 'EditorForAdmin', '后台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"2","editor_height":"500px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1383126253, 0, 0),
(2, 'SiteStat', '站点统计信息', '统计站点的基础信息', 0, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512015, 0, 0),
(22, 'DevTeam', '开发团队信息', '开发团队成员信息', 0, '{"title":"OneThink\\u5f00\\u53d1\\u56e2\\u961f","width":"2","display":"1"}', 'thinkphp', '0.1', 1391687096, 0, 0),
(4, 'SystemInfo', '系统环境信息', '用于显示一些服务器的信息', 1, '{"title":"\\u7cfb\\u7edf\\u4fe1\\u606f","width":"2","display":"1"}', 'thinkphp', '0.1', 1379512036, 0, 0),
(5, 'Editor', '前台编辑器', '用于增强整站长文本的输入和显示', 1, '{"editor_type":"2","editor_wysiwyg":"1","editor_height":"300px","editor_resize_type":"1"}', 'thinkphp', '0.1', 1379830910, 0, 0),
(6, 'Attachment', '附件', '用于文档模型上传附件', 1, 'null', 'thinkphp', '0.1', 1379842319, 1, 0),
(9, 'SocialComment', '通用社交化评论', '集成了各种社交化评论插件，轻松集成到系统中。', 1, '{"comment_type":"1","comment_uid_youyan":"1910490","comment_short_name_duoshuo":"","comment_form_pos_duoshuo":"buttom","comment_data_list_duoshuo":"10","comment_data_order_duoshuo":"asc"}', 'thinkphp', '0.1', 1380273962, 0, 0),
(16, 'Vote', '投票', '支持文本和图片两类的投票功能', 1, '{"random":"1"}', '地下凡星', '0.1', 1388811198, 1, 1),
(17, 'Chat', '智能聊天', '通过网络上支持的智能API，实现：天气、翻译、藏头诗、笑话、歌词、计算、域名信息/备案/收录查询、IP查询、手机号码归属、人工智能聊天等功能', 1, '{"simsim_key":"41250a68-3cb5-43c8-9aa2-d7b3caf519b1","simsim_url":"http:\\/\\/sandbox.api.simsimi.com\\/request.p","i9_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","rand_reply":"\\u6211\\u4eca\\u5929\\u7d2f\\u4e86\\uff0c\\u660e\\u5929\\u518d\\u966a\\u4f60\\u804a\\u5929\\u5427\\r\\n\\u54c8\\u54c8~~\\r\\n\\u4f60\\u8bdd\\u597d\\u591a\\u554a\\uff0c\\u4e0d\\u8ddf\\u4f60\\u804a\\u4e86\\r\\n\\u867d\\u7136\\u4e0d\\u61c2\\uff0c\\u4f46\\u89c9\\u5f97\\u4f60\\u8bf4\\u5f97\\u5f88\\u5bf9\\r\\n"}', '地下凡星', '0.1', 1389454867, 0, 1),
(18, 'Wecome', '欢迎语', '用户关注公众号时发送的欢迎信息，支持文本，图片，图文的信息', 1, '{"type":"2","title":"ttt","description":"ttt","pic_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","url":"ttt"}', '地下凡星', '0.1', 1389620372, 0, 1),
(19, 'UserCenter', '微信用户中心', '实现3G首页、微信登录，微信用户绑定，微信用户信息初始化等基本功能', 1, '{"need_truename":"0","need_mobile":"1"}', '地下凡星', '0.1', 1390660425, 1, 1),
(24, 'BaiduStatistics', '百度统计', '这是百度统计功能，只要开启插件并设置统计代码，就可以使用统计功能了', 1, '{"code":"<script type=\\\\\\"text\\/javascript\\\\\\">\\r\\nvar _bdhmProtocol = ((\\\\\\"https:\\\\\\" == document.location.protocol) ? \\\\\\" https:\\/\\/\\\\\\" : \\\\\\" http:\\/\\/\\\\\\");\\r\\ndocument.write(unescape(\\\\\\"%3Cscript src=\\\\''\\\\\\" + _bdhmProtocol + \\\\\\"hm.baidu.com\\/h.js%3F0cf1c3c27eeb3be94102e955574a5a4e\\\\'' type=\\\\''text\\/javascript\\\\''%3E%3C\\/script%3E\\\\\\"));\\r\\n<\\/script>"}', 'weiphp.cn', '1.0', 1393116011, 0, 0),
(43, 'ReturnTop', '返回顶部', '返回顶部', 1, '{"theme":"1"}', '丁丁', '0.1', 1399277452, 0, 0),
(34, 'Suggestions', '建议意见', '用户在微信里输入“建议意见”四个字时，返回一个图文信息，引导用户进入填写建议意见的3G页面，用户填写信息提交后显示感谢之意并提示关闭页面返回微信\r\n管理员可以在管理中心里看到用户反馈的内容列表，并对内容进行编辑，删除操作', 1, '{"need_truename":"0","need_mobile":"0"}', '地下凡星', '0.1', 1394264727, 1, 1),
(29, 'Robot', '机器人聊天', '实现的效果如下 用户输入：“机器人学习时间” 微信回复：“你的问题是？” 用户输入：“这个世界上谁最美？” 微信回复： “你的答案是？” 用户回复： “当然是你啦！” 微信回复：“我明白啊，不信你可以问问我” 用户回复：“这个世界上谁最美？” 微信回复：“当然是你啦！”', 0, 'null', '地下凡星', '0.1', 1393668441, 0, 1),
(37, 'Extensions', '融合第三方', '第三方功能扩展', 1, 'null', '地下凡星', '0.1', 1394266309, 1, 1),
(38, 'CustomReply', '自定义回复', '支持图文回复、多图文回复、文本回复功能', 1, 'null', '凡星', '0.1', 1399209877, 1, 1),
(39, 'Leaflets', '微信宣传页', '微信公众号二维码推广页面，用作推广或者制作广告易拉宝，可以发布到QQ群微博博客论坛等等...', 1, '{"title":"WeiPHP\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7","img":"","info":"\\u5fae\\u4fe1\\u8425\\u9500\\u7ba1\\u7406\\u5e73\\u53f0\\u4e3a\\u4e2a\\u4eba\\u548c\\u4f01\\u4e1a\\u63d0\\u4f9b\\u57fa\\u4e8e\\u5fae\\u4fe1\\u516c\\u4f17\\u5e73\\u53f0\\u7684\\u4e00\\u7cfb\\u5217\\u529f\\u80fd\\uff0c\\u5305\\u62ec\\u667a\\u80fd\\u56de\\u590d\\u3001\\u5fae\\u4fe13G\\u7f51\\u7ad9\\u3001\\u4e92\\u52a8\\u8425\\u9500\\u6d3b\\u52a8\\uff0c\\u4f1a\\u5458\\u7ba1\\u7406\\uff0c\\u5728\\u7ebf\\u8ba2\\u5355\\uff0c\\u6570\\u636e\\u7edf\\u8ba1\\u7b49\\u7cfb\\u7edf\\u529f\\u80fd,\\u5e26\\u7ed9\\u4f60\\u5168\\u65b0\\u7684\\u5fae\\u4fe1\\u4e92\\u52a8\\u8425\\u9500\\u4f53\\u9a8c\\u3002","copyright":"\\u00a92001-2013 WeiPHP\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u7248\\u6743\\u6240\\u6709"}', '凡星', '0.1', 1399209886, 0, 1),
(40, 'WeiSite', '微官网', '微3G网站、支持分类管理，文章管理、底部导航管理、微信引导信息配置，微网站统计代码部署。同时支持首页多模板切换、信息列表多模板切换、信息详情模板切换、底部导航多模板切换。并配置有详细的模板二次开发教程', 1, '{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875","cover":"","info":"","background":"","code":"","template_index":"ColorV1","template_footer":"V1","template_lists":"V1","template_detail":"V1"}', '凡星', '0.1', 1399209902, 0, 1),
(41, 'CustomMenu', '自定义菜单', '自定义菜单能够帮助公众号丰富界面，让用户更好更快地理解公众号的功能', 1, 'null', '凡星', '0.1', 1399209906, 1, 1),
(42, 'Card', '会员卡', '提供会员卡基本功能：会员卡制作、会员管理、通知发布、优惠券发布等功能，用户可在此基础上扩展自己的具体业务需求，如积分、充值、签到等', 1, '{"background":"1","title":"\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97VIP\\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97VIP\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u65f6\\u5c1a\\u7f8e\\u5bb9\\u7f8e\\u53d1\\u5e97\\u6240\\u6709","address":"","phone":"","url":"","background_custom":null}', '凡星', '0.1', 1399209910, 0, 1),
(44, 'OnlineBooking', '在线预约', '在线预约模块', 1, '{"remindway":"4","toaddress":"hebiduhebi@126.com","address":"\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c","addressMap":"http:\\/\\/j.map.baidu.com\\/1u2hs","tel":"0575-89871666","info":"\\u63d0\\u4ea4\\u6210\\u529f\\u540e\\uff0c\\u5c06\\u4f1a\\u7535\\u8bdd\\u8054\\u7cfb\\u60a8\\u786e\\u5b9a\\u6b64\\u6b21\\u9884\\u7ea6\\u3002","picture":"http:\\/\\/gooraye.qiniudn.com\\/dwyzaixianyuyue.jpg","timepart":"12-24","projecttype":"\\u4e94\\u884c\\u7ecf\\u7edc\\u5237,SPA\\u80fd\\u91cf\\u70ed\\u77f3"}', 'hbd', '0.1', 1400314601, 1, 1),
(47, 'Xydzp', '幸运大转盘', '网络上最热门的抽奖活动 支持作弊等各种详细配置', 1, '{"need_trueljinfo":"1"}', 'les、拉帮姐派', '0.1', 1400676910, 1, 1),
(46, 'Panorama', '360全景', '三维全景展示全面的展示360度球型范围内的所有景致；用鼠标左键按住拖动，观看场景的各个方向；最大限度的保留了场景的真实性；给人以三维立体的空间感觉，使观者如身在其中。', 1, 'null', 'dd', '1', 1400676334, 1, 1),
(48, 'Photo', '微相册', '为用户提供图片的存储和展示服务，在微相册里，您可以方便的创建相册，轻松地发布您需要展示的照片，还可以拓展为商家开展活动的一种展现方式。', 1, 'null', '肥仔聪要淡定', '0.1', 1400824879, 1, 1),
(49, 'SMSWX', '短信接口', '短信接口', 1, '{"sendtotal":"500"}', '无名', '0.1', 1401348061, 0, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模型属性表' AUTO_INCREMENT=332 ;

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
(246, 'status', '状态', 'char(50) NOT NULL', 'select', '0', '', 3, '0:创建成功\r\n1:审核失败\r\n2:审核成功', 38, 0, 1, 1400036907, 1400036907, '', 3, '', 'regex', '', 3, 'function'),
(247, 'tourl', '点击转向此url', 'varchar(255) NOT NULL', 'string', '', '为空将使用系统默认跳转链接，不支持U函数', 1, '', 29, 0, 1, 1400336764, 1400336764, '', 3, '', 'regex', '', 3, 'function'),
(248, 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 39, 1, 1, 1396624337, 1396061575, '', 3, '', 'regex', '', 3, 'function'),
(249, 'keyword_type', '关键词类型', 'tinyint(2) NOT NULL', 'select', '0', '', 1, '0:完全匹配\r\n1:左边匹配\r\n2:右边匹配\r\n3:模糊匹配', 39, 1, 1, 1396624426, 1396061765, '', 3, '', 'regex', '', 3, 'function'),
(250, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 39, 1, 1, 1396624461, 1396061859, '', 3, '', 'regex', '', 3, 'function'),
(251, 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', 1, '', 39, 0, 1, 1396624505, 1396061947, '', 3, '', 'regex', '', 3, 'function'),
(252, 'mTime', '修改时间', 'int(10) NOT NULL', 'datetime', '', '', 0, '', 39, 0, 1, 1396624664, 1396624664, '', 3, '', 'regex', 'time', 3, 'function'),
(253, 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 0, 1, 1396624534, 1396062093, '', 3, '', 'regex', '', 3, 'function'),
(254, 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', 0, '', 39, 0, 1, 1396624612, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(255, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 39, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(256, 'picture1', '前', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317579, 1398317579, '', 3, '', 'regex', '', 3, 'function'),
(257, 'picture2', '右', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317609, 1398317609, '', 3, '', 'regex', '', 3, 'function'),
(258, 'picture3', '后', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317631, 1398317631, '', 3, '', 'regex', '', 3, 'function'),
(259, 'picture4', '左', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317658, 1398317658, '', 3, '', 'regex', '', 3, 'function'),
(260, 'picture5', '上', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317678, 1398317678, '', 3, '', 'regex', '', 3, 'function'),
(261, 'picture6', '下', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 39, 1, 1, 1398317695, 1398317695, '', 3, '', 'regex', '', 3, 'function'),
(262, 'keyword', '关键词', 'varchar(255) NOT NULL ', 'string', '', '用户发送 “关键词” 触发', 1, '', 40, 0, 1, 1395395713, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(263, 'start_date', '开始时间', 'int(10) NOT NULL ', 'datetime', '', '', 1, '', 40, 0, 1, 1395395676, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(264, 'end_date', '结束日期', 'int(10) NOT NULL ', 'datetime', '', '', 1, '', 40, 0, 1, 1395395670, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(265, 'cTime', '活动创建时间', 'int(10) NOT NULL ', 'datetime', '', '', 0, '', 40, 0, 1, 1395395963, 1395395179, '', 3, '', 'regex', 'time', 3, 'function'),
(266, 'states', '活动状态', 'char(10) NOT NULL ', 'radio', '0', '', 0, '0:未开始\r\n1:已结束', 40, 0, 1, 1395395602, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(267, 'picurl', '封面图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', 1, '', 40, 0, 1, 1395395545, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(268, 'title', '活动标题', 'varchar(255) NOT NULL ', 'string', '', '', 1, '', 40, 0, 1, 1395395535, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(269, 'guiz', '活动规则', 'text NOT NULL ', 'editor', '', '', 1, '', 40, 0, 1, 1395395520, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(270, 'choujnum', '每日抽奖次数', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 40, 0, 1, 1395395485, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(271, 'des', '活动介绍', 'text NOT NULL ', 'editor', '', '', 1, '', 40, 0, 1, 1395395338, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(272, 'des_jj', '活动介绍简介', 'text NOT NULL ', 'textarea', '', '活动介绍简介 用于给用户发送消息时候的图文描述', 1, '', 40, 0, 1, 1395395316, 1395395179, '', 0, '', 'regex', '', 0, 'function'),
(273, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 40, 0, 1, 1395396571, 1395396571, '', 3, '', 'regex', '', 3, 'function'),
(274, 'duijma', '兑奖码', 'text NOT NULL', 'textarea', '', '请输入兑奖码，一行一个', 1, '', 41, 0, 1, 1396253842, 1396253842, '', 3, '', 'regex', '', 3, 'function'),
(275, 'title', '奖品名称', 'varchar(255) NOT NULL ', 'string', '', '', 1, '', 41, 0, 1, 1395495283, 1395395190, '', 0, '', 'regex', '', 0, 'function'),
(276, 'pic', '奖品图片', 'int(10) unsigned NOT NULL ', 'picture', '', '', 1, '', 41, 0, 1, 1395495279, 1395395190, '', 0, '', 'regex', '', 0, 'function'),
(277, 'miaoshu', '奖品描述', 'text NOT NULL ', 'editor', '', '', 1, '', 41, 0, 1, 1395498375, 1395395190, '', 0, '', 'regex', '', 0, 'function'),
(278, 'num', '库存数量', 'int(10) unsigned NOT NULL ', 'num', '0', '', 1, '', 41, 0, 1, 1396667941, 1395395190, '', 0, '', 'regex', '', 0, 'function'),
(279, 'jptype', '奖品类型', 'char(10) NOT NULL ', 'select', '0', '奖品的类型', 1, '0:虚拟\r\n1:实物\r\n2:优惠券类（需要填写兑奖码且奖品数量为兑奖码数）', 41, 0, 1, 1396667895, 1395395190, '', 3, '', 'regex', '', 3, 'function'),
(280, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 41, 0, 1, 1395554191, 1395554191, '', 3, '', 'regex', '', 3, 'function'),
(281, 'isdf', '是否为谢谢惠顾类', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:中奖品\r\n1:该奖为谢谢惠顾类', 41, 0, 1, 1396338661, 1396191564, '', 3, '', 'regex', '', 3, 'function'),
(282, 'zjdate', '中奖时间', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 0, '', 42, 0, 1, 1396191999, 1396191999, '', 3, '', 'regex', 'time()', 3, 'function'),
(283, 'xydzp_id', '活动id', 'int(10) unsigned NOT NULL ', 'string', '0', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(284, 'xydzp_option_id', '奖品id', 'int(10) unsigned NOT NULL ', 'string', '0', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(285, 'state', '领奖状态', 'tinyint(2) NOT NULL', 'bool', '0', '', 0, '0:未领取\r\n1:已领取', 42, 0, 1, 1396705093, 1395395200, '', 0, '', 'regex', '', 0, 'function'),
(286, 'zip', '邮编', 'int(10) unsigned NOT NULL ', 'string', '', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(287, 'iphone', '电话', 'varchar(255) NOT NULL ', 'string', '', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(288, 'address', '收件地址', 'text NOT NULL ', 'string', '', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(289, 'message', '留言', 'text NOT NULL ', 'string', '', '', 1, '', 42, 0, 1, 1395395200, 1395395200, '', 0, '', '', '', 0, ''),
(290, 'uid', '用户openid', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 42, 0, 1, 1396686415, 1396686415, '', 3, '', 'regex', '', 3, 'function'),
(291, 'gailv', '中奖概率', 'int(10) UNSIGNED NOT NULL', 'num', '0', '请输入0-100之间书正整数', 1, '', 43, 0, 1, 1395559151, 1395559151, '', 3, '', 'regex', '', 3, 'function'),
(292, 'gailv_str', '参数', 'varchar(255) NOT NULL', 'string', '', '请输入对应中奖方式的相应值 多个以英文状态下的 逗号(,)分隔', 1, '', 43, 0, 1, 1395559219, 1395559219, '', 3, '', 'regex', '', 3, 'function'),
(293, 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NOT NULL', 'num', '0', '幸运大转盘关联的活动id', 0, '', 43, 0, 1, 1395555019, 1395555019, '', 3, '', 'regex', '', 3, 'function'),
(294, 'jlnum', '奖励数量', 'int(10) UNSIGNED NOT NULL', 'num', '0', '中奖后，获得该奖品的数量', 1, '', 43, 1, 1, 1395559386, 1395559386, '', 3, '', 'regex', '', 3, 'function'),
(295, 'type', '奖品中奖方式', 'char(50) NOT NULL', 'select', '0', '选择奖品中奖的方式', 1, '0:按概率中奖\r\n1:按时间中奖(未启用)\r\n2:按顺序中奖(未启用)\r\n3:按指定用户id中奖(未启用)', 43, 0, 1, 1396253189, 1395559102, '', 3, '', 'regex', '', 3, 'function'),
(296, 'gailv_maxnum', '单日发放上限', 'int(10) UNSIGNED NOT NULL', 'num', '0', '每天最多发放奖品的数量', 1, '', 43, 0, 1, 1395559281, 1395559281, '', 3, '', 'regex', '', 3, 'function'),
(297, 'xydzp_option_id', '幸运大转盘关联的全局奖品id', 'int(10) UNSIGNED NOT NULL', 'num', '', '幸运大转盘关联的全局奖品id', 0, '', 43, 0, 1, 1395555085, 1395555085, '', 3, '', 'regex', '', 3, 'function'),
(298, 'uid', '用户id', 'varchar(255) NOT NULL', 'string', '', '用户id', 0, '', 44, 0, 1, 1395567404, 1395567404, '', 3, '', 'regex', '', 3, 'function'),
(299, 'xydzp_id', '幸运大转盘关联的活动id', 'int(10) UNSIGNED NOT NULL', 'num', '', '幸运大转盘关联的活动id', 0, '', 44, 0, 1, 1395567452, 1395567452, '', 3, '', 'regex', '', 3, 'function'),
(300, 'num', '已经抽奖的次数', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '', 44, 0, 1, 1395567486, 1395567486, '', 3, '', 'regex', '', 3, 'function'),
(301, 'cjdate', '抽奖日期', 'int(10) NOT NULL', 'datetime', '', '', 1, '', 44, 0, 1, 1395567537, 1395567537, '', 3, '', 'regex', 'time', 3, 'function'),
(302, 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 45, 1, 1, 1396624337, 1396061575, '', 3, '', 'regex', '', 3, 'function'),
(303, 'visible', '是否显示相册', 'tinyint(2) NOT NULL', 'bool', '0', '', 1, '0:可见\r\n1:隐藏', 45, 0, 1, 1398485662, 1398485489, '', 3, '', 'regex', '', 3, 'function'),
(304, 'title', '相册名称', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 45, 1, 1, 1398485406, 1396061859, '', 3, '', 'regex', '', 3, 'function'),
(305, 'intro', '封面简介', 'text NOT NULL', 'textarea', '', '', 1, '', 45, 0, 1, 1396624505, 1396061947, '', 3, '', 'regex', '', 3, 'function'),
(306, 'cover', '封面图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 45, 1, 1, 1398573850, 1396062093, '', 3, '', 'regex', '', 3, 'function'),
(307, 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', 0, '', 45, 0, 1, 1396624612, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(308, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 45, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(309, 'sord', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '', 1, '数字越大越靠前', 45, 0, 1, 1398486028, 1398486028, '', 3, '', 'regex', '', 3, 'function'),
(310, 'sord', '排序', 'int(10) UNSIGNED NOT NULL', 'num', '0', '数字越大越靠前', 1, '', 46, 0, 1, 1398485965, 1398485965, '', 3, '', 'regex', '', 3, 'function'),
(311, 'intro', '描述', 'text NOT NULL', 'textarea', '', '', 1, '', 46, 0, 1, 1398485864, 1396061947, '', 3, '', 'regex', '', 3, 'function'),
(312, 'pic', '图片', 'int(10) UNSIGNED NOT NULL', 'picture', '', '', 1, '', 46, 1, 1, 1398573907, 1396062093, '', 3, '', 'regex', '', 3, 'function'),
(313, 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', 0, '', 46, 0, 1, 1396624612, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(314, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 46, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(315, 'pid', '相册ID', 'int(10) UNSIGNED NOT NULL', 'num', '', '', 4, '', 46, 1, 1, 1398492815, 1398485903, '', 3, '', 'regex', '', 3, 'function'),
(316, 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 47, 1, 1, 1396624337, 1396061575, '', 3, '', 'regex', '', 3, 'function'),
(326, 'keyword', '关键词', 'varchar(100) NOT NULL', 'string', '', '', 1, '', 48, 1, 1, 1396624337, 1396061575, '', 3, '', 'regex', '', 3, 'function'),
(318, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 47, 1, 1, 1396624461, 1396061859, '', 3, '', 'regex', '', 3, 'function'),
(327, 'title', '标题', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 48, 1, 1, 1396624461, 1396061859, '', 3, '', 'regex', '', 3, 'function'),
(328, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 48, 0, 1, 1396062146, 1396062146, '', 3, '', 'regex', '', 3, 'function'),
(329, 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', 0, '', 48, 0, 1, 1396624612, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(322, 'content', '内容', 'text NOT NULL', 'editor', '', '', 1, '', 47, 0, 1, 1396062146, 1396062146, '', 3, '', 'regex', '', 3, 'function'),
(323, 'cTime', '发布时间', 'int(10) UNSIGNED NOT NULL', 'datetime', '', '', 0, '', 47, 0, 1, 1396624612, 1396075102, '', 3, '', 'regex', 'time', 1, 'function'),
(324, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 47, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(325, 'mobiles', '接收手机号码', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 47, 0, 1, 1401347915, 1401347915, '', 3, '', 'regex', '', 3, 'function'),
(330, 'token', 'Token', 'varchar(255) NOT NULL', 'string', '', '', 0, '', 48, 0, 1, 1396602871, 1396602859, '', 3, '', 'regex', 'get_token', 1, 'function'),
(331, 'mobiles', '接收手机号码', 'varchar(255) NOT NULL', 'string', '', '', 1, '', 48, 0, 1, 1401347915, 1401347915, '', 3, '', 'regex', '', 3, 'function');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wp_card_member`
--

INSERT INTO `wp_card_member` (`id`, `number`, `cTime`, `phone`, `username`, `uid`, `token`) VALUES
(2, '80001', 1400572588, '13484379290', '何必度', 165, '536e0fac9c2c6'),
(3, '80002', 1400598731, '15158116809', '黄波', 173, '536e0fac9c2c6');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `wp_category`
--

INSERT INTO `wp_category` (`id`, `name`, `title`, `pid`, `sort`, `list_row`, `meta_title`, `keywords`, `description`, `template_index`, `template_lists`, `template_detail`, `template_edit`, `model`, `type`, `link_id`, `allow_publish`, `display`, `reply`, `check`, `reply_model`, `extend`, `create_time`, `update_time`, `status`, `icon`) VALUES
(1, 'news', '古睿', 0, 0, 10, '', '', '', '', '', '', '', '2', '2,1', 0, 1, 1, 0, 0, '1', '', 1379474947, 1399453851, 1, 0),
(2, 'news_info', '资讯', 1, 1, 10, '', '', '', '', '', '', '', '2', '2,1,3', 0, 1, 1, 0, 1, '1', '', 1379475028, 1400823170, 1, 31),
(41, 'sevices', '服务', 1, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1399453924, 1399453924, 1, 0),
(43, 'cases', '案例展示', 1, 0, 10, '', '', '', '', '', '', '', '2', '2', 0, 1, 1, 1, 0, '', '', 1399519081, 1399532164, 1, 0),
(44, 'Metro', 'Metro', 1, 0, 10, '', '', '', '', '', '', '', '', '', 0, 1, 1, 1, 0, '', '', 1401282013, 1401282013, 1, 0);

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
(7, 0, 'Metro', 'http://www.gooraye.net/index.php?s=/home/index/index_a.html', 4, 1399366288, 1401282086, 1, 1),
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
(2, 'WEB_SITE_DESCRIPTION', 2, '网站描述', 1, '', '网站搜索引擎描述', 1378898976, 1379235841, 1, '绍兴古睿，古睿信息科技，古睿', 1),
(3, 'WEB_SITE_KEYWORD', 2, '网站关键字', 1, '', '网站搜索引擎关键字', 1378898976, 1381390100, 1, '绍兴古睿，古睿信息科技，古睿，古睿科技，移动网站，CRM，客户管理系统', 8),
(4, 'WEB_SITE_CLOSE', 4, '关闭站点', 1, '0:关闭,1:开启', '站点关闭后其他用户不能访问，管理员可以正常访问', 1378898976, 1379235296, 1, '1', 1),
(9, 'CONFIG_TYPE_LIST', 3, '配置类型列表', 4, '', '主要用于数据解析和页面表单的生成', 1378898976, 1379235348, 1, '0:数字\r\n1:字符\r\n2:文本\r\n3:数组\r\n4:枚举', 2),
(10, 'WEB_SITE_ICP', 1, '网站备案号', 1, '', '设置在网站底部显示的备案号，如“沪ICP备12007941号-2', 1378900335, 1399451392, 1, '浙ICP备14015469号-1', 9),
(11, 'DOCUMENT_POSITION', 3, '文档推荐位', 2, '', '文档推荐位，推荐到多个位置KEY值相加即可', 1379053380, 1379235329, 1, '1:列表页推荐\r\n2:频道页推荐\r\n4:网站首页推荐', 3),
(12, 'DOCUMENT_DISPLAY', 3, '文档可见性', 2, '', '文章可见性仅影响前台显示，后台不收影响', 1379056370, 1379235322, 1, '0:所有人可见\r\n1:仅注册会员可见\r\n2:仅管理员可见', 4),
(13, 'COLOR_STYLE', 4, '后台色系', 1, 'default_color:默认\r\nblue_color:紫罗兰\r\ntheme1:似黄色\r\nblackwhite:黑白灰', '后台颜色风格', 1379122533, 1400807938, 1, 'blackwhite', 10),
(20, 'CONFIG_GROUP_LIST', 3, '配置分组', 4, '', '配置分组', 1379228036, 1384418383, 1, '1:基本\r\n3:用户\r\n4:系统', 4),
(21, 'HOOKS_TYPE', 3, '钩子的类型', 4, '', '类型 1-用于扩展显示内容，2-用于扩展业务处理', 1379313397, 1379313407, 1, '1:视图\r\n2:控制器', 6),
(22, 'AUTH_CONFIG', 3, 'Auth配置', 4, '', '自定义Auth.class.php类配置', 1379409310, 1379409564, 1, 'AUTH_ON:1\r\nAUTH_TYPE:2', 8),
(23, 'OPEN_DRAFTBOX', 4, '是否开启草稿功能', 2, '0:关闭草稿功能\r\n1:开启草稿功能\r\n', '新增文章时的草稿功能配置', 1379484332, 1379484591, 1, '1', 1),
(24, 'DRAFT_AOTOSAVE_INTERVAL', 0, '自动保存草稿时间', 2, '', '自动保存草稿的时间间隔，单位：秒', 1379484574, 1386143323, 1, '60', 2),
(25, 'LIST_ROWS', 0, '后台每页记录数', 4, '', '后台数据每页显示记录数', 1379503896, 1391938052, 1, '10', 10),
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
(38, 'WEB_SITE_VERIFY', 4, '登录验证码', 1, '0:关闭,1:开启', '登录时是否需要验证码', 1378898976, 1378898976, 1, '0', 2),
(42, 'ACCESS', 2, '未登录时可访问的页面', 4, '', '不区分大小写', 1390656601, 1390664079, 1, 'online_booking/*/*\r\nphoto/*/*\r\nwei_site/wei_site/*\r\nHome/User/*\r\nhome/addons/execute/*\r\nHome/Article/*\r\nFront/User/login\r\nHome/Index/*\r\nhome/weixin/*\r\nadmin/File/*\r\nhome/File/*', 0),
(44, 'DEFAULT_PUBLIC_GROUP_ID', 0, '公众号默认等级ID', 3, '', '前台新增加的公众号的默认等级，值为0表示不做权限控制，公众号拥有全部插件的权限', 1393759885, 1393759981, 1, '0', 1),
(45, 'SYSTEM_UPDATE_REMIND', 4, '系统升级提醒', 4, '0:关闭\r\n1:开启', '开启后官方有新升级信息会及时在后台的网站设置页面头部显示升级提醒', 1393764263, 1394273968, 1, '0', 5),
(46, 'SYSTEM_UPDATRE_VERSION', 0, '系统升级最新版本号', 4, '', '记录当前系统的版本号，这是与官方比较是否有升级包的唯一标识，不熟悉者只勿改变其数值', 1393764702, 1394274087, 1, '20140417', 6),
(47, 'ADMIN_KEY', 2, '后台登录key', 0, '', '', 1399464016, 1399464282, 1, 'hebidu', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `wp_custom_menu`
--

INSERT INTO `wp_custom_menu` (`id`, `url`, `keyword`, `title`, `pid`, `sort`, `token`) VALUES
(7, '', '', '专业服务', 0, 0, '536e0fac9c2c6'),
(4, '', '', '戴维营', 0, 0, '536e0fac9c2c6'),
(5, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6', '', '关于戴维营', 4, 6, '536e0fac9c2c6'),
(6, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6', '', '官网', 4, 7, '536e0fac9c2c6'),
(8, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6', '', 'SPA能量热石', 7, 0, '536e0fac9c2c6'),
(9, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6', '', '五行经络刷', 7, 0, '536e0fac9c2c6'),
(10, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index', '', '在线预约', 14, 0, '536e0fac9c2c6'),
(14, '', '', '在线服务', 0, 0, '536e0fac9c2c6'),
(15, '', '建议意见', '意见反馈', 14, 1, '536e0fac9c2c6'),
(16, '', 'Card', '微信会员', 4, 8, '536e0fac9c2c6'),
(30, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6', '', '中药舒缓排毒', 7, 5, '536e0fac9c2c6'),
(31, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6', '', '生命能量药泥', 7, 0, '536e0fac9c2c6'),
(32, 'http://wsq.qq.com/242096555', '', '微社区', 0, 0, '53705a8fb5564'),
(34, '', '天气', '天气查询', 14, 2, '536e0fac9c2c6'),
(35, '', '笑话', '开心一笑', 14, 4, '536e0fac9c2c6'),
(36, '', '', '在线服务', 0, 0, '53705a8fb5564'),
(37, '', 'Suggestions', '意见反馈', 36, 0, '53705a8fb5564'),
(38, '', '联系我们', '联系我们', 36, 0, '53705a8fb5564');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wp_custom_reply_mult`
--

INSERT INTO `wp_custom_reply_mult` (`id`, `keyword`, `keyword_type`, `mult_ids`, `token`) VALUES
(1, '服务', 3, '5,6,8,9,10,11', '536e0fac9c2c6');

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
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `tourl` varchar(255) NOT NULL COMMENT '点击转向此url'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `wp_custom_reply_news`
--

INSERT INTO `wp_custom_reply_news` (`id`, `keyword`, `keyword_type`, `title`, `intro`, `cate_id`, `cover`, `content`, `cTime`, `sort`, `view_count`, `token`, `tourl`) VALUES
(1, '古睿', 3, '古睿信息科技有限公司', '客服热线：0575-85060707\r\n办公地址：浙江省绍兴市越城区汤公路186号\r\n建议反馈：QQ:2966442390 QQ:1966236348', 1, 0, '客服热线：0575-85060707<br />\r\n办公地址：浙江省绍兴市越城区汤公路186号<br />\r\n建议反馈：QQ:2966442390 QQ:1966236348<br />', 1399636825, 0, 0, '53663a115a861', ''),
(2, '企业简介', 0, '戴维营SPA介绍', '戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。', 3, 73, '戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。', 1399899528, 0, 112, '536e0fac9c2c6', ''),
(3, '大厅', 3, '大厅展示', '大厅展示', 2, 91, '', 1399958566, 1, 20, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/5.html'),
(12, '微社区', 0, '点击进入微社区', '古睿小伙伴社区', 0, 0, '', 1400660364, 0, 0, '53705a8fb5564', 'http://www.qq.com/'),
(15, '优惠', 3, '查看优惠活动', '查看优惠活动', 6, 0, '<h2><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 24px; color: rgb(255, 0, 0);">美团网</span><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);">：</span></h2><h2><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);"><span style="font-family: Tahoma, Helvetica, arial, sans-serif; font-size: 16px; color: rgb(255, 0, 0); line-height: 24px; -color: rgb(255, 255, 255);">中药舒缓排毒护理1次，男女不限，提供免费WiFi。针对长期透支、疲倦、失眠、力不从心、总觉得身体不对劲，又检查不出什么问题的亚健康一族。</span></span></h2><h2><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 24px; color: rgb(255, 0, 0);">5.4</span><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);">折进行中  </span><a href="http://sx.meituan.com/deal/15677572.html?source=tuan800_cps&utm_campaign=AffProg&utm_medium=tuan800_cps&utm_source=out.tuan800.com&utm_content=&_rdt=1&utm_term=&urpid=tuan800%7C1%7C537eb044fbdde4b3dd007558%7C02520%7C" target="_blank" title="" style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);">火速前往</a><a href="http://sx.meituan.com/deal/15677572.html?source=tuan800_cps&utm_campaign=AffProg&utm_medium=tuan800_cps&utm_source=out.tuan800.com&utm_content=&_rdt=1&utm_term=&urpid=tuan800%7C1%7C537eb044fbdde4b3dd007558%7C02520%7C" target="_blank" title="" style="font-size: 16px;"></a><a href="http://sx.meituan.com/deal/15677572.html?source=tuan800_cps&utm_campaign=AffProg&utm_medium=tuan800_cps&utm_source=out.tuan800.com&utm_content=&_rdt=1&utm_term=&urpid=tuan800%7C1%7C537eb044fbdde4b3dd007558%7C02520%7C" target="_blank" title="" style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);">〉〉</a><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);"> </span></h2><p><span style="font-family: 微软雅黑, ''Microsoft YaHei''; font-size: 16px; color: rgb(255, 0, 0);"><br/></span></p><hr/><p><span style="color: rgb(192, 0, 0); font-family: ''Microsoft YaHei''; line-height: 40px; text-align: center; -color: rgb(244, 244, 244);"></span></p><h2 class="sub-title" style="margin: 0px 20px 0px 0px; padding: 0px 0px 13px; border: 0px; outline: 0px; font-size: 16px; line-height: 25px; color: rgb(102, 102, 102); font-weight: normal; font-family: ''Microsoft YaHei'', arial, sans-serif; text-overflow: ellipsis; height: auto; overflow: hidden; white-space: normal; -color: rgb(255, 255, 255);"><strong><span style="color: rgb(255, 0, 0);"><br/></span></strong></h2><h2 class="sub-title" style="margin: 0px 20px 0px 0px; padding: 0px 0px 13px; border: 0px; outline: 0px; font-size: 16px; line-height: 25px; color: rgb(102, 102, 102); font-weight: normal; font-family: ''Microsoft YaHei'', arial, sans-serif; text-overflow: ellipsis; height: auto; overflow: hidden; white-space: normal; -color: rgb(255, 255, 255);"><strong><span style="font-size: 24px;"><span style="color: rgb(255, 0, 0);">大众点评网</span></span><span style="color: rgb(255, 0, 0);">：</span></strong></h2><h2 class="sub-title" style="margin: 0px 20px 0px 0px; padding: 0px 0px 13px; border: 0px; outline: 0px; font-size: 16px; line-height: 25px; color: rgb(102, 102, 102); font-weight: normal; font-family: ''Microsoft YaHei'', arial, sans-serif; text-overflow: ellipsis; height: auto; overflow: hidden; white-space: normal; -color: rgb(255, 255, 255);"><strong><span style="color: rgb(255, 0, 0);">草本泥护理</span></strong><strong><span style="color: rgb(255, 0, 0);">!即便身处繁华闹市,亦能享受回归自然的静谧轻松!</span></strong></h2><h2 class="sub-title" style="margin: 0px 20px 0px 0px; padding: 0px 0px 13px; border: 0px; outline: 0px; font-size: 16px; line-height: 25px; color: rgb(102, 102, 102); font-weight: normal; font-family: ''Microsoft YaHei'', arial, sans-serif; text-overflow: ellipsis; height: auto; overflow: hidden; white-space: normal; -color: rgb(255, 255, 255);"><span style="color: rgb(255, 0, 0); font-size: 24px;"><strong><span style="color: rgb(255, 0, 0); font-family: ''Microsoft YaHei''; text-align: center; line-height: 40px;">6.2</span></strong></span><span style="color: rgb(255, 0, 0);"><strong><span style="font-family: ''Microsoft YaHei''; text-align: center; line-height: 40px;"></span></strong><strong><span style="font-family: ''Microsoft YaHei''; text-align: center; line-height: 40px;"></span></strong></span><strong><span style="color: rgb(255, 0, 0); font-family: ''Microsoft YaHei''; text-align: center; line-height: 40px;">折</span><span style="color: rgb(255, 0, 0);"><span style="color: rgb(255, 0, 0); text-align: center; font-family: sans-serif;">进行中 </span><a href="http://t.dianping.com/deal/2263027" target="_self" title=""><span style="color: rgb(255, 0, 0); text-align: center; font-family: ''Microsoft YaHei''; line-height: 40px; -color: rgb(244, 244, 244);">火速前往〉〉</span></a></span></strong></h2><p><br/></p><p><br/></p>', 1400746183, 0, 11, '536e0fac9c2c6', ''),
(8, '护理', 3, '中药舒缓排毒护理 ', '这款是我们店的放松款，当你长期透支，疲劳，失眠，力不从心的时候，可以让您全身放松，疏通全身经络，促进血液循环，改善睡眠，让您感受全身心的洗礼。', 4, 83, '<p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_0" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_2" style="display: none; line-height: 0px;">‍</span>产品：源自巴厘岛的精油<span id="_baidu_bookmark_end_3" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_end_1" style="display: none; line-height: 0px;">‍</span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_4" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_6" style="display: none; line-height: 0px;">‍</span>服务流程/时长：105分钟（含中药泡澡30分钟）<span id="_baidu_bookmark_end_7" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span style="font-family:宋体"><span id="_baidu_bookmark_end_5" style="display: none; line-height: 0px;">‍</span></span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_8" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_10" style="display: none; line-height: 0px;">‍</span>淋浴——精油中药舒缓泡浴——放松冥想（香薰吸入法）——舒活养生（头部按摩）——肩颈按摩——背部膀胱经按摩——背面腿部舒缓——正面腿部舒缓——肠胃保养——面部清洁（按摩时间是75分钟）<span id="_baidu_bookmark_end_11" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span style="font-family:宋体"><span id="_baidu_bookmark_end_9" style="display: none; line-height: 0px;">‍</span></span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p class="p0" style="margin-bottom:0pt; margin-top:0pt; "><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_12" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_14" style="display: none; line-height: 0px;">‍</span>这款是我们店的放松款，当你长期透支，疲劳，失眠，力不从心的时候，可以让您全身放松，疏通全身经络，促进血液循环，改善睡眠，让您感受全身心的洗礼。</p><p><span id="_baidu_bookmark_end_15" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_13" style="display: none; line-height: 0px;">‍</span><br/></p>', 1400574129, 0, 36, '536e0fac9c2c6', ''),
(5, '五行经络刷', 0, '五行经络刷', '五行经络刷可以快速疏通身体各部位的淋巴管及经络，让身体里的游离脂肪归位，进而起到减肥和美容的效果。弹力凸点形成细小间隔挤压消脂，打散坚硬脂肪，非常有效地消除橘皮组织。配合适当的力度，搭配适当的精油，可以通经络使毒素废物不再淤塞堆积。 有效结合中医五行学，推测使用者身体健康值。可以达到事半功倍的减肥效果和经络疏通。', 4, 88, '<p><span style=";font-weight:bold;font-size:16px;font-family:''宋体''">美容效果</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><br/></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">1、快速疏通身体各部位的</span><a href="http://baike.baidu.com/view/179333.htm"><span style="color: rgb(19, 110, 194);font-size: 16px;font-family: 宋体">淋巴管</span></a><span style=";font-size:16px;font-family:''宋体''">及经络；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">2、预防性，消除身体多余赘肉，并可预防如静脉曲张等因淋巴管及经络不通的各种症状；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">3、增效性，可替代传统手工按摩，并可把当次效果提高到惊人的20倍；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><br/></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><br/></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">使用方法</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><br/></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><br/></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">1.</span><span style=";font-size:16px;font-family:''宋体''">用于局部减肥：迅速打散脂肪，省时省力，不再让美容师搓得气喘唏嘘；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">2.</span><span style=";font-size:16px;font-family:''宋体''">用于头部按摩：改善生发、防脱发、头皮、失眠多梦、记忆力下降、面色暗黄有奇效。使用极为方便；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">3.</span><span style=";font-size:16px;font-family:''宋体''">用于足疗：在手工按摩前刷脚底，活血通畅效果比手工按摩强20倍以上，且极为省力，刷为整条腿发热，全身通畅；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">4.</span><span style=";font-size:16px;font-family:''宋体''">用于腿部淋巴排毒，雕塑腿形：系最佳的消除水肿、消除腿部小红疹、消除腿部干燥、消除腿部赘肉的选择，轻松一刷，当次见效；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">5.</span><span style=";font-size:16px;font-family:''宋体''">用于背部按摩，可根据本产品文字提示，推测出使用者身体健康值。使用方法：自上而下，先头部、颈、背、腰部或腹部、后四肢，先按摩身体左侧，再按摩身体右侧；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">6.</span><span style=";font-size:16px;font-family:''宋体''">头部：用美体刷从额前到后脑，不必涂刮润滑剂，每个部位疏通30次左右，刮至头部发热感为宜；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">7.</span><span style=";font-size:16px;font-family:''宋体''">颈部：从上向下刷，所以经常刮拭颈部，具有防治疾病的作用；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">8.</span><span style=";font-size:16px;font-family:''宋体''">背部：自上向下疏通</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">9.</span><span style=";font-size:16px;font-family:''宋体''">胸部：腹部正中线用美体刷自上而下疏通。胸部两侧以身体</span><a href="http://baike.baidu.com/view/409338.htm"><span style="color: rgb(19, 110, 194);font-size: 16px;font-family: 宋体">前正中线</span></a><span style=";font-size:16px;font-family:''宋体''">任脉为界，分别向左右（先左后右）用刷由内向外沿肋骨走向刮拭，注意避开乳头部位；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">10.</span><span style=";font-size:16px;font-family:''宋体''">腹部：腹部由上向下疏通（有内脏下垂者，应由下向上疏通）亦可用螺旋打圈；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">11.</span><span style=";font-size:16px;font-family:''宋体''">上肢：从上向下疏通；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">12.</span><span style=";font-size:16px;font-family:''宋体''">下肢：由下向上疏通（即向脏方向按摩）；</span></p><p style="margin-bottom: 0;margin-top: 0;-color: rgb(255, 255, 255)"><span style=";font-size:16px;font-family:''宋体''">13.</span><span style=";font-size:16px;font-family:''宋体''">脚底：从脚跟向脚肢方向按摩</span><span style=";font-size:16px;font-family:''宋体''">.</span></p><p><br/></p>', 1400243964, 10, 30, '536e0fac9c2c6', ''),
(6, 'SPA能量热石', 0, 'SPA能量热石', '热石疗法的起源：巧妙运用火山能量的另类疗法\r\n', 4, 98, '<p><span style=";font-size:16px;font-family:''Times New Roman''">目前，<span style="font-family:Times New Roman">[</span><span style="font-family:宋体">热石疗法</span><span style="font-family:Times New Roman">]</span><span style="font-family:宋体">是欧美各地的</span><span style="font-family:Times New Roman">SPA</span><span style="font-family:宋体">（</span><span style="font-family:Times New Roman">Destination Spa</span><span style="font-family:宋体">）、渡假</span><span style="font-family:Times New Roman">Resort</span><span style="font-family:宋体">及</span><span style="font-family:Times New Roman">Retreat Center</span><span style="font-family:宋体">的必备疗程。在都市里的</span><span style="font-family:Times New Roman">SPA,</span><span style="font-family:宋体">结合</span><span style="font-family:Times New Roman">[</span><span style="font-family:宋体">热石疗法</span><span style="font-family:Times New Roman">]</span><span style="font-family:宋体">与美容保健疗程，更是深受众多爱美女士欢迎的最热门保健疗法。</span><span style="font-family:Times New Roman">[</span><span style="font-family:宋体">热石疗法</span><span style="font-family:Times New Roman">]</span><span style="font-family:宋体">简单、方便、开放、亲和、经济、环保、天然和有效的特性</span><span style="font-family:Times New Roman">,</span><span style="font-family:宋体">无疑完全符合了</span><span style="font-family:Times New Roman">21</span><span style="font-family:宋体">世纪人们讲求天然、生态、环保、安全、</span></span><span style=";font-size:16px;font-family:''Times New Roman''">知性</span><span style=";font-size:16px;font-family:''Times New Roman''">和有效的美容保健观念，在可预见的未来几年间<span style="font-family:Times New Roman">,</span><span style="font-family:宋体">全球各地</span><span style="font-family:Times New Roman">SPA</span><span style="font-family:宋体">与</span></span><span style=";font-size:16px;font-family:''Times New Roman''">美容美体</span><span style=";font-size:16px;font-family:''Times New Roman''">中心<span style="font-family:Times New Roman">,</span><span style="font-family:宋体">必定会提供某种类型的</span><span style="font-family:Times New Roman">[</span><span style="font-family:宋体">热石疗法</span><span style="font-family:Times New Roman">]</span><span style="font-family:宋体">，以求跟上全球化的流行趋势。与此同时</span><span style="font-family:Times New Roman">,[</span><span style="font-family:宋体">热石疗法</span><span style="font-family:Times New Roman">]</span><span style="font-family:宋体">也终将逐渐挺进家庭保健</span><span style="font-family:Times New Roman">DIY</span><span style="font-family:宋体">领域</span><span style="font-family:Times New Roman">,</span><span style="font-family:宋体">成为</span><span style="font-family:Times New Roman">21</span><span style="font-family:宋体">世纪最具卖点、普遍性与实用性相结合的另类</span></span><span style=";font-size:16px;font-family:''Times New Roman''">自然疗法</span><span style=";font-size:16px;font-family:''Times New Roman''">。　　</span></p><p><br/></p><p><span style=";font-size:16px;font-family:''Times New Roman''">热石</span><span style=";font-size:16px;font-family:''Times New Roman''">石材</span><span style=";font-size:16px;font-family:''Times New Roman''">的选用<span style="font-family:Times New Roman">: ----------- </span><span style="font-family:宋体">大自然的恩赐：火山</span></span><span style=";font-size:16px;font-family:''Times New Roman''">玄武岩</span></p><p><span style=";font-size:16px;font-family:''Times New Roman''"><br/></span><span style=";font-size:16px;font-family:''Times New Roman''">　　采自大自然</span><span style=";font-size:16px;font-family:''Times New Roman''">火山喷发</span><span style=";font-size:16px;font-family:''Times New Roman''">后，遗落在火山脚下或大海边的火山</span><span style=";font-size:16px;font-family:''Times New Roman''">玄武岩</span><span style=";font-size:16px;font-family:''Times New Roman''">，经过机器粗加工和精细的人工打磨，依据人体的特征，加工成适合做人体按摩的能量热石。从地理位置来讲，</span><span style=";font-size:16px;font-family:''Times New Roman''">活火山</span><span style=";font-size:16px;font-family:''Times New Roman''">基本上都远离任何大陆区域，贸</span><span style=";font-size:16px;font-family:''Times New Roman''">易风</span><span style=";font-size:16px;font-family:''Times New Roman''">可以长驱直入，雨水充沛，海岸与河床上的火山</span><span style=";font-size:16px;font-family:''Times New Roman''">玄武岩</span><span style=";font-size:16px;font-family:''Times New Roman''">受到侵蚀与</span><span style=";font-size:16px;font-family:''Times New Roman''">风化作用</span><span style=";font-size:16px;font-family:''Times New Roman''">的程度也最恰到好处，大部分治疗师认为其蓄热能力优异，</span><span style=";font-size:16px;font-family:''Times New Roman''">酸碱性</span><span style=";font-size:16px;font-family:''Times New Roman''">也最为适当，同时又蕴涵充沛的矿物与磁场能量，最适合用与人体密切、长时间接触，又能产生透热性（可促进产品成分渗透）的治疗性按摩或能量治疗用途。它们是纯天然的，每一颗热石都依照其个别用途经人工逐一捡拾筛选，每一个热石都是采自大自然，完全符合了热石疗法的特质。</span></p><p><span style=";font-size:16px;font-family:''Times New Roman''"><br/></span><span style=";font-size:16px;font-family:''Times New Roman''">　　热石疗法的功效<span style="font-family:Times New Roman">:---------- </span><span style="font-family:宋体">现代时尚</span><span style="font-family:Times New Roman">SPA</span><span style="font-family:宋体">疗法的完</span></span><span style=";font-size:16px;font-family:''Times New Roman''">美体</span><span style=";font-size:16px;font-family:''Times New Roman''">现</span></p><p><span style=";font-size:16px;font-family:''Times New Roman''"><br/></span><span style=";font-size:16px;font-family:''Times New Roman''">　　采用经</span><span style=";font-size:16px;font-family:''Times New Roman''">火山喷发</span><span style=";font-size:16px;font-family:''Times New Roman''">后形成的玄武岩，经过特殊加热后，放置在人体的皮肤或经络上，因为热石具有大地的能量，作用于身体局部和整体系统，通过深层的</span><span style=";font-size:16px;font-family:''Times New Roman''">热传导</span><span style=";font-size:16px;font-family:''Times New Roman''">方式把热力源源不断地输入体内，再经由反射穴点的传导，对</span><span style=";font-size:16px;font-family:''Times New Roman''">肌肉组织</span><span style=";font-size:16px;font-family:''Times New Roman''">及关节具有激发调节功能。此类疗法更融合了现代美容养生等理念，结合最新</span><span style=";font-size:16px;font-family:''Times New Roman''">香薰精油</span><span style=";font-size:16px;font-family:''Times New Roman''">和特殊</span><span style=";font-size:16px;font-family:''Times New Roman''">按摩手法</span><span style=";font-size:16px;font-family:''Times New Roman''">，可舒缓疲劳，放松神经，补充能量，令您在苦思冥想中感受到大自然的美景，一切来自日常生活中的紧张与压力在这个过程中消除解散。经科学检测，火山能量热石与普通岩石不同，它蕴含丰富的矿物质和微量元素，在加热后会产生磁效应、温</span><span style=";font-size:16px;font-family:''Times New Roman''">热效应</span><span style=";font-size:16px;font-family:''Times New Roman''">、</span><span style=";font-size:16px;font-family:''Times New Roman''">生物电</span><span style=";font-size:16px;font-family:''Times New Roman''">效应、温差效应、</span><span style=";font-size:16px;font-family:''Times New Roman''">远红外</span><span style=";font-size:16px;font-family:''Times New Roman''">效应、靶向效应等，可以进行健康理疗、舒缓疲劳、放松神经、补充能量、促进血液循环、打通经络、活血化瘀、驱风散寒、平衡神经系统、荷尔蒙系统、强化内分泌，将热石作用于腹部，顺着大肠走向做热石按摩，还可以起到肠胃保健、调节内分泌等特殊功效。</span></p><p><br/></p>', 1400244321, 1, 44, '536e0fac9c2c6', ''),
(7, '预约', 0, '在线预约', '在线预约', 0, 0, '', 1400337120, 0, 2, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index/token/536e0fac9c2c6'),
(9, '药泥', 0, '生命能量药泥护理 ', '这款是我们店的治疗款。', 4, 108, '<p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_0" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_2" style="display: none; line-height: 0px;">‍</span>产品：皇家养正中药原液套组<span id="_baidu_bookmark_end_3" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_end_1" style="display: none; line-height: 0px;">‍</span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_4" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_6" style="display: none; line-height: 0px;">‍</span>服务流程/时长：120分钟（含红酒泡澡30分钟）<span id="_baidu_bookmark_end_7" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span style="font-family:宋体"><span id="_baidu_bookmark_end_5" style="display: none; line-height: 0px;">‍</span></span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_8" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_10" style="display: none; line-height: 0px;">‍</span>足部清脚——淋浴——精油红酒舒缓泡浴——放松冥想（香薰吸入法）——舒活养生（头部按摩）——肩颈按摩——背部膀胱<span id="_baidu_bookmark_start_12" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_14" style="display: none; line-height: 0px;">‍</span>经按摩—<span id="_baidu_bookmark_end_11" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_9" style="display: none; line-height: 0px;">‍</span>—背面腿部舒缓——正面腿部舒缓——肠胃保养——面部清洁（按摩时间是90分钟）<span id="_baidu_bookmark_end_15" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span style="font-family:宋体"><span id="_baidu_bookmark_end_13" style="display: none; line-height: 0px;">‍</span></span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_start_16" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_18" style="display: none; line-height: 0px;">‍</span>这款是我们店的治疗款，当你长期透支，疲劳，失眠，力不从心，肩颈酸痛，腰肌酸软，偏头痛，肠胃不适，四肢无力的时候，我们这款皇家养正的套组里的单方原液可自由调配，就像医生给病人开处方一样，根据每个人的情况不一样，调配的原液也是不一样，还有一款中草药泥针对与您哪一块不舒适就用哪一款的药泥，让您全身放松，疏通全身经络，促进血液循环，改善睡眠，让您感受全身心的洗礼。<span id="_baidu_bookmark_end_19" style="display: none; line-height: 0px;">‍</span><span style="font-size: 10.5pt; font-family: 宋体;"><span id="_baidu_bookmark_end_17" style="display: none; line-height: 0px;">‍</span></span><span style="font-size: 10.5pt; font-family: 宋体;"></span></p><p><br/></p>', 1400574204, 5, 29, '536e0fac9c2c6', ''),
(10, '热石', 0, '巴厘岛热石按摩 ', '这款是在我们店里598项目上追加巴厘岛SPA热石', 4, 107, '<p><span style=";font-size:14px;font-family:''宋体''"></span></p><p><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_start_12" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_14" style="display: none; line-height: 0px;">‍</span><br/><span id="_baidu_bookmark_start_28" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_30" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_24" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_26" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_20" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_22" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_16" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_18" style="display: none; line-height: 0px;">‍</span></p><p><span style="font-size: 14px; font-family: 宋体;"><br/></span></p><p><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_start_40" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_42" style="display: none; line-height: 0px;">‍</span>产品：皇家养正中药原液套组+巴厘岛SPA热石</p><p><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_start_44" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_46" style="display: none; line-height: 0px;">‍</span>服务流程/时长：150分钟（含红酒泡澡30分钟）<span id="_baidu_bookmark_end_47" style="display: none; line-height: 0px;">‍</span><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_end_45" style="display: none; line-height: 0px;">‍</span></span></p><p><span style="font-family: 宋体; font-size: 14px;"><br/></span></p><p><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_start_48" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_50" style="display: none; line-height: 0px;">‍</span>足部清脚——淋浴——精油红酒舒缓泡浴——放松冥想（香薰吸入法）——舒活养生（头部按摩）——肩颈按摩——背部膀胱经按摩——背面腿部舒缓——正面腿部舒缓——肠胃保养——面部护理（附送面膜）——全身热石SPA按摩</p><p><span id="_baidu_bookmark_end_51" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_49" style="display: none; line-height: 0px;">‍</span><br/></p><p><span style="font-size: 14px;"><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_start_52" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_start_54" style="display: none; line-height: 0px;">‍</span>这款是在<span id="_baidu_bookmark_end_55" style="display: none; line-height: 0px;">‍</span><span style="font-size: 14px;"><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_end_53" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_end_43" style="display: none; line-height: 0px;">‍</span><span style="font-size: 14px;"><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_end_41" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_32" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_start_34" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_36" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_38" style="display: none; line-height: 0px;">‍</span>我们店里<span id="_baidu_bookmark_end_39" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_37" style="display: none; line-height: 0px;">‍</span>598项目上追加巴厘岛SPA热石，重点就是这热石经过特殊加热后，放置在人体的皮肤或经络上，因为热石具有大地的能量，作用于身体局部和整体系统，通过深层的热传导方式把热力源源不断地输入体内，再经由反射穴点的传导，对肌肉组织及关节具有激发调节功能，缓解肌肉酸痛，让您全身放松，疏通全身经络，促进血液循环，改善睡眠，让您感受全身心的洗礼。<span id="_baidu_bookmark_end_35" style="display: none; line-height: 0px;">‍</span><span style="font-size: 14px;"><span style="font-size: 14px; font-family: 宋体;"><span id="_baidu_bookmark_end_33" style="display: none; line-height: 0px;">‍</span></span></span></p><p><span id="_baidu_bookmark_end_31" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_29" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_27" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_25" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_23" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_21" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_19" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_17" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_15" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_13" style="display: none; line-height: 0px;">‍</span><br/></p>', 1400574332, 7, 5, '536e0fac9c2c6', ''),
(11, '皇家', 0, '皇家养生舒活护理 ', '这款是在我们店里880项目上追加五行经络导引刷', 4, 106, '<p><span style="font-size: 14px;font-family: 宋体"><span id="_baidu_bookmark_start_0" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_2" style="display: none; line-height: 0px;">‍</span>产品：皇家养正中药原液套组+巴厘岛SPA热石+五行经络导引刷<span id="_baidu_bookmark_end_3" style="display: none; line-height: 0px;">‍</span><span style=";font-size:14px;font-family:''宋体''"><span style="font-family:宋体"><span id="_baidu_bookmark_end_1" style="display: none; line-height: 0px;">‍</span></span></span></p><p><span style=";font-size:14px;font-family:''宋体''"><span id="_baidu_bookmark_start_4" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_6" style="display: none; line-height: 0px;">‍</span>服务流程/时长：180分钟（含红酒泡澡30分钟）<span id="_baidu_bookmark_end_7" style="display: none; line-height: 0px;">‍</span><span style=";font-size:14px;font-family:''宋体''"><span style="font-family:宋体"><span id="_baidu_bookmark_end_5" style="display: none; line-height: 0px;">‍</span></span></span></p><p><span style=";font-size:14px;font-family:''宋体''"><span id="_baidu_bookmark_start_8" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_10" style="display: none; line-height: 0px;">‍</span>足部清脚——淋浴——精油红酒舒缓泡浴——放松冥想（香薰吸入法）——舒活养生（头部按摩）——肩颈按摩——背部膀胱经按摩——背面腿部舒缓——正面腿部舒缓——肠胃保养——面部护理（附送面膜）——全身热石SPA按摩——全身经络导引刷疏通<span id="_baidu_bookmark_end_11" style="display: none; line-height: 0px;">‍</span><span style=";font-size:14px;font-family:''宋体''"><span style="font-family:宋体"><span id="_baidu_bookmark_start_16" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_start_18" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_9" style="display: none; line-height: 0px;">‍</span></p><p><span style=";font-size:14px;font-family:''宋体''"><span id="_baidu_bookmark_start_12" style="display: none; line-height: 0px;">‍</span></span><span id="_baidu_bookmark_start_14" style="display: none; line-height: 0px;">‍</span>这款是在我们店里880项目<span id="_baidu_bookmark_end_15" style="display: none; line-height: 0px;">‍</span><span style=";font-size:14px;font-family:''宋体''"><span style="font-family:宋体"><span id="_baidu_bookmark_end_13" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_24" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_start_26" style="display: none; line-height: 0px;">‍</span>上<span id="_baidu_bookmark_end_27" style="display: none; line-height: 0px;">‍</span><span style=";font-size:14px;font-family:''宋体''"><span style="font-family:宋体"><span id="_baidu_bookmark_end_25" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_start_20" style="display: none; line-height: 0px;">‍</span></span></span><span id="_baidu_bookmark_start_22" style="display: none; line-height: 0px;">‍</span>追加五行经络导引刷，重点在于这五行经络导引刷可以快速疏通身体各部位的淋巴管及经络，让身体里的游离脂肪归位，进而起到减肥和美容的效果。弹力凸点形成细小间隔挤压消脂，打散坚硬脂肪，非常有效地消除橘皮组织。配合适当的力度，搭配适当的精油，可以通经络使毒素废物不再淤塞堆积。 有效结合中医五行学，推测使用者身体健康值。可以达到事半功倍的减肥效果和经络疏通。让您全身放松，疏通全身经络，促进血液循环，改善睡眠，美容瘦身，让您感受全身心的洗礼。<span id="_baidu_bookmark_end_23" style="display: none; line-height: 0px;">‍</span><span style="font-size: 14px;font-family: 宋体"><span id="_baidu_bookmark_end_21" style="display: none; line-height: 0px;">‍</span></span></p><p><span id="_baidu_bookmark_end_19" style="display: none; line-height: 0px;">‍</span><span id="_baidu_bookmark_end_17" style="display: none; line-height: 0px;">‍</span><br/></p><p><br/></p>', 1400574384, 8, 5, '536e0fac9c2c6', ''),
(14, 'wsq', 0, '点击进入微社区', '古睿微社区', 0, 0, '', 1400663145, 0, 0, '53705a8fb5564', 'http://wsq.qq.com/242096555'),
(16, '房间', 3, '房间展示', '房间展示', 2, 162, '', 1400832578, 0, 0, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/6.html'),
(17, '过道', 3, '过道图片展示', '过道图片展示', 2, 158, '', 1400833461, 0, 0, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/8.html'),
(18, '技师', 3, '技师', '技师展示', 2, 159, '', 1400833707, 0, 2, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/7.html'),
(19, '外部', 3, '外部展示', '外部展示', 2, 160, '', 1400833740, 0, 1, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/10.html'),
(20, '前台', 3, '前台', '前台展示', 2, 161, '', 1400833762, 0, 7, '536e0fac9c2c6', 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/pid/9.html');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wp_custom_reply_text`
--

INSERT INTO `wp_custom_reply_text` (`id`, `keyword`, `keyword_type`, `content`, `view_count`, `sort`, `token`) VALUES
(1, '天气', 0, '天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n', 0, 0, '536e0fac9c2c6'),
(2, '联系我们', 0, '绍兴古睿信息科技有限公司。\r\n客服电话：057585060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n官方网站:<a href="http://www.gooraye.net">www.gooraye.net</a>\r\n更多服务推出中。。。', 0, 0, '53705a8fb5564');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型基础表' AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `wp_document`
--

INSERT INTO `wp_document` (`id`, `uid`, `name`, `title`, `category_id`, `description`, `root`, `pid`, `model_id`, `type`, `position`, `link_id`, `cover_id`, `display`, `deadline`, `attach`, `view`, `comment`, `extend`, `level`, `create_time`, `update_time`, `status`) VALUES
(2, 1, 'news_info', '微​古睿上线了', 2, '微​古睿上线了', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1398862260, 1399519011, -1),
(3, 1, '', '微​古睿上线了', 2, '微​古睿上线了', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1399439741, 1399519011, -1),
(9, 1, 'cases002', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 11, 0, 0, 0, 1399531973, 1400154355, -1),
(5, 1, '', '古睿', 2, '绍兴古睿信息科技有限公司', 0, 0, 2, 2, 7, 0, 0, 1, 0, 0, 45, 0, 0, 0, 1393132500, 1401285957, 1),
(10, 1, '', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 16, 0, 0, 0, 1399534414, 1400154358, -1),
(11, 1, '', '汽车/摩托/服务', 43, '汽车/摩托/服务', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 43, 0, 0, 0, 1399534380, 1400835562, 1),
(12, 1, '', '古睿', 43, '古睿的微信服务号', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 6, 0, 0, 0, 1399534420, 1400154352, -1),
(13, 1, '', '硅谷虚拟现实专题会一：五年内虚拟现实的方向', 2, '来自加速Do', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1400589366, 1400589366, 3),
(14, 1, '', '硅谷虚拟现实专题会一：五年内虚拟现实的方向', 2, '硅谷虚拟现实专题会一：五年内虚拟现实的方向', 0, 0, 2, 2, 4, 0, 96, 1, 0, 0, 54, 0, 0, 0, 1400589540, 1400650890, 1),
(15, 1, 'jiasudo001', '真正为性福生活设计的硬件——情趣用品', 2, '真正为性福生活设计的硬件——情趣用品', 0, 0, 2, 2, 0, 0, 99, 1, 0, 0, 3, 0, 0, 0, 1400764860, 1400765152, 1),
(16, 1, '', 'IBM 旗下 Watson Group 收购人工智能创业公司 Cognea', 2, 'IBM 旗下 Watson Group 收购人工智能创业公司 Cognea', 0, 0, 2, 2, 0, 0, 100, 1, 0, 0, 17, 0, 0, 0, 1400765220, 1400765286, 1),
(17, 1, '', '卖的不是手机是情怀：老罗发布会结束近48小时，锤子手机订单数破5万', 2, '卖的不是手机是情怀：老罗发布会结束近48小时，锤子手机订单数破5万', 0, 0, 2, 2, 0, 0, 110, 1, 0, 0, 25, 0, 0, 0, 1400815380, 1400823106, 1),
(18, 1, '', '【产品经理手册】Facebook产品经理谈PM入门', 2, '【产品经理手册】Facebook产品经理谈PM入门', 0, 0, 2, 2, 0, 0, 109, 1, 0, 0, 5, 0, 0, 0, 1400822580, 1400823028, 1),
(19, 1, '', '可与Oculus Rift相连的360Cam全景相机，全景拍摄会成为虚拟现实的推手么？', 2, '可与Oculus Rift相连的360Cam全景相机，全景拍摄会成为虚拟现实的推手么？', 0, 0, 2, 2, 0, 0, 111, 1, 0, 0, 3, 0, 0, 0, 1400823360, 1400823472, 1),
(20, 1, '', '警惕！你会犯哪些网页设计最常见的可用性错误', 2, '警惕！你会犯哪些网页设计最常见的可用性错误', 0, 0, 2, 2, 0, 0, 163, 1, 0, 0, 8, 0, 0, 0, 1400834636, 1400834636, 1),
(21, 1, '', '微信更新“发现” 京东购物一级入口上线', 2, '京东在微信平台的一级入口名称为“购物”，位于“发现”之内。', 0, 0, 2, 2, 0, 0, 164, 1, 0, 0, 12, 0, 0, 0, 1401248335, 1401248335, 1),
(22, 1, '', '网站制作', 43, '网站制作', 0, 0, 2, 2, 0, 0, 0, 1, 0, 0, 13, 0, 0, 0, 1401256320, 1401256421, 1),
(23, 1, '', '京东上市前，雷军柳传志拷问刘强东了什么？', 2, '京东上市前，雷军柳传志拷问刘强东了什么？', 0, 0, 2, 2, 0, 0, 165, 1, 0, 0, 1, 0, 0, 0, 1401285857, 1401285857, 1);

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
(11, 0, '<p><img src="http://gooraye.qiniudn.com/demo_car1-1.jpg" width="371" height="640" border="0" hspace="0" vspace="0" title="" style="width: 371px; height: 640px;"/> <img src="http://gooraye.qiniudn.com/demo_car1-2.jpg" width="358" height="640"/></p><p>    <img src="http://gooraye.qiniudn.com/demo_car6-1.jpg" width="240" height="412"/>  <img src="http://gooraye.qiniudn.com/demo_car6-2.jpg" width="240" height="412"/> </p>', '', 0),
(12, 0, '<img src="/gooraye/20140501/Uploads/Editor/2014-05-08/536b29933e33f.jpg" alt="" />', '', 0),
(2, 0, '<span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;"><span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;">微</span>古睿-永久免费且功能强大的微信公众服务平台上线啦！</span>', 'Article:read', 0),
(3, 0, '<span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;"><span style="color:#666666;font-family:''Microsoft YaHei'', Helvitica, Verdana, Arial, san-serif;font-size:16px;line-height:26px;">微</span>古睿-永久免费且功能强大的微信公众服务平台上线啦！ (责任编辑：admin)</span>', 'Article:read', 0),
(5, 0, '<p><span style="line-height:26px;"><img src="http://gooraye.qiniudn.com/gr_logotext.png" width="195" height="95"/></span></p><p><span style="line-height:26px;">绍兴古睿信息科技有限公司成立于2014年04月24日。</span></p>', 'Article:read', 0),
(13, 0, '<p><span class="entry-cats" style="margin: 0px 15px 0px 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left;"><span class="main-color-bg cat1" style="margin: 0px 8px 0px 0px; padding: 5px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; -color: rgb(39, 174, 96); float: left; display: block; text-transform: uppercase; -position: initial initial; -repeat: initial initial;"></span></span></p><h5 style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; font-style: inherit; font-variant: inherit; font-weight: 500; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58);"><a href="http://www.jiasu.do/category/popular-topics/motion-devices/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(255, 255, 255); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">体感交互</a></h5><span class="main-color-bg cat199" style="margin: 0px; padding: 5px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; -color: rgb(181, 212, 8); float: left; display: block; text-transform: uppercase; -position: initial initial; -repeat: initial initial;"><h5 style="margin: 0px; padding: 0px; border: 0px; font-size: 14px; font-style: inherit; font-variant: inherit; font-weight: 500; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58);"><a href="http://www.jiasu.do/category/events/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(255, 255, 255); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">活动</a></h5></span><span class="author" style="margin: 6px 0px 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; display: inline-block;">Posted by <a href="http://www.jiasu.do/p/author/flamelightx/" title="由 Nada 发布" rel="author" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Nada</a></span> <span class="sep" style="margin: 0px 5px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">-</span> <span class="date" style="margin: 6px 0px 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; display: inline-block;">2014/05/20</span><p></p><h1 class="entry-title" style="margin: 0px 0px 12px; padding: 0px; border: 0px; font-size: 32px; font-style: inherit; font-variant: inherit; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58);">硅谷虚拟现实专题会一：五年内虚拟现实的方向</h1><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">硅谷虚拟现实展览会的第一个专题讨论会主题是“预测：虚拟现实接下来五年内的方向”，参与讨论的嘉宾有：</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: italic; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; -position: initial initial; -repeat: initial initial;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey，创始人，<a href="http://oculusvr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Oculus VR</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Jens Christensen，CEO，<a href="http://www.jauntvr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Jaunt VR</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Amir Rubin，CEO，<a href="http://sixense.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Sixense</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Ed Mason，CEO，<a href="http://gamefacelabs.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">GameFace Labs</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Drew Oetting，活动合作人，<a href="http://formation8.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Formation8</a>（风投公司）</span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">主持: Ben Lang，<a href="http://roadtovr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Road to VR</a><br/></span></p></blockquote><p><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_1.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19392" alt="svvr_panel_session1_1" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_1-1024x682.jpg" width="1024" height="682" style="margin: 0px auto; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 98%; height: auto; clear: both; display: block;"/></a></p><p class="wp-caption-text" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 12px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; color: rgb(102, 102, 102);">从左往右：Drew Oetting, Ed Mason, Amir Rubin</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">这场研讨会由虚拟现实博客 Road to VR 的博主 Ben Lang 主持，他介绍了一下主题，提到：“在往前看之前，我们先回顾一下过去。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey 首先开始，讲述了他第一次意识到虚拟现实潜力的时候。“这个概念是科幻作品中最吸引我的一个概念。在这些艺术作品，无论是小说还是电影，已经将虚拟现实所能做到的事情讲了个遍了。但是，也是过了一段时间，我才意识到现实生活中的虚拟现实没有电影中展示出来的那么好。”</p><p><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_2.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19393" alt="svvr_panel_session1_2" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_2-1024x682.jpg" width="1024" height="682" style="margin: 0px auto; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 98%; height: auto; clear: both; display: block;"/></a></p><p class="wp-caption-text" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 12px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; color: rgb(102, 102, 102);">从左往右：Jens Christensen, Palmer Luckey, Ben Lang</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">继续这个话题，接下来是 Jaunt VR 的 Jens Christensen，“大概是在一年多以前吧。我的一个同事出去度假，用 iPhone 记录了他的假期 – 但是离他体验到的感觉，差太远了。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Amir Rubin 则从一个硬件制造商的角度讲述了他的想法。Sixense 和一个富有经验的好莱坞导演一起研究这个项目，前后从两个角度去实现虚拟现实。一开始，他们通过自己的感受为顾客建立了一个模拟器，但体验并不好。他认为，未来，为所有的媒体和娱乐创建虚拟现实体验才是最终极的形式。“如何让每个人感觉到自己是蝙蝠侠？抱着这个问题，我们创建了 Sixense。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_4.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19395" alt="svvr_panel_session1_4" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_4-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Ed Mason 提到当初当他听到 Oculus Rift 时，迫不及待地去想看看“虚拟现实能到什么程度”。他称他的 1440p 头盔会在 E3 上正式展出。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Drew Oetting 是一个投资人。在一个展示会议上，他看到了 Oculus Rift 的强大威力。并不仅仅是戴上头盔亲自体验，还有看着世界各地飞过来排队体验 Rift 的人，他们的激动之情和感受 – 这一切都是其他东西做不到、带不来的。。</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: italic; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; -position: initial initial; -repeat: initial initial;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">接下来是针对一系列问题的讨论。</span></p></blockquote><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">首先问的是 Palmer Luckey 关于显示技术的问题。他回答：“也许，五年之内显示技术不会有太大的提升，但是十年之内，一定会有。现在的显示技术依赖于智能手机硬件大战导致的红利，而虚拟现实可能可以接过比拼硬件的接力棒。目前显示技术的瓶颈并不是钱，因为满足要求的技术现在还不存在。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 就这个话题，提到投像装置可能可以取代 LCD 面板。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">话题很快跳转，大家开始讨论到底是真人影像好还是电脑合成影像好。Christensen 认为，真人影像永远都会有一席之地。“有的时候，用真人和一些技巧比电脑建模要方便太多。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 开始提到 <a href="http://en.wikipedia.org/wiki/Sega_Genesis" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">SEGA Genisis</a>（MD），其中和 SEGA CD 配套的真人电子游戏。“无论如何，可进行互动的真人虚拟现实将会非常独特。比如，‘行尸走肉’就非常适合做成真人的。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Ed Mason 被问到对无线有线头设的一些看法。“这两者中间一直都会存在技术差距。”他承认，但同时声明，无线技术的脚步只会越来越快。还有人问到关于适配智能手机的一些设备，Mason 说那只能算入门设备，比如 Altergaze 和 Durovis Dive 等等。“每一个进入虚拟现实领域的人，我们都要支持，不过，内容才是王道。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_5.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19396" alt="svvr_panel_session1_5" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_5-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey 也被问到关于无线和有线的问题。他回答说，以现在的技术来看，只有有线设备能够创造出良好的虚拟现实体验。“到处理性能便宜无比时，你就没有理由不去整合了。如果那些手机制造商能注意下这方面的应用，配合一下，会让现在那些基于智能手机的头设好用很多。不过那些制造商不会去注意的，所以，他们总是会慢一步。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">投资人 Oetting 被问到对于 <a href="http://www.jiasu.do/p/facebook-acquire-oculus/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Facebook 收购 Oculus</a> 以及<a href="http://www.jiasu.do/p/sony-announced-project-morpheus/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">索尼加入虚拟现实战场</a>的看法，以及还会有其它公司进场么？“这种问题……我们根本不会去考虑。现在虚拟现实的一切都很难，所以大公司的扶持很有必要。对于虚拟现实公司，也没有一个好的估价方式，因为本质上他们研究的还是在强烈蜕变中的技术。因此为虚拟现实公司进行投资，才刚刚开始。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer 补充说：“也许有 Oculus 泡沫，但是虚拟现实本身绝对没有泡沫。” Sixense 的 Rubin 接着说：“直到 Oculus 之前，谁需要虚拟现实？谁需要用我们的产品？”，然后顺便又提及了一下自家产品的精确度。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Ed Mason 说：“虚拟现实中未知的东西太多了。现在需要软件开发者们去制作一款良好的虚拟现实作品。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">主持人 Lang 问道：“那我们现在有看到什么可以称得上杀手级别的虚拟现实应用吗？”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey 浇了一下冷水。“现在我们看到的都是演示。演示再好，不代表成品质量。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 提到了 <a href="http://www.thegallerygame.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Gallery: Six Elements</a>，他认为这是最接近杀手级应用的，还有另一个叫做 <a href="http://www.untoldgames.com/#!loadinghuman/mainPage" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Loading Human</a> 也很不错。“以这两款游戏为起点，潜力无限。如果不去尝试理解自己能创造出什么样的体验，那当然就做不出杀手级应用了。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Oetting 在这个方面补充了一下：“移动平台上什么算杀手级应用？WhatsApp？Flappy Bird？”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_3.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19394" alt="svvr_panel_session1_3" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_3-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 进一步将墨菲斯与 Wii 做比较：硬件不能卖出产品，Wii Sports 能卖出产品。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Jens Christensen 称，有可能虚拟现实的杀手级应用并不是游戏，而是其他领域，比方说虚拟旅游。Ed Mason 认为社交方面的东西也会成为很大的吸引力。</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: italic; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; -position: initial initial; -repeat: initial initial;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">主持人 Lang 将最后的时间让给台下观众提问。</span></p></blockquote><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey 回答一个问题，称：“包括眼镜使用者在内，Oculus Rift 的消费者版将适用于95%以上的人群。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 称 Sixense 的 VR SDK 将在七月放出，届时将支持 Hydra、STEM 以及墨菲斯上的 PS Move。什么？竟然兼容 PS4？吓了 Palmer Luckey 一跳。这个 SDK 将兼容任何位置追踪设备。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey 认为，在今天的技术框架下去制定一个虚拟现实的行业格式或者行业标准，对整个行业并没有好处。Rubin 表示赞同，认为行业需要成长的时间。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">然后 Palmer Luckey 又提到了一下<a href="http://www.jiasu.do/p/facebook-bought-oculus-vr-to-create-the-metaverse/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">虚拟实境</a>（metaverse），认为这是一个“疯狂的话题”。“如果虚拟现实能够做到完美，那我们能解决太多问题了。”Ed Mason 则说虚拟实境是所有虚拟现实开发者的圣杯和目标。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">下一个问题，有人提到了<a href="http://www.jiasu.do/p/antvr-kit-all-in-one-universal-virtual-reality-kit/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">蚁视科技</a>。Luckey 表示知道他们，并认为他们在 kickstarter 上做了很多“非常误导人的声明”。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">“Oculus VR 目前的位置很有意思，因为我们打算按成本价出售硬件。”Palmer 同时说：“而也因为这点，想竞争的公司都会遇到问题。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Rubin 认为，谁都可以来竞争。毕竟，Palmer Luckey 是第一个认为：“为什么不能这么搞”的人，其它人也有这样想的权利。不过，和 Oculus 的愿景竞争，那是要用亿美金这个量级来算才行的。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_header3.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19387" alt="svvr_header3" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_header3.jpg" width="690" height="320" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">转载：<span style="color: rgb(126, 126, 126); font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: 27.200000762939453px;  -color: rgb(255, 255, 255);">来自加速Do</span></p><p><br/></p>', '', 0);
INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(14, 0, '<p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">硅谷虚拟现实展览会的第一个专题讨论会主题是“预测：虚拟现实接下来五年内的方向”，参与讨论的嘉宾有：</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 14px; font-style: italic; line-height: 23.799999237060547px; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; color: rgb(126, 126, 126); white-space: normal;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Palmer Luckey，创始人，<a href="http://oculusvr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Oculus VR</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Jens Christensen，CEO，<a href="http://www.jauntvr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Jaunt VR</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Amir Rubin，CEO，<a href="http://sixense.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Sixense</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Ed Mason，CEO，<a href="http://gamefacelabs.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">GameFace Labs</a></span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">Drew Oetting，活动合作人，<a href="http://formation8.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Formation8</a>（风投公司）</span><br/><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">主持: Ben Lang，<a href="http://roadtovr.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Road to VR</a><br/></span></p></blockquote><p><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_1.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19392" alt="svvr_panel_session1_1" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_1-1024x682.jpg" width="1024" height="682" style="margin: 0px auto; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 98%; height: auto; clear: both; display: block;"/></a></p><p class="wp-caption-text" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 12px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; color: rgb(102, 102, 102);">从左往右：Drew Oetting, Ed Mason, Amir Rubin</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">这场研讨会由虚拟现实博客 Road to VR 的博主 Ben Lang 主持，他介绍了一下主题，提到：“在往前看之前，我们先回顾一下过去。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer Luckey 首先开始，讲述了他第一次意识到虚拟现实潜力的时候。“这个概念是科幻作品中最吸引我的一个概念。在这些艺术作品，无论是小说还是电影，已经将虚拟现实所能做到的事情讲了个遍了。但是，也是过了一段时间，我才意识到现实生活中的虚拟现实没有电影中展示出来的那么好。”</p><p><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_2.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19393" alt="svvr_panel_session1_2" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_2-1024x682.jpg" width="1024" height="682" style="margin: 0px auto; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 98%; height: auto; clear: both; display: block;"/></a></p><p class="wp-caption-text" style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 12px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; color: rgb(102, 102, 102);">从左往右：Jens Christensen, Palmer Luckey, Ben Lang</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">继续这个话题，接下来是 Jaunt VR 的 Jens Christensen，“大概是在一年多以前吧。我的一个同事出去度假，用 iPhone 记录了他的假期 – 但是离他体验到的感觉，差太远了。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Amir Rubin 则从一个硬件制造商的角度讲述了他的想法。Sixense 和一个富有经验的好莱坞导演一起研究这个项目，前后从两个角度去实现虚拟现实。一开始，他们通过自己的感受为顾客建立了一个模拟器，但体验并不好。他认为，未来，为所有的媒体和娱乐创建虚拟现实体验才是最终极的形式。“如何让每个人感觉到自己是蝙蝠侠？抱着这个问题，我们创建了 Sixense。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_4.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19395" alt="svvr_panel_session1_4" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_4-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Ed Mason 提到当初当他听到 Oculus Rift 时，迫不及待地去想看看“虚拟现实能到什么程度”。他称他的 1440p 头盔会在 E3 上正式展出。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Drew Oetting 是一个投资人。在一个展示会议上，他看到了 Oculus Rift 的强大威力。并不仅仅是戴上头盔亲自体验，还有看着世界各地飞过来排队体验 Rift 的人，他们的激动之情和感受 – 这一切都是其他东西做不到、带不来的。。</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 14px; font-style: italic; line-height: 23.799999237060547px; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; color: rgb(126, 126, 126); white-space: normal;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">接下来是针对一系列问题的讨论。</span></p></blockquote><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">首先问的是 Palmer Luckey 关于显示技术的问题。他回答：“也许，五年之内显示技术不会有太大的提升，但是十年之内，一定会有。现在的显示技术依赖于智能手机硬件大战导致的红利，而虚拟现实可能可以接过比拼硬件的接力棒。目前显示技术的瓶颈并不是钱，因为满足要求的技术现在还不存在。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 就这个话题，提到投像装置可能可以取代 LCD 面板。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">话题很快跳转，大家开始讨论到底是真人影像好还是电脑合成影像好。Christensen 认为，真人影像永远都会有一席之地。“有的时候，用真人和一些技巧比电脑建模要方便太多。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 开始提到 <a href="http://en.wikipedia.org/wiki/Sega_Genesis" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">SEGA Genisis</a>（MD），其中和 SEGA CD 配套的真人电子游戏。“无论如何，可进行互动的真人虚拟现实将会非常独特。比如，‘行尸走肉’就非常适合做成真人的。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Ed Mason 被问到对无线有线头设的一些看法。“这两者中间一直都会存在技术差距。”他承认，但同时声明，无线技术的脚步只会越来越快。还有人问到关于适配智能手机的一些设备，Mason 说那只能算入门设备，比如 Altergaze 和 Durovis Dive 等等。“每一个进入虚拟现实领域的人，我们都要支持，不过，内容才是王道。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_5.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19396" alt="svvr_panel_session1_5" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_5-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer Luckey 也被问到关于无线和有线的问题。他回答说，以现在的技术来看，只有有线设备能够创造出良好的虚拟现实体验。“到处理性能便宜无比时，你就没有理由不去整合了。如果那些手机制造商能注意下这方面的应用，配合一下，会让现在那些基于智能手机的头设好用很多。不过那些制造商不会去注意的，所以，他们总是会慢一步。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">投资人 Oetting 被问到对于 <a href="http://www.jiasu.do/p/facebook-acquire-oculus/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Facebook 收购 Oculus</a> 以及<a href="http://www.jiasu.do/p/sony-announced-project-morpheus/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">索尼加入虚拟现实战场</a>的看法，以及还会有其它公司进场么？“这种问题……我们根本不会去考虑。现在虚拟现实的一切都很难，所以大公司的扶持很有必要。对于虚拟现实公司，也没有一个好的估价方式，因为本质上他们研究的还是在强烈蜕变中的技术。因此为虚拟现实公司进行投资，才刚刚开始。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer 补充说：“也许有 Oculus 泡沫，但是虚拟现实本身绝对没有泡沫。” Sixense 的 Rubin 接着说：“直到 Oculus 之前，谁需要虚拟现实？谁需要用我们的产品？”，然后顺便又提及了一下自家产品的精确度。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Ed Mason 说：“虚拟现实中未知的东西太多了。现在需要软件开发者们去制作一款良好的虚拟现实作品。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">主持人 Lang 问道：“那我们现在有看到什么可以称得上杀手级别的虚拟现实应用吗？”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer Luckey 浇了一下冷水。“现在我们看到的都是演示。演示再好，不代表成品质量。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 提到了 <a href="http://www.thegallerygame.com/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Gallery: Six Elements</a>，他认为这是最接近杀手级应用的，还有另一个叫做 <a href="http://www.untoldgames.com/#!loadinghuman/mainPage" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Loading Human</a> 也很不错。“以这两款游戏为起点，潜力无限。如果不去尝试理解自己能创造出什么样的体验，那当然就做不出杀手级应用了。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Oetting 在这个方面补充了一下：“移动平台上什么算杀手级应用？WhatsApp？Flappy Bird？”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_3.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-large wp-image-19394" alt="svvr_panel_session1_3" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_panel_session1_3-1024x682.jpg" width="1024" height="682" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 进一步将墨菲斯与 Wii 做比较：硬件不能卖出产品，Wii Sports 能卖出产品。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Jens Christensen 称，有可能虚拟现实的杀手级应用并不是游戏，而是其他领域，比方说虚拟旅游。Ed Mason 认为社交方面的东西也会成为很大的吸引力。</p><blockquote style="margin: 7px 35px 10px 45px; padding: 10px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 14px; font-style: italic; line-height: 23.799999237060547px; vertical-align: baseline; quotes: none; -color: rgb(239, 239, 239); clear: both; color: rgb(126, 126, 126); white-space: normal;"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: 16px; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;"><span style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: normal; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline;">主持人 Lang 将最后的时间让给台下观众提问。</span></p></blockquote><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer Luckey 回答一个问题，称：“包括眼镜使用者在内，Oculus Rift 的消费者版将适用于95%以上的人群。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 称 Sixense 的 VR SDK 将在七月放出，届时将支持 Hydra、STEM 以及墨菲斯上的 PS Move。什么？竟然兼容 PS4？吓了 Palmer Luckey 一跳。这个 SDK 将兼容任何位置追踪设备。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Palmer Luckey 认为，在今天的技术框架下去制定一个虚拟现实的行业格式或者行业标准，对整个行业并没有好处。Rubin 表示赞同，认为行业需要成长的时间。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">然后 Palmer Luckey 又提到了一下<a href="http://www.jiasu.do/p/facebook-bought-oculus-vr-to-create-the-metaverse/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">虚拟实境</a>（metaverse），认为这是一个“疯狂的话题”。“如果虚拟现实能够做到完美，那我们能解决太多问题了。”Ed Mason 则说虚拟实境是所有虚拟现实开发者的圣杯和目标。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">下一个问题，有人提到了<a href="http://www.jiasu.do/p/antvr-kit-all-in-one-universal-virtual-reality-kit/" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">蚁视科技</a>。Luckey 表示知道他们，并认为他们在 kickstarter 上做了很多“非常误导人的声明”。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">“Oculus VR 目前的位置很有意思，因为我们打算按成本价出售硬件。”Palmer 同时说：“而也因为这点，想竞争的公司都会遇到问题。”</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Rubin 认为，谁都可以来竞争。毕竟，Palmer Luckey 是第一个认为：“为什么不能这么搞”的人，其它人也有这样想的权利。不过，和 Oculus 的愿景竞争，那是要用亿美金这个量级来算才行的。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_header3.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19387" alt="svvr_header3" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/svvr_header3.jpg" width="690" height="320" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p>转载：<a href="http://www.jiasu.do/p/svvr-2014-forecasting-vrs-adoption-next-5-years/" target="_blank" title="来自加速Do"><span style="color: rgb(126, 126, 126); font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: 27.200000762939453px;  -color: rgb(255, 255, 255);">来自加速Do</span></a></p>', '', 0);
INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(15, 0, '<p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">性爱除了担负着人类繁衍的重要任务，同时也在成年人类生活中扮演着重要的角色。关于它对于我们人类生活的重要性，我想在这里就不用多废话了。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">然而情趣用品的出现，除了在一定程度上丰富了成人的性生活之外，它也改变了成人寻欢作乐的方式，以及激发了成人对于“乐子”的想象力。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">其实，情趣用品行业是一个非常兴旺的行业。在过去 10 年到 20 年之间，有不计其数的公司在该领域创业，重新发明制造各种按摩棒和假阳具。随着在智能硬件浪潮的大背景下，(在网络上的)模拟性交的出现，使得各种玩法得以发明实现，此外，由于材料科学的发展，也使得触感变得前所未有的逼真。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">那么现在的情趣用品到底发展到了什么样子呢？（嘿嘿）现在就简单的介绍给大家一些：</p><h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; line-height: inherit; vertical-align: baseline;">Minna Limon 和 Ola</strong></h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/lfsbtzknlz8qzvfjisjk.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19288" alt="lfsbtzknlz8qzvfjisjk" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/lfsbtzknlz8qzvfjisjk.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Minna 最新的情趣用品是两款外观可爱的按摩棒 Limon 和 Ola。功能上，它们可以根据你的力度来变化按摩棒的震动频率，使用方法及其的简单。例如，你手握得越紧，力度越大，它的震动就越强烈。此外，它们还可以个性定制化震动类型，给人们以独特的性爱体验。同时，该款设备支持充电，Limon 售价 90 美元，Ola 售价 100。</p><h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; line-height: inherit; vertical-align: baseline;">Jimmyjane 系列</strong></h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/lhtzkpt6ykcvj9nztu1s.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19289" alt="lhtzkpt6ykcvj9nztu1s" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/lhtzkpt6ykcvj9nztu1s.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Jimmyjane 系列产品的设计一直很谦逊，功能也非常丰富。其中一款外观像只兔子，一款像舌头，另外一款则是传统的按摩棒形状。功能上，该系列也支持个性化制定震动类型和充电。分别售价 95 美元、70 美元和 115 美元。</p><h3 data-textannotation-id="a39313ef53dbb29d4417a3612a0b5514" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);">Smile Makers</h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/dizelkkx3wh58cywnliz.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19286" alt="dizelkkx3wh58cywnliz" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/dizelkkx3wh58cywnliz.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">相比于以上的情趣用品，Smile Maker 的设计显得更加的别出心裁，他们的设计的产品更加的人性化，具有独特鲜明的外部特征，有的像消防员类型、有的似法国男人类型、有富翁类型，还有网球教练类型。依据类型的不同，震动频率与力度也不尽相同，售价 50 美元。</p><h3 data-textannotation-id="f25e3c76ce8467ff83bf44b7d1b01065" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; line-height: inherit; vertical-align: baseline;">We Vibe 4</strong></h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/dag33ewx3tgtbaoqdwbo.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19285" alt="dag33ewx3tgtbaoqdwbo" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/dag33ewx3tgtbaoqdwbo.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">We Vibe 4 是一款可以远程控制的情趣用品，在使用过程中，人们可以通过控制遥控器来操作按摩棒的震动和感觉，并且配备了两个震动马达。此外，它也提供了一些性爱模式，如“Echo vibe”，该款售价 100 美元。</p><h3 data-textannotation-id="38d0e6dc6835874dd2b008a5a45385c8" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; line-height: inherit; vertical-align: baseline;">Stronic Pulsator</strong></h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/eg1jm0nzdzttfhocmvnl.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19287" alt="eg1jm0nzdzttfhocmvnl" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/eg1jm0nzdzttfhocmvnl.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">不管你信不信，它其实并不是一个振动棒。它的强大之处在于它能够完全模拟男性的抽插运动，并且可以使用过程中调整它的运动幅度，以便能够满足用户的需求。功能逼真，但是不便宜，售价 200 美元。</p><h3 data-textannotation-id="0ddaa618d0ae14a369a34c45f476db53" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);"><strong style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; line-height: inherit; vertical-align: baseline;">Lelo Ora</strong></h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/p2wnxttcgvhenp3bdmmj.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19290" alt="p2wnxttcgvhenp3bdmmj" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/p2wnxttcgvhenp3bdmmj.jpg" width="479" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">从外观上看，Lelo Ora 的设计很简单，但是它却拥有其他情趣所不具备的功能，它能够带给用户口交的感觉。内置的马达可以使 Lelo Ora 模拟舌头挑动和转动的动作，同时结合不同的震动设计，可以体验到别具一格的性爱体验。Lelo Ora 售价 160 美元。</p><h3 data-textannotation-id="40710d2ff582c248a2a4fcfd2f785fc8" style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; font-size: 18px; line-height: 1.2; vertical-align: baseline; color: rgb(58, 58, 58); white-space: normal; -color: rgb(255, 255, 255);">Tenga Flip</h3><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/rbpu4cmbtcb1vu3iju4p.jpg" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-full wp-image-19291" alt="rbpu4cmbtcb1vu3iju4p" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/rbpu4cmbtcb1vu3iju4p.jpg" width="636" height="288" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">好吧，现在终于可以介绍一款专为男士设计的情趣用品了。该款情趣用品名叫 Tenga Flip，形状当然是圆柱形（你懂的）。在它的内部充满了不同形状柔软湿滑的刺激点。此外它还采用了“一站到底”式设计，并提供了三种不同穴型体验。售价 100 美元。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">以上均为<a href="http://homeofthefuture.gizmodo.com/come-touch-tomorrows-sex-toys-at-the-gizmodo-home-of-th-1578188919/+ericlimer?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+gizmodo%2Ffull+%28Gizmodo%29" target="_blank" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">翻译</a>，并非作者本人原创整理！！！</p><p><a href="http://www.jiasu.do/p/come-touch-tomorrows-sex-toys/" target="_blank" title="" style="font-family: 微软雅黑, ''Microsoft YaHei''; text-decoration: underline;"><span style="font-family: 微软雅黑, ''Microsoft YaHei'';">转载：来自加速Do</span></a></p>', '', 0),
(16, 0, '<p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/jpg10" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;"><img class="alignnone size-medium wp-image-19549" alt="捕获" src="http://jiansudo.b0.upaiyun.com/wp-files/2014/05/jpg10" style="margin: 0.4em auto 1.25em; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; max-width: 100%; height: auto; clear: both; display: block;"/></a></p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);"><a href="https://angel.co/cognea" target="_blank" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Cognea</a>是一家人工智能技术公司，日前 IBM 旗下业务公司 <a href="http://www.ibm.com/smarterplanet/us/en/ibmwatson/" target="_blank" style="margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; line-height: inherit; vertical-align: baseline; text-decoration: none; color: rgb(39, 174, 96); transition: all 0.2s ease 0s; -webkit-transition: all 0.2s ease 0s; outline: 0px;">Watson Group</a> 宣布收购 Cognea，不过未透露具体金额。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">Cognea 开发了一个认知计算和对话式人工智能平台，为用户提供个性化虚拟助手服务。主要的两款产品分别是高智商虚拟助手 MyCyberTwin 以及 Cognea 虚拟助手。该公司的主要客户有 NASA、HP、澳大利亚国民银行等。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">目前点击该公司的网站链接，已经自动跳转至 Watson Group 的网页。</p><p style="margin-top: 0px; margin-bottom: 15px; padding: 0px; border: 0px; font-family: ''Microsoft YaHei'', 微软雅黑, Lucida, Verdana, ''Hiragino Sans GB'', STHeiti, ''WenQuanYi Micro Hei'', ''Droid Sans Fallback'', SimSun, sans-serif, ''Open Sans'', Tahoma, Verdana, Arial, sans-serif; line-height: inherit; vertical-align: baseline; color: rgb(126, 126, 126); white-space: normal; -color: rgb(255, 255, 255);">IBM 于今年年初宣布斥资10亿美元组建 Watson Group。Watson 是一台人工智能超级计算机系统，它可以利用自然语言能力和分析功能迅速分析处理信息。它的命名是由 IBM 的传奇总裁托马斯沃森（Thomas Watson）的名字而来。IBM 希望这次收购可以使 Watson 更具个性魅力，促进 Watson Developers Cloud 平台的创新和研发能力，并将实现其技术的商业化。</p><p><br/></p>', '', 0),
(17, 0, '<p><span id="_baidu_bookmark_start_3" style="display: none; line-height: 0px;">‍</span></p><h1><span id="_baidu_bookmark_start_2" style="display: none; line-height: 0px;">‍</span><br/></h1><p><span id="_baidu_bookmark_end_4" style="display: none; line-height: 0px;">‍</span></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">用生命在吹牛逼的老罗，在两天前刚刚发布了号称“东半球最好用的智能手机”——<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/p/212150.html" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">Smartisan T1</a>。就像老罗一贯的公开演讲那样，发布会现场到处弥漫着“<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">情怀</strong>”和“<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">工匠精神</strong>”。牛逼是吹出去了，手机也公开了，愿意为手机，以及愿意为老罗个人的情怀买单的人又有多少呢？</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">根据老罗昨天在微信上<a target="_blank" data-no-turbolink="true" href="http://mp.weixin.qq.com/s?__biz=MjM5NzAxNTkzNg==&mid=205274528&idx=1&sn=f341d8999ce4d3af06079b2b03dcc5c1&scene=1&key=bdc0fc08be7dd6d405f2a143a1f0aa48cd66b09bcae108e75f73688290cb700b5ea9d1016cb3dd2ca88c2675cffa0f5a&ascene=0&uin=MjU5NzIwNjgw" class="external" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">披露的数据</a>，“发布会结束近 48 小时，刚刚查看了最新的数据，在至少要支付 300 元来预订的情况下，预订单数也已超过五万...... 两天内已完成投资方期望实现任务的百分之十，我锤威武。”</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">据<span style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">36氪</span>了解，其实在发布会当晚，已经有大约 3 万用户预定了锤子手机，48 小时之后预订数破 5 万，意味着差不多每天有接近 1 万的预定量。（内什么，我们<span style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">36氪</span>有两位同学也预定了）。而且这些预定量都需要 300 块钱的定金，后期的转化率应该还是比较高的。不过随着热度的持续衰减，后期的预定量能否跟上，实属未知。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">不过对于老罗和他的锤子，虽然褒贬不一，但并不妨碍这场发布会赢得了史无前例的关注。据优酷官方提供的数据显示，在直播过程中，累计登录观看人次高达 274 万，最高同时在线近 33 万人，创下中国科技类活动史上累计观看直播人次最高、同时在线观看直播人数最高两项历史记录，目前该发布会直播录像已播放 495 万次。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">还有一些旁证的数据，老罗发布会<a target="_blank" data-no-turbolink="true" href="http://weibo.com/1640571365/B5d3ZDoeE?mod=weibotime" class="external" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">现场发出的微博</a>，刚发出不久就转发过万；老罗在发布会上提到的华强北有一家“<a target="_blank" data-no-turbolink="true" href="http://www.dachui.com/" class="external" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">大锤手机</a>”同样引发了网友的关注，并且一度造成他们官网的宕机。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;">我不是为了输赢，我就是认真！</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-size: 18px; font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; vertical-align: baseline; -color: rgb(255, 255, 255); color: rgb(51, 51, 50); line-height: 32.400001525878906px; white-space: normal;"><a href="http://www.36kr.com/p/212239.html" target="_blank" title="">转载自：<span style="color: rgb(51, 51, 50); font-family: ''Open Sans'', Arial, ''Hiragino Sans GB'', ''Microsoft YaHei'', 微软雅黑, STHeiti, ''WenQuanYi Micro Hei'', SimSun, sans-serif; font-size: 18px; line-height: 32.400001525878906px;">36Kr</span></a></p><p><br/></p>', '', 0);
INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(18, 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><img class="aligncenter  wp-image-83314" src="http://image.woshipm.com/wp-files/2014/05/8yrjBHR4wqrzN1KpM0mjCWuzkPjYx0oT.jpg" alt="8yrjBHR4wqrzN1KpM0mjCWuzkPjYx0oT" width="545" height="260" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></p><blockquote style="margin: 15px; padding: 10px; -color: rgb(250, 250, 250); border-width: 1px 1px 1px 8px; border-style: solid; border-color: rgb(204, 204, 204); color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; font-size: 12px; line-height: 24px; white-space: normal;"><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; -image: url(http://www.woshipm.com/wp-content/themes/ui90_e33/images/quoteright.gif); -color: rgb(244, 245, 247); font-size: 16px; text-indent: 2em; line-height: 28px; color: rgb(0, 0, 0); -position: 100% 100%; -repeat: no-repeat no-repeat;"><span style="font-weight: bold;">AVICHAL GARG（Facebook产品经理）</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; -image: url(http://www.woshipm.com/wp-content/themes/ui90_e33/images/quoteright.gif); -color: rgb(244, 245, 247); font-size: 16px; text-indent: 2em; line-height: 28px; color: rgb(0, 0, 0); -position: 100% 100%; -repeat: no-repeat no-repeat;">Avichal是Facebook平台团队的PM，目前在做一款新的、未面试的产品，并且负责管理着如登录页面和社交插件（第三方网站的点赞按钮）和时间轴选集等用户可见的平台产品。之前他曾是Spool（2012年被Facebook收购）的联合创始人及CEO，PrepMe（2011年被Daily Mail Group收购）的联合创始人及CTO，并且在Google的搜索质量和广告质量部做过PM，他还发起了Google Transit，那是Google地图区分于其他产品的重要特性之一。他有斯坦福的硕士及学士学位。</p></blockquote><h2 class="p0" style="margin: 5px 0px; padding: 2px 8px; font-size: 16px; line-height: 25px; font-weight: 400; -color: rgb(237, 248, 252); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">访谈总结</h2><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">1、丰富的数据分析经验对于PM来说有什么用；</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">2、那些他见过的PM的最独特的能力；</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">3、如何培养牛逼的产品意识；</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">其他……</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：你认为，PM的目标和目的是什么？在为期三个月的产品实习期间，我最应该培养哪些能力？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：我觉得PM在团队里扮演的是一个编辑角色。当你在努力把产品做出来时，同时有很多事情在发生，有人必须承担这个编辑角色。从这个角度来看，PM最难的事就是在限定的时间内搞清楚什么任务应该被完成以及为什么它们应该被搞定。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：跟我交谈过的很多PM都说PM另一个很重要的职责是激励团队成员。你觉得这个能让你产生共鸣吗？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：你确实需要激励别人。我认为，激励的最佳方式就是你呈现的产品愿景。你听过一个带领人们造船的故事吗？我觉得那个类比PM为团队呈现愿景就非常贴切。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">至于那些最有价值的能力，我先推荐个小练习：首先，列出你需要的技能（技术理解力、权衡的能力、分析能力、设计、说服）。然后，思考一下这些能力并注意加强一下那些你觉得自己比较缺乏且能在三个月之内学会的能力。我觉得最容易学到的当属分析能力了。要在三个月变得非常有说服力或者一名优秀的设计师就很难。三个月内要成为一名优秀的工程师也很难。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">简要重述一遍：列出所有你所需的能力，搞清楚哪些需要加倍努力去培养，哪些是你感兴趣并需要提高的?</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：你觉得，数据分析的经验对于PM来说有什么用？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：给出一个问题，他们能理解这个问题吗？他们能问出一些可用简单数据作答的问题吗？这些问题要能够帮助你直接解决该问题。（包括要一些简单快速的度量）最后，他们能提前做出一个清晰的假设吗？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：我会用Python和R编程，但我却没有听闻中PM应有的那么扎实的开发经验。对于一个有点点技术背景的人，我能做些什么来弥补呢？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：我觉得你应该尽量在学校就有很强的技术功底。一般来说，你的技术会逐渐退化，所以要有预防措施。懂技术不是个很难的先决条件但却相当有价值。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">另一条你可以走的路是变得更加会设计。如果你设计很厉害，你也可以成为一名厉害的PM。一般，你见到在这两方面见长的成功PM较多。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">但也需要记住设计是没有终极状态的。换句话说，任何时候你都不能停止学习设计。成为优秀的设计师是一个连续的不断迭代的过程，所以尽早开始吧。你会发现设计师的设计能力会随着年龄的增长而渐至佳境。其实代码工程也一样。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">很多人并不把像设计、编程这样的工作看做一辈子的事，他们看事情有上限。“如果我做得“够棒了”，那我就可以停下了。”这就是他们脑子中的想法。但其实，无论你做什么都要想办法越做越好才行。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">另一个值得一提的事，毕业后学做设计会比学习编程要简单。所以我的建议是，在学校学习编程，而设计这一块则可以靠后来自我驱动去学习并保持。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：你觉得成就一款高质量产品的一些心理标准或模式是什么？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：如果我不得不说点啥的话，那么就是高质量产品从不画蛇添足，总是恰到好处。他们只做一件特定的事，而且做得非常棒。这也是他们产品价值定位的核心。我想过很多遍，如果你的产品不在某件事情上令人感到惊艳，而是在很多领域内铺开，那么你的产品很容易被替代，也不具有长久的价值。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">以Google为例。它的核心仍是一家搜索公司。它花了很多年才将对手们赶出去，这就是值得我们注意的。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：在那些出众的PM身上，你见过的，使他们成功的最奇特的能力是什么？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：我想如果我必须说一点的话，那应该要归结于尊重。当你真的优秀时，很容易变得自我。但我共事过的优秀PM都没有自负。他们从不想比团队里所有的人都聪明或者想要针对某人。比如，你作为公司的管理层可以很轻易的踢走一些初级新员工，但是好的产品领导对每个人都很尊重和谦逊。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：我听说，产品管理人员拥有好的产品感非常重要。你觉得应该如何培养好的产品感呢？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：这个学起来非常难。我甚至不能确定这个东西是不是能学得来的。每个拥有这个能力的人貌似都是天生得来的。如果你能把人的动机和欲望整合到一个可感知的事物中（如，某按钮跳转到哪里；你给产品起什么名字），那么你就算上道了。你也许能通过极度关注细节来培养这种能力。搞清楚什么成就了某事物优点，什么造成了它的缺点。从这个过程中应该也能学到一些东西。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">我觉得总体来说，那些擅长关注细节的人能够更好的做模式匹配（比如，发现某些让其他产品出色的东西，说不定也能让自己的产品更棒），而培养产品直觉对一名好的PM来说是不可或缺的。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：你衡量自己成功的标准有哪些？哪个最重要？为什么？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：对我来说最重要的是自由：在哪里我会有长期的自由去学习、保持快乐和产生影响力？对我来说，来Facebook之前的几个初创企业就能提供这种自由。这条道路也让我在金钱上有自由并拥有了整体系的能力，这些能力足以让我在一家重视创新性地解决问题的企业里有很大的自由（Facebook就很重视）。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：你觉得你在产品管理岗位上拥有多少自由？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：我认为PM职位是一个自由度非常高的职位。记住不同的公司给PM的侧重也是不一样的。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">Facebook对偏设计和数据的PM就有偏好。如果你看看在FB工作的人的背景，有很多人都有多样背景，比如设计或数据分析。FB是极度数据驱动的，结果就是，即便FB的设计型PM也需要有不错的数据分析能力。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">去观察那些0.1%顶尖的PM有什么不同之处，你会发现高手中的高手在产品的多个方面都很牛叉。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="font-weight: bold; color: rgb(0, 0, 0);">问：经常有人建议我应该先去做几年技术再去做产品，因为做了PM再转回技术（编程、设计）会很难。你觉得一毕业就去做PM好不好？或是我应该先干点别的再去做PM呢？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">答：我觉得都可以嘛。其实你是在想，你是否应该先有点必要的技术积淀。若果你觉得你作为程序员或设计师的背景没什么问题，那么直接去做PM也是okay的。老实说，多数情况下，刚毕业的人不大可能有这些积淀。所以如果你就是这样的情况，那么在做PM之前，你还是好好积累下某方面技术并且争取做得出色些。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">对产品管理感兴趣的学生，同时又觉得自己缺少某些重要能力的话，我的建议是：如果你能够在一流企业（比如，IDEO、Apple、FB、Google）里找到一个PM的职位，那么大胆去做吧。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">如果你找不到这样的工作，列出自己能力上的短板并尽快补救。这些短板可能是编程、设计或是其他的。花些时间去培养这些能力，然后再去试试那个职位。这并不是说在一流企业里做PM就是终极状态了，而是给自己树立目标的一个方式。是对你是否具备那些能力的一次检验。</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><span style="color: rgb(0, 0, 0);">它可能是你在SAT中能取得的最好成绩。而那就是一种很好的指示，你该不该再去学习更深的技能？</span></p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">原文：<a href="http://vdisk.weibo.com/s/aoFZDu6DkEtY9" target="_blank" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;">The Product Manager Handbook</a>（包含了十名国外著名PM关于一些产品职位的问答，此为最后一篇，文章下方有之前文章的链接）</p><p class="p0" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">本文由人人都是产品经理@Tobbi翻译，转载请注明并保留本文链接。</p><p><a href="http://www.woshipm.com/pmd/84261.html" target="_blank" title="">转载自：<span style="color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; line-height: 28px; text-indent: 32px;">人人都是产品经理</span></a></p>', '', 0),
(19, 0, '<h1 class="single-post__title" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-size: 3.2rem; font-family: inherit; vertical-align: baseline; -color: transparent; line-height: 1.5; color: rgb(56, 72, 90);">可与Oculus Rift相连的360Cam全景相机，全景拍摄会成为虚拟现实的推手么？</h1><p></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;"><br/></p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;">虽然市面上已经问世的全景相机已经有不少，像<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/p/208251.html" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">BublCam</a>、CENTR、Panono 这样众筹成功的相机也不在少数，但事实上用户真正买账的则不多。法国团队 Giroptic 近日在 Kickstarter 上发起了<a target="_blank" data-no-turbolink="true" href="https://www.kickstarter.com/projects/giroptic/the-worlds-first-full-hd-360-camera?ref=discovery" class="external" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">360Cam全景相机众筹项目</a>，则改写了这种情况。上线一天，就完成了 15 万美元的筹款目标，目前已筹得了 28万美元。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;">360Cam 主打的就是 360 度高清全景拍摄功能。开发团队称，他们开发了 3 个 185 度旋转的鱼眼镜头，可以捕捉到最广泛的视角，用户只需一键就能拍摄出高清全景照片，还可以在拍照、视频、直播三种模式之间轻松转换。相比与一般的全景相机，360Cam 的防水深度达到 32 英尺，可以支持水下全景拍摄。除了作为全景相机，还可以安装在灯泡底座上作为全景监控使用。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;">虽然拍摄效果可能没有<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/p/210947.html" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">Jaunt</a>这种专业的 360VR 摄影效果好，但 360Cam 价格低（众筹期间最低售价 249 美元）、防水性能好、操作简单，在消费级市场还是很有优势的。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;">值得一提的是，360Cam 可与<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/search?q=oculus" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">Oculus Rift</a>等虚拟现实设备相连，<span style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">提供“沉浸式”的全景体验。</span><strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent;">利用全景相机拍摄视频，结合虚拟现实设备及技术，提供全新的呈现方式及互动方式</strong>，可以说是近年来的一大趋势。<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/p/163086.html" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">Condition one 提供过类似的解决方案，用户在通过Condition one播放特殊全景设备拍摄的视频时，可以通过触屏或者转动iPhone或iPad来改变视频的角度，可以说改变了视频播放的交互模式。</a>Condition One 也在 2013 年获得了 235 万美元的融资。<a target="_blank" data-no-turbolink="true" href="http://www.36kr.com/p/210947.html" style="box-sizing: border-box; margin: 0px; padding: 0px; border-width: 0px 0px 2px; border-bottom-style: solid; border-bottom-color: rgb(234, 234, 234); font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; -color: transparent; -webkit-transition: all 0.2s ease; transition: all 0.2s ease; text-decoration: none; color: rgb(81, 173, 237);">今年4月，利用现有拍摄设备及技术拍摄360度全景VR电影的初创公司Jaunt也获得了680万美元的融资</a>。</p><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 30px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 18px; font-family: inherit; vertical-align: baseline; -color: transparent;"><a href="http://www.36kr.com/p/212240.html" target="_blank" title="36kr">转载自：36Kr</a></p><p></p><p><br/></p>', '', 0);
INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(20, 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">lwei：在过去十年中高品质的网页可用性一直是业内讨论的核心，因为它对用户来说越来越重要。好的可用性也可以帮助建立品牌知名度，从而提升用户对一个网站或者是一家公司的评价。今天人们依然高度关注可用性，是因为大大小小的公司已经证明了好的可用性策略是多么重要。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">在过去几年中，良好的可用性成为那些成功的初创公司的核心。多数情况下，简单的想法最具创造性，可用性主要是指：使一个功能或者产品易于使用，但同时也要保持产品质量维持在高水平上。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">如今，很多文章会谈到普遍意义。在对该话题年复一年的讨论之后，似乎web设计者们仍然很难去理解它。可用性早已不再是一个玩笑，下面这些建议应当被打印出来并粘到你桌子对面的墙上。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><strong style="color: rgb(35, 35, 35);">链接的颜色</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">我经常发现自己在浏览网页时，有些页面上的链接没有以某种形式高亮显示。这是我见过的最愚蠢的错误。我愿意访问那些链接使用默认蓝色的页面，而不是链接和 普通文字一个颜色的页面。用户需要知道如何在页面之间导航、在哪儿能点击链接。你不能指望他们把鼠标一行行的掠过所有文字去找链接，直到发现鼠标箭头变成 “小手儿”。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><a href="http://image.woshipm.com/wp-files/2014/05/jingti1.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter  wp-image-86271" src="http://image.woshipm.com/wp-files/2014/05/jingti1.jpg" alt="jingti1" width="600" height="304" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">我完全理解，有时候出于设计考虑，链接不能使用某种颜色来高亮显示，这样会使它们显得太过突兀。这完全是可以理解的。但是可以添加文字样式或者虚线框，你需要的只是以这种或那种方式来强调链接而已。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">访问过的链接也应当以不同的方式来显示，以区别于默认的链接颜色。因为这样可以帮助用户知道他们已经访问过什么，从而确定下一步要去哪儿。一些网站会使用户困惑，但是让他们知道自己已经访问过什么，绝对会使他们对你的网站印象更好。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">糟糕的排版</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">当我们谈到 排版，并不是说我们需要一个大大的标题，或者一段漂亮的文字。 当我们考虑易用性时，排版的漂亮与否并不那么重要，重要的是排版要如何使我们的内容易于阅读。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">紧密排列的大段文字会使阅读它的人感到非常头疼，但它应该不会让设计师头疼。他只需要简单的增加行高，进行分段，增加文字大小，改变字体，就能使它更容易阅读。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">在网页设计中，如何搭配字体的和用什么样的颜色来唤醒访客，并不是十分重要。当然，你会这些那就更好 。在过去的几年中，我们总是错误的将美感重要性放到功能性之上。其实网站最重要的特性它易用性，它并不像图形设计领域那样有很很大的局限性。有的时候我们 不在乎它能有多么的好看，仅需要的是它能正常工作而已。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">让我来作进一步的解释. 互联网上两股最新的设计思潮, 极简主义和扁平化设计, 都极其的简约并聚焦于内容的呈现而非背景图该多漂亮才好. 在极简主义与扁平化设计变得越来越流行的后面有个原因就是他们非常简单,而且工作良好 -有时候真的是很难去相信如此简单的一个网站却能获得巨大的成功, 你进入网站, 看完内容,然后走人, 没有东西使你分心, 没有Flash, 没有使得网站加载变慢的Javascript, 没有好看的花儿或图样, 仅仅是内容而已.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><a href="http://image.woshipm.com/wp-files/2014/05/jingti2.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter  wp-image-86273" src="http://image.woshipm.com/wp-files/2014/05/jingti2.jpg" alt="jingti2" width="600" height="363" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">现在, 你应该明白了让内容变得易于访问是多么的重要的道理, 不要在第一时间花费太多的精力去思考该如何让网站变得多漂亮 -无论字体有多优美,别人如果不能阅读的话也是枉然.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><strong style="color: rgb(35, 35, 35);">不参照惯例</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">参照设计惯例和易用性建议是非常重要的，因为无论你是谁，只要你按照那么做了，那么用户会在你的网站上花费的时间会和在其他网站上花费的一样多，这意味着你和其他人站在了同一起跑线上。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">举一个例子让大家更清楚的理解我到底想要表的什么。这有这么一个网站，在它导航栏上放置了一链接来退出页面。这个按钮的作用，这与通常所理解的导航栏应该有的作用大不相同，这样的设计违反了设计惯例。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">好在最近几年，情况改善了很多，但还是能发现在一些不应该发生的低级错误，比如：循环展示模块上面链接失效，或者点击链接的时候弹出了框。因此，要紧跟设计惯例。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><strong style="color: rgb(35, 35, 35);">避免回答问题</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">用户浏览网页都是有目标的。也许是想娱乐一下，也许是查找信息，也许是跟家人或朋友保持联系，也许是其它目的。不管他们做什么，总会有一个目标。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">现在你需要记住的最重要的是，大多数情况下，用户上网是在寻求某些信息。他们去 Google是要搜索某些东西;他们去维基百科是要学习某些东西;他们上企业站点是为了了解产品信息。他们总会有一个目标。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><a href="http://image.woshipm.com/wp-files/2014/05/jinti31.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter  wp-image-86274" src="http://image.woshipm.com/wp-files/2014/05/jinti31.jpg" alt="jinti3" width="600" height="567" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">当我明确地想去网页上找一个问题的答案的时候, 它们却就是找不到, 这种问题在我身上已经发生n次了. 我能理解设计代理(机构)们为何不是始终都突出表述价格因素, 因为在一个项目里面变量太多, 但我就是不能理解一个发廊为何不告诉我理发到底需要多少钱, 我也不能理解洗车公司的网站上为何不突出表述我洗干净车需要多少钱, 那你为啥还要在这个地球上建一个网站呢? 我只是觉得这对你和你的访客都是无益的, 你俩谁也不能从中获得任何有用的信息.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">在访客访问你的网站的时候了解他们的意图是个好主意, 如果有人想去下载博客主题, 那就引导他们到下载区域, 如果他们是为了玩游戏而来, 那就尽量多放些游戏在上面, 如果他们是来了解产品价格或者你所能提供的服务的, 那就突出表述它们.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">你需要考虑你的网站访客的需求的原因是你的网站不是给你自己建的, 如果你是给你自己建的, 你就别联网, 直接在你自己的电脑上看就可以了, 一个网站是为访客而建的, 访客是有需求的, 实现它们(的需求)吧!</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">小块可点击区域</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">因为我买了台Mac所以从不用鼠标。事实上我买了一只魔术鼠标，就在它们被发布并销售仅仅三天以后。因为对我来说再没有什么需要用到鼠标的地方了。我用触 摸板移动电脑指针动作非常熟练。但我记得五年前，当我仍然使用PC的时候，我也曾有各种各样的垃圾鼠标。它们并不总是很精确，而且在悬停于小块区域的时候 经常定位很困难。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">现在我再也没有这个问题了。但是web不是仅仅给我用的。大约有数以亿计的用户，所以你应该明白不是他们所有人都能这么熟练的使用这些奇妙的工具。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">小块可点击区域有时候令人不那么舒服。你或许想让字体显得小一点，因为你相信这样看起来很漂亮，但你要考虑到你的决定对可用性的影响有多大(我们不妨再来看看可读性)。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">重要的是不但要保证链接是可见的，还要让它们是可点击的。这个区域越小，人们点击它们就越难。这里面有一个网站趋向移动化背后原因——就是说布局需要适应更小的屏幕。需要适应的东西之一就是按钮，根据建议它们应该在便携式设备上变得更大，好让它们容易被点击。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">同样的策略也适用于桌面环境。新的扁平化用户界面的风潮是这个理念的布道者。你不会有点击又大又清晰的链接的烦恼。保证让你的用户更轻松的浏览。再说一次，关注于功能性，让美观成为一个神奇蛋糕上面的樱桃。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">缺少联系信息</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">有几件事比糟糕的客户服务更使我恼怒。其中之一就是根本无法联系上客服或者负责该事务的公司。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">正如我们之前讨论的，人们总是带着目的来访问网页。如果他们的目的是跟你取得联系，那么从他们的角度来说，如果找不到联系方式那么这个页面就毫无用处。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><a href="http://image.woshipm.com/wp-files/2014/05/jingti4.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter  wp-image-86275" src="http://image.woshipm.com/wp-files/2014/05/jingti4.jpg" alt="jingti4" width="600" height="441" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">没有任何借口可以不提供联系信息。如果你不想把你自己的电话号码公之于众，可以留下你的e-mail。对了，你也可以买个便宜的手机配个划算的套餐，然后 留下这个号码，或者申请一个新的e-mail。你想要避开垃圾邮件吗? 可以使用一种机器无法自动识别的联系方式。分享Twitter或者Facebook地址，也没什么大不了。这都没什么，只要能给你的客户一个以某种方式找 到你的机会。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><strong style="color: rgb(35, 35, 35);">搜索功能</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">许多用户都是任务导向型的, 也就是说他们来到网站上仅为获取指定的信息而并不对其他东西感兴趣. 如此看来, 你会发现一个好的搜索功能会变得多么的重要.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">但这并不意味着你需要在每个页面都提供一个搜索栏, 如果你运营着一家设计公司, 只有一个单页式网站用于提供项目和联系方式的信息, 那就没必要提供搜索功能.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><a href="http://image.woshipm.com/wp-files/2014/05/jingti5.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter  wp-image-86276" src="http://image.woshipm.com/wp-files/2014/05/jingti5.jpg" alt="jingti5" width="600" height="427" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a>然而, 如果说你运行着一个博客或者其他任何内容主打的网站, 搜索将会是许多用户首先会去使用的功能, 研究表明第一时间会去查找搜索栏的用户的比例占到了所有用户的一半以上, 真的是极大的超乎了我们的想象.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">假设你在一个类似于WordPress的平台上运行着一个网站, 你将可以利用其内部集成的搜索功能, 另外你也可以始终使用Google提供的搜索, 因为智能搜素引擎可能已经索引了你的所有(或者大部分)网页, 你不再需要去自行编写搜索功能, 所以你没有理由不在你的网站上使用它.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">强制性的注册要求</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">允许用户在必须注册或者付费之前，能对软件或者功能有个预览，比要求他们立即注册要好得多。互联网上看到的一些优秀的概念或者想法，总是要求我先注册，令人不爽。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">不，在能够使用你的应用之前，我不会想把我的电话、住址和鞋码留给你。我需要立刻就能试用一下来决定它是否适合我。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">这种说法，也是手机UX/UI设计大师Luke Wroblewski (相关参考在文章最后)所赞同的。他相信，用户在做出决定之前，应该先窥见到产品的内在。这很简单，也是全部意义之所在。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><a href="http://image.woshipm.com/wp-files/2014/05/jingti6.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter size-full wp-image-86277" src="http://image.woshipm.com/wp-files/2014/05/jingti6.jpg" alt="jingti6" width="600" height="494" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">不管你是做什么的, 销售还是生产, 不要要求网上的用户在他们还没确定需要该产品的情况下就进行支付(负担), 不然他们会感觉受了欺骗, 当然你也就永远的失去了他们. 一个好的例子就是水果忍者, iOS平台上很潮的游戏, 它总是以一个免费示例版的形式出现, 然后过了一段周期之后, 也就是你已经迷上这个示例版的时候, 你会感觉你有点想要更大的挑战, 然后你就购买了游戏的完整版本. 这就是我所做的, 而且我觉得这的确说的过去, 我会一开始就在不能试玩的前提下购买这个游戏么? 扯淡.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">这不仅仅是针对设计人员的一堂课, 也适用于许多的公司和制造商们, 如果你的产品够好, 不要立即呼吁用户去订购, 相反, 你应该尽快的提供给他们免费试用你的产品的机会, 你应该确信的是如果产品真有你想的那么好的话, 他们是会买的.</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><strong style="color: rgb(35, 35, 35);">注册表单</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">Luke Wroblewski在他的关键提示中常常提及的另一个问题是注册表单。我都曾经使用过注册。你非常喜希望马上注册一个帐号(因为某种程度上他可以满足你的某种需求)，但是由于注册表单太长。于是你可能放弃注册，这样一个潜在的顾客就会失去。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);">让注册表单尽可能的简单。只要求最重要的信息，邮箱、密码和用户名。完成注册后，你可以让他们选择填写更多的细节。这同样也符合前面提及同样的原则。为了 提交，用户需要先尝试你的产品。如果客户不能确定是否喜欢你的产品，那么凭什么他们会把他们的家庭地址、真实姓名和职称等信息给你呢?顶多你得到一些冒填 的虚假信息，在他们确定想使用你的产品前，你不会得到真实信息的。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(34, 34, 34);"><a href="http://image.woshipm.com/wp-files/2014/05/jingti7.jpg" class="fancybox" data-fancybox-group="gallery" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;"><img class="aligncenter size-full wp-image-86278" src="http://image.woshipm.com/wp-files/2014/05/jingti7.jpg" alt="jingti7" width="600" height="343" style="border: 0px; vertical-align: middle; display: block; margin: 5px auto; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></a></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">现如今，很多网站已经可以实现通过Twitter或者Facebook 即可登录。这很棒，使得登录非常简单快捷。你为此不需要记忆太多的帐号和密码。只要你能登录Facebook，你也就可以登录那些使用API注册的网站。 虽然不是所有人都使用这个途径，但是请给用户提供这种可能的登录途径。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">不一致的设计</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">如果网站有一个白色的背景和一个顶部导航区，就不要把相关页面弄成黑色并把导航挪到页面底部。它会令我怀疑自己是否还在同一个网站上，我可不想在这个问题上浪费时间。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">整个网站要保持一样的布局。给你的页面网格体系规定一个列数，不管是几列只要合适就行，并在整个网站中贯彻这个规定。同样的规则适用于背景色，链接的颜色，排版和设计原则。总之要使我在点击“关于”页面之前，能清楚的知道我还在同一个网站上。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">图片的误用</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">设计的一个基本原则就是，不要使用那些你其实并需要的元素。对图片来说也是这样，不要只是为了填满页面而使用它们。研究表明，用户趋向于忽略那些只是填充页面的图片。所以如果你没有什么要展示的话，我最不想看到的就是随机展示的图片。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">如果你决定要使用图片，至少要确保把它们放到正确的位置。我讨厌某站网站，把正文写到一个两列宽的表格里，还用整行宽的图片把正文分隔开。这总是让我考 虑：我是应该接着看右侧第二列然后看图片下的第一列呢，还是应该先看图片下的第一列?这真是让人厌恶，而更让人厌恶的是不同网站在处理这一问题时使用了不 同的方式。 如果你要使用图片，要确保我在读文字时不会被图片影响太多，这是最重要的。我需要的只是阅读。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">哦，顺便说一下,如果你想知道为什么我不愿意考虑这个问题(或者为什么用户不愿意考虑), 我强烈推荐你看一下Steve Krug’s 的书。你可以在本文最后的参考中找到该书的链接。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><strong style="color: rgb(35, 35, 35);">结论</strong></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">如果你想成为一个好的网页设计师，你只需按照上面的步骤行事即可。你无需成为一个用户体验专家，上面我写的真的只不过是一些常识，但是在大多数时候正是它们使得一个顶级的网站与一个像样的网站区别开来。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">这也很大程度上归因与你对用户的兴趣。如果你制作网站只是为了维持生计，那么你无需这些规则。你也可能只是一个低于自我期望的设计师，会在若干年内失败。 如果你为你的访问者考虑更多，想给他们提供一个好的网站体验，那么你需要知道，什么是应该开始着手处理的基本要素。正如前文所述，网站不需要漂亮。应该记 得的是，没有什么比一个简单的、运行优异的网站更漂亮的了。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;"><a href="http://www.oschina.net/translate/usability-mistakes-web-design" target="_blank" title="">转载自：开源中国社区</a></p><p><br/></p>', '', 0),
(21, 0, '<p class="Introduction" style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal; color: rgb(67, 67, 67);">[<span style="font-weight: 800;">摘要</span>]京东在微信平台的一级入口名称为“购物”，位于“发现”之内。</p><p><img class="aligncenter" src="http://image.woshipm.com/wp-files/2014/05/2a4a3fff9b036793415e6a799bed45e6.jpg" alt="微信更新“发现” 京东购物一级入口上线" style="border: 0px; vertical-align: middle; display: block; margin: 5px 0px; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;"> </p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">腾讯科技讯（王鑫）5月27日消息，微信和手机QQ今日陆续开始在应用中开通京东“购物”入口。用户进入微信和手机QQ的“购物”页面，可直接购买京东商城物品。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">新添加的“购物”入口位于微信的“发现”界面中，和朋友圈、游戏等功能并列位居微信第一入口。目前该功能已在北京和上海两个城市的部分用户中进行测试。之后，将陆续扩展到全国的微信用户中。手机QQ的京东购物入口将于明日上线，用户能在“QQ钱包”中进入“京东购物”页面。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">据腾讯科技体验，用户进入“购物”入口后并不会明显看到京东标识，只有进入订单页面，才会在页面底部看到“京东”字样。购买商品时均采用微信支付。若将微信账号和京东账号绑定，此前京东的购物地址也都同步至该账号。</p><p><img class="aligncenter" src="http://image.woshipm.com/wp-files/2014/05/61912b1634b551ccfa8975b89da49d63.jpg" alt="微信更新“发现” 京东购物一级入口上线" style="border: 0px; vertical-align: middle; display: block; margin: 5px 0px; -color: rgb(255, 255, 255); max-width: 620px; text-align: center; text-indent: -2em; -position: initial initial; -repeat: initial initial;"/></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;"> </p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">“购物”的页面中分为了三个子栏目：“新发现”、“品牌”和“聚惠”。据京东官方介绍，这三个栏目定位各有侧重，适应不同人群需求。其中，“新发现”定位为 “发现最潮和最新奇的好货”，根据用户的喜好呈现不同的商品推荐；“品牌” 以品牌特卖会的形式向用户推荐各大知名品牌的折扣商品；“聚惠”则以“性价比”致胜，向用户推荐最具性价比的单品。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">在购物功能的个人中心页面，显示出优惠券、代金券、京东红包等功能。这预示京东未来将借此渠道提供相应优惠和营销活动。据了解，京东或将在618网购狂欢节中回馈微信和手机QQ用户。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">早在京东与腾讯于3月10日宣布战略合作后，双方就已确认将在移动电商领域建立合作。微信和手机QQ的京东“购物”入口上线意味着产品层面合作已初见形态。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">此前有分析称，随着京东接入微信和手机QQ应用，未来几个月，预计京东来自移动端的成交额将大幅提升，也将提升京东的整体成交额，这将是京东实现弯道超车的机会。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; font-size: 16px; text-indent: 2em; line-height: 28px;">来自：腾讯科技</p><p><br/></p>', '', 0),
(22, 0, '<p><a href="http://www.gooraye.net/index.php?s=/home/index/index_a.html" target="_blank" title=""><img src="http://gooraye.qiniudn.com/gr_002.jpg" width="960" height="480"/></a></p>', '', 0);
INSERT INTO `wp_document_article` (`id`, `parse`, `content`, `template`, `bookmark`) VALUES
(23, 0, '<p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">雷军还问到“京东体量这么大，目前面临最大的困难和风险是什么”，刘强东是怎么回答的呢?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">为何京东的快递员会被请到家里签字?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">柳传志(联想控股有限公司董事长)：京东自有产品的线上销售与平台的其他服务相比各自的优势在哪，比如说客户买京东的自有产品，是不是看中了它的服务、品牌的可靠性啊，而平台是不是价格占了优势?请站在客户的角度来比较一下。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：我们整个平台的产品分为两大类，一类是标准化产品，一类是非标准化产品。3C、化妆品、奶粉、母婴都是标准化产品，标准化的产品集团化的卖家没有一家能卖过我们，几万家卖家营业额总和只占京东的5%左右。因为我们是有组织、有规划的采购，提前预知消费者消费行为，六小时配送到家，第三方卖家产品是两到三天内送到，我们提供上门售后服务，小卖家做不到上门服务。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">京东自营的产品售后服务，比如说联想的笔记本维修，消费者在我们的系统里进行登记，售后人员基本上在两小时十五分钟内就能到达消费者家里，如果是信用比较高的金牌会员，售后人员会带一台新的联想笔记本当场给予替换，这些服务小的卖家是提供不了的，所以通过优胜劣汰，95%的市场被京东占有。非标准化的产品我们竞争不过其他卖家。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">我们前两年采取自营的方式做服装，结果亏的一塌糊涂，消费者也不满意。因为服装的颜色、大小、季节等等是海量的，品牌无数，我们发现70%产品存在滞销的问题，虽然前期毛利率很高，但是一清仓就把赚的钱都赔进去了。非标准化的产品京东没法做，必须引入卖家。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">现在京东有6万个卖家，马上会过10万，每个卖家管理几千个SKU，6万个卖家就是几千万的规模。京东自营的模式无法管理这么大的服装规模，所以非标准化的产品非平台卖家比我们做的好。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">柳传志：京东的经营模式中一个很重要的特点就是你们有自己的物流体系，物流本身的成本中人工和设备的成本比例各占多少?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：人工成本占70%。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">柳传志：人工成本高，正是这个原因导致很多物流企业的员工被挤压得很厉害，企业的信誉不好。你们有庞大的物流团队，提高员工待遇会不会对整个物流业务的成本造成很大影响?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：柳总的这个问题很好。其实这个问题也是通过信息系统来解决的。京东拥有大量的劳动力，但绝对不是通过压榨劳工来提升公司的活力。我们在京的快递员每月工资扣除五险一金是5600元，公司还为每个快递员额外购买了商业险和20万的人身意外险。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">大家可能会发现社会上的快递员送货是客户走出门站在走廊上签字，而京东的快递员是被请到家门里签字，这充分体现了用户对我们的信任。如果收入低他们就不快乐，就可能会偷、蒙、骗。我们今年又给快递员涨了工资，我们希望我们的快递员收入比市场高30%。同时我们还提供住宿，提供鞋、帽、手套等工作服。在京东干满五年的配送人员，99%的在老家县城买了房子。我们认为员工不快乐就不会为客户提供好的服务，而让他们快乐的核心就是工资待遇高。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">柳传志：你们压力不大的一个很重要的原因是利润的45%是从金融业务那里来的，京东好的声誉，京东有个好的牌子对金融服务本身又会产生更大的利润。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：我们的财务报表里披露了物流的相关数字，快递每单8块钱，仓储4块钱，客服1块钱，这个成本很低。这是如何做到的呢?京东的快递模式和其他快递公司不同， “四通一达”是网格状的，每个快递员即送货又收货，配送人员有等待的时间，他永远不知道下一分钟谁打电话进来，永远不知道下一分钟客户寄多少包裹。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">而京东的快递员只送货不接单。我们每天夜里把每个快递员第二天要送多少包裹、会经过哪些社区、包括送货路线通过信息系统计算好，北京的快递员一天可以送三百个包裹，送件的数量远远大于其他快递公司。这就是为什么快递员的待遇很高，但同时物流成本又很低的原因。</p><h2 style="margin: 5px 0px; padding: 2px 8px; font-size: 16px; line-height: 25px; font-weight: 400; -color: rgb(237, 248, 252); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">在零售上真正赚到钱要靠技术</h2><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">李彦宏(百度董事长兼CEO)：京东的主业是零售，刚刚也谈到了有关白条和贷款等金融产品，我想问一下在未来五年或更长的时间里，金融服务的利润能够占到总利润的多少?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：全球沃尔玛净利润45%是来自现金流再投资的收益，真正每个店面卖货的净利润是55%。京东的预计可能会更大胆，十年后70%的净利润将来自于金融业务。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">李彦宏：京东是零售公司，同时又是半个金融公司。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：零售是我们获取用户和数据的手段。零售给消费者带去好的消费体验，消费者会每天买我的东西，这样我就能获得用户、获得数据。但要在零售上真正赚到钱要靠技术，这也是京东永远不会压榨供应商的原因所在。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">李彦宏：最近看到一个技术方面的专利，它可以预测客户定什么货，客户下订单前货物就已经发出了。这些专利上的壁垒将来会不会成为京东发展的障碍?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：中国企业一出去就被人告，这个问题确实存在。但是从自己的发展来说，京东比亚马逊走得更早，我们的产品销售订单预测比它还早，去年京东67%的订单是六小时内送到消费者手中的，亚马逊在美国是做不到的。我们可以，因为我们通过数据的分析提前把货送到离消费者最近的仓库里。亚马逊在美国没有配送系统，京东在中国有配送体系。他们有了预测以后把货发给Fedex、UPS临时的分检中心暂存，然后再送到消费者的家中，而我们是把货运到我们的仓库里，模式完全不同。</p><h2 style="margin: 5px 0px; padding: 2px 8px; font-size: 16px; line-height: 25px; font-weight: 400; -color: rgb(237, 248, 252); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">招聘人才，我有两个标准</h2><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">才让(中国钢研科技集团公司董事长)：在近万人聚集的北京，人力资源包括招募人才、培训、激励、考核等问题让人十分头疼，你的业务分布在全国各地，对于员工的招募，干部的控制包括考核、激励，人力资源的体系建设有没有什么诀窍?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：人是最难管的，京东去年一年招了一万人，今年预计招聘一万五千人。我们的招人理念可以和大家分享一下，我们内部叫能力价值观模型。我们招聘的要求是非常严格的，我们的高管平均要面试十个人以上才能选择一个，符合京东要求的人比例不到10%。我们招聘时主要考虑两个因素，一个是能力，业务能力，比如销售人员卖了多少销售额赚了多少利润。第二是价值观，他是怎么认识自己的、怎么认识他人的，怎么对待世界的，他的生活态度是什么。我们面试过程中有一个衡量体系，这是我们找了很多教授专家设计的，每年还要调整、改造。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">面试时我们要进行测试，能力也不行、价值观也不行的我们叫“废铁”，这样人肯定不能要，既出不了成绩，价值观又和我们不相符。价值观不存在好坏，我们只看和京东的五大核心价值观的匹配度是多少。第二类是价值观很匹配，但是能力不太行，我们称之为“铁”。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">其实这一类人通常是在工作中才能发现，面试时不一定能发现，我们会给他一次转岗和一次培训的机会，如果还不行就会开除。京东80%的员工属于第三类，得分在 60到80分，我们称之为“钢”，这是我们的地基。还有20%能力和价值观得分都很高的称之为“金子”，这是公司的核心。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">还有一些人能力很强，就是价值观不匹配，比如一些销售人员做的业绩很好，增长速度远远超过了公司的增长速度，但是就是价值观不一样，我们称之为“铁锈”。铁锈员工要坚决的干掉，因为铁锈有腐蚀性，他们搞破坏带来的杀伤力会更大。希特勒就是铁锈。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">为什么要保持二八的比例呢?很多公司上市之后很多员工离职了，一方面是因为员工有钱了，另一方面，公司上市前很多人心里有个梦想，有一股劲，要跟公司一起成长，但成长到一定程度心理就不平衡了，必然会有一部分人流失掉。金子能否达到20%的含量是决定团队是不是稳定的关键。我们的高管每半年进行一次能力价值观考核，普通的员工每年一次考核，通过每年的刷新、淘汰，最后留下来的都是价值观跟公司高度匹配，能力也不错的人。</p><h2 style="margin: 5px 0px; padding: 2px 8px; font-size: 16px; line-height: 25px; font-weight: 400; -color: rgb(237, 248, 252); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">战略“独裁”是企业最大风险</h2><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">雷军(小米科技有限责任公司董事长)：京东发展到这么大的规模，目前面临最大的困难和风险是什么?第二个问题，我个人是京东模式的看好者，上次京东准备上市公布财报之后，我跟别的企业争论的焦点是电商企业的高效率体现在什么地方。在整个流通成本上京东花了10%的营业额，他们说你去看国美和苏宁的财报，他们的效率比京东更高。他们觉得电子商务的高效在传统的流通渠道里效率更高。我没有核实过这两个数据，但是我觉得京东的效率是不是还有进一步改善的空间?</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">刘强东：我先回答第二个问题。据我所知国美、苏宁综合的费用率是15%，沃尔玛、家乐福大概是20%以上，这些都是公开财报。国内单纯的商超费用率是20%，京东是混合的，我们把电子产品和商超混在一块，所以费用率是10%，如果把3C产品拆开单独来看，费用率远远低于10%。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">再来说说第一个问题，企业规模大了最大的风险，我觉得来自创始人。京东在战略上由我独裁，我们的战略能不能及时到位，或者说战略错误都可能导致企业的失败，我认为这是最大的风险。</p><p style="margin-top: 0px; margin-bottom: 0px; padding: 5px 0px; text-indent: 2em; line-height: 28px; color: rgb(68, 68, 68); font-family: 微软雅黑, ''Microsoft Yahei''; white-space: normal;">来源：CEO来信，转载自<a href="http://www.iheima.com/thread-6728-1-1.html" target="_blank" style="color: rgb(0, 153, 204); text-decoration: none; zoom: 1;">i黑马</a></p><p><br/></p>', '', 0);

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
(17, 'weixin', '微信插件必须加载的钩子', 1, 1399279384, 'Vote,CustomReply,Chat,Wecome,UserCenter,Suggestions,Extensions,Leaflets,WeiSite,CustomMenu,Card,OnlineBooking,Panorama,Xydzp,Photo,SMSWX');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- 转存表中的数据 `wp_keyword`
--

INSERT INTO `wp_keyword` (`id`, `keyword`, `token`, `addon`, `aim_id`, `cTime`, `keyword_lenght`, `keyword_type`, `extra_text`, `extra_int`) VALUES
(12, '机器人学习时间', '0', 'Robot', 0, 1393210483, 0, 0, '', 0),
(40, '古睿', '53663a115a861', 'CustomReply', 1, 1399636825, 6, 3, 'custom_reply_news', 0),
(51, '企业简介', '536e0fac9c2c6', 'WeiSite', 2, 1400141314, 12, 0, 'custom_reply_news', 0),
(94, '大厅', '536e0fac9c2c6', 'WeiSite', 3, 1400831476, 6, 3, 'custom_reply_news', 0),
(58, '大厅展示', '536e0fac9c2c6', 'WeiSite', 4, 1400504260, 12, 0, 'custom_reply_news', 0),
(70, '五行经络刷', '536e0fac9c2c6', 'WeiSite', 5, 1400576514, 15, 0, 'custom_reply_news', 0),
(54, 'SPA能量热石', '536e0fac9c2c6', 'WeiSite', 6, 1400244321, 15, 0, 'custom_reply_news', 0),
(57, '预约', '536e0fac9c2c6', 'CustomReply', 7, 1400377714, 6, 0, 'custom_reply_news', 0),
(65, '护理', '536e0fac9c2c6', 'WeiSite', 8, 1400575576, 6, 3, 'custom_reply_news', 0),
(68, '药泥', '536e0fac9c2c6', 'WeiSite', 9, 1400576454, 6, 0, 'custom_reply_news', 0),
(67, '热石', '536e0fac9c2c6', 'WeiSite', 10, 1400575717, 6, 0, 'custom_reply_news', 0),
(69, '皇家', '536e0fac9c2c6', 'WeiSite', 11, 1400576474, 6, 0, 'custom_reply_news', 0),
(77, '微社区', '53705a8fb5564', 'CustomReply', 12, 1400662642, 9, 0, 'custom_reply_news', 0),
(78, '', '536e0fac9c2c6', 'CustomReply', 13, 1400662829, 0, 0, 'custom_reply_news', 0),
(79, 'w', '536e0fac9c2c6', 'CustomReply', 13, 1400662829, 1, 0, 'custom_reply_news', 0),
(80, 'wsq', '53705a8fb5564', 'CustomReply', 14, 1400663145, 3, 0, 'custom_reply_news', 0),
(82, '服务', '536e0fac9c2c6', 'CustomReply', 1, 1400721163, 6, 3, 'custom_reply_mult', 0),
(83, '优惠', '536e0fac9c2c6', 'WeiSite', 15, 1400746183, 6, 3, 'custom_reply_news', 0),
(85, '天气', '536e0fac9c2c6', 'CustomReply', 1, 1400748380, 6, 0, 'custom_reply_text', 0),
(87, 'ddd', '53705a8fb5564', 'Xydzp', 6, 1400753988, 3, 0, '', 0),
(89, '大厅', '-1', 'Photo', 4, 1400825031, 6, 0, '', 0),
(90, '微相册', '536e0fac9c2c6', 'Photo', 5, 1400826104, 9, 0, '', 0),
(91, '房间', '536e0fac9c2c6', 'Photo', 6, 1400828697, 6, 0, '', 0),
(99, '技师', '536e0fac9c2c6', 'Photo', 7, 1400833802, 6, 0, '', 0),
(96, '过道', '536e0fac9c2c6', 'Photo', 8, 1400832942, 6, 0, '', 0),
(97, '前台', '536e0fac9c2c6', 'Photo', 9, 1400833089, 6, 0, '', 0),
(98, '外部', '536e0fac9c2c6', 'Photo', 10, 1400833283, 6, 0, '', 0),
(103, '联系我们', '53705a8fb5564', 'CustomReply', 2, 1400921933, 12, 0, 'custom_reply_text', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_log`
--

CREATE TABLE IF NOT EXISTS `wp_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `createtime` int(10) NOT NULL COMMENT '产生时间',
  `comefrom` varchar(50) NOT NULL DEFAULT 'gooraye' COMMENT '来源',
  `possiblereason` varchar(255) NOT NULL COMMENT '系统推断日志产生的原因',
  `context` text NOT NULL COMMENT '日志产生的上下文环境',
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '日志类型',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

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
  `login` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `reg_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '注册IP',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员状态',
  `token` varchar(100) DEFAULT NULL,
  `openid` varchar(100) DEFAULT NULL,
  `truename` varchar(50) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `extra_field` text
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员表' AUTO_INCREMENT=199 ;

--
-- 转存表中的数据 `wp_member`
--

INSERT INTO `wp_member` (`uid`, `nickname`, `sex`, `birthday`, `qq`, `score`, `login`, `reg_ip`, `reg_time`, `last_login_ip`, `last_login_time`, `status`, `token`, `openid`, `truename`, `mobile`, `extra_field`) VALUES
(1, '何必都', 0, '0000-00-00', '', 70, 69, 0, 1399178896, 2130706433, 1401348053, 1, '', '', '', '', ''),
(161, 'gooraye', 0, '0000-00-00', '', 100, 41, 2130706433, 1399193156, 2130706433, 1401349533, 1, '', '', '', '', ''),
(167, 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', '', '', ''),
(163, 'oQJWet3cxXR84wEa2UDrI08eXjug', 0, '0000-00-00', '', 0, 1, 0, 0, 2061514924, 1399643566, 1, '53663a115a861', 'oQJWet3cxXR84wEa2UDrI08eXjug', '', '', ''),
(164, 'dwyspa', 0, '0000-00-00', '', 40, 48, 0, 0, 2062312170, 1400832519, 1, '', '', '', '', ''),
(165, 'oy6EYuNwX9g9u-E-7FQ72-avknmY', 0, '0000-00-00', '', 0, 19, 0, 0, 236004022, 1400831092, 1, '536e0fac9c2c6', 'oy6EYuNwX9g9u-E-7FQ72-avknmY', '', '', ''),
(166, 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', 0, '0000-00-00', '', 0, 1, 0, 0, 2062312170, 1400921097, 1, '53705a8fb5564', 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', '', '', ''),
(168, 'oQJWetwWiJTbAt2v-3YojPisYtco', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53663a115a861', 'oQJWetwWiJTbAt2v-3YojPisYtco', '', '', ''),
(169, 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', '', '', ''),
(170, 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', '', '', ''),
(171, 'oy6EYuJkX68eZw4kKg0itWYpldFI', 0, '0000-00-00', '', 0, 2, 0, 0, 2062312170, 1400813875, 1, '536e0fac9c2c6', 'oy6EYuJkX68eZw4kKg0itWYpldFI', '', '', ''),
(172, 'oy6EYuCKFlrQf7VOEtivI1orRtto', 0, '0000-00-00', '', 0, 3, 0, 0, 2061514924, 1400201745, 1, '536e0fac9c2c6', 'oy6EYuCKFlrQf7VOEtivI1orRtto', '', '', ''),
(173, 'oy6EYuF7hDpVCqVOEcg__t_apL30', 0, '0000-00-00', '', 0, 11, 0, 0, 2073923022, 1401177326, 1, '536e0fac9c2c6', 'oy6EYuF7hDpVCqVOEcg__t_apL30', '', '', ''),
(174, 'oqMIVt_oECJxAAu_0FHj2E_SPPgM', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt_oECJxAAu_0FHj2E_SPPgM', '', '', ''),
(175, 'oy6EYuDZwyvBcrpuPEA6YpBi1UPw', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuDZwyvBcrpuPEA6YpBi1UPw', '', '', ''),
(176, 'oy6EYuMoULbngNQ75_qFOQ5Xt0LI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuMoULbngNQ75_qFOQ5Xt0LI', '', '', ''),
(177, 'oy6EYuLnCC2oaZwJVWcX9pfcxf30', 0, '0000-00-00', '', 0, 2, 0, 0, 2061514924, 1400387168, 1, '536e0fac9c2c6', 'oy6EYuLnCC2oaZwJVWcX9pfcxf30', '', '', ''),
(178, 'oqMIVt7zI8x6rfGYLZpT3lFiGmAI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt7zI8x6rfGYLZpT3lFiGmAI', '', '', ''),
(179, 'oqMIVt7ngXJZN5rsv87yZjJhqy9E', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt7ngXJZN5rsv87yZjJhqy9E', '', '', ''),
(180, 'oy6EYuKCAGHK82oZ5-qCsu9B7vCE', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuKCAGHK82oZ5-qCsu9B7vCE', '', '', ''),
(181, 'oqMIVt0XES04VNcYVGqLUuCamF3s', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt0XES04VNcYVGqLUuCamF3s', '', '', ''),
(182, 'oqMIVt0YNe0S5wwAIrioHYYXyYqk', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt0YNe0S5wwAIrioHYYXyYqk', '', '', ''),
(183, 'oqMIVt7clu56jMAF6FbMcyFK6AN0', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt7clu56jMAF6FbMcyFK6AN0', '', '', ''),
(184, 'oy6EYuFdwdhJAPovIM4gSJh9YAi8', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuFdwdhJAPovIM4gSJh9YAi8', '', '', ''),
(185, 'oqMIVt3cx-mLmZFQSmGs1fgilc-8', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '53705a8fb5564', 'oqMIVt3cx-mLmZFQSmGs1fgilc-8', '', '', ''),
(186, 'oy6EYuNeQVx_21eJ-3SH6fD9CM58', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuNeQVx_21eJ-3SH6fD9CM58', '', '', ''),
(187, 'oy6EYuHtBxSY6tTI7yCoW5tMLlCI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuHtBxSY6tTI7yCoW5tMLlCI', '', '', ''),
(188, 'oy6EYuKFAvo3UvUdhLOSGtgt4qXI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuKFAvo3UvUdhLOSGtgt4qXI', '', '', ''),
(189, 'oy6EYuPT1ja1QE3MStteZvLbFti4', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuPT1ja1QE3MStteZvLbFti4', '', '', ''),
(190, 'oy6EYuDTHv7MOxu9S8U1mGBWdn2U', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuDTHv7MOxu9S8U1mGBWdn2U', '', '', ''),
(191, 'oy6EYuFeo6fNAR5h8pfC7D6aQSjw', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuFeo6fNAR5h8pfC7D6aQSjw', '', '', ''),
(192, 'oy6EYuK5LXR5t8OaF7PsizJ9xgfI', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuK5LXR5t8OaF7PsizJ9xgfI', '', '', ''),
(193, 'oy6EYuLAi1geWRhPF1MwbJUMw3vQ', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuLAi1geWRhPF1MwbJUMw3vQ', '', '', ''),
(194, 'oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg', '', '', ''),
(195, 'oy6EYuKrWy75anIQDmV5w2xFIa6Y', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuKrWy75anIQDmV5w2xFIa6Y', '', '', ''),
(196, 'oy6EYuCy_yBNSheA6xZAkwOxe8KY', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuCy_yBNSheA6xZAkwOxe8KY', '', '', ''),
(197, 'oy6EYuN_s7WETZ_iBOI_63Eyg0vk', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuN_s7WETZ_iBOI_63Eyg0vk', '', '', ''),
(198, 'oy6EYuEGhruqaxHTB_l5j59mZNTs', 0, '0000-00-00', '', 0, 0, 0, 0, 0, 0, 1, '536e0fac9c2c6', 'oy6EYuEGhruqaxHTB_l5j59mZNTs', '', '', '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

--
-- 转存表中的数据 `wp_member_public`
--

INSERT INTO `wp_member_public` (`id`, `uid`, `public_name`, `public_id`, `wechat`, `interface_url`, `headface_url`, `area`, `addon_config`, `addon_status`, `token`, `is_use`, `type`, `appid`, `secret`, `group_id`) VALUES
(76, 162, '戴维营spa会所', 'gh_e65caef2c01d', '1589829293', '', '', '', '', '', '5366f118c9fe7', 1, '1', '', '', 0),
(77, 164, '柯桥戴维营spa', 'gh_e65caef2c01d', 'dwy-spa', '', '', '', '{"Wecome":{"type":"3","title":"\\u6b22\\u8fce\\u5173\\u6ce8\\u6234\\u7ef4\\u8425Spa\\u670d\\u52a1\\u53f7","description":"\\u4e13\\u4e1a\\u517b\\u751fSPA\\u4f1a\\u6240\\uff0c\\u4e8e2013\\u5e746\\u6708\\u4efd\\u5f00\\u4e1a\\uff0c\\u4f4d\\u4e8e\\u67ef\\u6865\\u4e07\\u8fbe\\u5e7f\\u573a\\uff0c\\u7ecd\\u5174\\u5e02\\u6234\\u7ef4\\u8425SPA\\u7f8e\\u5bb9\\u4f1a\\u6240\\u4f4d\\u4e8e\\u7ecd\\u5174\\u67ef\\u6865\\u4e07\\u8fbe\\u5e7f\\u573a\\uff0c\\u5468\\u8fb9\\u9ad8\\u697c\\u6797\\u7acb\\uff0c\\u4f1a\\u6240\\u5185\\u5962\\u534e\\u7684\\u88c5\\u4fee\\uff0c\\u7cbe\\u6cb9\\u7684\\u82b3\\u9999\\uff0c\\u6f7a\\u6f7a\\u7684\\u6d41\\u6c34\\uff0c\\u8ba9\\u6240\\u6709\\u8d70\\u8fdb\\u6234\\u7ef4\\u8425\\u7684\\u6bcf\\u4e00\\u4e2a\\u4eba\\u611f\\u53d7\\u5230\\u7684\\u662f\\u4e00\\u79cd\\u7687\\u5ba4\\u8d35\\u65cf\\u7684\\u5c0a\\u8d35\\uff0c\\u4e16\\u5916\\u6843\\u6e90\\u7684\\u5b81\\u9759\\u3002","pic_url":"http:\\/\\/b.hiphotos.baidu.com\\/image\\/w%3D2048%3Bq%3D90\\/sign=5ea149700846f21fc9345953c21c5011\\/a686c9177f3e67094056427439c79f3df9dc55e2.jpg","url":""},"Chat":{"jok_key":"http:\\/\\/apix.sinaapp.com\\/joke\\/?appkey=gooraye","simsim_key":"41250a68-3cb5-43c8-9aa2-d7b3caf519b1","simsim_url":"http:\\/\\/sandbox.api.simsimi.com\\/request.p","i9_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","rand_reply":"\\u6234\\u7ef4\\u8425SPA\\r\\n\\u5730\\u5740\\uff1a\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c\\r\\n\\u7535\\u8bdd\\uff1a0575-89871666\\u300113867519285\\r\\n\\u8425\\u4e1a\\u65f6\\u95f4\\uff1a12:00-\\u6b21\\u65e51:00\\r\\n","opens":["8","4","2","1"]},"WeiSite":{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u98752","cover":"60","info":"\\u6234\\u7ef4\\u8425\\u6210\\u7acb\\u4e8e1982\\u5e74\\uff0c\\u662f\\u4e00\\u5bb6\\u96c6\\u517b\\u751f\\uff0cSPA\\u5065\\u5eb7\\u4ea7\\u4e1a\\u3001\\u9152\\u5e97\\u3001\\u8d38\\u6613\\u7b49\\u4e3a\\u4e00\\u4f53\\u7684\\u8de8\\u56fd\\u8fde\\u9501\\u673a\\u6784\\u3002\\u6234\\u7ef4\\u8425\\u79c9\\u627f\\u4f18\\u8d28\\u7684\\u5065\\u5eb7\\u7406\\u5ff5\\uff0c\\u63d0\\u4f9b\\u9ad8\\u6863\\u6b21\\u3001\\u9ad8\\u6c34\\u51c6\\u5e73\\u7684\\u73af\\u5883\\u8bbe\\u65bd\\u548c\\u4fdd\\u5065\\u670d\\u52a1\\u3002\\u7ea2\\u6728\\u3001\\u6c89\\u9999\\u3001\\u53e4\\u73a9\\u7684\\u70b9\\u7f00\\u4f7f\\u5f97\\u4efb\\u4f55\\u4e00\\u5bb6\\u5206\\u516c\\u53f8\\u90fd\\u4f53\\u73b0\\u51fa\\u6d53\\u539a\\u7684\\u4e2d\\u56fd\\u53e4\\u5178\\u97f5\\u5473\\u548c\\u827a\\u672f\\u6c1b\\u56f4\\uff0c\\u662f\\u73b0\\u4ee3\\u4eba\\u58eb\\u54c1\\u53e4\\u8bba\\u4eca\\u3001\\u653e\\u677e\\u8eab\\u5fc3\\u3001\\u517b\\u751f\\u5065\\u4f53\\u7684\\u805a\\u4f1a\\u573a\\u6240\\u3002 \\u4f4d\\u4e8e\\u67ef\\u6865\\u4e16\\u8d38\\u4e2d\\u5fc3\\u7684\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u6240\\uff0c\\u662f\\u6234\\u7ef4\\u8425\\u7684\\u5347\\u7ea7\\u4e4b\\u4f5c\\uff0c\\u5168\\u65b0\\u5f62\\u8c61\\uff0c\\u5168\\u65b0\\u7075\\u9b42\\u3002\\u5e26\\u6765\\u4e0d\\u4e00\\u6837\\u7684\\u5168\\u65b0\\u4f11\\u95f2\\u611f\\u53d7\\u3002\\u4f1a\\u6240\\u4f18\\u9009\\u4e1c\\u65b9\\u53e4\\u8001\\u517b\\u751f\\u6cd5\\u6709\\u673a\\u62a4\\u7406\\u4ea7\\u54c1\\uff0c\\u7ed3\\u5408\\u6280\\u5e08\\u7cbe\\u6e5b\\u7684\\u6280\\u827a\\uff0c\\u5c06\\u517b\\u751f\\u7f8e\\u989c\\u63d0\\u5347\\u5230\\u79d1\\u5b66\\u3001\\u5185\\u5916\\u517c\\u65bd\\u7684\\u81f3\\u9ad8\\u5883\\u754c\\u3002\\u8bbe\\u8ba1\\u5e08\\u4ece\\u4e2d\\u56fd\\u4f20\\u7edf\\u6587\\u5316\\u4e2d\\u6444\\u53d6\\u8bbe\\u8ba1\\u7075\\u611f\\uff0c\\u6253\\u9020\\u51fa\\u4e00\\u5904\\u81ea\\u7136\\u96c5\\u81f4\\uff0c\\u9759\\u8c27\\u548c\\u8c10\\u7684\\u4f11\\u95f2\\u7a7a\\u95f4\\uff0c\\u5e26\\u7ed9\\u4eba\\u5fc3\\u7075\\u7684\\u611f\\u52a8\\u3002","background":"http:\\/\\/www.gooraye.net","code":"","template_index":"ColorV2","template_footer":"empty","template_lists":"V1","template_detail":"V1","telephone":"0575-85060707"},"Card":{"background":"3","bg":"","title":"\\u6234\\u7ef4\\u8425SPA \\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u6234\\u7ef4\\u8425SPA\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u6234\\u7ef4\\u8425SPA\\u6240\\u6709","address":"\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c","phone":"0575-89871666","url":"","background_custom":""},"OnlineBooking":{"remindway":["4"],"toaddress":"\\\\\\\\\\\\''mail\\\\\\\\\\\\''=>\\\\\\\\\\\\''584574783@qq.com\\\\\\\\\\\\''","address":"\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c","addressMap":"http:\\/\\/j.map.baidu.com\\/1u2hs","tel":"0575-89871666","info":"\\u63d0\\u4ea4\\u6210\\u529f\\u540e\\uff0c\\u5c06\\u4f1a\\u7535\\u8bdd\\u8054\\u7cfb\\u60a8\\u786e\\u5b9a\\u6b64\\u6b21\\u9884\\u7ea6\\u3002","picture":"76","timepart":"12-24","projecttype":"\\u4e94\\u884c\\u7ecf\\u7edc\\u5237,SPA\\u80fd\\u91cf\\u70ed\\u77f3"},"Suggestions":{"need_truename":"0","need_mobile":"0","logo":"http:\\/\\/gooraye.qiniudn.com\\/dwy_QQ%E5%9B%BE%E7%89%8720140523103317.jpg"},"Leaflets":{"title":"\\u6234\\u7ef4\\u8425SPA\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7","img":"97","info":"\\u5fae\\u4fe1\\u8425\\u9500\\u7ba1\\u7406\\u5e73\\u53f0\\u4e3a\\u4e2a\\u4eba\\u548c\\u4f01\\u4e1a\\u63d0\\u4f9b\\u57fa\\u4e8e\\u5fae\\u4fe1\\u516c\\u4f17\\u5e73\\u53f0\\u7684\\u4e00\\u7cfb\\u5217\\u529f\\u80fd\\uff0c\\u5305\\u62ec\\u667a\\u80fd\\u56de\\u590d\\u3001\\u5fae\\u4fe13G\\u7f51\\u7ad9\\u3001\\u4e92\\u52a8\\u8425\\u9500\\u6d3b\\u52a8\\uff0c\\u4f1a\\u5458\\u7ba1\\u7406\\uff0c\\u5728\\u7ebf\\u8ba2\\u5355\\uff0c\\u6570\\u636e\\u7edf\\u8ba1\\u7b49\\u7cfb\\u7edf\\u529f\\u80fd,\\u5e26\\u7ed9\\u4f60\\u5168\\u65b0\\u7684\\u5fae\\u4fe1\\u4e92\\u52a8\\u8425\\u9500\\u4f53\\u9a8c\\u3002","copyright":"\\u00a92001-2013 \\u53e4\\u777f\\u5b98\\u65b9\\u5fae\\u4fe1\\u516c\\u4f17\\u53f7\\u7248\\u6743\\u6240\\u6709"}}', '', '536e0fac9c2c6', 1, '1', 'wxc5a15c2aae5d3d22', 'f0a0d738f4f6f7f3c3bf09a4c6d120df', 0),
(78, 161, '古睿', 'gh_826a00b218bb', 'gooraye', '', '', '', '{"Wecome":{"type":"3","title":"\\u6b22\\u8fce\\u5173\\u6ce8\\u53e4\\u777f","description":"\\u7ecd\\u5174\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u3002\\r\\n\\u5ba2\\u670d\\u7535\\u8bdd\\uff1a0575-85060707\\r\\n\\u5ba2\\u670dQQ 001\\uff1a1966236348\\r\\n\\u5ba2\\u670dQQ 002\\uff1a2966442390\\r\\n","pic_url":"http:\\/\\/gooraye.qiniudn.com\\/gr_logotext.png","url":"http:\\/\\/www.gooraye.net"},"Chat":{"jok_key":"http:\\/\\/apix.sinaapp.com\\/joke\\/?appkey=gooraye","simsim_key":"41250a68-3cb5-43c8-9aa2-d7b3caf519b1","simsim_url":"http:\\/\\/sandbox.api.simsimi.com\\/request.p","i9_url":"http:\\/\\/www.xiaojo.com\\/bot\\/chata.php","rand_reply":"\\u5ba2\\u670d\\u7535\\u8bdd\\uff1a0575-85060707\\r\\n\\u5ba2\\u670dQQ001\\uff1a1966236348\\r\\n\\u5ba2\\u670dQQ002\\uff1a2966442390\\r\\n\\u90ae\\u7bb1\\uff1asupport@gooraye.net\\r\\n1.\\u5929\\u6c14\\u9884\\u62a5 \\u56de\\u590d\\uff1a \\u5929\\u6c14 \\u7ecd\\u5174\\r\\n2.\\u5fae\\u793e\\u533a \\u56de\\u590d\\uff1a\\u5fae\\u793e\\u533a\\r\\n\\u66f4\\u591a\\u529f\\u80fd\\u63a8\\u51fa\\u4e2d...\\r\\n","opens":["8","4","2","1"]},"WeiSite":{"title":"\\u70b9\\u51fb\\u8fdb\\u5165\\u9996\\u9875","cover":"42","info":"\\u7f51\\u7ad9\\u5efa\\u8bbe\\uff0chtml5\\u7f51\\u7ad9\\u5f00\\u53d1\\uff0c\\u79fb\\u52a8APP\\u5f00\\u53d1\\uff0c\\u5fae\\u5546\\u57ce\\u5f00\\u53d1\\u3001\\u63d0\\u4f9b\\u5fae\\u4fe1\\u76f8\\u5173\\u7684\\u5404\\u7c7b\\u670d\\u52a1\\u3002\\u7ecd\\u5174\\u4e13\\u4e1a\\u624b\\u673a\\u7f51\\u7ad9\\u5f00\\u53d1\\u516c\\u53f8","background":"","code":"","template_index":"ColorV1","template_footer":"V1","template_lists":"V1","template_detail":"V1","telephone":"0575-85060707"},"Card":{"background":"9","bg":"","title":"\\u53e4\\u777fVIP\\u4f1a\\u5458\\u5361","length":"80001","instruction":"1\\u3001\\u606d\\u559c\\u60a8\\u6210\\u4e3a\\u53e4\\u777fVIP\\u4f1a\\u5458;\\r\\n2\\u3001\\u7ed3\\u8d26\\u65f6\\u8bf7\\u51fa\\u793a\\u6b64\\u5361\\uff0c\\u51ed\\u6b64\\u5361\\u53ef\\u4eab\\u53d7\\u4f1a\\u5458\\u4f18\\u60e0;\\r\\n3\\u3001\\u6b64\\u5361\\u6700\\u7ec8\\u89e3\\u91ca\\u6743\\u5f52\\u53e4\\u777f\\u4fe1\\u606f\\u79d1\\u6280\\u6709\\u9650\\u516c\\u53f8\\u6240\\u6709","address":"","phone":"","url":"","background_custom":""},"Suggestions":{"toaddress":"2966442390@qq.com,1966236348@qq.com","need_truename":"0","need_mobile":"0","logo":"http:\\/\\/gooraye.qiniudn.com\\/gr_logotext.png"},"OnlineBooking":{"remindway":["4","1"],"toaddress":"mail:hebiduhebi@126.com;sms:13484379290","address":"\\u7ecd\\u5174\\u53bf\\u67ef\\u6865\\u94b1\\u9676\\u516c\\u8def\\u4e16\\u8d38\\u4e2d\\u5fc3\\u82f1\\u8c6a\\u6d32\\u9645\\u516c\\u99861\\u697c","addressMap":"http:\\/\\/j.map.baidu.com\\/1u2hs","tel":"0575-89871666","info":"\\u63d0\\u4ea4\\u6210\\u529f\\u540e\\uff0c\\u5c06\\u4f1a\\u7535\\u8bdd\\u8054\\u7cfb\\u60a8\\u786e\\u5b9a\\u6b64\\u6b21\\u9884\\u7ea6\\u3002","picture":"http:\\/\\/gooraye.qiniudn.com\\/dwyzaixianyuyue.jpg","timepart":"12-24","projecttype":"\\u4e94\\u884c\\u7ecf\\u7edc\\u5237,SPA\\u80fd\\u91cf\\u70ed\\u77f3"}}', '', '53705a8fb5564', 1, '1', 'wx58aea38c0796394d', '3e1404c970566df55d7314ecfe9ff437', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='文档模型表' AUTO_INCREMENT=49 ;

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
(38, 'online_booking', '在线预约', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1400033748, 1400033748, 1, 'MyISAM'),
(39, 'panorama', '360全景', 0, '', 1, '{"1":["keyword","keyword_type","title","cover","intro","picture1","picture2","picture3","picture4","picture5","picture6"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:show&id=[id]|预览,[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1398319281, 1, 'MyISAM'),
(40, 'xydzp', '幸运大转盘', 0, '', 1, '{"1":["keyword","title","start_date","end_date","picurl","guiz","des","des_jj","choujnum"]}', '1:基础', '', '', '', '', 'id:编号\r\nkeyword:触发关键词\r\ntitle:标题\r\nstart_date|time_format:开始时间\r\nend_date|time_format:结束日期\r\nchoujnum:每日抽奖次数\r\nid:操作:show?id=[id]|预览,zjloglists?id=[id]|中奖记录,jplists?xydzp_id=[id]|奖品设置,[EDIT]|编辑,[DELETE]|删除', 10, 'title', 'des', 1395395179, 1396703468, 1, 'MyISAM'),
(41, 'xydzp_option', '幸运大转盘奖品库设置', 0, '', 1, '{"1":["title","jptype","num","pic","miaoshu"]}', '1:基础', '', '', '', '', 'pic:奖品图片\r\ntitle:奖品名称\r\njptype:奖品类型\r\nnum:库存数量\r\nmiaoshu:奖品介绍\r\nid:操作:jpopedit?id=[id]|编辑,jpopdel?id=[id]|删除', 10, 'title', '', 1395395190, 1395558485, 1, 'MyISAM'),
(42, 'xydzp_log', '幸运大转盘中奖列表', 0, '', 1, '{"1":["xydzp_id","xydzp_option_id","zip","iphone","address","message"]}', '1:基础', '', '', '', '', 'id:编号\r\ntruename:用户名称\r\nopenid:用户ID\r\nmobile:联系电话\r\nxydzp_id:活动ID\r\ntitle:奖品名称\r\nstate|get_name_by_status:领奖状态\r\nzjdate|time_format:中奖时间\r\nid:标记:ylingqu?id=[id]|已领取,wlingqu?id=[id]|未领取', 10, '', '', 1395395200, 1396705134, 1, 'MyISAM'),
(43, 'xydzp_jplist', '幸运大转盘奖品列表', 0, '', 1, '{"1":["type","gailv","gailv_str","gailv_maxnum","jlnum"]}', '1:基础', '', '', '', '', 'type:中奖方式\r\ngailv_str:中奖概率或参数\r\ngailv_maxnum:单日发放上限\r\njlnum:奖励数量\r\nid:操作:jpedit?id=[id]|编辑,jpdel?id=[id]|删除', 10, '', '', 1395554963, 1395921237, 1, 'MyISAM'),
(44, 'xydzp_userlog', '幸运大转盘用户抽奖记录', 0, '', 1, '', '1:基础', '', '', '', '', '', 10, '', '', 1395567366, 1395567366, 1, 'MyISAM'),
(45, 'photo', '微相册', 0, '', 1, '{"1":["keyword","title","intro","cover","visible","sord"]}', '1:基础', '', '', '', '', 'title:标题\r\ncover:封面\r\nvisible:可见性\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1398498938, 1, 'MyISAM'),
(46, 'photo_pic', '相册图片模型', 0, '', 1, '{"1":["pic","intro","sord"]}', '1:基础', '', '', '', '', 'pid:相册ID\r\npic:相片\r\nintro:简介\r\nsord:排序\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1398573924, 1, 'MyISAM'),
(47, 'sms_log', '短信发送记录模型', 0, '', 1, '{"1":["keyword","keyword_type","title","intro","cover","content"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1401347837, 1, 'MyISAM'),
(48, 'sms_log', '短信发送记录模型', 0, '', 1, '{"1":["keyword","keyword_type","title","intro","cover","content"]}', '1:基础', '', '', '', '', 'keyword:关键词\r\nkeyword_type|get_name_by_status:关键词类型\r\ntitle:标题\r\ncTime|time_format:发布时间\r\nid:操作:[EDIT]|编辑,[DELETE]|删除', 10, 'title', '', 1396061373, 1401347837, 1, 'MyISAM');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `wp_online_booking`
--

INSERT INTO `wp_online_booking` (`id`, `info`, `type`, `timepart`, `dateline`, `tel`, `truename`, `token`, `openid`, `status`) VALUES
(1, '', 'house_book', '8:00-9:00', 0, '', '', '', '', '0'),
(5, '', 'house_book', '15-16', 0, '12345678901', '12', '', '', '0'),
(6, '', 'house_book', '15-16', 0, '12345678901', '12', '', '', '0'),
(7, '', 'house_book', '15-16', 2014, '12345678901', '12', '', '', '0'),
(8, '', 'house_book', '15-16', 2014, '12345678901', '12', '', '', '0'),
(9, '', '其它', '15:00-16:00', 2014, '12345678901', '123', '', '', '0'),
(10, '', '其它', '18:00-19:00', 0, '13484379290', 'hebidu', '', '', '0'),
(11, '', '其它', '18:00-19:00', 0, '13484379290', 'hebidu', '', '', '0'),
(12, '', '其它', '18:00-19:00', 0, '12345678900', 'h', '', '', '0'),
(13, '', '其它', '18:00-19:00', 0, '12345678900', 'h', '', '', '0'),
(14, '', '其它', '18:00-19:00', 0, '12345678900', 'h', '', '', '0'),
(15, '', '其它', '18:00-19:00', 0, '12345678900', 'h', '', '', '0'),
(16, '', '其它', '18:00-19:00', 0, '12345678900', 'h', '', '', '0');

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
-- 表的结构 `wp_photo`
--

CREATE TABLE IF NOT EXISTS `wp_photo` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `title` varchar(255) NOT NULL COMMENT '相册名称',
  `intro` text NOT NULL COMMENT '封面简介',
  `cover` int(10) unsigned NOT NULL COMMENT '封面图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `visible` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否显示相册',
  `sord` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `wp_photo`
--

INSERT INTO `wp_photo` (`id`, `keyword`, `title`, `intro`, `cover`, `cTime`, `token`, `visible`, `sord`) VALUES
(5, '微相册', '大厅', '大厅', 123, 1400826104, '536e0fac9c2c6', 0, 0),
(6, '房间', '房间展示', '房间展示', 133, 1400828697, '536e0fac9c2c6', 0, 0),
(7, '技师', '技师团队', '技师团队', 140, 1400832822, '536e0fac9c2c6', 0, 0),
(8, '过道', '过道展示', '过道展示', 143, 1400832942, '536e0fac9c2c6', 0, 0),
(9, '前台', '前台展示', '前台展示', 150, 1400833089, '536e0fac9c2c6', 0, 0),
(10, '外部', '外部展示', '外部展示', 154, 1400833283, '536e0fac9c2c6', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_photo_pic`
--

CREATE TABLE IF NOT EXISTS `wp_photo_pic` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `intro` text NOT NULL COMMENT '描述',
  `pic` int(10) unsigned NOT NULL COMMENT '图片',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `pid` int(10) unsigned NOT NULL COMMENT '相册ID',
  `sord` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=107 ;

--
-- 转存表中的数据 `wp_photo_pic`
--

INSERT INTO `wp_photo_pic` (`id`, `intro`, `pic`, `cTime`, `token`, `pid`, `sord`) VALUES
(77, '', 122, 1400825056, '-1', 4, 0),
(86, '', 132, 1400828629, '536e0fac9c2c6', 5, 0),
(85, '', 131, 1400828616, '536e0fac9c2c6', 5, 0),
(81, '', 127, 1400828415, '536e0fac9c2c6', 5, 0),
(82, '', 128, 1400828516, '536e0fac9c2c6', 5, 0),
(83, '', 129, 1400828534, '536e0fac9c2c6', 5, 0),
(84, '', 130, 1400828549, '536e0fac9c2c6', 5, 0),
(87, '', 134, 1400832645, '536e0fac9c2c6', 6, 0),
(88, '', 135, 1400832653, '536e0fac9c2c6', 6, 0),
(89, '', 136, 1400832660, '536e0fac9c2c6', 6, 0),
(90, '', 137, 1400832668, '536e0fac9c2c6', 6, 0),
(91, '', 138, 1400832675, '536e0fac9c2c6', 6, 0),
(92, '', 139, 1400832704, '536e0fac9c2c6', 6, 0),
(93, '', 141, 1400832832, '536e0fac9c2c6', 7, 0),
(94, '', 142, 1400832840, '536e0fac9c2c6', 7, 0),
(95, '', 144, 1400832952, '536e0fac9c2c6', 8, 0),
(96, '', 145, 1400832960, '536e0fac9c2c6', 8, 0),
(97, '', 146, 1400832968, '536e0fac9c2c6', 8, 0),
(98, '', 147, 1400832975, '536e0fac9c2c6', 8, 0),
(99, '', 148, 1400832983, '536e0fac9c2c6', 8, 0),
(100, '', 149, 1400832990, '536e0fac9c2c6', 8, 0),
(101, '', 151, 1400833098, '536e0fac9c2c6', 9, 0),
(102, '', 152, 1400833112, '536e0fac9c2c6', 9, 0),
(103, '', 153, 1400833119, '536e0fac9c2c6', 9, 0),
(104, '', 155, 1400833322, '536e0fac9c2c6', 10, 0),
(105, '', 156, 1400833329, '536e0fac9c2c6', 10, 0),
(106, '', 157, 1400833336, '536e0fac9c2c6', 10, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=166 ;

--
-- 转存表中的数据 `wp_picture`
--

INSERT INTO `wp_picture` (`id`, `path`, `url`, `md5`, `sha1`, `status`, `create_time`) VALUES
(99, '/Uploads/Picture/2014-05-22/537dfa517d708.gif', 'http://gooraye.qiniudn.com/2014-05-22_537dfa517d708.gif', '397ddacdc5aa09d9ed3876952a1ac9c7', 'edf7655d3727cddf3302787f002e19626137d375', 1, 1400765009),
(98, 'http://gooraye.qiniudn.com/2014-05-22_537d4ed9ccf2e.jpg', 'http://gooraye.qiniudn.com/2014-05-22_537d4ed9ccf2e.jpg', '2100986f6751d8f8f4d975d88a7f7d1f', 'ef0b84d61f4c8a75393d8e12ff981b6f9559bbf6', 1, 1400721113),
(97, 'http://gooraye.qiniudn.com/2014-05-21_537c65370c8ac.jpg', 'http://gooraye.qiniudn.com/2014-05-21_537c65370c8ac.jpg', 'cd88d445de68b958052705ff8123eeb9', '4466237c9b031ca89802972082ceb4203f7903d2', 1, 1400661303),
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
(60, 'http://gooraye.qiniudn.com/2014-05-14_5372b48d0cb83.png', 'http://gooraye.qiniudn.com/2014-05-14_5372b48d0cb83.png', '3039f5353358f3c938d2fb009c5a87f0', '1aaef4d1b281e0e26defa7dd185f3be0e9af827b', 1, 1400026252),
(73, 'http://gooraye.qiniudn.com/2014-05-15_537475fe643a4.png', 'http://gooraye.qiniudn.com/2014-05-15_537475fe643a4.png', 'c2241b45592b2f46b86f6ae56b2f7d9e', '854330d610b103a0072aada8b1053b5e13aeacd1', 1, 1400141309),
(67, 'http://gooraye.qiniudn.com/2014-05-15_53746df77e327.png', 'http://gooraye.qiniudn.com/2014-05-15_53746df77e327.png', '0a8b0474f0355aca57e19eeecf5ace41', '7e5938dea482ab586d3f8e94bff8f7ddc812e8b3', 1, 1400139255),
(68, 'http://gooraye.qiniudn.com/2014-05-15_53746e8f36b36.png', 'http://gooraye.qiniudn.com/2014-05-15_53746e8f36b36.png', 'a81a56a0abb89fd100acabf76b4af795', '6c86488995a3897c8a5f95bb8416b927dbdea4d9', 1, 1400139406),
(69, 'http://gooraye.qiniudn.com/2014-05-15_53746f12d6a50.png', 'http://gooraye.qiniudn.com/2014-05-15_53746f12d6a50.png', '7720add04552f8de9a0f605c1b9ce424', '0cd8b8bff485183004fcda796fb547599769bc5e', 1, 1400139537),
(70, 'http://gooraye.qiniudn.com/2014-05-15_53746f664d36b.png', 'http://gooraye.qiniudn.com/2014-05-15_53746f664d36b.png', '251ddda671e565aba69e7c68bad5b2ee', '2b76d1d056c3eb83d89699bad5f562bfe382ecef', 1, 1400139622),
(71, 'http://gooraye.qiniudn.com/2014-05-15_537470408aca9.png', 'http://gooraye.qiniudn.com/2014-05-15_537470408aca9.png', '13ea112f18e329198ed89ea04471a1e8', '3fe6c48daafa5a007b78dabdf8c1f8742f16067a', 1, 1400139840),
(72, 'http://gooraye.qiniudn.com/2014-05-15_5374756eaf242.jpg', 'http://gooraye.qiniudn.com/2014-05-15_5374756eaf242.jpg', '0746d915f432cd8af5ce71bfe53b5730', '0764be5fc3962b57626a407b08c3b3ab2353ccfa', 1, 1400141166),
(75, 'http://gooraye.qiniudn.com/2014-05-16_53760dfc0c97c.jpg', 'http://gooraye.qiniudn.com/2014-05-16_53760dfc0c97c.jpg', 'ca14ec9e51e03ab67609e245752386af', '92835875f21119786381accd6b7cb29cf584b792', 1, 1400245756),
(76, 'http://gooraye.qiniudn.com/2014-05-17_5377200a41a5c.jpg', 'http://gooraye.qiniudn.com/2014-05-17_5377200a41a5c.jpg', '86eb34a28323ac22e6bac8c573d6e349', '79e26ddf4961e58fcb9b508b3dd8b77b58b0b21f', 1, 1400315914),
(83, 'http://gooraye.qiniudn.com/2014-05-20_537b165588958.png', 'http://gooraye.qiniudn.com/2014-05-20_537b165588958.png', '94cffd50404be1fd1493e2c42f619ab6', '8db5871ce4248baf02ccdf131f9d4026e4566719', 1, 1400575573),
(85, 'http://gooraye.qiniudn.com/2014-05-20_537b16e2a6a62.jpg', 'http://gooraye.qiniudn.com/2014-05-20_537b16e2a6a62.jpg', 'f6d0c3a80f9fdd9ec3b88becc2e99b54', '6f6a688ddae7f05aebd655194ee22f891bbb5d8f', 1, 1400575714),
(86, 'http://gooraye.qiniudn.com/2014-05-20_537b19c2a53df.png', 'http://gooraye.qiniudn.com/2014-05-20_537b19c2a53df.png', '94cffd50404be1fd1493e2c42f619ab6', '8db5871ce4248baf02ccdf131f9d4026e4566719', 1, 1400576450),
(87, 'http://gooraye.qiniudn.com/2014-05-20_537b19d768829.png', 'http://gooraye.qiniudn.com/2014-05-20_537b19d768829.png', '94cffd50404be1fd1493e2c42f619ab6', '8db5871ce4248baf02ccdf131f9d4026e4566719', 1, 1400576471),
(88, 'http://gooraye.qiniudn.com/2014-05-20_537b19ff917bb.png', 'http://gooraye.qiniudn.com/2014-05-20_537b19ff917bb.png', '94cffd50404be1fd1493e2c42f619ab6', '8db5871ce4248baf02ccdf131f9d4026e4566719', 1, 1400576511),
(89, 'http://gooraye.qiniudn.com/2014-05-20_537b1a6b500e7.png', 'http://gooraye.qiniudn.com/2014-05-20_537b1a6b500e7.png', '46aa20afb6d3415b2b9989316dabafbd', 'dca4ecf3f72c03e1a459a261bf0dafd8659bdd32', 1, 1400576616),
(90, 'http://gooraye.qiniudn.com/2014-05-20_537b1d13d2594.jpg', 'http://gooraye.qiniudn.com/2014-05-20_537b1d13d2594.jpg', '25f9dae249fba5e722c831c2b4cf37ad', 'e7d40601e97974b1d5fe9d0b22f989135ea02800', 1, 1400577299),
(91, 'http://gooraye.qiniudn.com/2014-05-20_537b20a338455.jpg', 'http://gooraye.qiniudn.com/2014-05-20_537b20a338455.jpg', 'b5c1af247f07e95920fee75c15cd1775', '40827ed06a7fa4274c276cf3134f93351d24fcdd', 1, 1400578210),
(96, '/Uploads/Picture/2014-05-21/537c3c5646503.jpg', 'http://gooraye.qiniudn.com/2014-05-21_537c3c5646503.jpg', 'a24d8308b9160d1f08f3089cd9853c8d', 'ba2b3eddfa852bba7d3a211e534a7884eb53dd29', 1, 1400650838),
(100, '/Uploads/Picture/2014-05-22/537dfb5da77f7.jpg', 'http://gooraye.qiniudn.com/2014-05-22_537dfb5da77f7.jpg', '7139197f6b814de1c9cef1af5f13774e', 'e7c90a6402b893b089ce1268a2a7ba22260b1933', 1, 1400765277),
(101, 'http://gooraye.qiniudn.com/2014-05-23_537eb5eed545d.png', 'http://gooraye.qiniudn.com/2014-05-23_537eb5eed545d.png', 'fda8d3943e0502f024bcc98d99a1429f', 'dd321dc4dd383e61e9a444ca392b5b4a9da3e8a8', 1, 1400813038),
(102, 'http://gooraye.qiniudn.com/2014-05-23_537eb792a834c.png', 'http://gooraye.qiniudn.com/2014-05-23_537eb792a834c.png', '36b7d11d690b9ce48f40d50e92559a88', '4bb2c1bc51f79e725730d748cc31a4ffda0468c3', 1, 1400813458),
(103, 'http://gooraye.qiniudn.com/2014-05-23_537eb8c052d59.png', 'http://gooraye.qiniudn.com/2014-05-23_537eb8c052d59.png', '1003a5719adbf9443c0e3c6bd4006924', 'e4a022e2fa8f305a6978b15943ab3577713cfd3b', 1, 1400813760),
(104, 'http://gooraye.qiniudn.com/2014-05-23_537eb9ca73ed8.png', 'http://gooraye.qiniudn.com/2014-05-23_537eb9ca73ed8.png', '4496ea88e4cdc6b14f03c51535b448ad', 'f3e66b3565a66e1ae774e91306c82d023b998fb2', 1, 1400814026),
(105, '/Uploads/Picture/2014-05-23/537ebff4cea7a.png', 'http://gooraye.qiniudn.com/2014-05-23_537ebff4cea7a.png', '7501865b6f1f06f3a581347fca1fbe5a', '8381ccc31724fe4f0ba25cd2372571b2b051ee10', 1, 1400815598),
(106, 'http://gooraye.qiniudn.com/2014-05-23_537ed72468c0b.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ed72468c0b.jpg', '7f89e43fe19c7babff622338b9c81c22', '3fb7913a5432ac5ba94a9bea0bd3cdd947fd260a', 1, 1400821540),
(107, 'http://gooraye.qiniudn.com/2014-05-23_537ed731ce51c.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ed731ce51c.jpg', '21200cdf9572c35d439005a2a3c6cc05', '428d48d794e1abcbfe8ef43c8fc375fde2e7b0f7', 1, 1400821553),
(108, 'http://gooraye.qiniudn.com/2014-05-23_537ed73f00c18.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ed73f00c18.jpg', '333e4b006241f11f3b09d1a4cfbffd0b', 'ca69e0022ac2ccd98c515dc4f07260372846a96d', 1, 1400821566),
(109, '/Uploads/Picture/2014-05-23/537edcf25d26c.png', 'http://gooraye.qiniudn.com/2014-05-23_537edcf25d26c.png', '49f3b973d667da20808803a8f9380e40', 'feacd069046edc6ebe2dfefe36f90dffaa2c7aff', 1, 1400823025),
(110, '/Uploads/Picture/2014-05-23/537edd406113a.png', 'http://gooraye.qiniudn.com/2014-05-23_537edd406113a.png', '5e1b9ead15d55d1f6f781324213cb42b', 'f7fe4f620143f2262b1ea88e36c2ded2aa0c55b0', 1, 1400823103),
(111, '/Uploads/Picture/2014-05-23/537ede4493302.png', 'http://gooraye.qiniudn.com/2014-05-23_537ede4493302.png', 'd25ca2c088450e478192f66bdc9aff20', 'd26a093a1e53ceb2b244eae519d4085afd144c1d', 1, 1400823363),
(112, 'http://gooraye.qiniudn.com/2014-05-23_537ee0ca71697.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee0ca71697.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400824009),
(113, 'http://gooraye.qiniudn.com/2014-05-23_537ee0d35805b.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ee0d35805b.jpg', 'f9545fd9cca442baf9be17f0c6b16599', '45e2b069586e8b0d0f4baad294e1cf5261308532', 1, 1400824018),
(114, 'http://gooraye.qiniudn.com/2014-05-23_537ee0da76c92.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ee0da76c92.jpg', 'eccbfb0480192ed093c8c39dc572cf7d', '6b2fcc9ee7ce547aa343c7ee606fc7ded77edf12', 1, 1400824026),
(115, 'http://gooraye.qiniudn.com/2014-05-23_537ee0e28b4b9.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee0e28b4b9.JPG', 'e7e65c013c6ac50268f5d91abd7cb212', 'a99330c39c57c06073917bfc25936b2954355931', 1, 1400824033),
(116, 'http://gooraye.qiniudn.com/2014-05-23_537ee0f19d5d5.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee0f19d5d5.JPG', 'd6b9b1413013d099e138d34e19501096', '17b66de21eb881b2ee0a6f69da6af4cec4882931', 1, 1400824049),
(117, 'http://gooraye.qiniudn.com/2014-05-23_537ee0fb7f952.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee0fb7f952.JPG', 'b52568ebcf3b0d1b4c655fa98f0cc043', '41c004e78fad26f4870e1efa6df01c0ad9d71982', 1, 1400824059),
(118, 'http://gooraye.qiniudn.com/2014-05-23_537ee1063907b.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee1063907b.JPG', '5afde7c499cd5b7d3ec152e4444bf8e6', '9dc79d3c8469b44c3039e068ae87ccd3e20d4420', 1, 1400824070),
(119, 'http://gooraye.qiniudn.com/2014-05-23_537ee10de1000.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee10de1000.JPG', '520cf6f66f743ed62dd9390c728bd237', 'beb455bc8498cd431799d51013962c9a11685438', 1, 1400824077),
(120, 'http://gooraye.qiniudn.com/2014-05-23_537ee11bd354a.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537ee11bd354a.jpg', 'e3aba2a8c3a97481c7640d2eeee982b2', '431a310a445f8ad600cddce14028d914eabfb584', 1, 1400824090),
(121, 'http://gooraye.qiniudn.com/2014-05-23_537ee4c1e364b.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee4c1e364b.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400825025),
(122, 'http://gooraye.qiniudn.com/2014-05-23_537ee4deaa83c.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee4deaa83c.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400825054),
(123, 'http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400826101),
(124, 'http://gooraye.qiniudn.com/2014-05-23_537ee8ff71665.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ee8ff71665.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400826110),
(125, 'http://gooraye.qiniudn.com/2014-05-23_537eed26bfc85.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537eed26bfc85.JPG', '12087a763928f97a745bf3d416b4bd2f', '6a16e49158236170f5cb6639260857595cc228dc', 1, 1400827174),
(126, 'http://gooraye.qiniudn.com/2014-05-23_537eed469f51e.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537eed469f51e.jpg', 'f9545fd9cca442baf9be17f0c6b16599', '45e2b069586e8b0d0f4baad294e1cf5261308532', 1, 1400827205),
(127, 'http://gooraye.qiniudn.com/2014-05-23_537ef1fe00615.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef1fe00615.JPG', '5e9218455f70e8b421d0ccd233535760', '0126c033c71ba29b620c8c4c9cd96295b2e04eb9', 1, 1400828413),
(128, 'http://gooraye.qiniudn.com/2014-05-23_537ef2626edcc.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef2626edcc.JPG', '9c0e1f632d61c6c5f88bbb0a52367dd1', 'd62ed6f2ffb091392f956c16f0859d4f24f7dddb', 1, 1400828514),
(129, 'http://gooraye.qiniudn.com/2014-05-23_537ef27468a66.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef27468a66.JPG', '059139aa1dacd98c3812698696c88574', 'c9843c4cec3c02936e8821c7380da3ce4d7e94f9', 1, 1400828532),
(130, 'http://gooraye.qiniudn.com/2014-05-23_537ef28398bef.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef28398bef.JPG', '41a57468fd709114481020251969c2e9', '0132f0a5941c4991627a5f76b4d180161a9e8785', 1, 1400828547),
(131, 'http://gooraye.qiniudn.com/2014-05-23_537ef2c60d5ce.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef2c60d5ce.JPG', '8af1caf0d6d59b5adc7439336f64a4a4', 'de6a00864787eb394efb06f75b3b45dd36494f9a', 1, 1400828614),
(132, 'http://gooraye.qiniudn.com/2014-05-23_537ef2d3828dc.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef2d3828dc.JPG', '312eca5e855d73710f48db2943ec10e6', 'af95f3c35405ef35885e82fba765c9a5b887fcfe', 1, 1400828627),
(133, 'http://gooraye.qiniudn.com/2014-05-23_537ef31769e98.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537ef31769e98.JPG', 'af40625f3470131d3895f3005c82769f', '08f44ff4146d8a7e8ad9b12029a1fa5686b66961', 1, 1400828695),
(134, 'http://gooraye.qiniudn.com/2014-05-23_537f0283d98ce.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f0283d98ce.jpg', '15d68f873a8e92fcfd55e7dcfe34e0c6', '6738243ba04fea6e1ff61a2559dffbbb5199764b', 1, 1400832643),
(135, 'http://gooraye.qiniudn.com/2014-05-23_537f028b5f7b4.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f028b5f7b4.jpg', 'f9545fd9cca442baf9be17f0c6b16599', '45e2b069586e8b0d0f4baad294e1cf5261308532', 1, 1400832651),
(136, 'http://gooraye.qiniudn.com/2014-05-23_537f029311d8d.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f029311d8d.jpg', '03e14a595d8e6115878f8725e2f79457', 'bab04395564497da837cc7af67822a813cee2fe6', 1, 1400832658),
(137, 'http://gooraye.qiniudn.com/2014-05-23_537f029a4c71b.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f029a4c71b.JPG', '9a1624eda31304c6346042be0b515a38', 'ec15e22f6518be222fb9ac6e1c39682128494147', 1, 1400832666),
(138, 'http://gooraye.qiniudn.com/2014-05-23_537f02a23e48f.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f02a23e48f.JPG', 'e65fc9848d0d1054d1e7cb0d4b5e700f', 'df1f99563e4166c324d13f287af8e10892386a79', 1, 1400832673),
(139, 'http://gooraye.qiniudn.com/2014-05-23_537f02bf7920e.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f02bf7920e.jpg', 'e3aba2a8c3a97481c7640d2eeee982b2', '431a310a445f8ad600cddce14028d914eabfb584', 1, 1400832701),
(140, 'http://gooraye.qiniudn.com/2014-05-23_537f0334b6aea.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f0334b6aea.JPG', '44bda2345f4451fdd39adb4fbaf8c9cf', '5273f840218e7259a7b40330111793b48f9d2362', 1, 1400832819),
(141, 'http://gooraye.qiniudn.com/2014-05-23_537f033e6cb5f.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f033e6cb5f.JPG', '3f1bd824f33e4f5b12e525500e441bc3', 'a942171f9c9ea9fc00c04d08de571416d29f9fe4', 1, 1400832830),
(142, 'http://gooraye.qiniudn.com/2014-05-23_537f03466d713.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f03466d713.jpg', '7303ed2eebb019075359b65c421f64c1', 'd82affffccea676172464578aa8307d85fd8f5e3', 1, 1400832837),
(143, 'http://gooraye.qiniudn.com/2014-05-23_537f03accc000.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f03accc000.JPG', '8acde8689e6d8619c37f621ffbe31dc3', 'd74640585776f9f6e984ec131f60e3ff01a460e7', 1, 1400832940),
(144, 'http://gooraye.qiniudn.com/2014-05-23_537f03b6bcd0f.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f03b6bcd0f.jpg', '38be3f336f5ff13b2822e47843b4297d', '38febebd9e2ef83f61ac62ba52f9be96db5e2301', 1, 1400832950),
(145, 'http://gooraye.qiniudn.com/2014-05-23_537f03bf36c9a.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f03bf36c9a.JPG', '8acde8689e6d8619c37f621ffbe31dc3', 'd74640585776f9f6e984ec131f60e3ff01a460e7', 1, 1400832959),
(146, 'http://gooraye.qiniudn.com/2014-05-23_537f03c6c3698.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f03c6c3698.JPG', 'b2af565e6692fa3055730af164ee0b00', 'e0286dc053f5bac9830b68f041d3e14debf31a91', 1, 1400832966),
(147, 'http://gooraye.qiniudn.com/2014-05-23_537f03cddffa7.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f03cddffa7.JPG', '16482ba6068a66095861d4832095cc9c', 'ff39cfb007f47f8355d6cf9401c96647e18c3d80', 1, 1400832973),
(148, 'http://gooraye.qiniudn.com/2014-05-23_537f03d634598.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f03d634598.jpg', '5d6bfa72ffd2563094c34f841e9f5a2c', '87f4d2cecade215310a384eb0d095846b996277a', 1, 1400832981),
(149, 'http://gooraye.qiniudn.com/2014-05-23_537f03dd0114e.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f03dd0114e.jpg', 'ccf505c4bbb6f6aa64233d29a1770c3e', '48a05a22780b74898c9ceb802b83d71bc21be666', 1, 1400832988),
(150, 'http://gooraye.qiniudn.com/2014-05-23_537f043fa3755.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f043fa3755.JPG', 'ced198e455ac3e5d81376c7b601be1b9', '2d25389e65c3d152d9aac77e7cf9aa074ab67a58', 1, 1400833087),
(151, 'http://gooraye.qiniudn.com/2014-05-23_537f0448c2b61.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f0448c2b61.JPG', 'ced198e455ac3e5d81376c7b601be1b9', '2d25389e65c3d152d9aac77e7cf9aa074ab67a58', 1, 1400833096),
(152, 'http://gooraye.qiniudn.com/2014-05-23_537f0456dc1aa.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f0456dc1aa.JPG', '4efe17c3c2f4ef4305f45aafa9f33e8c', 'd03a04be5af31da3d3fafbf22c102911d7147627', 1, 1400833110),
(153, 'http://gooraye.qiniudn.com/2014-05-23_537f045d75915.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f045d75915.JPG', '9f598e5d3a9d02e59099f7cd116d3b40', '6d0b22457e8158513c73ed9970a5d4068784e3db', 1, 1400833117),
(154, 'http://gooraye.qiniudn.com/2014-05-23_537f05018a1d3.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f05018a1d3.JPG', 'd64485cadd524dda0e0122b5cc9da532', 'f72bb73cb87a12ae8fb56d3e7205bacb20a83630', 1, 1400833281),
(155, 'http://gooraye.qiniudn.com/2014-05-23_537f0528978d8.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f0528978d8.JPG', 'adbaf13cd27bfcf88b15fba0e3660ac0', '23498409440192e451daa9779de5ef5a32e1af51', 1, 1400833320),
(156, 'http://gooraye.qiniudn.com/2014-05-23_537f052fa3843.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f052fa3843.JPG', 'ea276d7d3767f1eac0b1b3eac2848532', '167b491c7da4b7677065048101351cdb60dc5b85', 1, 1400833327),
(157, 'http://gooraye.qiniudn.com/2014-05-23_537f053611c46.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f053611c46.JPG', 'd64485cadd524dda0e0122b5cc9da532', 'f72bb73cb87a12ae8fb56d3e7205bacb20a83630', 1, 1400833334),
(158, 'http://gooraye.qiniudn.com/2014-05-23_537f05b229f78.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f05b229f78.JPG', 'b2af565e6692fa3055730af164ee0b00', 'e0286dc053f5bac9830b68f041d3e14debf31a91', 1, 1400833458),
(159, 'http://gooraye.qiniudn.com/2014-05-23_537f05da4d606.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f05da4d606.JPG', '44bda2345f4451fdd39adb4fbaf8c9cf', '5273f840218e7259a7b40330111793b48f9d2362', 1, 1400833497),
(160, 'http://gooraye.qiniudn.com/2014-05-23_537f06bca5a1c.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f06bca5a1c.JPG', 'd64485cadd524dda0e0122b5cc9da532', 'f72bb73cb87a12ae8fb56d3e7205bacb20a83630', 1, 1400833724),
(161, 'http://gooraye.qiniudn.com/2014-05-23_537f077ed3445.JPG', 'http://gooraye.qiniudn.com/2014-05-23_537f077ed3445.JPG', 'ced198e455ac3e5d81376c7b601be1b9', '2d25389e65c3d152d9aac77e7cf9aa074ab67a58', 1, 1400833918),
(162, 'http://gooraye.qiniudn.com/2014-05-23_537f078e5124e.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f078e5124e.jpg', '03e14a595d8e6115878f8725e2f79457', 'bab04395564497da837cc7af67822a813cee2fe6', 1, 1400833933),
(163, '/Uploads/Picture/2014-05-23/537f0a48e92ba.jpg', 'http://gooraye.qiniudn.com/2014-05-23_537f0a48e92ba.jpg', '72db7c9ab67558af58714031b94d096e', '74e4c45ccd0f1329ff1ee61582df1ad5da875dff', 1, 1400834632),
(164, '/Uploads/Picture/2014-05-28/53855a4b43f21.jpg', 'http://gooraye.qiniudn.com/2014-05-28_53855a4b43f21.jpg', '29a98a207f7e0c11f653a0c56399dd36', 'dc59bb3dc47c3cc4dbc80146fa14da26b854eec0', 1, 1401248331),
(165, '/Uploads/Picture/2014-05-28/5385ecc216c7e.jpg', 'http://gooraye.qiniudn.com/2014-05-28_5385ecc216c7e.jpg', '6c70cb06c61e42f8d6338b7d453b8910', '359887895fac910337c0499bb6ed714075d37535', 1, 1401285825);

-- --------------------------------------------------------

--
-- 表的结构 `wp_sms_log`
--

CREATE TABLE IF NOT EXISTS `wp_sms_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `cTime` int(10) unsigned NOT NULL COMMENT '发布时间',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `mobiles` varchar(255) NOT NULL COMMENT '接收手机号码'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `wp_sms_log`
--

INSERT INTO `wp_sms_log` (`id`, `title`, `content`, `cTime`, `token`, `mobiles`) VALUES
(1, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401350574, '53705a8fb5564', '13484379290'),
(2, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361345, '53705a8fb5564', '13484379290'),
(3, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361365, '53705a8fb5564', '13484379290'),
(4, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361391, '53705a8fb5564', '13484379290'),
(5, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361404, '53705a8fb5564', '13484379290'),
(6, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361419, '53705a8fb5564', '13484379290'),
(7, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361468, '53705a8fb5564', '13484379290'),
(8, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361583, '53705a8fb5564', '13484379290'),
(9, '在线预约', '姓名：234<br/>联系电话：23432432432423<br/>预约日期：<br/>预约时间：15:00-16:00<br/>特色项目：其它<br/>备注：', 1401361591, '53705a8fb5564', '13484379290'),
(10, '在线预约', '姓名：123<br/>联系电话：1232122222222<br/>预约日期：2014-05-29<br/>预约时间：19:00-20:00<br/>特色项目：其它<br/>备注：', 1401362226, '53705a8fb5564', '13484379290');

-- --------------------------------------------------------

--
-- 表的结构 `wp_suggestions`
--

CREATE TABLE IF NOT EXISTS `wp_suggestions` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `cTime` int(10) NOT NULL COMMENT '创建时间',
  `content` text NOT NULL COMMENT '内容',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wp_suggestions`
--

INSERT INTO `wp_suggestions` (`id`, `cTime`, `content`, `uid`) VALUES
(6, 1400921528, '干部\r\n', 166);

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
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '0' COMMENT '用户状态'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=199 ;

--
-- 转存表中的数据 `wp_ucenter_member`
--

INSERT INTO `wp_ucenter_member` (`id`, `username`, `password`, `email`, `mobile`, `reg_time`, `reg_ip`, `last_login_time`, `last_login_ip`, `update_time`, `status`) VALUES
(1, 'admin', '2c9efefa74f29653d9e4afc24f091d9c', '136799711@qq.com', '', 1399178896, 2130706433, 1401348053, 2130706433, 1399178896, 1),
(161, 'gooraye', 'fc2ae5c202e7799c7dfc911c39496397', '346551990@qq.com', '', 1399193143, 2130706433, 1401349533, 2130706433, 1399193143, 1),
(162, 'spa001', '9de72bee866252f0d16bf970c4d328bd', '123456789@qq.com', '', 1399254104, 2130706433, 1399254141, 2130706433, 1399254104, 1),
(163, 'oQJWet3cxXR84wEa2UDrI08eXjug', 'fc2ae5c202e7799c7dfc911c39496397', '1399643566@weiphp.cn', '', 1399643566, 2061514924, 0, 0, 1399643566, 1),
(164, 'dwyspa', 'fc2ae5c202e7799c7dfc911c39496397', '123456@qq.com', '', 1399721823, 2061514924, 1400832519, 2062312170, 1399721823, 1),
(165, 'oy6EYuNwX9g9u-E-7FQ72-avknmY', 'fc2ae5c202e7799c7dfc911c39496397', '1399722875@weiphp.cn', '', 1399722875, 2362390096, 0, 0, 1399722875, 1),
(166, 'oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8', 'fc2ae5c202e7799c7dfc911c39496397', '1399873840@weiphp.cn', '', 1399873840, 2362390094, 0, 0, 1399873840, 1),
(167, 'oqMIVtwY-VcGBTx-UcxZBONSnz8w', 'fc2ae5c202e7799c7dfc911c39496397', '1399963587@weiphp.cn', '', 1399963587, 2362390089, 0, 0, 1399963587, 1),
(168, 'oQJWetwWiJTbAt2v-3YojPisYtco', 'fc2ae5c202e7799c7dfc911c39496397', '1399963709@weiphp.cn', '', 1399963709, 2362390089, 0, 0, 1399963709, 1),
(169, 'oqMIVt5aLt6bsS8Nnk_DHx5_l0UI', 'fc2ae5c202e7799c7dfc911c39496397', '1399975103@weiphp.cn', '', 1399975103, 2362390089, 0, 0, 1399975103, 1),
(170, 'oqMIVt8M_crLI6QSGLPdFEWFbzyY', 'fc2ae5c202e7799c7dfc911c39496397', '1399976704@weiphp.cn', '', 1399976704, 2362390089, 0, 0, 1399976704, 1),
(171, 'oy6EYuJkX68eZw4kKg0itWYpldFI', 'fc2ae5c202e7799c7dfc911c39496397', '1400116681@weiphp.cn', '', 1400116681, 1709325905, 0, 0, 1400116681, 1),
(172, 'oy6EYuCKFlrQf7VOEtivI1orRtto', 'fc2ae5c202e7799c7dfc911c39496397', '1400136547@weiphp.cn', '', 1400136546, 1709325902, 0, 0, 1400136546, 1),
(173, 'oy6EYuF7hDpVCqVOEcg__t_apL30', 'fc2ae5c202e7799c7dfc911c39496397', '1400142942@weiphp.cn', '', 1400142942, 2362390089, 0, 0, 1400142942, 1),
(174, 'oqMIVt_oECJxAAu_0FHj2E_SPPgM', 'fc2ae5c202e7799c7dfc911c39496397', '1400293930@weiphp.cn', '', 1400293930, 1709325908, 0, 0, 1400293930, 1),
(175, 'oy6EYuDZwyvBcrpuPEA6YpBi1UPw', 'fc2ae5c202e7799c7dfc911c39496397', '1400300355@weiphp.cn', '', 1400300355, 1709325902, 0, 0, 1400300355, 1),
(176, 'oy6EYuMoULbngNQ75_qFOQ5Xt0LI', 'fc2ae5c202e7799c7dfc911c39496397', '1400300724@weiphp.cn', '', 1400300724, 2362390095, 0, 0, 1400300724, 1),
(177, 'oy6EYuLnCC2oaZwJVWcX9pfcxf30', 'fc2ae5c202e7799c7dfc911c39496397', '1400338219@weiphp.cn', '', 1400338218, 2362390096, 0, 0, 1400338218, 1),
(178, 'oqMIVt7zI8x6rfGYLZpT3lFiGmAI', 'fc2ae5c202e7799c7dfc911c39496397', '1400339954@weiphp.cn', '', 1400339954, 2362390096, 0, 0, 1400339954, 1),
(179, 'oqMIVt7ngXJZN5rsv87yZjJhqy9E', 'fc2ae5c202e7799c7dfc911c39496397', '1400346362@weiphp.cn', '', 1400346362, 1709325907, 0, 0, 1400346362, 1),
(180, 'oy6EYuKCAGHK82oZ5-qCsu9B7vCE', 'fc2ae5c202e7799c7dfc911c39496397', '1400480981@gooraye.net', '', 1400480981, 1709325907, 0, 0, 1400480981, 1),
(181, 'oqMIVt0XES04VNcYVGqLUuCamF3s', 'fc2ae5c202e7799c7dfc911c39496397', '1400485394@gooraye.net', '', 1400485393, 1709325902, 0, 0, 1400485393, 1),
(182, 'oqMIVt0YNe0S5wwAIrioHYYXyYqk', 'fc2ae5c202e7799c7dfc911c39496397', '1400492946@gooraye.net', '', 1400492946, 1709325907, 0, 0, 1400492946, 1),
(183, 'oqMIVt7clu56jMAF6FbMcyFK6AN0', 'fc2ae5c202e7799c7dfc911c39496397', '1400497372@gooraye.net', '', 1400497372, 1709325908, 0, 0, 1400497372, 1),
(184, 'oy6EYuFdwdhJAPovIM4gSJh9YAi8', 'fc2ae5c202e7799c7dfc911c39496397', '1400498075@gooraye.net', '', 1400498075, 1709325908, 0, 0, 1400498075, 1),
(185, 'oqMIVt3cx-mLmZFQSmGs1fgilc-8', 'fc2ae5c202e7799c7dfc911c39496397', '1400671058@gooraye.net', '', 1400671058, 1709325907, 0, 0, 1400671058, 1),
(186, 'oy6EYuNeQVx_21eJ-3SH6fD9CM58', 'fc2ae5c202e7799c7dfc911c39496397', '1400825731@gooraye.net', '', 1400825731, 2362390096, 0, 0, 1400825731, 1),
(187, 'oy6EYuHtBxSY6tTI7yCoW5tMLlCI', 'fc2ae5c202e7799c7dfc911c39496397', '1400832212@gooraye.net', '', 1400832212, 1709325903, 0, 0, 1400832212, 1),
(188, 'oy6EYuKFAvo3UvUdhLOSGtgt4qXI', 'fc2ae5c202e7799c7dfc911c39496397', '1400843115@gooraye.net', '', 1400843115, 1709325907, 0, 0, 1400843115, 1),
(189, 'oy6EYuPT1ja1QE3MStteZvLbFti4', 'fc2ae5c202e7799c7dfc911c39496397', '1400843541@gooraye.net', '', 1400843541, 1709325903, 0, 0, 1400843541, 1),
(190, 'oy6EYuDTHv7MOxu9S8U1mGBWdn2U', 'fc2ae5c202e7799c7dfc911c39496397', '1400843551@gooraye.net', '', 1400843551, 2362390089, 0, 0, 1400843551, 1),
(191, 'oy6EYuFeo6fNAR5h8pfC7D6aQSjw', 'fc2ae5c202e7799c7dfc911c39496397', '1400844077@gooraye.net', '', 1400844077, 1709325905, 0, 0, 1400844077, 1),
(192, 'oy6EYuK5LXR5t8OaF7PsizJ9xgfI', 'fc2ae5c202e7799c7dfc911c39496397', '1400844731@gooraye.net', '', 1400844730, 1709325908, 0, 0, 1400844730, 1),
(193, 'oy6EYuLAi1geWRhPF1MwbJUMw3vQ', 'fc2ae5c202e7799c7dfc911c39496397', '1400853112@gooraye.net', '', 1400853112, 1709325908, 0, 0, 1400853112, 1),
(194, 'oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg', 'fc2ae5c202e7799c7dfc911c39496397', '1400857256@gooraye.net', '', 1400857256, 2362390089, 0, 0, 1400857256, 1),
(195, 'oy6EYuKrWy75anIQDmV5w2xFIa6Y', 'fc2ae5c202e7799c7dfc911c39496397', '1400866706@gooraye.net', '', 1400866706, 1709325907, 0, 0, 1400866706, 1),
(196, 'oy6EYuCy_yBNSheA6xZAkwOxe8KY', 'fc2ae5c202e7799c7dfc911c39496397', '1400910908@gooraye.net', '', 1400910907, 1709325902, 0, 0, 1400910907, 1),
(197, 'oy6EYuN_s7WETZ_iBOI_63Eyg0vk', 'fc2ae5c202e7799c7dfc911c39496397', '1400910939@gooraye.net', '', 1400910939, 2362390096, 0, 0, 1400910939, 1),
(198, 'oy6EYuEGhruqaxHTB_l5j59mZNTs', 'fc2ae5c202e7799c7dfc911c39496397', '1401017481@gooraye.net', '', 1401017480, 2362390089, 0, 0, 1401017480, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `wp_weisite_category`
--

INSERT INTO `wp_weisite_category` (`id`, `title`, `icon`, `url`, `is_show`, `token`, `sort`, `imgurl`) VALUES
(1, '微官网', 42, '', 1, '53663a115a861', 0, ''),
(2, '相册展示', 49, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/lists/cate_id/2.html', 1, '536e0fac9c2c6', 2, ''),
(3, '企业简介', 64, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2.html', 1, '536e0fac9c2c6', 1, ''),
(4, '服务项目', 75, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/lists/cate_id/4.html', 1, '536e0fac9c2c6', 3, ''),
(5, '在线预约', 101, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index', 1, '536e0fac9c2c6', 6, ''),
(6, '优惠活动', 104, 'http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/15.html', 1, '536e0fac9c2c6', 5, ''),
(7, '联系我们', 103, 'tel:0575-85060707', 1, '536e0fac9c2c6', 4, '');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `wp_weisite_footer`
--

INSERT INTO `wp_weisite_footer` (`id`, `url`, `title`, `pid`, `sort`, `token`, `icon`) VALUES
(1, 'http://www.gooraye.com', '公司主页', 0, 1, '53663a115a861', 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `wp_weisite_slideshow`
--

INSERT INTO `wp_weisite_slideshow` (`id`, `title`, `img`, `url`, `is_show`, `sort`, `token`, `imgurl`) VALUES
(1, '古睿', 42, '', 1, 0, '53663a115a861', ''),
(12, '', 116, '', 1, 0, '536e0fac9c2c6', ''),
(11, '', 115, '', 1, 0, '536e0fac9c2c6', ''),
(9, '', 113, '', 1, 0, '536e0fac9c2c6', ''),
(8, '', 112, '', 1, 0, '536e0fac9c2c6', ''),
(13, '', 117, '', 1, 0, '536e0fac9c2c6', ''),
(14, '', 118, '', 1, 0, '536e0fac9c2c6', ''),
(15, '', 119, '', 1, 0, '536e0fac9c2c6', ''),
(16, '', 120, '', 1, 0, '536e0fac9c2c6', '');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2172 ;

--
-- 转存表中的数据 `wp_weixin_log`
--

INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(1588, 1400770748, '2014-05-22 22:59:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400770746";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"笑话";s:5:"MsgId";s:19:"6016264543463927870";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400770746</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[笑话]]></Content>\n<MsgId>6016264543463927870</MsgId>\n</xml>'),
(1589, 1400770748, '2014-05-22 22:59:08', '', 'joke'),
(1590, 1400770748, '2014-05-22 22:59:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA["小赵独身，父母又不在身边，一个人住难免提心吊胆，常担心梁上君子光顾。于是想出一招，每晚临睡前放二百元在窃贼容易找到的地方，并写一纸条：朋友，知道你大驾光临，本该厚礼相赠，但我身为打工一族，心有余而力不足，只能略备薄金，请笑纳。为示诚意，教你一招。干你这行，要研究各种防盗门，确保手到门开。防盗门越高级，说明主人越富，像我这样连防盗门都没有的，还是少费力气。建议你多去富人区走走，定有收获。不久小赵出差一周，回来大吃一惊，桌上的二百元竟变成三百元，另有一纸条写着：“承蒙指点，果然收获颇丰，一百元湖息费，请笑纳！梁上君子。”环顾室内，竟丝毫无犯。小赵感叹：盗亦有道啊！"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400770748</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1591, 1400770774, '2014-05-22 22:59:34', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400770773";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400770773</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1592, 1400770774, '2014-05-22 22:59:34', '笑话', 'click'),
(1593, 1400770774, '2014-05-22 22:59:34', '', 'joke'),
(1594, 1400770774, '2014-05-22 22:59:34', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400770774</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1595, 1400807398, '2014-05-23 09:09:58', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400807398";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400807398</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(1596, 1400807398, '2014-05-23 09:09:58', '天气', 'click'),
(1597, 1400807398, '2014-05-23 09:09:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400807398</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1598, 1400807401, '2014-05-23 09:10:01', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400807401";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400807401</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1599, 1400807401, '2014-05-23 09:10:01', '笑话', 'click'),
(1600, 1400807401, '2014-05-23 09:10:01', '0', 'joke'),
(1601, 1400807401, '2014-05-23 09:10:01', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400807401</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1602, 1400807449, '2014-05-23 09:10:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400807449";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400807449</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1603, 1400808361, '2014-05-23 09:26:01', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808361";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808361</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1604, 1400808361, '2014-05-23 09:26:01', 'Card', 'click'),
(1605, 1400808361, '2014-05-23 09:26:01', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808361</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1606, 1400808365, '2014-05-23 09:26:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808364";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808364</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1607, 1400808419, '2014-05-23 09:26:59', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808418";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808418</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1608, 1400808429, '2014-05-23 09:27:09', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808429";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808429</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1609, 1400808429, '2014-05-23 09:27:09', '建议意见', 'click'),
(1610, 1400808429, '2014-05-23 09:27:09', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808429</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1611, 1400808494, '2014-05-23 09:28:14', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808494";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808494</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(1612, 1400808494, '2014-05-23 09:28:14', '天气', 'click'),
(1613, 1400808494, '2014-05-23 09:28:14', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808494</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1614, 1400808510, '2014-05-23 09:28:30', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808509";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808509</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1615, 1400808510, '2014-05-23 09:28:30', '建议意见', 'click'),
(1616, 1400808510, '2014-05-23 09:28:30', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808510</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1617, 1400808566, '2014-05-23 09:29:26', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808565";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808565</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1618, 1400808566, '2014-05-23 09:29:26', '笑话', 'click'),
(1619, 1400808566, '2014-05-23 09:29:26', '0', 'joke'),
(1620, 1400808566, '2014-05-23 09:29:26', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808566</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1621, 1400808652, '2014-05-23 09:30:52', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808652";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808652</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1622, 1400808652, '2014-05-23 09:30:52', '笑话', 'click'),
(1623, 1400808653, '2014-05-23 09:30:53', '"某高校为申办211工程大搞＂文明校园＂建设,规定大学生不许谈恋爱,学生处的教师每晚都出动巡逻,逮捕了60多对恋爱的学生.一天,计算机系的一对在校园内拥抱亲吻被当场擒获.学生处的同志们刚想亮出逮捕证,那女生说:＂别急,我们在研究技术问题!＂老师:＂什么问题?＂女生:＂接口问题＂老师:＂...＂"', 'joke'),
(1624, 1400808653, '2014-05-23 09:30:53', '<?xml version="1.0"?>\n<xml><Content><![CDATA["某高校为申办211工程大搞＂文明校园＂建设,规定大学生不许谈恋爱,学生处的教师每晚都出动巡逻,逮捕了60多对恋爱的学生.一天,计算机系的一对在校园内拥抱亲吻被当场擒获.学生处的同志们刚想亮出逮捕证,那女生说:＂别急,我们在研究技术问题!＂老师:＂什么问题?＂女生:＂接口问题＂老师:＂...＂"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808652</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1625, 1400808653, '2014-05-23 09:30:53', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808652</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1626, 1400808702, '2014-05-23 09:31:42', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808702";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808702</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1627, 1400808702, '2014-05-23 09:31:42', '笑话', 'click'),
(1628, 1400808702, '2014-05-23 09:31:42', '"曾经在大学期间恋爱过，现在已经步入中年的一对儿男女在大学同学会上见面了。 男：最近好吗？ 女：有一个好消息和一个坏消息。 男：什么坏消息？ 女：前几天我做了输卵管手术。 男：真是的！那现在还好吧。 女：嗯。 男：你说还有个好消息？ 女：是，不知道你还记得不记得，在大学的时候你曾经把戒指丢了。 男：记得。 女：手术的时候找到了。"', 'joke'),
(1629, 1400808702, '2014-05-23 09:31:42', '<?xml version="1.0"?>\n<xml><Content><![CDATA["曾经在大学期间恋爱过，现在已经步入中年的一对儿男女在大学同学会上见面了。 男：最近好吗？ 女：有一个好消息和一个坏消息。 男：什么坏消息？ 女：前几天我做了输卵管手术。 男：真是的！那现在还好吧。 女：嗯。 男：你说还有个好消息？ 女：是，不知道你还记得不记得，在大学的时候你曾经把戒指丢了。 男：记得。 女：手术的时候找到了。"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808702</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1630, 1400808702, '2014-05-23 09:31:42', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808702</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1631, 1400808709, '2014-05-23 09:31:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808709";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808709</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1632, 1400808716, '2014-05-23 09:31:56', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400808715";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400808715</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1633, 1400808716, '2014-05-23 09:31:56', 'Card', 'click'),
(1634, 1400808716, '2014-05-23 09:31:56', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808716</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1635, 1400808743, '2014-05-23 09:32:23', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808742";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808742</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1636, 1400808743, '2014-05-23 09:32:23', '笑话', 'click'),
(1637, 1400808743, '2014-05-23 09:32:23', '', 'jok_key'),
(1638, 1400808743, '2014-05-23 09:32:23', '0', 'joke'),
(1639, 1400808743, '2014-05-23 09:32:23', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808743</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1640, 1400808817, '2014-05-23 09:33:37', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808816";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808816</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1641, 1400808817, '2014-05-23 09:33:37', '笑话', 'click'),
(1642, 1400808817, '2014-05-23 09:33:37', '<?xml version="1.0"?>\n<xml><Content><![CDATA["我曾经什么都有：金钱，地位，权利，情人。但是，这一切都被我老婆发现了……"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808817</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1643, 1400808817, '2014-05-23 09:33:37', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808817</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1644, 1400808825, '2014-05-23 09:33:45', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808825";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808825</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1645, 1400808825, '2014-05-23 09:33:45', '笑话', 'click'),
(1646, 1400808825, '2014-05-23 09:33:45', '<?xml version="1.0"?>\n<xml><Content><![CDATA["小毛上幼儿园了，有一天，老师问：谁知道世界上有多少个国家啊？ 小毛说：我知道！ 老师说：那你说说都有哪些国家。 小毛说：有两个国家，就是中国和外国！"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808825</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1647, 1400808825, '2014-05-23 09:33:45', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808825</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1648, 1400808869, '2014-05-23 09:34:29', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808868";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808868</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1649, 1400808961, '2014-05-23 09:36:01', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400808961";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"服务";s:5:"MsgId";s:19:"6016428675639145502";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400808961</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[服务]]></Content>\n<MsgId>6016428675639145502</MsgId>\n</xml>'),
(1650, 1400808961, '2014-05-23 09:36:01', '<?xml version="1.0"?>\n<xml><ArticleCount>6</ArticleCount><Articles><item><Title><![CDATA[五行经络刷]]></Title><Description><![CDATA[五行经络刷可以快速疏通身体各部位的淋巴管及经络，让身体里的游离脂肪归位，进而起到减肥和美容的效果。弹力凸点形成细小间隔挤压消脂，打散坚硬脂肪，非常有效地消除橘皮组织。配合适当的力度，搭配适当的精油，可以通经络使毒素废物不再淤塞堆积。 有效结合中医五行学，推测使用者身体健康值。可以达到事半功倍的减肥效果和经络疏通。]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-20_537b19ff917bb.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/5.html]]></Url></item><item><Title><![CDATA[SPA能量热石]]></Title><Description><![CDATA[热石疗法的起源：巧妙运用火山能量的另类疗法\r\n]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-22_537d4ed9ccf2e.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/6.html]]></Url></item><item><Title><![CDATA[中药舒缓排毒护理 ]]></Title><Description><![CDATA[这款是我们店的放松款，当你长期透支，疲劳，失眠，力不从心的时候，可以让您全身放松，疏通全身经络，促进血液循环，改善睡眠，让您感受全身心的洗礼。]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-20_537b165588958.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/8.html]]></Url></item><item><Title><![CDATA[生命能量药泥护理 ]]></Title><Description><![CDATA[这款是我们店的治疗款。]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-20_537b19c2a53df.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/9.html]]></Url></item><item><Title><![CDATA[巴厘岛热石按摩 ]]></Title><Description><![CDATA[这款是在我们店里598项目上追加巴厘岛SPA热石]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-20_537b16e2a6a62.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/10.html]]></Url></item><item><Title><![CDATA[皇家养生舒活护理 ]]></Title><Description><![CDATA[这款是在我们店里880项目上追加五行经络导引刷]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-20_537b19d768829.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/custom_reply/_controller/custom_reply/_action/detail/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/id/11.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400808961</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1651, 1400809942, '2014-05-23 09:52:22', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400809941";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400809941</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1652, 1400809954, '2014-05-23 09:52:34', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400809953";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微官网";s:5:"MsgId";s:19:"6016432936246703207";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400809953</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微官网]]></Content>\n<MsgId>6016432936246703207</MsgId>\n</xml>'),
(1653, 1400809954, '2014-05-23 09:52:34', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[点击进入首页2]]></Title><Description><![CDATA[戴维营成立于1982年，是一家集养生，SPA健康产业、酒店、贸易等为一体的跨国连锁机构。戴维营秉承优质的健康理念，提供高档次、高水准平的环境设施和保健服务。红木、沉香、古玩的点缀使得任何一家分公司都体现出浓厚的中国古典韵味和艺术氛围，是现代人士品古论今、放松身心、养生健体的聚会场所。 位于柯桥世贸中心的戴维营SPA会所，是戴维营的升级之作，全新形象，全新灵魂。带来不一样的全新休闲感受。会所优选东方古老养生法有机护理产品，结合技师精湛的技艺，将养生美颜提升到科学、内外兼施的至高境界。设计师从中国传统文化中摄取设计灵感，打造出一处自然雅致，静谧和谐的休闲空间，带给人心灵的感动。]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-14_5372b48d0cb83.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400809954</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1654, 1400810671, '2014-05-23 10:04:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400810670";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400810670</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1655, 1400810709, '2014-05-23 10:05:09', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400810708";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400810708</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1656, 1400811667, '2014-05-23 10:21:07', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400811666";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400811666</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1657, 1400811668, '2014-05-23 10:21:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400811667";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400811667</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1658, 1400812024, '2014-05-23 10:27:04', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812024";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812024</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1659, 1400812175, '2014-05-23 10:29:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812174";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812174</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1660, 1400812465, '2014-05-23 10:34:25', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812461";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812461</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1661, 1400812465, '2014-05-23 10:34:25', '建议意见', 'click'),
(1662, 1400812465, '2014-05-23 10:34:25', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400812465</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1663, 1400812700, '2014-05-23 10:38:20', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812699";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812699</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1664, 1400812700, '2014-05-23 10:38:20', '建议意见', 'click'),
(1665, 1400812700, '2014-05-23 10:38:20', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400812700</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1666, 1400812736, '2014-05-23 10:38:56', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812735";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812735</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1667, 1400812736, '2014-05-23 10:38:56', '建议意见', 'click'),
(1668, 1400812736, '2014-05-23 10:38:56', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/dwy_QQ%E5%9B%BE%E7%89%8720140523103317.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400812736</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1669, 1400812799, '2014-05-23 10:39:59', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400812797";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400812797</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1670, 1400812799, '2014-05-23 10:39:59', '建议意见', 'click'),
(1671, 1400812799, '2014-05-23 10:39:59', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/dwy_QQ%E5%9B%BE%E7%89%8720140523103317.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400812799</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1672, 1400813048, '2014-05-23 10:44:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400813047";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400813047</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1673, 1400813504, '2014-05-23 10:51:44', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400813504";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400813504</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1674, 1400813527, '2014-05-23 10:52:07', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400813526";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400813526</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1675, 1400813866, '2014-05-23 10:57:46', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400813865";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400813865</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1676, 1400813871, '2014-05-23 10:57:51', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400813870";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400813870</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1677, 1400813871, '2014-05-23 10:57:51', 'Card', 'click'),
(1678, 1400813871, '2014-05-23 10:57:51', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuJkX68eZw4kKg0itWYpldFI.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400813871</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1679, 1400815518, '2014-05-23 11:25:18', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400815518";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400815518</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1680, 1400815541, '2014-05-23 11:25:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400815541";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400815541</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1681, 1400817256, '2014-05-23 11:54:16', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817254";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817254</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(1682, 1400817319, '2014-05-23 11:55:19', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817318";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817318</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1683, 1400817319, '2014-05-23 11:55:19', '笑话', 'click'),
(1684, 1400817319, '2014-05-23 11:55:19', '<?xml version="1.0"?>\n<xml><Content><![CDATA["尼克州长参观疯人院时，见一个疯子把自己悬在房梁上，还发出“哈哈”的怪笑声，便问另一个疯子：“他干吗要这样！”“他把自己当成吊灯了。”“咳，你们医院也真不负责，为什么不提醒他，让他下来呢？”“那可不行。他要是下来了，就没了吊灯，四周不成了漆黑一片了吗？”"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817319</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1685, 1400817319, '2014-05-23 11:55:19', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817319</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1686, 1400817349, '2014-05-23 11:55:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817348";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817348</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1687, 1400817349, '2014-05-23 11:55:49', '笑话', 'click'),
(1688, 1400817349, '2014-05-23 11:55:49', '<?xml version="1.0"?>\n<xml><Content><![CDATA["老师：“彼得，你为什么老是把一只耳朵捂住？”彼得：“你不是说，我在听课时，总是一只耳朵进，一只耳朵出吗？我堵的是出的耳朵。”"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817349</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1689, 1400817349, '2014-05-23 11:55:49', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817349</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1690, 1400817370, '2014-05-23 11:56:10', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817369";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817369</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1691, 1400817371, '2014-05-23 11:56:11', '笑话', 'click'),
(1692, 1400817371, '2014-05-23 11:56:11', '<?xml version="1.0"?>\n<xml><Content><![CDATA["一个小伙于向姑娘求婚，姑娘说：“不过，我们相识才三天呐，你了解我吗？”小伙子急忙说：“了解，了解，我早就了解你了。”“是吗？”“是的，我在银行工作三年了，你父亲有多少存款，我是很清楚的。”"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817370</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1693, 1400817371, '2014-05-23 11:56:11', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817370</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1694, 1400817382, '2014-05-23 11:56:22', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817381";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817381</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1695, 1400817382, '2014-05-23 11:56:22', '笑话', 'click'),
(1696, 1400817382, '2014-05-23 11:56:22', '<?xml version="1.0"?>\n<xml><Content><![CDATA["一僧患大氣脬﹐請醫治之。醫曰﹕“此症他人患之便可醫﹐惟你出家人最難治。”問何以故﹐答曰﹕“這個大脬內﹐都是徒弟們的屁在裡面。”"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817382</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1697, 1400817382, '2014-05-23 11:56:22', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817382</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1698, 1400817393, '2014-05-23 11:56:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400817393";s:7:"MsgType";s:4:"text";s:7:"Content";s:13:"天气 绍兴";s:5:"MsgId";s:19:"6016464890803385824";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400817393</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气 绍兴]]></Content>\n<MsgId>6016464890803385824</MsgId>\n</xml>'),
(1699, 1400817393, '2014-05-23 11:56:33', 'a:5:{i:0;a:4:{s:5:"Title";s:25:"天气 绍兴天气预报";s:11:"Description";s:0:"";s:6:"PicUrl";s:0:"";s:3:"Url";s:0:"";}i:1;a:4:{s:5:"Title";s:64:"周五(今天, 实时：25℃)\n多云 东南风3-4级 27 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/duoyun.png";s:3:"Url";s:0:"";}i:2;a:4:{s:5:"Title";s:31:"周六\n多云 微风 31 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/duoyun.png";s:3:"Url";s:0:"";}i:3;a:4:{s:5:"Title";s:34:"周日\n雷阵雨 微风 32 ~ 22℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:57:"http://api.map.baidu.com/images/weather/day/leizhenyu.png";s:3:"Url";s:0:"";}i:4;a:4:{s:5:"Title";s:31:"周一\n阵雨 微风 27 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}}', 'getWeatherInfo'),
(1700, 1400817393, '2014-05-23 11:56:33', '<?xml version="1.0"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[天气 绍兴天气预报]]></Title><Description></Description><PicUrl></PicUrl><Url></Url></item><item><Title><![CDATA[周五(今天, 实时：25℃)\n多云 东南风3-4级 27 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周六\n多云 微风 31 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周日\n雷阵雨 微风 32 ~ 22℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/leizhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周一\n阵雨 微风 27 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400817393</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1701, 1400821606, '2014-05-23 13:06:46', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400821604";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400821604</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1702, 1400822447, '2014-05-23 13:20:47', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400822447";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400822447</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1703, 1400822447, '2014-05-23 13:20:47', 'Card', 'click'),
(1704, 1400822447, '2014-05-23 13:20:47', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400822447</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1705, 1400822476, '2014-05-23 13:21:16', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400822476";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400822476</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1706, 1400822481, '2014-05-23 13:21:21', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400822480";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400822480</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1707, 1400823696, '2014-05-23 13:41:36', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400823696";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400823696</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1708, 1400824079, '2014-05-23 13:47:59', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400824079";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400824079</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1709, 1400825243, '2014-05-23 14:07:23', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825242";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016498602001692477";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825242</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016498602001692477</MsgId>\n</xml>'),
(1710, 1400825255, '2014-05-23 14:07:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825255";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"ff";s:5:"MsgId";s:19:"6016498657836267328";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825255</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ff]]></Content>\n<MsgId>6016498657836267328</MsgId>\n</xml>'),
(1711, 1400825255, '2014-05-23 14:07:35', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825255</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1712, 1400825261, '2014-05-23 14:07:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825261";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"相册";s:5:"MsgId";s:19:"6016498683606071106";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825261</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[相册]]></Content>\n<MsgId>6016498683606071106</MsgId>\n</xml>'),
(1713, 1400825261, '2014-05-23 14:07:41', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825261</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1714, 1400825271, '2014-05-23 14:07:51', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825268";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"卫星测";s:5:"MsgId";s:19:"6016498713670842181";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825268</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[卫星测]]></Content>\n<MsgId>6016498713670842181</MsgId>\n</xml>'),
(1715, 1400825271, '2014-05-23 14:07:51', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825271</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1716, 1400825325, '2014-05-23 14:08:45', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825324";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"ff";s:5:"MsgId";s:19:"6016498954189010764";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825324</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ff]]></Content>\n<MsgId>6016498954189010764</MsgId>\n</xml>'),
(1717, 1400825325, '2014-05-23 14:08:45', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825325</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1718, 1400825345, '2014-05-23 14:09:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825345";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825345</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1719, 1400825345, '2014-05-23 14:09:05', '笑话', 'click'),
(1720, 1400825348, '2014-05-23 14:09:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA["一个被汽车撞伤的人两天都没有苏醒过来。到了第三天，他才缓缓地睁开眼睛。他看看四周，含糊不清地问：“我这是在天堂吗？”“不，亲爱的。你只是在它附近呆了一会儿。”妻子回答。"]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825345</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1721, 1400825348, '2014-05-23 14:09:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825345</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1722, 1400825355, '2014-05-23 14:09:15', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825355";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"pp";s:5:"MsgId";s:19:"6016499087332996944";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825355</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[pp]]></Content>\n<MsgId>6016499087332996944</MsgId>\n</xml>'),
(1723, 1400825355, '2014-05-23 14:09:15', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825355</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1724, 1400825360, '2014-05-23 14:09:20', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825360";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"泥马";s:5:"MsgId";s:19:"6016499108807833426";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825360</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[泥马]]></Content>\n<MsgId>6016499108807833426</MsgId>\n</xml>'),
(1725, 1400825360, '2014-05-23 14:09:20', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825360</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1726, 1400825440, '2014-05-23 14:10:40', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825440";s:7:"MsgType";s:4:"text";s:7:"Content";s:13:"天气 温州";s:5:"MsgId";s:19:"6016499452405217119";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825440</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气 温州]]></Content>\n<MsgId>6016499452405217119</MsgId>\n</xml>'),
(1727, 1400825440, '2014-05-23 14:10:40', 'a:5:{i:0;a:4:{s:5:"Title";s:25:"天气 温州天气预报";s:11:"Description";s:0:"";s:6:"PicUrl";s:0:"";s:3:"Url";s:0:"";}i:1;a:4:{s:5:"Title";s:64:"周五(今天, 实时：20℃)\n阵雨 东南风4-5级 22 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}i:2;a:4:{s:5:"Title";s:46:"周六\n阵雨转阴 东南风3-4级 26 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}i:3;a:4:{s:5:"Title";s:49:"周日\n雷阵雨转中雨 南风3-4级 29 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:57:"http://api.map.baidu.com/images/weather/day/leizhenyu.png";s:3:"Url";s:0:"";}i:4;a:4:{s:5:"Title";s:37:"周一\n阵雨 北风3-4级 29 ~ 22℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}}', 'getWeatherInfo'),
(1728, 1400825441, '2014-05-23 14:10:41', '<?xml version="1.0"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[天气 温州天气预报]]></Title><Description></Description><PicUrl></PicUrl><Url></Url></item><item><Title><![CDATA[周五(今天, 实时：20℃)\n阵雨 东南风4-5级 22 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周六\n阵雨转阴 东南风3-4级 26 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周日\n雷阵雨转中雨 南风3-4级 29 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/leizhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周一\n阵雨 北风3-4级 29 ~ 22℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825440</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1729, 1400825549, '2014-05-23 14:12:29', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825549";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"ff";s:5:"MsgId";s:19:"6016499920556652393";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825549</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[ff]]></Content>\n<MsgId>6016499920556652393</MsgId>\n</xml>'),
(1730, 1400825550, '2014-05-23 14:12:30', '14', 'opens'),
(1731, 1400825550, '2014-05-23 14:12:30', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825549</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1732, 1400825555, '2014-05-23 14:12:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825555";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"r";s:5:"MsgId";s:19:"6016499946326456171";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825555</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[r]]></Content>\n<MsgId>6016499946326456171</MsgId>\n</xml>'),
(1733, 1400825555, '2014-05-23 14:12:35', '14', 'opens'),
(1734, 1400825555, '2014-05-23 14:12:35', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825555</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1735, 1400825731, '2014-05-23 14:15:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNeQVx_21eJ-3SH6fD9CM58";s:10:"CreateTime";s:10:"1400825731";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNeQVx_21eJ-3SH6fD9CM58]]></FromUserName>\n<CreateTime>1400825731</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1736, 1400825731, '2014-05-23 14:15:31', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuNeQVx_21eJ-3SH6fD9CM58]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825731</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1737, 1400825998, '2014-05-23 14:19:58', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400825998";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"f";s:5:"MsgId";s:19:"6016501848996968342";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400825998</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[f]]></Content>\n<MsgId>6016501848996968342</MsgId>\n</xml>'),
(1738, 1400825998, '2014-05-23 14:19:58', '15', 'opens'),
(1739, 1400825998, '2014-05-23 14:19:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[Love]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400825998</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1740, 1400826008, '2014-05-23 14:20:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400826005";s:7:"MsgType";s:4:"text";s:7:"Content";s:3:"有";s:5:"MsgId";s:19:"6016501879061739416";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400826005</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[有]]></Content>\n<MsgId>6016501879061739416</MsgId>\n</xml>'),
(1741, 1400826009, '2014-05-23 14:20:09', '15', 'opens'),
(1742, 1400826009, '2014-05-23 14:20:09', '<?xml version="1.0"?>\n<xml><Content><![CDATA[哦]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400826008</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1743, 1400826015, '2014-05-23 14:20:15', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400826015";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"来个笑话";s:5:"MsgId";s:19:"6016501922011412378";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400826015</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[来个笑话]]></Content>\n<MsgId>6016501922011412378</MsgId>\n</xml>'),
(1744, 1400826016, '2014-05-23 14:20:16', '15', 'opens'),
(1745, 1400826016, '2014-05-23 14:20:16', '<?xml version="1.0"?>\n<xml><Content><![CDATA[水饺是男生还是女生答案男生因为水饺有包皮]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400826015</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1746, 1400826034, '2014-05-23 14:20:34', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400826034";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"来个笑话";s:5:"MsgId";s:19:"6016502003615791004";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400826034</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[来个笑话]]></Content>\n<MsgId>6016502003615791004</MsgId>\n</xml>'),
(1747, 1400826034, '2014-05-23 14:20:34', '15', 'opens'),
(1748, 1400826036, '2014-05-23 14:20:36', '<?xml version="1.0"?>\n<xml><Content><![CDATA[甲：我买的是真药，进了监狱，为什么？已：过期的药。甲：不对。已：农药。甲：不对。已：假药。甲：笨蛋！是炸药！]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400826034</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1749, 1400826109, '2014-05-23 14:21:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNeQVx_21eJ-3SH6fD9CM58";s:10:"CreateTime";s:10:"1400826107";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNeQVx_21eJ-3SH6fD9CM58]]></FromUserName>\n<CreateTime>1400826107</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1750, 1400826122, '2014-05-23 14:22:02', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNeQVx_21eJ-3SH6fD9CM58";s:10:"CreateTime";s:10:"1400826122";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNeQVx_21eJ-3SH6fD9CM58]]></FromUserName>\n<CreateTime>1400826122</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1751, 1400826127, '2014-05-23 14:22:07', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400826125";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016502394457814947";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400826125</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016502394457814947</MsgId>\n</xml>'),
(1752, 1400826127, '2014-05-23 14:22:07', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[大厅]]></Title><Description><![CDATA[大厅]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/pid/0.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400826127</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1753, 1400826274, '2014-05-23 14:24:34', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400826274";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016503034407942058";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400826274</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016503034407942058</MsgId>\n</xml>'),
(1754, 1400826274, '2014-05-23 14:24:34', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[大厅]]></Title><Description><![CDATA[大厅]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/pid/0.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400826274</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1755, 1400827246, '2014-05-23 14:40:46', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400827246";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"大厅";s:5:"MsgId";s:19:"6016507209116153843";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400827246</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[大厅]]></Content>\n<MsgId>6016507209116153843</MsgId>\n</xml>'),
(1756, 1400827247, '2014-05-23 14:40:47', '15', 'opens'),
(1757, 1400827247, '2014-05-23 14:40:47', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400827246</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1758, 1400827263, '2014-05-23 14:41:03', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400827261";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016507273540663285";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400827261</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016507273540663285</MsgId>\n</xml>'),
(1759, 1400827263, '2014-05-23 14:41:03', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[大厅]]></Title><Description><![CDATA[大厅]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/pid/0.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400827263</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1760, 1400827467, '2014-05-23 14:44:27', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400827467";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016508158303926273";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400827467</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016508158303926273</MsgId>\n</xml>'),
(1761, 1400827467, '2014-05-23 14:44:27', 'a:9:{s:2:"id";s:1:"5";s:7:"keyword";s:9:"微相册";s:5:"title";s:6:"大厅";s:5:"intro";s:6:"大厅";s:5:"cover";s:3:"123";s:5:"cTime";s:10:"1400826104";s:5:"token";s:13:"536e0fac9c2c6";s:7:"visible";s:1:"0";s:4:"sord";s:1:"0";}', '123'),
(1762, 1400827467, '2014-05-23 14:44:27', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[大厅]]></Title><Description><![CDATA[大厅]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/pid/0.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400827467</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1763, 1400827603, '2014-05-23 14:46:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400827602";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微相册";s:5:"MsgId";s:19:"6016508738124511244";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400827602</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微相册]]></Content>\n<MsgId>6016508738124511244</MsgId>\n</xml>'),
(1764, 1400827603, '2014-05-23 14:46:43', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[大厅]]></Title><Description><![CDATA[大厅]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/2014-05-23_537ee8f5ec611.JPG]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/photo/_controller/photo/_action/photoview/token/536e0fac9c2c6/openid/oy6EYuNwX9g9u-E-7FQ72-avknmY/pid/5.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400827603</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1765, 1400828725, '2014-05-23 15:05:25', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828724";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828724</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1766, 1400828735, '2014-05-23 15:05:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828734";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828734</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1767, 1400828741, '2014-05-23 15:05:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828740";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828740</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1768, 1400828748, '2014-05-23 15:05:48', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828748";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828748</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1769, 1400828754, '2014-05-23 15:05:54', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828754";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828754</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1770, 1400828760, '2014-05-23 15:06:00', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828760";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828760</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1771, 1400828765, '2014-05-23 15:06:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828765";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828765</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1772, 1400828768, '2014-05-23 15:06:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828768";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828768</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(1773, 1400828917, '2014-05-23 15:08:37', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400828917";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400828917</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1774, 1400828917, '2014-05-23 15:08:37', 'Card', 'click'),
(1775, 1400828917, '2014-05-23 15:08:37', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400828917</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1776, 1400829172, '2014-05-23 15:12:52', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400829172";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400829172</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1777, 1400829213, '2014-05-23 15:13:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400829213";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400829213</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1778, 1400829312, '2014-05-23 15:15:12', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400829312";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400829312</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1779, 1400829341, '2014-05-23 15:15:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400829340";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400829340</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1780, 1400829558, '2014-05-23 15:19:18', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400829558";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400829558</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1781, 1400831414, '2014-05-23 15:50:14', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400831413";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400831413</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1782, 1400831419, '2014-05-23 15:50:19', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831417";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831417</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1783, 1400831457, '2014-05-23 15:50:57', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831456";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831456</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1784, 1400831457, '2014-05-23 15:50:57', '笑话', 'click'),
(1785, 1400831457, '2014-05-23 15:50:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA["课堂上老师在教“被”字时启发一学生道:你家床上有什么? “有床单”学生回答道. “床单上有什么?”老师又启发. “有我妈”学生答. “你妈上面有什么?”老师问道. “有我爸爸”。 “那你爸爸上边有什么?” “有我妈妈的手” “被子呢?”老师生气地大声道. “被子掉地上了”学生委屈地回答."]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831457</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1786, 1400831457, '2014-05-23 15:50:57', '15', 'opens'),
(1787, 1400831457, '2014-05-23 15:50:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA[声音大点,没听清呀]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831457</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1788, 1400831480, '2014-05-23 15:51:20', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831480";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831480</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1789, 1400831480, '2014-05-23 15:51:20', '笑话', 'click'),
(1790, 1400831480, '2014-05-23 15:51:20', '<?xml version="1.0"?>\n<xml><Content><![CDATA["李某为一机关老实人，但同事多为老奸巨猾者，局长深感头痛。李某新婚次日，仍坚持出勤，局长为之动容，决心以老实人为典型，号召全局职工向其学习，于是召集大家开会，局长开话了：你们看，人家刚新婚，就抛开娇妻，前来上班，大家要学学这种奉献精神，下面请小李谈谈感受。"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831480</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1791, 1400831480, '2014-05-23 15:51:20', '15', 'opens'),
(1792, 1400831480, '2014-05-23 15:51:20', '<?xml version="1.0"?>\n<xml><Content><![CDATA[你那边好吵喔,听不清]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831480</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1793, 1400831500, '2014-05-23 15:51:40', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831498";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831498</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1794, 1400831501, '2014-05-23 15:51:41', '笑话', 'click'),
(1795, 1400831501, '2014-05-23 15:51:41', '<?xml version="1.0"?>\n<xml><Content><![CDATA["两个歹徒埋伏着，打算暗算某人，但老是不见那人的踪影。其中一个着急他说：“怎么搞的？还不见他来，但愿他不要发生意外！”"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831500</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1796, 1400831501, '2014-05-23 15:51:41', '15', 'opens'),
(1797, 1400831501, '2014-05-23 15:51:41', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,pardon?]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831500</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1798, 1400831528, '2014-05-23 15:52:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831526";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831526</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1799, 1400831528, '2014-05-23 15:52:08', '笑话', 'click'),
(1800, 1400831528, '2014-05-23 15:52:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA["有一次，海军妇女队队长问谁愿意参加唱诗班。“你来如何?”她问一位金发尤物。“我不会唱歌。”“不要紧，”她说，“你的任务是使水兵两眼向前看。”"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831528</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1801, 1400831528, '2014-05-23 15:52:08', '15', 'opens'),
(1802, 1400831528, '2014-05-23 15:52:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,I beg your pardon]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831528</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1803, 1400831543, '2014-05-23 15:52:23', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831543";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831543</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1804, 1400831543, '2014-05-23 15:52:23', '笑话', 'click'),
(1805, 1400831544, '2014-05-23 15:52:24', '<?xml version="1.0"?>\n<xml><Content><![CDATA["某家补习班老板非常受不了厕所文学中的脏乱和用词不雅於花了不笔的钱请油漆工来粉刷而且贴上凹凸不平的瓷砖以防学生再胡乱涂鸦.有一天当这老板上在如厕时忽然发现靠近地板的瓷砖上有人用原子笔写了一小行字不太清楚於是老板轻抬屁股弯著身体拉紧裤子吃力的仔细一瞧只见上面写著：『先生?您的屁股正以45度角拉屎吗？不太好吧！！』"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831543</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1806, 1400831544, '2014-05-23 15:52:24', '15', 'opens'),
(1807, 1400831546, '2014-05-23 15:52:26', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831543</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1808, 1400831553, '2014-05-23 15:52:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831549";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831549</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(1809, 1400831553, '2014-05-23 15:52:33', '天气', 'click'),
(1810, 1400831553, '2014-05-23 15:52:33', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831553</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1811, 1400831601, '2014-05-23 15:53:21', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831600";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"天气";s:5:"MsgId";s:19:"6016525909403760880";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831600</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气]]></Content>\n<MsgId>6016525909403760880</MsgId>\n</xml>'),
(1812, 1400831601, '2014-05-23 15:53:21', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831601</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1813, 1400831611, '2014-05-23 15:53:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831610";s:7:"MsgType";s:4:"text";s:7:"Content";s:13:"天气 北京";s:5:"MsgId";s:19:"6016525952353433842";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831610</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气 北京]]></Content>\n<MsgId>6016525952353433842</MsgId>\n</xml>'),
(1814, 1400831611, '2014-05-23 15:53:31', '15', 'opens'),
(1815, 1400831611, '2014-05-23 15:53:31', 'a:5:{i:0;a:4:{s:5:"Title";s:25:"天气 北京天气预报";s:11:"Description";s:0:"";s:6:"PicUrl";s:0:"";s:3:"Url";s:0:"";}i:1;a:4:{s:5:"Title";s:73:"周五(今天, 实时：32℃)\n多云转雷阵雨 南风3-4级 33 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/duoyun.png";s:3:"Url";s:0:"";}i:2;a:4:{s:5:"Title";s:37:"周六\n阵雨转阴 微风 25 ~ 19℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}i:3;a:4:{s:5:"Title";s:40:"周日\n阴转晴 北风3-4级 31 ~ 17℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:51:"http://api.map.baidu.com/images/weather/day/yin.png";s:3:"Url";s:0:"";}i:4;a:4:{s:5:"Title";s:37:"周一\n晴转多云 微风 34 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:52:"http://api.map.baidu.com/images/weather/day/qing.png";s:3:"Url";s:0:"";}}', 'getWeatherInfo'),
(1816, 1400831611, '2014-05-23 15:53:31', '<?xml version="1.0"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[天气 北京天气预报]]></Title><Description></Description><PicUrl></PicUrl><Url></Url></item><item><Title><![CDATA[周五(今天, 实时：32℃)\n多云转雷阵雨 南风3-4级 33 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周六\n阵雨转阴 微风 25 ~ 19℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周日\n阴转晴 北风3-4级 31 ~ 17℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/yin.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周一\n晴转多云 微风 34 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/qing.png]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831611</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1817, 1400831645, '2014-05-23 15:54:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831644";s:7:"MsgType";s:4:"text";s:7:"Content";s:13:"天气 绍兴";s:5:"MsgId";s:19:"6016526098382321908";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831644</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气 绍兴]]></Content>\n<MsgId>6016526098382321908</MsgId>\n</xml>'),
(1818, 1400831645, '2014-05-23 15:54:05', '15', 'opens'),
(1819, 1400831645, '2014-05-23 15:54:05', 'a:5:{i:0;a:4:{s:5:"Title";s:25:"天气 绍兴天气预报";s:11:"Description";s:0:"";s:6:"PicUrl";s:0:"";s:3:"Url";s:0:"";}i:1;a:4:{s:5:"Title";s:64:"周五(今天, 实时：26℃)\n多云 东南风3-4级 27 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/duoyun.png";s:3:"Url";s:0:"";}i:2;a:4:{s:5:"Title";s:31:"周六\n多云 微风 31 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/duoyun.png";s:3:"Url";s:0:"";}i:3;a:4:{s:5:"Title";s:34:"周日\n雷阵雨 微风 32 ~ 22℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:57:"http://api.map.baidu.com/images/weather/day/leizhenyu.png";s:3:"Url";s:0:"";}i:4;a:4:{s:5:"Title";s:31:"周一\n阵雨 微风 27 ~ 20℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/day/zhenyu.png";s:3:"Url";s:0:"";}}', 'getWeatherInfo'),
(1820, 1400831645, '2014-05-23 15:54:05', '<?xml version="1.0"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[天气 绍兴天气预报]]></Title><Description></Description><PicUrl></PicUrl><Url></Url></item><item><Title><![CDATA[周五(今天, 实时：26℃)\n多云 东南风3-4级 27 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周六\n多云 微风 31 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周日\n雷阵雨 微风 32 ~ 22℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/leizhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周一\n阵雨 微风 27 ~ 20℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/day/zhenyu.png]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831645</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1821, 1400831796, '2014-05-23 15:56:36', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831796";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831796</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1822, 1400831803, '2014-05-23 15:56:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831803";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831803</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1823, 1400831803, '2014-05-23 15:56:43', '建议意见', 'click'),
(1824, 1400831803, '2014-05-23 15:56:43', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/dwy_QQ%E5%9B%BE%E7%89%8720140523103317.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831803</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1825, 1400831813, '2014-05-23 15:56:53', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831813";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831813</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(1826, 1400831813, '2014-05-23 15:56:53', '天气', 'click'),
(1827, 1400831813, '2014-05-23 15:56:53', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831813</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1828, 1400831828, '2014-05-23 15:57:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831828";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831828</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1829, 1400831828, '2014-05-23 15:57:08', '笑话', 'click'),
(1830, 1400831828, '2014-05-23 15:57:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA["《大话西游》：曾经有一份真诚的爱情放在我面前，我没有珍惜，等我失去的时候我才后悔莫及，人世间最痛苦的事莫过于此。你的剑在我的咽喉上割下去吧！不用再犹豫了！如果上天能够给我一个再来一次的机会，我会对那个女孩子说三个字：我爱你。如果非要在这份爱上加上一个期限，我希望是——一万年 周星弛泡妞经典对白(先有心理准备..~笑死你) 一.公车站台 周星星:“小姐你踩到我脚了.“ 漂亮小妞: “没有吧,我离你那么远.“ 周星星: “我是说,如果你把脚不小心放在了我脚上,就是踩到我脚了.“ 漂亮小妞: “神经病.“ 周星星: “哇,小姐好眼力,我确实有神经病史,一般看见漂亮的女孩就发作.“ 漂亮小妞: “你们男人总是那样,说些无聊的话故意引女孩子故意.好象以为自己很帅. 周星星: “小姐你错了，我从不以为我自己帅,而是我本身就很帅.“ 漂亮小妞: “别那么恶心人好吧.我要吐了.“ 周星星: “在你吐之前我可以问你个问题吗?“ 漂亮小妞: “有屁快放“. 周星星: “你为什么要昧着良心否定我的帅?“ 漂亮小妞: “滚........“"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831828</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1831, 1400831828, '2014-05-23 15:57:08', '15', 'opens'),
(1832, 1400831828, '2014-05-23 15:57:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,I beg your pardon]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831828</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1833, 1400831832, '2014-05-23 15:57:12', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831832";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831832</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1834, 1400831832, '2014-05-23 15:57:12', '笑话', 'click'),
(1835, 1400831832, '2014-05-23 15:57:12', '<?xml version="1.0"?>\n<xml><Content><![CDATA["母亲：“你和丈夫一吵架就去摸电门，他要是不拉住你，怎么办？”女儿：“不怕，我事先已把总闸拉下来了。”"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831832</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1836, 1400831832, '2014-05-23 15:57:12', '15', 'opens'),
(1837, 1400831832, '2014-05-23 15:57:12', '<?xml version="1.0"?>\n<xml><Content><![CDATA[是不是呀]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831832</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1838, 1400831847, '2014-05-23 15:57:27', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831847";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831847</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1839, 1400831856, '2014-05-23 15:57:36', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831856";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831856</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1840, 1400831866, '2014-05-23 15:57:46', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831866";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831866</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1841, 1400831866, '2014-05-23 15:57:46', 'Card', 'click'),
(1842, 1400831866, '2014-05-23 15:57:46', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400831866</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1843, 1400831878, '2014-05-23 15:57:58', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400831878";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400831878</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1844, 1400832212, '2014-05-23 16:03:32', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400832212";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400832212</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1845, 1400832212, '2014-05-23 16:03:32', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400832212</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1846, 1400840345, '2014-05-23 18:19:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400840345";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400840345</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1847, 1400840345, '2014-05-23 18:19:05', '笑话', 'click'),
(1848, 1400840345, '2014-05-23 18:19:05', '<?xml version="1.0"?>\n<xml><Content><![CDATA["彼得把一束白色的马蹄莲放在母亲的墓前，静静地祈祷了一会儿，准备离去，这时突然听见悲伤的哭泣声。听这哭声，感情应该很深吧，真是感人！彼得被深深打动，敬佩之情油然而生，于是决定去看看。顺着哭声走近，发现一名男子跪在一块墓碑前，低头痛哭：“你为什么要走？呜——你为什么要走？呜——呜——留下我孤孤单单一个人。。。”彼得决定上去劝劝：“仁兄，虽然我不愿打扰您，但这样哭会哭坏身体的，节哀吧！扫墓的人我见过很多，向您这样情深意重的，我还是头一次遇见。不知是否可以冒昧地问一句，这里长眠的是您的什么亲人？”“我妻子的前夫，呜——你为什么要走？”"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400840345</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1849, 1400840346, '2014-05-23 18:19:06', '15', 'opens'),
(1850, 1400840346, '2014-05-23 18:19:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA[声音大点,没听清呀]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400840345</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1851, 1400842638, '2014-05-23 18:57:18', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400842638";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400842638</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1852, 1400843115, '2014-05-23 19:05:15', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400843115";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400843115</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1853, 1400843115, '2014-05-23 19:05:15', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400843115</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1854, 1400843203, '2014-05-23 19:06:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400843203";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400843203</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1855, 1400843219, '2014-05-23 19:06:59', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400843218";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400843218</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1856, 1400843541, '2014-05-23 19:12:21', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuPT1ja1QE3MStteZvLbFti4";s:10:"CreateTime";s:10:"1400843541";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuPT1ja1QE3MStteZvLbFti4]]></FromUserName>\n<CreateTime>1400843541</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1857, 1400843541, '2014-05-23 19:12:21', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuPT1ja1QE3MStteZvLbFti4]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400843541</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1858, 1400843551, '2014-05-23 19:12:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400843551";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400843551</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1859, 1400843551, '2014-05-23 19:12:31', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400843551</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1860, 1400843613, '2014-05-23 19:13:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400843612";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400843612</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1861, 1400843628, '2014-05-23 19:13:48', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400843628";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400843628</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1862, 1400843628, '2014-05-23 19:13:48', '笑话', 'click'),
(1863, 1400843629, '2014-05-23 19:13:49', '<?xml version="1.0"?>\n<xml><Content><![CDATA["NO1：老鼠去方便，见熊也在，吓得不敢吱声，熊看了老鼠一眼，说：“你掉不掉毛？”老鼠哆嗦了一下不语。熊又问：“掉不掉毛啊，你？”老鼠战战兢兢地说：“不掉……” 熊一把抓住老鼠擦擦屁股走了！ NO2：母老鼠怀疑老公有外遇，她跟踪老公到草丛旁。一会儿，一只刺猬从洞里钻出来。母老鼠一把拽住刺猬说：“死鬼，还说没外遇？擦这么多摩丝去勾引谁呀？”"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400843628</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1864, 1400843629, '2014-05-23 19:13:49', '15', 'opens'),
(1865, 1400843629, '2014-05-23 19:13:49', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,I beg your pardon]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400843628</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1866, 1400844077, '2014-05-23 19:21:17', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuFeo6fNAR5h8pfC7D6aQSjw";s:10:"CreateTime";s:10:"1400844076";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></FromUserName>\n<CreateTime>1400844076</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1867, 1400844077, '2014-05-23 19:21:17', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400844077</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1868, 1400844730, '2014-05-23 19:32:10', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuK5LXR5t8OaF7PsizJ9xgfI";s:10:"CreateTime";s:10:"1400844730";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuK5LXR5t8OaF7PsizJ9xgfI]]></FromUserName>\n<CreateTime>1400844730</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(1869, 1400844731, '2014-05-23 19:32:11', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuK5LXR5t8OaF7PsizJ9xgfI]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400844730</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1870, 1400851458, '2014-05-23 21:24:18', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400851455";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400851455</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1871, 1400851510, '2014-05-23 21:25:10', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400851510";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400851510</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1872, 1400851533, '2014-05-23 21:25:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400851533";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400851533</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1873, 1400851568, '2014-05-23 21:26:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400851568";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400851568</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1874, 1400851568, '2014-05-23 21:26:08', '笑话', 'click'),
(1875, 1400851568, '2014-05-23 21:26:08', '<?xml version="1.0"?>\n<xml><Content><![CDATA["答：存在家里，因为没人知道你存钱了。藏在皮鞋里。"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400851568</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1876, 1400851568, '2014-05-23 21:26:08', '15', 'opens'),
(1877, 1400851586, '2014-05-23 21:26:26', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400851585";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400851585</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1878, 1400851586, '2014-05-23 21:26:26', 'Card', 'click'),
(1879, 1400851586, '2014-05-23 21:26:26', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuDTHv7MOxu9S8U1mGBWdn2U.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400851586</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1880, 1400851590, '2014-05-23 21:26:30', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400851568</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1881, 1400851598, '2014-05-23 21:26:38', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400851598";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400851598</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1882, 1400852912, '2014-05-23 21:48:32', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400852912";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400852912</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(1883, 1400852913, '2014-05-23 21:48:33', '天气', 'click'),
(1884, 1400852913, '2014-05-23 21:48:33', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400852912</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1885, 1400853112, '2014-05-23 21:51:52', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuLAi1geWRhPF1MwbJUMw3vQ";s:10:"CreateTime";s:10:"1400853112";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuLAi1geWRhPF1MwbJUMw3vQ]]></FromUserName>\n<CreateTime>1400853112</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1886, 1400853112, '2014-05-23 21:51:52', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuLAi1geWRhPF1MwbJUMw3vQ]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400853112</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1887, 1400853362, '2014-05-23 21:56:02', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400853362";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400853362</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(1888, 1400853362, '2014-05-23 21:56:02', 'Card', 'click'),
(1889, 1400853362, '2014-05-23 21:56:02', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400853362</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1890, 1400853603, '2014-05-23 22:00:03', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400853602";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400853602</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(1891, 1400857256, '2014-05-23 23:00:56', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg";s:10:"CreateTime";s:10:"1400857254";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg]]></FromUserName>\n<CreateTime>1400857254</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1892, 1400857256, '2014-05-23 23:00:56', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuH-7T8Ib0g8bjWLiGtOR9Sg]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400857256</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1893, 1400858255, '2014-05-23 23:17:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400858255";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400858255</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1894, 1400858273, '2014-05-23 23:17:53', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400858273";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400858273</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/5/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1895, 1400858288, '2014-05-23 23:18:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400858288";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400858288</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/9/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1896, 1400858324, '2014-05-23 23:18:44', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400858324";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400858324</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1897, 1400858681, '2014-05-23 23:24:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400858681";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400858681</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1898, 1400858691, '2014-05-23 23:24:51', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400858691";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400858691</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1899, 1400858704, '2014-05-23 23:25:04', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400858704";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400858704</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1900, 1400858704, '2014-05-23 23:25:04', '笑话', 'click'),
(1901, 1400858704, '2014-05-23 23:25:04', '<?xml version="1.0"?>\n<xml><Content><![CDATA["“考试不及格后，你爸说了什么吗？”“可以省掉那些脏话吗？”“当然。”“那他什么也没说。”"]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400858704</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1902, 1400858704, '2014-05-23 23:25:04', '15', 'opens'),
(1903, 1400858708, '2014-05-23 23:25:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400858708";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"建议意见";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400858708</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[建议意见]]></EventKey>\n</xml>'),
(1904, 1400858708, '2014-05-23 23:25:08', '建议意见', 'click'),
(1905, 1400858708, '2014-05-23 23:25:08', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/dwy_QQ%E5%9B%BE%E7%89%8720140523103317.jpg]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400858708</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1906, 1400858726, '2014-05-23 23:25:26', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400858704</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1907, 1400859387, '2014-05-23 23:36:27', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuHtBxSY6tTI7yCoW5tMLlCI";s:10:"CreateTime";s:10:"1400859387";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuHtBxSY6tTI7yCoW5tMLlCI]]></FromUserName>\n<CreateTime>1400859387</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1908, 1400864449, '2014-05-24 01:00:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400864448";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400864448</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1909, 1400864453, '2014-05-24 01:00:53', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400864453";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400864453</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/8/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1910, 1400866706, '2014-05-24 01:38:26', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKrWy75anIQDmV5w2xFIa6Y";s:10:"CreateTime";s:10:"1400866706";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKrWy75anIQDmV5w2xFIa6Y]]></FromUserName>\n<CreateTime>1400866706</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1911, 1400866706, '2014-05-24 01:38:26', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuKrWy75anIQDmV5w2xFIa6Y]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400866706</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1912, 1400901828, '2014-05-24 11:23:48', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400901826";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400901826</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1913, 1400901903, '2014-05-24 11:25:03', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400901903";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400901903</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1914, 1400902879, '2014-05-24 11:41:19', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400902877";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400902877</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1915, 1400908773, '2014-05-24 13:19:33', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400908772";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400908772</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1916, 1400908815, '2014-05-24 13:20:15', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400908815";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400908815</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1917, 1400909124, '2014-05-24 13:25:24', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuJkX68eZw4kKg0itWYpldFI";s:10:"CreateTime";s:10:"1400909123";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuJkX68eZw4kKg0itWYpldFI]]></FromUserName>\n<CreateTime>1400909123</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1918, 1400909745, '2014-05-24 13:35:45', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400909745";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400909745</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1919, 1400909745, '2014-05-24 13:35:45', '笑话', 'click'),
(1920, 1400909746, '2014-05-24 13:35:46', '<?xml version="1.0"?>\n<xml><Content><![CDATA["农夫的家在大路边。这天他看到一辆运草的大车翻倒在路边，一个小孩站在一边哭。 农夫安慰小孩：“别着急，你先到我家里喝口水，吃点饭，然后我帮你把车扶起来。” 小孩说：“不行，我爸爸会不高兴的。” “不要紧，他会原谅你的。” 小孩只好跟农夫进了家。待到吃完饭，小孩子又担心起来：“我想，我爸爸已经生气了。” 农夫说：“别害怕。你告诉我，你爸爸在哪儿呢？” 小孩小声说：“他还压在车底下呢。”"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400909745</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1921, 1400909747, '2014-05-24 13:35:47', '15', 'opens'),
(1922, 1400909747, '2014-05-24 13:35:47', '<?xml version="1.0"?>\n<xml><Content><![CDATA[额~好吧]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400909745</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1923, 1400910745, '2014-05-24 13:52:25', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuNwX9g9u-E-7FQ72-avknmY";s:10:"CreateTime";s:10:"1400910744";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuNwX9g9u-E-7FQ72-avknmY]]></FromUserName>\n<CreateTime>1400910744</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1924, 1400910907, '2014-05-24 13:55:07', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuCy_yBNSheA6xZAkwOxe8KY";s:10:"CreateTime";s:10:"1400910908";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuCy_yBNSheA6xZAkwOxe8KY]]></FromUserName>\n<CreateTime>1400910908</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1925, 1400910908, '2014-05-24 13:55:08', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuCy_yBNSheA6xZAkwOxe8KY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400910907</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1926, 1400910939, '2014-05-24 13:55:39', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuN_s7WETZ_iBOI_63Eyg0vk";s:10:"CreateTime";s:10:"1400910938";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuN_s7WETZ_iBOI_63Eyg0vk]]></FromUserName>\n<CreateTime>1400910938</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1927, 1400910939, '2014-05-24 13:55:39', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuN_s7WETZ_iBOI_63Eyg0vk]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400910939</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1928, 1400910995, '2014-05-24 13:56:35', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuCy_yBNSheA6xZAkwOxe8KY";s:10:"CreateTime";s:10:"1400910994";s:7:"MsgType";s:4:"text";s:7:"Content";s:4:"/::P";s:5:"MsgId";s:19:"6016866904037262545";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuCy_yBNSheA6xZAkwOxe8KY]]></FromUserName>\n<CreateTime>1400910994</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[/::P]]></Content>\n<MsgId>6016866904037262545</MsgId>\n</xml>'),
(1929, 1400910995, '2014-05-24 13:56:35', '15', 'opens'),
(1930, 1400910998, '2014-05-24 13:56:38', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuCy_yBNSheA6xZAkwOxe8KY]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400910995</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1931, 1400913164, '2014-05-24 14:32:44', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuFeo6fNAR5h8pfC7D6aQSjw";s:10:"CreateTime";s:10:"1400913164";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></FromUserName>\n<CreateTime>1400913164</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1932, 1400913164, '2014-05-24 14:32:44', '笑话', 'click'),
(1933, 1400913164, '2014-05-24 14:32:44', '<?xml version="1.0"?>\n<xml><Content><![CDATA["甲和乙一起上公交车，看见唯一的座位旁边，坐了一位女孩，正用一条洁白的手帕擦着汗水，乙对甲说，请你先坐，公交车就这样慢慢开着，乙正晃头晃脑的看着窗外的风景，忽然看见，一个倘大的水门，中门大开，里头七颜六色，五彩缤纷，而一朵白云，就这样缓缓的诮磳式A过了几分钟，一座斗大的五指山，将这朵白云，连拉带挤的将它塞进水门之中，水门也因此关上，乙看见此景甚感奇怪，眼看目的地快到了，要向甲说时，只见甲眼中，先出现一堆彩色的金叹号，随之而来的是一堆白色的金叹号，准备下车时旁边的女孩对甲说，「人家的手帕拿来啦」甲说「拿去就拿去有什么了不起」"]]></Content><ToUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400913164</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1934, 1400913164, '2014-05-24 14:32:44', '15', 'opens'),
(1935, 1400913164, '2014-05-24 14:32:44', '<?xml version="1.0"?>\n<xml><Content><![CDATA[是不是呀]]></Content><ToUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400913164</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1936, 1400913242, '2014-05-24 14:34:02', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuFeo6fNAR5h8pfC7D6aQSjw";s:10:"CreateTime";s:10:"1400913242";s:7:"MsgType";s:5:"event";s:5:"Event";s:11:"unsubscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuFeo6fNAR5h8pfC7D6aQSjw]]></FromUserName>\n<CreateTime>1400913242</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(1937, 1400920809, '2014-05-24 16:40:09', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400920809";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400920809</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1938, 1400920811, '2014-05-24 16:40:11', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400920809";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400920809</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1939, 1400920822, '2014-05-24 16:40:22', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400920809";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400920809</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1940, 1400920832, '2014-05-24 16:40:32', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400920809";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400920809</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1941, 1400921012, '2014-05-24 16:43:32', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921011";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"意见反馈";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921011</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[意见反馈]]></EventKey>\n</xml>'),
(1942, 1400921012, '2014-05-24 16:43:32', '意见反馈', 'click'),
(1943, 1400921012, '2014-05-24 16:43:32', '15', 'opens'),
(1944, 1400921012, '2014-05-24 16:43:32', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,pardon?]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921012</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1945, 1400921058, '2014-05-24 16:44:18', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921058";s:7:"MsgType";s:4:"text";s:7:"Content";s:11:"Suggestions";s:5:"MsgId";s:19:"6016910128587857466";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921058</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[Suggestions]]></Content>\n<MsgId>6016910128587857466</MsgId>\n</xml>'),
(1946, 1400921058, '2014-05-24 16:44:18', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/53705a8fb5564/openid/oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8.html]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921058</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1947, 1400921093, '2014-05-24 16:44:53', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921092";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:11:"Suggestions";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921092</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Suggestions]]></EventKey>\n</xml>'),
(1948, 1400921093, '2014-05-24 16:44:53', 'Suggestions', 'click'),
(1949, 1400921093, '2014-05-24 16:44:53', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/53705a8fb5564/openid/oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8.html]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921093</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(1950, 1400921564, '2014-05-24 16:52:44', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921561";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921561</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1951, 1400921565, '2014-05-24 16:52:45', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921561";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921561</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1952, 1400921575, '2014-05-24 16:52:55', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921561";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921561</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1953, 1400921586, '2014-05-24 16:53:06', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921561";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921561</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(1954, 1400921668, '2014-05-24 16:54:28', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921666";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921666</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(1955, 1400921668, '2014-05-24 16:54:28', '联系我们', 'click'),
(1956, 1400921668, '2014-05-24 16:54:28', '15', 'opens'),
(1957, 1400921668, '2014-05-24 16:54:28', '<?xml version="1.0"?>\n<xml><Content><![CDATA[请说普通话呀,方言听不懂]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921668</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1958, 1400921806, '2014-05-24 16:56:46', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921805";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921805</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(1959, 1400921806, '2014-05-24 16:56:46', '联系我们', 'click'),
(1960, 1400921806, '2014-05-24 16:56:46', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575-85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921806</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(1961, 1400921838, '2014-05-24 16:57:18', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921837";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921837</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(1962, 1400921838, '2014-05-24 16:57:18', '联系我们', 'click'),
(1963, 1400921838, '2014-05-24 16:57:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：0575 85060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921838</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1964, 1400921850, '2014-05-24 16:57:30', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921849";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921849</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(1965, 1400921850, '2014-05-24 16:57:30', '联系我们', 'click'),
(1966, 1400921850, '2014-05-24 16:57:30', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：057585060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921850</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1967, 1400921938, '2014-05-24 16:58:58', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400921936";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400921936</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(1968, 1400921938, '2014-05-24 16:58:58', '联系我们', 'click'),
(1969, 1400921938, '2014-05-24 16:58:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：057585060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n官方网站:<a href="http://www.gooraye.net">www.gooraye.net</a>\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400921937</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1970, 1400924191, '2014-05-24 17:36:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400924191";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400924191</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1971, 1400924228, '2014-05-24 17:37:08', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400924228";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400924228</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/6/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1972, 1400924248, '2014-05-24 17:37:28', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400924247";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400924247</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1973, 1400924261, '2014-05-24 17:37:41', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuKFAvo3UvUdhLOSGtgt4qXI";s:10:"CreateTime";s:10:"1400924260";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuKFAvo3UvUdhLOSGtgt4qXI]]></FromUserName>\n<CreateTime>1400924260</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(1974, 1400925753, '2014-05-24 18:02:33', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400925752";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.851130";s:9:"Longitude";s:10:"121.559456";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400925752</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.851130</Latitude>\n<Longitude>121.559456</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(1975, 1400925761, '2014-05-24 18:02:41', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400925761";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.851143";s:9:"Longitude";s:10:"121.559479";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400925761</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.851143</Latitude>\n<Longitude>121.559479</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(1976, 1400925769, '2014-05-24 18:02:49', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400925768";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.851084";s:9:"Longitude";s:10:"121.559380";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400925768</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.851084</Latitude>\n<Longitude>121.559380</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(1977, 1400925772, '2014-05-24 18:02:52', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400925772";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"你好";s:5:"MsgId";s:19:"6016930375063690898";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400925772</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你好]]></Content>\n<MsgId>6016930375063690898</MsgId>\n</xml>'),
(1978, 1400925772, '2014-05-24 18:02:52', '15', 'opens'),
(1979, 1400925772, '2014-05-24 18:02:52', '<?xml version="1.0"?>\n<xml><Content><![CDATA[99ise.com你嬞的擊凊无限]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400925772</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1980, 1400926036, '2014-05-24 18:07:16', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400926035";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400926035</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1981, 1400926036, '2014-05-24 18:07:16', '笑话', 'click'),
(1982, 1400926036, '2014-05-24 18:07:16', '<?xml version="1.0"?>\n<xml><Content><![CDATA["一个鼻子插着黄瓜，左耳插着胡罗卜，右耳插着香蕉的病人去医院看病。 他问医生说：“医生，我到底出什了什么毛病？” “这很明显，”医生自信地回答说，“你吃东西的方式不对"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926035</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1983, 1400926036, '2014-05-24 18:07:16', '15', 'opens'),
(1984, 1400926038, '2014-05-24 18:07:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA[戴维营SPA\n地址：绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼\n电话：0575-89871666、13867519285\n营业时间：12:00-次日1:00\n]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926035</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1985, 1400926905, '2014-05-24 18:21:45', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400926903";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400926903</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1986, 1400926905, '2014-05-24 18:21:45', '笑话', 'click'),
(1987, 1400926906, '2014-05-24 18:21:46', '<?xml version="1.0"?>\n<xml><Content><![CDATA["我爱的人名花有主，爱我的人惨不忍睹。"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926905</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1988, 1400926906, '2014-05-24 18:21:46', '15', 'opens'),
(1989, 1400926906, '2014-05-24 18:21:46', '<?xml version="1.0"?>\n<xml><Content><![CDATA[不要开免提呀,我都听不清啦]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926905</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1990, 1400926916, '2014-05-24 18:21:56', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400926916";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400926916</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1991, 1400926917, '2014-05-24 18:21:57', '笑话', 'click'),
(1992, 1400926917, '2014-05-24 18:21:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA["政治课上，老师讲到党风建设时说：“要想毁一个人很容易，只要给他权力，且不监督他。包准！”没等他讲完，俺就举了手：“老师，麻烦您毁了我好吗？”"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926916</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1993, 1400926917, '2014-05-24 18:21:57', '15', 'opens'),
(1994, 1400926917, '2014-05-24 18:21:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,pardon?]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400926916</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1995, 1400932445, '2014-05-24 19:54:05', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400932445";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400932445</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(1996, 1400932446, '2014-05-24 19:54:06', '笑话', 'click'),
(1997, 1400932446, '2014-05-24 19:54:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA["在加州欧罗维尔的一宗强暴案件中，年轻的原告对回答「在展开攻击之前，被告对 你说了什么? 」怠到很困扰，她宁愿写在纸条上代替口头回答，法官同意。在笕了纸条后，法官要首席陪审员把纸条在陪审团间依次传递。有一位男陪审员从开始就在打瞌睡 ，突然被隔壁一位的女陪审员推醒，并传给他一张纸条，上面写的是：「我要让你享受前所未有的高潮。」他慢慢地看，禁不住泛起微笑，然后把纸条塞进裤袋里。当法官要他再传递给下一位陪审员时，他严正的拒绝，说：「这是私人的事，法官大人。」"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400932445</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(1998, 1400932446, '2014-05-24 19:54:06', '15', 'opens'),
(1999, 1400932446, '2014-05-24 19:54:06', '<?xml version="1.0"?>\n<xml><Content><![CDATA[sorry,pardon?]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400932445</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2000, 1400932482, '2014-05-24 19:54:42', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400932479";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400932479</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(2001, 1400932482, '2014-05-24 19:54:42', '笑话', 'click'),
(2002, 1400932482, '2014-05-24 19:54:42', '<?xml version="1.0"?>\n<xml><Content><![CDATA["小晶晶出院了，高兴地与医生告别。“再见！医生。”小晶晶的姐姐：“什么，‘再见’？你还要住院？”小晶晶：“那……医生，永别了！”"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400932482</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2003, 1400932482, '2014-05-24 19:54:42', '15', 'opens'),
(2004, 1400932482, '2014-05-24 19:54:42', '<?xml version="1.0"?>\n<xml><Content><![CDATA[不要开免提呀,我都听不清啦]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400932482</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2005, 1400933510, '2014-05-24 20:11:50', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933509";s:7:"MsgType";s:4:"text";s:7:"Content";s:2:"dd";s:5:"MsgId";s:19:"6016963605225660208";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933509</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[dd]]></Content>\n<MsgId>6016963605225660208</MsgId>\n</xml>'),
(2006, 1400933510, '2014-05-24 20:11:50', '15', 'opens'),
(2007, 1400933510, '2014-05-24 20:11:50', '<?xml version="1.0"?>\n<xml><Content><![CDATA[是个体力活啊]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933510</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2008, 1400933514, '2014-05-24 20:11:54', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933512";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933512</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2009, 1400933514, '2014-05-24 20:11:54', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933512";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933512</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2010, 1400933525, '2014-05-24 20:12:05', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933512";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933512</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2011, 1400933535, '2014-05-24 20:12:15', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933512";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933512</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2012, 1400933691, '2014-05-24 20:14:51', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933691";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"万挖鼻";s:5:"MsgId";s:19:"6016964386909708090";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933691</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[万挖鼻]]></Content>\n<MsgId>6016964386909708090</MsgId>\n</xml>'),
(2013, 1400933691, '2014-05-24 20:14:51', '15', 'opens'),
(2014, 1400933692, '2014-05-24 20:14:52', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n1.天气预报 回复： 天气 绍兴\n2.微社区 回复：微社区\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933691</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2015, 1400933694, '2014-05-24 20:14:54', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933694";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"笑话";s:5:"MsgId";s:19:"6016964399794609980";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933694</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[笑话]]></Content>\n<MsgId>6016964399794609980</MsgId>\n</xml>'),
(2016, 1400933695, '2014-05-24 20:14:55', '15', 'opens'),
(2017, 1400933695, '2014-05-24 20:14:55', '<?xml version="1.0"?>\n<xml><Content><![CDATA["离婚没多久我就去了婚姻介绍所。那个肥胖的女人问我想要找什么模样的女人。我想了想后，就告诉她，我要找个眼睛大大的，嘴巴小小的，脸要圆圆的。我和一个三角脸、小眼、大嘴巴的女人活了十年，我实在是看够了。那个胖女人又问我还有什么特殊条件没有，比如身高、年龄、婚否、职业什么的。我想都没想就告诉她我对那些根本都不在乎，只要她不怕老鼠。我住那地方老鼠比较多，而她每次见到老鼠都要发出惊天动地的尖叫，为此邻居已经抗议了无数次了。甚至在她的一次尖叫过后，楼上的一位老人还突发了心脏病，让我支付了一大笔医药费。我还告诉那胖女人，我还希望她给我介绍的那个女的不要一天黑就想睡觉，最好是越到晚上越精神的。我以前那个老婆天一黑就哈欠连天，神智模糊，头一靠着东西就能睡着。我白天在单位，晚上回到家吃完了饭，她就上床睡觉了，除了能听她的呼噜，根本没有人能和我说句话。哎！我这十年跟单身没有什么区别。一个星期后，我收到了那婚介所寄来的一个邮件，打开一看，里面有一张照片，那张照片上面是。。。一只猫头鹰。"]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933694</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2018, 1400933701, '2014-05-24 20:15:01', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933701";s:7:"MsgType";s:4:"text";s:7:"Content";s:13:"天气 绍兴";s:5:"MsgId";s:19:"6016964429859381054";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933701</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天气 绍兴]]></Content>\n<MsgId>6016964429859381054</MsgId>\n</xml>'),
(2019, 1400933701, '2014-05-24 20:15:01', '15', 'opens'),
(2020, 1400933701, '2014-05-24 20:15:01', 'a:5:{i:0;a:4:{s:5:"Title";s:25:"天气 绍兴天气预报";s:11:"Description";s:0:"";s:6:"PicUrl";s:0:"";s:3:"Url";s:0:"";}i:1;a:4:{s:5:"Title";s:50:"周六(今天, 实时：27℃)\n阵雨 微风 23℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:56:"http://api.map.baidu.com/images/weather/night/zhenyu.png";s:3:"Url";s:0:"";}i:2;a:4:{s:5:"Title";s:40:"周日\n中雨转阵雨 微风 29 ~ 23℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:56:"http://api.map.baidu.com/images/weather/night/zhenyu.png";s:3:"Url";s:0:"";}i:3;a:4:{s:5:"Title";s:31:"周一\n多云 微风 30 ~ 22℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:56:"http://api.map.baidu.com/images/weather/night/duoyun.png";s:3:"Url";s:0:"";}i:4;a:4:{s:5:"Title";s:37:"周二\n多云转晴 微风 31 ~ 21℃";s:11:"Description";s:0:"";s:6:"PicUrl";s:54:"http://api.map.baidu.com/images/weather/night/qing.png";s:3:"Url";s:0:"";}}', 'getWeatherInfo'),
(2021, 1400933701, '2014-05-24 20:15:01', '<?xml version="1.0"?>\n<xml><ArticleCount>5</ArticleCount><Articles><item><Title><![CDATA[天气 绍兴天气预报]]></Title><Description></Description><PicUrl></PicUrl><Url></Url></item><item><Title><![CDATA[周六(今天, 实时：27℃)\n阵雨 微风 23℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/night/zhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周日\n中雨转阵雨 微风 29 ~ 23℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/night/zhenyu.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周一\n多云 微风 30 ~ 22℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/night/duoyun.png]]></PicUrl><Url></Url></item><item><Title><![CDATA[周二\n多云转晴 微风 31 ~ 21℃]]></Title><Description></Description><PicUrl><![CDATA[http://api.map.baidu.com/images/weather/night/qing.png]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933701</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2022, 1400933709, '2014-05-24 20:15:09', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933707";s:7:"MsgType";s:4:"text";s:7:"Content";s:7:"快递 ";s:5:"MsgId";s:19:"6016964455629184832";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933707</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[快递 ]]></Content>\n<MsgId>6016964455629184832</MsgId>\n</xml>'),
(2023, 1400933709, '2014-05-24 20:15:09', '15', 'opens'),
(2024, 1400933709, '2014-05-24 20:15:09', '<?xml version="1.0"?>\n<xml><Content><![CDATA[hi~查询您的快递信息，请按以下格式输入，%n…快递…，如：%n%n顺丰快递112824257404%n(输入时不要换行)]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933709</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2025, 1400933725, '2014-05-24 20:15:25', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933725";s:7:"MsgType";s:4:"text";s:7:"Content";s:4:"wifi";s:5:"MsgId";s:19:"6016964532938596164";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933725</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[wifi]]></Content>\n<MsgId>6016964532938596164</MsgId>\n</xml>'),
(2026, 1400933725, '2014-05-24 20:15:25', '15', 'opens'),
(2027, 1400933726, '2014-05-24 20:15:26', '<?xml version="1.0"?>\n<xml><Content><![CDATA[无线上网]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933725</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2028, 1400933739, '2014-05-24 20:15:39', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933738";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"无线";s:5:"MsgId";s:19:"6016964588773171014";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933738</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[无线]]></Content>\n<MsgId>6016964588773171014</MsgId>\n</xml>'),
(2029, 1400933739, '2014-05-24 20:15:39', '15', 'opens'),
(2030, 1400933739, '2014-05-24 20:15:39', '<?xml version="1.0"?>\n<xml><Content><![CDATA[不慢就不叫无线网]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933739</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2031, 1400933746, '2014-05-24 20:15:46', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933745";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"1";s:5:"MsgId";s:19:"6016964618837942088";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933745</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[1]]></Content>\n<MsgId>6016964618837942088</MsgId>\n</xml>'),
(2032, 1400933746, '2014-05-24 20:15:46', '15', 'opens'),
(2033, 1400933746, '2014-05-24 20:15:46', '<?xml version="1.0"?>\n<xml><Content>1</Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933746</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2034, 1400933748, '2014-05-24 20:15:48', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933747";s:7:"MsgType";s:4:"text";s:7:"Content";s:1:"2";s:5:"MsgId";s:19:"6016964627427876682";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933747</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[2]]></Content>\n<MsgId>6016964627427876682</MsgId>\n</xml>'),
(2035, 1400933748, '2014-05-24 20:15:48', '15', 'opens'),
(2036, 1400933748, '2014-05-24 20:15:48', '<?xml version="1.0"?>\n<xml><Content><![CDATA[hi~给您提供实时天气,方便您的出行,按以下格式输入, …天气,如： 北京天气南昌天气]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933748</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2037, 1400933758, '2014-05-24 20:15:58', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933758";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"绍兴天气";s:5:"MsgId";s:19:"6016964674672516940";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933758</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[绍兴天气]]></Content>\n<MsgId>6016964674672516940</MsgId>\n</xml>'),
(2038, 1400933758, '2014-05-24 20:15:58', '15', 'opens'),
(2039, 1400933759, '2014-05-24 20:15:59', '<?xml version="1.0"?>\n<xml><Content><![CDATA[【绍兴】\r\n2014年3月4日星期二\r\n今天天气：12℃~7℃ 小雨转阴，微风  \r\n紫外线指数：最弱  \r\n明天天气：11℃~3℃ 多云转阴，微风 \r\n后天天气：6℃~4℃ \r\n小雨，微风]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933758</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2040, 1400933772, '2014-05-24 20:16:12', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933772";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"天空";s:5:"MsgId";s:19:"6016964734802059086";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933772</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[天空]]></Content>\n<MsgId>6016964734802059086</MsgId>\n</xml>'),
(2041, 1400933772, '2014-05-24 20:16:12', '15', 'opens'),
(2042, 1400933773, '2014-05-24 20:16:13', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天空趴下]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933772</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2043, 1400933779, '2014-05-24 20:16:19', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933778";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"官网";s:5:"MsgId";s:19:"6016964760571862864";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933778</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[官网]]></Content>\n<MsgId>6016964760571862864</MsgId>\n</xml>'),
(2044, 1400933779, '2014-05-24 20:16:19', '15', 'opens'),
(2045, 1400933779, '2014-05-24 20:16:19', '<?xml version="1.0"?>\n<xml><Content><![CDATA[客服电话：0575-85060707\n客服QQ001：1966236348\n客服QQ002：2966442390\n邮箱：support@gooraye.net\n1.天气预报 回复： 天气 绍兴\n2.微社区 回复：微社区\n更多功能推出中...\n]]></Content><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933779</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2046, 1400933793, '2014-05-24 20:16:33', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8";s:10:"CreateTime";s:10:"1400933793";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"微社区";s:5:"MsgId";s:19:"6016964824996372306";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></FromUserName>\n<CreateTime>1400933793</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[微社区]]></Content>\n<MsgId>6016964824996372306</MsgId>\n</xml>'),
(2047, 1400933793, '2014-05-24 20:16:33', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[点击进入微社区]]></Title><Description><![CDATA[古睿小伙伴社区]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_Goo.png]]></PicUrl><Url><![CDATA[http://www.qq.com/]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt3Ouq-2Vm0kZOZmZ2rTDlP8]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400933793</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2048, 1400939731, '2014-05-24 21:55:31', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400939731";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400939731</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2049, 1400979227, '2014-05-25 08:53:47', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400979226";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400979226</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2050, 1400979227, '2014-05-25 08:53:47', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400979226";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400979226</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2051, 1400979238, '2014-05-25 08:53:58', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400979226";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400979226</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2052, 1400979248, '2014-05-25 08:54:08', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400979226";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400979226</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2053, 1400979250, '2014-05-25 08:54:10', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1400979250";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1400979250</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(2054, 1400979250, '2014-05-25 08:54:10', '联系我们', 'click'),
(2055, 1400979250, '2014-05-25 08:54:10', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：057585060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n官方网站:<a href="http://www.gooraye.net">www.gooraye.net</a>\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1400979250</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2056, 1400988329, '2014-05-25 11:25:29', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1400988329";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1400988329</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(2057, 1400988329, '2014-05-25 11:25:29', 'Card', 'click'),
(2058, 1400988329, '2014-05-25 11:25:29', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400988329</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2059, 1400994644, '2014-05-25 13:10:44', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1400994643";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1400994643</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(2060, 1400994644, '2014-05-25 13:10:44', '笑话', 'click'),
(2061, 1400994644, '2014-05-25 13:10:44', '<?xml version="1.0"?>\n<xml><Content><![CDATA["一天0跟8在街上相遇，0不屑的看了8一眼，说：胖就胖呗，还系什么裤腰带啊！一天0碰到10,看了他一眼,不屑地说,年纪轻轻的拄什么拐仗呀.一天0碰到101，很同情的看着他，哎，怎么拄上双拐了！一天0碰到10，瞥她一眼，“小样，傍上大款我就不认识你了！”有一天,0碰上了Q,大吃一惊,怎么长尾巴了?!有一天，O碰上OO说，胖子怎么不等我就结婚了.有一天0在路上看到9，“哎，兄弟，怎么截肢了....“2对5说：你该把肚皮收收了5说：怎么？隆了胸就了不起了呀！7和2.......7说：下跪也没有用，我不会嫁给你的"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400994644</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2062, 1400994644, '2014-05-25 13:10:44', '15', 'opens'),
(2063, 1400994644, '2014-05-25 13:10:44', '<?xml version="1.0"?>\n<xml><Content><![CDATA[是不是呀]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1400994644</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2064, 1401017480, '2014-05-25 19:31:20', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuEGhruqaxHTB_l5j59mZNTs";s:10:"CreateTime";s:10:"1401017479";s:7:"MsgType";s:5:"event";s:5:"Event";s:9:"subscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuEGhruqaxHTB_l5j59mZNTs]]></FromUserName>\n<CreateTime>1401017479</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[subscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(2065, 1401017481, '2014-05-25 19:31:21', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[欢迎关注戴维营Spa服务号]]></Title><Description><![CDATA[专业养生SPA会所，于2013年6月份开业，位于柯桥万达广场，绍兴市戴维营SPA美容会所位于绍兴柯桥万达广场，周边高楼林立，会所内奢华的装修，精油的芳香，潺潺的流水，让所有走进戴维营的每一个人感受到的是一种皇室贵族的尊贵，世外桃源的宁静。]]></Description><PicUrl><![CDATA[http://b.hiphotos.baidu.com/image/w%3D2048%3Bq%3D90/sign=5ea149700846f21fc9345953c21c5011/a686c9177f3e67094056427439c79f3df9dc55e2.jpg]]></PicUrl><Url></Url></item></Articles><ToUserName><![CDATA[oy6EYuEGhruqaxHTB_l5j59mZNTs]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401017480</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2066, 1401017656, '2014-05-25 19:34:16', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuEGhruqaxHTB_l5j59mZNTs";s:10:"CreateTime";s:10:"1401017655";s:7:"MsgType";s:5:"event";s:5:"Event";s:11:"unsubscribe";s:8:"EventKey";s:0:"";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuEGhruqaxHTB_l5j59mZNTs]]></FromUserName>\n<CreateTime>1401017655</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[unsubscribe]]></Event>\n<EventKey><![CDATA[]]></EventKey>\n</xml>'),
(2067, 1401021137, '2014-05-25 20:32:17', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1401021131";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1401021131</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(2068, 1401021137, '2014-05-25 20:32:17', '笑话', 'click'),
(2069, 1401021138, '2014-05-25 20:32:18', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuDTHv7MOxu9S8U1mGBWdn2U";s:10:"CreateTime";s:10:"1401021137";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"笑话";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></FromUserName>\n<CreateTime>1401021137</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[笑话]]></EventKey>\n</xml>'),
(2070, 1401021138, '2014-05-25 20:32:18', '笑话', 'click'),
(2071, 1401021138, '2014-05-25 20:32:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA["将军到某征兵站询问：“今天的报名情况如何？” 站长回答：“报告长官，昨天和前天都有一个人来报名，今天的报名人数比昨天和前天稍稍下降一点！”"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401021137</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2072, 1401021138, '2014-05-25 20:32:18', '15', 'opens'),
(2073, 1401021138, '2014-05-25 20:32:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA["女儿向父亲哭诉自己遭老板强暴并已怀孕。父亲听后恼羞成怒，随即找到老板。老板：非常对不起，不过，事已至此，如果生了儿子我将给您100万元，如果是女儿，给您50万。父亲：如果流产了，还能给一次机会吗？"]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401021138</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2074, 1401021138, '2014-05-25 20:32:18', '15', 'opens'),
(2075, 1401021138, '2014-05-25 20:32:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA[声音大点,没听清呀]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401021138</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2076, 1401021138, '2014-05-25 20:32:18', '<?xml version="1.0"?>\n<xml><Content><![CDATA[你那边好吵喔,听不清]]></Content><ToUserName><![CDATA[oy6EYuDTHv7MOxu9S8U1mGBWdn2U]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401021137</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData');
INSERT INTO `wp_weixin_log` (`id`, `cTime`, `cTime_format`, `data`, `data_post`) VALUES
(2077, 1401074747, '2014-05-26 11:25:47', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401074747";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401074747</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(2078, 1401074755, '2014-05-26 11:25:55', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401074755";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401074755</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2079, 1401074816, '2014-05-26 11:26:56', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401074816";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:133:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401074816</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/detail/id/2/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2080, 1401084724, '2014-05-26 14:12:04', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet-JMzhW2X69I6zazAjQTipU";s:10:"CreateTime";s:10:"1401084724";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"草泥马";s:5:"MsgId";s:19:"6017613068705526642";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></FromUserName>\n<CreateTime>1401084724</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[草泥马]]></Content>\n<MsgId>6017613068705526642</MsgId>\n</xml>'),
(2081, 1401084724, '2014-05-26 14:12:04', '0', 'opens'),
(2082, 1401084724, '2014-05-26 14:12:04', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我今天累了，明天再陪你聊天吧\n哈哈~~\n你话好多啊，不跟你聊了\n虽然不懂，但觉得你说得很对\n]]></Content><ToUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1401084724</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2083, 1401084724, '2014-05-26 14:12:04', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet-JMzhW2X69I6zazAjQTipU";s:10:"CreateTime";s:10:"1401084724";s:7:"MsgType";s:4:"text";s:7:"Content";s:5:"nihao";s:5:"MsgId";s:19:"6017613068705526643";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></FromUserName>\n<CreateTime>1401084724</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[nihao]]></Content>\n<MsgId>6017613068705526643</MsgId>\n</xml>'),
(2084, 1401084724, '2014-05-26 14:12:04', '0', 'opens'),
(2085, 1401084724, '2014-05-26 14:12:04', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我今天累了，明天再陪你聊天吧\n哈哈~~\n你话好多啊，不跟你聊了\n虽然不懂，但觉得你说得很对\n]]></Content><ToUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1401084724</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2086, 1401084727, '2014-05-26 14:12:07', 'a:6:{s:10:"ToUserName";s:15:"gh_0bc75315088e";s:12:"FromUserName";s:28:"oQJWet-JMzhW2X69I6zazAjQTipU";s:10:"CreateTime";s:10:"1401084726";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"傻逼";s:5:"MsgId";s:19:"6017613077295461238";}', '<xml><ToUserName><![CDATA[gh_0bc75315088e]]></ToUserName>\n<FromUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></FromUserName>\n<CreateTime>1401084726</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[傻逼]]></Content>\n<MsgId>6017613077295461238</MsgId>\n</xml>'),
(2087, 1401084727, '2014-05-26 14:12:07', '0', 'opens'),
(2088, 1401084727, '2014-05-26 14:12:07', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我今天累了，明天再陪你聊天吧\n哈哈~~\n你话好多啊，不跟你聊了\n虽然不懂，但觉得你说得很对\n]]></Content><ToUserName><![CDATA[oQJWet-JMzhW2X69I6zazAjQTipU]]></ToUserName><FromUserName><![CDATA[gh_0bc75315088e]]></FromUserName><CreateTime>1401084727</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2089, 1401092268, '2014-05-26 16:17:48', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401092266";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401092266</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2090, 1401106979, '2014-05-26 20:22:59', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1401106979";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1401106979</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2091, 1401106980, '2014-05-26 20:23:00', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1401106979";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1401106979</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2092, 1401106994, '2014-05-26 20:23:14', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1401106979";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1401106979</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2093, 1401107005, '2014-05-26 20:23:25', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt8M_crLI6QSGLPdFEWFbzyY";s:10:"CreateTime";s:10:"1401106979";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt8M_crLI6QSGLPdFEWFbzyY]]></FromUserName>\n<CreateTime>1401106979</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2094, 1401111379, '2014-05-26 21:36:19', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111379";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:12:"联系我们";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111379</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[联系我们]]></EventKey>\n</xml>'),
(2095, 1401111379, '2014-05-26 21:36:19', '联系我们', 'click'),
(2096, 1401111379, '2014-05-26 21:36:19', '<?xml version="1.0"?>\n<xml><Content><![CDATA[绍兴古睿信息科技有限公司。\r\n客服电话：057585060707\r\n客服QQ 001：1966236348\r\n客服QQ 002：2966442390\r\n官方网站:<a href="http://www.gooraye.net">www.gooraye.net</a>\r\n更多服务推出中。。。]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401111379</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2097, 1401111383, '2014-05-26 21:36:23', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111383";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:11:"Suggestions";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111383</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Suggestions]]></EventKey>\n</xml>'),
(2098, 1401111383, '2014-05-26 21:36:23', 'Suggestions', 'click'),
(2099, 1401111383, '2014-05-26 21:36:23', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/53705a8fb5564/openid/oqMIVt5aLt6bsS8Nnk_DHx5_l0UI.html]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401111383</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2100, 1401111384, '2014-05-26 21:36:24', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111384";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:11:"Suggestions";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111384</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Suggestions]]></EventKey>\n</xml>'),
(2101, 1401111384, '2014-05-26 21:36:24', 'Suggestions', 'click'),
(2102, 1401111384, '2014-05-26 21:36:24', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[建议意见]]></Title><Description><![CDATA[请点击进入填写反馈内容]]></Description><PicUrl><![CDATA[http://gooraye.qiniudn.com/gr_logotext.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/suggestions/_controller/suggestions/_action/suggest/token/53705a8fb5564/openid/oqMIVt5aLt6bsS8Nnk_DHx5_l0UI.html]]></Url></item></Articles><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401111384</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2103, 1401111386, '2014-05-26 21:36:26', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111386";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111386</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2104, 1401111386, '2014-05-26 21:36:26', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111386";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111386</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2105, 1401111397, '2014-05-26 21:36:37', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111386";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111386</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2106, 1401111407, '2014-05-26 21:36:47', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111386";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111386</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2107, 1401111418, '2014-05-26 21:36:58', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401111417";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"宁波天气";s:5:"MsgId";s:19:"6017727714267359378";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401111417</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[宁波天气]]></Content>\n<MsgId>6017727714267359378</MsgId>\n</xml>'),
(2108, 1401111418, '2014-05-26 21:36:58', '15', 'opens'),
(2109, 1401111418, '2014-05-26 21:36:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[【宁波】\r\n2014年3月4日星期二\r\n今天天气：11℃~6℃ 小雨转阴，微风  \r\n紫外线指数：最弱  \r\n明天天气：11℃~4℃ 多云，微风 \r\n后天天气：9℃~5℃ \r\n小雨，微风]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401111418</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2110, 1401116023, '2014-05-26 22:53:43', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401116023";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:6:"天气";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401116023</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[天气]]></EventKey>\n</xml>'),
(2111, 1401116023, '2014-05-26 22:53:43', '天气', 'click'),
(2112, 1401116023, '2014-05-26 22:53:43', '<?xml version="1.0"?>\n<xml><Content><![CDATA[天气查询使用帮助\r\n回复 天气 绍兴\r\n即可查询绍兴天气\r\n]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401116023</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2113, 1401116038, '2014-05-26 22:53:58', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401116037";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"绍兴天气";s:5:"MsgId";s:19:"6017747557016545293";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401116037</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[绍兴天气]]></Content>\n<MsgId>6017747557016545293</MsgId>\n</xml>'),
(2114, 1401116038, '2014-05-26 22:53:58', '15', 'opens'),
(2115, 1401116038, '2014-05-26 22:53:58', '<?xml version="1.0"?>\n<xml><Content><![CDATA[【绍兴】\r\n2014年3月4日星期二\r\n今天天气：12℃~7℃ 小雨转阴，微风  \r\n紫外线指数：最弱  \r\n明天天气：11℃~3℃ 多云转阴，微风 \r\n后天天气：6℃~4℃ \r\n小雨，微风]]></Content><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401116038</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2116, 1401170171, '2014-05-27 13:56:11', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401170171";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401170171</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2117, 1401170187, '2014-05-27 13:56:27', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401170187";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401170187</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2118, 1401174469, '2014-05-27 15:07:49', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401174467";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:127:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401174467</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/wei_site/_controller/wei_site/_action/index/token/536e0fac9c2c6]]></EventKey>\n</xml>'),
(2119, 1401177306, '2014-05-27 15:55:06', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401177304";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:119:"http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401177304</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/online_booking/_controller/online_booking/_action/index]]></EventKey>\n</xml>'),
(2120, 1401177322, '2014-05-27 15:55:22', 'a:6:{s:10:"ToUserName";s:15:"gh_e65caef2c01d";s:12:"FromUserName";s:28:"oy6EYuF7hDpVCqVOEcg__t_apL30";s:10:"CreateTime";s:10:"1401177322";s:7:"MsgType";s:5:"event";s:5:"Event";s:5:"CLICK";s:8:"EventKey";s:4:"Card";}', '<xml><ToUserName><![CDATA[gh_e65caef2c01d]]></ToUserName>\n<FromUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></FromUserName>\n<CreateTime>1401177322</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[CLICK]]></Event>\n<EventKey><![CDATA[Card]]></EventKey>\n</xml>'),
(2121, 1401177322, '2014-05-27 15:55:22', 'Card', 'click'),
(2122, 1401177322, '2014-05-27 15:55:22', '<?xml version="1.0"?>\n<xml><ArticleCount>1</ArticleCount><Articles><item><Title><![CDATA[戴维营SPA 会员卡]]></Title><Description><![CDATA[绍兴县柯桥钱陶公路世贸中心英豪洲际公馆1楼]]></Description><PicUrl><![CDATA[http://www.gooraye.net/Addons/Card/View/default/Public/cover.png]]></PicUrl><Url><![CDATA[http://www.gooraye.net/index.php?s=/home/addons/execute/_addons/card/_controller/card/_action/show/token/536e0fac9c2c6/openid/oy6EYuF7hDpVCqVOEcg__t_apL30.html]]></Url></item></Articles><ToUserName><![CDATA[oy6EYuF7hDpVCqVOEcg__t_apL30]]></ToUserName><FromUserName><![CDATA[gh_e65caef2c01d]]></FromUserName><CreateTime>1401177322</CreateTime><MsgType><![CDATA[news]]></MsgType></xml>\n', '_replyData'),
(2123, 1401268400, '2014-05-28 17:13:20', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268400";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268400</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2124, 1401268402, '2014-05-28 17:13:22', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268400";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268400</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2125, 1401268402, '2014-05-28 17:13:22', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268401";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828302";s:9:"Longitude";s:10:"121.540329";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268401</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828302</Latitude>\n<Longitude>121.540329</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2126, 1401268408, '2014-05-28 17:13:28', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268406";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828302";s:9:"Longitude";s:10:"121.540321";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268406</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828302</Latitude>\n<Longitude>121.540321</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2127, 1401268412, '2014-05-28 17:13:32', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268411";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"你好";s:5:"MsgId";s:19:"6018401998363029863";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268411</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你好]]></Content>\n<MsgId>6018401998363029863</MsgId>\n</xml>'),
(2128, 1401268412, '2014-05-28 17:13:32', '15', 'opens'),
(2129, 1401268412, '2014-05-28 17:13:32', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我很好]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268412</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2130, 1401268412, '2014-05-28 17:13:32', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268400";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268400</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2131, 1401268413, '2014-05-28 17:13:33', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268413";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828299";s:9:"Longitude";s:10:"121.540291";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268413</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828299</Latitude>\n<Longitude>121.540291</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2132, 1401268420, '2014-05-28 17:13:40', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268420";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828312";s:9:"Longitude";s:10:"121.540382";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268420</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828312</Latitude>\n<Longitude>121.540382</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2133, 1401268423, '2014-05-28 17:13:43', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268400";s:7:"MsgType";s:5:"event";s:5:"Event";s:4:"VIEW";s:8:"EventKey";s:27:"http://wsq.qq.com/242096555";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268400</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[VIEW]]></Event>\n<EventKey><![CDATA[http://wsq.qq.com/242096555]]></EventKey>\n</xml>'),
(2134, 1401268426, '2014-05-28 17:13:46', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268426";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"傻逼";s:5:"MsgId";s:19:"6018402062787539307";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268426</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[傻逼]]></Content>\n<MsgId>6018402062787539307</MsgId>\n</xml>'),
(2135, 1401268426, '2014-05-28 17:13:46', '15', 'opens'),
(2136, 1401268426, '2014-05-28 17:13:46', '<?xml version="1.0"?>\n<xml><Content><![CDATA[deletedanswer]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268426</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2137, 1401268427, '2014-05-28 17:13:47', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268427";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828308";s:9:"Longitude";s:10:"121.540337";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268427</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828308</Latitude>\n<Longitude>121.540337</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2138, 1401268434, '2014-05-28 17:13:54', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268434";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828302";s:9:"Longitude";s:10:"121.540314";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268434</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828302</Latitude>\n<Longitude>121.540314</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2139, 1401268437, '2014-05-28 17:13:57', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268437";s:7:"MsgType";s:4:"text";s:7:"Content";s:15:"你在哪里？";s:5:"MsgId";s:19:"6018402110032179568";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268437</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你在哪里？]]></Content>\n<MsgId>6018402110032179568</MsgId>\n</xml>'),
(2140, 1401268437, '2014-05-28 17:13:57', '15', 'opens'),
(2141, 1401268437, '2014-05-28 17:13:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我在单位了我在上班呀]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268437</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2142, 1401268441, '2014-05-28 17:14:01', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268441";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828297";s:9:"Longitude";s:10:"121.540276";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268441</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828297</Latitude>\n<Longitude>121.540276</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2143, 1401268448, '2014-05-28 17:14:08', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268448";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828299";s:9:"Longitude";s:10:"121.540298";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268448</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828299</Latitude>\n<Longitude>121.540298</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2144, 1401268451, '2014-05-28 17:14:11', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268450";s:7:"MsgType";s:4:"text";s:7:"Content";s:9:"开心吗";s:5:"MsgId";s:19:"6018402165866754418";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268450</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[开心吗]]></Content>\n<MsgId>6018402165866754418</MsgId>\n</xml>'),
(2145, 1401268451, '2014-05-28 17:14:11', '15', 'opens'),
(2146, 1401268451, '2014-05-28 17:14:11', '<?xml version="1.0"?>\n<xml><Content><![CDATA[不开心]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268451</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2147, 1401268455, '2014-05-28 17:14:15', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268454";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540298";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268454</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540298</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2148, 1401268461, '2014-05-28 17:14:21', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268460";s:7:"MsgType";s:4:"text";s:7:"Content";s:12:"为什么？";s:5:"MsgId";s:19:"6018402208816427381";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268460</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[为什么？]]></Content>\n<MsgId>6018402208816427381</MsgId>\n</xml>'),
(2149, 1401268461, '2014-05-28 17:14:21', '15', 'opens'),
(2150, 1401268461, '2014-05-28 17:14:21', '<?xml version="1.0"?>\n<xml><Content><![CDATA[不为什么。]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268461</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2151, 1401268461, '2014-05-28 17:14:21', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268461";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540298";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268461</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540298</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2152, 1401268469, '2014-05-28 17:14:29', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268469";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540291";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268469</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540291</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2153, 1401268475, '2014-05-28 17:14:35', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268475";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828302";s:9:"Longitude";s:10:"121.540352";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268475</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828302</Latitude>\n<Longitude>121.540352</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2154, 1401268477, '2014-05-28 17:14:37', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268477";s:7:"MsgType";s:4:"text";s:7:"Content";s:16:"你有 女朋友";s:5:"MsgId";s:19:"6018402281830871415";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268477</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你有 女朋友]]></Content>\n<MsgId>6018402281830871415</MsgId>\n</xml>'),
(2155, 1401268477, '2014-05-28 17:14:37', '15', 'opens'),
(2156, 1401268477, '2014-05-28 17:14:37', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我～ 现在还没不过会有的]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268477</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2157, 1401268482, '2014-05-28 17:14:42', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268481";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540306";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268481</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540306</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2158, 1401268489, '2014-05-28 17:14:49', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268489";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828299";s:9:"Longitude";s:10:"121.540291";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268489</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828299</Latitude>\n<Longitude>121.540291</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2159, 1401268495, '2014-05-28 17:14:55', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268495";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540329";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268495</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540329</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2160, 1401268497, '2014-05-28 17:14:57', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268497";s:7:"MsgType";s:4:"text";s:7:"Content";s:18:"你怎么知道啊";s:5:"MsgId";s:19:"6018402367730217337";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268497</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你怎么知道啊]]></Content>\n<MsgId>6018402367730217337</MsgId>\n</xml>'),
(2161, 1401268497, '2014-05-28 17:14:57', '15', 'opens'),
(2162, 1401268497, '2014-05-28 17:14:57', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我也不知道]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268497</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2163, 1401268502, '2014-05-28 17:15:02', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268502";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828308";s:9:"Longitude";s:10:"121.540359";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268502</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828308</Latitude>\n<Longitude>121.540359</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2164, 1401268509, '2014-05-28 17:15:09', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268509";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828300";s:9:"Longitude";s:10:"121.540306";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268509</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828300</Latitude>\n<Longitude>121.540306</Longitude>\n<Precision>65.000000</Precision>\n</xml>'),
(2165, 1401268511, '2014-05-28 17:15:11', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268511";s:7:"MsgType";s:4:"text";s:7:"Content";s:27:"你怎么什么也不知道";s:5:"MsgId";s:19:"6018402427859759483";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268511</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[你怎么什么也不知道]]></Content>\n<MsgId>6018402427859759483</MsgId>\n</xml>'),
(2166, 1401268511, '2014-05-28 17:15:11', '15', 'opens'),
(2167, 1401268511, '2014-05-28 17:15:11', '<?xml version="1.0"?>\n<xml><Content><![CDATA[我也不知道]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268511</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2168, 1401268520, '2014-05-28 17:15:20', 'a:6:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268520";s:7:"MsgType";s:4:"text";s:7:"Content";s:6:"无聊";s:5:"MsgId";s:19:"6018402466514465149";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268520</CreateTime>\n<MsgType><![CDATA[text]]></MsgType>\n<Content><![CDATA[无聊]]></Content>\n<MsgId>6018402466514465149</MsgId>\n</xml>'),
(2169, 1401268520, '2014-05-28 17:15:20', '15', 'opens'),
(2170, 1401268520, '2014-05-28 17:15:20', '<?xml version="1.0"?>\n<xml><Content><![CDATA[明明在聊。]]></Content><ToUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></ToUserName><FromUserName><![CDATA[gh_826a00b218bb]]></FromUserName><CreateTime>1401268520</CreateTime><MsgType><![CDATA[text]]></MsgType></xml>\n', '_replyData'),
(2171, 1401268520, '2014-05-28 17:15:20', 'a:8:{s:10:"ToUserName";s:15:"gh_826a00b218bb";s:12:"FromUserName";s:28:"oqMIVt5aLt6bsS8Nnk_DHx5_l0UI";s:10:"CreateTime";s:10:"1401268520";s:7:"MsgType";s:5:"event";s:5:"Event";s:8:"LOCATION";s:8:"Latitude";s:9:"29.828297";s:9:"Longitude";s:10:"121.540283";s:9:"Precision";s:9:"65.000000";}', '<xml><ToUserName><![CDATA[gh_826a00b218bb]]></ToUserName>\n<FromUserName><![CDATA[oqMIVt5aLt6bsS8Nnk_DHx5_l0UI]]></FromUserName>\n<CreateTime>1401268520</CreateTime>\n<MsgType><![CDATA[event]]></MsgType>\n<Event><![CDATA[LOCATION]]></Event>\n<Latitude>29.828297</Latitude>\n<Longitude>121.540283</Longitude>\n<Precision>65.000000</Precision>\n</xml>');

-- --------------------------------------------------------

--
-- 表的结构 `wp_xydzp`
--

CREATE TABLE IF NOT EXISTS `wp_xydzp` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `keyword` varchar(255) NOT NULL COMMENT '关键词',
  `start_date` int(10) NOT NULL COMMENT '开始时间',
  `end_date` int(10) NOT NULL COMMENT '结束日期',
  `cTime` int(10) NOT NULL COMMENT '活动创建时间',
  `states` char(10) NOT NULL DEFAULT '0' COMMENT '活动状态',
  `picurl` int(10) unsigned NOT NULL COMMENT '封面图片',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `guiz` text NOT NULL COMMENT '活动规则',
  `choujnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '每日抽奖次数',
  `des` text NOT NULL COMMENT '活动介绍',
  `des_jj` text NOT NULL COMMENT '活动介绍简介',
  `token` varchar(255) NOT NULL COMMENT 'Token'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wp_xydzp`
--

INSERT INTO `wp_xydzp` (`id`, `keyword`, `start_date`, `end_date`, `cTime`, `states`, `picurl`, `title`, `guiz`, `choujnum`, `des`, `des_jj`, `token`) VALUES
(4, '测试', 1393409640, 1396260840, 1395575747, '0', 40, '44', '33大转盘', 35, '大转盘', '大转盘', '532c10ef659fa'),
(5, '1', 1396330380, 1398317580, 1396697806, '0', 39, '幸运大转盘测试', '这个是规则', 990, '<p>\r\n 这个是介绍&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p>', '这个是推送的简介', '533f9497d43ff'),
(6, 'ddd', 1400753880, 1402741080, 1400753988, '0', 0, 'ddd', '', 5, '<p>dd<br/></p>', 'd', '53705a8fb5564');

-- --------------------------------------------------------

--
-- 表的结构 `wp_xydzp_jplist`
--

CREATE TABLE IF NOT EXISTS `wp_xydzp_jplist` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `gailv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '中奖概率',
  `gailv_str` varchar(255) NOT NULL COMMENT '参数',
  `xydzp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '幸运大转盘关联的活动id',
  `jlnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖励数量',
  `type` char(50) NOT NULL DEFAULT '0' COMMENT '奖品中奖方式',
  `gailv_maxnum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单日发放上限',
  `xydzp_option_id` int(10) unsigned NOT NULL COMMENT '幸运大转盘关联的全局奖品id'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `wp_xydzp_jplist`
--

INSERT INTO `wp_xydzp_jplist` (`id`, `gailv`, `gailv_str`, `xydzp_id`, `jlnum`, `type`, `gailv_maxnum`, `xydzp_option_id`) VALUES
(3, 55, '1,2', 4, 23, '0', 23, 6),
(4, 5, '', 4, 5, '0', 5, 9),
(5, 6, '', 4, 6, '0', 6, 7),
(6, 6, '', 4, 6, '0', 6, 8),
(7, 10, '', 4, 1, '0', 99999, 10),
(9, 77, '', 4, 1, '0', 99, 8),
(10, 4, '', 5, 1, '0', 77, 11),
(11, 15, '', 5, 1, '0', 66, 12),
(12, 30, '', 5, 1, '0', 555, 13),
(13, 70, '', 5, 1, '0', 5555, 14);

-- --------------------------------------------------------

--
-- 表的结构 `wp_xydzp_log`
--

CREATE TABLE IF NOT EXISTS `wp_xydzp_log` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `zjdate` int(10) unsigned NOT NULL COMMENT '中奖时间',
  `xydzp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '活动id',
  `xydzp_option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '奖品id',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '领奖状态',
  `zip` int(10) unsigned NOT NULL COMMENT '邮编',
  `iphone` varchar(255) NOT NULL COMMENT '电话',
  `address` text NOT NULL COMMENT '收件地址',
  `message` text NOT NULL COMMENT '留言',
  `uid` varchar(255) NOT NULL COMMENT '用户openid'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `wp_xydzp_log`
--

INSERT INTO `wp_xydzp_log` (`id`, `zjdate`, `xydzp_id`, `xydzp_option_id`, `state`, `zip`, `iphone`, `address`, `message`, `uid`) VALUES
(19, 1396694573, 5, 13, 0, 0, '', '', '', 'owYXBjtoBtTAx_4hxSptaUTCawUQ'),
(20, 1396697826, 5, 13, 1, 0, '', '', '', 'owYXBjtoBtTAx_4hxSptaUTCawUQ'),
(21, 1396698320, 5, 13, 1, 0, '', '', '', 'owYXBjtoBtTAx_4hxSptaUTCawUQ');

-- --------------------------------------------------------

--
-- 表的结构 `wp_xydzp_option`
--

CREATE TABLE IF NOT EXISTS `wp_xydzp_option` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `duijma` text NOT NULL COMMENT '兑奖码',
  `title` varchar(255) NOT NULL COMMENT '奖品名称',
  `pic` int(10) unsigned NOT NULL COMMENT '奖品图片',
  `miaoshu` text NOT NULL COMMENT '奖品描述',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存数量',
  `jptype` char(10) NOT NULL DEFAULT '0' COMMENT '奖品类型',
  `token` varchar(255) NOT NULL COMMENT 'Token',
  `isdf` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否为谢谢惠顾类'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `wp_xydzp_option`
--

INSERT INTO `wp_xydzp_option` (`id`, `duijma`, `title`, `pic`, `miaoshu`, `num`, `jptype`, `token`, `isdf`) VALUES
(9, '', '一等奖', 0, '234', 17, '0', '532c10ef659fa', 0),
(6, '', '四等奖', 40, '12313', 0, '0', '532c10ef659fa', 0),
(7, '', '三等奖', 0, '12313', 10, '0', '532c10ef659fa', 0),
(8, '', '二等奖', 0, '2234', 1, '0', '532c10ef659fa', 0),
(10, '', '祝您好运', 0, '谢谢，下次再来', 12, '0', '532c10ef659fa', 1),
(11, '', '一等奖', 40, 'VIp服务1个月', 96, '0', '533f9497d43ff', 0),
(12, '', '二等奖', 41, '只用卷', 771, '0', '533f9497d43ff', 0),
(13, '', '三等奖', 42, '图好久', 654, '0', '533f9497d43ff', 0),
(14, '', '感谢再来', 43, '444', 3333, '0', '533f9497d43ff', 1),
(15, 'dddddd', '测试', 0, '<p>rddd</p>', 1, '1', '53705a8fb5564', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_xydzp_userlog`
--

CREATE TABLE IF NOT EXISTS `wp_xydzp_userlog` (
`id` int(10) unsigned NOT NULL COMMENT '主键',
  `uid` varchar(255) NOT NULL COMMENT '用户id',
  `xydzp_id` int(10) unsigned NOT NULL COMMENT '幸运大转盘关联的活动id',
  `num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '已经抽奖的次数',
  `cjdate` int(10) NOT NULL COMMENT '抽奖日期'
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wp_xydzp_userlog`
--

INSERT INTO `wp_xydzp_userlog` (`id`, `uid`, `xydzp_id`, `num`, `cjdate`) VALUES
(1, 'owYXBjtoBtTAx_4hxSptaUTCawUQ', 5, 21, 1396698320);

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
-- Indexes for table `wp_log`
--
ALTER TABLE `wp_log`
 ADD PRIMARY KEY (`id`);

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
-- Indexes for table `wp_photo`
--
ALTER TABLE `wp_photo`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_photo_pic`
--
ALTER TABLE `wp_photo_pic`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_picture`
--
ALTER TABLE `wp_picture`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_sms_log`
--
ALTER TABLE `wp_sms_log`
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
-- Indexes for table `wp_xydzp`
--
ALTER TABLE `wp_xydzp`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_xydzp_jplist`
--
ALTER TABLE `wp_xydzp_jplist`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_xydzp_log`
--
ALTER TABLE `wp_xydzp_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_xydzp_option`
--
ALTER TABLE `wp_xydzp_option`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wp_xydzp_userlog`
--
ALTER TABLE `wp_xydzp_userlog`
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=798;
--
-- AUTO_INCREMENT for table `wp_addons`
--
ALTER TABLE `wp_addons`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `wp_attachment`
--
ALTER TABLE `wp_attachment`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wp_attribute`
--
ALTER TABLE `wp_attribute`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=332;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wp_card_notice`
--
ALTER TABLE `wp_card_notice`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_category`
--
ALTER TABLE `wp_category`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',AUTO_INCREMENT=45;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `wp_custom_reply_mult`
--
ALTER TABLE `wp_custom_reply_mult`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wp_custom_reply_news`
--
ALTER TABLE `wp_custom_reply_news`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `wp_custom_reply_text`
--
ALTER TABLE `wp_custom_reply_text`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wp_document`
--
ALTER TABLE `wp_document`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文档ID',AUTO_INCREMENT=24;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `wp_log`
--
ALTER TABLE `wp_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_member`
--
ALTER TABLE `wp_member`
MODIFY `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=199;
--
-- AUTO_INCREMENT for table `wp_member_public`
--
ALTER TABLE `wp_member_public`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=81;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `wp_online_booking`
--
ALTER TABLE `wp_online_booking`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `wp_panorama`
--
ALTER TABLE `wp_panorama`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- AUTO_INCREMENT for table `wp_photo`
--
ALTER TABLE `wp_photo`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wp_photo_pic`
--
ALTER TABLE `wp_photo_pic`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `wp_picture`
--
ALTER TABLE `wp_picture`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id自增',AUTO_INCREMENT=166;
--
-- AUTO_INCREMENT for table `wp_sms_log`
--
ALTER TABLE `wp_sms_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `wp_suggestions`
--
ALTER TABLE `wp_suggestions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',AUTO_INCREMENT=199;
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
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `wp_weisite_footer`
--
ALTER TABLE `wp_weisite_footer`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `wp_weisite_slideshow`
--
ALTER TABLE `wp_weisite_slideshow`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `wp_weixin_log`
--
ALTER TABLE `wp_weixin_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2172;
--
-- AUTO_INCREMENT for table `wp_xydzp`
--
ALTER TABLE `wp_xydzp`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `wp_xydzp_jplist`
--
ALTER TABLE `wp_xydzp_jplist`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `wp_xydzp_log`
--
ALTER TABLE `wp_xydzp_log`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `wp_xydzp_option`
--
ALTER TABLE `wp_xydzp_option`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `wp_xydzp_userlog`
--
ALTER TABLE `wp_xydzp_userlog`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

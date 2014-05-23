DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='photo' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='photo' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_photo`;

DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='photo_pic' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='photo_pic' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_photo_pic`;


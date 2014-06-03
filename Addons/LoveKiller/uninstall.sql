DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='ml_lovek_manage' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='ml_lovek_manage' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_ml_lovek_manage`;

DELETE FROM `wp_attribute` WHERE model_id = (SELECT id FROM wp_model WHERE `name`='ml_lovek_log' ORDER BY id DESC LIMIT 1);
DELETE FROM `wp_model` WHERE `name`='ml_lovek_log' ORDER BY id DESC LIMIT 1;
DROP TABLE IF EXISTS `wp_ml_lovek_log`;
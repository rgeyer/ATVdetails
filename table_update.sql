alter table ATVdetails
add column IF NOT EXISTS `pd_update` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after pogo_update,
add column IF NOT EXISTS `rgc_update` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after pd_update,
add column IF NOT EXISTS `pingreboot` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after rgc_update,
add column IF NOT EXISTS `temperature` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after pingreboot,
change column IF EXISTS `eth0` ip varchar(40),
add column IF NOT EXISTS `gmail` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after ip,
add column IF NOT EXISTS `PD_user_login` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL after PD_auth_password,
;

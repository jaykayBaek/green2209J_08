CREATE TABLE `j_user` (
	`idx`	bigint(20)	AUTO_INCREMENT PRIMARY KEY,
	`email`	varchar(40)	NOT NULL,
	`password`	varchar(20)	NULL,
	`authority`	bit(1)	NULL,
	`date_created`	datetime	DEFAULT now(),
	`date_deleted`	datetime	NULL,
	`date_visited`	datetime	DEFAULT now(),
	`last_updated_ip`	varchar(255)	NULL,
	/* - eanbled - 회원탈퇴인지 0아님 1탈퇴 -  */
	`enabled`	bit(1)	NULL
);


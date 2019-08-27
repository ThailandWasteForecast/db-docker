CREATE TABLE `region` (
    `id` VARCHAR(2) PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `province` (
    `id` VARCHAR(2) PRIMARY KEY,
    `region_id` VARCHAR(2) NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `size_sqkm` FLOAT NOT NULL,
    KEY `FK_province_region` (`region_id`),
    CONSTRAINT `FK_province_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `district` (
    `id` VARCHAR(4) PRIMARY KEY,
    `region_id` VARCHAR(2) NOT NULL,
    `province_id` VARCHAR(2) NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    KEY `FK_district_region` (`region_id`),
    KEY `FK_district_province` (`province_id`),
    CONSTRAINT `FK_district_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
    CONSTRAINT `FK_district_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `reo` (
    `id` VARCHAR(2) PRIMARY KEY,
    `name` VARCHAR(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `municipality` (
    `id` VARCHAR(12) PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `district_id` VARCHAR(4) NOT NULL,
    `province_id` VARCHAR(2) NOT NULL,
    `region_id` VARCHAR(2) NOT NULL,
    `reo_id` VARCHAR(2) DEFAULT NULL,
    `level_type` VARCHAR(5) NOT NULL,
    `size_type` VARCHAR(5) NOT NULL,
    `size_sqkm` FLOAT NOT NULL,
    `name_rcode` VARCHAR(10) DEFAULT NULL,
    `level_type_rcode` VARCHAR(10) DEFAULT NULL,
    `size_type_rcode` VARCHAR(10) DEFAULT NULL,
    KEY `FK_municipality_region` (`region_id`),
    KEY `FK_municipality_province` (`province_id`),
    KEY `FK_municipality_district` (`district_id`),
    KEY `FK_municipality_reo` (`reo_id`),
    CONSTRAINT `FK_municipality_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
    CONSTRAINT `FK_municipality_province` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`),
    CONSTRAINT `FK_municipality_district` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
    CONSTRAINT `FK_municipality_reo` FOREIGN KEY (`reo_id`) REFERENCES `reo` (`id`),
    INDEX `IDX_municipality_name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

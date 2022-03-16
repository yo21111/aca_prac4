create database shop;
use shop;

CREATE TABLE `shop`.`list` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(20) NOT NULL,
  `company` VARCHAR(20) NOT NULL,
  `text` VARCHAR(30) NOT NULL,
  `price` INT NOT NULL,
  `sale` TINYINT NOT NULL DEFAULT 0,
  `salePer` INT NOT NULL,
  `uploadDate` DATE NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into list 
values(1, "구강 관리 제품", "닥터노아", "치실", 5300, 0, 0, "2022-3-15", "dentalFloss.png");

insert into list 
values(2, "칫솔", "닥터노아", "마루 대나무 칫솔 케이스 세트", 7200, 1, 10, "2022-3-15", "case_Set.jpg");

insert into list 
values(3, "기타", "닥터노아", "규조토 칫솔꽂이", 3200, 0, 0, now(), "toothbrushBox.png");

insert into list 
values(4, "치약", "닥터노아", "마루 치약", 5900, 0, 0, "2022-3-15", "toothpaste.jpg");

select * from list;
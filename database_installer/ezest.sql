/*
SQLyog Community Edition- MySQL GUI v5.23 RC2
Host - 5.0.45-community-nt : Database - ezest
*********************************************************************
Server version : 5.0.45-community-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `ezest`;

USE `ezest`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `accommodation` */

DROP TABLE IF EXISTS `accommodation`;

CREATE TABLE `accommodation` (
  `LocationID` varchar(100) NOT NULL,
  `LocationName` varchar(200) default NULL,
  `LocationImage` varchar(200) default NULL,
  `LocationDesc` tinytext,
  PRIMARY KEY  (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accommodation` */

insert  into `accommodation`(`LocationID`,`LocationName`,`LocationImage`,`LocationDesc`) values ('L001','Goa','Goa1.jpg','Our resort is 5km from beach\r\n\n'),('L002','Coorg','Coorg.jpg','Our resort is 5Km from this location'),('L003','Manali','Manali.jpg','Our resort is 15kms from this location'),('L004','Kodaikanal','Kodaikanal.jpg','Our resort is 10kms from this location'),('L005','Munnar','Munnar.jpg','Our resort is 15kms from this location');

/*Table structure for table `bookingsinfo` */

DROP TABLE IF EXISTS `bookingsinfo`;

CREATE TABLE `bookingsinfo` (
  `BookingID` varchar(100) NOT NULL,
  `ResortID` varchar(100) default NULL,
  `RoomID` varchar(100) default NULL,
  `LocationName` varchar(100) default NULL,
  `UserID` varchar(100) default NULL,
  `MemberType` varchar(100) default NULL,
  `RoomCharges` float default NULL,
  `From` date default NULL,
  `To` date default NULL,
  `BookingStatus` varchar(100) default NULL,
  PRIMARY KEY  (`BookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookingsinfo` */

insert  into `bookingsinfo`(`BookingID`,`ResortID`,`RoomID`,`LocationName`,`UserID`,`MemberType`,`RoomCharges`,`From`,`To`,`BookingStatus`) values ('B01','R001','R0011','Goa','kalyan','Platinum',375,'2008-02-26','2008-02-29','CheckedOut'),('B02','R002','R0024','Coorg','kalyan','Platinum',375,'2008-02-22','2008-02-25','CheckedOut'),('B03','R001','R0011','Goa','kalyan','Platinum',375,'2008-02-01','2008-02-06','CheckedOut'),('B04','R001','R0011','Goa','Subhas','Gold',400,'2008-02-22','2008-02-22','CheckedOut');

/*Table structure for table `feedback` */

DROP TABLE IF EXISTS `feedback`;

CREATE TABLE `feedback` (
  `FId` int(10) NOT NULL auto_increment,
  `UserID` varchar(100) default NULL,
  `Feedback` text,
  `DateSubmitted` date default NULL,
  PRIMARY KEY  (`FId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `feedback` */

insert  into `feedback`(`FId`,`UserID`,`Feedback`,`DateSubmitted`) values (1,'kalyan','We choose Goa .Their service is very nice','2008-02-18');

/*Table structure for table `invites` */

DROP TABLE IF EXISTS `invites`;

CREATE TABLE `invites` (
  `Sno` int(10) NOT NULL auto_increment,
  `From` varchar(200) NOT NULL default '',
  `To` varchar(200) default NULL,
  `Status` varchar(200) default NULL,
  PRIMARY KEY  (`Sno`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `invites` */

insert  into `invites`(`Sno`,`From`,`To`,`Status`) values (1,'kalyan','xyz@gmail.com,ghij@yahoo.com','Invited'),(2,'kalyan','Raj@gmail.com,James@yahoo.com','Invited'),(3,'kalyan','Raju@gmail.com,\r\nRamu@yahoo.com','Invite');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `UserID` varchar(200) NOT NULL,
  `Password` varchar(200) default NULL,
  `Auth` varchar(200) default NULL,
  PRIMARY KEY  (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`UserID`,`Password`,`Auth`) values ('admin','admin','0'),('kalyan','kalyan','1'),('Rahul','Rahul','1'),('Rajesh','raj','1'),('Ram','ram','1'),('Subhas','Subhas','1');

/*Table structure for table `resortsinfo` */

DROP TABLE IF EXISTS `resortsinfo`;

CREATE TABLE `resortsinfo` (
  `ResortID` varchar(100) NOT NULL,
  `LocationName` varchar(100) default NULL,
  `ResortImage` varchar(200) default NULL,
  `NoOfRooms` int(50) default NULL,
  `NoOfRoomsAvailable` int(50) default NULL,
  `Restaurant` varchar(100) default NULL,
  `Swimmingpool` varchar(100) default NULL,
  `GamesRoom` varchar(100) default NULL,
  `Casino` varchar(100) default NULL,
  `YogaandMeditation` varchar(100) default NULL,
  `SteamBath` varchar(100) default NULL,
  `GymandHealthCenter` varchar(100) default NULL,
  PRIMARY KEY  (`ResortID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `resortsinfo` */

insert  into `resortsinfo`(`ResortID`,`LocationName`,`ResortImage`,`NoOfRooms`,`NoOfRoomsAvailable`,`Restaurant`,`Swimmingpool`,`GamesRoom`,`Casino`,`YogaandMeditation`,`SteamBath`,`GymandHealthCenter`) values ('R001','Goa','GoaResort.jpg',6,6,'Yes','Yes','Yes','No','Yes','No','No'),('R002','Coorg','CoorgResort.jpg',6,6,'Yes','No','Yes','Yes','No','Yes','Yes'),('R003','Manali','ManaliResort.jpg',5,5,'Yes','Yes','Yes','Yes','Yes','Yes','Yes'),('R004','Kodaikanal','KodaikanalResort.jpg',5,5,'Yes','Yes','No','No','Yes','Yes','Yes'),('R005','Munnar','MunnarResort.jpg',6,6,'Yes','No','No','No','Yes','Yes','Yes');

/*Table structure for table `roomsinfo` */

DROP TABLE IF EXISTS `roomsinfo`;

CREATE TABLE `roomsinfo` (
  `Sno` varchar(100) NOT NULL,
  `RoomID` varchar(100) default NULL,
  `ResortID` varchar(100) default NULL,
  `LocationName` varchar(100) default NULL,
  `RoomType` varchar(100) default NULL,
  `RoomArea` varchar(100) default NULL,
  `DryKitchenette` varchar(100) default NULL,
  `SofacumBed` varchar(100) default NULL,
  `DoubleBeds` varchar(100) default NULL,
  `Telephone` varchar(100) default NULL,
  `Television` varchar(100) default NULL,
  `RoomCharges` float default NULL,
  PRIMARY KEY  (`Sno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `roomsinfo` */

insert  into `roomsinfo`(`Sno`,`RoomID`,`ResortID`,`LocationName`,`RoomType`,`RoomArea`,`DryKitchenette`,`SofacumBed`,`DoubleBeds`,`Telephone`,`Television`,`RoomCharges`) values ('1','R0011','R001','Goa','StudioApartment','450','Yes','Yes','No','Yes','Yes',500),('2','R0012','R001','Goa','SingleBedRoomApartment','450','Yes','Yes','Yes','Yes','Yes',650),('3','R0013','R001','Goa','DoubleBedRoomApartment','650','Yes','Yes','Yes','Yes','Yes',750),('4','R0024','R002','Coorg','StudioApartment','450','Yes','Yes','No','Yes','Yes',500),('5','R0015','R001','Goa','SingleBedRoomApartment','450','Yes','No','No','Yes','Yes',550),('6','R0016','R001','Goa','StudioApartment','450','Yes','Yes','No','Yes','Yes',500),('7','R0017','R001','Goa','DoubleBedRoomApartment','600','Yes','Yes','Yes','Yes','Yes',600),('8','R0028','R002','Coorg','SingleBedRoomApartment','500','Yes','Yes','Yes','Yes','Yes',600),('9','R0059','R005','Munnar','StudioApartment','500','Yes','Yes','Yes','Yes','Yes',600);

/*Table structure for table `userprofile` */

DROP TABLE IF EXISTS `userprofile`;

CREATE TABLE `userprofile` (
  `RegID` varchar(50) NOT NULL,
  `UserID` varchar(100) default NULL,
  `FirstName` varchar(100) default NULL,
  `LastName` varchar(100) default NULL,
  `Age` varchar(100) default NULL,
  `EmailAddress` varchar(100) default NULL,
  `Address` tinytext,
  `ContactNumber` varchar(100) default NULL,
  `Occupation` varchar(100) default NULL,
  `MemberType` varchar(100) default NULL,
  `AmountDeposited` float default NULL,
  PRIMARY KEY  (`RegID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `userprofile` */

insert  into `userprofile`(`RegID`,`UserID`,`FirstName`,`LastName`,`Age`,`EmailAddress`,`Address`,`ContactNumber`,`Occupation`,`MemberType`,`AmountDeposited`) values ('M001','Ram','Ram','Raju','35','Ram@yahoo.com','Ram,KPHB,Hyderabad','65545658','Business','Gold',10000),('M002','Rajesh','Rajesh','','40','Raj@hotmail.com','Raj,Ameerpet,Hyderabad','9842313211','Business','Platinum',15000),('M003','kalyan','kalyan','','25','kalyan@gmail.com','kalyan,Banglore-21','65524845','SE','Platinum',15000),('M004','Rahul','Rahul','Roy','25','Rahul@gmail.com','Hyderabad','9989989989','Business','Gold',10000),('M005','Subhas','Subhas','Ghai','43','Subhas@yahoo.com','Hyderabad','9989989989','Film Maker','Gold',10000);

alter table userprofile add(approve integer(1));
update userprofile set approve=1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

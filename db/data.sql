-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: webpro-project
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `price` float(8,2) NOT NULL,
  `pay_method` enum('cash','credit') NOT NULL,
  `order_id` int NOT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,360.00,'cash',1),(2,280.00,'cash',2),(3,170.00,'credit',3),(4,140.00,'cash',4),(5,240.00,'credit',5),(6,390.00,'credit',6),(7,320.00,'cash',7),(8,210.00,'credit',8),(9,230.00,'cash',9),(10,320.00,'credit',10),(11,300.00,'credit',11),(12,140.00,'credit',12),(13,320.00,'credit',13),(14,170.00,'cash',14),(15,190.00,'credit',15),(16,190.00,'credit',16),(17,400.00,'credit',17),(18,380.00,'cash',18),(19,200.00,'credit',19),(20,450.00,'credit',20),(21,240.00,'cash',21),(22,220.00,'credit',22),(23,240.00,'cash',23),(24,400.00,'credit',24),(25,200.00,'cash',25),(26,340.00,'credit',26),(27,140.00,'cash',27),(28,160.00,'credit',28),(29,500.00,'cash',29),(30,320.00,'cash',30),(31,240.00,'cash',41),(32,240.00,'cash',41),(33,650.00,'cash',51);
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `cust_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `point` int NOT NULL,
  PRIMARY KEY (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'ภีมพัฒน์','ภีมพัฒน์','0867418529','peemphat@gmail.com',0),(2,'ปรียา','ไกรภพ','0815255221','preeya72@gmail.com',0),(3,'สุรพล','ทรัพย์ปรีชา','0812190826','surapon55@gmail.com',0),(4,'พรพิมล','จันทรพร','0863526855','pornpimol@gmail.com',0),(5,'ณัฐวิโรจน์','แสงสว่าง','0913255158','natwirod56@gmail.com',0),(6,'นวพร','ป้องภัย','0963675889','nawaporn44@gmail.com',0),(7,'พงศพัศ','ชาติสมบัติ','0803896797','pongsapat85@gmail.com',0),(8,'ปัณฑ์','สายสำอาง','0914926000','pun7894@gmail.com',0),(9,'พร้อมพงศ์','วัฒนศักดิ์มนตรี','0895542369','pompong753@gmail.com',0),(10,'จันทรัตว์','พิกุลเทพ','0940162723','jantarat@gmail.com',0),(11,'บดินทร์','สีสะอาด','0836682073','badin1@gmail.com',0),(12,'จิรกฤต','สุวรรณโชค','0857939431','jirakit@gmail.com',0),(13,'ชนกนันท์','เกียรติวิทยา','0861999471','chanoknan@gmail.com',0),(14,'ไกรสร','อุดมวิทยา','0908206558','kaisorn2@gmail.com',0),(15,'บาลิกา','ทรัพย์มา','0909060264','balika@gmail.com',0),(16,'ภูดิส','รัตนเศรษฐา','0873055523','phudis2@gmail.com',0),(17,'เรวิทย์','โอภาสพงส์','0917689089','rawit1@gmail.com',0),(18,'ทิพย์สุดา ','วงศ์วริศธารา','0908188804','tipsuda@gmail.com',0),(19,'ณิชมน','จันทรสมบัติ','0842445964','nichamon@gmail.com',0),(20,'พิมพ์ทอง','สิงห์ขาว','0852602621','pimtong@gmail.com',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `shift` enum('1','2') NOT NULL,
  `rest_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `rest_id` (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'ภคภัทร','โชตวาณิช','0820979172','phakhaphat@gmail.com','1',1),(2,'ณภัค','เจริญวัฒนา','0811005272','napak@gmail.com','1',1),(3,'กนกพร','วิไลรัตน์','0860128654','kanokpond@gmail.com','1',1),(4,'ไลลา','ถนอมจิต','0931847586','lila@gmail.com','1',1),(5,'ธยานี','สรพินิจ','0866913331','thayanee@gmail.com','1',1),(6,'วิมลวรรณ','กิตติภัทรา','0918091205','wimon@gmail.com','1',1),(7,'ธนพล','ทรัพย์ศิลา','0924954437','thanapon@gmail.com','1',1),(8,'บวรวิทย์','โชติพาณิชย์','0890641391','bualwit@gmail.com','1',1),(9,'ตรีวิทย์','ตั้งทิพย์','0880483410','triwit@gmail.com','2',1),(10,'พงษ์ศักดิ์','กระจ่างวงศ์','0923871116','pongsak@gmail.com','2',1),(11,'เศรษฐี','ปัทมเดชา','0865282447','richman@gmail.com','2',1),(12,'ขวัญ','วัชรโสภณ','0914419916','kwan12@gmail.com','2',1),(13,'ปริศนา','แสงดารา','0917178049','mystery@gmail.com','2',1),(14,'รณพร','วรภัทรศิริสกุล','0839497426','onnapond@gmail.com','2',1),(15,'พิชญาภรณ์','พาใจขวัญ','0894171645','pitchaya@gmail.com','2',1),(16,'ธีภพ','ทัศนเรือง','0885018307','tipob1@gmail.com','2',1),(17,'ภูดิส','สันติกสุล','0902198170','phudis@gmail.com','1',2),(18,'ชัชญา','ไลรัตน์','0927516344','chaya1@gmail.com','1',2),(19,'ติณณภพ','สว่างวิทยา','0906061226','tinnapob@gmail.com','1',2),(20,'ไกรสร','วงศ์เจริญ','0953073773','kaisorn@gmail.com','1',2),(21,'พลภัทร','รัตนกิจโกศล','0899103958','ponpat@gmail.com','1',2),(22,'ธนิสร','บำรุงกาญจน์','0900149069','thanisorn@gmail.com','1',2),(23,'กิตติ','ปราสาทงาม','0924204997','kitti1@gmail.com','1',2),(24,'อภิชญา','ไม้ทอง','0922140921','apitchaya@gmail.com','1',2),(25,'ศุภาพิชญ์','สันติกสุล','0944775345','supapit@gmail.com','2',2),(26,'ชัชชน','อินทรเกียรติ','0928226035','chon12@gmail.com','2',2),(27,'บวรรัช','เกษมทรัพย์','0879908336','rush12@gmail.com','2',2),(28,'ภูริพัฒน์','โชตวาณิช','0907609340','pjuripat@gmail.com','2',2),(29,'เสกข์','ชาติสมบัติ','0895199209','sage12@gmail.com','2',2),(30,'ปัณยตา','ภูภักดี','0899278528','panyata@gmail.com','2',2),(31,'พิมพ์','พาสกุล','0833967275','pim123@gmail.com','2',2),(32,'โสรัตน์','สุขเสรี','0911062215','sorat1@gmail.com','2',2),(33,'ณัฏฐชัย','สตาภิรมย์','0855296054','nattachai@gmail.com','1',3),(34,'ขวัญทิพย์ ','รัตนเศรษฐา','0909314374','kwantip@gmail.com','1',3),(35,'ปุณพจน์','วรารักษ์','0837090355','punpot@gmail.com','1',3),(36,'นาถธรรม','อรุณรุ่ง','0852533921','nattam@gmail.com','1',3),(37,'อารียา','วรภัทรศิริสกุล','0910069747','ariya1@gmail.com','1',3),(38,'ชัชญา','เผ่ารอด','0882884686','chatya@gmail.com','1',3),(39,'กนกจันทร์','พิกุลเทพ','0924592259','kanokchan@gmail.com','1',3),(40,'ธเนษฐ','ทรัพย์ธารา','0922149907','thanate@gmail.com','1',3),(41,'ชลธี','ประเสริฐโสม','0859371856','chontri@gmail.com','2',3),(42,'กมนทัต','เอกโอภาส','0881891373','kamontat@gmail.com','2',3),(43,'ชิดชนก','วีระกิตติ','0875730433','chitchanok@gmail.com','2',3),(44,'สุรศักดิ์','ตั้งทิพย์','0898555514','surasak@gmail.com','2',3),(45,'ภาวิดา','ชนะสมบัติ','0912022616','pawida@gmail.com','2',3),(46,'กรณ์','จันทร์ประเสริฐ','0852783914','koranee@gmail.com','2',3),(47,'กรรณสิกา','ประชายุต','0890516428','kansika@gmail.com','2',3),(48,'ขรินทร์ทิพย์','จันวราสกุล','0867023600','kharin@gmail.com','2',3);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_ingredient`
--

DROP TABLE IF EXISTS `food_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_ingredient` (
  `f_id` int NOT NULL,
  `in_id` int NOT NULL,
  PRIMARY KEY (`f_id`,`in_id`),
  KEY `mat_id` (`in_id`),
  CONSTRAINT `food_ingredient_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `foods` (`f_id`),
  CONSTRAINT `food_ingredient_ibfk_2` FOREIGN KEY (`in_id`) REFERENCES `ingredients` (`in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_ingredient`
--

LOCK TABLES `food_ingredient` WRITE;
/*!40000 ALTER TABLE `food_ingredient` DISABLE KEYS */;
INSERT INTO `food_ingredient` VALUES (1,1),(2,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(9,2),(10,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(8,3),(9,3),(10,3),(12,3),(1,4),(12,4),(1,5),(10,5),(12,5),(1,6),(2,6),(7,6),(12,6),(1,7),(1,8),(1,9),(5,9),(1,10),(2,12),(9,12),(11,12),(2,13),(3,13),(8,13),(2,14),(5,14),(6,14),(8,14),(2,15),(2,16),(2,17),(7,17),(8,17),(11,17),(2,18),(8,18),(10,18),(2,19),(12,19),(3,20),(3,21),(3,22),(4,23),(6,23),(4,24),(5,24),(9,24),(10,24),(4,25),(9,25),(10,25),(4,26),(5,26),(10,26),(4,27),(7,27),(5,28),(6,28),(5,29),(6,30),(6,31),(6,32),(7,33),(7,34),(8,34),(12,34),(7,35),(8,36),(8,37),(8,38),(8,39),(9,40),(9,41),(10,42),(10,43),(11,44),(11,45),(11,46),(12,47),(12,48);
/*!40000 ALTER TABLE `food_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` float(8,2) NOT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'สเต๊กเนื้อ','https://img.wongnai.com/p/1600x0/2019/03/23/73a95587aa2f46e0b160e5a7d9ef430f.jpg',120.00),(2,'สตูว์เนื้อ','https://img.wongnai.com/p/1920x0/2018/02/28/8c1df222027f41f6bb9a8753edc58b01.jpg',120.00),(3,'แซนด์วิชอกไก่อโวคาโด','https://img.wongnai.com/p/1600x0/2018/03/01/a97888cc77d54666a0b82121817e3c53.jpg',70.00),(4,'ออมเลตชีส','https://img.wongnai.com/p/1600x0/2019/03/05/52c398fb7da943e18d0f71a623454500.jpg',70.00),(5,'มักกะโรนีอบชีสเบคอน','https://img.wongnai.com/p/1600x0/2018/06/12/5fc427f60bd642398d456027b3bf3dec.jpg',100.00),(6,'ซุปไก่มักกะโรนี','https://img.wongnai.com/p/1600x0/2018/07/11/60cac9e973d9426ab0206494c15cad2f.jpg',80.00),(7,'ซี่โครงหมูบาร์บีคิวอบชีส','https://img.wongnai.com/p/1600x0/2019/02/27/43c8be31306d400f923972a16fa9e8a2.jpg',100.00),(8,'สปาเกตตีบาร์บีคิว','https://img.wongnai.com/p/1600x0/2019/03/11/3915747c313841b8ba309fc150a2f880.jpg',80.00),(9,'มันบด','https://img.wongnai.com/p/1600x0/2018/12/03/0c96429e3ca84436b39684ffe6f4b8cf.jpg',30.00),(10,'ผักขมอบชีส','https://img.wongnai.com/p/1600x0/2021/06/07/e1de74c4110f40ea84afb979c9b63dc6.jpg',50.00),(11,'เฟรนช์ฟรายราดชีส','https://img.wongnai.com/p/1600x0/2018/02/27/40cd0bb7679f42b98413792120d6c91c.jpg',50.00),(12,'หมูสามชั้นม้วนอย่างซอส','https://img.wongnai.com/p/1600x0/2018/12/04/7e71f7cf98b54e93a39893e7f52b7bc3.jpg',80.00);
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `in_id` int NOT NULL AUTO_INCREMENT,
  `in_name` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'เนื้อวัว',100),(2,'เกลือ',30),(3,'พริกไทย',30),(4,'น้ำมันมะกอก',30),(5,'กระเทียม',30),(6,'ใบไทม์',30),(7,'โรสแมรี่',30),(8,'บราวน์ซอส',30),(9,'เนย',50),(10,'เห็ดทรัฟเฟิล',30),(12,'มันฝรั่ง',30),(13,'มะเขือเทศ',30),(14,'แครอท',30),(15,'ไวน์แดง',30),(16,'ใบกระวาน',30),(17,'น้ำมันพืช',50),(18,'หอมใหญ่',30),(19,'ผงปาปริก้า',30),(20,'ขนมปัง',50),(21,'อโวคาโด',30),(22,'อกไก่',100),(23,'ไข่ไก่',100),(24,'นม',50),(25,'มาการีน',50),(26,'ชีสมอซซาเรลลา',50),(27,'ซีสพาเมซาน',50),(28,'มักกะโรนี',50),(29,'เบคอน',100),(30,'คนอร์',30),(31,'กุ้ง',100),(32,'ผักชี',30),(33,'ซี่โครงหมู',50),(34,'ซอสบาร์บีคิว',30),(35,'ออรืกาโน่',30),(36,'เส้นสปาเกตตี',50),(37,'ไส้กรอก',100),(38,'พริกหวาน',30),(39,'สัปปะรด',30),(40,'วิปปิ้งครีม',30),(41,'เกรวี่',30),(42,'ผักโขม',30),(43,'แป้งสาลี',50),(44,'ชีสเชดดาร์',50),(45,'แป้งข้าวโพด',50),(46,'นมข้นจืด',30),(47,'หมูสามชั้น',100),(48,'เลมอน',30);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `total_price` float(8,2) NOT NULL,
  `cust_id` int NOT NULL,
  `rest_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`cust_id`),
  KEY `rest_id` (`rest_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`rest_id`) REFERENCES `restaurants` (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2022-04-01',360.00,1,1),(2,'2022-04-02',280.00,2,1),(3,'2022-04-03',170.00,3,1),(4,'2022-04-04',140.00,4,1),(5,'2022-04-05',240.00,5,1),(6,'2022-04-06',390.00,6,1),(7,'2022-04-07',320.00,1,1),(8,'2022-04-08',210.00,2,1),(9,'2022-04-09',230.00,5,1),(10,'2022-04-10',320.00,6,1),(11,'2022-04-10',300.00,7,2),(12,'2022-04-11',140.00,8,2),(13,'2022-04-11',320.00,9,2),(14,'2022-04-12',170.00,10,2),(15,'2022-04-13',190.00,11,2),(16,'2022-04-13',190.00,12,2),(17,'2022-04-14',400.00,7,2),(18,'2022-04-15',380.00,8,2),(19,'2022-04-16',300.00,9,2),(20,'2022-04-17',450.00,10,2),(21,'2022-04-18',240.00,13,3),(22,'2022-04-18',220.00,14,3),(23,'2022-04-19',240.00,15,3),(24,'2022-04-20',400.00,16,3),(25,'2022-04-21',200.00,17,3),(26,'2022-04-21',340.00,18,3),(27,'2022-04-22',140.00,19,3),(28,'2022-04-23',160.00,20,3),(29,'2022-04-24',500.00,19,3),(30,'2022-04-25',320.00,20,3),(41,'2022-05-04',240.00,1,1),(42,'2022-05-05',280.00,1,1),(43,'2022-05-05',300.00,2,1),(44,'2022-05-05',120.00,2,1),(45,'2022-05-05',120.00,2,1),(46,'2022-05-05',120.00,2,1),(47,'2022-05-05',1600.00,3,1),(48,'2022-05-05',6000.00,3,1),(49,'2022-05-05',0.00,1,1),(50,'2022-05-05',1200.00,2,1),(51,'2022-05-05',700.00,2,1),(52,'2022-05-05',1800.00,5,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `item_no` int NOT NULL AUTO_INCREMENT,
  `unit_price` float(8,2) NOT NULL,
  `item_amounts` int NOT NULL,
  `order_id` int NOT NULL,
  `f_id` int NOT NULL,
  PRIMARY KEY (`item_no`),
  KEY `order_id` (`order_id`),
  KEY `order_food` (`f_id`),
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `foods` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,120.00,1,1,1),(2,120.00,1,1,2),(3,70.00,1,1,3),(4,50.00,1,1,11),(5,70.00,1,2,4),(6,80.00,1,2,6),(7,80.00,1,2,8),(8,50.00,1,2,9),(9,70.00,2,3,3),(10,50.00,1,3,10),(11,70.00,2,4,4),(12,120.00,2,5,1),(13,120.00,1,6,1),(14,70.00,1,6,3),(15,70.00,1,6,4),(16,100.00,1,6,5),(17,30.00,1,6,9),(18,80.00,4,7,8),(19,70.00,3,8,4),(20,100.00,2,9,7),(21,30.00,1,9,9),(22,120.00,2,10,2),(23,80.00,1,10,12),(24,70.00,2,11,4),(25,80.00,2,11,8),(26,70.00,2,12,4),(27,80.00,4,13,8),(28,70.00,2,14,3),(29,30.00,1,14,9),(30,70.00,2,15,3),(31,50.00,1,15,10),(32,70.00,2,16,3),(33,50.00,1,16,11),(34,120.00,2,17,1),(35,80.00,2,17,8),(36,120.00,2,18,2),(37,70.00,2,18,4),(38,50.00,6,19,11),(39,120.00,3,20,2),(40,30.00,3,20,9),(41,70.00,2,21,4),(42,50.00,2,21,10),(43,80.00,2,22,6),(44,30.00,2,22,9),(45,80.00,3,23,12),(46,100.00,4,24,7),(47,100.00,2,25,5),(48,120.00,1,26,1),(49,70.00,2,26,3),(50,80.00,1,26,8),(51,70.00,2,27,4),(52,80.00,2,28,6),(53,70.00,2,29,4),(54,80.00,2,29,8),(55,50.00,4,29,10),(56,80.00,4,30,6),(61,70.00,10,51,4),(62,30.00,10,52,9),(63,80.00,10,52,6),(64,70.00,10,52,4);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserv_data`
--

DROP TABLE IF EXISTS `reserv_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserv_data` (
  `data_no` int NOT NULL AUTO_INCREMENT,
  `resv_id` int NOT NULL,
  `table_id` int NOT NULL,
  PRIMARY KEY (`data_no`,`resv_id`),
  KEY `table_id` (`table_id`),
  KEY `resv_id` (`resv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserv_data`
--

LOCK TABLES `reserv_data` WRITE;
/*!40000 ALTER TABLE `reserv_data` DISABLE KEYS */;
INSERT INTO `reserv_data` VALUES (1,1,1),(24,24,1),(39,39,1),(40,61,1),(2,2,2),(6,6,2),(26,26,2),(3,3,6),(21,21,6),(25,25,6),(4,4,7),(22,22,7),(5,5,8),(23,23,8),(7,7,9),(27,27,9),(8,8,10),(30,30,10),(11,11,11),(31,31,11),(32,32,12),(41,62,13),(9,9,14),(28,28,14),(10,10,15),(29,29,15),(12,12,16),(43,64,16),(13,13,17),(35,35,17),(17,17,18),(18,18,19),(19,19,20),(20,20,21),(14,14,22),(33,33,22),(42,63,22),(15,15,23),(34,34,23),(16,16,24);
/*!40000 ALTER TABLE `reserv_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `resv_id` int NOT NULL AUTO_INCREMENT,
  `booking_date` datetime NOT NULL,
  `eating_date` datetime NOT NULL,
  `cust_id` int NOT NULL,
  `booked_seat` int NOT NULL,
  PRIMARY KEY (`resv_id`),
  KEY `customer_id` (`cust_id`),
  CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES (1,'2022-03-01 10:00:00','2022-04-01 10:00:00',1,4),(2,'2022-03-02 10:00:00','2022-04-02 10:00:00',2,4),(3,'2022-03-03 10:00:00','2022-04-03 14:00:00',3,2),(4,'2022-03-04 10:00:00','2022-04-04 10:00:00',4,2),(5,'2022-03-05 10:00:00','2022-04-05 14:00:00',5,2),(6,'2022-03-06 10:00:00','2022-04-06 10:00:00',6,4),(7,'2022-03-07 10:00:00','2022-04-07 14:00:00',7,4),(8,'2022-03-08 10:00:00','2022-04-08 10:00:00',8,4),(9,'2022-03-09 12:00:00','2022-04-09 10:30:00',9,2),(10,'2022-03-10 14:00:00','2022-04-10 10:00:00',10,2),(11,'2022-03-10 16:00:00','2022-04-10 14:00:00',11,4),(12,'2022-03-11 10:00:00','2022-04-11 10:00:00',12,2),(13,'2022-03-11 12:00:00','2022-04-11 14:00:00',13,4),(14,'2022-03-12 14:00:00','2022-04-12 10:00:00',14,2),(15,'2022-03-13 16:00:00','2022-04-13 10:00:00',15,2),(16,'2022-03-13 18:00:00','2022-04-13 14:00:00',16,2),(17,'2022-03-14 10:00:00','2022-04-14 10:00:00',17,4),(18,'2022-03-15 12:00:00','2022-04-15 14:00:00',18,4),(19,'2022-03-16 14:00:00','2022-04-16 10:00:00',19,4),(20,'2022-03-17 16:00:00','2022-04-17 10:00:00',20,4),(21,'2022-03-18 18:00:00','2022-04-18 10:00:00',1,2),(22,'2022-03-18 10:00:00','2022-04-18 14:00:00',2,2),(23,'2022-03-19 12:00:00','2022-04-19 10:00:00',3,2),(24,'2022-03-20 14:00:00','2022-04-20 10:00:00',4,4),(25,'2022-03-21 16:00:00','2022-04-21 10:00:00',5,2),(26,'2022-03-21 18:00:00','2022-04-21 14:00:00',6,4),(27,'2022-03-21 10:00:00','2022-04-21 16:00:00',7,4),(28,'2022-03-22 12:00:00','2022-04-22 14:00:00',8,2),(29,'2022-03-23 14:00:00','2022-04-23 14:00:00',9,2),(30,'2022-03-24 16:00:00','2022-04-24 10:00:00',10,4),(31,'2022-03-25 18:00:00','2022-04-25 10:00:00',11,4),(32,'2022-03-26 19:00:00','2022-04-19 14:00:00',12,4),(33,'2022-03-27 10:00:00','2022-04-17 14:00:00',13,2),(34,'2022-03-28 12:00:00','2022-04-15 10:00:00',14,2),(35,'2022-03-29 15:00:00','2022-04-09 14:00:00',15,4),(39,'2022-05-03 19:16:48','2022-05-04 20:16:00',1,2),(60,'2022-05-03 19:48:07','2022-05-05 21:16:00',1,4),(61,'2022-05-03 19:49:21','2022-05-04 21:16:00',1,4),(62,'2022-05-04 15:09:57','2022-05-30 18:00:00',1,4),(63,'2022-05-05 15:47:02','2022-05-19 18:30:00',1,2),(64,'2022-05-05 15:48:47','2022-05-26 17:50:00',1,2);
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `rest_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'999 ม.1 ถ.สุขุมวิท ต.สำโรงเหนือ อ.เมืองสมุทรปราการ จ.สมุทรปราการ 10270','027893214'),(2,'55 ถ.ศรีนครินทร์ แขวง หนองบอน เขต ประเวศ จ.กรุงเทพมหานคร 10250','021112457'),(3,'39 ม.6  ถ.บางนา-ตราด ต.บางแก้วอ.บางพลี จ.สมุทรปราการ 10540','023786707');
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table`
--

DROP TABLE IF EXISTS `table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table` (
  `table_id` int NOT NULL AUTO_INCREMENT,
  `number_of_seat` int NOT NULL,
  `rest_id` int NOT NULL,
  `table_no` int DEFAULT NULL,
  `status` enum('available','unavailable') DEFAULT NULL,
  PRIMARY KEY (`table_id`),
  KEY `rest_id` (`rest_id`),
  CONSTRAINT `table_ibfk_1` FOREIGN KEY (`rest_id`) REFERENCES `restaurants` (`rest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table`
--

LOCK TABLES `table` WRITE;
/*!40000 ALTER TABLE `table` DISABLE KEYS */;
INSERT INTO `table` VALUES (1,4,1,1,'unavailable'),(2,4,1,2,'unavailable'),(3,4,1,3,'unavailable'),(4,4,1,4,'unavailable'),(5,4,1,5,'unavailable'),(6,2,1,6,'unavailable'),(7,2,1,7,'unavailable'),(8,2,1,8,'unavailable'),(9,4,2,1,'unavailable'),(10,4,2,2,'unavailable'),(11,4,2,3,'unavailable'),(12,4,2,4,'unavailable'),(13,4,2,5,'unavailable'),(14,2,2,6,'unavailable'),(15,2,2,7,'unavailable'),(16,2,2,8,'unavailable'),(17,4,3,1,'unavailable'),(18,4,3,2,'unavailable'),(19,4,3,3,'unavailable'),(20,4,3,4,'unavailable'),(21,4,3,5,'unavailable'),(22,2,3,6,'unavailable'),(23,2,3,7,'unavailable'),(24,2,3,8,'unavailable');
/*!40000 ALTER TABLE `table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'@HvkYP-wv5Gh6vUnsHlFsDyu0STFB91Sp9TxlxrQG1yyIXPuIs!gdnql^wZBET@H2JnKFHl2K!aog@*CToRt!DF@IXUlpyNNCgz#');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `point` int DEFAULT NULL,
  `shift` enum('1','2') DEFAULT NULL,
  `rest_id` int DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `cust_id` int DEFAULT NULL,
  `emp_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rest_id` (`rest_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`rest_id`) REFERENCES `restaurants` (`rest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2b$05$ZuF5bL8EVjt8XgfCnWTsCeWQq0hp.UkjG3t9jf2CXC1u7RTw4zpY2','ภคภัทร ','โชตวาณิช','phakhaphat@gmail.com','0820979172',NULL,'1',1,'emp',NULL,1),(2,NULL,NULL,'ณภัค','เจริญวัฒนา','napak@gmail.com','0811005272',NULL,'1',1,'emp',NULL,2),(3,NULL,NULL,'กนกพร','วิไลรัตน์','kanokpond@gmail.com','0860128654',NULL,'1',1,'emp',NULL,3),(4,NULL,NULL,'ไลลา','ถนอมจิต','lila@gmail.com','0931847586',NULL,'1',1,'emp',NULL,4),(5,NULL,NULL,'ธยานี','สรพินิจ','thayanee@gmail.com','0866913331',NULL,'1',1,'emp',NULL,5),(6,NULL,NULL,'วิมลวรรณ','กิตติภัทรา','wimon@gmail.com','0918091205',NULL,'1',1,'emp',NULL,6),(7,NULL,NULL,'ธนพล','ทรัพย์ศิลา','thanapon@gmail.com','0924954437',NULL,'1',1,'emp',NULL,7),(8,NULL,NULL,'บวรวิทย์','โชติพาณิชย์','bualwit@gmail.com','0890641391',NULL,'1',1,'emp',NULL,8),(9,NULL,NULL,'ตรีวิทย์','ตั้งทิพย์','triwit@gmail.com','0880483410',NULL,'2',1,'emp',NULL,9),(10,NULL,NULL,'พงษ์ศักดิ์','กระจ่างวงศ์','pongsak@gmail.com','0923871116',NULL,'2',1,'emp',NULL,10),(11,NULL,NULL,'เศรษฐี','ปัทมเดชา','richman@gmail.com','0865282447',NULL,'2',1,'emp',NULL,11),(12,NULL,NULL,'ขวัญ','วัชรโสภณ','kwan12@gmail.com','0914419916',NULL,'2',1,'emp',NULL,12),(13,NULL,NULL,'ปริศนา','แสงดารา','mystery@gmail.com','0917178049',NULL,'2',1,'emp',NULL,13),(14,NULL,NULL,'รณพร','วรภัทรศิริสกุล','onnapond@gmail.com','0839497426',NULL,'2',1,'emp',NULL,14),(15,NULL,NULL,'พิชญาภรณ์','พาใจขวัญ','pitchaya@gmail.com','0894171645',NULL,'2',1,'emp',NULL,15),(16,NULL,NULL,'ธีภพ','ทัศนเรือง','tipob1@gmail.com','0885018307',NULL,'2',1,'emp',NULL,16),(17,NULL,NULL,'ภูดิส','สันติกสุล','phudis@gmail.com','0902198170',NULL,'1',2,'emp',NULL,17),(18,NULL,NULL,'ชัชญา','ไลรัตน์','chaya1@gmail.com','0927516344',NULL,'1',2,'emp',NULL,18),(19,NULL,NULL,'ติณณภพ','สว่างวิทยา','tinnapob@gmail.com','0906061226',NULL,'1',2,'emp',NULL,19),(20,NULL,NULL,'ไกรสร','วงศ์เจริญ','kaisorn@gmail.com','0953073773',NULL,'1',2,'emp',NULL,20),(21,NULL,NULL,'พลภัทร','รัตนกิจโกศล','ponpat@gmail.com','0899103958',NULL,'1',2,'emp',NULL,21),(22,NULL,NULL,'ธนิสร','บำรุงกาญจน์','thanisorn@gmail.com','0900149069',NULL,'1',2,'emp',NULL,22),(23,NULL,NULL,'กิตติ','ปราสาทงาม','kitti1@gmail.com','0924204997',NULL,'1',2,'emp',NULL,23),(24,NULL,NULL,'อภิชญา','ไม้ทอง','apitchaya@gmail.com','0922140921',NULL,'1',2,'emp',NULL,24),(25,NULL,NULL,'ศุภาพิชญ์','สันติกสุล','supapit@gmail.com','0944775345',NULL,'2',2,'emp',NULL,25),(26,NULL,NULL,'ชัชชน','อินทรเกียรติ','chon12@gmail.com','0928226035',NULL,'2',2,'emp',NULL,26),(27,NULL,NULL,'บวรรัช','เกษมทรัพย์','rush12@gmail.com','0879908336',NULL,'2',2,'emp',NULL,27),(28,NULL,NULL,'ภูริพัฒน์','โชตวาณิช','pjuripat@gmail.com','0907609340',NULL,'2',2,'emp',NULL,28),(29,NULL,NULL,'เสกข์','ชาติสมบัติ','sage12@gmail.com','0895199209',NULL,'2',2,'emp',NULL,29),(30,NULL,NULL,'ปัณยตา','ภูภักดี','panyata@gmail.com','0899278528',NULL,'2',2,'emp',NULL,30),(31,NULL,NULL,'พิมพ์','พาสกุล','pim123@gmail.com','0833967275',NULL,'2',2,'emp',NULL,31),(32,NULL,NULL,'โสรัตน์','สุขเสรี','sorat1@gmail.com','0911062215',NULL,'2',2,'emp',NULL,32),(33,NULL,NULL,'ณัฏฐชัย','สตาภิรมย์','nattachai@gmail.com','0855296054',NULL,'1',3,'emp',NULL,33),(34,NULL,NULL,'ขวัญทิพย์ ','รัตนเศรษฐา','kwantip@gmail.com','0909314374',NULL,'1',3,'emp',NULL,34),(35,NULL,NULL,'ปุณพจน์','วรารักษ์','punpot@gmail.com','0837090355',NULL,'1',3,'emp',NULL,35),(36,NULL,NULL,'นาถธรรม','อรุณรุ่ง','nattam@gmail.com','0852533921',NULL,'1',3,'emp',NULL,36),(37,NULL,NULL,'อารียา','วรภัทรศิริสกุล','ariya1@gmail.com','0910069747',NULL,'1',3,'emp',NULL,37),(38,NULL,NULL,'ชัชญา','เผ่ารอด','chatya@gmail.com','0882884686',NULL,'1',3,'emp',NULL,38),(39,NULL,NULL,'กนกจันทร์','พิกุลเทพ','kanokchan@gmail.com','0924592259',NULL,'1',3,'emp',NULL,39),(40,NULL,NULL,'ธเนษฐ','ทรัพย์ธารา','thanate@gmail.com','0922149907',NULL,'1',3,'emp',NULL,40),(41,NULL,NULL,'ชลธี','ประเสริฐโสม','chontri@gmail.com','0859371856',NULL,'2',3,'emp',NULL,41),(42,NULL,NULL,'กมนทัต','เอกโอภาส','kamontat@gmail.com','0881891373',NULL,'2',3,'emp',NULL,42),(43,NULL,NULL,'ชิดชนก','วีระกิตติ','chitchanok@gmail.com','0875730433',NULL,'2',3,'emp',NULL,43),(44,NULL,NULL,'สุรศักดิ์','ตั้งทิพย์','surasak@gmail.com','0898555514',NULL,'2',3,'emp',NULL,44),(45,NULL,NULL,'ภาวิดา','ชนะสมบัติ','pawida@gmail.com','0912022616',NULL,'2',3,'emp',NULL,45),(46,NULL,NULL,'กรณ์','จันทร์ประเสริฐ','koranee@gmail.com','0852783914',NULL,'2',3,'emp',NULL,46),(47,NULL,NULL,'กรรณสิกา','ประชายุต','kansika@gmail.com','0890516428',NULL,'2',3,'emp',NULL,47),(48,NULL,NULL,'ขรินทร์ทิพย์','จันวราสกุล','kharin@gmail.com','0867023600',NULL,'2',3,'cust',NULL,48),(49,NULL,NULL,'ภีมพัฒน์','ภีมพัฒน์','peemphat@gmail.com','0867418529',0,NULL,NULL,'cust',1,NULL),(50,NULL,NULL,'ปรียา','ไกรภพ','preeya72@gmail.com','0815255221',0,NULL,NULL,'cust',2,NULL),(51,NULL,NULL,'สุรพล','ทรัพย์ปรีชา','surapon55@gmail.com','0812190826',0,NULL,NULL,'cust',3,NULL),(52,NULL,NULL,'พรพิมล','จันทรพร','pornpimol@gmail.com','0863526855',0,NULL,NULL,'cust',4,NULL),(53,NULL,NULL,'ณัฐวิโรจน์','แสงสว่าง','natwirod56@gmail.com','0913255158',0,NULL,NULL,'cust',5,NULL),(54,NULL,NULL,'นวพร','ป้องภัย','nawaporn44@gmail.com','0963675889',0,NULL,NULL,'cust',6,NULL),(55,NULL,NULL,'พงศพัศ','ชาติสมบัติ','pongsapat85@gmail.com','0803896797',0,NULL,NULL,'cust',7,NULL),(56,NULL,NULL,'พิมพ์ทอง','สิงห์ขาว','pimtong@gmail.com','0852602621',0,NULL,NULL,'cust',8,NULL),(57,NULL,NULL,'ณิชมน','จันทรสมบัติ','nichamon@gmail.com','0842445964',0,NULL,NULL,'cust',9,NULL),(58,NULL,NULL,'บดินทร์','สีสะอาด','badin1@gmail.com','0836682073',0,NULL,NULL,'cust',10,NULL),(59,NULL,NULL,'พร้อมพงศ์','วัฒนศักดิ์มนตรี','pompong753@gmail.com','0895542369',0,NULL,NULL,'cust',11,NULL),(60,NULL,NULL,'ทิพย์สุดา ','วงศ์วริศธารา','tipsuda@gmail.com','0908188804',0,NULL,NULL,'cust',12,NULL),(61,NULL,NULL,'จันทรัตว์','พิกุลเทพ','jantarat@gmail.com','0940162723',0,NULL,NULL,'cust',13,NULL),(62,NULL,NULL,'จิรกฤต','สุวรรณโชค','jirakit@gmail.com','0857939431',0,NULL,NULL,'cust',14,NULL),(63,NULL,NULL,'ชนกนันท์','เกียรติวิทยา','chanoknan@gmail.com','0861999471',0,NULL,NULL,'cust',15,NULL),(64,NULL,NULL,'ปัณฑ์','สายสำอาง','pun7894@gmail.com','0914926000',0,NULL,NULL,'cust',16,NULL),(65,NULL,NULL,'ไกรสร','อุดมวิทยา','kaisorn2@gmail.com','0908206558',0,NULL,NULL,'cust',17,NULL),(66,NULL,NULL,'บาลิกา','ทรัพย์มา','balika@gmail.com','0909060264',0,NULL,NULL,'cust',18,NULL),(67,NULL,NULL,'เรวิทย์','โอภาสพงส์','rawit1@gmail.com','0917689089',0,NULL,NULL,'cust',19,NULL),(68,NULL,NULL,'ภูดิส','รัตนเศรษฐา','phudis2@gmail.com','0873055523',0,NULL,NULL,'cust',20,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-05 16:45:04

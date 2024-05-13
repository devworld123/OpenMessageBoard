-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.11-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema openmessageboard
--

CREATE DATABASE IF NOT EXISTS openmessageboard;
USE openmessageboard;

--
-- Definition of table `msg_tags`
--

DROP TABLE IF EXISTS `msg_tags`;
CREATE TABLE `msg_tags` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tag_title` varchar(45) NOT NULL,
  `tag_details` varchar(45) NOT NULL,
  `tag_status` varchar(45) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `msg_tags`
--

/*!40000 ALTER TABLE `msg_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `msg_tags` ENABLE KEYS */;


--
-- Definition of table `openmessage`
--

DROP TABLE IF EXISTS `openmessage`;
CREATE TABLE `openmessage` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_title` varchar(100) NOT NULL,
  `msg_details` text NOT NULL,
  `msg_creation_date` varchar(45) NOT NULL,
  `msg_user_name` varchar(45) NOT NULL,
  `msg_user_email` varchar(45) NOT NULL,
  `msg_status` int(10) unsigned DEFAULT NULL,
  `msg_tags` varchar(75) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `openmessage`
--

/*!40000 ALTER TABLE `openmessage` DISABLE KEYS */;
INSERT INTO `openmessage` (`msg_id`,`msg_title`,`msg_details`,`msg_creation_date`,`msg_user_name`,`msg_user_email`,`msg_status`,`msg_tags`) VALUES 
 (1,'How can I convert a sting arrray to float and sum the valus inside it','I have string array with numeric vaues and i wont to convert them to float. My problem is that i can convert them and print thhem out but I cant sum them. Can anyone tell me how to fix that problem,','2024-04-07 01:01:48','Anju','anju@ss.com',1,'java'),
 (2,'Lambda in VPC with VPC endpoint unable to access API Gateway\'s API Key','I am having a Lambda function inside a VPC, but it is trying to get the API Keys from the API Gateway, it is getting timeout.\r\n\r\nI have done the following steps:\r\n\r\nAttached the Lambda function into a VPC\'s public subnet\r\nCreated a Security Group with All TCP inbound, with source as the same security group\r\nCreated a VPC endpoint with AWS service and its service, *.execute-api, with:\r\npublic subnet that house the Lambda function\r\nSecurity Group is set as the pointer 2)\r\nLambda function is having a role that has the policies in place:\r\nAmazonAPIGatewayAdministrator\r\nAWSLambdaBasicExecutionRole\r\nAWSLambdaExecute\r\nAWSLambdaRole\r\nSo with the above settings, I still unable to connect to API Gateway to get the API Keys.\r\n\r\nI do not need internet access but just to get the API Keys from API Gateway. I am using Nodejs for Lambda function.\r\n\r\nPlease advices on how to get the API Gateway\'s API Keys with Lambda inside a VPC\'s subnet, and is it there is no way to get this information from API Gateway without NAT Gateway?\r\n\r\nThanks a lot in advance.','2024-04-08 16:05:45','Test','test@ss.com',1,'aws , vpc , api gateway'),
 (3,'AWS lambda call dynamo db through private network or bypass internet traffic','I have a lambda function which runs every 15 minutes and saves some data in DynamoDB.\r\n\r\nNow I want to secure the DynamoDB call made by my lambda so that the request does not go via the Internet, rather through Amazon internal network. There is no EC2 instance involved here though.\r\n\r\nI have seen a few recommendations for using PrivateLink which binds the Dynamo to VPC endpoints so that calls made from EC2 instances always go via internal network bypassing Internet.\r\n\r\nI was wondering such a configuration is possible for lamda calling DynamoDB since lamda itself does not run in any EC2 instance and is rather serverless?','2024-04-08 16:13:23','Anju','anju@ss.com',1,'aws, dynamo db,');
/*!40000 ALTER TABLE `openmessage` ENABLE KEYS */;


--
-- Definition of table `postreply`
--

DROP TABLE IF EXISTS `postreply`;
CREATE TABLE `postreply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `msg_id` int(10) unsigned NOT NULL,
  `reply_details` text NOT NULL,
  `reply_user_name` varchar(45) NOT NULL,
  `reply_user_email` varchar(45) NOT NULL,
  `reply_creation_date` varchar(45) NOT NULL,
  `reply_status` int(11) NOT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK_postreply_1` (`msg_id`),
  CONSTRAINT `FK_postreply_1` FOREIGN KEY (`msg_id`) REFERENCES `openmessage` (`msg_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postreply`
--

/*!40000 ALTER TABLE `postreply` DISABLE KEYS */;
INSERT INTO `postreply` (`reply_id`,`msg_id`,`reply_details`,`reply_user_name`,`reply_user_email`,`reply_creation_date`,`reply_status`) VALUES 
 (1,1,'You try to declare an Intent outside of a method in your MainActivity class. I guess you can move the Intent declaration inside a method','Alpha','alpha@ss.com','2024-04-08 11:11:05',1),
 (2,1,'Android Studio bugged out. Thanks everyone who spent their time trying to solve it.','Anju','anju@ss.com','2024-04-08 11:39:36',1),
 (3,1,'test reply','Beta','beta@ss.com','2024-04-08 15:53:58',1),
 (4,2,'One thing I am particularly noticing in your codebase is that even when you use this Lambda function for connecting to the specific RDS you have, the hostname may not be the correct one for Amazon RDS. It needs to be the endpoint of the RDS you are trying to connect to and your complete connection url would look something like this below -\r\n\r\n//jdbc:mysql://hostname (endpoint of RDS):port/databasename\r\n\r\nString url = \"jdbc:mysql://\"+dbHost+\":3306/\"+dbName;\r\n\r\nSince those endpoints can change for different databases and servers, you can make them as environment variables within Lambda and refer using\r\n\r\nString dbHost = System.getenv(\"dbHost\");\r\n\r\nString dbName = System.getenv(\"dbName\");\r\n\r\nfor a much cleaner and stateless design that Lambda supports.','Alpha','alpha@ss.com','2024-04-08 16:11:35',1),
 (5,3,'The first thing I would say is that all of your traffic between Lambda and DynamoDB is signed and encrypted, so that\'s typically sufficient.\r\n\r\nThere are use cases, most typically compliance reasons, when this is not sufficient. In that case you can deploy the Lambda function into a VPC of your making and configure the VPC with a private VPC endpoint for DynamoDB. Typically, the VPC would be configured without an internet gateway or NAT so that it has no egress route to the public internet. Be aware that your Lambda function startup latency will be higher than usual, because each Lambda function environment needs to attach an ENI for access to the private endpoint.\r\n\r\nSee Configuring a Lambda Function to Access Resources in an Amazon VPC.','Alpha','alpha@ss.com','2024-04-08 16:14:06',1),
 (6,3,'If you don\'t need to access resources in a VPC, AWS recommends not to run AWS Lambda functions in a VPC. From AWS Lambda Best Practices:\r\nRunning Lambda functions in VPC adds additionally complexity, which can negatively effect scalability and performance. Each Lambda function in a VPC needs an Elastic Network Interface (ENI). Provisioning ENI\'s is slow and the amount of ENI\'s you can have is limited, so when you scale up you can run into a shortage of ENI\'s, preventing your Lambda functions to scale up further.','Beta','beta@ss.com','2024-04-08 16:15:16',1),
 (7,3,'This is one way to do it.\r\n\r\nStep 1) Deploy your lambda inside VPC.\r\n\r\nStep 2) Create VPC Endpoint to the DynamoDB.\r\n\r\nThis should help: https://aws.amazon.com/blogs/aws/new-vpc-endpoints-for-dynamodb/','Gamma','gamma@ss.com','2024-04-08 16:15:44',1),
 (8,3,'thanks a lot','Anju','anju@ss.com','2024-04-08 16:16:07',1);
/*!40000 ALTER TABLE `postreply` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

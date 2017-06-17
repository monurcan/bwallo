<?php
/**
* bwallo. | create your wall
* @author Mehmet Onurcan KAYA <monurcan55@gmail.com>
* @version 1.0
* @since 2014
*/
	
	session_start();
	ob_start("ob_gzhandler");

	## Hide Errors ##
	error_reporting(0);

	## Connection Variables ##
	$host_name 	= "127.0.0.1";
	$mysql_user = "root";
	$mysql_pass = "root";
	$db_name	= "bwallo";

	## Connection Class ##
	$connect = new Config($host_name, $mysql_user, $mysql_pass, $db_name);
	
	## Turkish Character Problem ##
	mysql_query("SET NAMES 'utf8'");
	mysql_query("SET CHARACTER SET utf8");
?>
<?php
$db_name = "flutter_mysql";
$db_user = "root";
$db_pass = "";
$db_server = "localhost";
$con = mysqli_connect($db_server,$db_user,$db_pass,$db_name);
if(!$con){
	echo  "connection error";
}
else{
	//echo  "connection succesful ";
}
?>
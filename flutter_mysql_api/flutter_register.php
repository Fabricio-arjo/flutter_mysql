<?php
require_once "db_config.php";
$name=$_POST["name"];
$pass=$_POST["password"];
$query="insert into flutterSample (name,pass) values ('$name','$pass')";
$result = mysqli_query($con,$query);
if($result){
	echo "done";
}
else{
	echo "error";
}
?>	
<?php
require_once "db_config.php";

$id=$_POST['id'];
$name=$_POST["name"];
$pass=$_POST["password"];

$con->query("UPDATE flutterSample SET name = '".$name."', pass = '".$pass."' WHERE id ='".$id."'");



?>	
<?php
require_once "db_config.php";

$id=$_POST['id'];


$con->query("DELETE FROM flutterSample WHERE id ='".$id."'");



?>	
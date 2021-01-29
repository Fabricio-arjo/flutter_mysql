 <?php
require_once('db_config.php');

 $sql = $con->query("SELECT * FROM flutterSample");

 $result = array();

 while ($row = $sql->fetch_assoc()) {
  
 	$result[] = $row;
}

echo json_encode($result);

//mysqli_close($con);
?>
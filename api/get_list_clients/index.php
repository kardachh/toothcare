<?php
header('Content-Type: application/json');
$dbconn = pg_connect("host=localhost port=1111 dbname=ToothCare user=kardachh password=");

$query = 'SELECT id, surname, first_name, second_name, gender, birthday, phone FROM "toothCare".patients order by surname';

$result = pg_query($dbconn, $query);
if (!$result) {
  $errorResponce = array("error_code"=>1000);
  echo json_encode($errorResponce);
  exit;
}

$clients = pg_fetch_all($result);

$responce = array('clients'=>$clients);

echo json_encode($responce);
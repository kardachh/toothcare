<?php
header('Content-Type: application/json');
$dbconn = pg_connect("host=localhost port=1111 dbname=toothCare user=postgres password=");

$query = 'SELECT * FROM "toothCare".appointment_view';

$result = pg_query($dbconn, $query);

if (!$result) {
    $errorResponce = array("error_code" => 1000);
    echo json_encode($errorResponce);
    exit;
}

$appointments = pg_fetch_all($result);

$responce = array('appointments' => $appointments);

echo json_encode($responce);

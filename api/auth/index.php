<?php
header('Content-Type: application/json');

$dbconn = pg_connect("host=localhost port=1111 dbname=ToothCare user=kardachh password=") or die('Не удалось соединиться');

$user = $_GET;

$query = "SELECT login, \"password\" FROM \"toothCare\".employee where login='".$user["login"]."' and password='".$user["password"]."'";
$result = pg_query($dbconn, $query);
if (!$result) {
    echo "Произошла ошибка.\n";
    exit;
}
$exist = pg_num_rows($result) > 0;

echo json_encode(array("exist"=>$exist));

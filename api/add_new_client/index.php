<?php
header('Content-Type: application/json');

$dbconn = pg_connect("host=localhost port=1111 dbname=ToothCare user=kardachh password=") or die('Не удалось соединиться');

$newClient = $_POST;

$query = "INSERT INTO \"toothCare\".patients
(surname, first_name, second_name, gender, birthday, phone)
VALUES('".$newClient["surname"]."', '".$newClient["first-name"]."', '".$newClient["second-name"]."', '".$newClient["gender"]."', '".$newClient["birthday"]."', '".$newClient["phone"]."')";

$result = pg_query($dbconn, $query);
if (!$result) {
    echo "Произошла ошибка.\n";
    exit;
}
// var_dump($_POST);
$info = pg_fetch_all($result);

echo json_encode(array("info"=>$info));

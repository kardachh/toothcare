<?php
header('Content-Type: application/json');

$dbconn = pg_connect("host=localhost port=1111 dbname=toothCare user=postgres password=");

$query = "INSERT INTO \"toothCare\".appointment 
(id_servises, \"date\", \"time\", id_employee, id_diagnoses_specific)
VALUES('".$_POST['id_servises']."', '".$_POST['date']."', '".$_POST['time']."', '".$_POST['id_employee']."', '".$_POST['id_diagnoses_specific']."', 0, 0);";

$result = pg_query($dbconn, $query);
if (!$result) {
    echo "Произошла ошибка.\n";
    exit;
}
// var_dump($_POST);
$info = pg_fetch_all($result);

echo json_encode(array("info"=>$info));

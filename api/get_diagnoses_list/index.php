<?php
header('Content-Type: application/json');
$get = $_GET;
$id_patient = $_GET['client'];

$dbconn = pg_connect("host=localhost port=1111 dbname=ToothCare user=kardachh password=") or die('Не удалось соединиться');

// $query = 'SELECT dl.id_patient , d."name" , dl.description FROM "toothCare".diagnoses_list dl inner join "toothCare".diagnoses d on dl.id_diagnos = d.id where dl.id_patient = '.$id_patient.';';

$url = ((!empty($_SERVER['HTTPS'])) ? 'https' : 'http') . '://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
echo $url;
// $result = pg_query($dbconn, $query);
// if (!$result) {
//   echo "Произошла ошибка.\n";
//   exit;
// }

// $clients = pg_fetch_all($result);

// $responce = array('diagnoses'=>$clients);

// echo json_encode($responce);

// echo var_dump($get);
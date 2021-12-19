<?php
$dbconn = pg_connect("host=localhost port=1111 dbname=ToothCare user=kardachh password=") or die('Не удалось соединиться');

$query = 'SELECT id, surname, first_name, second_name, gender, birthday, phone FROM "toothCare".patients order by surname';

$result = pg_query($dbconn, $query);
if (!$result) {
  echo "Произошла ошибка.\n";
  exit;
}

$clients = pg_fetch_all($result);

$responce = array('clients'=>$clients);

echo json_encode($responce);

<?php
header('Content-Type: application/json');
$dbconn = pg_connect("host=localhost port=1111 dbname=toothCare user=postgres password=");

$query_products = 'SELECT id, "name", price FROM "toothCare".products;';
$query_servises = 'SELECT id, "name", price, id_product FROM "toothCare".services;';

$result = pg_query($dbconn, $query_products);
$products = pg_fetch_all($result);

$result = pg_query($dbconn, $query_servises);
$servises = pg_fetch_all($result);

$responce = array('products'=>$products,'servises'=>$servises);

echo json_encode($responce);
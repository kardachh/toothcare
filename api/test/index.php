<?php
header('Content-Type: application/json');
var_dump($_REQUEST);
echo json_encode(array("response"=>$_REQUEST));
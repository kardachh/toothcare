<?php
require_once $_SERVER['DOCUMENT_ROOT'] . "/header.php";
?>

<div class="container-main container">
<div class="main-screen-wrap">

    <div class="container">
        <div class="page-name">Стоматологическая клиника "ЗУБ"</div>
    </div>
    <button class="container button" onclick="window.location='./appointment'">
        <div>Прием</div>
    </button>
    <div class="container button" onclick="window.location='./clients'">
        <div>Пациенты</div>

    </div>
    <div class="container button" onclick="window.location='./servises&products'">
        <div>Услуги и товары</div>

    </div>
</div>
</div>
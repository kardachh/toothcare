<?php
require_once($_SERVER['DOCUMENT_ROOT'] . "/header.php");
?>
<div class="container-main container">
    <div class="clients-screen-wrap">
        <div class="top-buttons">
            <button class="container button" onclick="window.location='../'">
                <div>Назад</div>
            </button>
            <div class="container page-name">
                <div>Пациенты</div>
            </div>
            <button class="container button">
                <div>Добавить пациента</div>
            </button>
        </div>
        <div class="search-zone">
            <input />
        </div>
    </div>
</div>

<script>
    const url = 'http://toothcare:8888/api/get_list_clients';

    const getData= async ()=>{
        try {
            const response = await fetch(url, {
                method: 'GET', // или 'PUT'
                // body: JSON.stringify(data), // данные могут быть 'строкой' или {объектом}!
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            const json = await response.json();
            return json;
        } catch (error) {
            console.error('Ошибка:', error);
            return null;
        } 
    }

    const docReady= async()=>{
        const clients = await getData().then((res)=>res.clients);
        clients.forEach(element => {
            console.table(element);
        });
    }

    docReady()
</script>
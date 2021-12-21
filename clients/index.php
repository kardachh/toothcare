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
            <div class="search-wrap">
                <input class="search-input" placeholder="Начните вводить пациента..." />
                <img src="/../assets/search.svg">
            </div>
        </div>
        <div class="clients-list">

        </div>
    </div>
</div>
<!-- <a class="open_modal" href="#open">Открыть окно</a>
<div id="modal" class="modal bounceIn">
    <div id="close_modal">+</div>
    <div class="modal_txt">Текст в модальном окне</div>
</div> -->
<div class="modal" style="display: none;">
    <div class="container container-main modal-window">
        <div class="modal-close">
            <!-- <img src=''/> -->
            <div>
                X
            </div>
        </div>
        <div class='client-info'>
            <div class='client-fio'>
                <div class="surname"></div>
                <div class="first-name"></div>
                <div class="second-name"></div>
            </div>
            <div class='client-additional-info'>
                <div>
                    <div>Телефон: </div>
                    <div>Пол: </div>
                    <div>Дата рождения: </div>
                </div>
                <div style="text-align: end;">
                    <div class="phone"></div>
                    <div class="gender"></div>
                    <div class="birthday"></div>
                </div>
            </div>
        </div>
        <div class="diagnoses">
            <div class="diagnoses-title">Диагнозы:</div>
            <div class="diagnoses-list">

            </div>
        </div>
    </div>
</div>

<script>
    const urlClients = 'http://toothcare:8888/api/get_list_clients';
    const urlDiagnosesList = 'http://toothcare:8888/api/get_diagnoses_list';



    const useFetch = () => {
        const request = (url, params = {}, method = 'GET') => {
            let options = {
                method
            };
            if ('GET' === method) {
                url += '?' + (new URLSearchParams(params)).toString();
            } else {
                options.body = JSON.stringify(params);
            }

            return fetch(url, options).then(response => response.json());
        };

        const getClientsData = () => {
            return request(urlClients)
        }

        const getDiagnosesData = async (id) => {
            return request(urlDiagnosesList, {
                client: id
            })
        }

        return {
            api: {
                getClientsData,
                getDiagnosesData
            }
        }
    }

    const {
        api
    } = useFetch()

    let clients = [];



    const renderClient = (client) => {
        let element = document.createElement("div");
        element.id = `client-${client.id}`
        element.classList = 'container client';
        element.innerHTML = `<div>${client.surname} ${client.first_name} ${client.second_name} </div> <div>${client.phone}</div>`
        return element;
    }

    const toggleModal = () => {
        $('.modal').toggle()
    }

    const changeModal = (client) => {
        console.table(client)
        $('.surname').replaceWith(`<div class = "surname">${client.surname}</div>`)
        $('.first-name').replaceWith(`<div class = "first-name">${client.first_name}</div>`)
        $('.second-name').replaceWith(`<div class = "second-name">${client.second_name}</div>`)
        $('.phone').replaceWith(`<div class = "phone">${client.phone}</div>`)
        $('.gender').replaceWith(`<div class = "gender">${client.gender}</div>`)
        $('.birthday').replaceWith(`<div class = "birthday">${client.birthday}</div>`)
    }

    const setClients = (clients) => {
        const parentList = $(".clients-list")
        clients.forEach(client => {
            $(parentList).append(renderClient(client))
        });
    }

    const addHandlers = () => {
        $('.client').click((data) => {
            const id = data.currentTarget.id.split('-')[1]
            const client = clients.find((client) => client.id === id)
            changeModal(client)
            toggleModal()
        });

        $('.modal-close').click(toggleModal)
    }

    const docReady = async () => {
        clients = await api.getClientsData().then((res) => res.clients)
        const diagnos = await api.getDiagnosesData(1).then((res) => res)
        setClients(clients)
        addHandlers()
    }

    docReady()
</script>
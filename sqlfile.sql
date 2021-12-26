--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: toothCare; Type: SCHEMA; Schema: -; Owner: kardachh
--

CREATE SCHEMA "toothCare";


ALTER SCHEMA "toothCare" OWNER TO kardachh;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appointment; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".appointment (
    id integer NOT NULL,
    id_servises integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    id_employee integer NOT NULL,
    id_diagnoses_specific integer NOT NULL
);


ALTER TABLE "toothCare".appointment OWNER TO kardachh;

--
-- Name: appointment_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".appointment ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".appointment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: diagnoses; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".diagnoses (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE "toothCare".diagnoses OWNER TO kardachh;

--
-- Name: COLUMN diagnoses.id; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".diagnoses.id IS 'id диагноза';


--
-- Name: COLUMN diagnoses.name; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".diagnoses.name IS 'наименование диагноза';


--
-- Name: diagnoses_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".diagnoses ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".diagnoses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: diagnoses_list; Type: TABLE; Schema: toothCare; Owner: postgres
--

CREATE TABLE "toothCare".diagnoses_list (
    id_patient integer NOT NULL,
    id_diagnos integer NOT NULL,
    description text NOT NULL,
    id integer NOT NULL
);


ALTER TABLE "toothCare".diagnoses_list OWNER TO postgres;

--
-- Name: diagnoses_list_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: postgres
--

ALTER TABLE "toothCare".diagnoses_list ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".diagnoses_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: employee; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".employee (
    id integer NOT NULL,
    surname text NOT NULL,
    first_name text NOT NULL,
    second_name character varying,
    gender character(1) NOT NULL,
    birthday date NOT NULL,
    phone text NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE "toothCare".employee OWNER TO kardachh;

--
-- Name: employee_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".employee ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: patients; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".patients (
    id integer NOT NULL,
    surname text NOT NULL,
    first_name text NOT NULL,
    second_name text,
    gender character(1) NOT NULL,
    birthday date,
    phone text NOT NULL
);


ALTER TABLE "toothCare".patients OWNER TO kardachh;

--
-- Name: COLUMN patients.id; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".patients.id IS 'id пациента';


--
-- Name: COLUMN patients.surname; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".patients.surname IS 'Фамилия пциента';


--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".patients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".products (
    id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL
);


ALTER TABLE "toothCare".products OWNER TO kardachh;

--
-- Name: TABLE products; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON TABLE "toothCare".products IS 'Стоматологические товары';


--
-- Name: COLUMN products.id; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".products.id IS 'id стоматологического товара';


--
-- Name: COLUMN products.name; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".products.name IS 'наименование стоматологического товара';


--
-- Name: COLUMN products.price; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".products.price IS 'цена стоматологического товара';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".products ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: services; Type: TABLE; Schema: toothCare; Owner: kardachh
--

CREATE TABLE "toothCare".services (
    id integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    id_product integer
);


ALTER TABLE "toothCare".services OWNER TO kardachh;

--
-- Name: COLUMN services.id; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".services.id IS 'id услуги';


--
-- Name: COLUMN services.name; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".services.name IS 'наименование услуги';


--
-- Name: COLUMN services.price; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".services.price IS 'стоимость услуги';


--
-- Name: COLUMN services.id_product; Type: COMMENT; Schema: toothCare; Owner: kardachh
--

COMMENT ON COLUMN "toothCare".services.id_product IS 'id товара, который связан с услугой (необязательно)';


--
-- Name: services_id_seq; Type: SEQUENCE; Schema: toothCare; Owner: kardachh
--

ALTER TABLE "toothCare".services ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "toothCare".services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: appointment; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".appointment (id, id_servises, date, "time", id_employee, id_diagnoses_specific) FROM stdin;
2	1	2021-11-25	12:00:00	1	4
3	1	2021-11-25	13:00:00	2	5
\.


--
-- Data for Name: diagnoses; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".diagnoses (id, name) FROM stdin;
6	Нарушение развития зубов
7	Ретенированные зубы
8	Кариес зубов
9	Болезни пульпы
10	Гингивит и болезни парадонта
11	Стоматит
\.


--
-- Data for Name: diagnoses_list; Type: TABLE DATA; Schema: toothCare; Owner: postgres
--

COPY "toothCare".diagnoses_list (id_patient, id_diagnos, description, id) FROM stdin;
1	6	нарушение развития зубов сверху	3
2	8	кариес сверху справа 3 зуб	5
1	8	кариес снизу слева 5 зуб	4
2	11	запущенная болезнь десен	6
\.


--
-- Data for Name: employee; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".employee (id, surname, first_name, second_name, gender, birthday, phone, login, password) FROM stdin;
1	Жуков	Борис	Андреевич	М	1967-12-12	+7(900)-522-53-81	juk1967	juk
2	Бабочкин	Константин	Евгеньевич	М	1983-11-11	+7(900)-522-53-80	bfly1983	bfly
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".patients (id, surname, first_name, second_name, gender, birthday, phone) FROM stdin;
4	Кардаков	Денис	Алексеевич	М	2002-11-09	+7(912)366-91-47
7	Абдуллина	Арина 	Рустэмовна	Ж	2002-10-29	+7(912)533-37-80
2	Баталова	София	Андреевна	Ж	2002-10-17	+7(777)777-77-77
1	Брагина	София	Александровна	Ж	2003-05-08	+7(666)666-66-66
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".products (id, name, price) FROM stdin;
1	Имплант зуба	50000
2	Протез челюсти	300000
3	Без товара	0
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: toothCare; Owner: kardachh
--

COPY "toothCare".services (id, name, price, id_product) FROM stdin;
2	Лечение пульпитов	2375	1
1	Лечение кариеса	1425	3
3	Ультразвуковая чистка эмали	760	3
\.


--
-- Name: appointment_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".appointment_id_seq', 3, true);


--
-- Name: diagnoses_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".diagnoses_id_seq', 11, true);


--
-- Name: diagnoses_list_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: postgres
--

SELECT pg_catalog.setval('"toothCare".diagnoses_list_id_seq', 6, true);


--
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".employee_id_seq', 2, true);


--
-- Name: patients_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".patients_id_seq', 15, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".products_id_seq', 3, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: toothCare; Owner: kardachh
--

SELECT pg_catalog.setval('"toothCare".services_id_seq', 3, true);


--
-- Name: appointment appointment_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".appointment
    ADD CONSTRAINT appointment_pk PRIMARY KEY (id);


--
-- Name: diagnoses_list diagnoses_list_pk; Type: CONSTRAINT; Schema: toothCare; Owner: postgres
--

ALTER TABLE ONLY "toothCare".diagnoses_list
    ADD CONSTRAINT diagnoses_list_pk PRIMARY KEY (id);


--
-- Name: diagnoses diagnoses_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".diagnoses
    ADD CONSTRAINT diagnoses_pk PRIMARY KEY (id);


--
-- Name: employee employee_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".employee
    ADD CONSTRAINT employee_pk PRIMARY KEY (id);


--
-- Name: patients patients_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".patients
    ADD CONSTRAINT patients_pk PRIMARY KEY (id);


--
-- Name: products products_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".products
    ADD CONSTRAINT products_pk PRIMARY KEY (id);


--
-- Name: services services_pk; Type: CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".services
    ADD CONSTRAINT services_pk PRIMARY KEY (id);


--
-- Name: appointment appointment_fk; Type: FK CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".appointment
    ADD CONSTRAINT appointment_fk FOREIGN KEY (id_diagnoses_specific) REFERENCES "toothCare".diagnoses_list(id);


--
-- Name: appointment appointment_fk_employee; Type: FK CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".appointment
    ADD CONSTRAINT appointment_fk_employee FOREIGN KEY (id_employee) REFERENCES "toothCare".employee(id);


--
-- Name: appointment appointment_fk_service; Type: FK CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".appointment
    ADD CONSTRAINT appointment_fk_service FOREIGN KEY (id_servises) REFERENCES "toothCare".services(id);


--
-- Name: diagnoses_list diagnoses_list_fk; Type: FK CONSTRAINT; Schema: toothCare; Owner: postgres
--

ALTER TABLE ONLY "toothCare".diagnoses_list
    ADD CONSTRAINT diagnoses_list_fk FOREIGN KEY (id_diagnos) REFERENCES "toothCare".diagnoses(id);


--
-- Name: diagnoses_list diagnoses_list_fk_1; Type: FK CONSTRAINT; Schema: toothCare; Owner: postgres
--

ALTER TABLE ONLY "toothCare".diagnoses_list
    ADD CONSTRAINT diagnoses_list_fk_1 FOREIGN KEY (id_patient) REFERENCES "toothCare".patients(id);


--
-- Name: services services_fk; Type: FK CONSTRAINT; Schema: toothCare; Owner: kardachh
--

ALTER TABLE ONLY "toothCare".services
    ADD CONSTRAINT services_fk FOREIGN KEY (id_product) REFERENCES "toothCare".products(id);


--
-- PostgreSQL database dump complete
--


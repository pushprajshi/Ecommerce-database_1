--
-- PostgreSQL database dump
--

\restrict FdGGeOYHb5cipvneWBIesyBSOkxEaKcBtfL9AF71ieOQ9lDAepaEEcfKw6Zhwwx

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-09-19 13:40:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16613)
-- Name: E-commerce; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "E-commerce";


ALTER SCHEMA "E-commerce" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 16615)
-- Name: customers; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".customers (
    customer_id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    phone character varying(15),
    city character varying(50)
);


ALTER TABLE "E-commerce".customers OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16614)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 228
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".customers_customer_id_seq OWNED BY "E-commerce".customers.customer_id;


--
-- TOC entry 235 (class 1259 OID 16852)
-- Name: order_items; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer
);


ALTER TABLE "E-commerce".order_items OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16851)
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".order_items_order_item_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".order_items_order_item_id_seq OWNED BY "E-commerce".order_items.order_item_id;


--
-- TOC entry 233 (class 1259 OID 16839)
-- Name: orders; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".orders (
    order_id integer NOT NULL,
    customer_id integer,
    order_date date DEFAULT CURRENT_DATE
);


ALTER TABLE "E-commerce".orders OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16838)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 232
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".orders_order_id_seq OWNED BY "E-commerce".orders.order_id;


--
-- TOC entry 237 (class 1259 OID 16869)
-- Name: payments; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".payments (
    payment_id integer NOT NULL,
    order_id integer,
    amount numeric(10,2),
    payment_date date DEFAULT CURRENT_DATE,
    method character varying(50)
);


ALTER TABLE "E-commerce".payments OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16868)
-- Name: payments_payment_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".payments_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".payments_payment_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 236
-- Name: payments_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".payments_payment_id_seq OWNED BY "E-commerce".payments.payment_id;


--
-- TOC entry 231 (class 1259 OID 16624)
-- Name: products; Type: TABLE; Schema: E-commerce; Owner: postgres
--

CREATE TABLE "E-commerce".products (
    product_id integer NOT NULL,
    product_name character varying(100),
    price numeric(10,2),
    stock integer
);


ALTER TABLE "E-commerce".products OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16623)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: E-commerce; Owner: postgres
--

CREATE SEQUENCE "E-commerce".products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE "E-commerce".products_product_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: E-commerce; Owner: postgres
--

ALTER SEQUENCE "E-commerce".products_product_id_seq OWNED BY "E-commerce".products.product_id;


--
-- TOC entry 4786 (class 2604 OID 16951)
-- Name: customers customer_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers ALTER COLUMN customer_id SET DEFAULT nextval('"E-commerce".customers_customer_id_seq'::regclass);


--
-- TOC entry 4790 (class 2604 OID 16952)
-- Name: order_items order_item_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items ALTER COLUMN order_item_id SET DEFAULT nextval('"E-commerce".order_items_order_item_id_seq'::regclass);


--
-- TOC entry 4788 (class 2604 OID 16953)
-- Name: orders order_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders ALTER COLUMN order_id SET DEFAULT nextval('"E-commerce".orders_order_id_seq'::regclass);


--
-- TOC entry 4791 (class 2604 OID 16954)
-- Name: payments payment_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments ALTER COLUMN payment_id SET DEFAULT nextval('"E-commerce".payments_payment_id_seq'::regclass);


--
-- TOC entry 4787 (class 2604 OID 16955)
-- Name: products product_id; Type: DEFAULT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".products ALTER COLUMN product_id SET DEFAULT nextval('"E-commerce".products_product_id_seq'::regclass);


--
-- TOC entry 4956 (class 0 OID 16615)
-- Dependencies: 229
-- Data for Name: customers; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".customers (customer_id, name, email, phone, city) FROM stdin;
1	Ravi kumar	ravikumar@gmail.com	1234567845	Delhi
2	Anita Sharma	anita@example.com	9123456780	Mumbai
3	Arjun Singh	arjun@example.com	9988776655	Lucknow
\.


--
-- TOC entry 4962 (class 0 OID 16852)
-- Dependencies: 235
-- Data for Name: order_items; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".order_items (order_item_id, order_id, product_id, quantity) FROM stdin;
1	1	1	1
2	1	3	2
3	2	2	1
4	3	4	1
\.


--
-- TOC entry 4960 (class 0 OID 16839)
-- Dependencies: 233
-- Data for Name: orders; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".orders (order_id, customer_id, order_date) FROM stdin;
1	1	2025-09-18
2	2	2025-09-18
3	1	2025-09-18
\.


--
-- TOC entry 4964 (class 0 OID 16869)
-- Dependencies: 237
-- Data for Name: payments; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".payments (payment_id, order_id, amount, payment_date, method) FROM stdin;
4	1	59000.00	2025-09-18	Card
5	2	20000.00	2025-09-18	UPI
6	3	1500.00	2025-09-18	Cash on Delivery
\.


--
-- TOC entry 4958 (class 0 OID 16624)
-- Dependencies: 231
-- Data for Name: products; Type: TABLE DATA; Schema: E-commerce; Owner: postgres
--

COPY "E-commerce".products (product_id, product_name, price, stock) FROM stdin;
1	Laptop	55000.00	10
2	Mobile Phone	20000.00	30
3	Headphones	2000.00	50
4	Keyboard	1500.00	40
\.


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 228
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".customers_customer_id_seq', 3, true);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 234
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".order_items_order_item_id_seq', 4, true);


--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 232
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".orders_order_id_seq', 3, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 236
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".payments_payment_id_seq', 6, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 230
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: E-commerce; Owner: postgres
--

SELECT pg_catalog.setval('"E-commerce".products_product_id_seq', 4, true);


--
-- TOC entry 4794 (class 2606 OID 16622)
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- TOC entry 4796 (class 2606 OID 16620)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4802 (class 2606 OID 16857)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- TOC entry 4800 (class 2606 OID 16845)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4804 (class 2606 OID 16875)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (payment_id);


--
-- TOC entry 4798 (class 2606 OID 16629)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4806 (class 2606 OID 16858)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES "E-commerce".orders(order_id);


--
-- TOC entry 4807 (class 2606 OID 16863)
-- Name: order_items order_items_product_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".order_items
    ADD CONSTRAINT order_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES "E-commerce".products(product_id);


--
-- TOC entry 4805 (class 2606 OID 16846)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES "E-commerce".customers(customer_id);


--
-- TOC entry 4808 (class 2606 OID 16876)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: E-commerce; Owner: postgres
--

ALTER TABLE ONLY "E-commerce".payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES "E-commerce".orders(order_id);


-- Completed on 2025-09-19 13:40:27

--
-- PostgreSQL database dump complete
--

\unrestrict FdGGeOYHb5cipvneWBIesyBSOkxEaKcBtfL9AF71ieOQ9lDAepaEEcfKw6Zhwwx


--
-- PostgreSQL database cluster dump
--

-- Started on 2025-03-22 13:59:08

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-22 13:59:08

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

-- Completed on 2025-03-22 13:59:09

--
-- PostgreSQL database dump complete
--

--
-- Database "libssyz" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-22 13:59:09

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
-- TOC entry 4887 (class 1262 OID 16388)
-- Name: libssyz; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE libssyz WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru-RU';


ALTER DATABASE libssyz OWNER TO postgres;

\connect libssyz

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

-- Completed on 2025-03-22 13:59:09

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-22 13:59:09

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
-- TOC entry 2 (class 3079 OID 16550)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4988 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16470)
-- Name: authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authors (
    authorid integer NOT NULL,
    authorname character varying(100) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.authors OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16469)
-- Name: authors_authorid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.authors_authorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.authors_authorid_seq OWNER TO postgres;

--
-- TOC entry 4989 (class 0 OID 0)
-- Dependencies: 218
-- Name: authors_authorid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.authors_authorid_seq OWNED BY public.authors.authorid;


--
-- TOC entry 223 (class 1259 OID 16490)
-- Name: books; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.books (
    bookid integer NOT NULL,
    title character varying(255) NOT NULL,
    authorid integer NOT NULL,
    genreid integer NOT NULL,
    publicationyear integer NOT NULL,
    availablecopies integer DEFAULT 0 NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.books OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16489)
-- Name: books_bookid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.books_bookid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.books_bookid_seq OWNER TO postgres;

--
-- TOC entry 4990 (class 0 OID 0)
-- Dependencies: 222
-- Name: books_bookid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.books_bookid_seq OWNED BY public.books.bookid;


--
-- TOC entry 221 (class 1259 OID 16479)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genreid integer NOT NULL,
    genrename character varying(100) NOT NULL,
    description text,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16478)
-- Name: genres_genreid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genreid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genreid_seq OWNER TO postgres;

--
-- TOC entry 4991 (class 0 OID 0)
-- Dependencies: 220
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 227 (class 1259 OID 16521)
-- Name: loans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loans (
    loanid integer NOT NULL,
    userid integer NOT NULL,
    bookid integer NOT NULL,
    loandate date NOT NULL,
    returndate date,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.loans OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16520)
-- Name: loans_loanid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loans_loanid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.loans_loanid_seq OWNER TO postgres;

--
-- TOC entry 4992 (class 0 OID 0)
-- Dependencies: 226
-- Name: loans_loanid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loans_loanid_seq OWNED BY public.loans.loanid;


--
-- TOC entry 225 (class 1259 OID 16510)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    email character varying(100) NOT NULL,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16509)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 4993 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4799 (class 2604 OID 16473)
-- Name: authors authorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN authorid SET DEFAULT nextval('public.authors_authorid_seq'::regclass);


--
-- TOC entry 4805 (class 2604 OID 16493)
-- Name: books bookid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN bookid SET DEFAULT nextval('public.books_bookid_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 16482)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 4811 (class 2604 OID 16524)
-- Name: loans loanid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN loanid SET DEFAULT nextval('public.loans_loanid_seq'::regclass);


--
-- TOC entry 4809 (class 2604 OID 16513)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4974 (class 0 OID 16470)
-- Dependencies: 219
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authors (authorid, authorname, createdat, updatedat) FROM stdin;
1	Лев Толстой	2025-03-01 19:46:50.19097	2025-03-01 19:46:50.19097
2	Федор Достоевский	2025-03-01 19:46:50.19097	2025-03-01 19:46:50.19097
3	Антон Чехов	2025-03-01 19:46:50.19097	2025-03-01 19:46:50.19097
4	Александр Пушкин	2025-03-01 19:46:50.19097	2025-03-01 19:46:50.19097
5	Михаил Булгаков	2025-03-01 19:46:50.19097	2025-03-01 19:46:50.19097
18	Джек Лондон	2025-03-11 18:50:34.676169	2025-03-11 18:50:34.676169
22	Джоан Роулинг	2025-03-11 22:16:10.050838	2025-03-11 22:16:10.050838
23	Александр Пушкин	2025-03-11 22:20:40.978026	2025-03-11 22:20:40.978026
\.


--
-- TOC entry 4978 (class 0 OID 16490)
-- Dependencies: 223
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.books (bookid, title, authorid, genreid, publicationyear, availablecopies, createdat, updatedat) FROM stdin;
2	Преступление и наказание	2	1	1866	3	2025-03-01 19:47:27.878129	2025-03-01 19:47:27.878129
3	Чайка	3	2	1896	4	2025-03-01 19:47:27.878129	2025-03-01 19:47:27.878129
4	Евгений Онегин	4	1	1833	2	2025-03-01 19:47:27.878129	2025-03-01 19:47:27.878129
5	Мастер и Маргарита	5	1	1967	1	2025-03-01 19:47:27.878129	2025-03-01 19:47:27.878129
9	Мартин Иден	18	1	1909	7	2025-03-11 18:50:55.528675	2025-03-11 18:50:55.528675
1	Война и мир	1	1	1869	6	2025-03-01 19:47:27.878129	2025-03-01 19:47:27.878129
10	Гарри Поттер и философский камень	22	4	1997	9	2025-03-11 22:19:57.197405	2025-03-11 22:19:57.197405
11	Капитанская дочка	23	1	1836	6	2025-03-11 22:23:00.395759	2025-03-11 22:23:00.395759
\.


--
-- TOC entry 4976 (class 0 OID 16479)
-- Dependencies: 221
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (genreid, genrename, description, createdat, updatedat) FROM stdin;
1	Роман	Литературный жанр, в котором описываются события и персонажи в длительном повествовании.	2025-03-01 19:47:06.6044	2025-03-01 19:47:06.6044
2	Драма	Жанр, в котором основное внимание уделяется конфликтам и эмоциям персонажей.	2025-03-01 19:47:06.6044	2025-03-01 19:47:06.6044
3	Комедия	Литературный жанр, который вызывает смех и развлечение.	2025-03-01 19:47:06.6044	2025-03-01 19:47:06.6044
4	Фантастика	Жанр, основанный на вымышленных событиях и мирах.	2025-03-01 19:47:06.6044	2025-03-01 19:47:06.6044
5	Научная литература	Литература, основанная на научных фактах и исследованиях.	2025-03-01 19:47:06.6044	2025-03-01 19:47:06.6044
\.


--
-- TOC entry 4982 (class 0 OID 16521)
-- Dependencies: 227
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (loanid, userid, bookid, loandate, returndate, createdat, updatedat) FROM stdin;
1	1	1	2023-10-01	\N	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
3	3	3	2023-10-03	2023-10-10	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
4	1	4	2023-10-04	\N	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
\.


--
-- TOC entry 4980 (class 0 OID 16510)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, email, createdat, password) FROM stdin;
4	kuznetsova@example.com	2025-03-01 19:47:43.38866	kz785456
1	ivanov@example.com	2025-03-01 19:47:43.38866	iv59869
6	bobov@example.com	2025-03-11 20:49:42.231854	5064d613a4b518ec6c35af8557f53bc644a0b415d87b970a69d39b5a98786bc2
7	vivov@example.com	2025-03-11 20:53:08.269367	7480c58cc5ac14956d6e6d2d8266ee1cb1eb1d294290f83e363c681eef29a566
3	sidorov@example.com	2025-03-01 19:47:43.38866	sd12234
8	ku@example.com	2025-03-11 21:04:27.349585	541a288b026d08eeb040210b91ab406905501dc86b93ed974a78b22ad47f6cfb
9	so@example.com	2025-03-11 21:24:58.427528	f55213fb2e418d24c6989fc18f10f923036e38f2896762cee241e25d209f24aa
10	ma@example.com	2025-03-11 21:33:19.702818	c3491ddc255cc168b051d83b5ddbee62d223b4947d867794b6d6308961dab1b2
11	mz@example.com	2025-03-14 00:35:35.568493	08d63cec98c3d502eca609da18468d50727de4256be1e7ee84854bc4a250f43d
12	cs@go.com	2025-03-20 19:30:29.342259	c3683517539a2452f7890cd9ec8eb330d8465673140d8abc89a82e5a1329d696
13	ca@ca.com	2025-03-20 19:42:28.692424	654d39250f17be490aa583831fa39e0b7833e27dbbc468d01c7f199e0f9ecd8e
14	nz@nz.com	2025-03-20 19:51:04.031437	36911f0d0fd022c35d2a6784af5f7785ab23217c88e6e5f2ab5620f6b85feb87
15	cac@cac.com	2025-03-22 13:03:05.422955	1f2b89c7a0f52c3f516ef67a72fde5332df89b1607ec5dbc7e6f022263695a3e
\.


--
-- TOC entry 4994 (class 0 OID 0)
-- Dependencies: 218
-- Name: authors_authorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_authorid_seq', 24, true);


--
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 222
-- Name: books_bookid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_bookid_seq', 11, true);


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 220
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 5, true);


--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 226
-- Name: loans_loanid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loanid_seq', 4, true);


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 15, true);


--
-- TOC entry 4815 (class 2606 OID 16477)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (authorid);


--
-- TOC entry 4819 (class 2606 OID 16498)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (bookid);


--
-- TOC entry 4817 (class 2606 OID 16488)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 4823 (class 2606 OID 16528)
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loanid);


--
-- TOC entry 4821 (class 2606 OID 16517)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4824 (class 2606 OID 16499)
-- Name: books books_authorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.authors(authorid) ON DELETE SET NULL;


--
-- TOC entry 4825 (class 2606 OID 16587)
-- Name: books books_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid) ON DELETE SET NULL;


--
-- TOC entry 4826 (class 2606 OID 16534)
-- Name: loans loans_bookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.books(bookid) ON DELETE CASCADE;


--
-- TOC entry 4827 (class 2606 OID 16529)
-- Name: loans loans_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;


-- Completed on 2025-03-22 13:59:09

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-03-22 13:59:09

--
-- PostgreSQL database cluster dump complete
--


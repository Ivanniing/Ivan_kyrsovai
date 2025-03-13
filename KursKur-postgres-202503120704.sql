--
-- PostgreSQL database cluster dump
--

-- Started on 2025-03-12 07:04:14

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

-- Started on 2025-03-12 07:04:14

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

-- Completed on 2025-03-12 07:04:14

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

-- Started on 2025-03-12 07:04:14

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

-- Completed on 2025-03-12 07:04:15

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

-- Started on 2025-03-12 07:04:15

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
-- TOC entry 5001 (class 0 OID 0)
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
-- TOC entry 5002 (class 0 OID 0)
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
-- TOC entry 5003 (class 0 OID 0)
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
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 220
-- Name: genres_genreid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genreid_seq OWNED BY public.genres.genreid;


--
-- TOC entry 229 (class 1259 OID 16540)
-- Name: librarians; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.librarians (
    librarianid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE public.librarians OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16539)
-- Name: librarians_librarianid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.librarians_librarianid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.librarians_librarianid_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 228
-- Name: librarians_librarianid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.librarians_librarianid_seq OWNED BY public.librarians.librarianid;


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
-- TOC entry 5006 (class 0 OID 0)
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
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    studentid character varying(20),
    email character varying(100) NOT NULL,
    usertype character varying(10) NOT NULL,
    address character varying(255),
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    password character varying(255),
    CONSTRAINT users_usertype_check CHECK (((usertype)::text = ANY ((ARRAY['Student'::character varying, 'Teacher'::character varying])::text[])))
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
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 4804 (class 2604 OID 16473)
-- Name: authors authorid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors ALTER COLUMN authorid SET DEFAULT nextval('public.authors_authorid_seq'::regclass);


--
-- TOC entry 4810 (class 2604 OID 16493)
-- Name: books bookid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books ALTER COLUMN bookid SET DEFAULT nextval('public.books_bookid_seq'::regclass);


--
-- TOC entry 4807 (class 2604 OID 16482)
-- Name: genres genreid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genreid SET DEFAULT nextval('public.genres_genreid_seq'::regclass);


--
-- TOC entry 4819 (class 2604 OID 16543)
-- Name: librarians librarianid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarians ALTER COLUMN librarianid SET DEFAULT nextval('public.librarians_librarianid_seq'::regclass);


--
-- TOC entry 4816 (class 2604 OID 16524)
-- Name: loans loanid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans ALTER COLUMN loanid SET DEFAULT nextval('public.loans_loanid_seq'::regclass);


--
-- TOC entry 4814 (class 2604 OID 16513)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 4985 (class 0 OID 16470)
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
-- TOC entry 4989 (class 0 OID 16490)
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
-- TOC entry 4987 (class 0 OID 16479)
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
-- TOC entry 4995 (class 0 OID 16540)
-- Dependencies: 229
-- Data for Name: librarians; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.librarians (librarianid, firstname, lastname, email) FROM stdin;
1	Ольга	Смирнова	smirnova@example.com
2	Дмитрий	Федоров	fedorov@example.com
\.


--
-- TOC entry 4993 (class 0 OID 16521)
-- Dependencies: 227
-- Data for Name: loans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loans (loanid, userid, bookid, loandate, returndate, createdat, updatedat) FROM stdin;
1	1	1	2023-10-01	\N	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
2	2	2	2023-10-02	\N	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
3	3	3	2023-10-03	2023-10-10	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
4	1	4	2023-10-04	\N	2025-03-01 19:48:02.312392	2025-03-01 19:48:02.312392
\.


--
-- TOC entry 4991 (class 0 OID 16510)
-- Dependencies: 225
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, firstname, lastname, studentid, email, usertype, address, createdat, password) FROM stdin;
2	Анна	Петрова	SSUZ654321	petrova@example.com	Student	Санкт-Петербург, ул. Пушкина, д. 2	2025-03-01 19:47:43.38866	pt45564
4	Мария	Кузнецова	SSUZ333444	kuznetsova@example.com	Teacher	Казань, ул. Гоголя, д. 4	2025-03-01 19:47:43.38866	kz785456
1	Иван	Иванов	SSUZ123456	ivanov@example.com	Student	Москва, ул. Ленина, д. 1	2025-03-01 19:47:43.38866	iv59869
6	Иван	Бобов	SSUZ123	bobov@example.com	Teacher	Москва, ул Ватрушкина, д. 5	2025-03-11 20:49:42.231854	5064d613a4b518ec6c35af8557f53bc644a0b415d87b970a69d39b5a98786bc2
7	Максим	Вивов	SSUZ1234	vivov@example.com	Student	Воркута, ул. Чаплина, д. 1	2025-03-11 20:53:08.269367	7480c58cc5ac14956d6e6d2d8266ee1cb1eb1d294290f83e363c681eef29a566
3	Сергей	Сидоров	SSUZ111222	sidorov@example.com	Teacher	Екатеринбург, ул. Чехова, д. 3	2025-03-01 19:47:43.38866	sd12234
8	Алексей	Кузнецов	SSUZ12	ku@example.com	Teacher	Казань, ул. Палкина, д. 4	2025-03-11 21:04:27.349585	541a288b026d08eeb040210b91ab406905501dc86b93ed974a78b22ad47f6cfb
9	Дмитрий	Совов	SSUZ11	so@example.com	Teacher	Пермь, ул. Моли, д. 6	2025-03-11 21:24:58.427528	f55213fb2e418d24c6989fc18f10f923036e38f2896762cee241e25d209f24aa
10	Сергей	Мамонтов	SUZZ44	ma@example.com	Teacher	Рязань, ул. Марса, д. 8	2025-03-11 21:33:19.702818	c3491ddc255cc168b051d83b5ddbee62d223b4947d867794b6d6308961dab1b2
\.


--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 218
-- Name: authors_authorid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.authors_authorid_seq', 23, true);


--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 222
-- Name: books_bookid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.books_bookid_seq', 11, true);


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 220
-- Name: genres_genreid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genreid_seq', 5, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 228
-- Name: librarians_librarianid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.librarians_librarianid_seq', 2, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 226
-- Name: loans_loanid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loans_loanid_seq', 4, true);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 224
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 10, true);


--
-- TOC entry 4822 (class 2606 OID 16477)
-- Name: authors authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (authorid);


--
-- TOC entry 4826 (class 2606 OID 16498)
-- Name: books books_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_pkey PRIMARY KEY (bookid);


--
-- TOC entry 4824 (class 2606 OID 16488)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genreid);


--
-- TOC entry 4834 (class 2606 OID 16545)
-- Name: librarians librarians_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.librarians
    ADD CONSTRAINT librarians_pkey PRIMARY KEY (librarianid);


--
-- TOC entry 4832 (class 2606 OID 16528)
-- Name: loans loans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_pkey PRIMARY KEY (loanid);


--
-- TOC entry 4828 (class 2606 OID 16517)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 4830 (class 2606 OID 16519)
-- Name: users users_studentid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_studentid_key UNIQUE (studentid);


--
-- TOC entry 4835 (class 2606 OID 16499)
-- Name: books books_authorid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_authorid_fkey FOREIGN KEY (authorid) REFERENCES public.authors(authorid) ON DELETE SET NULL;


--
-- TOC entry 4836 (class 2606 OID 16587)
-- Name: books books_genreid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.books
    ADD CONSTRAINT books_genreid_fkey FOREIGN KEY (genreid) REFERENCES public.genres(genreid) ON DELETE SET NULL;


--
-- TOC entry 4837 (class 2606 OID 16534)
-- Name: loans loans_bookid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_bookid_fkey FOREIGN KEY (bookid) REFERENCES public.books(bookid) ON DELETE CASCADE;


--
-- TOC entry 4838 (class 2606 OID 16529)
-- Name: loans loans_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loans
    ADD CONSTRAINT loans_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;


-- Completed on 2025-03-12 07:04:15

--
-- PostgreSQL database dump complete
--

-- Completed on 2025-03-12 07:04:15

--
-- PostgreSQL database cluster dump complete
--


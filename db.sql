--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: messes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messes (
    id bigint NOT NULL,
    mess_name character varying,
    password_digest character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.messes OWNER TO postgres;

--
-- Name: messes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messes_id_seq OWNER TO postgres;

--
-- Name: messes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messes_id_seq OWNED BY public.messes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    rollno character varying,
    password_digest character varying,
    roomno integer,
    mess_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: messes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messes ALTER COLUMN id SET DEFAULT nextval('public.messes_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-05-26 07:20:41.131608	2020-05-26 07:20:41.131608
\.


--
-- Data for Name: messes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messes (id, mess_name, password_digest, created_at, updated_at) FROM stdin;
1	c	$2a$12$Q.jm3.RL2hWdFL6OFcU5tuxmoEWnUWfg11.JRbiBrCkMPG2duy3Ii	2020-05-26 07:23:52.846992	2020-05-26 07:23:52.846992
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20200525163649
20200525163913
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, name, email, rollno, password_digest, roomno, mess_id, created_at, updated_at) FROM stdin;
1	Shabin Kv	shabinkv3@gmail.com	B170173CS	$2a$12$298nakZ5SUEXbnMZML4e5.D7JtH8wxHjO7qZsh6uVkdiPyuAIPA..	318	1	2020-05-26 07:24:16.555925	2020-05-26 07:24:16.555925
2	kp	krishnakichu1907@gmail.com	B170881CS	$2a$12$2URiKwlNkQWWkK3pCVJwT.MenFJfjRVvgjl01PDM.f4hRQUInG3hq	1	1	2020-05-26 07:53:03.925119	2020-05-26 07:53:03.925119
3	Akhil Babu	akhil@gmail.com	B170111CS	$2a$12$E5BQ72AI..5kbBOe7zAbr.2n6YvMplBbrJQ1pJA4mVkOLz0C245Ue	2	1	2020-05-26 08:01:36.285197	2020-05-26 08:01:36.285197
4	Sidharth Anil	sidharth@gmail.com	B170117CS	$2a$12$Ft/As2WQ0zQDWHCmNvnVDuTsh4hiHe5e5fdkSLigqHBA8gL3Uos5y	4	1	2020-05-26 08:02:14.59389	2020-05-26 08:02:14.59389
\.


--
-- Name: messes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messes_id_seq', 1, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 4, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: messes messes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messes
    ADD CONSTRAINT messes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: index_students_on_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_students_on_email ON public.students USING btree (email);


--
-- Name: index_students_on_rollno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_students_on_rollno ON public.students USING btree (rollno);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

\restrict 3aIFlvmbxFit1uwVKKlYFdO04cdjcGyf9gM60eO2thY226rcNauYRLqv37zSPeN

-- Dumped from database version 15.15 (Debian 15.15-1.pgdg13+1)
-- Dumped by pg_dump version 15.15 (Debian 15.15-1.pgdg13+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: task; Type: TABLE; Schema: public; Owner: tduser
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    description character varying(1000),
    done boolean NOT NULL,
    title character varying(255)
);


ALTER TABLE public.task OWNER TO tduser;

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: tduser
--

CREATE SEQUENCE public.task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO tduser;

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tduser
--

ALTER SEQUENCE public.task_id_seq OWNED BY public.task.id;


--
-- Name: task id; Type: DEFAULT; Schema: public; Owner: tduser
--

ALTER TABLE ONLY public.task ALTER COLUMN id SET DEFAULT nextval('public.task_id_seq'::regclass);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: tduser
--

COPY public.task (id, created_at, description, done, title) FROM stdin;
2	2025-12-12 08:59:36.363177	Finish chapter 7	f	Read book
3	2025-12-12 08:59:36.36906	Investigate NPE on startup	t	Fix bug
4	2025-12-12 09:04:47.672262		t	apply jobs
1	2025-12-12 08:59:36.231254	Milk, eggs, bread	t	Buy groceries
5	2025-12-12 10:20:14.869069	Milk, eggs, bread	f	Buy groceries
6	2025-12-12 10:20:15.131252	Finish chapter 7	f	Read book
7	2025-12-12 10:20:15.137108	Investigate NPE on startup	t	Fix bug
\.


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tduser
--

SELECT pg_catalog.setval('public.task_id_seq', 7, true);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: tduser
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3aIFlvmbxFit1uwVKKlYFdO04cdjcGyf9gM60eO2thY226rcNauYRLqv37zSPeN


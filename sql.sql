--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-1.pgdg21.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-1.pgdg21.04+1)

-- Started on 2022-01-19 12:11:18 +05

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
-- TOC entry 231 (class 1255 OID 16479)
-- Name: insert_task(); Type: FUNCTION; Schema: public; Owner: dart
--

CREATE FUNCTION public.insert_task() RETURNS trigger
    LANGUAGE plpgsql LEAKPROOF
    AS $$DECLARE
    user_id INTEGER;
    project_id INTEGER;
    creator_user_id INTEGER;
    creator_project_id INTEGER;
BEGIN
    SELECT project_user.user_id, project_user.project_id INTO user_id, project_id FROM project_user WHERE id = OLD.performer_id;
    SELECT project_user.user_id, project_user.project_id INTO creator_user_id, creator_project_id FROM project_user WHERE id = OLD.creator_id;
    IF (TG_OP = 'DELETE') THEN
        UPDATE projects SET count_tasks = count_tasks - 1 WHERE projects.id = project_id;
        IF (OLD.is_done = 'true') THEN
            UPDATE projects SET count_done_tasks = count_done_tasks - 1 WHERE projects.id = project_id;
        END IF;
    ELSIF (TG_OP = 'UPDATE') THEN
        IF (NEW.is_done = 'true' AND OLD.is_done != NEW.is_done) THEN
            UPDATE projects SET count_done_tasks = count_done_tasks + 1 WHERE projects.id = project_id;
        ELSIF (NEW.is_done = 'false' AND OLD.is_done != NEW.is_done) THEN
            UPDATE projects SET count_done_tasks = count_done_tasks - 1 WHERE projects.id = project_id;
        END IF;
        RETURN NEW;
    ELSIF (TG_OP = 'INSERT') THEN
        UPDATE projects SET count_tasks = count_tasks + 1 WHERE projects.id = project_id;
        RETURN NEW;
    END IF;
    RETURN NULL;
END;$$;


ALTER FUNCTION public.insert_task() OWNER TO dart;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16481)
-- Name: count_done_tasks; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.count_done_tasks (
    count bigint
);


ALTER TABLE public.count_done_tasks OWNER TO dart;

--
-- TOC entry 216 (class 1259 OID 16425)
-- Name: projects; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    count_tasks integer DEFAULT 0 NOT NULL,
    count_done_tasks integer DEFAULT 0 NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.projects OWNER TO dart;

--
-- TOC entry 215 (class 1259 OID 16424)
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: dart
--

ALTER TABLE public.projects ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16409)
-- Name: project_user; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.project_user (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.project_user OWNER TO dart;

--
-- TOC entry 213 (class 1259 OID 16408)
-- Name: project_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dart
--

ALTER TABLE public.project_user ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.project_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 211 (class 1259 OID 16402)
-- Name: roles; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.roles OWNER TO dart;

--
-- TOC entry 212 (class 1259 OID 16407)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: dart
--

ALTER TABLE public.roles ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 218 (class 1259 OID 16455)
-- Name: tasks; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(50) NOT NULL,
    creator_id integer NOT NULL,
    performer_id integer NOT NULL,
    is_done boolean DEFAULT false NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    CONSTRAINT priority_check CHECK (((priority = 0) OR (priority = 1) OR (priority = 2)))
);


ALTER TABLE public.tasks OWNER TO dart;

--
-- TOC entry 217 (class 1259 OID 16454)
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: dart
--

ALTER TABLE public.tasks ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 209 (class 1259 OID 16388)
-- Name: users; Type: TABLE; Schema: public; Owner: dart
--

CREATE TABLE public.users (
    name character varying(50) NOT NULL,
    id bigint NOT NULL,
    last_name character varying(50) NOT NULL,
    patronymic character varying(50) NOT NULL,
    birthdate date,
    email character varying(100) NOT NULL,
    permission character varying(20) DEFAULT USER NOT NULL,
    password text NOT NULL,
    photo text NOT NULL,
    phone integer NOT NULL
);


ALTER TABLE public.users OWNER TO dart;

--
-- TOC entry 210 (class 1259 OID 16391)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dart
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3405 (class 0 OID 16481)
-- Dependencies: 219
-- Data for Name: count_done_tasks; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.count_done_tasks (count) FROM stdin;
0
\.


--
-- TOC entry 3400 (class 0 OID 16409)
-- Dependencies: 214
-- Data for Name: project_user; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.project_user (id, project_id, user_id, role_id) FROM stdin;
2	2	21	1
62	61	21	1
72	61	20	1
82	61	19	1
83	65	21	1
\.


--
-- TOC entry 3402 (class 0 OID 16425)
-- Dependencies: 216
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.projects (id, count_tasks, count_done_tasks, title) FROM stdin;
2	0	0	Project #2
61	2	0	Project #11
65	0	0	Project #12
\.


--
-- TOC entry 3397 (class 0 OID 16402)
-- Dependencies: 211
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.roles (id, name) FROM stdin;
1	admin
2	user
\.


--
-- TOC entry 3404 (class 0 OID 16455)
-- Dependencies: 218
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.tasks (id, title, description, creator_id, performer_id, is_done, priority) FROM stdin;
16	title #3	description #3	82	82	f	1
3	title	description	82	82	f	1
\.


--
-- TOC entry 3395 (class 0 OID 16388)
-- Dependencies: 209
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dart
--

COPY public.users (name, id, last_name, patronymic, birthdate, email, permission, password, photo, phone) FROM stdin;
ddd	19	dd	dd	\N	ddd	user	ddd	none	99
ddd	20	dd	dd	\N	ddd@d	user	ddd	none	99
123	21	123	123	\N	em@em.em	user	123	none	99
\.


--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 215
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dart
--

SELECT pg_catalog.setval('public.project_id_seq', 65, true);


--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 213
-- Name: project_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dart
--

SELECT pg_catalog.setval('public.project_user_id_seq', 83, true);


--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 212
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dart
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 217
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dart
--

SELECT pg_catalog.setval('public.tasks_id_seq', 24, true);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 210
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dart
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- TOC entry 3237 (class 2606 OID 16401)
-- Name: users email_unique; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT email_unique UNIQUE (email);


--
-- TOC entry 3241 (class 2606 OID 16406)
-- Name: roles id_pk; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT id_pk PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 16431)
-- Name: projects project_pkey; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 16413)
-- Name: project_user project_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 16459)
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 16396)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2620 OID 16489)
-- Name: tasks delete_task; Type: TRIGGER; Schema: public; Owner: dart
--

CREATE TRIGGER delete_task AFTER DELETE ON public.tasks FOR EACH ROW EXECUTE FUNCTION public.insert_task();


--
-- TOC entry 3253 (class 2620 OID 16486)
-- Name: tasks insert_task; Type: TRIGGER; Schema: public; Owner: dart
--

CREATE TRIGGER insert_task AFTER INSERT ON public.tasks FOR EACH ROW EXECUTE FUNCTION public.insert_task();


--
-- TOC entry 3254 (class 2620 OID 16487)
-- Name: tasks update_task; Type: TRIGGER; Schema: public; Owner: dart
--

CREATE TRIGGER update_task AFTER UPDATE OF is_done ON public.tasks FOR EACH ROW EXECUTE FUNCTION public.insert_task();


--
-- TOC entry 3251 (class 2606 OID 16466)
-- Name: tasks creator_fk; Type: FK CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT creator_fk FOREIGN KEY (creator_id) REFERENCES public.project_user(id) NOT VALID;


--
-- TOC entry 3252 (class 2606 OID 16471)
-- Name: tasks performer_id; Type: FK CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT performer_id FOREIGN KEY (performer_id) REFERENCES public.project_user(id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 16439)
-- Name: project_user project_id; Type: FK CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT project_id FOREIGN KEY (project_id) REFERENCES public.projects(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 3249 (class 2606 OID 16444)
-- Name: project_user role_id; Type: FK CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT role_id FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 16449)
-- Name: project_user user_id; Type: FK CONSTRAINT; Schema: public; Owner: dart
--

ALTER TABLE ONLY public.project_user
    ADD CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


-- Completed on 2022-01-19 12:11:18 +05

--
-- PostgreSQL database dump complete
--


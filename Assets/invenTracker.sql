--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: items; Type: TABLE; Schema: public; Owner: rafinoval72
--

CREATE TABLE public.items (
    itemid integer NOT NULL,
    name text NOT NULL,
    quantity integer NOT NULL,
    category text NOT NULL,
    locationid integer NOT NULL,
    dateadded date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.items OWNER TO rafinoval72;

--
-- Name: items_itemid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.items_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_itemid_seq OWNER TO rafinoval72;

--
-- Name: items_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.items_itemid_seq OWNED BY public.items.itemid;


--
-- Name: items_locationid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.items_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_locationid_seq OWNER TO rafinoval72;

--
-- Name: items_locationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.items_locationid_seq OWNED BY public.items.locationid;


--
-- Name: location; Type: TABLE; Schema: public; Owner: rafinoval72
--

CREATE TABLE public.location (
    locationid integer NOT NULL,
    location_name text NOT NULL,
    description text NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.location OWNER TO rafinoval72;

--
-- Name: location_locationid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.location_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_locationid_seq OWNER TO rafinoval72;

--
-- Name: location_locationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.location_locationid_seq OWNED BY public.location.locationid;


--
-- Name: movement; Type: TABLE; Schema: public; Owner: rafinoval72
--

CREATE TABLE public.movement (
    movementid integer NOT NULL,
    itemid integer NOT NULL,
    userid integer NOT NULL,
    locationid integer NOT NULL,
    date date DEFAULT CURRENT_DATE NOT NULL,
    note text NOT NULL
);


ALTER TABLE public.movement OWNER TO rafinoval72;

--
-- Name: movement_itemid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.movement_itemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_itemid_seq OWNER TO rafinoval72;

--
-- Name: movement_itemid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.movement_itemid_seq OWNED BY public.movement.itemid;


--
-- Name: movement_locationid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.movement_locationid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_locationid_seq OWNER TO rafinoval72;

--
-- Name: movement_locationid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.movement_locationid_seq OWNED BY public.movement.locationid;


--
-- Name: movement_movementid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.movement_movementid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_movementid_seq OWNER TO rafinoval72;

--
-- Name: movement_movementid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.movement_movementid_seq OWNED BY public.movement.movementid;


--
-- Name: movement_userid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.movement_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movement_userid_seq OWNER TO rafinoval72;

--
-- Name: movement_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.movement_userid_seq OWNED BY public.movement.userid;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rafinoval72
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    name text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.users OWNER TO rafinoval72;

--
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: rafinoval72
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO rafinoval72;

--
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rafinoval72
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- Name: items itemid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.items ALTER COLUMN itemid SET DEFAULT nextval('public.items_itemid_seq'::regclass);


--
-- Name: items locationid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.items ALTER COLUMN locationid SET DEFAULT nextval('public.items_locationid_seq'::regclass);


--
-- Name: location locationid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.location ALTER COLUMN locationid SET DEFAULT nextval('public.location_locationid_seq'::regclass);


--
-- Name: movement movementid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement ALTER COLUMN movementid SET DEFAULT nextval('public.movement_movementid_seq'::regclass);


--
-- Name: movement itemid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement ALTER COLUMN itemid SET DEFAULT nextval('public.movement_itemid_seq'::regclass);


--
-- Name: movement userid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement ALTER COLUMN userid SET DEFAULT nextval('public.movement_userid_seq'::regclass);


--
-- Name: movement locationid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement ALTER COLUMN locationid SET DEFAULT nextval('public.movement_locationid_seq'::regclass);


--
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: rafinoval72
--

COPY public.items (itemid, name, quantity, category, locationid, dateadded) FROM stdin;
4	Pisau	100	 utensil	1	2023-05-29
7	piring	100	piring	1	2023-06-08
1	Sendok	100	utensil	2	2023-05-29
8	Gelas	50	utensil	1	2023-06-09
9	tes	100	utensil	1	2023-06-10
10	meja	5	mebel	4	2023-06-10
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: rafinoval72
--

COPY public.location (locationid, location_name, description, address) FROM stdin;
1	Gudang	lantai 2	jalan margonda
2	Rak	pindah tempat	jalan UI
3	Meja	rumah	jalan margonda
4	meja makan	lantai 2	jalan kota
\.


--
-- Data for Name: movement; Type: TABLE DATA; Schema: public; Owner: rafinoval72
--

COPY public.movement (movementid, itemid, userid, locationid, date, note) FROM stdin;
8	1	3	1	2023-06-08	tes
10	1	3	2	2023-06-09	tes
11	8	3	1	2023-06-09	pindah
12	10	3	4	2023-06-10	pindah2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rafinoval72
--

COPY public.users (userid, name, password, role, email) FROM stdin;
3	rayhan	$2a$10$4TNA6cJ7vkh/OG3F6PuB6OpQrlBGpRo9805H/fbBF6rHGzICBFBS.	admin	rayhan@gmail.com
6	rayhan3	$2a$10$Cui/x7fSx4VQd5Bb0BPVJ.dM34s2thhBD0A7oM0w.GzQ1N4GCgA2q	admin	rayhan3@gmail.com
\.


--
-- Name: items_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.items_itemid_seq', 10, true);


--
-- Name: items_locationid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.items_locationid_seq', 1, false);


--
-- Name: location_locationid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.location_locationid_seq', 4, true);


--
-- Name: movement_itemid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.movement_itemid_seq', 1, false);


--
-- Name: movement_locationid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.movement_locationid_seq', 1, false);


--
-- Name: movement_movementid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.movement_movementid_seq', 12, true);


--
-- Name: movement_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.movement_userid_seq', 1, false);


--
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: rafinoval72
--

SELECT pg_catalog.setval('public.users_userid_seq', 10, true);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (itemid);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (locationid);


--
-- Name: movement movement_pkey; Type: CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_pkey PRIMARY KEY (movementid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- Name: items items_locationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_locationid_fkey FOREIGN KEY (locationid) REFERENCES public.location(locationid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movement movement_itemid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_itemid_fkey FOREIGN KEY (itemid) REFERENCES public.items(itemid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movement movement_locationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_locationid_fkey FOREIGN KEY (locationid) REFERENCES public.location(locationid) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: movement movement_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rafinoval72
--

ALTER TABLE ONLY public.movement
    ADD CONSTRAINT movement_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 11.12
-- Dumped by pg_dump version 11.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = false;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO docker;

--
-- Name: events; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name text NOT NULL,
    state text NOT NULL,
    city text NOT NULL,
    local text NOT NULL,
    "when" timestamp(3) without time zone NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO docker;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO docker;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: presences; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.presences (
    id integer NOT NULL,
    person_name text NOT NULL,
    person_slug text NOT NULL,
    type text NOT NULL,
    table_id integer NOT NULL,
    arrived_at timestamp(3) without time zone,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.presences OWNER TO docker;

--
-- Name: presences_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.presences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presences_id_seq OWNER TO docker;

--
-- Name: presences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.presences_id_seq OWNED BY public.presences.id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.tables (
    id integer NOT NULL,
    number integer NOT NULL,
    capacity integer NOT NULL,
    event_id integer NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.tables OWNER TO docker;

--
-- Name: tables_id_seq; Type: SEQUENCE; Schema: public; Owner: docker
--

CREATE SEQUENCE public.tables_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tables_id_seq OWNER TO docker;

--
-- Name: tables_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: docker
--

ALTER SEQUENCE public.tables_id_seq OWNED BY public.tables.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: docker
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO docker;

--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: presences id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.presences ALTER COLUMN id SET DEFAULT nextval('public.presences_id_seq'::regclass);


--
-- Name: tables id; Type: DEFAULT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tables ALTER COLUMN id SET DEFAULT nextval('public.tables_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
038d59f4-6b53-4e10-8077-218b9bab2e28	b9543125c73a0d7b14f0a2674322a394f28a3becdb9d44eca86e178b4a8bd84e	2022-05-12 03:40:36.732441+00	20220512021456_initial	\N	\N	2022-05-12 03:40:36.685372+00	1
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.events (id, name, state, city, local, "when", created_at, updated_at) FROM stdin;
1	Jatoba	GO	Jataí	Pecuaria	2022-05-12 03:53:15.511	2022-05-12 03:53:15.511	2022-05-12 03:53:15.511
\.


--
-- Data for Name: presences; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.presences (id, person_name, person_slug, type, table_id, arrived_at, created_at, updated_at) FROM stdin;
1	Agrinvest	agrinvest	Convidado	1	\N	2022-05-12 03:59:09.2	2022-05-12 03:59:09.202
3	Hortencia Mello De Lima	hortencia mello de lima	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
4	Amanda Rodrigues Maia	amanda rodrigues maia	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
6	Otávio Lopes	otavio lopes	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
8	Priscila Tombini	priscila tombini	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
11	Izabela - Familia Rafaela	izabela familia rafaela	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
13	Gabriela - Familia Rafaela	gabriela familia rafaela	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
14	Amanda Lima Freitas	amanda lima freitas	Convidado	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
23	Ana Paula	ana paula	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
24	Rodrigo Cavalcante	rodrigo cavalcante	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
28	José Vitor	jose vitor	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
29	Luis Felipe Lazaroto	luis felipe lazaroto	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
33	Esposo Da Alcione	esposo da alcione	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
34	Juliana Flavia Ferreira	juliana flavia ferreira	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
35	Silva Paranaiba	silva paranaiba	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
37	Yasmim Da Silva Meira	yasmim da silva meira	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
39	Juliana Namorada Do Mateus	juliana namorada do mateus	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
40	Gabriela	gabriela	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
41	Luis Felipe Barbosa	luis felipe barbosa	Acompanhante	1	\N	2022-05-12 03:59:09.201	2022-05-12 03:59:09.202
49	José Ricardo De Oliveira	jose ricardo de oliveira	Convidado	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
50	Julia Macarini De Oliveira	julia macarini de oliveira	Convidado	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
51	Vitor Luiz De Oliveira	vitor luiz de oliveira	Convidado	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
52	Osmar Oliveira	osmar oliveira	Convidado	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
53	Magali Macarini De Oliveira	magali macarini de oliveira	Acompanhante	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
54	Felipe Macarini De Oliveira	felipe macarini de oliveira	Acompanhante	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
55	Priscila Pontes Oliveira	priscila pontes oliveira	Acompanhante	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
56	Victoria Pontes Oliveira	victoria pontes oliveira	Acompanhante	2	\N	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
59	Adalberto - Familia Rafaela	adalberto familia rafaela	Convidado	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
60	Jussara undefined - Familia Rafaela	jussara familia rafaela	Convidado	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
61	Marlene undefined - Familia Rafaela	marlene familia rafaela	Convidado	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
62	Franciele undefined - Familia Rafaela	franciele familia rafaela	Convidado	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
63	Vera Lucia Santos Souza	vera lucia santos souza	Convidado	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
64	Marido Franciele	marido franciele	Acompanhante	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
65	Filho Da Franciele	filho da franciele	Acompanhante	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
66	Filho Da Franciele	filho da franciele	Acompanhante	3	\N	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
67	Rafaela Gionco	rafaela gionco	Convidado	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
68	João Miguel Gionco	joao miguel gionco	Convidado	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
69	Lirio Giongo	lirio giongo	Convidado	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
72	Mara Cruzeiro	mara cruzeiro	Convidado	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
75	Nilvani	nilvani	Acompanhante	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
10	João Gabriel - Familia Rafaela	joao gabriel familia rafaela	Convidado	1	2022-05-13 23:28:10.689	2022-05-12 03:59:09.201	2022-05-13 23:28:10.69
30	José Victor	jose victor	Acompanhante	1	2022-05-13 23:33:26.591	2022-05-12 03:59:09.201	2022-05-13 23:33:26.593
74	Leonardo Cintra	leonardo cintra	Acompanhante	4	2022-05-13 23:38:28.002	2022-05-12 03:59:09.264	2022-05-13 23:38:28.004
47	Rafaela	rafaela	Acompanhante	1	2022-05-13 23:39:02.667	2022-05-12 03:59:09.202	2022-05-13 23:39:02.669
12	Maria Gêmea	maria gemea	Convidado	1	2022-05-13 23:39:59.428	2022-05-12 03:59:09.201	2022-05-13 23:39:59.431
2	Amigos João Miguel	amigos joao miguel	Convidado	1	2022-05-13 23:40:00.491	2022-05-12 03:59:09.2	2022-05-13 23:40:00.493
15	Davi Pamplona Durado	davi pamplona durado	Convidado	1	2022-05-13 23:40:11.162	2022-05-12 03:59:09.201	2022-05-13 23:40:11.164
26	Lucas Barros Sales	lucas barros sales	Acompanhante	1	2022-05-13 23:40:22.729	2022-05-12 03:59:09.201	2022-05-13 23:40:22.731
36	Thomaz Da Silva Meira	thomaz da silva meira	Acompanhante	1	2022-05-13 23:40:23.938	2022-05-12 03:59:09.201	2022-05-13 23:40:23.94
25	João Vitor	joao vitor	Acompanhante	1	2022-05-13 23:40:39.587	2022-05-12 03:59:09.201	2022-05-13 23:40:39.588
42	Joaquim Gabriel	joaquim gabriel	Acompanhante	1	2022-05-13 23:40:49.587	2022-05-12 03:59:09.201	2022-05-13 23:40:49.589
5	João Arthur Stabille	joao arthur stabille	Convidado	1	2022-05-13 23:47:44.549	2022-05-12 03:59:09.201	2022-05-13 23:47:44.551
7	Lucas Medeiros	lucas medeiros	Convidado	1	2022-05-13 23:47:55.568	2022-05-12 03:59:09.201	2022-05-13 23:47:55.57
17	Eduardo Resende Sousa	eduardo resende sousa	Acompanhante	1	2022-05-13 23:49:09.589	2022-05-12 03:59:09.201	2022-05-13 23:49:09.591
18	Arthur Carrijo Moreira	arthur carrijo moreira	Acompanhante	1	2022-05-13 23:49:19.501	2022-05-12 03:59:09.201	2022-05-13 23:49:19.502
21	Licton Graebin	licton graebin	Acompanhante	1	2022-05-13 23:49:27.7	2022-05-12 03:59:09.201	2022-05-13 23:49:27.702
22	Samuel Martins	samuel martins	Acompanhante	1	2022-05-13 23:49:34.911	2022-05-12 03:59:09.201	2022-05-13 23:49:34.913
38	Matheus Garcia	matheus garcia	Acompanhante	1	2022-05-13 23:49:55.659	2022-05-12 03:59:09.201	2022-05-13 23:49:55.661
44	Júlia Carvalho	julia carvalho	Acompanhante	1	2022-05-13 23:50:09.293	2022-05-12 03:59:09.201	2022-05-13 23:50:09.295
76	Lazara Campos Moraes	lazara campos moraes	Acompanhante	4	2022-05-13 23:51:08.563	2022-05-12 03:59:09.264	2022-05-13 23:51:08.564
70	Otacilio Cintra Freitas	otacilio cintra freitas	Convidado	4	2022-05-13 23:51:31.831	2022-05-12 03:59:09.264	2022-05-13 23:51:31.833
58	Samuel Bento	samuel bento	Acompanhante	2	2022-05-13 23:52:43.999	2022-05-12 03:59:09.248	2022-05-13 23:52:44.002
57	Isabela Pontes Oliveira	isabela pontes oliveira	Acompanhante	2	2022-05-13 23:52:49.855	2022-05-12 03:59:09.248	2022-05-13 23:52:49.857
73	Sebastiana Cintra Cruzeiro	sebastiana cintra cruzeiro	Convidado	4	2022-05-13 23:55:48.209	2022-05-12 03:59:09.264	2022-05-13 23:55:48.212
71	Sergio Freitas	sergio freitas	Convidado	4	2022-05-14 00:00:29.507	2022-05-12 03:59:09.264	2022-05-14 00:00:29.509
45	Valentina Garcia	valentina garcia	Acompanhante	1	2022-05-14 00:06:52.371	2022-05-12 03:59:09.202	2022-05-14 00:06:52.372
46	João Marcelo	joao marcelo	Acompanhante	1	2022-05-14 00:07:01.494	2022-05-12 03:59:09.202	2022-05-14 00:07:01.495
16	Marcia Vieira Costa De Oliveira	marcia vieira costa de oliveira	Convidado	1	2022-05-14 01:20:46.053	2022-05-12 03:59:09.201	2022-05-14 01:20:46.055
48	Adriane Rodrigues De Oliveira	adriane rodrigues de oliveira	Acompanhante	1	2022-05-14 01:20:56.807	2022-05-12 03:59:09.202	2022-05-14 01:20:56.809
20	Gabriela undefined Sandano	gabriela sandano	Acompanhante	1	2022-05-14 02:41:18.145	2022-05-12 03:59:09.201	2022-05-14 02:41:18.147
19	Keile Bueno De Queiroz	keile bueno de queiroz	Acompanhante	1	2022-05-14 02:41:32.705	2022-05-12 03:59:09.201	2022-05-14 02:41:32.707
77	Flávia Amiga Da Mara Cruzeiro	flavia amiga da mara cruzeiro	Acompanhante	4	\N	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
78	Verselyn Dos Santos Souza	verselyn dos santos souza	Convidado	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
79	Baldoino Alves De Freitas	baldoino alves de freitas	Convidado	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
80	Izabel 981810345	izabel 981810345	Convidado	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
81	Izabel 981810346	izabel 981810346	Convidado	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
82	Maria Cristina undefined Ex Cunhada	maria cristina ex cunhada	Convidado	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
83	Maria Angelica Dos Santos Blasi	maria angelica dos santos blasi	Acompanhante	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
84	Leandra Assis Lima	leandra assis lima	Acompanhante	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
85	Marido Izabel	marido izabel	Acompanhante	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
86	Filho Izabel	filho izabel	Acompanhante	5	\N	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
87	Graciele - Familia Rafaela	graciele familia rafaela	Convidado	6	\N	2022-05-12 03:59:09.28	2022-05-12 03:59:09.281
89	Marcelo Giongo	marcelo giongo	Convidado	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
90	Patrique undefined - Familia Rafaela	patrique familia rafaela	Convidado	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
93	Esposo Da Graciele	esposo da graciele	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
94	Cassia Rezende Prado Giongo	cassia rezende prado giongo	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
95	Esposa Do Patrique	esposa do patrique	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
96	Amigos Patrique	amigos patrique	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
97	Amigos Patrique	amigos patrique	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
98	Carolina Costa Nacruth Giongo	carolina costa nacruth giongo	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
99	Marina Das Costa Maciel	marina das costa maciel	Acompanhante	6	\N	2022-05-12 03:59:09.281	2022-05-12 03:59:09.281
106	Caio Vinicius Maia Cotian	caio vinicius maia cotian	Acompanhante	7	\N	2022-05-12 03:59:09.288	2022-05-12 03:59:09.288
107	Layanne Cintra Soares	layanne cintra soares	Acompanhante	7	\N	2022-05-12 03:59:09.288	2022-05-12 03:59:09.288
122	Moacir Henrique	moacir henrique	Convidado	9	\N	2022-05-12 03:59:09.31	2022-05-12 03:59:09.311
129	Bruno Ortiz Scanavini	bruno ortiz scanavini	Convidado	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
131	Consuelo Barbosa Tramujas	consuelo barbosa tramujas	Convidado	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
133	Eduardo Martins De Paiva	eduardo martins de paiva	Convidado	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
135	Monia Michele Hortense	monia michele hortense	Acompanhante	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
137	Matheus Henrique Godim Silva	matheus henrique godim silva	Acompanhante	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
139	Laura Margarida Sa Barros De Paiva	laura margarida sa barros de paiva	Acompanhante	10	\N	2022-05-12 03:59:09.321	2022-05-12 03:59:09.321
145	Divino Omar Correa	divino omar correa	Convidado	11	\N	2022-05-12 03:59:09.33	2022-05-12 03:59:09.331
101	Reila De Oliveira Maia Cotian	reila de oliveira maia cotian	Acompanhante	7	2022-05-13 23:23:48.611	2022-05-12 03:59:09.288	2022-05-13 23:23:48.613
102	Gilberto Santo Cotian	gilberto santo cotian	Acompanhante	7	2022-05-13 23:23:53.241	2022-05-12 03:59:09.288	2022-05-13 23:23:53.242
103	Julia Izabel Maia Cotian	julia izabel maia cotian	Acompanhante	7	2022-05-13 23:23:57.241	2022-05-12 03:59:09.288	2022-05-13 23:23:57.245
141	Sophia Correa De Queiroz	sophia correa de queiroz	Convidado	11	2022-05-13 23:28:14.582	2022-05-12 03:59:09.33	2022-05-13 23:28:14.583
109	Giuliano Carlos Fernandes Da Silva	giuliano carlos fernandes da silva	Convidado	8	2022-05-13 23:31:32.308	2022-05-12 03:59:09.299	2022-05-13 23:31:32.31
116	Maria Rita Micheli De Araujo Fernandes	maria rita micheli de araujo fernandes	Acompanhante	8	2022-05-13 23:31:39.749	2022-05-12 03:59:09.299	2022-05-13 23:31:39.75
117	Wander Assis De Lima	wander assis de lima	Acompanhante	8	2022-05-13 23:32:54.712	2022-05-12 03:59:09.299	2022-05-13 23:32:54.714
110	Hortencia Mello De Lima	hortencia mello de lima	Convidado	8	2022-05-13 23:33:02.093	2022-05-12 03:59:09.299	2022-05-13 23:33:02.094
118	Maria Vitoria	maria vitoria	Acompanhante	8	2022-05-13 23:33:08.874	2022-05-12 03:59:09.299	2022-05-13 23:33:08.876
119	Luiz Felipe	luiz felipe	Acompanhante	8	2022-05-13 23:33:12.111	2022-05-12 03:59:09.299	2022-05-13 23:33:12.114
144	Batuira Alves Ferreira Filho	batuira alves ferreira filho	Convidado	11	2022-05-13 23:35:07.222	2022-05-12 03:59:09.33	2022-05-13 23:35:07.224
147	Augusto Henrique Alves Correa 14 Anos	augusto henrique alves correa 14 anos	Acompanhante	11	2022-05-13 23:35:18.18	2022-05-12 03:59:09.33	2022-05-13 23:35:18.182
132	David Justino Stadler	david justino stadler	Convidado	10	2022-05-13 23:37:23.392	2022-05-12 03:59:09.321	2022-05-13 23:37:23.394
138	Gisele Vanat Koscianski Stadler	gisele vanat koscianski stadler	Acompanhante	10	2022-05-13 23:37:42.171	2022-05-12 03:59:09.321	2022-05-13 23:37:42.173
112	Tereza Vitalina Assima Santana Vilela,	tereza vitalina assima santana vilela	Acompanhante	8	2022-05-13 23:38:13.362	2022-05-12 03:59:09.299	2022-05-13 23:38:13.364
108	Marcos Vilela	marcos vilela	Convidado	8	2022-05-13 23:38:24.602	2022-05-12 03:59:09.299	2022-05-13 23:38:24.603
113	Marcos Vilela Filho	marcos vilela filho	Acompanhante	8	2022-05-13 23:38:26.239	2022-05-12 03:59:09.299	2022-05-13 23:38:26.241
114	Heloisa Assis Vilela	heloisa assis vilela	Acompanhante	8	2022-05-13 23:38:32.734	2022-05-12 03:59:09.299	2022-05-13 23:38:32.736
115	Isadora Brito Freire	isadora brito freire	Acompanhante	8	2022-05-13 23:38:40.321	2022-05-12 03:59:09.299	2022-05-13 23:38:40.322
111	Maria Gêmea	maria gemea	Convidado	8	2022-05-13 23:40:02.263	2022-05-12 03:59:09.299	2022-05-13 23:40:02.264
142	Yasmim Correa De Queiroz	yasmim correa de queiroz	Convidado	11	2022-05-13 23:42:49.117	2022-05-12 03:59:09.33	2022-05-13 23:42:49.119
100	Layanne Cintra Soares	layanne cintra soares	Convidado	7	2022-05-13 23:44:35.578	2022-05-12 03:59:09.288	2022-05-13 23:44:35.579
91	Diego Giongo	diego giongo	Convidado	6	2022-05-13 23:45:19.616	2022-05-12 03:59:09.281	2022-05-13 23:45:19.618
134	Alexandre Brom Dourado	alexandre brom dourado	Convidado	10	2022-05-13 23:51:59.307	2022-05-12 03:59:09.321	2022-05-13 23:51:59.309
140	João Felipe Serafim Vilela	joao felipe serafim vilela	Acompanhante	10	2022-05-13 23:52:06.589	2022-05-12 03:59:09.321	2022-05-13 23:52:06.591
105	Guilherme Dias Custodio	guilherme dias custodio	Acompanhante	7	2022-05-14 00:07:09.403	2022-05-12 03:59:09.288	2022-05-14 00:07:09.404
104	Laura Hellenna Maia Cotian	laura hellenna maia cotian	Acompanhante	7	2022-05-14 00:07:15.562	2022-05-12 03:59:09.288	2022-05-14 00:07:15.564
123	Francisco Nery De Jesus Neto	francisco nery de jesus neto	Convidado	9	2022-05-14 00:14:26.236	2022-05-12 03:59:09.31	2022-05-14 00:14:26.237
128	Leticia Neves Faria	leticia neves faria	Acompanhante	9	2022-05-14 00:14:32.946	2022-05-12 03:59:09.31	2022-05-14 00:14:32.947
127	Andrecia Alves Nogueira	andrecia alves nogueira	Acompanhante	9	2022-05-14 00:14:59.651	2022-05-12 03:59:09.31	2022-05-14 00:14:59.653
130	Crisley Gomes Jaime	crisley gomes jaime	Convidado	10	2022-05-14 00:16:12.036	2022-05-12 03:59:09.321	2022-05-14 00:16:12.038
136	Naralaine Marques Gonçalves	naralaine marques goncalves	Acompanhante	10	2022-05-14 00:16:26.016	2022-05-12 03:59:09.321	2022-05-14 00:16:26.018
120	Neozildo Lobo Nogueira	neozildo lobo nogueira	Convidado	9	2022-05-14 00:19:01.185	2022-05-12 03:59:09.31	2022-05-14 00:19:01.187
124	Marcia Aparecida Katsuyama Nogueira	marcia aparecida katsuyama nogueira	Acompanhante	9	2022-05-14 00:19:11.27	2022-05-12 03:59:09.31	2022-05-14 00:19:11.272
125	Lyandra Yuri	lyandra yuri	Acompanhante	9	2022-05-14 00:19:14.552	2022-05-12 03:59:09.31	2022-05-14 00:19:14.553
126	Luiza Ayumi	luiza ayumi	Acompanhante	9	2022-05-14 00:19:17.142	2022-05-12 03:59:09.31	2022-05-14 00:19:17.144
149	Isabel Custodio Correa	isabel custodio correa	Acompanhante	11	\N	2022-05-12 03:59:09.33	2022-05-12 03:59:09.331
153	Cristiano Henrique Costa Nunes	cristiano henrique costa nunes	Convidado	12	\N	2022-05-12 03:59:09.339	2022-05-12 03:59:09.339
155	Ricardo Furian	ricardo furian	Convidado	12	\N	2022-05-12 03:59:09.339	2022-05-12 03:59:09.339
156	Thais Albano Da Silva	thais albano da silva	Acompanhante	12	\N	2022-05-12 03:59:09.339	2022-05-12 03:59:09.339
159	João Paulo Brzezinsk Da Cunha	joao paulo brzezinsk da cunha	Convidado	13	\N	2022-05-12 03:59:09.348	2022-05-12 03:59:09.349
160	Luis Cezar Priori	luis cezar priori	Convidado	13	\N	2022-05-12 03:59:09.348	2022-05-12 03:59:09.349
163	Juliana Boaventura Teixeira Cunha	juliana boaventura teixeira cunha	Acompanhante	13	\N	2022-05-12 03:59:09.348	2022-05-12 03:59:09.349
164	Carolina	carolina	Acompanhante	13	\N	2022-05-12 03:59:09.348	2022-05-12 03:59:09.349
166	Luiz Paulo Priori	luiz paulo priori	Convidado	14	\N	2022-05-12 03:59:09.355	2022-05-12 03:59:09.356
173	Janete Priori	janete priori	Acompanhante	14	\N	2022-05-12 03:59:09.355	2022-05-12 03:59:09.356
175	Mario Filho Do Mario Roberto	mario filho do mario roberto	Acompanhante	14	\N	2022-05-12 03:59:09.355	2022-05-12 03:59:09.356
176	Julia Filha Do Mario Roberto	julia filha do mario roberto	Acompanhante	14	\N	2022-05-12 03:59:09.355	2022-05-12 03:59:09.356
182	Esposa Do Anderson Santiago	esposa do anderson santiago	Acompanhante	15	\N	2022-05-12 03:59:09.362	2022-05-12 03:59:09.363
194	Felipe Tombini	felipe tombini	Acompanhante	16	\N	2022-05-12 03:59:09.37	2022-05-12 03:59:09.37
196	Namorado Da Marilena P. Mucelim	namorado da marilena p mucelim	Acompanhante	16	\N	2022-05-12 03:59:09.37	2022-05-12 03:59:09.37
197	Neta Da Marilena P. Mucelim	neta da marilena p mucelim	Acompanhante	16	\N	2022-05-12 03:59:09.37	2022-05-12 03:59:09.37
202	Tatiane Alba Oliveira	tatiane alba oliveira	Acompanhante	17	\N	2022-05-12 03:59:09.378	2022-05-12 03:59:09.379
203	Neida Christofoli	neida christofoli	Acompanhante	17	\N	2022-05-12 03:59:09.378	2022-05-12 03:59:09.379
204	Cirne Olivo Alba	cirne olivo alba	Acompanhante	17	\N	2022-05-12 03:59:09.378	2022-05-12 03:59:09.379
206	Beatriz Barroso	beatriz barroso	Acompanhante	17	\N	2022-05-12 03:59:09.378	2022-05-12 03:59:09.379
216	Bernardo Borges Freire	bernardo borges freire	Acompanhante	18	\N	2022-05-12 03:59:09.385	2022-05-12 03:59:09.386
218	Amanda Carvalho	amanda carvalho	Acompanhante	18	\N	2022-05-12 03:59:09.385	2022-05-12 03:59:09.386
171	Rosimar Priori	rosimar priori	Acompanhante	14	2022-05-13 23:23:27.679	2022-05-12 03:59:09.355	2022-05-13 23:23:27.681
189	Marilena P. Mucelim	marilena p mucelim	Convidado	16	2022-05-13 23:24:04.863	2022-05-12 03:59:09.37	2022-05-13 23:24:04.864
170	Adriana De Oliveira	adriana de oliveira	Convidado	14	2022-05-13 23:24:32.374	2022-05-12 03:59:09.355	2022-05-13 23:24:32.375
177	João Manoel Carvalho Neto	joao manoel carvalho neto	Acompanhante	14	2022-05-13 23:24:47.257	2022-05-12 03:59:09.355	2022-05-13 23:24:47.259
193	João Gabriel Tombini	joao gabriel tombini	Acompanhante	16	2022-05-13 23:25:09.998	2022-05-12 03:59:09.37	2022-05-13 23:25:10
192	Maria Das Graças Gonçalves	maria das gracas goncalves	Acompanhante	16	2022-05-13 23:30:13.397	2022-05-12 03:59:09.37	2022-05-13 23:30:13.399
190	Daldi Priscila	daldi priscila	Acompanhante	16	2022-05-13 23:30:15.596	2022-05-12 03:59:09.37	2022-05-13 23:30:15.598
186	João Amarildo Tombini	joao amarildo tombini	Convidado	16	2022-05-13 23:30:19.478	2022-05-12 03:59:09.37	2022-05-13 23:30:19.479
191	William Gonçalves De Moraes	william goncalves de moraes	Acompanhante	16	2022-05-13 23:30:24.156	2022-05-12 03:59:09.37	2022-05-13 23:30:24.159
187	Ana Cristina Tombini De Moraes	ana cristina tombini de moraes	Convidado	16	2022-05-13 23:30:28.481	2022-05-12 03:59:09.37	2022-05-13 23:30:28.488
185	Luiz Henrique Martin Godoi	luiz henrique martin godoi	Acompanhante	15	2022-05-13 23:30:31.525	2022-05-12 03:59:09.362	2022-05-13 23:30:31.527
181	Cibele Prado	cibele prado	Convidado	15	2022-05-13 23:31:20.088	2022-05-12 03:59:09.362	2022-05-13 23:31:20.089
434	Lourisvaldo Soares	lourisvaldo soares	Convidado	40	2022-05-13 23:34:01.144	2022-05-12 03:59:09.612	2022-05-13 23:34:01.145
148	Maria Clara De Oliveira	maria clara de oliveira	Acompanhante	11	2022-05-13 23:35:20.22	2022-05-12 03:59:09.33	2022-05-13 23:35:20.222
168	Victor Cezar Priori	victor cezar priori	Convidado	14	2022-05-13 23:37:15.954	2022-05-12 03:59:09.355	2022-05-13 23:37:15.955
199	Aldir José Alba	aldir jose alba	Convidado	17	2022-05-13 23:40:15.784	2022-05-12 03:59:09.378	2022-05-13 23:40:15.786
201	Pedro Alba Oliveira	pedro alba oliveira	Convidado	17	2022-05-13 23:40:28.448	2022-05-12 03:59:09.378	2022-05-13 23:40:28.449
198	Nilton Marcio Oliveira	nilton marcio oliveira	Convidado	17	2022-05-13 23:40:40.515	2022-05-12 03:59:09.378	2022-05-13 23:40:40.517
167	Paulo Ricardo Priori	paulo ricardo priori	Convidado	14	2022-05-13 23:41:46.441	2022-05-12 03:59:09.355	2022-05-13 23:41:46.443
172	Bruna O. Carvalho Priori	bruna o carvalho priori	Acompanhante	14	2022-05-13 23:41:56.315	2022-05-12 03:59:09.355	2022-05-13 23:41:56.317
217	Mateus Borges Almeida	mateus borges almeida	Acompanhante	18	2022-05-13 23:42:19.096	2022-05-12 03:59:09.385	2022-05-13 23:42:19.098
215	Francisco Itamiran Freire	francisco itamiran freire	Acompanhante	18	2022-05-13 23:42:33.988	2022-05-12 03:59:09.385	2022-05-13 23:42:33.989
180	Anderson Santiago	anderson santiago	Convidado	15	2022-05-13 23:43:09.566	2022-05-12 03:59:09.362	2022-05-13 23:43:09.568
208	Cyntia De Carvalho Moraes	cyntia de carvalho moraes	Convidado	18	2022-05-13 23:47:13.494	2022-05-12 03:59:09.385	2022-05-13 23:47:13.495
209	Fernando De Carvalho Souza	fernando de carvalho souza	Convidado	18	2022-05-13 23:47:26.129	2022-05-12 03:59:09.385	2022-05-13 23:47:26.131
214	Amanda Gabriella Matos	amanda gabriella matos	Acompanhante	18	2022-05-13 23:47:42.202	2022-05-12 03:59:09.385	2022-05-13 23:47:42.203
207	Sonirene De Carvalho Moraes	sonirene de carvalho moraes	Convidado	18	2022-05-13 23:49:18.812	2022-05-12 03:59:09.385	2022-05-13 23:49:18.814
195	Ana Claudia Silva Menezes	ana claudia silva menezes	Acompanhante	16	2022-05-13 23:50:58.902	2022-05-12 03:59:09.37	2022-05-13 23:50:58.904
188	Maycon Henrique Tombini	maycon henrique tombini	Convidado	16	2022-05-13 23:51:07.863	2022-05-12 03:59:09.37	2022-05-13 23:51:07.865
150	Yuri Grasnoff	yuri grasnoff	Convidado	12	2022-05-13 23:52:47.44	2022-05-12 03:59:09.339	2022-05-13 23:52:47.441
152	Andre Willian Dos Santos	andre willian dos santos	Convidado	12	2022-05-13 23:53:01.199	2022-05-12 03:59:09.339	2022-05-13 23:53:01.2
151	Rafael Rodrigues De Souza	rafael rodrigues de souza	Convidado	12	2022-05-13 23:53:08.026	2022-05-12 03:59:09.339	2022-05-13 23:53:08.028
183	Andre Delgado	andre delgado	Acompanhante	15	2022-05-13 23:53:55.411	2022-05-12 03:59:09.362	2022-05-13 23:53:55.412
184	Fabricio Mazaia	fabricio mazaia	Acompanhante	15	2022-05-13 23:54:08.81	2022-05-12 03:59:09.362	2022-05-13 23:54:08.812
165	Ana Claudia Gomes Balduino Oliveira	ana claudia gomes balduino oliveira	Acompanhante	13	2022-05-13 23:54:36.847	2022-05-12 03:59:09.348	2022-05-13 23:54:36.848
169	Mario Roberto Maia Silva	mario roberto maia silva	Convidado	14	2022-05-13 23:55:49.154	2022-05-12 03:59:09.355	2022-05-13 23:55:49.155
174	Natalia Esposa Do Mario	natalia esposa do mario	Acompanhante	14	2022-05-13 23:55:57.356	2022-05-12 03:59:09.355	2022-05-13 23:55:57.357
179	Joannes Teixeira	joannes teixeira	Convidado	15	2022-05-13 23:56:13.18	2022-05-12 03:59:09.362	2022-05-13 23:56:13.182
178	Palmira Marcon	palmira marcon	Convidado	15	2022-05-13 23:56:21.697	2022-05-12 03:59:09.362	2022-05-13 23:56:21.699
154	Luciano Jorge Silva	luciano jorge silva	Convidado	12	2022-05-14 00:03:45.633	2022-05-12 03:59:09.339	2022-05-14 00:03:45.64
157	Juliana Santos Vilela	juliana santos vilela	Acompanhante	12	2022-05-14 00:03:58.16	2022-05-12 03:59:09.339	2022-05-14 00:03:58.161
158	Cássio Vinicius Dos Santos	cassio vinicius dos santos	Convidado	13	2022-05-14 00:09:18.391	2022-05-12 03:59:09.348	2022-05-14 00:09:18.392
205	Eduardo Cardoso De Lima	eduardo cardoso de lima	Acompanhante	17	2022-05-14 00:39:36.819	2022-05-12 03:59:09.378	2022-05-14 00:39:36.82
200	Camila Alba Oliveira	camila alba oliveira	Convidado	17	2022-05-14 00:39:44.265	2022-05-12 03:59:09.378	2022-05-14 00:39:44.266
219	Flavio Carvalho Sousa	flavio carvalho sousa	Acompanhante	18	\N	2022-05-12 03:59:09.385	2022-05-12 03:59:09.386
220	Fabio Carvalho Sousa	fabio carvalho sousa	Acompanhante	18	\N	2022-05-12 03:59:09.385	2022-05-12 03:59:09.386
221	Ygor Carvalhor	ygor carvalhor	Acompanhante	18	\N	2022-05-12 03:59:09.385	2022-05-12 03:59:09.386
226	Eliseo Cassol	eliseo cassol	Acompanhante	19	\N	2022-05-12 03:59:09.402	2022-05-12 03:59:09.403
236	Onaldo Antonio Gomes	onaldo antonio gomes	Convidado	20	\N	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
237	Licio Rodrigues Gomes	licio rodrigues gomes	Convidado	20	\N	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
240	Ana Paula Macedo De Freitas	ana paula macedo de freitas	Acompanhante	20	\N	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
241	Onaldo Antonio Gomes Filho	onaldo antonio gomes filho	Acompanhante	20	\N	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
242	Paloma Moreira Lima Gomes	paloma moreira lima gomes	Acompanhante	20	\N	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
246	Antonio De Padua	antonio de padua	Convidado	21	\N	2022-05-12 03:59:09.419	2022-05-12 03:59:09.42
248	Bethania Lima Peres Cardoso	bethania lima peres cardoso	Acompanhante	21	\N	2022-05-12 03:59:09.419	2022-05-12 03:59:09.42
249	Lucelia Pereira Campos	lucelia pereira campos	Acompanhante	21	\N	2022-05-12 03:59:09.419	2022-05-12 03:59:09.42
251	Nayana Carvalho Soares	nayana carvalho soares	Acompanhante	21	\N	2022-05-12 03:59:09.419	2022-05-12 03:59:09.42
256	Denis De Barros Gemelli	denis de barros gemelli	Convidado	22	\N	2022-05-12 03:59:09.426	2022-05-12 03:59:09.427
257	Gustavo Salomão	gustavo salomao	Convidado	22	\N	2022-05-12 03:59:09.426	2022-05-12 03:59:09.427
258	Sergio Pardono	sergio pardono	Convidado	22	\N	2022-05-12 03:59:09.427	2022-05-12 03:59:09.427
259	Jackelini Flamia	jackelini flamia	Convidado	22	\N	2022-05-12 03:59:09.427	2022-05-12 03:59:09.427
264	Fabio Alves Fontes	fabio alves fontes	Convidado	23	\N	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
269	Luciano Pandolfo	luciano pandolfo	Convidado	23	\N	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
270	Valter Giacomini	valter giacomini	Convidado	23	\N	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
271	Vanessa - Esposa Aurelio	vanessa esposa aurelio	Acompanhante	23	\N	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
273	Yufanguinia De Oliveria	yufanguinia de oliveria	Acompanhante	23	\N	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
282	Rogério De Oliveira	rogerio de oliveira	Convidado	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
283	Bianca Terpins Garcia	bianca terpins garcia	Convidado	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
284	Raquel Menezes Garcia Moura	raquel menezes garcia moura	Convidado	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
285	Alcione Thomaz Assis	alcione thomaz assis	Convidado	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
289	Elisa Carvalho Franco Oliveira	elisa carvalho franco oliveira	Acompanhante	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
277	Juliano Cortes	juliano cortes	Convidado	24	2022-05-13 23:27:05.442	2022-05-12 03:59:09.447	2022-05-13 23:27:05.444
280	Paula Cortes	paula cortes	Acompanhante	24	2022-05-13 23:27:12.823	2022-05-12 03:59:09.447	2022-05-13 23:27:12.825
267	Luiz Eduardo Serra De Freitas Martins	luiz eduardo serra de freitas martins	Convidado	23	2022-05-13 23:28:10.106	2022-05-12 03:59:09.438	2022-05-13 23:28:10.107
234	Geraldo Mendes	geraldo mendes	Convidado	20	2022-05-13 23:30:29.921	2022-05-12 03:59:09.411	2022-05-13 23:30:29.922
238	Rosana Mendes	rosana mendes	Acompanhante	20	2022-05-13 23:30:39.153	2022-05-12 03:59:09.411	2022-05-13 23:30:39.156
235	Felipe Mendes	felipe mendes	Convidado	20	2022-05-13 23:30:46.596	2022-05-12 03:59:09.411	2022-05-13 23:30:46.598
239	Felipe Mendes	felipe mendes	Acompanhante	20	2022-05-13 23:30:49.152	2022-05-12 03:59:09.411	2022-05-13 23:30:49.153
224	Lazaro Ubiratã Carvalho Lima	lazaro ubirata carvalho lima	Convidado	19	2022-05-13 23:33:27.732	2022-05-12 03:59:09.402	2022-05-13 23:33:27.733
435	Michelle Pagung	michelle pagung	Convidado	40	2022-05-13 23:33:27.878	2022-05-12 03:59:09.612	2022-05-13 23:33:27.881
229	Marilia Lima	marilia lima	Acompanhante	19	2022-05-13 23:33:44.893	2022-05-12 03:59:09.402	2022-05-13 23:33:44.895
228	Rui Neto	rui neto	Acompanhante	19	2022-05-13 23:33:50.954	2022-05-12 03:59:09.402	2022-05-13 23:33:50.955
225	Givanildo Gehrke	givanildo gehrke	Convidado	19	2022-05-13 23:34:10.892	2022-05-12 03:59:09.402	2022-05-13 23:34:10.894
231	Katia R. Thiesen Gehrke	katia r thiesen gehrke	Acompanhante	19	2022-05-13 23:34:19.839	2022-05-12 03:59:09.402	2022-05-13 23:34:19.842
232	Giovane Gehrke	giovane gehrke	Acompanhante	19	2022-05-13 23:34:24.335	2022-05-12 03:59:09.402	2022-05-13 23:34:24.337
233	Maria Eduarda Freitas Silva	maria eduarda freitas silva	Acompanhante	19	2022-05-13 23:34:28.854	2022-05-12 03:59:09.402	2022-05-13 23:34:28.855
250	Ana Emília Batista De Queiroz	ana emilia batista de queiroz	Acompanhante	21	2022-05-13 23:35:42.49	2022-05-12 03:59:09.419	2022-05-13 23:35:42.492
286	Priscilla Carvalho Franco Oliveira	priscilla carvalho franco oliveira	Acompanhante	25	2022-05-13 23:35:52.128	2022-05-12 03:59:09.458	2022-05-13 23:35:52.13
276	Kamila Vitoria Neve Todescato	kamila vitoria neve todescato	Convidado	24	2022-05-13 23:38:09.549	2022-05-12 03:59:09.447	2022-05-13 23:38:09.551
275	Catia Luciane Jorge	catia luciane jorge	Convidado	24	2022-05-13 23:38:18.204	2022-05-12 03:59:09.447	2022-05-13 23:38:18.205
274	Guilherme Ferreira Da Silva	guilherme ferreira da silva	Convidado	24	2022-05-13 23:38:20.003	2022-05-12 03:59:09.447	2022-05-13 23:38:20.005
265	Arildo Cecilio Setti Jr	arildo cecilio setti jr	Convidado	23	2022-05-13 23:38:55.336	2022-05-12 03:59:09.438	2022-05-13 23:38:55.338
263	Aurelio Kareno Dna	aurelio kareno dna	Convidado	23	2022-05-13 23:42:24.806	2022-05-12 03:59:09.438	2022-05-13 23:42:24.808
252	Marcia Padua Carvalho	marcia padua carvalho	Acompanhante	21	2022-05-13 23:43:16.651	2022-05-12 03:59:09.419	2022-05-13 23:43:16.652
253	Sophia Vilela Carvalho	sophia vilela carvalho	Acompanhante	21	2022-05-13 23:43:21.381	2022-05-12 03:59:09.419	2022-05-13 23:43:21.383
254	Rafaella Pereira Martns De Oliveira	rafaella pereira martns de oliveira	Acompanhante	21	2022-05-13 23:43:31.659	2022-05-12 03:59:09.419	2022-05-13 23:43:31.66
222	Delceni Gomes De Lima	delceni gomes de lima	Convidado	19	2022-05-13 23:43:47.857	2022-05-12 03:59:09.402	2022-05-13 23:43:47.859
272	Paula Machado	paula machado	Acompanhante	23	2022-05-13 23:44:15.209	2022-05-12 03:59:09.438	2022-05-13 23:44:15.21
266	Gabriel Machado	gabriel machado	Convidado	23	2022-05-13 23:44:31.592	2022-05-12 03:59:09.438	2022-05-13 23:44:31.594
243	Renato Cardoso	renato cardoso	Convidado	21	2022-05-13 23:44:56.067	2022-05-12 03:59:09.419	2022-05-13 23:44:56.068
247	Wania Carvalho Cardoso	wania carvalho cardoso	Acompanhante	21	2022-05-13 23:45:07.939	2022-05-12 03:59:09.419	2022-05-13 23:45:07.941
255	Josiel Da Cruz	josiel da cruz	Convidado	22	2022-05-13 23:56:56.939	2022-05-12 03:59:09.426	2022-05-13 23:56:56.941
262	Yasmin Da Cruz	yasmin da cruz	Acompanhante	22	2022-05-13 23:57:27.705	2022-05-12 03:59:09.427	2022-05-13 23:57:27.707
260	Kayth Ramos Da Cruz	kayth ramos da cruz	Acompanhante	22	2022-05-13 23:57:32.263	2022-05-12 03:59:09.427	2022-05-13 23:57:32.265
261	Lucas Henrique Da Cruz	lucas henrique da cruz	Acompanhante	22	2022-05-13 23:57:35.968	2022-05-12 03:59:09.427	2022-05-13 23:57:35.97
223	Antonio Marcos Carvalho Rezende	antonio marcos carvalho rezende	Convidado	19	2022-05-14 00:03:24.913	2022-05-12 03:59:09.402	2022-05-14 00:03:24.916
227	Cynara Costa Carvalho	cynara costa carvalho	Acompanhante	19	2022-05-14 00:03:46.671	2022-05-12 03:59:09.402	2022-05-14 00:03:46.672
278	Gilberto Ferreira Monteiro Junior	gilberto ferreira monteiro junior	Convidado	24	2022-05-14 00:08:04.032	2022-05-12 03:59:09.447	2022-05-14 00:08:04.033
279	Ueber Ferreira Pamplona	ueber ferreira pamplona	Convidado	24	2022-05-14 00:09:40.406	2022-05-12 03:59:09.447	2022-05-14 00:09:40.407
281	Tamara Da Luz Leighton	tamara da luz leighton	Acompanhante	24	2022-05-14 00:09:45.724	2022-05-12 03:59:09.447	2022-05-14 00:09:45.733
288	Júlia Almeida Diamantino	julia almeida diamantino	Acompanhante	25	2022-05-14 01:10:42.927	2022-05-12 03:59:09.458	2022-05-14 01:10:42.928
291	Leandro Antonio Tondin Garcia	leandro antonio tondin garcia	Acompanhante	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
295	Antonia Lacerda Thomaz	antonia lacerda thomaz	Acompanhante	25	\N	2022-05-12 03:59:09.458	2022-05-12 03:59:09.459
297	Roberto Assis Peres	roberto assis peres	Convidado	26	\N	2022-05-12 03:59:09.468	2022-05-12 03:59:09.469
300	João Vitor Peres Correa	joao vitor peres correa	Acompanhante	26	\N	2022-05-12 03:59:09.468	2022-05-12 03:59:09.469
301	Ana Livia Peres Correa	ana livia peres correa	Acompanhante	26	\N	2022-05-12 03:59:09.468	2022-05-12 03:59:09.469
302	Ana Caroline Caixeta Nunes	ana caroline caixeta nunes	Acompanhante	26	\N	2022-05-12 03:59:09.468	2022-05-12 03:59:09.469
304	Savio Bergmann	savio bergmann	Convidado	27	\N	2022-05-12 03:59:09.483	2022-05-12 03:59:09.484
306	Ludmilla Prado Menezes	ludmilla prado menezes	Convidado	27	\N	2022-05-12 03:59:09.483	2022-05-12 03:59:09.484
310	Vanesa Ribeiro Guerra	vanesa ribeiro guerra	Acompanhante	27	\N	2022-05-12 03:59:09.484	2022-05-12 03:59:09.484
312	Rony Assis Carvalho	rony assis carvalho	Acompanhante	27	\N	2022-05-12 03:59:09.484	2022-05-12 03:59:09.484
315	Maria Vilela 3 Anos (colo)	maria vilela 3 anos colo	Acompanhante	27	\N	2022-05-12 03:59:09.484	2022-05-12 03:59:09.484
336	Ronaldo Peres	ronaldo peres	Convidado	30	\N	2022-05-12 03:59:09.508	2022-05-12 03:59:09.508
344	Aloisio Assis Marquez Costa	aloisio assis marquez costa	Convidado	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
347	Paula Tavares Fernandes	paula tavares fernandes	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
348	Gabriela Tavares De Lucca	gabriela tavares de lucca	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
349	Mateus Martins	mateus martins	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
350	Sonia Tavares Fernandes	sonia tavares fernandes	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
351	Jeanny Lima Futado	jeanny lima futado	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
352	Lucas Tavares De Luca	lucas tavares de luca	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
353	Inelbi Tomboni	inelbi tomboni	Acompanhante	31	\N	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
357	Paulo Batista (fre)i	paulo batista frei	Convidado	32	\N	2022-05-12 03:59:09.536	2022-05-12 03:59:09.536
361	Frei Ezequiel	frei ezequiel	Acompanhante	32	\N	2022-05-12 03:59:09.536	2022-05-12 03:59:09.536
320	Alfeu Ferreira Do Amaral	alfeu ferreira do amaral	Convidado	28	2022-05-13 23:24:59.492	2022-05-12 03:59:09.492	2022-05-13 23:24:59.493
326	Mariza Lucia Tombini	mariza lucia tombini	Acompanhante	28	2022-05-13 23:25:20.099	2022-05-12 03:59:09.492	2022-05-13 23:25:20.102
299	Ana Clara Peres Correa	ana clara peres correa	Acompanhante	26	2022-05-13 23:26:01.43	2022-05-12 03:59:09.468	2022-05-13 23:26:01.432
323	Luana Loose Pereira	luana loose pereira	Acompanhante	28	2022-05-13 23:26:11.047	2022-05-12 03:59:09.492	2022-05-13 23:26:11.049
345	Lia Helena Katzer	lia helena katzer	Convidado	31	2022-05-13 23:26:12.918	2022-05-12 03:59:09.518	2022-05-13 23:26:12.925
307	Patrick Matias De Lima	patrick matias de lima	Convidado	27	2022-05-13 23:26:14.725	2022-05-12 03:59:09.483	2022-05-13 23:26:14.727
313	Rita De Cassia Vilela	rita de cassia vilela	Acompanhante	27	2022-05-13 23:26:32.764	2022-05-12 03:59:09.484	2022-05-13 23:26:32.766
338	Brunna Campos	brunna campos	Convidado	30	2022-05-13 23:26:35.115	2022-05-12 03:59:09.508	2022-05-13 23:26:35.121
343	Lucas Almeida	lucas almeida	Acompanhante	30	2022-05-13 23:26:45.199	2022-05-12 03:59:09.508	2022-05-13 23:26:45.201
346	Inelbi Tomboni	inelbi tomboni	Convidado	31	2022-05-13 23:26:51.101	2022-05-12 03:59:09.518	2022-05-13 23:26:51.103
298	Bruna Peres Correa	bruna peres correa	Acompanhante	26	2022-05-13 23:28:40.453	2022-05-12 03:59:09.468	2022-05-13 23:28:40.454
327	Nadir Lourdes De Morais	nadir lourdes de morais	Acompanhante	28	2022-05-13 23:30:27.173	2022-05-12 03:59:09.492	2022-05-13 23:30:27.174
296	Rogerio Omar Correa	rogerio omar correa	Convidado	26	2022-05-13 23:35:06.423	2022-05-12 03:59:09.468	2022-05-13 23:35:06.425
303	Jane Silva Pamplona Dourado	jane silva pamplona dourado	Convidado	27	2022-05-13 23:38:59.982	2022-05-12 03:59:09.483	2022-05-13 23:38:59.984
309	Walter Dourado Oliveira Junior	walter dourado oliveira junior	Acompanhante	27	2022-05-13 23:39:11.813	2022-05-12 03:59:09.484	2022-05-13 23:39:11.815
340	Juares Martins Teixeira	juares martins teixeira	Acompanhante	30	2022-05-13 23:40:06.133	2022-05-12 03:59:09.508	2022-05-13 23:40:06.134
335	Gisele Rezende Prado	gisele rezende prado	Convidado	30	2022-05-13 23:40:13.917	2022-05-12 03:59:09.508	2022-05-13 23:40:13.919
339	Isabela Rezende Alfaix	isabela rezende alfaix	Acompanhante	30	2022-05-13 23:40:18.697	2022-05-12 03:59:09.508	2022-05-13 23:40:18.698
293	Paulo Rogerio Carvalho De Assis	paulo rogerio carvalho de assis	Acompanhante	25	2022-05-13 23:48:57.094	2022-05-12 03:59:09.458	2022-05-13 23:48:57.096
305	Edivan Lemos Ferreira	edivan lemos ferreira	Convidado	27	2022-05-13 23:53:26.702	2022-05-12 03:59:09.483	2022-05-13 23:53:26.704
311	Cristiane Laura O Lemes	cristiane laura o lemes	Acompanhante	27	2022-05-13 23:53:36.081	2022-05-12 03:59:09.484	2022-05-13 23:53:36.083
354	Cibele Prado	cibele prado	Convidado	32	2022-05-13 23:53:47.245	2022-05-12 03:59:09.536	2022-05-13 23:53:47.247
358	Pedro Nascimento	pedro nascimento	Acompanhante	32	2022-05-13 23:54:16.566	2022-05-12 03:59:09.536	2022-05-13 23:54:16.568
356	Erick Cesar Victorino Da Silva	erick cesar victorino da silva	Convidado	32	2022-05-13 23:55:10.556	2022-05-12 03:59:09.536	2022-05-13 23:55:10.558
355	Christian Wille Mayer	christian wille mayer	Convidado	32	2022-05-13 23:55:30.26	2022-05-12 03:59:09.536	2022-05-13 23:55:30.261
359	Cezar Senna	cezar senna	Acompanhante	32	2022-05-13 23:55:57.193	2022-05-12 03:59:09.536	2022-05-13 23:55:57.195
360	Adriano Lima	adriano lima	Acompanhante	32	2022-05-13 23:58:04.357	2022-05-12 03:59:09.536	2022-05-13 23:58:04.358
318	Emiliana Goreti Tombini Dos Santos	emiliana goreti tombini dos santos	Convidado	28	2022-05-13 23:58:08.003	2022-05-12 03:59:09.492	2022-05-13 23:58:08.005
324	João Pedro Santos Silva	joao pedro santos silva	Acompanhante	28	2022-05-13 23:58:15.484	2022-05-12 03:59:09.492	2022-05-13 23:58:15.486
319	Tacielle Tombini Dos Santos	tacielle tombini dos santos	Convidado	28	2022-05-13 23:58:22.772	2022-05-12 03:59:09.492	2022-05-13 23:58:22.774
341	Karla Campos De Menezes Carvalho	karla campos de menezes carvalho	Acompanhante	30	2022-05-13 23:59:20.143	2022-05-12 03:59:09.508	2022-05-13 23:59:20.145
337	Ricardo Pereira Dantas	ricardo pereira dantas	Convidado	30	2022-05-13 23:59:54.748	2022-05-12 03:59:09.508	2022-05-13 23:59:54.749
342	Nayanna Campos Menezes	nayanna campos menezes	Acompanhante	30	2022-05-14 00:01:14.459	2022-05-12 03:59:09.508	2022-05-14 00:01:14.461
333	Daniela Carvalho Da Silva Niedermeier	daniela carvalho da silva niedermeier	Acompanhante	29	2022-05-14 00:03:38.301	2022-05-12 03:59:09.5	2022-05-14 00:03:38.302
332	Jardel Adonis Niedermeier	jardel adonis niedermeier	Acompanhante	29	2022-05-14 00:03:47.583	2022-05-12 03:59:09.5	2022-05-14 00:03:47.585
334	Matheus Carvalho Niedermeier	matheus carvalho niedermeier	Acompanhante	29	2022-05-14 00:03:53.819	2022-05-12 03:59:09.5	2022-05-14 00:03:53.822
308	Luciana Pereira Da Silva Vilela	luciana pereira da silva vilela	Convidado	27	2022-05-14 00:04:15.031	2022-05-12 03:59:09.483	2022-05-14 00:04:15.033
314	Tiago Vilela Vasconcelos	tiago vilela vasconcelos	Acompanhante	27	2022-05-14 00:04:23.48	2022-05-12 03:59:09.484	2022-05-14 00:04:23.481
316	Victor Nunes De Andrade Tsutsume	victor nunes de andrade tsutsume	Convidado	28	2022-05-14 00:11:49.835	2022-05-12 03:59:09.492	2022-05-14 00:11:49.836
329	Noemia Presser Niedermeier	noemia presser niedermeier	Acompanhante	29	2022-05-14 00:24:04.12	2022-05-12 03:59:09.5	2022-05-14 00:24:04.122
328	Valdir Antonio Niedermeier	valdir antonio niedermeier	Convidado	29	2022-05-14 00:24:12.193	2022-05-12 03:59:09.5	2022-05-14 00:24:12.195
330	Jankiel Rodrigo Niedermeier	jankiel rodrigo niedermeier	Acompanhante	29	2022-05-14 00:31:50.079	2022-05-12 03:59:09.5	2022-05-14 00:31:50.081
331	Bruna Ester Sousa Niedermeier	bruna ester sousa niedermeier	Acompanhante	29	2022-05-14 00:31:53.009	2022-05-12 03:59:09.5	2022-05-14 00:31:53.01
363	Vinicius Teododo Michels	vinicius teododo michels	Convidado	33	\N	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
364	Jose Matias Michels	jose matias michels	Convidado	33	\N	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
365	Maria Eugenia Michels	maria eugenia michels	Convidado	33	\N	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
366	Wlademir Antonio Piacentini	wlademir antonio piacentini	Convidado	33	\N	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
369	Vivien Carafini Michels	vivien carafini michels	Acompanhante	33	\N	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
370	Eurides Michels	eurides michels	Acompanhante	33	\N	2022-05-12 03:59:09.548	2022-05-12 03:59:09.548
371	Denizia Maria Araujo Loredo	denizia maria araujo loredo	Acompanhante	33	\N	2022-05-12 03:59:09.548	2022-05-12 03:59:09.548
373	Rogeria Furquim Vasconcellos	rogeria furquim vasconcellos	Convidado	34	\N	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
375	Maria Aparecida Alves	maria aparecida alves	Convidado	34	\N	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
378	Maria Eduarda Furquim Garcia	maria eduarda furquim garcia	Acompanhante	34	\N	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
379	Sebastiana Furquim	sebastiana furquim	Acompanhante	34	\N	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
381	Junior Esposo Da Maria Aparecida	junior esposo da maria aparecida	Acompanhante	34	\N	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
382	Monica Cristina Silva Assis	monica cristina silva assis	Convidado	35	\N	2022-05-12 03:59:09.567	2022-05-12 03:59:09.568
384	Fernanda Cristina Silva Assis Ragagnin	fernanda cristina silva assis ragagnin	Convidado	35	\N	2022-05-12 03:59:09.567	2022-05-12 03:59:09.568
389	Diemerson Ragagnin	diemerson ragagnin	Acompanhante	35	\N	2022-05-12 03:59:09.567	2022-05-12 03:59:09.568
393	Diego Caraffini	diego caraffini	Convidado	36	\N	2022-05-12 03:59:09.58	2022-05-12 03:59:09.58
398	Samia Caraffini	samia caraffini	Acompanhante	36	\N	2022-05-12 03:59:09.58	2022-05-12 03:59:09.581
403	Luis Carlos Moraes	luis carlos moraes	Convidado	37	\N	2022-05-12 03:59:09.59	2022-05-12 03:59:09.591
407	Maria Dos Anjos	maria dos anjos	Acompanhante	37	\N	2022-05-12 03:59:09.59	2022-05-12 03:59:09.591
411	Luciana Carvalho Garcia	luciana carvalho garcia	Acompanhante	37	\N	2022-05-12 03:59:09.59	2022-05-12 03:59:09.591
412	Alcantara De Carvalho Neto	alcantara de carvalho neto	Acompanhante	37	\N	2022-05-12 03:59:09.59	2022-05-12 03:59:09.591
413	Nelvo Fries	nelvo fries	Convidado	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
415	Diogo Fries	diogo fries	Convidado	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
416	Rosana Fries	rosana fries	Acompanhante	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
420	Claudia Rezende Martins Fries	claudia rezende martins fries	Acompanhante	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
421	Ana Luiza Cardoso Alves Dos Santos	ana luiza cardoso alves dos santos	Acompanhante	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
422	Yasmin Cardoso Alves Dos Santos	yasmin cardoso alves dos santos	Acompanhante	38	\N	2022-05-12 03:59:09.598	2022-05-12 03:59:09.599
423	Vital Passinato	vital passinato	Convidado	39	\N	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
425	Setimo Passinato	setimo passinato	Convidado	39	\N	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
427	Esposa Vital Passinato	esposa vital passinato	Acompanhante	39	\N	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
429	Francielle Passinato	francielle passinato	Acompanhante	39	\N	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
430	Nara Rubia Castro Freitas Passinato	nara rubia castro freitas passinato	Acompanhante	39	\N	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
433	Renata Vilela	renata vilela	Convidado	40	\N	2022-05-12 03:59:09.612	2022-05-12 03:59:09.612
388	Francyanne Carvalho Martins	francyanne carvalho martins	Acompanhante	35	2022-05-13 23:26:02.709	2022-05-12 03:59:09.567	2022-05-13 23:26:02.711
383	Lazara Regina De Carvalho	lazara regina de carvalho	Convidado	35	2022-05-13 23:26:13.809	2022-05-12 03:59:09.567	2022-05-13 23:26:13.811
380	Osmar Lima De Assis	osmar lima de assis	Acompanhante	34	2022-05-13 23:27:41.275	2022-05-12 03:59:09.557	2022-05-13 23:27:41.277
396	Kassio Viera De Carvalho	kassio viera de carvalho	Convidado	36	2022-05-13 23:28:34.549	2022-05-12 03:59:09.58	2022-05-13 23:28:34.551
401	Gislaine Laura Carvalho	gislaine laura carvalho	Acompanhante	36	2022-05-13 23:28:20.082	2022-05-12 03:59:09.58	2022-05-13 23:28:20.084
406	Alcantara Carvalho	alcantara carvalho	Convidado	37	2022-05-13 23:29:38.511	2022-05-12 03:59:09.59	2022-05-13 23:29:38.512
405	Leonardo Carvalho De Assis	leonardo carvalho de assis	Convidado	37	2022-05-13 23:29:55.405	2022-05-12 03:59:09.59	2022-05-13 23:29:55.407
404	Mozart Carvalho De Assis	mozart carvalho de assis	Convidado	37	2022-05-13 23:35:34.652	2022-05-12 03:59:09.59	2022-05-13 23:35:34.654
410	Juliete Teresinha Silva Assis	juliete teresinha silva assis	Acompanhante	37	2022-05-13 23:35:43.319	2022-05-12 03:59:09.59	2022-05-13 23:35:43.32
414	Djone Fries	djone fries	Convidado	38	2022-05-13 23:38:52.839	2022-05-12 03:59:09.598	2022-05-13 23:38:52.841
417	Graciela M R Fires	graciela m r fires	Acompanhante	38	2022-05-13 23:39:06.815	2022-05-12 03:59:09.598	2022-05-13 23:39:06.818
419	Eduardo 6 Anos	eduardo 6 anos	Acompanhante	38	2022-05-13 23:39:10.709	2022-05-12 03:59:09.598	2022-05-13 23:39:10.711
418	Rafael 10 Anos	rafael 10 anos	Acompanhante	38	2022-05-13 23:39:20.216	2022-05-12 03:59:09.598	2022-05-13 23:39:20.218
402	Sirlei Silva Araujo	sirlei silva araujo	Acompanhante	36	2022-05-13 23:41:28.856	2022-05-12 03:59:09.58	2022-05-13 23:41:28.864
376	Geni Euripedes De Sousa Filho	geni euripedes de sousa filho	Acompanhante	34	2022-05-13 23:43:32.15	2022-05-12 03:59:09.557	2022-05-13 23:43:32.152
386	Maria De Fatima Bezerra Maia	maria de fatima bezerra maia	Convidado	35	2022-05-13 23:44:32.55	2022-05-12 03:59:09.567	2022-05-13 23:44:32.552
392	Juliana Rodrigues Maia	juliana rodrigues maia	Acompanhante	35	2022-05-13 23:44:42.959	2022-05-12 03:59:09.567	2022-05-13 23:44:42.96
385	Elaine Sterchile	elaine sterchile	Convidado	35	2022-05-13 23:47:36.433	2022-05-12 03:59:09.567	2022-05-13 23:47:36.435
391	Leticia Sterchile	leticia sterchile	Acompanhante	35	2022-05-13 23:47:45.128	2022-05-12 03:59:09.567	2022-05-13 23:47:45.129
390	Luanda Sterchile	luanda sterchile	Acompanhante	35	2022-05-13 23:47:48.551	2022-05-12 03:59:09.567	2022-05-13 23:47:48.552
387	Fernando Cesar De Assis	fernando cesar de assis	Acompanhante	35	2022-05-13 23:47:57.669	2022-05-12 03:59:09.567	2022-05-13 23:47:57.671
394	Eduardo Sandri	eduardo sandri	Convidado	36	2022-05-13 23:48:39.007	2022-05-12 03:59:09.58	2022-05-13 23:48:39.008
424	Domingos Passinato	domingos passinato	Convidado	39	2022-05-13 23:57:29.715	2022-05-12 03:59:09.605	2022-05-13 23:57:29.716
428	Eloni Terezinha Passinato	eloni terezinha passinato	Acompanhante	39	2022-05-13 23:57:35.812	2022-05-12 03:59:09.605	2022-05-13 23:57:35.814
367	Franklin Evangelista Piacentini	franklin evangelista piacentini	Convidado	33	2022-05-13 23:58:08.459	2022-05-12 03:59:09.547	2022-05-13 23:58:08.46
372	Luciana De Oliveira Cunha	luciana de oliveira cunha	Acompanhante	33	2022-05-13 23:58:17.147	2022-05-12 03:59:09.548	2022-05-13 23:58:17.149
408	Acy Neto	acy neto	Acompanhante	37	2022-05-13 23:58:52.383	2022-05-12 03:59:09.59	2022-05-13 23:58:52.385
409	Mirian Esposa Do Acy Neto	mirian esposa do acy neto	Acompanhante	37	2022-05-13 23:59:05.469	2022-05-12 03:59:09.59	2022-05-13 23:59:05.471
426	Leonardo Passinato	leonardo passinato	Convidado	39	2022-05-14 00:01:16.057	2022-05-12 03:59:09.605	2022-05-14 00:01:16.059
432	Valentina Freitas	valentina freitas	Acompanhante	39	2022-05-14 00:01:39.781	2022-05-12 03:59:09.605	2022-05-14 00:01:39.783
431	Benicio Freitas	benicio freitas	Acompanhante	39	2022-05-14 00:01:44.337	2022-05-12 03:59:09.605	2022-05-14 00:01:44.338
400	Nathielly Silva Zatt	nathielly silva zatt	Acompanhante	36	2022-05-14 00:12:15.736	2022-05-12 03:59:09.58	2022-05-14 00:12:15.738
368	Larissa Oliveira Michels	larissa oliveira michels	Acompanhante	33	2022-05-14 00:14:45.948	2022-05-12 03:59:09.547	2022-05-14 00:14:45.951
362	Thomaz Matias Michels	thomaz matias michels	Convidado	33	2022-05-14 00:14:54.395	2022-05-12 03:59:09.547	2022-05-14 00:14:54.396
437	Leonardo De Oliveira Costa Filho	leonardo de oliveira costa filho	Convidado	40	\N	2022-05-12 03:59:09.612	2022-05-12 03:59:09.612
438	Felipe Antillon	felipe antillon	Acompanhante	40	\N	2022-05-12 03:59:09.612	2022-05-12 03:59:09.612
439	Julia Vilela	julia vilela	Acompanhante	40	\N	2022-05-12 03:59:09.612	2022-05-12 03:59:09.612
440	Antonio Humberto Carvalho	antonio humberto carvalho	Acompanhante	40	\N	2022-05-12 03:59:09.612	2022-05-12 03:59:09.612
453	José Luiz Palharini	jose luiz palharini	Convidado	42	\N	2022-05-12 03:59:09.625	2022-05-12 03:59:09.626
456	Angela Salete Alves Xavier Palharini	angela salete alves xavier palharini	Acompanhante	42	\N	2022-05-12 03:59:09.625	2022-05-12 03:59:09.626
458	Valdir Antonio Niedermeier	valdir antonio niedermeier	Convidado	43	\N	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
460	Davi Carvalho Niedermeier	davi carvalho niedermeier	Acompanhante	43	\N	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
462	Aline Peres De Oliveira Niedermeier	aline peres de oliveira niedermeier	Acompanhante	43	\N	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
465	Rafael Basso	rafael basso	Acompanhante	43	\N	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
466	Natalia	natalia	Acompanhante	43	\N	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
467	Jurandir Guerini	jurandir guerini	Convidado	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.641
468	Ana Claudia Guerini	ana claudia guerini	Convidado	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.641
469	Ana Cristina Guerini	ana cristina guerini	Convidado	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.641
472	Neusa Guerini	neusa guerini	Acompanhante	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.642
474	Danilo Carvalho Cardoso	danilo carvalho cardoso	Acompanhante	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.642
476	Elias Levi Simeão	elias levi simeao	Acompanhante	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.642
480	Isadora Thomaz	isadora thomaz	Acompanhante	44	\N	2022-05-12 03:59:09.641	2022-05-12 03:59:09.642
485	Maria Aparecida	maria aparecida	Convidado	45	\N	2022-05-12 03:59:09.648	2022-05-12 03:59:09.649
491	João Filho	joao filho	Acompanhante	45	\N	2022-05-12 03:59:09.649	2022-05-12 03:59:09.649
504	Eudes Lima Assis	eudes lima assis	Convidado	47	\N	2022-05-12 03:59:09.665	2022-05-12 03:59:09.666
486	Cristofer Silva Carvalho	cristofer silva carvalho	Convidado	45	2022-05-13 23:23:25.205	2022-05-12 03:59:09.649	2022-05-13 23:23:25.206
494	Marcos Roberto Schumacher	marcos roberto schumacher	Convidado	46	2022-05-13 23:23:58.777	2022-05-12 03:59:09.657	2022-05-13 23:23:58.779
500	Ingrid Melher Schumacher	ingrid melher schumacher	Acompanhante	46	2022-05-13 23:24:12.469	2022-05-12 03:59:09.657	2022-05-13 23:24:12.471
503	Uguis Meire Da Silva	uguis meire da silva	Convidado	47	2022-05-13 23:25:44.251	2022-05-12 03:59:09.665	2022-05-13 23:25:44.254
447	Wellita Moraes Albuquerquer Perdoncini	wellita moraes albuquerquer perdoncini	Acompanhante	41	2022-05-13 23:27:16.561	2022-05-12 03:59:09.619	2022-05-13 23:27:16.563
444	Claudio Perdoncini	claudio perdoncini	Convidado	41	2022-05-13 23:27:27.641	2022-05-12 03:59:09.619	2022-05-13 23:27:27.642
448	Claudio Perdoncini Filho 10 Anos	claudio perdoncini filho 10 anos	Acompanhante	41	2022-05-13 23:27:30.417	2022-05-12 03:59:09.619	2022-05-13 23:27:30.419
449	Clarissa Perdoncini 5 Anos	clarissa perdoncini 5 anos	Acompanhante	41	2022-05-13 23:27:33.521	2022-05-12 03:59:09.619	2022-05-13 23:27:33.522
493	Alvaro Sterchile	alvaro sterchile	Convidado	46	2022-05-13 23:27:57.34	2022-05-12 03:59:09.657	2022-05-13 23:27:57.343
499	Eliane Peres De Vasconcelos Sterchile	eliane peres de vasconcelos sterchile	Acompanhante	46	2022-05-13 23:27:44.159	2022-05-12 03:59:09.657	2022-05-13 23:27:44.161
496	Bruna Da Silva Pinto	bruna da silva pinto	Acompanhante	46	2022-05-13 23:28:05.921	2022-05-12 03:59:09.657	2022-05-13 23:28:05.922
492	Vilar Domingues Da Silva Pinto	vilar domingues da silva pinto	Convidado	46	2022-05-13 23:28:13.81	2022-05-12 03:59:09.657	2022-05-13 23:28:13.811
495	Janes Da Costa Silva	janes da costa silva	Acompanhante	46	2022-05-13 23:28:19.536	2022-05-12 03:59:09.657	2022-05-13 23:28:19.538
497	Beatriz Da Silva Pinto	beatriz da silva pinto	Acompanhante	46	2022-05-13 23:28:21.881	2022-05-12 03:59:09.657	2022-05-13 23:28:21.883
443	Vanessa Filizzola Sptimio	vanessa filizzola sptimio	Convidado	41	2022-05-13 23:31:24.093	2022-05-12 03:59:09.619	2022-05-13 23:31:24.095
446	Luciano Ricardo Kroth	luciano ricardo kroth	Acompanhante	41	2022-05-13 23:31:33.581	2022-05-12 03:59:09.619	2022-05-13 23:31:33.583
441	Angela Carvalho Colu	angela carvalho colu	Acompanhante	40	2022-05-13 23:34:10.099	2022-05-12 03:59:09.612	2022-05-13 23:34:10.101
470	Fabricio Carvalho Cardoso	fabricio carvalho cardoso	Convidado	44	2022-05-13 23:34:24.311	2022-05-12 03:59:09.641	2022-05-13 23:34:24.313
477	Fabricio Carvalho Cardoso	fabricio carvalho cardoso	Acompanhante	44	2022-05-13 23:34:25.951	2022-05-12 03:59:09.641	2022-05-13 23:34:25.952
479	Fabricio Filho	fabricio filho	Acompanhante	44	2022-05-13 23:34:41.023	2022-05-12 03:59:09.641	2022-05-13 23:34:41.025
478	Nanci Thomaz Lacerda Cardoso	nanci thomaz lacerda cardoso	Acompanhante	44	2022-05-13 23:34:43.91	2022-05-12 03:59:09.641	2022-05-13 23:34:43.912
452	Rudimar Palharini	rudimar palharini	Convidado	42	2022-05-13 23:40:40.863	2022-05-12 03:59:09.625	2022-05-13 23:40:40.866
455	Elisangela Bezerra Da Silva	elisangela bezerra da silva	Acompanhante	42	2022-05-13 23:40:55.585	2022-05-12 03:59:09.625	2022-05-13 23:40:55.586
454	Ironice Fatima Zanuzzi Palharini	ironice fatima zanuzzi palharini	Acompanhante	42	2022-05-13 23:42:23.005	2022-05-12 03:59:09.625	2022-05-13 23:42:23.006
451	Edacir Angelo Palharini	edacir angelo palharini	Convidado	42	2022-05-13 23:42:32.508	2022-05-12 03:59:09.625	2022-05-13 23:42:32.51
502	Emmanuelle Gomes Pereira Da Silva Candido	emmanuelle gomes pereira da silva candido	Convidado	47	2022-05-13 23:43:06.897	2022-05-12 03:59:09.665	2022-05-13 23:43:06.899
498	Gabriel Rodrigues Maia	gabriel rodrigues maia	Acompanhante	46	2022-05-13 23:44:27.593	2022-05-12 03:59:09.657	2022-05-13 23:44:27.595
445	Alessandra Alves De Carvalho	alessandra alves de carvalho	Convidado	41	2022-05-13 23:49:29.336	2022-05-12 03:59:09.619	2022-05-13 23:49:29.338
457	Guilherme Palharini	guilherme palharini	Acompanhante	42	2022-05-13 23:53:06.268	2022-05-12 03:59:09.625	2022-05-13 23:53:06.269
505	Flavia Ruscitti	flavia ruscitti	Acompanhante	47	2022-05-13 23:58:38.749	2022-05-12 03:59:09.665	2022-05-13 23:58:38.751
501	Cristina Ruscitti Ferreira	cristina ruscitti ferreira	Convidado	47	2022-05-13 23:58:49.268	2022-05-12 03:59:09.665	2022-05-13 23:58:49.27
481	Valteir Gonçalves Ferreira	valteir goncalves ferreira	Convidado	45	2022-05-13 23:59:21.135	2022-05-12 03:59:09.648	2022-05-13 23:59:21.138
489	Pamela Dias Dos Santos	pamela dias dos santos	Acompanhante	45	2022-05-13 23:59:29.454	2022-05-12 03:59:09.649	2022-05-13 23:59:29.456
484	Juliano Rodrigues Cabral	juliano rodrigues cabral	Convidado	45	2022-05-13 23:59:43.253	2022-05-12 03:59:09.648	2022-05-13 23:59:43.254
490	Liliam Martins Siqueira	liliam martins siqueira	Acompanhante	45	2022-05-13 23:59:48.095	2022-05-12 03:59:09.649	2022-05-13 23:59:48.096
483	Mateus Cabral undefined Da Silva	mateus cabral da silva	Convidado	45	2022-05-13 23:59:51.692	2022-05-12 03:59:09.648	2022-05-13 23:59:51.693
487	Nathali Cristina Rodrigues	nathali cristina rodrigues	Acompanhante	45	2022-05-13 23:59:58.431	2022-05-12 03:59:09.649	2022-05-13 23:59:58.433
482	Valteir Gonçalve	valteir goncalve	Convidado	45	2022-05-14 00:00:01.813	2022-05-12 03:59:09.648	2022-05-14 00:00:01.814
488	Sioene Cabral Da Silva Alves	sioene cabral da silva alves	Acompanhante	45	2022-05-14 00:00:07.975	2022-05-12 03:59:09.649	2022-05-14 00:00:07.978
461	Jacson Marlon Niedermeier	jacson marlon niedermeier	Acompanhante	43	2022-05-14 00:24:46.166	2022-05-12 03:59:09.633	2022-05-14 00:24:46.167
463	Janice Kaline Niedermeier	janice kaline niedermeier	Acompanhante	43	2022-05-14 00:30:21.129	2022-05-12 03:59:09.633	2022-05-14 00:30:21.13
464	Jairo Flavio De Carvalho	jairo flavio de carvalho	Acompanhante	43	2022-05-14 00:30:43.177	2022-05-12 03:59:09.633	2022-05-14 00:30:43.178
450	Maria Ivonete Smaniotto	maria ivonete smaniotto	Acompanhante	41	2022-05-14 00:50:06.848	2022-05-12 03:59:09.619	2022-05-14 00:50:06.849
508	Eunice Tavares Silveira Lima	eunice tavares silveira lima	Acompanhante	47	\N	2022-05-12 03:59:09.665	2022-05-12 03:59:09.666
510	Edgar Weyrich	edgar weyrich	Convidado	48	\N	2022-05-12 03:59:09.674	2022-05-12 03:59:09.675
512	Nelson Maggioni	nelson maggioni	Convidado	48	\N	2022-05-12 03:59:09.674	2022-05-12 03:59:09.675
516	Eliane Therezinha Volpatto	eliane therezinha volpatto	Acompanhante	48	\N	2022-05-12 03:59:09.674	2022-05-12 03:59:09.675
517	Caroline V Weyrichi Maggioni	caroline v weyrichi maggioni	Acompanhante	48	\N	2022-05-12 03:59:09.674	2022-05-12 03:59:09.675
522	Osvino Basilio Sandri	osvino basilio sandri	Convidado	49	\N	2022-05-12 03:59:09.681	2022-05-12 03:59:09.682
524	Gecyane Laisa Pires Sachert	gecyane laisa pires sachert	Convidado	49	\N	2022-05-12 03:59:09.681	2022-05-12 03:59:09.682
526	Ivone Terezinha Dalcin Sandri	ivone terezinha dalcin sandri	Acompanhante	49	\N	2022-05-12 03:59:09.681	2022-05-12 03:59:09.682
527	Marcelo Dias De Moraes Filho	marcelo dias de moraes filho	Acompanhante	49	\N	2022-05-12 03:59:09.681	2022-05-12 03:59:09.682
533	Waguinho Costa	waguinho costa	Convidado	50	\N	2022-05-12 03:59:09.688	2022-05-12 03:59:09.688
536	Davi Oliveira 7 Anos	davi oliveira 7 anos	Acompanhante	50	\N	2022-05-12 03:59:09.688	2022-05-12 03:59:09.688
540	Danilo Aimi	danilo aimi	Convidado	51	\N	2022-05-12 03:59:09.695	2022-05-12 03:59:09.696
541	Laurindo Aimi - Vão Os Representantes	laurindo aimi vao os representantes	Convidado	51	\N	2022-05-12 03:59:09.695	2022-05-12 03:59:09.696
543	Dolores Das Graças Aimi	dolores das gracas aimi	Acompanhante	51	\N	2022-05-12 03:59:09.695	2022-05-12 03:59:09.696
545	Charles Correa	charles correa	Acompanhante	51	\N	2022-05-12 03:59:09.695	2022-05-12 03:59:09.696
548	Mariza Zanuzzi	mariza zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
551	Guilherme Zanuzzi	guilherme zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
552	Gabriel Zanuzzi	gabriel zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
553	Daniel Zanuzzi	daniel zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
554	Renata Zanuzzi	renata zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
555	Rafael Gomes De Oliveira	rafael gomes de oliveira	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
556	Maria Alice Zanuzzi	maria alice zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
557	Henrico Zanuzzi	henrico zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
558	Gabriela Zanuzzi	gabriela zanuzzi	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
559	Talles Tadeu	talles tadeu	Acompanhante	52	\N	2022-05-12 03:59:09.703	2022-05-12 03:59:09.703
560	Angelo Paloschi	angelo paloschi	Convidado	53	\N	2022-05-12 03:59:09.71	2022-05-12 03:59:09.711
564	Enerde Maggioni Paloschi	enerde maggioni paloschi	Acompanhante	53	\N	2022-05-12 03:59:09.71	2022-05-12 03:59:09.711
568	Catarina Paloshi	catarina paloshi	Acompanhante	53	\N	2022-05-12 03:59:09.711	2022-05-12 03:59:09.711
572	Rafael Paloschi	rafael paloschi	Convidado	54	\N	2022-05-12 03:59:09.718	2022-05-12 03:59:09.719
575	Fatima Maria Paloschi	fatima maria paloschi	Convidado	54	\N	2022-05-12 03:59:09.718	2022-05-12 03:59:09.719
576	Nubia Almeida De Castro	nubia almeida de castro	Acompanhante	54	\N	2022-05-12 03:59:09.718	2022-05-12 03:59:09.719
577	Luana Almeida De Castro - 5 Anos	luana almeida de castro 5 anos	Acompanhante	54	\N	2022-05-12 03:59:09.718	2022-05-12 03:59:09.719
511	Volmar José Maggioni	volmar jose maggioni	Convidado	48	2022-05-13 23:23:41.914	2022-05-12 03:59:09.674	2022-05-13 23:23:41.917
578	Ivete Aimi Paloschi	ivete aimi paloschi	Acompanhante	54	2022-05-13 23:23:44.238	2022-05-12 03:59:09.718	2022-05-13 23:23:44.24
573	Alderico Paloschi	alderico paloschi	Convidado	54	2022-05-13 23:23:53.518	2022-05-12 03:59:09.718	2022-05-13 23:23:53.52
571	Laura Paloschi	laura paloschi	Acompanhante	53	2022-05-13 23:24:32.698	2022-05-12 03:59:09.711	2022-05-13 23:24:32.7
507	Aparecida Garcia Dutra Silva	aparecida garcia dutra silva	Acompanhante	47	2022-05-13 23:25:06.844	2022-05-12 03:59:09.665	2022-05-13 23:25:06.848
562	Viviane Paloschi	viviane paloschi	Convidado	53	2022-05-13 23:26:49.971	2022-05-12 03:59:09.71	2022-05-13 23:26:49.974
566	Paulo Machado Amaral	paulo machado amaral	Acompanhante	53	2022-05-13 23:26:57.004	2022-05-12 03:59:09.711	2022-05-13 23:26:57.006
530	Rafael Prado De Castro	rafael prado de castro	Convidado	50	2022-05-13 23:28:05.211	2022-05-12 03:59:09.688	2022-05-13 23:28:05.213
535	Priscilla Poanca De Oliveira	priscilla poanca de oliveira	Acompanhante	50	2022-05-13 23:28:18.583	2022-05-12 03:59:09.688	2022-05-13 23:28:18.584
521	Vitor Gaiardo	vitor gaiardo	Convidado	49	2022-05-13 23:30:37.827	2022-05-12 03:59:09.681	2022-05-13 23:30:37.828
525	Leonice Bratti Gaiardo	leonice bratti gaiardo	Acompanhante	49	2022-05-13 23:30:50.791	2022-05-12 03:59:09.681	2022-05-13 23:30:50.793
542	Sandra Aimi	sandra aimi	Convidado	51	2022-05-13 23:31:00.979	2022-05-12 03:59:09.695	2022-05-13 23:31:00.981
546	Rogerio Fernandes Da Silva	rogerio fernandes da silva	Acompanhante	51	2022-05-13 23:31:26.381	2022-05-12 03:59:09.695	2022-05-13 23:31:26.382
544	Cintia Aimi	cintia aimi	Acompanhante	51	2022-05-13 23:32:06.921	2022-05-12 03:59:09.695	2022-05-13 23:32:06.923
547	Sergio Zanuzzi	sergio zanuzzi	Convidado	52	2022-05-13 23:34:08.121	2022-05-12 03:59:09.703	2022-05-13 23:34:08.123
563	Aldo Paloschi	aldo paloschi	Convidado	53	2022-05-13 23:38:05.901	2022-05-12 03:59:09.71	2022-05-13 23:38:05.903
580	Gabriel Vieira De Moraes	gabriel vieira de moraes	Convidado	55	2022-05-13 23:39:17.962	2022-05-12 03:59:09.726	2022-05-13 23:39:17.964
561	Tadeu Paloschi	tadeu paloschi	Convidado	53	2022-05-13 23:41:20.21	2022-05-12 03:59:09.71	2022-05-13 23:41:20.211
565	Nayara Rezende Freitas	nayara rezende freitas	Acompanhante	53	2022-05-13 23:41:27.721	2022-05-12 03:59:09.711	2022-05-13 23:41:27.723
529	Antonio Emiliano De Carvalho Gedda	antonio emiliano de carvalho gedda	Convidado	50	2022-05-13 23:42:50.028	2022-05-12 03:59:09.688	2022-05-13 23:42:50.03
506	Jadson Candido Da Silva Gomes	jadson candido da silva gomes	Acompanhante	47	2022-05-13 23:43:15.895	2022-05-12 03:59:09.665	2022-05-13 23:43:15.897
523	Ilario Sachertt	ilario sachertt	Convidado	49	2022-05-13 23:45:28.648	2022-05-12 03:59:09.681	2022-05-13 23:45:28.649
509	Edgar Weyrich Junior	edgar weyrich junior	Convidado	48	2022-05-13 23:51:25.962	2022-05-12 03:59:09.674	2022-05-13 23:51:25.965
515	Emiliana Camila	emiliana camila	Acompanhante	48	2022-05-13 23:51:36.656	2022-05-12 03:59:09.674	2022-05-13 23:51:36.658
549	Ana Virginia Zanuzzi	ana virginia zanuzzi	Acompanhante	52	2022-05-13 23:53:18.713	2022-05-12 03:59:09.703	2022-05-13 23:53:18.715
550	Mauro Sergio Hoffbrait	mauro sergio hoffbrait	Acompanhante	52	2022-05-13 23:53:25.507	2022-05-12 03:59:09.703	2022-05-13 23:53:25.509
514	Elisangela Maggioni	elisangela maggioni	Convidado	48	2022-05-13 23:58:54.728	2022-05-12 03:59:09.674	2022-05-13 23:58:54.729
513	Volnice Maggioni	volnice maggioni	Convidado	48	2022-05-14 00:00:25.163	2022-05-12 03:59:09.674	2022-05-14 00:00:25.164
518	Victo Paulo Gonçalves	victo paulo goncalves	Acompanhante	48	2022-05-14 00:00:35.491	2022-05-12 03:59:09.674	2022-05-14 00:00:35.493
519	Mariana Maggioni 15 Anos	mariana maggioni 15 anos	Acompanhante	48	2022-05-14 00:00:46.171	2022-05-12 03:59:09.674	2022-05-14 00:00:46.172
570	Samara Paloschi	samara paloschi	Acompanhante	53	2022-05-14 00:05:09.503	2022-05-12 03:59:09.711	2022-05-14 00:05:09.504
569	Enio Paloschi	enio paloschi	Acompanhante	53	2022-05-14 00:05:16.891	2022-05-12 03:59:09.711	2022-05-14 00:05:16.892
574	Simone Paloschi	simone paloschi	Convidado	54	2022-05-14 00:17:46.579	2022-05-12 03:59:09.718	2022-05-14 00:17:46.581
579	Fernando Paranaiba Filgueira	fernando paranaiba filgueira	Acompanhante	54	2022-05-14 00:17:52.937	2022-05-12 03:59:09.718	2022-05-14 00:17:52.94
531	Marcelo Prado De Castro	marcelo prado de castro	Convidado	50	2022-05-14 00:23:14.067	2022-05-12 03:59:09.688	2022-05-14 00:23:14.069
537	Joziane Oliveira Lima	joziane oliveira lima	Acompanhante	50	2022-05-14 00:23:22.392	2022-05-12 03:59:09.688	2022-05-14 00:23:22.393
532	Aurelio Bueno	aurelio bueno	Convidado	50	2022-05-14 00:52:47.169	2022-05-12 03:59:09.688	2022-05-14 00:52:47.17
538	Aline Bueno	aline bueno	Acompanhante	50	2022-05-14 00:53:13.932	2022-05-12 03:59:09.688	2022-05-14 00:53:13.934
590	Kelly Reniga Cardoso Dos Anjos	kelly reniga cardoso dos anjos	Acompanhante	55	\N	2022-05-12 03:59:09.726	2022-05-12 03:59:09.727
593	Vicente José Mantelli	vicente jose mantelli	Convidado	56	\N	2022-05-12 03:59:09.733	2022-05-12 03:59:09.734
594	Airton João Alves Xavier	airton joao alves xavier	Convidado	56	\N	2022-05-12 03:59:09.733	2022-05-12 03:59:09.734
597	Hugo Rafael Barbosa Mendonça	hugo rafael barbosa mendonca	Acompanhante	56	\N	2022-05-12 03:59:09.733	2022-05-12 03:59:09.734
598	Ana Julia Cardoso Mantelli	ana julia cardoso mantelli	Acompanhante	56	\N	2022-05-12 03:59:09.733	2022-05-12 03:59:09.734
610	Pedro Savatin Pelizon (criança)	pedro savatin pelizon crianca	Acompanhante	57	\N	2022-05-12 03:59:09.741	2022-05-12 03:59:09.742
611	Bruno Augutus Marques Da Cunha	bruno augutus marques da cunha	Acompanhante	57	\N	2022-05-12 03:59:09.741	2022-05-12 03:59:09.742
629	Vinicius Almança Garcia	vinicius almanca garcia	Convidado	60	\N	2022-05-12 03:59:09.762	2022-05-12 03:59:09.763
633	Acompanhante Do Vinicius Almança	acompanhante do vinicius almanca	Acompanhante	60	\N	2022-05-12 03:59:09.763	2022-05-12 03:59:09.763
635	José Luis Bagestao Lais	jose luis bagestao lais	Convidado	61	\N	2022-05-12 03:59:09.77	2022-05-12 03:59:09.77
639	Nilza Gonçalves Markmann	nilza goncalves markmann	Acompanhante	61	\N	2022-05-12 03:59:09.77	2022-05-12 03:59:09.77
641	Rubens Antonio De Sousa Junior	rubens antonio de sousa junior	Acompanhante	61	\N	2022-05-12 03:59:09.77	2022-05-12 03:59:09.77
642	Maria Martins Bagestao	maria martins bagestao	Acompanhante	61	\N	2022-05-12 03:59:09.77	2022-05-12 03:59:09.77
640	Angelica Markmann De Sousa	angelica markmann de sousa	Acompanhante	61	2022-05-13 23:23:26.43	2022-05-12 03:59:09.77	2022-05-13 23:23:26.431
634	Valdir Paulo Markmann	valdir paulo markmann	Convidado	61	2022-05-13 23:25:14.609	2022-05-12 03:59:09.77	2022-05-13 23:25:14.61
648	Eny De Oliveira Lima	eny de oliveira lima	Convidado	62	2022-05-13 23:28:48.313	2022-05-12 03:59:09.777	2022-05-13 23:28:48.314
595	Alvaro Gonçalves Dos Santos	alvaro goncalves dos santos	Convidado	56	2022-05-13 23:29:40.818	2022-05-12 03:59:09.733	2022-05-13 23:29:40.82
588	André Zanuzzi	andre zanuzzi	Acompanhante	55	2022-05-13 23:29:47.97	2022-05-12 03:59:09.726	2022-05-13 23:29:47.972
600	Michele Mantelli Xavier	michele mantelli xavier	Acompanhante	56	2022-05-13 23:29:55.687	2022-05-12 03:59:09.733	2022-05-13 23:29:55.689
582	Silvia Aimi	silvia aimi	Convidado	55	2022-05-13 23:29:57.45	2022-05-12 03:59:09.726	2022-05-13 23:29:57.451
591	Solange Mantelli Oliveira Freitas	solange mantelli oliveira freitas	Convidado	56	2022-05-13 23:30:57.383	2022-05-12 03:59:09.733	2022-05-13 23:30:57.385
596	Ricardo Oliveira Freitas	ricardo oliveira freitas	Acompanhante	56	2022-05-13 23:31:12.382	2022-05-12 03:59:09.733	2022-05-13 23:31:12.384
599	Sozeni Maria Mantelli Xavier	sozeni maria mantelli xavier	Acompanhante	56	2022-05-13 23:31:31.639	2022-05-12 03:59:09.733	2022-05-13 23:31:31.64
617	Dejair Portela Fernandes	dejair portela fernandes	Acompanhante	58	2022-05-13 23:31:56.885	2022-05-12 03:59:09.748	2022-05-13 23:31:56.887
592	Ana Regina Mantelli Mendonça	ana regina mantelli mendonca	Convidado	56	2022-05-13 23:31:57.292	2022-05-12 03:59:09.733	2022-05-13 23:31:57.294
613	Renata Gobbi	renata gobbi	Convidado	58	2022-05-13 23:32:05.605	2022-05-12 03:59:09.748	2022-05-13 23:32:05.608
614	Claudia Gobbi	claudia gobbi	Convidado	58	2022-05-13 23:32:07.845	2022-05-12 03:59:09.748	2022-05-13 23:32:07.847
618	Marcelo Gobbi	marcelo gobbi	Acompanhante	58	2022-05-13 23:32:18.126	2022-05-12 03:59:09.748	2022-05-13 23:32:18.127
612	Delmir Gobbi	delmir gobbi	Convidado	58	2022-05-13 23:32:12.325	2022-05-12 03:59:09.748	2022-05-13 23:32:12.327
616	Delinda Inês Gobbi	delinda ines gobbi	Acompanhante	58	2022-05-13 23:32:15.126	2022-05-12 03:59:09.748	2022-05-13 23:32:15.128
615	Marcelo Gobbi	marcelo gobbi	Convidado	58	2022-05-13 23:32:16.918	2022-05-12 03:59:09.748	2022-05-13 23:32:16.92
583	Claudio Lasaro Prado	claudio lasaro prado	Convidado	55	2022-05-13 23:32:53.885	2022-05-12 03:59:09.726	2022-05-13 23:32:53.887
589	Alessandra Velloso Vilela	alessandra velloso vilela	Acompanhante	55	2022-05-13 23:33:03.002	2022-05-12 03:59:09.726	2022-05-13 23:33:03.004
609	Juliana Savatin Pelizon	juliana savatin pelizon	Acompanhante	57	2022-05-13 23:33:16.342	2022-05-12 03:59:09.741	2022-05-13 23:33:16.344
650	Clenia Severino Lima	clenia severino lima	Convidado	62	2022-05-13 23:35:27.112	2022-05-12 03:59:09.777	2022-05-13 23:35:27.114
628	Carlos Eduardo Vilela Filho	carlos eduardo vilela filho	Convidado	60	2022-05-13 23:39:07.408	2022-05-12 03:59:09.762	2022-05-13 23:39:07.41
632	Cristiany Alves Vilela	cristiany alves vilela	Acompanhante	60	2022-05-13 23:39:21.497	2022-05-12 03:59:09.763	2022-05-13 23:39:21.499
585	Daiana Maria Zanuzzi	daiana maria zanuzzi	Acompanhante	55	2022-05-13 23:39:31.16	2022-05-12 03:59:09.726	2022-05-13 23:39:31.162
586	Danilla Oliveira Gomes	danilla oliveira gomes	Acompanhante	55	2022-05-13 23:39:43.087	2022-05-12 03:59:09.726	2022-05-13 23:39:43.09
581	Giovane Zanuzzi	giovane zanuzzi	Convidado	55	2022-05-13 23:39:47.414	2022-05-12 03:59:09.726	2022-05-13 23:39:47.416
587	Sávio Gomes Resende	savio gomes resende	Acompanhante	55	2022-05-13 23:39:50.774	2022-05-12 03:59:09.726	2022-05-13 23:39:50.775
638	Thiago Oliveira Mendes	thiago oliveira mendes	Convidado	61	2022-05-13 23:40:30.402	2022-05-12 03:59:09.77	2022-05-13 23:40:30.404
627	Flávio Carvalho Garcia	flavio carvalho garcia	Convidado	60	2022-05-13 23:42:19.868	2022-05-12 03:59:09.762	2022-05-13 23:42:19.871
631	Aline Martins	aline martins	Acompanhante	60	2022-05-13 23:42:34.115	2022-05-12 03:59:09.763	2022-05-13 23:42:34.116
644	Elaine Ponciano Souza	elaine ponciano souza	Acompanhante	61	2022-05-13 23:42:57.648	2022-05-12 03:59:09.77	2022-05-13 23:42:57.65
637	Paulo Sergio Rodrigues Silva	paulo sergio rodrigues silva	Convidado	61	2022-05-13 23:43:11.886	2022-05-12 03:59:09.77	2022-05-13 23:43:11.888
584	Sadi Angelo Palharine	sadi angelo palharine	Convidado	55	2022-05-13 23:44:47.045	2022-05-12 03:59:09.726	2022-05-13 23:44:47.046
626	Emilio Garcia	emilio garcia	Convidado	60	2022-05-13 23:51:01.839	2022-05-12 03:59:09.762	2022-05-13 23:51:01.841
630	Carliane Alexandre	carliane alexandre	Acompanhante	60	2022-05-13 23:51:18.957	2022-05-12 03:59:09.762	2022-05-13 23:51:18.958
621	Jean Pierre Lima Santos	jean pierre lima santos	Convidado	59	2022-05-13 23:52:39.345	2022-05-12 03:59:09.755	2022-05-13 23:52:39.347
624	Mariane Kunan Lima Santos	mariane kunan lima santos	Acompanhante	59	2022-05-13 23:53:03.073	2022-05-12 03:59:09.755	2022-05-13 23:53:03.076
649	Gustavo Assis Lopes	gustavo assis lopes	Convidado	62	2022-05-14 00:01:07.044	2022-05-12 03:59:09.777	2022-05-14 00:01:07.046
651	Disney Melo Franco	disney melo franco	Acompanhante	62	2022-05-14 00:04:56.407	2022-05-12 03:59:09.777	2022-05-14 00:04:56.408
622	Bartolomeu Rogerio Rodrigues Neto	bartolomeu rogerio rodrigues neto	Convidado	59	2022-05-14 00:11:01.016	2022-05-12 03:59:09.755	2022-05-14 00:11:01.017
625	Josiane Soares Cavalcante	josiane soares cavalcante	Acompanhante	59	2022-05-14 00:11:07.85	2022-05-12 03:59:09.755	2022-05-14 00:11:07.851
623	Felipe Alves Ferreira Da Mata	felipe alves ferreira da mata	Convidado	59	2022-05-14 00:11:16.57	2022-05-12 03:59:09.755	2022-05-14 00:11:16.572
602	Marcos Rogerio Leite Konig	marcos rogerio leite konig	Convidado	57	2022-05-14 00:13:19.481	2022-05-12 03:59:09.741	2022-05-14 00:13:19.483
606	Vanessa De Almeirda Rodrigues Konig	vanessa de almeirda rodrigues konig	Acompanhante	57	2022-05-14 00:13:30.726	2022-05-12 03:59:09.741	2022-05-14 00:13:30.727
607	Victor Hugo De Almeida Konig	victor hugo de almeida konig	Acompanhante	57	2022-05-14 00:13:40.548	2022-05-12 03:59:09.741	2022-05-14 00:13:40.55
608	Manuela De Almeida Konig	manuela de almeida konig	Acompanhante	57	2022-05-14 00:13:51.866	2022-05-12 03:59:09.741	2022-05-14 00:13:51.868
619	Sara Cristiana Silva	sara cristiana silva	Convidado	59	2022-05-14 00:14:13.319	2022-05-12 03:59:09.755	2022-05-14 00:14:13.321
647	Isaurita Lopes Da Silva	isaurita lopes da silva	Convidado	62	2022-05-14 00:19:06.153	2022-05-12 03:59:09.777	2022-05-14 00:19:06.159
636	Bruno Alves Cordeiro	bruno alves cordeiro	Convidado	61	2022-05-14 00:24:47.592	2022-05-12 03:59:09.77	2022-05-14 00:24:47.594
643	Jordana Silva Sousa	jordana silva sousa	Acompanhante	61	2022-05-14 00:24:52.391	2022-05-12 03:59:09.77	2022-05-14 00:24:52.392
656	Maria Gabriela Carvalho Martins Vieira	maria gabriela carvalho martins vieira	Convidado	63	\N	2022-05-12 03:59:09.783	2022-05-12 03:59:09.784
660	Filho Menores De José Roberto Camozzi	filho menores de jose roberto camozzi	Acompanhante	63	\N	2022-05-12 03:59:09.783	2022-05-12 03:59:09.784
661	Filho Menores De José Roberto Camozzi	filho menores de jose roberto camozzi	Acompanhante	63	\N	2022-05-12 03:59:09.783	2022-05-12 03:59:09.784
664	Sergio Barzotto	sergio barzotto	Convidado	64	\N	2022-05-12 03:59:09.79	2022-05-12 03:59:09.791
668	Maria Helena Barzotto	maria helena barzotto	Acompanhante	64	\N	2022-05-12 03:59:09.79	2022-05-12 03:59:09.791
669	Aurélio Primo Sovernigo Neto	aurelio primo sovernigo neto	Acompanhante	64	\N	2022-05-12 03:59:09.79	2022-05-12 03:59:09.791
674	Claudia Shombe - Vao Representantes	claudia shombe vao representantes	Convidado	65	\N	2022-05-12 03:59:09.8	2022-05-12 03:59:09.801
681	Gabriela Elegda 8 Meses	gabriela elegda 8 meses	Acompanhante	65	\N	2022-05-12 03:59:09.8	2022-05-12 03:59:09.801
684	Lucas Prado De Morais	lucas prado de morais	Convidado	66	\N	2022-05-12 03:59:09.808	2022-05-12 03:59:09.809
685	Elaine Toniazzo	elaine toniazzo	Convidado	66	\N	2022-05-12 03:59:09.808	2022-05-12 03:59:09.809
686	Raiane Andressa Toniazzo	raiane andressa toniazzo	Acompanhante	66	\N	2022-05-12 03:59:09.808	2022-05-12 03:59:09.809
688	Elisanei Elsione Oliveira Prado	elisanei elsione oliveira prado	Acompanhante	66	\N	2022-05-12 03:59:09.809	2022-05-12 03:59:09.809
689	Mariana Prado De Morais	mariana prado de morais	Acompanhante	66	\N	2022-05-12 03:59:09.809	2022-05-12 03:59:09.809
690	Carlos Eduardo Américo De Melo	carlos eduardo americo de melo	Acompanhante	66	\N	2022-05-12 03:59:09.809	2022-05-12 03:59:09.809
691	Maria Candida Carvalho	maria candida carvalho	Acompanhante	66	\N	2022-05-12 03:59:09.809	2022-05-12 03:59:09.809
693	Antonio Toniazzo	antonio toniazzo	Convidado	67	\N	2022-05-12 03:59:09.815	2022-05-12 03:59:09.816
698	Rubia Andrea Toniazzo Gobbi	rubia andrea toniazzo gobbi	Acompanhante	67	\N	2022-05-12 03:59:09.815	2022-05-12 03:59:09.816
700	Laura Toniazzo Gobbi	laura toniazzo gobbi	Acompanhante	67	\N	2022-05-12 03:59:09.815	2022-05-12 03:59:09.816
703	Mchelli Fernanda Bette Camara	mchelli fernanda bette camara	Acompanhante	67	\N	2022-05-12 03:59:09.815	2022-05-12 03:59:09.816
705	Marino Fianchi	marino fianchi	Convidado	68	\N	2022-05-12 03:59:09.822	2022-05-12 03:59:09.822
706	Lucas Augusto Fianchi	lucas augusto fianchi	Convidado	68	\N	2022-05-12 03:59:09.822	2022-05-12 03:59:09.822
709	Anaisa Rezende Vilela Fianchi	anaisa rezende vilela fianchi	Acompanhante	68	\N	2022-05-12 03:59:09.822	2022-05-12 03:59:09.822
717	Sueliton Rodovalho Camargo	sueliton rodovalho camargo	Convidado	69	\N	2022-05-12 03:59:09.828	2022-05-12 03:59:09.829
676	Heloisa Stroher 12 Anos	heloisa stroher 12 anos	Acompanhante	65	2022-05-13 23:23:40.959	2022-05-12 03:59:09.8	2022-05-13 23:23:40.961
675	Maria Angelica Stroher Zapparoli Vieira	maria angelica stroher zapparoli vieira	Acompanhante	65	2022-05-13 23:23:46.559	2022-05-12 03:59:09.8	2022-05-13 23:23:46.56
696	Elieser Goulart	elieser goulart	Convidado	67	2022-05-13 23:24:52.708	2022-05-12 03:59:09.815	2022-05-13 23:24:52.71
665	André Luis Sovernigo	andre luis sovernigo	Convidado	64	2022-05-13 23:26:08.117	2022-05-12 03:59:09.79	2022-05-13 23:26:08.119
670	Leila Sobernigo	leila sobernigo	Acompanhante	64	2022-05-13 23:26:17.635	2022-05-12 03:59:09.79	2022-05-13 23:26:17.637
671	Silvana Marisete Da Silva Zanuzzi	silvana marisete da silva zanuzzi	Acompanhante	64	2022-05-13 23:26:37.386	2022-05-12 03:59:09.79	2022-05-13 23:26:37.388
666	Silvano Zanuzzi	silvano zanuzzi	Convidado	64	2022-05-13 23:26:43.227	2022-05-12 03:59:09.79	2022-05-13 23:26:43.228
694	Everaldo Gobbi	everaldo gobbi	Convidado	67	2022-05-13 23:28:31.25	2022-05-12 03:59:09.815	2022-05-13 23:28:31.251
707	Geraldo Fianchi	geraldo fianchi	Convidado	68	2022-05-13 23:28:49.832	2022-05-12 03:59:09.822	2022-05-13 23:28:49.834
695	Ricardo Caleffi	ricardo caleffi	Convidado	67	2022-05-13 23:28:55.975	2022-05-12 03:59:09.815	2022-05-13 23:28:55.977
711	Danilo Fianchi	danilo fianchi	Acompanhante	68	2022-05-13 23:28:57.072	2022-05-12 03:59:09.822	2022-05-13 23:28:57.073
704	Gabriel Fianchi	gabriel fianchi	Convidado	68	2022-05-13 23:29:01.591	2022-05-12 03:59:09.822	2022-05-13 23:29:01.593
708	Paula Camylla Ramos Assis	paula camylla ramos assis	Acompanhante	68	2022-05-13 23:29:05.55	2022-05-12 03:59:09.822	2022-05-13 23:29:05.551
702	Carla Rejaine De Carvalho Caleffi	carla rejaine de carvalho caleffi	Acompanhante	67	2022-05-13 23:29:11.129	2022-05-12 03:59:09.815	2022-05-13 23:29:11.13
692	Rogério Antonio Toniazzo	rogerio antonio toniazzo	Convidado	67	2022-05-13 23:29:17.113	2022-05-12 03:59:09.815	2022-05-13 23:29:17.115
697	Simone Martins Freitas Toniazzo	simone martins freitas toniazzo	Acompanhante	67	2022-05-13 23:29:25.52	2022-05-12 03:59:09.815	2022-05-13 23:29:25.522
687	Armando Chaves De Morais	armando chaves de morais	Acompanhante	66	2022-05-13 23:29:27.165	2022-05-12 03:59:09.809	2022-05-13 23:29:27.167
655	Ideuzide Assis Da Silva	ideuzide assis da silva	Acompanhante	62	2022-05-13 23:35:10.338	2022-05-12 03:59:09.777	2022-05-13 23:35:10.34
658	Lorena Carvalho De Morais	lorena carvalho de morais	Convidado	63	2022-05-13 23:38:05.049	2022-05-12 03:59:09.783	2022-05-13 23:38:05.052
699	Leticia Toniazzo Gobbi	leticia toniazzo gobbi	Acompanhante	67	2022-05-13 23:38:14.283	2022-05-12 03:59:09.815	2022-05-13 23:38:14.284
701	Pedro Maia Reck	pedro maia reck	Acompanhante	67	2022-05-13 23:38:27.427	2022-05-12 03:59:09.815	2022-05-13 23:38:27.428
663	Fernando Inácio Cardoso	fernando inacio cardoso	Convidado	64	2022-05-13 23:40:04.647	2022-05-12 03:59:09.79	2022-05-13 23:40:04.649
667	Elineia Patricia Rezende	elineia patricia rezende	Acompanhante	64	2022-05-13 23:40:15.801	2022-05-12 03:59:09.79	2022-05-13 23:40:15.804
712	Esmarco Vaz Vieira Junior	esmarco vaz vieira junior	Convidado	69	2022-05-13 23:53:41.073	2022-05-12 03:59:09.828	2022-05-13 23:53:41.075
718	Isabela Rodrigues Oliveira Vieira	isabela rodrigues oliveira vieira	Acompanhante	69	2022-05-13 23:53:52.161	2022-05-12 03:59:09.828	2022-05-13 23:53:52.163
654	Suziele Bárbara Caetano	suziele barbara caetano	Acompanhante	62	2022-05-14 00:01:15.919	2022-05-12 03:59:09.777	2022-05-14 00:01:15.92
720	Willian Stallbaum	willian stallbaum	Acompanhante	69	2022-05-14 00:03:06.587	2022-05-12 03:59:09.828	2022-05-14 00:03:06.59
714	Maria Cristina Alves Stallbaum	maria cristina alves stallbaum	Convidado	69	2022-05-14 00:03:18.232	2022-05-12 03:59:09.828	2022-05-14 00:03:18.234
713	Aline Figueiredo De Castro	aline figueiredo de castro	Convidado	69	2022-05-14 00:03:22.216	2022-05-12 03:59:09.828	2022-05-14 00:03:22.218
719	Rene Ferreira Da Silva Filho	rene ferreira da silva filho	Acompanhante	69	2022-05-14 00:03:28.237	2022-05-12 03:59:09.828	2022-05-14 00:03:28.238
715	Debora Araujo Martins	debora araujo martins	Convidado	69	2022-05-14 00:03:32.258	2022-05-12 03:59:09.828	2022-05-14 00:03:32.259
677	Jenifer Watthier	jenifer watthier	Acompanhante	65	2022-05-14 00:11:28.979	2022-05-12 03:59:09.8	2022-05-14 00:11:28.981
678	Julia Elegda 10 Anos	julia elegda 10 anos	Acompanhante	65	2022-05-14 00:11:33.679	2022-05-12 03:59:09.8	2022-05-14 00:11:33.681
679	Mateus Elegda 8 Anos	mateus elegda 8 anos	Acompanhante	65	2022-05-14 00:11:36.88	2022-05-12 03:59:09.8	2022-05-14 00:11:36.882
680	Pedro Elegda 7 Anos	pedro elegda 7 anos	Acompanhante	65	2022-05-14 00:11:39.6	2022-05-12 03:59:09.8	2022-05-14 00:11:39.602
657	José Roberto Camozzi Filho	jose roberto camozzi filho	Convidado	63	2022-05-14 00:16:24.011	2022-05-12 03:59:09.783	2022-05-14 00:16:24.013
659	Mylene Camozzi	mylene camozzi	Acompanhante	63	2022-05-14 00:16:38.519	2022-05-12 03:59:09.783	2022-05-14 00:16:38.521
1192	Milka	milka	Convidado	200	2022-05-14 00:18:02.236	2022-05-14 00:17:45.436	2022-05-14 00:18:02.238
652	Cleyton Silveira Dos Santos	cleyton silveira dos santos	Acompanhante	62	2022-05-14 00:18:54.473	2022-05-12 03:59:09.777	2022-05-14 00:18:54.475
716	Dazirlan Assis Ferreira	dazirlan assis ferreira	Convidado	69	2022-05-14 00:55:07.759	2022-05-12 03:59:09.828	2022-05-14 00:55:07.761
682	Fernando Schoenberger	fernando schoenberger	Acompanhante	65	2022-05-14 01:12:51.111	2022-05-12 03:59:09.8	2022-05-14 01:12:51.114
683	Divina Marcia J. Ferreira	divina marcia j ferreira	Acompanhante	65	2022-05-14 01:12:58.218	2022-05-12 03:59:09.8	2022-05-14 01:12:58.22
722	Cleonice Aparecida Batista Da Silva	cleonice aparecida batista da silva	Acompanhante	69	\N	2022-05-12 03:59:09.828	2022-05-12 03:59:09.829
723	Raimundo Nonato Hermenegildo	raimundo nonato hermenegildo	Acompanhante	69	\N	2022-05-12 03:59:09.828	2022-05-12 03:59:09.829
724	Vitoria M Gomes De Lima	vitoria m gomes de lima	Convidado	70	\N	2022-05-12 03:59:09.835	2022-05-12 03:59:09.836
727	Genaldo De Lima Martins	genaldo de lima martins	Acompanhante	70	\N	2022-05-12 03:59:09.835	2022-05-12 03:59:09.836
730	Roberta Assis Silva De Mello	roberta assis silva de mello	Acompanhante	70	\N	2022-05-12 03:59:09.835	2022-05-12 03:59:09.836
732	Sebastião Naves	sebastiao naves	Acompanhante	70	\N	2022-05-12 03:59:09.835	2022-05-12 03:59:09.836
733	Jessica Milena Carvalho	jessica milena carvalho	Acompanhante	70	\N	2022-05-12 03:59:09.835	2022-05-12 03:59:09.836
737	Rosikeyla Moura Carvalho	rosikeyla moura carvalho	Convidado	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
738	Daniela Cruvinel	daniela cruvinel	Convidado	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
739	Banco Safra	banco safra	Convidado	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
740	Eric Ferreira Da Cunha	eric ferreira da cunha	Acompanhante	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
741	Marilene Das Dores Sobrinho Gomes Ferreira	marilene das dores sobrinho gomes ferreira	Acompanhante	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
742	Alvaro Gomes Ferreira	alvaro gomes ferreira	Acompanhante	71	\N	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
746	Stefane Soares De Almeida	stefane soares de almeida	Convidado	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
748	Murilo Ferreira Vilela	murilo ferreira vilela	Convidado	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
749	Elizangela Resplandes Faria	elizangela resplandes faria	Convidado	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
751	Hortencia Severino De Moraes	hortencia severino de moraes	Acompanhante	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
752	Renato Ferreira De Moraes Filho	renato ferreira de moraes filho	Acompanhante	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
754	Maurencir Marques Carvalho	maurencir marques carvalho	Acompanhante	72	\N	2022-05-12 03:59:09.849	2022-05-12 03:59:09.85
757	Vitor Luiz De Jesus	vitor luiz de jesus	Convidado	73	\N	2022-05-12 03:59:09.856	2022-05-12 03:59:09.857
758	Maria Cicera Rocha De Freitas	maria cicera rocha de freitas	Acompanhante	73	\N	2022-05-12 03:59:09.856	2022-05-12 03:59:09.857
759	Vanessa Da Silva Palandrani	vanessa da silva palandrani	Acompanhante	73	\N	2022-05-12 03:59:09.856	2022-05-12 03:59:09.857
760	Francilaine Regina Alves Silva	francilaine regina alves silva	Acompanhante	73	\N	2022-05-12 03:59:09.856	2022-05-12 03:59:09.857
766	Felipe Rizzardi	felipe rizzardi	Acompanhante	74	\N	2022-05-12 03:59:09.864	2022-05-12 03:59:09.864
767	Fabrício Rizzardi	fabricio rizzardi	Acompanhante	74	\N	2022-05-12 03:59:09.864	2022-05-12 03:59:09.864
769	Assio Henrique Bernardi	assio henrique bernardi	Acompanhante	74	\N	2022-05-12 03:59:09.864	2022-05-12 03:59:09.864
770	Barbara Fernandes Macedo	barbara fernandes macedo	Acompanhante	74	\N	2022-05-12 03:59:09.864	2022-05-12 03:59:09.864
771	Maria Ines Valiati	maria ines valiati	Convidado	75	\N	2022-05-12 03:59:09.873	2022-05-12 03:59:09.874
773	Joel Valiati	joel valiati	Convidado	75	\N	2022-05-12 03:59:09.873	2022-05-12 03:59:09.874
776	Leidiane Francisca Prado Valiati	leidiane francisca prado valiati	Acompanhante	75	\N	2022-05-12 03:59:09.874	2022-05-12 03:59:09.874
780	Lucas Cesar Gregorio Filgueira	lucas cesar gregorio filgueira	Convidado	76	\N	2022-05-12 03:59:09.886	2022-05-12 03:59:09.887
786	Thaua Junior Roggia Basso	thaua junior roggia basso	Acompanhante	76	\N	2022-05-12 03:59:09.887	2022-05-12 03:59:09.887
787	Beto Pazzinato( Vão Representantes)	beto pazzinato vao representantes	Convidado	77	\N	2022-05-12 03:59:09.897	2022-05-12 03:59:09.897
756	Sirlene De Fatima Nogueira Pereira	sirlene de fatima nogueira pereira	Convidado	73	2022-05-13 23:24:46.233	2022-05-12 03:59:09.856	2022-05-13 23:24:46.235
772	Junior Valiati	junior valiati	Convidado	75	2022-05-13 23:24:51.247	2022-05-12 03:59:09.873	2022-05-13 23:24:51.249
755	Clesio Furtado De Oliveira	clesio furtado de oliveira	Convidado	73	2022-05-13 23:24:54.753	2022-05-12 03:59:09.856	2022-05-13 23:24:54.755
777	Izabel Cristina Sgnorelli	izabel cristina sgnorelli	Acompanhante	75	2022-05-13 23:25:15.363	2022-05-12 03:59:09.874	2022-05-13 23:25:15.364
778	Luiz Sergio Pereira De Freitas	luiz sergio pereira de freitas	Convidado	76	2022-05-13 23:25:08.297	2022-05-12 03:59:09.886	2022-05-13 23:25:08.299
781	Nelionice Gonçalves Da Silva	nelionice goncalves da silva	Acompanhante	76	2022-05-13 23:25:25.753	2022-05-12 03:59:09.886	2022-05-13 23:25:25.761
774	Paulo Cezar Signorelli	paulo cezar signorelli	Convidado	75	2022-05-13 23:25:32.602	2022-05-12 03:59:09.873	2022-05-13 23:25:32.604
783	Isabela Pereira Gonçalves	isabela pereira goncalves	Acompanhante	76	2022-05-13 23:25:32.85	2022-05-12 03:59:09.886	2022-05-13 23:25:32.852
782	Leticia Pereira Gonçalves	leticia pereira goncalves	Acompanhante	76	2022-05-13 23:25:36.304	2022-05-12 03:59:09.886	2022-05-13 23:25:36.306
784	Vitor Rodrigues Silva	vitor rodrigues silva	Acompanhante	76	2022-05-13 23:25:39.264	2022-05-12 03:59:09.886	2022-05-13 23:25:39.265
762	Gilmar Rizzardi	gilmar rizzardi	Convidado	74	2022-05-13 23:25:57.924	2022-05-12 03:59:09.864	2022-05-13 23:25:57.925
747	Betania Ferreira De Araujo	betania ferreira de araujo	Convidado	72	2022-05-13 23:26:21.848	2022-05-12 03:59:09.849	2022-05-13 23:26:21.856
763	Moacir Bernardi	moacir bernardi	Convidado	74	2022-05-13 23:26:57.239	2022-05-12 03:59:09.864	2022-05-13 23:26:57.24
768	Rose Mary Carneiro	rose mary carneiro	Acompanhante	74	2022-05-13 23:27:08.878	2022-05-12 03:59:09.864	2022-05-13 23:27:08.88
753	Marivane Carvalho De Assis	marivane carvalho de assis	Acompanhante	72	2022-05-13 23:28:07.106	2022-05-12 03:59:09.849	2022-05-13 23:28:07.107
731	Rafael Mello De Lima Martins	rafael mello de lima martins	Acompanhante	70	2022-05-13 23:30:28.102	2022-05-12 03:59:09.835	2022-05-13 23:30:28.104
726	José Ricardo Lopes Resende	jose ricardo lopes resende	Convidado	70	2022-05-13 23:32:41.152	2022-05-12 03:59:09.835	2022-05-13 23:32:41.153
736	Janice Evangelista De Morais	janice evangelista de morais	Acompanhante	70	2022-05-13 23:32:51.025	2022-05-12 03:59:09.835	2022-05-13 23:32:51.027
761	Marlos Valente Melo	marlos valente melo	Convidado	74	2022-05-13 23:36:12.753	2022-05-12 03:59:09.864	2022-05-13 23:36:12.755
764	Gabriel Valente Moraes Melo	gabriel valente moraes melo	Acompanhante	74	2022-05-13 23:36:22.037	2022-05-12 03:59:09.864	2022-05-13 23:36:22.039
728	Paulo Henrique Ferreira Queiroz,	paulo henrique ferreira queiroz	Acompanhante	70	2022-05-13 23:46:58.801	2022-05-12 03:59:09.835	2022-05-13 23:46:58.802
729	Raquel Mello De Lima Martins,	raquel mello de lima martins	Acompanhante	70	2022-05-13 23:47:09.028	2022-05-12 03:59:09.835	2022-05-13 23:47:09.03
779	Gustavo Henrique Gomes Vilela	gustavo henrique gomes vilela	Convidado	76	2022-05-13 23:52:15.886	2022-05-12 03:59:09.886	2022-05-13 23:52:15.888
785	Laura Resende Lima	laura resende lima	Acompanhante	76	2022-05-13 23:52:20.358	2022-05-12 03:59:09.886	2022-05-13 23:52:20.359
734	Wanessa Prado Mendes	wanessa prado mendes	Acompanhante	70	2022-05-14 00:02:27.808	2022-05-12 03:59:09.835	2022-05-14 00:02:27.81
735	Aloisio Moura Alves	aloisio moura alves	Acompanhante	70	2022-05-14 00:02:54.349	2022-05-12 03:59:09.835	2022-05-14 00:02:54.351
743	Mirian Carla	mirian carla	Acompanhante	71	2022-05-14 00:27:48.742	2022-05-12 03:59:09.842	2022-05-14 00:27:48.744
744	João Figueiredo - Esposo Mirian	joao figueiredo esposo mirian	Acompanhante	71	2022-05-14 00:27:55.296	2022-05-12 03:59:09.842	2022-05-14 00:27:55.298
745	Ceane Guimaraes Furquim	ceane guimaraes furquim	Convidado	72	2022-05-14 00:27:55.636	2022-05-12 03:59:09.849	2022-05-14 00:27:55.637
750	Rodrigo Leão Do Carmo	rodrigo leao do carmo	Acompanhante	72	2022-05-14 00:28:03.305	2022-05-12 03:59:09.849	2022-05-14 00:28:03.308
721	Rafaela C A Mancini Ferreira	rafaela c a mancini ferreira	Acompanhante	69	2022-05-14 00:55:23.352	2022-05-12 03:59:09.828	2022-05-14 00:55:23.356
788	Paulo Henrique Pazzinato	paulo henrique pazzinato	Convidado	77	2022-05-14 01:10:53.811	2022-05-12 03:59:09.897	2022-05-14 01:10:53.812
796	José Vicente Mantelli Pazinatto	jose vicente mantelli pazinatto	Acompanhante	77	\N	2022-05-12 03:59:09.897	2022-05-12 03:59:09.897
805	Marco Cava - Vão Representantes	marco cava vao representantes	Convidado	79	\N	2022-05-12 03:59:09.911	2022-05-12 03:59:09.912
809	Uelbio Oliveira Da Silva	uelbio oliveira da silva	Acompanhante	79	\N	2022-05-12 03:59:09.911	2022-05-12 03:59:09.912
810	Jussara Alves De Melo	jussara alves de melo	Acompanhante	79	\N	2022-05-12 03:59:09.911	2022-05-12 03:59:09.912
811	Cristiane Lopes Rezende	cristiane lopes rezende	Acompanhante	79	\N	2022-05-12 03:59:09.911	2022-05-12 03:59:09.912
815	Marcilene Pereira	marcilene pereira	Convidado	80	\N	2022-05-12 03:59:09.917	2022-05-12 03:59:09.918
819	Gleiber Gomes Da Silva	gleiber gomes da silva	Acompanhante	80	\N	2022-05-12 03:59:09.918	2022-05-12 03:59:09.918
825	Ricardo Machado Carvalho	ricardo machado carvalho	Convidado	81	\N	2022-05-12 03:59:09.923	2022-05-12 03:59:09.924
830	Joana Catarina Rodrigues Dias	joana catarina rodrigues dias	Acompanhante	81	\N	2022-05-12 03:59:09.923	2022-05-12 03:59:09.924
832	Cartório	cartorio	Convidado	82	\N	2022-05-12 03:59:09.931	2022-05-12 03:59:09.932
834	Patricya Fernanda Alves Freitas	patricya fernanda alves freitas	Acompanhante	82	\N	2022-05-12 03:59:09.931	2022-05-12 03:59:09.932
835	Cecilia Alves Freitas 5 Anos	cecilia alves freitas 5 anos	Acompanhante	82	\N	2022-05-12 03:59:09.931	2022-05-12 03:59:09.932
843	Lindomar Netto Rg 4593116	lindomar netto rg 4593116	Acompanhante	82	\N	2022-05-12 03:59:09.931	2022-05-12 03:59:09.932
845	Gabriela De Carvalho Vilela	gabriela de carvalho vilela	Convidado	83	\N	2022-05-12 03:59:09.938	2022-05-12 03:59:09.939
847	Neldo Koch - Vão Representantes	neldo koch vao representantes	Convidado	83	\N	2022-05-12 03:59:09.938	2022-05-12 03:59:09.939
848	Fernando Menezes Carvalho	fernando menezes carvalho	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
849	Ciro Vilela Carvalho	ciro vilela carvalho	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
851	Eni Koch Lima	eni koch lima	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
852	Wander Paulo Matias Lima	wander paulo matias lima	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
853	Goevana K Lima	goevana k lima	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
854	Guilherme Koch Lima	guilherme koch lima	Acompanhante	83	\N	2022-05-12 03:59:09.939	2022-05-12 03:59:09.939
855	Celso Schereiber	celso schereiber	Convidado	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
856	Ivo Schereiber 25	ivo schereiber 25	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
857	Ivone Schereiber	ivone schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
858	Celso Schereiber	celso schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
859	Silvia Schereiber	silvia schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
860	Stefanny Schereiber,	stefanny schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
814	Fernanda Carvalho Parreira Gouveia	fernanda carvalho parreira gouveia	Acompanhante	79	2022-05-13 23:24:18.335	2022-05-12 03:59:09.911	2022-05-13 23:24:18.337
807	Luis Renato Lopes Rezende	luis renato lopes rezende	Convidado	79	2022-05-13 23:24:24.59	2022-05-12 03:59:09.911	2022-05-13 23:24:24.592
812	Leonardo Lopez Rezende	leonardo lopez rezende	Acompanhante	79	2022-05-13 23:24:28.41	2022-05-12 03:59:09.911	2022-05-13 23:24:28.412
806	Renato Ferreira Rezende	renato ferreira rezende	Convidado	79	2022-05-13 23:24:31.871	2022-05-12 03:59:09.911	2022-05-13 23:24:31.875
826	Murilo Mantelli Oliveira	murilo mantelli oliveira	Convidado	81	2022-05-13 23:30:48.274	2022-05-12 03:59:09.923	2022-05-13 23:30:48.276
818	Elisangela Furtado Cardoso	elisangela furtado cardoso	Convidado	80	2022-05-13 23:31:30.67	2022-05-12 03:59:09.918	2022-05-13 23:31:30.672
821	Juliana Furtado Cardoso	juliana furtado cardoso	Acompanhante	80	2022-05-13 23:31:43.193	2022-05-12 03:59:09.918	2022-05-13 23:31:43.195
822	Hermes Da Silva Silveira	hermes da silva silveira	Acompanhante	80	2022-05-13 23:31:47.173	2022-05-12 03:59:09.918	2022-05-13 23:31:47.175
820	Adriana Regina Assis De Lima	adriana regina assis de lima	Acompanhante	80	2022-05-13 23:33:09.761	2022-05-12 03:59:09.918	2022-05-13 23:33:09.763
795	Maria Eduarda Mantelli	maria eduarda mantelli	Acompanhante	77	2022-05-13 23:33:29.47	2022-05-12 03:59:09.897	2022-05-13 23:33:29.471
839	Carita Rg 1.722200	carita rg 1722200	Acompanhante	82	2022-05-13 23:33:30.198	2022-05-12 03:59:09.931	2022-05-13 23:33:30.199
841	Gubio	gubio	Acompanhante	82	2022-05-13 23:33:39.879	2022-05-12 03:59:09.931	2022-05-13 23:33:39.881
842	Danubia	danubia	Acompanhante	82	2022-05-13 23:33:43.941	2022-05-12 03:59:09.931	2022-05-13 23:33:43.942
840	Robério Rg 548837	roberio rg 548837	Acompanhante	82	2022-05-13 23:33:57.194	2022-05-12 03:59:09.931	2022-05-13 23:33:57.196
817	Wilson Gonçalves De Oliveira Filho	wilson goncalves de oliveira filho	Convidado	80	2022-05-13 23:34:06.134	2022-05-12 03:59:09.918	2022-05-13 23:34:06.135
808	Nilza Alves Macedo Assis	nilza alves macedo assis	Acompanhante	79	2022-05-13 23:35:54.834	2022-05-12 03:59:09.911	2022-05-13 23:35:54.838
804	Clodoaldo De Assis Costa	clodoaldo de assis costa	Convidado	79	2022-05-13 23:36:04.448	2022-05-12 03:59:09.911	2022-05-13 23:36:04.449
791	Jheison Toigo	jheison toigo	Acompanhante	77	2022-05-13 23:44:21.957	2022-05-12 03:59:09.897	2022-05-13 23:44:21.959
833	Poliana Alves De Moraes	poliana alves de moraes	Convidado	82	2022-05-13 23:46:50.931	2022-05-12 03:59:09.931	2022-05-13 23:46:50.933
844	Robson Silva Nunes	robson silva nunes	Acompanhante	82	2022-05-13 23:46:59.65	2022-05-12 03:59:09.931	2022-05-13 23:46:59.652
838	Laylla Aparecida Alves Freitas	laylla aparecida alves freitas	Acompanhante	82	2022-05-13 23:52:05.137	2022-05-12 03:59:09.931	2022-05-13 23:52:05.139
837	Rafael Alves De Sá	rafael alves de sa	Acompanhante	82	2022-05-13 23:52:24.048	2022-05-12 03:59:09.931	2022-05-13 23:52:24.05
836	Hugo Alves Soria	hugo alves soria	Acompanhante	82	2022-05-13 23:52:46.361	2022-05-12 03:59:09.931	2022-05-13 23:52:46.362
816	Iva Pereira Da Silva	iva pereira da silva	Convidado	80	2022-05-13 23:54:48.258	2022-05-12 03:59:09.918	2022-05-13 23:54:48.259
823	Julierni Peixoto De Sousa Abreu	julierni peixoto de sousa abreu	Convidado	81	2022-05-14 00:00:51.034	2022-05-12 03:59:09.923	2022-05-14 00:00:51.036
827	Camila Clara Ribeiro Sousa	camila clara ribeiro sousa	Acompanhante	81	2022-05-14 00:01:00.904	2022-05-12 03:59:09.923	2022-05-14 00:01:00.906
824	Luiz Firmino Da Silva	luiz firmino da silva	Convidado	81	2022-05-14 00:01:50.696	2022-05-12 03:59:09.923	2022-05-14 00:01:50.698
829	Ondeide Maria P. Da Silva	ondeide maria p da silva	Acompanhante	81	2022-05-14 00:02:41.788	2022-05-12 03:59:09.923	2022-05-14 00:02:41.79
798	Marcelo Maia De Assis	marcelo maia de assis	Convidado	78	2022-05-14 00:06:08.328	2022-05-12 03:59:09.904	2022-05-14 00:06:08.33
802	Alessandra Maia	alessandra maia	Acompanhante	78	2022-05-14 00:06:16.671	2022-05-12 03:59:09.904	2022-05-14 00:06:16.672
850	Nara Rubia Carvalho	nara rubia carvalho	Acompanhante	83	2022-05-14 00:07:49.922	2022-05-12 03:59:09.939	2022-05-14 00:07:49.924
846	Leandro De Carvalho Vilela	leandro de carvalho vilela	Convidado	83	2022-05-14 00:07:58.467	2022-05-12 03:59:09.938	2022-05-14 00:07:58.468
797	Fabio Fernandes	fabio fernandes	Convidado	78	2022-05-14 00:24:07.398	2022-05-12 03:59:09.904	2022-05-14 00:24:07.4
800	Aldana	aldana	Acompanhante	78	2022-05-14 00:24:17.851	2022-05-12 03:59:09.904	2022-05-14 00:24:17.853
801	Vitor Almeida Fagundes	vitor almeida fagundes	Acompanhante	78	2022-05-14 00:24:21.949	2022-05-12 03:59:09.904	2022-05-14 00:24:21.951
803	Jose André Carvalho Santos	jose andre carvalho santos	Acompanhante	78	2022-05-14 00:46:20.886	2022-05-12 03:59:09.904	2022-05-14 00:46:20.888
799	Amanda Fagundes	amanda fagundes	Convidado	78	2022-05-14 00:46:30.159	2022-05-12 03:59:09.904	2022-05-14 00:46:30.161
793	João Victor Pazzinato	joao victor pazzinato	Acompanhante	77	2022-05-14 01:54:32.262	2022-05-12 03:59:09.897	2022-05-14 01:54:32.264
794	Heloisa Guimaraes Pazzinato	heloisa guimaraes pazzinato	Acompanhante	77	2022-05-14 01:54:41.813	2022-05-12 03:59:09.897	2022-05-14 01:54:41.814
861	Michele Barbosa Dos Santos	michele barbosa dos santos	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
862	Guilherme Barbosa Schereiber	guilherme barbosa schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
863	Julia Schereiber 9 Anos	julia schereiber 9 anos	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
864	Arthur Schereiber	arthur schereiber	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
865	Erasmo Carlos De Sousa	erasmo carlos de sousa	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
866	Edileli Barbosa Do Santos	edileli barbosa do santos	Acompanhante	84	\N	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
868	Sebastião Silveira Goulart	sebastiao silveira goulart	Convidado	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
870	Murilo Luis Monteiro	murilo luis monteiro	Convidado	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
872	Vera Lucia Sonego Goulart	vera lucia sonego goulart	Acompanhante	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
873	Lucrécia Elias De Assis	lucrecia elias de assis	Acompanhante	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
874	Layla Patrycia Belasco Habes	layla patrycia belasco habes	Acompanhante	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
875	Maria Haber Monteiro	maria haber monteiro	Acompanhante	85	\N	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
876	Magnos Witte	magnos witte	Convidado	86	\N	2022-05-12 03:59:09.959	2022-05-12 03:59:09.959
881	Eliane Witte	eliane witte	Acompanhante	86	\N	2022-05-12 03:59:09.959	2022-05-12 03:59:09.959
882	Lucas	lucas	Acompanhante	86	\N	2022-05-12 03:59:09.959	2022-05-12 03:59:09.959
883	Luan	luan	Acompanhante	86	\N	2022-05-12 03:59:09.959	2022-05-12 03:59:09.959
889	Samuel Fraga De Assis	samuel fraga de assis	Convidado	87	\N	2022-05-12 03:59:09.971	2022-05-12 03:59:09.971
892	Mariana Cardoso Marques	mariana cardoso marques	Convidado	87	\N	2022-05-12 03:59:09.971	2022-05-12 03:59:09.971
893	Cristiana Patricia Artmann	cristiana patricia artmann	Acompanhante	87	\N	2022-05-12 03:59:09.971	2022-05-12 03:59:09.971
894	Carlos Augusto Lima De Moraes	carlos augusto lima de moraes	Acompanhante	87	\N	2022-05-12 03:59:09.971	2022-05-12 03:59:09.971
897	Diego Herculano Marques	diego herculano marques	Acompanhante	87	\N	2022-05-12 03:59:09.971	2022-05-12 03:59:09.971
905	Divina Conceição Vilasboa De Oliveira	divina conceicao vilasboa de oliveira	Acompanhante	88	\N	2022-05-12 03:59:09.978	2022-05-12 03:59:09.979
907	João Thiago Leal Neto	joao thiago leal neto	Convidado	89	\N	2022-05-12 03:59:09.985	2022-05-12 03:59:09.985
908	Tulio Eduardo Costa De Oliveira	tulio eduardo costa de oliveira	Convidado	89	\N	2022-05-12 03:59:09.985	2022-05-12 03:59:09.985
910	Tássia Gabriela Costa De Oliveira	tassia gabriela costa de oliveira	Acompanhante	89	\N	2022-05-12 03:59:09.985	2022-05-12 03:59:09.985
911	Marcela Nantes Martins Lemes	marcela nantes martins lemes	Acompanhante	89	\N	2022-05-12 03:59:09.985	2022-05-12 03:59:09.985
918	Rosa Martins	rosa martins	Convidado	90	\N	2022-05-12 03:59:09.992	2022-05-12 03:59:09.993
927	Jaime Elias De Assis	jaime elias de assis	Convidado	91	\N	2022-05-12 03:59:09.999	2022-05-12 03:59:10
900	Ronaldo Logstadt	ronaldo logstadt	Convidado	88	2022-05-13 23:31:12.396	2022-05-12 03:59:09.978	2022-05-13 23:31:12.398
906	Sonia Maria Petla Logstadt	sonia maria petla logstadt	Acompanhante	88	2022-05-13 23:31:18.801	2022-05-12 03:59:09.978	2022-05-13 23:31:18.803
924	Vania Florenço Nunes	vania florenco nunes	Acompanhante	90	2022-05-13 23:34:35.872	2022-05-12 03:59:09.992	2022-05-13 23:34:35.873
920	Jaqueline Correira Nunes	jaqueline correira nunes	Convidado	90	2022-05-13 23:34:45.1	2022-05-12 03:59:09.992	2022-05-13 23:34:45.101
890	Marcio Queiroz Da Silva	marcio queiroz da silva	Convidado	87	2022-05-13 23:36:15.598	2022-05-12 03:59:09.971	2022-05-13 23:36:15.599
888	Felipe Melo Queiroz	felipe melo queiroz	Convidado	87	2022-05-13 23:36:22.721	2022-05-12 03:59:09.971	2022-05-13 23:36:22.722
895	Vanessa Melo Oliveira	vanessa melo oliveira	Acompanhante	87	2022-05-13 23:36:25.06	2022-05-12 03:59:09.971	2022-05-13 23:36:25.063
880	Nei Coelho Alves	nei coelho alves	Convidado	86	2022-05-13 23:37:11.466	2022-05-12 03:59:09.959	2022-05-13 23:37:11.468
887	Ajax Dantas	ajax dantas	Convidado	87	2022-05-13 23:42:00.11	2022-05-12 03:59:09.971	2022-05-13 23:42:00.112
878	Francielle Da Silveira Prado	francielle da silveira prado	Convidado	86	2022-05-13 23:43:42.335	2022-05-12 03:59:09.959	2022-05-13 23:43:42.337
885	Eula Abreu Moraes	eula abreu moraes	Acompanhante	86	2022-05-13 23:43:50.264	2022-05-12 03:59:09.959	2022-05-13 23:43:50.265
898	Urbano Batista	urbano batista	Convidado	88	2022-05-13 23:46:00.709	2022-05-12 03:59:09.978	2022-05-13 23:46:00.711
904	Dhandara Cardoso Lima	dhandara cardoso lima	Acompanhante	88	2022-05-13 23:46:10.352	2022-05-12 03:59:09.978	2022-05-13 23:46:10.354
901	Cleonice Gomes	cleonice gomes	Acompanhante	88	2022-05-13 23:46:16.673	2022-05-12 03:59:09.978	2022-05-13 23:46:16.675
903	Ana Paula Gomes Parreira	ana paula gomes parreira	Acompanhante	88	2022-05-13 23:46:20.433	2022-05-12 03:59:09.978	2022-05-13 23:46:20.435
902	Lucas Gomes Parreira	lucas gomes parreira	Acompanhante	88	2022-05-13 23:46:26.348	2022-05-12 03:59:09.978	2022-05-13 23:46:26.351
867	Ricardo Goulart	ricardo goulart	Convidado	85	2022-05-13 23:47:18.503	2022-05-12 03:59:09.952	2022-05-13 23:47:18.505
891	Daniele Melo Oliveira	daniele melo oliveira	Convidado	87	2022-05-13 23:50:10.28	2022-05-12 03:59:09.971	2022-05-13 23:50:10.282
896	Welton Ramos De Oliveira	welton ramos de oliveira	Acompanhante	87	2022-05-13 23:50:21.523	2022-05-12 03:59:09.971	2022-05-13 23:50:21.525
879	Vinicius Ribeiro Araujo	vinicius ribeiro araujo	Convidado	86	2022-05-13 23:57:55.696	2022-05-12 03:59:09.959	2022-05-13 23:57:55.698
919	Tomas Robson Bernardes Dos Santos	tomas robson bernardes dos santos	Convidado	90	2022-05-14 00:05:36.819	2022-05-12 03:59:09.992	2022-05-14 00:05:36.821
922	Dilma Alves Da Silva	dilma alves da silva	Acompanhante	90	2022-05-14 00:05:48.292	2022-05-12 03:59:09.992	2022-05-14 00:05:48.293
923	Douglas Alves Da Cruz	douglas alves da cruz	Acompanhante	90	2022-05-14 00:05:52.124	2022-05-12 03:59:09.992	2022-05-14 00:05:52.125
877	Julio Weidder Rodrigues	julio weidder rodrigues	Convidado	86	2022-05-14 00:06:29.478	2022-05-12 03:59:09.959	2022-05-14 00:06:29.48
928	Diego Duarte Dos Santos	diego duarte dos santos	Convidado	91	2022-05-14 00:06:36.844	2022-05-12 03:59:09.999	2022-05-14 00:06:36.846
884	Jacqueline Balz	jacqueline balz	Acompanhante	86	2022-05-14 00:06:39.311	2022-05-12 03:59:09.959	2022-05-14 00:06:39.313
926	Edmar Duarte Santos	edmar duarte santos	Convidado	91	2022-05-14 00:11:03.785	2022-05-12 03:59:09.999	2022-05-14 00:11:03.787
931	Ana Clara Duarte	ana clara duarte	Acompanhante	91	2022-05-14 00:11:21.521	2022-05-12 03:59:09.999	2022-05-14 00:11:21.523
932	Valentina Duarte	valentina duarte	Acompanhante	91	2022-05-14 00:11:30.152	2022-05-12 03:59:09.999	2022-05-14 00:11:30.154
925	Hortencia Oliveira Santos	hortencia oliveira santos	Convidado	91	2022-05-14 01:08:56.086	2022-05-12 03:59:09.999	2022-05-14 01:08:56.087
929	Alisson Simoes De Souza	alisson simoes de souza	Acompanhante	91	2022-05-14 01:09:06.812	2022-05-12 03:59:09.999	2022-05-14 01:09:06.814
917	Jessica Alves Dos Santos	jessica alves dos santos	Convidado	90	2022-05-14 01:17:50.019	2022-05-12 03:59:09.992	2022-05-14 01:17:50.021
921	Luzia Cristina Dantas	luzia cristina dantas	Acompanhante	90	2022-05-14 01:18:23.087	2022-05-12 03:59:09.992	2022-05-14 01:18:23.089
914	Lara Priscilla Sabini De Oliveira	lara priscilla sabini de oliveira	Acompanhante	89	2022-05-14 02:25:20.937	2022-05-12 03:59:09.985	2022-05-14 02:25:20.938
912	Joyce Costa Sabini	joyce costa sabini	Acompanhante	89	2022-05-14 02:25:24.571	2022-05-12 03:59:09.985	2022-05-14 02:25:24.573
916	Brener Rezende Pereira	brener rezende pereira	Acompanhante	89	2022-05-14 02:25:36.241	2022-05-12 03:59:09.985	2022-05-14 02:25:36.243
913	Paulo Ricardo Sabini De Oliveira	paulo ricardo sabini de oliveira	Acompanhante	89	2022-05-14 02:25:44.047	2022-05-12 03:59:09.985	2022-05-14 02:25:44.048
915	Tarcisio Inácio De Assis Filho	tarcisio inacio de assis filho	Acompanhante	89	2022-05-14 02:25:45.497	2022-05-12 03:59:09.985	2022-05-14 02:25:45.498
933	Maraiza Maria Do Santo	maraiza maria do santo	Acompanhante	91	\N	2022-05-12 03:59:09.999	2022-05-12 03:59:10
935	Selvino Schneider	selvino schneider	Convidado	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
938	Ernesto Mantelli	ernesto mantelli	Convidado	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
939	Andressa Schneider	andressa schneider	Convidado	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
940	Nelve Marlene Schneider	nelve marlene schneider	Acompanhante	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
942	Raquel Vitor Ferreira	raquel vitor ferreira	Acompanhante	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
943	Ormilando Furtado Araujo	ormilando furtado araujo	Acompanhante	92	\N	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
944	Alessandro Rio Paraiso	alessandro rio paraiso	Convidado	93	\N	2022-05-12 03:59:10.014	2022-05-12 03:59:10.014
954	Sebastião Pereira Da Silva	sebastiao pereira da silva	Convidado	94	\N	2022-05-12 03:59:10.021	2022-05-12 03:59:10.021
960	Rodrigo Silva Sousa	rodrigo silva sousa	Acompanhante	94	\N	2022-05-12 03:59:10.021	2022-05-12 03:59:10.021
961	Tomazia Aparecida Da Silva	tomazia aparecida da silva	Acompanhante	94	\N	2022-05-12 03:59:10.021	2022-05-12 03:59:10.021
962	Durval Moraes Carvalho	durval moraes carvalho	Convidado	95	\N	2022-05-12 03:59:10.027	2022-05-12 03:59:10.028
965	Beatriz Carneiro Salles	beatriz carneiro salles	Acompanhante	95	\N	2022-05-12 03:59:10.027	2022-05-12 03:59:10.028
967	Silvanio Martins De Leles	silvanio martins de leles	Convidado	96	\N	2022-05-12 03:59:10.034	2022-05-12 03:59:10.035
971	Wender Delmiro Da Silva	wender delmiro da silva	Convidado	96	\N	2022-05-12 03:59:10.034	2022-05-12 03:59:10.035
972	Selma Regina Borges M De Leles	selma regina borges m de leles	Acompanhante	96	\N	2022-05-12 03:59:10.034	2022-05-12 03:59:10.035
973	Helena Regina Vieira Assis	helena regina vieira assis	Acompanhante	96	\N	2022-05-12 03:59:10.034	2022-05-12 03:59:10.035
977	Deloci Ragagnin	deloci ragagnin	Convidado	97	\N	2022-05-12 03:59:10.043	2022-05-12 03:59:10.044
978	Mariana Rezende Naufal	mariana rezende naufal	Acompanhante	97	\N	2022-05-12 03:59:10.043	2022-05-12 03:59:10.044
979	Milena Rezende Naufal	milena rezende naufal	Acompanhante	97	\N	2022-05-12 03:59:10.043	2022-05-12 03:59:10.044
997	Matheus Augusto Lima Rezende	matheus augusto lima rezende	Convidado	100	\N	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
999	Rochester Bruno	rochester bruno	Convidado	100	\N	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
1001	Ana Paula Bendeer	ana paula bendeer	Acompanhante	100	\N	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
1003	Esposa Do Rochester Bruno	esposa do rochester bruno	Acompanhante	100	\N	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
998	Luis Carlos Nunes	luis carlos nunes	Convidado	100	2022-05-13 23:26:52.645	2022-05-12 03:59:10.063	2022-05-13 23:26:52.647
1002	Luzia Elane Da Silva Nunes	luzia elane da silva nunes	Acompanhante	100	2022-05-13 23:27:06.484	2022-05-12 03:59:10.063	2022-05-13 23:27:06.487
983	Elane Carvalho Dias	elane carvalho dias	Acompanhante	98	2022-05-13 23:27:11.63	2022-05-12 03:59:10.05	2022-05-13 23:27:11.632
970	Claudinei Ferreira Da Silva	claudinei ferreira da silva	Convidado	96	2022-05-13 23:27:58.115	2022-05-12 03:59:10.034	2022-05-13 23:27:58.117
969	Alessandro Cristina Tosta	alessandro cristina tosta	Convidado	96	2022-05-13 23:28:23.37	2022-05-12 03:59:10.034	2022-05-13 23:28:23.373
968	Marciel Borba Rodrigues	marciel borba rodrigues	Convidado	96	2022-05-13 23:28:43.049	2022-05-12 03:59:10.034	2022-05-13 23:28:43.051
956	Nielma M A Ferreira	nielma m a ferreira	Acompanhante	94	2022-05-13 23:29:57.691	2022-05-12 03:59:10.021	2022-05-13 23:29:57.693
946	Dinamar Pereira	dinamar pereira	Acompanhante	93	2022-05-13 23:30:23.781	2022-05-12 03:59:10.014	2022-05-13 23:30:23.782
955	Sebastiao Miranda De Sousa	sebastiao miranda de sousa	Acompanhante	94	2022-05-13 23:30:29.138	2022-05-12 03:59:10.021	2022-05-13 23:30:29.14
947	Anita Xavier	anita xavier	Acompanhante	93	2022-05-13 23:30:34.819	2022-05-12 03:59:10.014	2022-05-13 23:30:34.82
957	Nicaio G A Ferreira	nicaio g a ferreira	Acompanhante	94	2022-05-13 23:30:35.536	2022-05-12 03:59:10.021	2022-05-13 23:30:35.538
958	Nicolly Alves Ferreira (criança)	nicolly alves ferreira crianca	Acompanhante	94	2022-05-13 23:30:51.124	2022-05-12 03:59:10.021	2022-05-13 23:30:51.127
963	Liane Carneiro Carvalho	liane carneiro carvalho	Acompanhante	95	2022-05-13 23:31:55.266	2022-05-12 03:59:10.027	2022-05-13 23:31:55.269
966	Luzia Carneiro Carvalho	luzia carneiro carvalho	Acompanhante	95	2022-05-13 23:32:09.269	2022-05-12 03:59:10.027	2022-05-13 23:32:09.27
952	Rodrigo Silva Sousa	rodrigo silva sousa	Convidado	94	2022-05-13 23:34:13.415	2022-05-12 03:59:10.02	2022-05-13 23:34:13.417
953	José Schossler	jose schossler	Convidado	94	2022-05-13 23:34:24.492	2022-05-12 03:59:10.02	2022-05-13 23:34:24.494
980	Larissa Vieira De Paula	larissa vieira de paula	Acompanhante	97	2022-05-13 23:35:01.037	2022-05-12 03:59:10.043	2022-05-13 23:35:01.038
981	Juzilane Carvalho Dias	juzilane carvalho dias	Convidado	98	2022-05-13 23:36:00.413	2022-05-12 03:59:10.05	2022-05-13 23:36:00.415
982	Allan Kardec Dias	allan kardec dias	Convidado	98	2022-05-13 23:36:11.531	2022-05-12 03:59:10.05	2022-05-13 23:36:11.533
985	Alice Carvalho Dias	alice carvalho dias	Acompanhante	98	2022-05-13 23:36:15.256	2022-05-12 03:59:10.05	2022-05-13 23:36:15.257
984	Maria Alice Carvalho Dias	maria alice carvalho dias	Acompanhante	98	2022-05-13 23:36:17.066	2022-05-12 03:59:10.05	2022-05-13 23:36:17.068
936	Alexandre Schneider	alexandre schneider	Convidado	92	2022-05-13 23:36:39.242	2022-05-12 03:59:10.006	2022-05-13 23:36:39.244
941	Jessika Belizario De Souza	jessika belizario de souza	Acompanhante	92	2022-05-13 23:36:55.708	2022-05-12 03:59:10.006	2022-05-13 23:36:55.71
937	Alexsandro Schneider	alexsandro schneider	Convidado	92	2022-05-13 23:37:01.349	2022-05-12 03:59:10.006	2022-05-13 23:37:01.351
974	Lorena Da Silva Franco	lorena da silva franco	Convidado	97	2022-05-13 23:43:18.135	2022-05-12 03:59:10.043	2022-05-13 23:43:18.137
1000	Gabriel Silva Pinheiro Lopes	gabriel silva pinheiro lopes	Convidado	100	2022-05-13 23:43:56.356	2022-05-12 03:59:10.063	2022-05-13 23:43:56.357
988	Luzia Marques Dos Santos	luzia marques dos santos	Convidado	99	2022-05-13 23:44:04.322	2022-05-12 03:59:10.056	2022-05-13 23:44:04.324
996	Sebastião Fernando Alves Silva	sebastiao fernando alves silva	Acompanhante	99	2022-05-13 23:44:19.217	2022-05-12 03:59:10.056	2022-05-13 23:44:19.218
993	Joyce Thamires Alves Marques	joyce thamires alves marques	Acompanhante	99	2022-05-13 23:44:30.471	2022-05-12 03:59:10.056	2022-05-13 23:44:30.473
992	Laura Marques Maia	laura marques maia	Acompanhante	99	2022-05-13 23:44:38.334	2022-05-12 03:59:10.056	2022-05-13 23:44:38.336
989	Robson Silva Prado	robson silva prado	Acompanhante	99	2022-05-13 23:44:40.839	2022-05-12 03:59:10.056	2022-05-13 23:44:40.841
986	Luciana Marques Dos Santos	luciana marques dos santos	Convidado	99	2022-05-13 23:44:45.028	2022-05-12 03:59:10.056	2022-05-13 23:44:45.029
987	Luciene Marques Gomes	luciene marques gomes	Convidado	99	2022-05-13 23:44:49.38	2022-05-12 03:59:10.056	2022-05-13 23:44:49.382
994	Lucas Marques Prado	lucas marques prado	Acompanhante	99	2022-05-13 23:45:26.227	2022-05-12 03:59:10.056	2022-05-13 23:45:26.229
991	Maria Da Gloria Gomes	maria da gloria gomes	Acompanhante	99	2022-05-13 23:45:10.044	2022-05-12 03:59:10.056	2022-05-13 23:45:10.045
950	Amilton C F Miranda	amilton c f miranda	Convidado	94	2022-05-13 23:52:38.41	2022-05-12 03:59:10.02	2022-05-13 23:52:38.415
995	Roberta Assis De Souza	roberta assis de souza	Acompanhante	99	2022-05-13 23:45:33.396	2022-05-12 03:59:10.056	2022-05-13 23:45:33.397
934	Marta Amelia Rodrigues	marta amelia rodrigues	Acompanhante	91	2022-05-14 00:06:46.051	2022-05-12 03:59:09.999	2022-05-14 00:06:46.057
945	Alan Kardec Ferreira De Carvalho	alan kardec ferreira de carvalho	Convidado	93	2022-05-14 00:08:59.947	2022-05-12 03:59:10.014	2022-05-14 00:08:59.95
948	Izildinha Divina Borboa Carvalho	izildinha divina borboa carvalho	Acompanhante	93	2022-05-14 00:09:07.874	2022-05-12 03:59:10.014	2022-05-14 00:09:07.876
951	Djair Norato Da Silva	djair norato da silva	Convidado	94	2022-05-14 00:31:36.337	2022-05-12 03:59:10.02	2022-05-14 00:31:36.339
959	Cleuza Maria De Jesus Silva	cleuza maria de jesus silva	Acompanhante	94	2022-05-14 00:31:45.68	2022-05-12 03:59:10.021	2022-05-14 00:31:45.681
1004	Filho Do Rochester Bruno	filho do rochester bruno	Acompanhante	100	\N	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
1014	Gabriel Oliveira Maciel Vieira	gabriel oliveira maciel vieira	Convidado	102	\N	2022-05-12 03:59:10.077	2022-05-12 03:59:10.077
1016	Eduardo Scaramelli Bistaffa	eduardo scaramelli bistaffa	Convidado	102	\N	2022-05-12 03:59:10.077	2022-05-12 03:59:10.077
1017	Isabelle Cristine Martins Borges	isabelle cristine martins borges	Acompanhante	102	\N	2022-05-12 03:59:10.077	2022-05-12 03:59:10.077
1018	Juliana Bonifácio Oliveira	juliana bonifacio oliveira	Acompanhante	102	\N	2022-05-12 03:59:10.077	2022-05-12 03:59:10.077
1021	Bruno Cesar Rodrigues Rosa	bruno cesar rodrigues rosa	Acompanhante	102	\N	2022-05-12 03:59:10.077	2022-05-12 03:59:10.077
1034	Daniela Baquiaga Pessoa	daniela baquiaga pessoa	Acompanhante	104	\N	2022-05-12 03:59:10.09	2022-05-12 03:59:10.09
1036	Tassio Rodrigues Lemes	tassio rodrigues lemes	Acompanhante	104	\N	2022-05-12 03:59:10.09	2022-05-12 03:59:10.09
1041	Diones Dos Santos	diones dos santos	Convidado	105	\N	2022-05-12 03:59:10.096	2022-05-12 03:59:10.097
1046	Marilia Vilela Silva	marilia vilela silva	Acompanhante	105	\N	2022-05-12 03:59:10.096	2022-05-12 03:59:10.097
1047	Ivo De Castro E Silva	ivo de castro e silva	Convidado	106	\N	2022-05-12 03:59:10.103	2022-05-12 03:59:10.104
1049	Maria Aparecida Gomes	maria aparecida gomes	Acompanhante	106	\N	2022-05-12 03:59:10.103	2022-05-12 03:59:10.104
1050	Carlos Pereira Da Rocha	carlos pereira da rocha	Acompanhante	106	\N	2022-05-12 03:59:10.103	2022-05-12 03:59:10.104
1057	Alessandro Benfatti	alessandro benfatti	Convidado	107	\N	2022-05-12 03:59:10.11	2022-05-12 03:59:10.111
1060	Heitor Rodrigues 6 Anos	heitor rodrigues 6 anos	Acompanhante	107	\N	2022-05-12 03:59:10.11	2022-05-12 03:59:10.111
1061	Jordana Emilia Prado Nunes Carvalho	jordana emilia prado nunes carvalho	Acompanhante	107	\N	2022-05-12 03:59:10.11	2022-05-12 03:59:10.111
1048	Simone Magela Sousa Borges	simone magela sousa borges	Convidado	106	2022-05-13 23:25:31.322	2022-05-12 03:59:10.103	2022-05-13 23:25:31.323
1073	Maiara Tombini Barbosa	maiara tombini barbosa	Convidado	110	\N	2022-05-12 23:23:34.56	2022-05-12 23:23:34.561
1074	Hermes Andrade Silva	hermes andrade silva	Convidado	110	\N	2022-05-12 23:23:34.56	2022-05-12 23:23:34.561
1075	Alinne Silva De Assis	alinne silva de assis	Convidado	110	\N	2022-05-12 23:23:34.56	2022-05-12 23:23:34.561
1076	Andrei Luiz Tombini Barbosa	andrei luiz tombini barbosa	Convidado	110	\N	2022-05-12 23:23:34.56	2022-05-12 23:23:34.561
1013	Nelson Gonçalves	nelson goncalves	Acompanhante	101	2022-05-13 23:25:44.847	2022-05-12 03:59:10.07	2022-05-13 23:25:44.85
1053	Walmir C P Da Rocha Filho	walmir c p da rocha filho	Acompanhante	106	2022-05-13 23:25:48.754	2022-05-12 03:59:10.103	2022-05-13 23:25:48.756
1008	Luzia Vera	luzia vera	Convidado	101	2022-05-13 23:25:52.961	2022-05-12 03:59:10.07	2022-05-13 23:25:52.963
1051	Emerson Nilandio De Sousa Rocha	emerson nilandio de sousa rocha	Acompanhante	106	2022-05-13 23:26:00.721	2022-05-12 03:59:10.103	2022-05-13 23:26:00.723
1054	Gilson Ferreira Alves	gilson ferreira alves	Acompanhante	106	2022-05-13 23:26:07.041	2022-05-12 03:59:10.103	2022-05-13 23:26:07.043
1052	Jessika Mangabeira Medeiros Conceição	jessika mangabeira medeiros conceicao	Acompanhante	106	2022-05-13 23:26:10.48	2022-05-12 03:59:10.103	2022-05-13 23:26:10.483
1039	Marco Aurelio Ferreira Oliveira	marco aurelio ferreira oliveira	Convidado	105	2022-05-13 23:29:21.736	2022-05-12 03:59:10.096	2022-05-13 23:29:21.74
1042	Katia Maria Moraes De Melo	katia maria moraes de melo	Acompanhante	105	2022-05-13 23:29:39.755	2022-05-12 03:59:10.096	2022-05-13 23:29:39.757
1043	Micaela Melo Oliveira 12 Anos	micaela melo oliveira 12 anos	Acompanhante	105	2022-05-13 23:29:43.283	2022-05-12 03:59:10.096	2022-05-13 23:29:43.285
1044	Manuela Melo Oliveira 5 Anos	manuela melo oliveira 5 anos	Acompanhante	105	2022-05-13 23:29:46.055	2022-05-12 03:59:10.096	2022-05-13 23:29:46.057
1062	Idemur Campos Barbosa Junior	idemur campos barbosa junior	Convidado	108	2022-05-13 23:36:12.202	2022-05-12 03:59:10.119	2022-05-13 23:36:12.203
1029	Mario Scarabelot Filho	mario scarabelot filho	Convidado	104	2022-05-13 23:36:19.68	2022-05-12 03:59:10.089	2022-05-13 23:36:19.684
1063	Daiane Nascimento De Sousa	daiane nascimento de sousa	Acompanhante	108	2022-05-13 23:36:20.754	2022-05-12 03:59:10.119	2022-05-13 23:36:20.756
1033	Eduardo Martins	eduardo martins	Acompanhante	104	2022-05-13 23:36:30.282	2022-05-12 03:59:10.09	2022-05-13 23:36:30.284
1030	Ismael Sabbadin	ismael sabbadin	Convidado	104	2022-05-13 23:36:42.858	2022-05-12 03:59:10.089	2022-05-13 23:36:42.86
1037	Antoninho Sabbadin	antoninho sabbadin	Acompanhante	104	2022-05-13 23:36:50.914	2022-05-12 03:59:10.09	2022-05-13 23:36:50.917
1035	Irma Fatima De Cristo Sabbadin	irma fatima de cristo sabbadin	Acompanhante	104	2022-05-13 23:36:59.602	2022-05-12 03:59:10.09	2022-05-13 23:36:59.603
1040	Marcos Cardozo	marcos cardozo	Convidado	105	2022-05-13 23:37:35.339	2022-05-12 03:59:10.096	2022-05-13 23:37:35.341
1045	Crismone Mariano Da Silva	crismone mariano da silva	Acompanhante	105	2022-05-13 23:37:46.157	2022-05-12 03:59:10.096	2022-05-13 23:37:46.158
1007	Loane O. De Souza	loane o de souza	Convidado	101	2022-05-13 23:42:23.046	2022-05-12 03:59:10.07	2022-05-13 23:42:23.048
1010	Diogo S. Martins	diogo s martins	Acompanhante	101	2022-05-13 23:42:31.14	2022-05-12 03:59:10.07	2022-05-13 23:42:31.141
1011	Lazara Leticia O. Sampaio	lazara leticia o sampaio	Acompanhante	101	2022-05-13 23:42:47.778	2022-05-12 03:59:10.07	2022-05-13 23:42:47.779
1012	Júlia Araújo Cruzeiro	julia araujo cruzeiro	Acompanhante	101	2022-05-13 23:43:00.2	2022-05-12 03:59:10.07	2022-05-13 23:43:00.202
1056	Vera Lucia Da Silva	vera lucia da silva	Convidado	107	2022-05-13 23:43:55.04	2022-05-12 03:59:10.11	2022-05-13 23:43:55.041
1005	Eloiza Naiara Abeling	eloiza naiara abeling	Acompanhante	100	2022-05-13 23:44:02.188	2022-05-12 03:59:10.063	2022-05-13 23:44:02.19
1059	Vilmar Carlos Silva	vilmar carlos silva	Acompanhante	107	2022-05-13 23:44:04.831	2022-05-12 03:59:10.11	2022-05-13 23:44:04.833
1022	Climaco Thiago Moraes Pereira	climaco thiago moraes pereira	Convidado	103	2022-05-13 23:50:39.196	2022-05-12 03:59:10.083	2022-05-13 23:50:39.198
1025	Cristielly Pinto De Oliveira	cristielly pinto de oliveira	Acompanhante	103	2022-05-13 23:50:48.222	2022-05-12 03:59:10.083	2022-05-13 23:50:48.224
1028	Flavio Henrique Garcia	flavio henrique garcia	Convidado	104	2022-05-13 23:53:51.804	2022-05-12 03:59:10.089	2022-05-13 23:53:51.806
1032	Pedro Henrique De Oliveira	pedro henrique de oliveira	Acompanhante	104	2022-05-13 23:54:01.749	2022-05-12 03:59:10.089	2022-05-13 23:54:01.757
1038	Francisco Junior Alves Gomes	francisco junior alves gomes	Acompanhante	104	2022-05-13 23:56:43.25	2022-05-12 03:59:10.09	2022-05-13 23:56:43.251
1031	Vitoria Maria Ribeiro Da Silva	vitoria maria ribeiro da silva	Convidado	104	2022-05-13 23:56:50.069	2022-05-12 03:59:10.089	2022-05-13 23:56:50.07
1015	Taciane Marques	taciane marques	Convidado	102	2022-05-14 00:02:29.505	2022-05-12 03:59:10.077	2022-05-14 00:02:29.507
1019	Tatiane Cabral Nery	tatiane cabral nery	Acompanhante	102	2022-05-14 00:02:35.414	2022-05-12 03:59:10.077	2022-05-14 00:02:35.415
1065	Allyster Barbosa De Querioz	allyster barbosa de querioz	Acompanhante	102	2022-05-14 00:02:39.676	2022-05-12 13:47:03.11	2022-05-14 00:02:39.677
1006	Ivanildo Moreira Gomes Junior	ivanildo moreira gomes junior	Convidado	101	2022-05-14 00:06:58.881	2022-05-12 03:59:10.07	2022-05-14 00:06:58.883
1009	Adielle Souza Ferro	adielle souza ferro	Acompanhante	101	2022-05-14 00:07:02.762	2022-05-12 03:59:10.07	2022-05-14 00:07:02.763
1024	Bruno Fernandes Alves Da Silva	bruno fernandes alves da silva	Convidado	103	2022-05-14 00:26:34.649	2022-05-12 03:59:10.083	2022-05-14 00:26:34.651
1023	Danilo Aves Pereira	danilo aves pereira	Convidado	103	2022-05-14 00:26:36.007	2022-05-12 03:59:10.083	2022-05-14 00:26:36.009
1026	Lazara Yara Ferreira Valverde	lazara yara ferreira valverde	Acompanhante	103	2022-05-14 01:03:57.824	2022-05-12 03:59:10.083	2022-05-14 01:03:57.826
1027	Nubia Pereira De Oliveira	nubia pereira de oliveira	Acompanhante	103	2022-05-14 01:04:06.071	2022-05-12 03:59:10.083	2022-05-14 01:04:06.073
1058	Kelly Cristina Barbosa Ferreira	kelly cristina barbosa ferreira	Acompanhante	107	2022-05-14 01:41:02.733	2022-05-12 03:59:10.11	2022-05-14 01:41:02.735
1077	Luciene Carneiro Moraes	luciene carneiro moraes	Acompanhante	95	\N	2022-05-13 04:13:41.325	2022-05-13 04:13:41.325
775	Saritá Eduarda Melo	sarita eduarda melo	Acompanhante	75	2022-05-13 23:24:27.408	2022-05-12 03:59:09.874	2022-05-13 23:24:27.41
1081	Angelica Dos Santos	angelica dos santos	Convidado	109	\N	2022-05-13 11:42:25.72	2022-05-13 11:42:25.721
1082	Caroline Gomes Martins Forte	caroline gomes martins forte	Convidado	109	\N	2022-05-13 11:42:25.72	2022-05-13 11:42:25.721
1083	Relicler Pardim Gouveia	relicler pardim gouveia	Convidado	109	\N	2022-05-13 11:42:25.72	2022-05-13 11:42:25.721
1086	Rejane Marlise Nowicki	rejane marlise nowicki	Convidado	108	\N	2022-05-13 11:46:50.71	2022-05-13 11:46:50.711
1087	Luciana Maia Hamad	luciana maia hamad	Convidado	108	\N	2022-05-13 11:46:50.71	2022-05-13 11:46:50.711
1089	Pedro Machado Vilela	pedro machado vilela	Convidado	108	\N	2022-05-13 11:46:50.71	2022-05-13 11:46:50.711
1090	Lais Martins De Freitas	lais martins de freitas	Convidado	108	\N	2022-05-13 11:46:50.71	2022-05-13 11:46:50.711
1093	Vinícius Torres	vinicius torres	Acompanhante	40	\N	2022-05-13 13:34:45.136	2022-05-13 13:34:45.136
1095	Jean Carlos Ferreira Dos Santos	jean carlos ferreira dos santos	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1100	Juciene Chaves Feitosa Soare	juciene chaves feitosa soare	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1102	Geovanna Castro Teles	geovanna castro teles	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1103	Marcos Luscas Prado	marcos luscas prado	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1104	Kaira Novaes De Castro	kaira novaes de castro	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1108	Rafael Alberto Petla Logstadt	rafael alberto petla logstadt	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1111	Lenadroi Jesus Da Cruz	lenadroi jesus da cruz	Convidado	200	\N	2022-05-13 16:27:09.987	2022-05-13 16:27:09.988
1114	Januaris Torres Pacheco	januaris torres pacheco	Convidado	200	\N	2022-05-13 17:07:43.483	2022-05-13 17:07:43.484
1118	Diego Duarte Dos Santos	diego duarte dos santos	Convidado	200	\N	2022-05-13 17:07:43.483	2022-05-13 17:07:43.484
1119	Maria Amelia Rodrigues Bezerra	maria amelia rodrigues bezerra	Convidado	200	\N	2022-05-13 17:07:43.483	2022-05-13 17:07:43.484
1120	Lais Martins Freitas	lais martins freitas	Convidado	200	\N	2022-05-13 17:07:43.483	2022-05-13 17:07:43.484
1121	Pedro Machado Vilela	pedro machado vilela	Convidado	200	\N	2022-05-13 17:07:43.483	2022-05-13 17:07:43.484
1123	Mariana	mariana	Convidado	57	\N	2022-05-13 19:44:21.609	2022-05-13 19:44:21.61
725	Antonio André Prado Nunes (carapu)	antonio andre prado nunes carapu	Convidado	70	2022-05-13 23:24:45.61	2022-05-12 03:59:09.835	2022-05-13 23:24:45.611
1084	Pedro Machado Vilela	pedro machado vilela	Convidado	109	2022-05-13 23:24:54.547	2022-05-13 11:42:25.72	2022-05-13 23:24:54.55
1085	Lais Martins De Freitas	lais martins de freitas	Convidado	109	2022-05-13 23:25:04.987	2022-05-13 11:42:25.72	2022-05-13 23:25:04.989
1122	Karina Aparecida Lopes	karina aparecida lopes	Convidado	200	2022-05-13 23:23:21.569	2022-05-13 17:07:43.483	2022-05-13 23:23:21.57
672	Daniel Zapparoli Diniz Vieira	daniel zapparoli diniz vieira	Convidado	65	2022-05-13 23:23:27.03	2022-05-12 03:59:09.8	2022-05-13 23:23:27.031
869	Adroaldo Da Costa	adroaldo da costa	Convidado	85	2022-05-13 23:23:59.122	2022-05-12 03:59:09.952	2022-05-13 23:23:59.124
813	Victoria Lopes Rezende	victoria lopes rezende	Acompanhante	79	2022-05-13 23:24:01.65	2022-05-12 03:59:09.911	2022-05-13 23:24:01.651
899	Lazaro Roberto Da Costa	lazaro roberto da costa	Convidado	88	2022-05-13 23:24:16.753	2022-05-12 03:59:09.978	2022-05-13 23:24:16.756
377	José Flávio Barbosa Garcia Neto	jose flavio barbosa garcia neto	Acompanhante	34	2022-05-13 23:25:22.789	2022-05-12 03:59:09.557	2022-05-13 23:25:22.79
43	Alirio Ferreira Chargas Neto	alirio ferreira chargas neto	Acompanhante	1	2022-05-13 23:25:39.247	2022-05-12 03:59:09.201	2022-05-13 23:25:39.248
1144	Thiago	thiago	Acompanhante	53	\N	2022-05-13 23:25:43.16	2022-05-13 23:25:43.161
9	Alcione Familia Rafaela	alcione familia rafaela	Convidado	1	2022-05-13 23:25:45.655	2022-05-12 03:59:09.201	2022-05-13 23:25:45.657
317	Regis Tombini Amaral	regis tombini amaral	Convidado	28	2022-05-13 23:26:01.315	2022-05-12 03:59:09.492	2022-05-13 23:26:01.317
765	Gesvania De Oliveira Silva	gesvania de oliveira silva	Acompanhante	74	2022-05-13 23:26:03.283	2022-05-12 03:59:09.864	2022-05-13 23:26:03.285
1128	Marcelo Melo Martins	marcelo melo martins	Convidado	50	2022-05-13 23:26:33.519	2022-05-13 19:46:10.959	2022-05-13 23:26:33.524
1127	Fernanda De Souza Pinto	fernanda de souza pinto	Convidado	50	2022-05-13 23:26:44.784	2022-05-13 19:46:10.959	2022-05-13 23:26:44.785
1129	Luis Felipe De Souza Martins	luis felipe de souza martins	Convidado	50	2022-05-13 23:26:49.322	2022-05-13 19:46:48.608	2022-05-13 23:26:49.324
1145	Walmer Carlos Pereira Da Rocha	walmer carlos pereira da rocha	Convidado	106	2022-05-13 23:26:57.736	2022-05-13 23:26:37.878	2022-05-13 23:26:57.738
1116	Leticia Rodrigues Da Silva	leticia rodrigues da silva	Convidado	200	2022-05-13 23:27:09.368	2022-05-13 17:07:43.483	2022-05-13 23:27:09.37
1117	Lucas Lazaro Costa Vilela	lucas lazaro costa vilela	Convidado	200	2022-05-13 23:27:19.798	2022-05-13 17:07:43.483	2022-05-13 23:27:19.8
374	Beatriz Irineu Brito Lima	beatriz irineu brito lima	Convidado	34	2022-05-13 23:27:31.675	2022-05-12 03:59:09.557	2022-05-13 23:27:31.676
1099	Rejane Marlise	rejane marlise	Convidado	200	2022-05-13 23:27:44.966	2022-05-13 16:27:09.987	2022-05-13 23:27:44.968
268	Marcos Elias Simantob	marcos elias simantob	Convidado	23	2022-05-13 23:27:57.275	2022-05-12 03:59:09.438	2022-05-13 23:27:57.281
143	Tatielly Marus Correa	tatielly marus correa	Convidado	11	2022-05-13 23:28:04.411	2022-05-12 03:59:09.33	2022-05-13 23:28:04.413
710	Roseli Cristina Franzin Fianchi	roseli cristina franzin fianchi	Acompanhante	68	2022-05-13 23:28:52.969	2022-05-12 03:59:09.822	2022-05-13 23:28:52.972
1130	Roberto	roberto	Convidado	38	2022-05-13 23:29:07.592	2022-05-13 19:47:19.179	2022-05-13 23:29:07.594
1126	Waltecide Pereira Dos Santos	waltecide pereira dos santos	Convidado	57	2022-05-13 23:29:48.059	2022-05-13 19:44:21.609	2022-05-13 23:29:48.06
1125	Mirian	mirian	Convidado	57	2022-05-13 23:29:58.586	2022-05-13 19:44:21.609	2022-05-13 23:29:58.589
1107	Ludmila Logstadt	ludmila logstadt	Convidado	200	2022-05-13 23:30:04.1	2022-05-13 16:27:09.987	2022-05-13 23:30:04.109
1078	Luiz Elias Miranda	luiz elias miranda	Acompanhante	95	2022-05-13 23:31:58.662	2022-05-13 04:15:12.656	2022-05-13 23:31:58.665
1105	Jeova Teles Lima	jeova teles lima	Convidado	200	2022-05-13 23:34:37.081	2022-05-13 16:27:09.987	2022-05-13 23:34:37.082
1096	Julio Ximenes	julio ximenes	Convidado	200	2022-05-13 23:37:12.229	2022-05-13 16:27:09.987	2022-05-13 23:37:12.231
1097	Simone Ximenes	simone ximenes	Convidado	200	2022-05-13 23:37:29.669	2022-05-13 16:27:09.987	2022-05-13 23:37:29.671
1098	Isabela Ximenes	isabela ximenes	Convidado	200	2022-05-13 23:37:34.172	2022-05-13 16:27:09.987	2022-05-13 23:37:34.174
1109	Elisangela Mariano	elisangela mariano	Convidado	200	2022-05-13 23:38:09.208	2022-05-13 16:27:09.987	2022-05-13 23:38:09.21
1112	Katia Dienne Da Silva	katia dienne da silva	Convidado	200	2022-05-13 23:41:03.831	2022-05-13 16:27:09.987	2022-05-13 23:41:03.833
1110	Lidiana Pereira Da Silva	lidiana pereira da silva	Convidado	200	2022-05-13 23:41:23.555	2022-05-13 16:27:09.987	2022-05-13 23:41:23.556
1091	Osvaldinei Antonio De Lima	osvaldinei antonio de lima	Convidado	108	2022-05-13 23:47:06.97	2022-05-13 11:46:50.71	2022-05-13 23:47:06.971
1092	Silvana Gomes Cardoso	silvana gomes cardoso	Convidado	108	2022-05-13 23:47:16.444	2022-05-13 11:46:50.71	2022-05-13 23:47:16.445
1124	Zigomar Gean	zigomar gean	Convidado	57	2022-05-14 00:01:53.236	2022-05-13 19:44:21.609	2022-05-14 00:01:53.238
1115	Vinicius Torres Moura	vinicius torres moura	Convidado	200	2022-05-14 00:02:05.968	2022-05-13 17:07:43.483	2022-05-14 00:02:05.97
1094	Januária Torres	januaria torres	Acompanhante	40	2022-05-14 00:02:17.215	2022-05-13 13:34:45.136	2022-05-14 00:02:17.218
1080	Angelica De Castro Caitano	angelica de castro caitano	Convidado	109	2022-05-14 00:04:26.241	2022-05-13 11:42:25.72	2022-05-14 00:04:26.243
1101	Henrique Carvalho De Souza	henrique carvalho de souza	Convidado	200	2022-05-14 00:05:03.116	2022-05-13 16:27:09.987	2022-05-14 00:05:03.118
1088	Fabio Sandri	fabio sandri	Convidado	108	2022-05-14 00:24:49.027	2022-05-13 11:46:50.71	2022-05-14 00:24:49.028
1146	Marcos Convidado Rafaela	marcos convidado rafaela	Acompanhante	200	2022-05-13 23:28:11.473	2022-05-13 23:27:39.78	2022-05-13 23:28:11.475
321	Lisete Luisa Tombini Bardosa	lisete luisa tombini bardosa	Convidado	28	2022-05-13 23:30:17.094	2022-05-12 03:59:09.492	2022-05-13 23:30:17.096
949	Maria José De Sousa	maria jose de sousa	Convidado	94	2022-05-13 23:30:22.845	2022-05-12 03:59:10.02	2022-05-13 23:30:22.846
831	Stefane Mantelli Oliveira	stefane mantelli oliveira	Acompanhante	81	2022-05-13 23:31:44.924	2022-05-12 03:59:09.923	2022-05-13 23:31:44.925
1131	Gisele Rocha Ribeiro	gisele rocha ribeiro	Convidado	38	2022-05-13 23:28:53.214	2022-05-13 19:47:19.179	2022-05-13 23:28:53.216
1106	Flavio Roberto Petla Logstadt	flavio roberto petla logstadt	Convidado	200	2022-05-13 23:29:33.74	2022-05-13 16:27:09.987	2022-05-13 23:29:33.741
230	Flavia De Lima Teixeira Carvalho	flavia de lima teixeira carvalho	Acompanhante	19	2022-05-13 23:33:40.219	2022-05-12 03:59:09.402	2022-05-13 23:33:40.221
1148	Mariana	mariana	Convidado	57	\N	2022-05-13 23:34:42.655	2022-05-13 23:34:42.655
976	Mateus José Ragagnin	mateus jose ragagnin	Convidado	97	2022-05-13 23:34:49.863	2022-05-12 03:59:10.043	2022-05-13 23:34:49.865
146	Pollyana Mara Correa Alves	pollyana mara correa alves	Acompanhante	11	2022-05-13 23:35:15.596	2022-05-12 03:59:09.33	2022-05-13 23:35:15.598
1149	Taciano Correia	taciano correia	Convidado	90	2022-05-13 23:35:33.539	2022-05-13 23:35:17.931	2022-05-13 23:35:33.542
1150	Luiz Felipe Cavalcante Silva	luiz felipe cavalcante silva	Convidado	11	2022-05-13 23:36:01.265	2022-05-13 23:35:50.726	2022-05-13 23:36:01.266
1151	Rafaela	rafaela	Acompanhante	200	\N	2022-05-13 23:37:20.311	2022-05-13 23:37:20.311
1154	Rafaela	rafaela	Acompanhante	200	\N	2022-05-13 23:37:20.396	2022-05-13 23:37:20.396
1155	Yasmim Mantelli	yasmim mantelli	Acompanhante	200	\N	2022-05-13 23:37:20.396	2022-05-13 23:37:20.396
1156	Leandra	leandra	Acompanhante	200	\N	2022-05-13 23:37:20.396	2022-05-13 23:37:20.396
1158	Yasmim Mantelli	yasmim mantelli	Acompanhante	200	\N	2022-05-13 23:37:20.549	2022-05-13 23:37:20.55
1159	Leandra	leandra	Acompanhante	200	\N	2022-05-13 23:37:20.549	2022-05-13 23:37:20.55
886	Josy Moreira Dos Santos	josy moreira dos santos	Acompanhante	86	2022-05-13 23:37:22.828	2022-05-12 03:59:09.959	2022-05-13 23:37:22.83
1160	Rafaela	rafaela	Acompanhante	200	\N	2022-05-13 23:38:36.08	2022-05-13 23:38:36.081
1161	Leandra	leandra	Acompanhante	200	\N	2022-05-13 23:38:36.08	2022-05-13 23:38:36.081
1162	Yasmim	yasmim	Acompanhante	200	\N	2022-05-13 23:38:36.08	2022-05-13 23:38:36.081
1163	Denis	denis	Acompanhante	200	\N	2022-05-13 23:38:36.08	2022-05-13 23:38:36.081
662	Monique De Moraes Souza Souto	monique de moraes souza souto	Acompanhante	63	2022-05-13 23:39:19.5	2022-05-12 03:59:09.783	2022-05-13 23:39:19.501
1164	Smily Vitoria	smily vitoria	Convidado	200	\N	2022-05-13 23:40:15.153	2022-05-13 23:40:15.154
645	Bianca Ferreira Cabral	bianca ferreira cabral	Acompanhante	61	2022-05-13 23:40:39.809	2022-05-12 03:59:09.77	2022-05-13 23:40:39.81
1165	Wilson De Oliveira	wilson de oliveira	Convidado	200	2022-05-13 23:41:06.558	2022-05-13 23:40:15.153	2022-05-13 23:41:06.56
397	Jean Luiz Rezende Souza	jean luiz rezende souza	Convidado	36	2022-05-13 23:41:11.321	2022-05-12 03:59:09.58	2022-05-13 23:41:11.323
1166	Emily Vitoria	emily vitoria	Convidado	200	2022-05-13 23:41:52.443	2022-05-13 23:41:37.897	2022-05-13 23:41:52.445
1167	Leandro Jesus Da Silva	leandro jesus da silva	Convidado	200	2022-05-13 23:42:10.691	2022-05-13 23:42:02.852	2022-05-13 23:42:10.693
1113	Maxwell Mariano Da Silva	maxwell mariano da silva	Convidado	200	2022-05-13 23:42:27.4	2022-05-13 16:27:09.987	2022-05-13 23:42:27.401
210	Lucia Aparecida Borges Rocha Freire	lucia aparecida borges rocha freire	Convidado	18	2022-05-13 23:42:30.382	2022-05-12 03:59:09.385	2022-05-13 23:42:30.384
1168	João Gabriel Bersa Freitas	joao gabriel bersa freitas	Convidado	1	2022-05-13 23:42:49.081	2022-05-13 23:42:40.976	2022-05-13 23:42:49.082
1169	Isabela Bersa Freitas	isabela bersa freitas	Convidado	1	2022-05-13 23:42:50.844	2022-05-13 23:42:40.976	2022-05-13 23:42:50.846
245	Antonio De Padua Carvalho	antonio de padua carvalho	Convidado	21	2022-05-13 23:43:04.355	2022-05-12 03:59:09.419	2022-05-13 23:43:04.357
975	Nagib Nicolau Naufal	nagib nicolau naufal	Convidado	97	2022-05-13 23:43:37.041	2022-05-12 03:59:10.043	2022-05-13 23:43:37.043
1170	Rodrygo	rodrygo	Convidado	11	\N	2022-05-13 23:43:48.945	2022-05-13 23:43:48.946
790	Karolina Pazzinato (filha)	karolina pazzinato filha	Acompanhante	77	2022-05-13 23:44:12.413	2022-05-12 03:59:09.897	2022-05-13 23:44:12.415
1171	Juliane	juliane	Convidado	200	\N	2022-05-13 23:44:28.413	2022-05-13 23:44:28.414
1172	Maria Cristina	maria cristina	Convidado	200	\N	2022-05-13 23:44:28.413	2022-05-13 23:44:28.414
1173	Mateus Garcia	mateus garcia	Convidado	200	\N	2022-05-13 23:44:28.413	2022-05-13 23:44:28.414
27	Maura Gabriela	maura gabriela	Acompanhante	1	2022-05-13 23:44:53.556	2022-05-12 03:59:09.201	2022-05-13 23:44:53.557
990	Marcos Rodrigues Dos Santos	marcos rodrigues dos santos	Acompanhante	99	2022-05-13 23:44:58.779	2022-05-12 03:59:10.056	2022-05-13 23:44:58.781
1174	Kelly Regina	kelly regina	Convidado	42	\N	2022-05-13 23:45:32.24	2022-05-13 23:45:32.24
1175	Sadi Palharini	sadi palharini	Convidado	42	\N	2022-05-13 23:45:32.24	2022-05-13 23:45:32.24
92	Eldes Davi Nacruth Gabriel	eldes davi nacruth gabriel	Convidado	6	2022-05-13 23:45:37.209	2022-05-12 03:59:09.281	2022-05-13 23:45:37.21
871	Pamela Manoela De Freitas Silva	pamela manoela de freitas silva	Acompanhante	85	2022-05-13 23:47:33.103	2022-05-12 03:59:09.952	2022-05-13 23:47:33.105
399	Gizelma Borges Da Silva Sandri	gizelma borges da silva sandri	Acompanhante	36	2022-05-13 23:48:43.813	2022-05-12 03:59:09.58	2022-05-13 23:48:43.815
244	Gregoreo Carvalho Inácio Cardoso	gregoreo carvalho inacio cardoso	Convidado	21	2022-05-13 23:49:02.813	2022-05-12 03:59:09.419	2022-05-13 23:49:02.814
292	Raquel Menezes Garcia Moura	raquel menezes garcia moura	Acompanhante	25	2022-05-13 23:49:20.881	2022-05-12 03:59:09.458	2022-05-13 23:49:20.882
32	João Miguel Souza Lima	joao miguel souza lima	Acompanhante	1	2022-05-13 23:49:56.227	2022-05-12 03:59:09.201	2022-05-13 23:49:56.228
1176	Lucas Marques Queiroz	lucas marques queiroz	Convidado	1	2022-05-13 23:50:29.391	2022-05-13 23:50:19.546	2022-05-13 23:50:29.393
1177	Ana Paula Gustavo Silva Menezes	ana paula gustavo silva menezes	Convidado	200	2022-05-13 23:52:39.121	2022-05-13 23:52:27.485	2022-05-13 23:52:39.122
1147	Cibele Prado	cibele prado	Acompanhante	15	2022-05-13 23:53:48.845	2022-05-13 23:31:02.49	2022-05-13 23:53:48.847
161	Romualdo José Oliveira Neto	romualdo jose oliveira neto	Convidado	13	2022-05-13 23:54:28.24	2022-05-12 03:59:09.348	2022-05-13 23:54:28.242
1179	Geovanna	geovanna	Convidado	200	\N	2022-05-13 23:54:55.02	2022-05-13 23:54:55.021
1180	Riquelme	riquelme	Convidado	200	\N	2022-05-13 23:54:55.02	2022-05-13 23:54:55.021
1178	Gustavo Gonçalves Menezes	gustavo goncalves menezes	Convidado	200	2022-05-13 23:56:40.096	2022-05-13 23:53:17.092	2022-05-13 23:56:40.098
1182	Allan Dias Veloso	allan dias veloso	Convidado	98	2022-05-13 23:57:48.322	2022-05-13 23:57:39.182	2022-05-13 23:57:48.324
1181	Raquel Gouveia De Assis	raquel gouveia de assis	Convidado	98	2022-05-13 23:57:49.923	2022-05-13 23:57:39.182	2022-05-13 23:57:49.925
325	Reginaldo Fernandes De Lima	reginaldo fernandes de lima	Acompanhante	28	2022-05-13 23:58:17.923	2022-05-12 03:59:09.492	2022-05-13 23:58:17.925
520	Camila De Cássia E Silva Fernandes	camila de cassia e silva fernandes	Acompanhante	48	2022-05-13 23:59:03.682	2022-05-12 03:59:09.674	2022-05-13 23:59:03.685
828	Vitor Eduardo Peixoto R Sousa	vitor eduardo peixoto r sousa	Acompanhante	81	2022-05-14 00:01:28.605	2022-05-12 03:59:09.923	2022-05-14 00:01:28.607
1183	Victor Convidado Volnice	victor convidado volnice	Acompanhante	200	\N	2022-05-14 00:02:09.713	2022-05-14 00:02:09.714
1185	Aluisio	aluisio	Convidado	200	\N	2022-05-14 00:04:12.514	2022-05-14 00:04:12.514
1186	Wanessa	wanessa	Convidado	200	\N	2022-05-14 00:04:12.514	2022-05-14 00:04:12.514
1184	Davi Carvalho	davi carvalho	Convidado	29	2022-05-14 00:04:24.109	2022-05-14 00:04:12.469	2022-05-14 00:04:24.111
646	Denise Nogueira Castro	denise nogueira castro	Convidado	62	2022-05-14 00:04:46.357	2022-05-12 03:59:09.777	2022-05-14 00:04:46.359
1187	Juciene	juciene	Convidado	72	\N	2022-05-14 00:05:27.893	2022-05-14 00:05:27.894
1188	Henrique	henrique	Convidado	72	\N	2022-05-14 00:05:27.893	2022-05-14 00:05:27.894
31	João Miguel Freitas Souza	joao miguel freitas souza	Acompanhante	1	2022-05-14 00:07:45.509	2022-05-12 03:59:09.201	2022-05-14 00:07:45.51
162	Hudson Hercules Santos Barbosa Silva	hudson hercules santos barbosa silva	Acompanhante	13	2022-05-14 00:09:38.311	2022-05-12 03:59:09.348	2022-05-14 00:09:38.313
930	Patricia Dutra Silva	patricia dutra silva	Acompanhante	91	2022-05-14 00:11:10.424	2022-05-12 03:59:09.999	2022-05-14 00:11:10.426
673	Mauro Rogério Dutra Elegda	mauro rogerio dutra elegda	Convidado	65	2022-05-14 00:11:23.841	2022-05-12 03:59:09.8	2022-05-14 00:11:23.842
322	Marcia Cristina Evangelista Nogueira	marcia cristina evangelista nogueira	Acompanhante	28	2022-05-14 00:11:58.759	2022-05-12 03:59:09.492	2022-05-14 00:11:58.761
395	Guilherme Rohenkohl Nogueira Silva Sandri	guilherme rohenkohl nogueira silva sandri	Convidado	36	2022-05-14 00:12:02.601	2022-05-12 03:59:09.58	2022-05-14 00:12:02.602
1189	José Alves Da Silva Filho	jose alves da silva filho	Convidado	200	2022-05-14 00:13:46.206	2022-05-14 00:13:36.532	2022-05-14 00:13:46.208
1190	Sheila Lidiane Peixoto	sheila lidiane peixoto	Convidado	200	2022-05-14 00:13:52.647	2022-05-14 00:13:36.532	2022-05-14 00:13:52.648
620	Rita De Cássia Gonçalves Oliveira	rita de cassia goncalves oliveira	Convidado	59	2022-05-14 00:14:17.481	2022-05-12 03:59:09.755	2022-05-14 00:14:17.483
121	Jadson Do Nascimento Pereira	jadson do nascimento pereira	Convidado	9	2022-05-14 00:15:11.851	2022-05-12 03:59:09.31	2022-05-14 00:15:11.853
1191	Raissa	raissa	Convidado	200	2022-05-14 00:18:10.41	2022-05-14 00:17:45.436	2022-05-14 00:18:10.411
653	Paula Assis Lopes	paula assis lopes	Acompanhante	62	2022-05-14 00:18:47.955	2022-05-12 03:59:09.777	2022-05-14 00:18:47.957
1193	Hamad	hamad	Convidado	108	2022-05-14 00:26:30.882	2022-05-14 00:26:21.861	2022-05-14 00:26:30.884
1195	Roberto Dias	roberto dias	Convidado	97	2022-05-14 00:36:45.482	2022-05-14 00:36:27.69	2022-05-14 00:36:45.483
1194	Andressa Martins	andressa martins	Convidado	97	2022-05-14 00:36:57.429	2022-05-14 00:36:27.69	2022-05-14 00:36:57.431
1197	Paulo Sérgio	paulo sergio	Convidado	200	2022-05-14 00:57:34.709	2022-05-14 00:57:19.303	2022-05-14 00:57:34.71
1196	Miracema Duarte	miracema duarte	Convidado	200	2022-05-14 00:57:42.836	2022-05-14 00:57:19.303	2022-05-14 00:57:42.838
287	Matheus Carvalho Franco Oliveira	matheus carvalho franco oliveira	Acompanhante	25	2022-05-14 01:10:04.865	2022-05-12 03:59:09.458	2022-05-14 01:10:04.866
792	Rafaela Malta Mesquita	rafaela malta mesquita	Acompanhante	77	2022-05-14 01:10:22.553	2022-05-12 03:59:09.897	2022-05-14 01:10:22.555
1055	Petronilho Candido De Oliveira Junior	petronilho candido de oliveira junior	Convidado	107	2022-05-14 01:40:47.942	2022-05-12 03:59:10.11	2022-05-14 01:40:47.945
909	Robson Tadeu De Oliveira	robson tadeu de oliveira	Convidado	89	2022-05-14 02:25:37.166	2022-05-12 03:59:09.985	2022-05-14 02:25:37.168
\.


--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.tables (id, number, capacity, event_id, created_at, updated_at) FROM stdin;
2	1	12	1	2022-05-12 03:59:09.248	2022-05-12 03:59:09.248
3	2	9	1	2022-05-12 03:59:09.256	2022-05-12 03:59:09.256
4	3	12	1	2022-05-12 03:59:09.264	2022-05-12 03:59:09.265
5	4	9	1	2022-05-12 03:59:09.272	2022-05-12 03:59:09.273
7	6	9	1	2022-05-12 03:59:09.288	2022-05-12 03:59:09.288
8	7	12	1	2022-05-12 03:59:09.299	2022-05-12 03:59:09.3
9	8	9	1	2022-05-12 03:59:09.31	2022-05-12 03:59:09.311
10	9	12	1	2022-05-12 03:59:09.32	2022-05-12 03:59:09.321
12	11	9	1	2022-05-12 03:59:09.339	2022-05-12 03:59:09.339
13	12	9	1	2022-05-12 03:59:09.348	2022-05-12 03:59:09.349
14	13	12	1	2022-05-12 03:59:09.355	2022-05-12 03:59:09.355
16	15	12	1	2022-05-12 03:59:09.37	2022-05-12 03:59:09.37
17	16	9	1	2022-05-12 03:59:09.378	2022-05-12 03:59:09.379
19	18	12	1	2022-05-12 03:59:09.402	2022-05-12 03:59:09.403
20	19	9	1	2022-05-12 03:59:09.411	2022-05-12 03:59:09.412
22	21	9	1	2022-05-12 03:59:09.426	2022-05-12 03:59:09.427
23	22	12	1	2022-05-12 03:59:09.438	2022-05-12 03:59:09.439
24	23	9	1	2022-05-12 03:59:09.447	2022-05-12 03:59:09.448
26	25	9	1	2022-05-12 03:59:09.468	2022-05-12 03:59:09.469
27	26	13	1	2022-05-12 03:59:09.483	2022-05-12 03:59:09.484
28	27	12	1	2022-05-12 03:59:09.492	2022-05-12 03:59:09.493
30	29	9	1	2022-05-12 03:59:09.507	2022-05-12 03:59:09.508
31	30	12	1	2022-05-12 03:59:09.518	2022-05-12 03:59:09.519
32	31	9	1	2022-05-12 03:59:09.536	2022-05-12 03:59:09.536
33	32	12	1	2022-05-12 03:59:09.547	2022-05-12 03:59:09.548
34	33	9	1	2022-05-12 03:59:09.557	2022-05-12 03:59:09.557
35	34	12	1	2022-05-12 03:59:09.567	2022-05-12 03:59:09.568
36	35	12	1	2022-05-12 03:59:09.58	2022-05-12 03:59:09.58
37	36	9	1	2022-05-12 03:59:09.59	2022-05-12 03:59:09.591
39	38	9	1	2022-05-12 03:59:09.605	2022-05-12 03:59:09.606
41	40	9	1	2022-05-12 03:59:09.618	2022-05-12 03:59:09.619
43	42	9	1	2022-05-12 03:59:09.633	2022-05-12 03:59:09.634
45	44	12	1	2022-05-12 03:59:09.648	2022-05-12 03:59:09.649
46	45	9	1	2022-05-12 03:59:09.657	2022-05-12 03:59:09.658
47	46	9	1	2022-05-12 03:59:09.665	2022-05-12 03:59:09.666
48	47	12	1	2022-05-12 03:59:09.674	2022-05-12 03:59:09.675
49	48	9	1	2022-05-12 03:59:09.681	2022-05-12 03:59:09.682
51	50	9	1	2022-05-12 03:59:09.695	2022-05-12 03:59:09.696
52	51	13	1	2022-05-12 03:59:09.702	2022-05-12 03:59:09.703
54	53	9	1	2022-05-12 03:59:09.718	2022-05-12 03:59:09.719
55	54	12	1	2022-05-12 03:59:09.726	2022-05-12 03:59:09.727
56	55	9	1	2022-05-12 03:59:09.733	2022-05-12 03:59:09.734
58	57	9	1	2022-05-12 03:59:09.748	2022-05-12 03:59:09.748
59	58	9	1	2022-05-12 03:59:09.755	2022-05-12 03:59:09.755
60	59	9	1	2022-05-12 03:59:09.762	2022-05-12 03:59:09.763
61	60	12	1	2022-05-12 03:59:09.769	2022-05-12 03:59:09.77
62	61	12	1	2022-05-12 03:59:09.777	2022-05-12 03:59:09.777
63	62	9	1	2022-05-12 03:59:09.783	2022-05-12 03:59:09.784
64	63	9	1	2022-05-12 03:59:09.79	2022-05-12 03:59:09.791
65	64	12	1	2022-05-12 03:59:09.8	2022-05-12 03:59:09.801
66	65	9	1	2022-05-12 03:59:09.808	2022-05-12 03:59:09.809
67	66	12	1	2022-05-12 03:59:09.815	2022-05-12 03:59:09.816
68	67	9	1	2022-05-12 03:59:09.822	2022-05-12 03:59:09.822
69	68	12	1	2022-05-12 03:59:09.828	2022-05-12 03:59:09.828
71	70	9	1	2022-05-12 03:59:09.842	2022-05-12 03:59:09.843
73	72	9	1	2022-05-12 03:59:09.856	2022-05-12 03:59:09.857
74	73	12	1	2022-05-12 03:59:09.863	2022-05-12 03:59:09.864
75	74	9	1	2022-05-12 03:59:09.873	2022-05-12 03:59:09.874
76	75	9	1	2022-05-12 03:59:09.886	2022-05-12 03:59:09.887
77	76	9	1	2022-05-12 03:59:09.896	2022-05-12 03:59:09.897
78	77	12	1	2022-05-12 03:59:09.904	2022-05-12 03:59:09.905
79	78	12	1	2022-05-12 03:59:09.911	2022-05-12 03:59:09.912
80	79	9	1	2022-05-12 03:59:09.917	2022-05-12 03:59:09.918
81	80	9	1	2022-05-12 03:59:09.923	2022-05-12 03:59:09.924
82	81	12	1	2022-05-12 03:59:09.931	2022-05-12 03:59:09.932
83	82	9	1	2022-05-12 03:59:09.938	2022-05-12 03:59:09.939
84	83	12	1	2022-05-12 03:59:09.945	2022-05-12 03:59:09.946
85	84	9	1	2022-05-12 03:59:09.952	2022-05-12 03:59:09.953
86	85	12	1	2022-05-12 03:59:09.958	2022-05-12 03:59:09.959
87	86	12	1	2022-05-12 03:59:09.97	2022-05-12 03:59:09.971
88	87	9	1	2022-05-12 03:59:09.978	2022-05-12 03:59:09.979
89	88	12	1	2022-05-12 03:59:09.985	2022-05-12 03:59:09.985
91	90	12	1	2022-05-12 03:59:09.999	2022-05-12 03:59:10
92	91	9	1	2022-05-12 03:59:10.006	2022-05-12 03:59:10.007
93	92	9	1	2022-05-12 03:59:10.013	2022-05-12 03:59:10.014
94	93	12	1	2022-05-12 03:59:10.02	2022-05-12 03:59:10.021
96	95	9	1	2022-05-12 03:59:10.034	2022-05-12 03:59:10.035
99	98	12	1	2022-05-12 03:59:10.056	2022-05-12 03:59:10.057
100	99	9	1	2022-05-12 03:59:10.063	2022-05-12 03:59:10.064
101	100	12	1	2022-05-12 03:59:10.07	2022-05-12 03:59:10.071
103	102	12	1	2022-05-12 03:59:10.083	2022-05-12 03:59:10.084
104	103	12	1	2022-05-12 03:59:10.089	2022-05-12 03:59:10.09
105	104	9	1	2022-05-12 03:59:10.096	2022-05-12 03:59:10.097
107	106	9	1	2022-05-12 03:59:10.11	2022-05-12 03:59:10.111
111	111	10	1	2022-05-12 03:59:10.134	2022-05-12 03:59:10.134
112	112	10	1	2022-05-12 03:59:10.137	2022-05-12 03:59:10.138
113	113	10	1	2022-05-12 03:59:10.143	2022-05-12 03:59:10.144
114	114	10	1	2022-05-12 03:59:10.148	2022-05-12 03:59:10.149
115	115	10	1	2022-05-12 03:59:10.153	2022-05-12 03:59:10.153
116	116	10	1	2022-05-12 03:59:10.158	2022-05-12 03:59:10.158
117	117	10	1	2022-05-12 03:59:10.162	2022-05-12 03:59:10.163
118	118	10	1	2022-05-12 03:59:10.167	2022-05-12 03:59:10.168
119	119	10	1	2022-05-12 03:59:10.172	2022-05-12 03:59:10.173
120	120	10	1	2022-05-12 03:59:10.178	2022-05-12 03:59:10.179
121	121	10	1	2022-05-12 03:59:10.183	2022-05-12 03:59:10.184
122	122	10	1	2022-05-12 03:59:10.196	2022-05-12 03:59:10.196
123	123	10	1	2022-05-12 03:59:10.201	2022-05-12 03:59:10.201
124	124	10	1	2022-05-12 03:59:10.208	2022-05-12 03:59:10.208
125	125	10	1	2022-05-12 03:59:10.212	2022-05-12 03:59:10.213
126	126	10	1	2022-05-12 03:59:10.217	2022-05-12 03:59:10.217
127	127	10	1	2022-05-12 03:59:10.221	2022-05-12 03:59:10.222
128	128	10	1	2022-05-12 03:59:10.225	2022-05-12 03:59:10.226
129	129	10	1	2022-05-12 03:59:10.23	2022-05-12 03:59:10.23
130	130	10	1	2022-05-12 03:59:10.234	2022-05-12 03:59:10.234
131	131	10	1	2022-05-12 03:59:10.238	2022-05-12 03:59:10.239
132	132	10	1	2022-05-12 03:59:10.242	2022-05-12 03:59:10.243
133	133	10	1	2022-05-12 03:59:10.246	2022-05-12 03:59:10.247
134	134	10	1	2022-05-12 03:59:10.25	2022-05-12 03:59:10.251
135	135	10	1	2022-05-12 03:59:10.255	2022-05-12 03:59:10.255
136	136	10	1	2022-05-12 03:59:10.259	2022-05-12 03:59:10.26
102	101	9	1	2022-05-12 03:59:10.077	2022-05-12 13:47:03.111
109	109	10	1	2022-05-12 03:59:10.125	2022-05-13 11:42:25.721
95	94	9	1	2022-05-12 03:59:10.027	2022-05-13 04:15:12.657
97	96	9	1	2022-05-12 03:59:10.043	2022-05-14 00:36:27.69
40	39	12	1	2022-05-12 03:59:09.612	2022-05-13 13:34:45.136
6	5	12	1	2022-05-12 03:59:09.28	2022-05-13 19:37:40.671
25	24	12	1	2022-05-12 03:59:09.458	2022-05-13 19:41:46.679
18	17	12	1	2022-05-12 03:59:09.385	2022-05-13 19:39:38.173
90	89	9	1	2022-05-12 03:59:09.992	2022-05-13 23:35:17.932
38	37	12	1	2022-05-12 03:59:09.598	2022-05-13 19:47:19.18
44	43	12	1	2022-05-12 03:59:09.641	2022-05-13 19:52:34.687
50	49	13	1	2022-05-12 03:59:09.688	2022-05-13 19:51:13.493
53	52	12	1	2022-05-12 03:59:09.71	2022-05-13 23:25:43.161
106	105	9	1	2022-05-12 03:59:10.103	2022-05-13 23:26:37.879
108	107	12	1	2022-05-12 03:59:10.119	2022-05-14 00:26:21.862
70	69	13	1	2022-05-12 03:59:09.835	2022-05-13 23:30:05.396
57	56	12	1	2022-05-12 03:59:09.741	2022-05-13 23:34:42.655
42	41	9	1	2022-05-12 03:59:09.625	2022-05-13 23:45:32.24
98	97	9	1	2022-05-12 03:59:10.05	2022-05-13 23:57:39.182
11	10	12	1	2022-05-12 03:59:09.33	2022-05-13 23:43:48.946
1	0	60	1	2022-05-12 03:59:09.2	2022-05-13 23:50:19.547
29	28	9	1	2022-05-12 03:59:09.5	2022-05-14 00:04:12.47
72	71	12	1	2022-05-12 03:59:09.849	2022-05-14 00:05:27.894
137	137	10	1	2022-05-12 03:59:10.272	2022-05-12 03:59:10.273
138	138	10	1	2022-05-12 03:59:10.278	2022-05-12 03:59:10.279
139	139	10	1	2022-05-12 03:59:10.283	2022-05-12 03:59:10.283
140	140	10	1	2022-05-12 03:59:10.289	2022-05-12 03:59:10.289
141	141	10	1	2022-05-12 03:59:10.293	2022-05-12 03:59:10.294
142	142	10	1	2022-05-12 03:59:10.298	2022-05-12 03:59:10.298
143	143	10	1	2022-05-12 03:59:10.302	2022-05-12 03:59:10.302
144	144	10	1	2022-05-12 03:59:10.306	2022-05-12 03:59:10.306
145	145	10	1	2022-05-12 03:59:10.31	2022-05-12 03:59:10.311
146	146	10	1	2022-05-12 03:59:10.315	2022-05-12 03:59:10.316
147	147	10	1	2022-05-12 03:59:10.325	2022-05-12 03:59:10.325
148	148	10	1	2022-05-12 03:59:10.329	2022-05-12 03:59:10.33
149	149	10	1	2022-05-12 03:59:10.333	2022-05-12 03:59:10.334
150	150	10	1	2022-05-12 03:59:10.338	2022-05-12 03:59:10.339
151	151	10	1	2022-05-12 03:59:10.342	2022-05-12 03:59:10.343
152	152	10	1	2022-05-12 03:59:10.351	2022-05-12 03:59:10.351
153	153	10	1	2022-05-12 03:59:10.376	2022-05-12 03:59:10.377
154	154	10	1	2022-05-12 03:59:10.382	2022-05-12 03:59:10.383
155	155	10	1	2022-05-12 03:59:10.388	2022-05-12 03:59:10.388
156	156	10	1	2022-05-12 03:59:10.394	2022-05-12 03:59:10.394
157	157	10	1	2022-05-12 03:59:10.398	2022-05-12 03:59:10.399
158	158	10	1	2022-05-12 03:59:10.403	2022-05-12 03:59:10.404
159	159	10	1	2022-05-12 03:59:10.407	2022-05-12 03:59:10.408
160	160	10	1	2022-05-12 03:59:10.412	2022-05-12 03:59:10.412
161	161	10	1	2022-05-12 03:59:10.416	2022-05-12 03:59:10.416
162	162	10	1	2022-05-12 03:59:10.42	2022-05-12 03:59:10.42
163	163	10	1	2022-05-12 03:59:10.424	2022-05-12 03:59:10.424
164	164	10	1	2022-05-12 03:59:10.428	2022-05-12 03:59:10.428
165	165	10	1	2022-05-12 03:59:10.445	2022-05-12 03:59:10.446
166	166	10	1	2022-05-12 03:59:10.45	2022-05-12 03:59:10.45
167	167	10	1	2022-05-12 03:59:10.454	2022-05-12 03:59:10.455
168	168	10	1	2022-05-12 03:59:10.459	2022-05-12 03:59:10.459
169	169	10	1	2022-05-12 03:59:10.465	2022-05-12 03:59:10.466
170	170	10	1	2022-05-12 03:59:10.47	2022-05-12 03:59:10.47
171	171	10	1	2022-05-12 03:59:10.474	2022-05-12 03:59:10.475
172	172	10	1	2022-05-12 03:59:10.478	2022-05-12 03:59:10.479
173	173	10	1	2022-05-12 03:59:10.483	2022-05-12 03:59:10.483
174	174	10	1	2022-05-12 03:59:10.487	2022-05-12 03:59:10.487
175	175	10	1	2022-05-12 03:59:10.492	2022-05-12 03:59:10.493
176	176	10	1	2022-05-12 03:59:10.497	2022-05-12 03:59:10.497
177	177	10	1	2022-05-12 03:59:10.501	2022-05-12 03:59:10.502
178	178	10	1	2022-05-12 03:59:10.506	2022-05-12 03:59:10.506
179	179	10	1	2022-05-12 03:59:10.51	2022-05-12 03:59:10.511
180	180	10	1	2022-05-12 03:59:10.515	2022-05-12 03:59:10.515
181	181	10	1	2022-05-12 03:59:10.519	2022-05-12 03:59:10.519
182	182	10	1	2022-05-12 03:59:10.523	2022-05-12 03:59:10.524
183	183	10	1	2022-05-12 03:59:10.527	2022-05-12 03:59:10.528
184	184	10	1	2022-05-12 03:59:10.531	2022-05-12 03:59:10.532
185	185	10	1	2022-05-12 03:59:10.536	2022-05-12 03:59:10.536
186	186	10	1	2022-05-12 03:59:10.54	2022-05-12 03:59:10.54
187	187	10	1	2022-05-12 03:59:10.544	2022-05-12 03:59:10.544
188	188	10	1	2022-05-12 03:59:10.548	2022-05-12 03:59:10.549
189	189	10	1	2022-05-12 03:59:10.553	2022-05-12 03:59:10.553
190	190	10	1	2022-05-12 03:59:10.558	2022-05-12 03:59:10.558
191	191	10	1	2022-05-12 03:59:10.562	2022-05-12 03:59:10.563
192	192	10	1	2022-05-12 03:59:10.567	2022-05-12 03:59:10.568
193	193	10	1	2022-05-12 03:59:10.571	2022-05-12 03:59:10.572
194	194	10	1	2022-05-12 03:59:10.576	2022-05-12 03:59:10.576
195	195	10	1	2022-05-12 03:59:10.58	2022-05-12 03:59:10.581
196	196	10	1	2022-05-12 03:59:10.584	2022-05-12 03:59:10.585
197	197	10	1	2022-05-12 03:59:10.588	2022-05-12 03:59:10.589
21	20	14	1	2022-05-12 03:59:09.419	2022-05-12 12:26:07.554
110	110	10	1	2022-05-12 03:59:10.129	2022-05-12 23:23:34.561
198	198	20	1	2022-05-12 03:59:10.592	2022-05-13 21:49:08.472
199	199	10	1	2022-05-12 03:59:10.597	2022-05-13 22:18:37.095
15	14	9	1	2022-05-12 03:59:09.362	2022-05-13 23:31:02.49
200	200	180	1	2022-05-12 03:59:10.601	2022-05-14 00:57:19.304
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: docker
--

COPY public.users (id, email, password, created_at, updated_at) FROM stdin;
4cb8f096-e31d-4371-8808-a9bb89b49045	jatoba	$2a$08$qCP1MlbsMDmVma2N4GjSbOx5BDgWoNymZGD7JAbiQL58dpwwk9ioK	2022-05-12 03:40:42.726	2022-05-12 03:40:42.726
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: presences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.presences_id_seq', 1197, true);


--
-- Name: tables_id_seq; Type: SEQUENCE SET; Schema: public; Owner: docker
--

SELECT pg_catalog.setval('public.tables_id_seq', 200, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: presences presences_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_pkey PRIMARY KEY (id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: docker
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: presences presences_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.presences
    ADD CONSTRAINT presences_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: tables tables_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: docker
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: docker
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO docker;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


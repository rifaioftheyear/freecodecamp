--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-02-17 18:29:23

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
-- TOC entry 214 (class 1259 OID 90324)
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    distance_from_earth numeric,
    galaxy_types text,
    has_life boolean,
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 90329)
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- TOC entry 216 (class 1259 OID 90330)
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean
);


ALTER TABLE public.galaxy_types OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 90333)
-- Name: galaxy_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 217
-- Name: galaxy_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_types_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- TOC entry 218 (class 1259 OID 90334)
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 90337)
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 219
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- TOC entry 220 (class 1259 OID 90338)
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 90341)
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 221
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- TOC entry 222 (class 1259 OID 90342)
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    star_in_galaxy integer,
    galaxy_id integer,
    has_life boolean
);


ALTER TABLE public.star OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 90345)
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO postgres;

--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 223
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- TOC entry 3193 (class 2604 OID 90346)
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 90347)
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 90348)
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 90349)
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 90350)
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- TOC entry 3363 (class 0 OID 90324)
-- Dependencies: 214
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy (galaxy_id, name, age_in_millions_of_years, star_in_galaxy, distance_from_earth, galaxy_types, has_life, galaxy_type_id) FROM stdin;
1	galaxy 1	5000	1000	20	spiral	t	1
2	andromeda	6000	4000	220	spiral	t	1
3	centaurus	246000	84000	6220	spiral	f	3
4	carina	2246000	884000	86220	spiral	f	3
5	draco	5556000	554000	55220	spiral	f	3
6	fenix	9956000	9954000	99220	spiral	f	3
\.


--
-- TOC entry 3365 (class 0 OID 90330)
-- Dependencies: 216
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.galaxy_types (galaxy_types_id, name, has_life) FROM stdin;
1	spiral	t
2	elliptical	t
3	irregular	f
\.


--
-- TOC entry 3367 (class 0 OID 90334)
-- Dependencies: 218
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moon (moon_id, name, age_in_millions_of_years, star_in_galaxy, planet_id) FROM stdin;
1	europa	2500	230	1
2	io	2500	230	1
3	fogos	2100	30	1
4	ginamedes	1500	130	1
5	calisto	2500	230	1
6	amaltea	3500	330	1
7	titan	4500	430	1
8	leda	5500	530	1
9	adrastea	6500	630	1
10	temisto	7500	730	1
11	carme	8500	830	1
12	autonoe	9500	930	1
13	euporia	200	230	1
14	euante	300	330	1
15	encelado	400	430	1
16	mnemea	500	530	1
17	calice	600	630	1
18	euridome	700	730	1
19	elara	800	830	1
20	erinome	900	930	1
\.


--
-- TOC entry 3369 (class 0 OID 90338)
-- Dependencies: 220
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planet (planet_id, name, age_in_millions_of_years, star_in_galaxy, has_life, star_id) FROM stdin;
1	mercury	600	20	f	1
2	earth	0	10	t	1
3	venus	30	30	f	1
4	mars	40	40	f	1
5	jupiter	50	50	f	1
6	saturn	60	60	f	1
7	uranus	60	60	f	1
8	neptuno	70	70	f	1
9	pluton	80	80	f	1
10	quiron	90	90	f	1
11	ceres	100	100	f	1
12	eris	200	200	f	1
13	sedna	300	300	f	1
\.


--
-- TOC entry 3371 (class 0 OID 90342)
-- Dependencies: 222
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.star (star_id, name, age_in_millions_of_years, star_in_galaxy, galaxy_id, has_life) FROM stdin;
1	sirio	24600	800	2	f
2	betelgeuse	98600	12800	1	f
3	sun	1600	200	3	f
4	antares	221600	22200	3	f
5	polux	331600	33200	3	f
6	aldebaran	441600	44200	3	f
\.


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 215
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 217
-- Name: galaxy_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_types_id_seq', 3, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 219
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 221
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_id_seq', 13, true);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 223
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- TOC entry 3199 (class 2606 OID 90352)
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- TOC entry 3201 (class 2606 OID 90354)
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- TOC entry 3203 (class 2606 OID 90356)
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- TOC entry 3205 (class 2606 OID 90358)
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- TOC entry 3207 (class 2606 OID 90360)
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- TOC entry 3209 (class 2606 OID 90362)
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- TOC entry 3211 (class 2606 OID 90364)
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- TOC entry 3213 (class 2606 OID 90366)
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- TOC entry 3215 (class 2606 OID 90368)
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- TOC entry 3217 (class 2606 OID 90370)
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- TOC entry 3218 (class 2606 OID 90371)
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- TOC entry 3219 (class 2606 OID 90376)
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- TOC entry 3220 (class 2606 OID 90381)
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


-- Completed on 2024-02-17 18:29:23

--
-- PostgreSQL database dump complete
--


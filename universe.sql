--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    solar_masses integer NOT NULL,
    distance_from_earth numeric(18,0)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    solar_masses integer NOT NULL,
    distance_from_earth numeric(18,0),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    solar_masses integer NOT NULL,
    distance_from_earth numeric(18,0),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer NOT NULL,
    solar_masses integer NOT NULL,
    distance_from_earth numeric(18,0),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 'solid', true, true, 750, 500, 1501);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 'solid', true, true, 750, 500, 1501);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 'solid', true, true, 750, 500, 1501);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 'solid', true, true, 750, 500, 1501);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 'solid', true, true, 750, 500, 1501);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 'solid', true, true, 750, 500, 1501);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon of Mercurius I', 'Lua hipotética do planeta Mercúrio', false, true, 4500, 1, 77, 1);
INSERT INTO public.moon VALUES (2, 'Moon of Mercurius II', 'Segunda lua hipotética de Mercúrio', false, true, 4500, 1, 80, 1);
INSERT INTO public.moon VALUES (3, 'Moon of Venus I', 'Lua não confirmada orbitando Vênus', false, true, 4600, 1, 261, 2);
INSERT INTO public.moon VALUES (4, 'Luna', 'Nossa Lua, satélite natural da Terra', true, true, 4543, 1, 0, 3);
INSERT INTO public.moon VALUES (5, 'Phobos', 'Uma das duas luas de Marte', false, true, 4600, 1, 225, 4);
INSERT INTO public.moon VALUES (6, 'Deimos', 'A menor das luas de Marte', false, true, 4600, 1, 227, 4);
INSERT INTO public.moon VALUES (7, 'Io', 'Uma das grandes luas de Júpiter, vulcanicamente ativa', false, true, 4600, 318, 628, 5);
INSERT INTO public.moon VALUES (8, 'Europa', 'Lua de Júpiter coberta por gelo, com oceano subsuperficial', false, true, 4600, 318, 628, 5);
INSERT INTO public.moon VALUES (9, 'Ganymede', 'A maior lua do Sistema Solar', false, true, 4600, 318, 628, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', 'Lua de Júpiter, coberta por crateras', false, true, 4600, 318, 628, 5);
INSERT INTO public.moon VALUES (11, 'Titan', 'A maior lua de Saturno, com atmosfera densa', false, true, 4600, 95, 1200, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', 'Segunda maior lua de Saturno', false, true, 4600, 95, 1200, 6);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Uma das grandes luas de Urano', false, true, 4600, 14, 2580, 7);
INSERT INTO public.moon VALUES (14, 'Titania', 'Maior lua de Urano', false, true, 4600, 14, 2580, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 'Maior lua de Netuno, orbitando de maneira retrógrada', false, true, 4600, 17, 4300, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Lua distante e elíptica de Netuno', false, true, 4600, 17, 4300, 8);
INSERT INTO public.moon VALUES (17, 'Kepler-452b Moon I', 'Lua fictícia de Kepler-452b', false, true, 6000, 5, 1400, 9);
INSERT INTO public.moon VALUES (18, 'Kepler-22b Moon I', 'Lua fictícia de Kepler-22b', false, true, 6500, 2, 600, 10);
INSERT INTO public.moon VALUES (19, 'Proxima Centauri b Moon I', 'Lua fictícia orbitando Proxima Centauri b', false, true, 4900, 1, 4, 11);
INSERT INTO public.moon VALUES (20, 'Alpha Centauri Bb Moon I', 'Lua fictícia de Alpha Centauri Bb', false, true, 5000, 1, 4, 12);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'info1', 'lorem impsum');
INSERT INTO public.more_info VALUES (2, 2, 'info2', 'lorem impsum');
INSERT INTO public.more_info VALUES (3, 3, 'info3', 'lorem impsum');
INSERT INTO public.more_info VALUES (4, 4, 'info4', 'lorem impsum');
INSERT INTO public.more_info VALUES (5, 5, 'info5', 'lorem impsum');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurius', 'O planeta mais próximo do Sol', false, true, 4500, 1, 77, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planeta conhecido por suas altas temperaturas', false, true, 4600, 1, 261, 1);
INSERT INTO public.planet VALUES (3, 'Terra', 'Nosso planeta azul e lar da vida', true, true, 4543, 1, 0, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'Planeta vermelho com um passado de água líquida', false, true, 4600, 1, 225, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'O maior planeta do sistema solar', false, true, 4600, 318, 588, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Famoso por seus anéis espetaculares', false, true, 4600, 95, 1200, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Planeta gigante de gás com uma inclinação incomum', false, true, 4600, 14, 2580, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Planeta azul distante e ventoso', false, true, 4600, 17, 4300, 4);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Um exoplaneta potencialmente habitável', false, true, 6000, 5, 1400, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Exoplaneta descoberto na zona habitável de sua estrela', false, true, 6500, 2, 600, 5);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 'Exoplaneta orbitando a estrela mais próxima do Sol', false, true, 4900, 1, 4, 6);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 'Exoplaneta próximo do sistema Alpha Centauri', false, true, 5000, 1, 4, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'solid', true, true, 750, 500, 1501, 1);
INSERT INTO public.star VALUES (2, 'star2', 'solid', true, true, 750, 500, 1501, 2);
INSERT INTO public.star VALUES (3, 'star3', 'solid', true, true, 750, 500, 1501, 3);
INSERT INTO public.star VALUES (4, 'star4', 'solid', true, true, 750, 500, 1501, 4);
INSERT INTO public.star VALUES (5, 'star5', 'solid', true, true, 750, 500, 1501, 5);
INSERT INTO public.star VALUES (6, 'star6', 'solid', true, true, 750, 500, 1501, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


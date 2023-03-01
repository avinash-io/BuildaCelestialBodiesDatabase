--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(100) NOT NULL,
    description text,
    age numeric(10,2),
    has_life boolean DEFAULT false NOT NULL,
    galaxy_type character varying(50) NOT NULL
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
    name character varying(100) NOT NULL,
    description text,
    age numeric(10,2),
    has_life boolean DEFAULT false NOT NULL,
    moon_type character varying(50) NOT NULL,
    planet_id integer
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
-- Name: no_longer_planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.no_longer_planet (
    name character varying(100) NOT NULL,
    description character varying(100),
    reason character varying(100) NOT NULL,
    no_longer_planet_id integer NOT NULL
);


ALTER TABLE public.no_longer_planet OWNER TO freecodecamp;

--
-- Name: no_longer_planet_no_longer_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.no_longer_planet_no_longer_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.no_longer_planet_no_longer_planet_id_seq OWNER TO freecodecamp;

--
-- Name: no_longer_planet_no_longer_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.no_longer_planet_no_longer_planet_id_seq OWNED BY public.no_longer_planet.no_longer_planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age numeric(10,2),
    has_life boolean DEFAULT false NOT NULL,
    planet_type character varying(50) NOT NULL,
    star_id integer,
    number_of_moons integer
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
    name character varying(100) NOT NULL,
    age numeric(10,2),
    is_spherical boolean DEFAULT false NOT NULL,
    distance_from_earth numeric(10,2),
    galaxy_id integer,
    number_of_planets integer
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
-- Name: no_longer_planet no_longer_planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.no_longer_planet ALTER COLUMN no_longer_planet_id SET DEFAULT nextval('public.no_longer_planet_no_longer_planet_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'MILKY Way', 'Here is Solar system', 13.20, false, 'Barred Spiral');
INSERT INTO public.galaxy VALUES (2, 'MILKY Way2', 'Here is Solar system2', 23.20, false, '2Barred Spiral');
INSERT INTO public.galaxy VALUES (3, 'MILKY Way3', 'Here is Solar system3', 33.20, false, '3Barred Spiral');
INSERT INTO public.galaxy VALUES (5, 'MILKY Way4', 'Here is Solar system3', 33.20, false, '3Barred Spiral');
INSERT INTO public.galaxy VALUES (6, 'MILKY Way5', 'something', 43.20, false, 'Spiral');
INSERT INTO public.galaxy VALUES (7, 'HAHA Way', 'HAHA Solar', 52.30, false, 'Sprial 2');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (3, 'Moon1', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (4, 'Moon2', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (5, 'Moon3', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (6, 'Moon4', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (7, 'Moon5', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (8, 'Moon6', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (9, 'Moon7', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (10, 'Moon8', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (11, 'Moon9', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (12, 'Moon10', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (13, 'Moon11', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (14, 'Moon12', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (15, 'Moon13', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (16, 'Moon14', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (17, 'Moon15', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (18, 'Moon16', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (19, 'Moon17', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (20, 'Moon18', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (21, 'Moon19', NULL, NULL, false, 'big', 1);
INSERT INTO public.moon VALUES (22, 'Moon20\', NULL, NULL, false, 'big', 1);


--
-- Data for Name: no_longer_planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.no_longer_planet VALUES ('Namak', NULL, 'Freeza', 1);
INSERT INTO public.no_longer_planet VALUES ('Planet Vegita', NULL, 'Freeza', 2);
INSERT INTO public.no_longer_planet VALUES ('Alderaan', NULL, 'Death Star', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'EARTH', NULL, NULL, true, 'BIG', NULL, NULL);
INSERT INTO public.planet VALUES (3, 'EARTH1', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (4, 'EARTH2', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (5, 'EARTH3', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (6, 'EARTH4', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (7, 'EARTH5', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (8, 'EARTH6', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (9, 'EARTH7', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (10, 'EARTH8', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (11, 'EARTH9', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (12, 'EARTH10', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (13, 'EARTH11', NULL, NULL, true, 'BIG', 1, NULL);
INSERT INTO public.planet VALUES (14, 'EARTH12', NULL, NULL, true, 'BIG', 1, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'SUN', 1.98, false, 0.00, 1, NULL);
INSERT INTO public.star VALUES (2, 'SUN1', 11.98, false, 1.00, 1, NULL);
INSERT INTO public.star VALUES (3, 'SUN2', 12.98, false, 2.00, 1, NULL);
INSERT INTO public.star VALUES (4, 'SUN3', 12.98, false, 2.00, 1, NULL);
INSERT INTO public.star VALUES (5, 'SUN4', 12.98, false, 2.00, 1, NULL);
INSERT INTO public.star VALUES (6, 'SUN5', 12.98, false, 2.00, 1, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: no_longer_planet_no_longer_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.no_longer_planet_no_longer_planet_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: no_longer_planet no_longer_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.no_longer_planet
    ADD CONSTRAINT no_longer_planet_name_key UNIQUE (name);


--
-- Name: no_longer_planet no_longer_planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.no_longer_planet
    ADD CONSTRAINT no_longer_planet_pkey PRIMARY KEY (no_longer_planet_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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


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
    name character varying(40) NOT NULL,
    size_in_light_years integer NOT NULL,
    big boolean,
    hot boolean,
    CONSTRAINT galaxy_size_in_light_years_check CHECK ((size_in_light_years > 0))
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
    name character varying(40) NOT NULL,
    size_in_km numeric NOT NULL,
    is_in_our_galaxy boolean NOT NULL,
    planet_id integer,
    CONSTRAINT moon_size_in_km_check CHECK ((size_in_km > (0)::numeric))
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_km numeric NOT NULL,
    is_in_our_galaxy boolean NOT NULL,
    star_id integer,
    CONSTRAINT planet_size_in_km_check CHECK ((size_in_km > (0)::numeric))
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_info (
    planet_info_id integer NOT NULL,
    habitable boolean NOT NULL,
    matter_state text NOT NULL,
    planet_id integer,
    name character varying(30)
);


ALTER TABLE public.planet_info OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_info_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_info_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_info_planet_info_id_seq OWNED BY public.planet_info.planet_info_id;


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
    name character varying(40) NOT NULL,
    size_in_light_years integer NOT NULL,
    galaxy_id integer,
    biggerthansun boolean,
    CONSTRAINT star_size_in_light_years_check CHECK ((size_in_light_years > 0))
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_info planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info ALTER COLUMN planet_info_id SET DEFAULT nextval('public.planet_info_planet_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 120000, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 220000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 60000, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 60000, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 50000, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 120000, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22.4, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12.4, true, 2);
INSERT INTO public.moon VALUES (4, 'Io', 3643, true, 3);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, true, 3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, true, 3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4821, true, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, true, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 1528, true, 4);
INSERT INTO public.moon VALUES (10, 'Enceladus', 504, true, 4);
INSERT INTO public.moon VALUES (11, 'Triton (Neptune)', 2706, true, 5);
INSERT INTO public.moon VALUES (12, 'Charon', 1212, true, 6);
INSERT INTO public.moon VALUES (13, 'Mimas', 396, true, 4);
INSERT INTO public.moon VALUES (14, 'Iapetus', 1469, true, 4);
INSERT INTO public.moon VALUES (15, 'Titania', 1578, true, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 1523, true, 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1170, true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 1158, true, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', 471, true, 7);
INSERT INTO public.moon VALUES (20, 'Triton (Uranus)', 2706, true, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Venus', 12104, true, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', 4879, true, 1);
INSERT INTO public.planet VALUES (3, 'Uranus', 50724, true, 2);
INSERT INTO public.planet VALUES (4, 'Neptune', 49244, true, 2);
INSERT INTO public.planet VALUES (5, 'Pluto', 2376, true, 3);
INSERT INTO public.planet VALUES (6, 'Titan', 5150, true, 4);
INSERT INTO public.planet VALUES (7, 'Io', 3643, true, 4);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 13000, false, 5);
INSERT INTO public.planet VALUES (9, 'Gliese 581g', 10500, false, 6);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', 12300, false, 6);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 14200, false, 4);
INSERT INTO public.planet VALUES (12, 'Proxima b', 12000, false, 5);
INSERT INTO public.planet VALUES (13, 'LHS 1140 b', 15800, false, 5);
INSERT INTO public.planet VALUES (14, 'Alpha Centauri Bb', 15000, false, 1);
INSERT INTO public.planet VALUES (15, 'WASP-12b', 17000, false, 2);


--
-- Data for Name: planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_info VALUES (1, true, 'Solid', 1, NULL);
INSERT INTO public.planet_info VALUES (2, false, 'Gas', 1, NULL);
INSERT INTO public.planet_info VALUES (3, true, 'Solid', 2, NULL);
INSERT INTO public.planet_info VALUES (4, false, 'Gas', 2, NULL);
INSERT INTO public.planet_info VALUES (5, true, 'Liquid', 3, NULL);
INSERT INTO public.planet_info VALUES (6, false, 'Gas', 3, NULL);
INSERT INTO public.planet_info VALUES (7, false, 'Gas', 4, NULL);
INSERT INTO public.planet_info VALUES (8, true, 'Solid', 4, NULL);
INSERT INTO public.planet_info VALUES (9, true, 'Solid', 5, NULL);
INSERT INTO public.planet_info VALUES (10, false, 'Gas', 5, NULL);
INSERT INTO public.planet_info VALUES (11, true, 'Liquid', 6, NULL);
INSERT INTO public.planet_info VALUES (12, false, 'Gas', 6, NULL);
INSERT INTO public.planet_info VALUES (13, false, 'Gas', 7, NULL);
INSERT INTO public.planet_info VALUES (14, true, 'Solid', 7, NULL);
INSERT INTO public.planet_info VALUES (15, true, 'Solid', 8, NULL);
INSERT INTO public.planet_info VALUES (16, false, 'Gas', 8, NULL);
INSERT INTO public.planet_info VALUES (17, true, 'Solid', 9, NULL);
INSERT INTO public.planet_info VALUES (18, false, 'Gas', 9, NULL);
INSERT INTO public.planet_info VALUES (19, true, 'Liquid', 10, NULL);
INSERT INTO public.planet_info VALUES (20, false, 'Gas', 10, NULL);
INSERT INTO public.planet_info VALUES (21, false, 'Gas', 11, NULL);
INSERT INTO public.planet_info VALUES (22, true, 'Solid', 11, NULL);
INSERT INTO public.planet_info VALUES (23, true, 'Solid', 12, NULL);
INSERT INTO public.planet_info VALUES (24, false, 'Gas', 12, NULL);
INSERT INTO public.planet_info VALUES (25, true, 'Liquid', 13, NULL);
INSERT INTO public.planet_info VALUES (26, false, 'Gas', 13, NULL);
INSERT INTO public.planet_info VALUES (27, false, 'Gas', 14, NULL);
INSERT INTO public.planet_info VALUES (28, true, 'Solid', 14, NULL);
INSERT INTO public.planet_info VALUES (29, true, 'Solid', 15, NULL);
INSERT INTO public.planet_info VALUES (30, false, 'Gas', 15, NULL);
INSERT INTO public.planet_info VALUES (31, true, 'Solid', 1, NULL);
INSERT INTO public.planet_info VALUES (32, false, 'Gas', 2, NULL);
INSERT INTO public.planet_info VALUES (33, true, 'Liquid', 3, NULL);
INSERT INTO public.planet_info VALUES (34, false, 'Gas', 4, NULL);
INSERT INTO public.planet_info VALUES (35, false, 'Gas', 5, NULL);
INSERT INTO public.planet_info VALUES (36, true, 'Solid', 6, NULL);
INSERT INTO public.planet_info VALUES (37, true, 'Solid', 7, NULL);
INSERT INTO public.planet_info VALUES (38, false, 'Gas', 8, NULL);
INSERT INTO public.planet_info VALUES (39, true, 'Solid', 9, NULL);
INSERT INTO public.planet_info VALUES (40, false, 'Gas', 10, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, NULL);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 4, 1, NULL);
INSERT INTO public.star VALUES (3, 'Sirius', 9, 2, NULL);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 642, 3, NULL);
INSERT INTO public.star VALUES (5, 'Rigel', 860, 4, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 25, 5, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_info_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_info_planet_info_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_info planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_pkey PRIMARY KEY (planet_info_id);


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
-- Name: planet_info unique_info_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT unique_info_name UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet_info planet_info_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_info
    ADD CONSTRAINT planet_info_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


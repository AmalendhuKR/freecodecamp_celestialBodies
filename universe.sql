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
    name character varying(60) NOT NULL,
    distance_from_earth numeric(12,0),
    number_of_stars integer,
    age_in_millions bigint,
    is_visible_from_earth boolean,
    is_active boolean,
    description text
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
    name character varying(60) NOT NULL,
    orbital_period numeric(10,4),
    diameter integer,
    distance_from_planet integer,
    has_atmosphere boolean,
    is_geologically_active boolean,
    description text,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    mass_ratio_to_earth numeric(10,4),
    radius integer,
    orbital_distance integer,
    has_rings boolean,
    is_habitable boolean,
    description text,
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
    name character varying(60) NOT NULL,
    luminosity numeric(12,0),
    temperature integer,
    age_in_millions integer,
    is_main_sequence boolean,
    has_planetary_system boolean,
    description text,
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
-- Name: system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.system (
    system_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    number_of_planets integer,
    habitable_planets integer,
    description text
);


ALTER TABLE public.system OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.system_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.system_system_id_seq OWNER TO freecodecamp;

--
-- Name: system_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.system_system_id_seq OWNED BY public.system.system_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: system system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system ALTER COLUMN system_id SET DEFAULT nextval('public.system_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 100000000, 13000, true, true, 'Our home galaxy.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000, 1000000000, 10000, true, true, 'The closest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000, 40000000, 2800, true, true, 'The third-largest member of our Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000, 160000000, 10000, true, true, 'Famous for its spiral structure.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 29000000, 80000000, 10000, true, true, 'Known for its bright nucleus and dust lane.');
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 12000000, 100000000, 10000, true, true, 'A prominent radio galaxy in the Centaurus constellation.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 27.3000, 3474, 384400, false, false, 'Cratered highlands and flat maria', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.3000, 22, 6000, false, false, 'Heavily cratered', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.3000, 12, 23460, false, false, 'Smooth and heavily cratered', 2);
INSERT INTO public.moon VALUES (4, 'Io', 1.8000, 3642, 421800, true, true, 'Active volcanism', 4);
INSERT INTO public.moon VALUES (5, 'Europa', 3.5000, 3121, 670900, false, false, 'Icy surface with potential subsurface ocean', 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7.2000, 5262, 1070400, false, false, 'Largest moon in the solar system', 4);
INSERT INTO public.moon VALUES (7, 'Callisto', 16.7000, 4821, 1882700, false, false, 'Heavily cratered', 4);
INSERT INTO public.moon VALUES (8, 'Titan', 15.9000, 5150, 1221870, true, false, 'Thick atmosphere with methane lakes', 5);
INSERT INTO public.moon VALUES (9, 'Rhea', 4.5000, 1528, 527040, true, false, 'Icy surface', 5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 79.3000, 1469, 356600, true, false, 'Two-tone surface', 5);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1.3700, 504, 237950, true, true, 'Cryovolcanism', 5);
INSERT INTO public.moon VALUES (12, 'Miranda', 1.4000, 472, 129590, false, true, 'Extensive geological activity', 6);
INSERT INTO public.moon VALUES (13, 'Ariel', 2.5000, 1164, 190600, false, false, 'Surface with many canyons', 6);
INSERT INTO public.moon VALUES (14, 'Umbriel', 4.1000, 1170, 265600, false, false, 'Dark surface with few craters', 6);
INSERT INTO public.moon VALUES (15, 'Titania', 8.7000, 1578, 436300, false, false, 'Frosty surface', 6);
INSERT INTO public.moon VALUES (16, 'Oberon', 13.5000, 1522, 583500, false, false, 'Heavily cratered', 6);
INSERT INTO public.moon VALUES (17, 'Triton', 5.9000, 2706, 354759, true, true, 'Retrograde orbit', 6);
INSERT INTO public.moon VALUES (18, 'Charon', 6.4000, 1212, 19700, false, false, 'Large relative to Pluto', 7);
INSERT INTO public.moon VALUES (19, 'Hyperion', 21.3000, 270, 1480400, true, false, 'Unusual shape and porous surface', 5);
INSERT INTO public.moon VALUES (20, 'Phoebe', 550.0000, 220, 1270000, false, false, 'Captured irregular satellite', 5);
INSERT INTO public.moon VALUES (21, 'Daphnis', 0.6000, 9, 13600, false, false, 'Prominent in the Keeler Gap of Saturn’s rings', 5);
INSERT INTO public.moon VALUES (22, 'Atlas', 0.6000, 16, 13740, false, false, 'Faint ringlet', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.0000, 6371, 150, false, true, 'Nitrogen, Oxygen', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0.1070, 3389, 228, false, false, 'Carbon Dioxide, Nitrogen', 1);
INSERT INTO public.planet VALUES (3, 'Venus', 0.8150, 6051, 108, false, false, 'Carbon Dioxide, Nitrogen', 1);
INSERT INTO public.planet VALUES (4, 'Jupiter', 317.8000, 69911, 779, true, false, 'Hydrogen, Helium', 2);
INSERT INTO public.planet VALUES (5, 'Saturn', 95.2000, 58232, 1427, true, false, 'Hydrogen, Helium', 2);
INSERT INTO public.planet VALUES (6, 'Uranus', 14.5000, 25362, 2871, true, false, 'Hydrogen, Helium, Methane', 2);
INSERT INTO public.planet VALUES (7, 'Neptune', 17.1000, 24622, 4497, true, false, 'Hydrogen, Helium, Methane', 2);
INSERT INTO public.planet VALUES (8, 'Mercury', 0.0550, 2439, 58, false, false, 'Oxygen, Sodium', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 0.0022, 1188, 5906, false, false, 'Nitrogen, Methane', 1);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 0.4400, 1236, 550, false, true, 'Carbon Dioxide, Nitrogen', 3);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 1.1700, 1087, 0, false, true, 'Unknown', 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 3.1000, 1250, 0, false, true, 'Unknown', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 25, 9940, 200, true, true, 'The brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 126, 3500, 100, false, true, 'A red supergiant in the Orion constellation.', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 0, 3042, 4500, true, true, 'The closest star to the Sun.', 2);
INSERT INTO public.star VALUES (4, 'Rigel', 120000, 12000, 800000, false, true, 'A blue supergiant star in Orion.', 1);
INSERT INTO public.star VALUES (5, 'Antares', 100000, 3200, 120000, false, true, 'A red supergiant in the Scorpius constellation.', 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri A', 2, 5790, 5000, true, true, 'The largest star of the Alpha Centauri star system.', 2);


--
-- Data for Name: system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.system VALUES (1, 'Solar System', 1, 8, 1, 'The system that includes Earth and seven other planets orbiting the Sun.');
INSERT INTO public.system VALUES (2, 'Alpha Centauri System', 2, 3, 0, 'The closest star system to the Solar System, containing three stars: Alpha Centauri A, B, and Proxima Centauri.');
INSERT INTO public.system VALUES (3, 'Kepler-186 System', 3, 5, 1, 'An exoplanet system featuring a red dwarf star and several Earth-sized planets.');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: system_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.system_system_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: system system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_pkey PRIMARY KEY (system_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: system unique_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT unique_system_name UNIQUE (name);


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
-- Name: system system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.system
    ADD CONSTRAINT system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


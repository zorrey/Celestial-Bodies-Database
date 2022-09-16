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
    name character varying(60) NOT NULL,
    distance_mly numeric(6,4),
    galaxy_description text,
    galaxy_type character varying(10)
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
    planet_id integer,
    name character varying(50) NOT NULL,
    moon_description text,
    moon_age_byr integer,
    habitable boolean DEFAULT false NOT NULL
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_description text,
    number_moons integer,
    planet_age_byr numeric(4,1),
    habitable boolean NOT NULL
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
    galaxy_id integer,
    name character varying(50) NOT NULL,
    star_color character varying(60) NOT NULL,
    star_phase character varying(50),
    systems_id integer
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
-- Name: systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.systems (
    systems_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_multistar boolean NOT NULL
);


ALTER TABLE public.systems OWNER TO freecodecamp;

--
-- Name: systems_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.systems_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_system_id_seq OWNER TO freecodecamp;

--
-- Name: systems_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.systems_system_id_seq OWNED BY public.systems.systems_id;


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
-- Name: systems systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems ALTER COLUMN systems_id SET DEFAULT nextval('public.systems_system_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.0265, 'Home galaxy of Earth', 'SBbc');
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 0.0250, 'Satellite of Milky Way', 'Irr');
INSERT INTO public.galaxy VALUES (3, 'Draco II ', 0.0700, 'Satellite of Milky Way', '');
INSERT INTO public.galaxy VALUES (4, 'Andromeda III', 2.4500, 'Satellite of Andromeda', 'dE2');
INSERT INTO public.galaxy VALUES (5, 'Andromeda Galaxy', 2.5380, 'Largest galaxy ', 'SAb');
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 2.7300, 'Closest unbarred spiral galaxy', 'SAcd');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', ' Earth moon.', 5, false);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', ' Mars satellite.', 5, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Mars satellite.', 5, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Jupiter satellite.', 5, false);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Jupiter satellite.', 5, false);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Jupiter satellite.', 5, false);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Jupiter satellite.', 5, false);
INSERT INTO public.moon VALUES (8, 5, 'Elara', 'Jupiter satellite.', 5, false);
INSERT INTO public.moon VALUES (9, 6, 'Mimas', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (10, 6, 'Enceladus', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (11, 6, 'Tethys', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (12, 6, 'Dione', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (13, 6, 'Rhea', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (14, 6, 'Titan', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (15, 6, 'Hyperion', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (16, 6, 'Helene', 'Saturn satellite.', 5, false);
INSERT INTO public.moon VALUES (17, 7, 'Ariel', 'Uranus satellite.', 5, false);
INSERT INTO public.moon VALUES (18, 7, 'Umbriel', 'Uranus satellite.', 5, false);
INSERT INTO public.moon VALUES (19, 7, 'Titanial', 'Uranus satellite.', 5, false);
INSERT INTO public.moon VALUES (20, 7, 'Oberon', 'Uranus satellite.', 5, false);
INSERT INTO public.moon VALUES (21, 7, 'Miranda', 'Uranus satellite.', 5, false);
INSERT INTO public.moon VALUES (22, 8, 'Triton', 'Neptune satellite.', 5, false);
INSERT INTO public.moon VALUES (23, 8, 'Nereid', 'Neptune satellite.', 5, false);
INSERT INTO public.moon VALUES (24, 8, 'Despina', 'Neptune satellite.', 5, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 1, 'Venus', 'second to the Sun, hottest in Solar system.', 0, 4.6, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'third from the Sun, home planet and water planet.', 1, 4.6, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Fourth from the Sun, cold, desert-like planet.', 2, 4.6, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'fifth from the Sun,largest  planet.', 79, 4.6, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Sixth from the Sun, has ring system.', 82, 4.6, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Seventh from the Sun, coldest temperature measured on a solar  planet.', 27, 4.6, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Eigth from the Sun, coldest planet.', 14, 4.6, false);
INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'closest to the Sun, smallest in Solar system.', 0, 4.6, false);
INSERT INTO public.planet VALUES (9, 2, 'Proxima b', 'Earth-size planet', 0, 4.9, true);
INSERT INTO public.planet VALUES (10, 2, 'Proxima d', 'Small planet', 0, 4.9, false);
INSERT INTO public.planet VALUES (11, 3, 'Wolf395 b', '43.9 Earth masses.', 0, 0.3, false);
INSERT INTO public.planet VALUES (12, 3, 'Wolf395 c', '3.8 Earth masses.', 0, 0.3, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'brown', 'main sequence', 1);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'brown', 'main sequence', 2);
INSERT INTO public.star VALUES (3, 1, 'Rigil Kentaurus', 'brown', 'main sequence', 2);
INSERT INTO public.star VALUES (5, 1, 'Toliman', 'brown', 'main sequence', 2);
INSERT INTO public.star VALUES (4, 1, 'Wolf359', 'brown', 'main sequence', 3);
INSERT INTO public.star VALUES (6, 1, 'Zeta-Leporis', 'blue-white', 'main sequence towards sub-giant', 4);
INSERT INTO public.star VALUES (7, 1, 'Antares', 'red', 'supergiant', 5);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.systems VALUES (1, 1, 'Solar', false);
INSERT INTO public.systems VALUES (2, 1, 'Alpha Centauri', true);
INSERT INTO public.systems VALUES (3, 1, 'CN Leonis', false);
INSERT INTO public.systems VALUES (4, 1, 'Lepus', false);
INSERT INTO public.systems VALUES (5, 1, 'Scorpii', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: systems_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.systems_system_id_seq', 5, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


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
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: systems systems_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_name_key UNIQUE (name);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (systems_id);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
-- Name: star star_systems_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_systems_id_fkey FOREIGN KEY (systems_id) REFERENCES public.systems(systems_id);


--
-- Name: systems systems_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


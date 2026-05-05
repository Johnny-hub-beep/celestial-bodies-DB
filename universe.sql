--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed integer NOT NULL,
    tail_length integer,
    is_periodic boolean NOT NULL,
    description text,
    composition text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars integer NOT NULL,
    galaxy_id integer,
    observed_season text
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_million_years integer NOT NULL,
    distance_from_earth integer,
    description text,
    has_life boolean NOT NULL,
    age_millions integer,
    diameter_light_years integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    is_active boolean NOT NULL
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


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
    planet_id integer NOT NULL,
    radius integer,
    is_spherical boolean NOT NULL,
    description text
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    radius integer,
    has_life boolean NOT NULL,
    distance_from_star numeric
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
    galaxy_id integer NOT NULL,
    mass integer,
    temperature integer,
    is_spherical boolean NOT NULL,
    description text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 70, 15, true, 'Most famous periodic comet', 'Ice and dust');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 44, 100, false, 'Great Comet of 1997', 'Frozen gases');
INSERT INTO public.comet VALUES (3, 'Encke', 31, 2, true, 'Shortest period of any known comet', 'Rocky core');


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 81, 1, 'Winter');
INSERT INTO public.constellation VALUES (2, 'Ursa Major', 93, 1, 'All year');
INSERT INTO public.constellation VALUES (3, 'Lyra', 9, 1, 'Summer');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 0, 'Our home galaxy', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 2537000, 'Nearest large galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000, 'Spiral galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 8000, 23000000, 'Interacting galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 9000, 29000000, 'Bright nucleus galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 13000, 21000000, 'Face-on spiral galaxy', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Cartwheel Galaxy', 12000, 500000000, 'Ring galaxy', false, 12000, 150000);
INSERT INTO public.galaxy VALUES (10, 'Black Eye Galaxy', 13000, 17000000, 'Galaxy with dark band', false, 13000, 50000);
INSERT INTO public.galaxy VALUES (11, 'Messier 87', 14000, 53000000, 'Supergiant elliptical galaxy', false, 14000, 120000);


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Local Group', 'Contains the Milky Way', true);
INSERT INTO public.galaxy_cluster VALUES (2, 'Virgo Cluster', 'Large cluster of galaxies', true);
INSERT INTO public.galaxy_cluster VALUES (3, 'Coma Cluster', 'Contains over 1000 galaxies', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 1737, true, 'Earth moon');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 11, false, 'Mars moon');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 6, false, 'Mars moon');
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, 'Jupiter moon');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, true, 'Jupiter moon');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, 'Largest moon');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, 'Jupiter moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, 'Saturn moon');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, 'Icy moon');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, true, 'Small moon');
INSERT INTO public.moon VALUES (11, 'Triton', 8, 1353, true, 'Neptune moon');
INSERT INTO public.moon VALUES (12, 'Nereid', 8, 170, false, 'Irregular moon');
INSERT INTO public.moon VALUES (13, 'Moon A', 9, 500, true, 'Test moon');
INSERT INTO public.moon VALUES (14, 'Moon B', 9, 600, true, 'Test moon');
INSERT INTO public.moon VALUES (15, 'Moon C', 10, 700, true, 'Test moon');
INSERT INTO public.moon VALUES (16, 'Moon D', 10, 800, true, 'Test moon');
INSERT INTO public.moon VALUES (17, 'Moon E', 11, 900, true, 'Test moon');
INSERT INTO public.moon VALUES (18, 'Moon F', 11, 1000, true, 'Test moon');
INSERT INTO public.moon VALUES (19, 'Moon G', 12, 1100, true, 'Test moon');
INSERT INTO public.moon VALUES (20, 'Moon H', 12, 1200, true, 'Test moon');
INSERT INTO public.moon VALUES (21, 'Moon X1', 1, 1200, true, 'Test moon 1');
INSERT INTO public.moon VALUES (22, 'Moon X2', 2, 800, false, 'Test moon 2');
INSERT INTO public.moon VALUES (23, 'Moon X3', 3, 950, true, 'Test moon 3');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 6371, true, 1.0);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 3390, false, 1.5);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 6052, false, 0.7);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 2440, false, 0.4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 69911, false, 5.2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 58232, false, 9.5);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25362, false, 19.8);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24622, false, 30.1);
INSERT INTO public.planet VALUES (9, 'Planet X', 2, 5000, false, 2.1);
INSERT INTO public.planet VALUES (10, 'Planet Y', 3, 7000, false, 3.3);
INSERT INTO public.planet VALUES (11, 'Planet Z', 4, 8000, false, 4.4);
INSERT INTO public.planet VALUES (12, 'Planet W', 5, 9000, false, 5.5);
INSERT INTO public.planet VALUES (13, 'Planet Omega', 1, 7000, false, 150.5);
INSERT INTO public.planet VALUES (14, 'Planet Nova', 2, 8500, false, 300.2);
INSERT INTO public.planet VALUES (15, 'Planet TitanX', 1, 9500, false, 500.8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1000, 5500, true, 'Our star');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 2000, 9900, true, 'Bright star');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3000, 3500, true, 'Red supergiant');
INSERT INTO public.star VALUES (4, 'Rigel', 2, 4000, 11000, true, 'Blue supergiant');
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 3, 500, 3000, true, 'Closest star');
INSERT INTO public.star VALUES (6, 'Vega', 4, 1500, 9600, true, 'Bright in Lyra');
INSERT INTO public.star VALUES (7, 'Polaris', 1, 5400, 6000, true, 'North Star');
INSERT INTO public.star VALUES (8, 'Spica', 2, 11000, 22400, true, 'Binary star system');
INSERT INTO public.star VALUES (9, 'Arcturus', 1, 1700, 4300, true, 'Bright orange giant');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 11, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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


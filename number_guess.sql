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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    games_played integer NOT NULL,
    user_id integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_games_played_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_games_played_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_games_played_seq OWNER TO freecodecamp;

--
-- Name: games_games_played_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_games_played_seq OWNED BY public.games.games_played;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games games_played; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN games_played SET DEFAULT nextval('public.games_games_played_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 332);
INSERT INTO public.games VALUES (2, 1, 447);
INSERT INTO public.games VALUES (3, 2, 681);
INSERT INTO public.games VALUES (4, 2, 179);
INSERT INTO public.games VALUES (5, 1, 535);
INSERT INTO public.games VALUES (6, 1, 191);
INSERT INTO public.games VALUES (7, 1, 535);
INSERT INTO public.games VALUES (8, 3, 184);
INSERT INTO public.games VALUES (9, 3, 148);
INSERT INTO public.games VALUES (10, 4, 970);
INSERT INTO public.games VALUES (11, 4, 391);
INSERT INTO public.games VALUES (12, 3, 742);
INSERT INTO public.games VALUES (13, 3, 696);
INSERT INTO public.games VALUES (14, 3, 658);
INSERT INTO public.games VALUES (15, 5, 593);
INSERT INTO public.games VALUES (16, 5, 851);
INSERT INTO public.games VALUES (17, 6, 388);
INSERT INTO public.games VALUES (18, 6, 392);
INSERT INTO public.games VALUES (19, 5, 950);
INSERT INTO public.games VALUES (20, 5, 568);
INSERT INTO public.games VALUES (21, 5, 7);
INSERT INTO public.games VALUES (22, 7, 32);
INSERT INTO public.games VALUES (23, 7, 983);
INSERT INTO public.games VALUES (24, 8, 4);
INSERT INTO public.games VALUES (25, 8, 133);
INSERT INTO public.games VALUES (26, 7, 850);
INSERT INTO public.games VALUES (27, 7, 719);
INSERT INTO public.games VALUES (28, 7, 90);
INSERT INTO public.games VALUES (29, 9, 601);
INSERT INTO public.games VALUES (30, 9, 878);
INSERT INTO public.games VALUES (31, 10, 409);
INSERT INTO public.games VALUES (32, 10, 612);
INSERT INTO public.games VALUES (33, 9, 64);
INSERT INTO public.games VALUES (34, 9, 406);
INSERT INTO public.games VALUES (35, 9, 284);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1714508377390');
INSERT INTO public.users VALUES (2, 'user_1714508377389');
INSERT INTO public.users VALUES (3, 'user_1714508444149');
INSERT INTO public.users VALUES (4, 'user_1714508444148');
INSERT INTO public.users VALUES (5, 'user_1714508519879');
INSERT INTO public.users VALUES (6, 'user_1714508519878');
INSERT INTO public.users VALUES (7, 'user_1714508524949');
INSERT INTO public.users VALUES (8, 'user_1714508524948');
INSERT INTO public.users VALUES (9, 'user_1714508528257');
INSERT INTO public.users VALUES (10, 'user_1714508528256');


--
-- Name: games_games_played_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_games_played_seq', 35, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (games_played);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--


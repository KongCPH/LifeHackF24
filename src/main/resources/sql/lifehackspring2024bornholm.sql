--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-02 15:12:23 UTC

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 32942)
-- Name: c1_lifecycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.c1_lifecycle (
    lifecycle_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.c1_lifecycle OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32945)
-- Name: c1_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.c1_task (
    task_id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(250) NOT NULL,
    responsible character varying(100),
    us_id integer,
    lifecycle_id integer DEFAULT 0 NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.c1_task OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 32949)
-- Name: c1_team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.c1_team (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE public.c1_team OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32952)
-- Name: c1_team_team_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.c1_team_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.c1_team_team_id_seq OWNER TO postgres;

--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 218
-- Name: c1_team_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.c1_team_team_id_seq OWNED BY public.c1_team.team_id;


--
-- TOC entry 219 (class 1259 OID 32953)
-- Name: c1_user_story; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.c1_user_story (
    us_id integer NOT NULL,
    title character varying(50) NOT NULL,
    description character varying(250) NOT NULL,
    acceptance_criteria character varying(250) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.c1_user_story OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32958)
-- Name: food_in_season; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_in_season (
    food_month character varying(70) NOT NULL,
    food_category character varying(70) NOT NULL,
    food_item character varying(70) NOT NULL,
    food_description character varying(50),
    food_id integer NOT NULL
);


ALTER TABLE public.food_in_season OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 32961)
-- Name: food_in_season_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_in_season_food_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_in_season_food_id_seq OWNER TO postgres;

--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 221
-- Name: food_in_season_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_in_season_food_id_seq OWNED BY public.food_in_season.food_id;


--
-- TOC entry 222 (class 1259 OID 32962)
-- Name: instructions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instructions (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE public.instructions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 32967)
-- Name: instructions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instructions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instructions_id_seq OWNER TO postgres;

--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 223
-- Name: instructions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instructions_id_seq OWNED BY public.instructions.id;


--
-- TOC entry 224 (class 1259 OID 32968)
-- Name: message; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.message (
    message_id integer NOT NULL,
    sender character varying(50) NOT NULL,
    message character varying(2000) NOT NULL,
    receiver character varying(50) NOT NULL,
    "time" character varying NOT NULL
);


ALTER TABLE public.message OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 32973)
-- Name: message_message_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.message_message_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.message_message_id_seq OWNER TO postgres;

--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 225
-- Name: message_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.message_message_id_seq OWNED BY public.message.message_id;


--
-- TOC entry 226 (class 1259 OID 32974)
-- Name: task_task_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.task_task_id_seq OWNER TO postgres;

--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 226
-- Name: task_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_task_id_seq OWNED BY public.c1_task.task_id;


--
-- TOC entry 227 (class 1259 OID 32975)
-- Name: user_story_us_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_story_us_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_story_us_id_seq OWNER TO postgres;

--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_story_us_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_story_us_id_seq OWNED BY public.c1_user_story.us_id;


--
-- TOC entry 228 (class 1259 OID 32976)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    role character varying(20) DEFAULT USER NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 32980)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 3237 (class 2604 OID 32981)
-- Name: c1_task task_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_task ALTER COLUMN task_id SET DEFAULT nextval('public.task_task_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 32982)
-- Name: c1_team team_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_team ALTER COLUMN team_id SET DEFAULT nextval('public.c1_team_team_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 32983)
-- Name: c1_user_story us_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_user_story ALTER COLUMN us_id SET DEFAULT nextval('public.user_story_us_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 32984)
-- Name: food_in_season food_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_in_season ALTER COLUMN food_id SET DEFAULT nextval('public.food_in_season_food_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 32985)
-- Name: instructions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions ALTER COLUMN id SET DEFAULT nextval('public.instructions_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 32986)
-- Name: message message_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message ALTER COLUMN message_id SET DEFAULT nextval('public.message_message_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 32987)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3413 (class 0 OID 32942)
-- Dependencies: 215
-- Data for Name: c1_lifecycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.c1_lifecycle VALUES (0, 'Backlog');
INSERT INTO public.c1_lifecycle VALUES (1, 'Doing');
INSERT INTO public.c1_lifecycle VALUES (2, 'Testing');
INSERT INTO public.c1_lifecycle VALUES (3, 'Done');


--
-- TOC entry 3414 (class 0 OID 32945)
-- Dependencies: 216
-- Data for Name: c1_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.c1_task VALUES (7, 'Bibbity bob', 'oaiwjda', 'Jens', NULL, 3, 1);
INSERT INTO public.c1_task VALUES (1, 'Team login', 'Make sure a user can log in to a team', 'Peter', NULL, 1, 1);
INSERT INTO public.c1_task VALUES (4, 'Test', 'test', 'Peter', NULL, 1, 1);
INSERT INTO public.c1_task VALUES (3, 'Test', 'This is me testing', 'Peter', NULL, 0, 2);
INSERT INTO public.c1_task VALUES (6, 'Finish remaining styling', 'Names need to be under tasks, and should be able to view description', NULL, NULL, 0, 1);
INSERT INTO public.c1_task VALUES (8, 'djflks', 'dfs', NULL, NULL, 0, 7);
INSERT INTO public.c1_task VALUES (42, 'hello', 'buy milk', 'signe', NULL, 3, 40);
INSERT INTO public.c1_task VALUES (43, 'hello', 'dsfsd', NULL, NULL, 0, 40);


--
-- TOC entry 3415 (class 0 OID 32949)
-- Dependencies: 217
-- Data for Name: c1_team; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.c1_team VALUES (1, 'team1', '1234');
INSERT INTO public.c1_team VALUES (2, 'team2', '1234');
INSERT INTO public.c1_team VALUES (3, 'TeamPLSWORK', '1234');
INSERT INTO public.c1_team VALUES (4, 'team1', '1234');
INSERT INTO public.c1_team VALUES (5, 'testingteams', '1234');
INSERT INTO public.c1_team VALUES (6, 'teamtest2', '1234');
INSERT INTO public.c1_team VALUES (7, 'halloTeam', '123');
INSERT INTO public.c1_team VALUES (40, 'TeamSøborg', '1234');
INSERT INTO public.c1_team VALUES (41, 'TeamSøborg', '1234');
INSERT INTO public.c1_team VALUES (42, 'TeamSøborg', '1234');


--
-- TOC entry 3417 (class 0 OID 32953)
-- Dependencies: 219
-- Data for Name: c1_user_story; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.c1_user_story VALUES (2, 'Team login', 'As a user I want to log in with my team login, so I can see the tasks related to my team', 'Login succesful to the correct team', 1);


--
-- TOC entry 3418 (class 0 OID 32958)
-- Dependencies: 220
-- Data for Name: food_in_season; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.food_in_season VALUES ('April', 'mushrooms', 'Morel', NULL, 76);
INSERT INTO public.food_in_season VALUES ('May', 'mushrooms', 'Morel', NULL, 124);
INSERT INTO public.food_in_season VALUES ('January', 'fish', 'Cod', NULL, 23);
INSERT INTO public.food_in_season VALUES ('January', 'fish', 'Herring', NULL, 24);
INSERT INTO public.food_in_season VALUES ('February', 'fish', 'Cod', NULL, 33);
INSERT INTO public.food_in_season VALUES ('February', 'fish', 'Herring', NULL, 34);
INSERT INTO public.food_in_season VALUES ('March', 'fish', 'Cod', NULL, 41);
INSERT INTO public.food_in_season VALUES ('March', 'fish', 'Herring', NULL, 42);
INSERT INTO public.food_in_season VALUES ('April', 'fish', 'Herring', NULL, 73);
INSERT INTO public.food_in_season VALUES ('April', 'fish', 'Salmon', NULL, 74);
INSERT INTO public.food_in_season VALUES ('April', 'fish', 'Trout', NULL, 75);
INSERT INTO public.food_in_season VALUES ('May', 'fish', 'Herring', NULL, 121);
INSERT INTO public.food_in_season VALUES ('May', 'fish', 'Salmon', NULL, 122);
INSERT INTO public.food_in_season VALUES ('May', 'fish', 'Trout', NULL, 123);
INSERT INTO public.food_in_season VALUES ('January', 'fruits', 'Apples', NULL, 15);
INSERT INTO public.food_in_season VALUES ('January', 'fruits', 'Pears', NULL, 16);
INSERT INTO public.food_in_season VALUES ('February', 'fruits', 'Apples', NULL, 25);
INSERT INTO public.food_in_season VALUES ('February', 'fruits', 'Pears', NULL, 26);
INSERT INTO public.food_in_season VALUES ('April', 'fruits', 'Apples', NULL, 63);
INSERT INTO public.food_in_season VALUES ('April', 'fruits', 'Rhubarb', NULL, 64);
INSERT INTO public.food_in_season VALUES ('April', 'fruits', 'Kiwi', NULL, 65);
INSERT INTO public.food_in_season VALUES ('May', 'fruits', 'Strawberries', NULL, 111);
INSERT INTO public.food_in_season VALUES ('May', 'fruits', 'Rhubarb', NULL, 112);
INSERT INTO public.food_in_season VALUES ('May', 'fruits', 'Kiwi', NULL, 113);
INSERT INTO public.food_in_season VALUES ('June', 'fruits', 'Strawberries', NULL, 125);
INSERT INTO public.food_in_season VALUES ('June', 'fruits', 'Cherries', NULL, 126);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Cabbage', NULL, 27);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Brussels sprouts', NULL, 28);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Kale', NULL, 29);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Leeks', NULL, 30);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Potatoes', NULL, 31);
INSERT INTO public.food_in_season VALUES ('February', 'vegetables', 'Turnips', NULL, 32);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Cabbage', NULL, 35);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Brussels sprouts', NULL, 36);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Kale', NULL, 37);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Leeks', NULL, 38);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Potatoes', NULL, 39);
INSERT INTO public.food_in_season VALUES ('March', 'vegetables', 'Turnips', NULL, 40);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Spinach', NULL, 66);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Lettuce', NULL, 67);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Radishes', NULL, 68);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Peas', NULL, 69);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Fennel', NULL, 70);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Artichokes', NULL, 71);
INSERT INTO public.food_in_season VALUES ('April', 'vegetables', 'Carrots', NULL, 72);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Asparagus', NULL, 114);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Lettuce', NULL, 115);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Spinach', NULL, 116);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Peas', NULL, 117);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Fennel', NULL, 118);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Artichokes', NULL, 119);
INSERT INTO public.food_in_season VALUES ('May', 'vegetables', 'Carrots', NULL, 120);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'Cabbage', NULL, 17);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'Brussels sprouts', NULL, 18);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'kale', NULL, 19);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'leeks', NULL, 20);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'turnips', NULL, 21);
INSERT INTO public.food_in_season VALUES ('January', 'vegetables', 'potatoes', NULL, 22);
INSERT INTO public.food_in_season VALUES ('June', 'toxic mushrooms', 'Death Cap', NULL, 140);
INSERT INTO public.food_in_season VALUES ('July', 'toxic mushrooms', 'Death Cap', NULL, 141);
INSERT INTO public.food_in_season VALUES ('August', 'toxic mushrooms', 'Death Cap', NULL, 142);
INSERT INTO public.food_in_season VALUES ('August', 'toxic mushrooms', 'Webcaps', NULL, 143);
INSERT INTO public.food_in_season VALUES ('September', 'toxic mushrooms', 'Death Cap', NULL, 144);
INSERT INTO public.food_in_season VALUES ('September', 'toxic mushrooms', 'Webcaps', NULL, 145);
INSERT INTO public.food_in_season VALUES ('September', 'toxic mushrooms', 'Galerina Marginata', NULL, 146);
INSERT INTO public.food_in_season VALUES ('October', 'toxic mushrooms', 'Death Cap', NULL, 147);
INSERT INTO public.food_in_season VALUES ('October', 'toxic mushrooms', 'Webcaps', NULL, 148);
INSERT INTO public.food_in_season VALUES ('October', 'toxic mushrooms', 'Galerina Marginata', NULL, 149);
INSERT INTO public.food_in_season VALUES ('November', 'toxic mushrooms', 'Webcaps', NULL, 150);
INSERT INTO public.food_in_season VALUES ('June', 'mushrooms', 'Morel', NULL, 138);
INSERT INTO public.food_in_season VALUES ('June', 'mushrooms', 'Chanterelle', NULL, 139);
INSERT INTO public.food_in_season VALUES ('July', 'mushrooms', 'Chanterelle', NULL, 240);
INSERT INTO public.food_in_season VALUES ('July', 'mushrooms', 'Porcini', NULL, 241);
INSERT INTO public.food_in_season VALUES ('June', 'fish', 'Herring', NULL, 135);
INSERT INTO public.food_in_season VALUES ('June', 'fish', 'Salmon', NULL, 136);
INSERT INTO public.food_in_season VALUES ('June', 'fish', 'Trout', NULL, 137);
INSERT INTO public.food_in_season VALUES ('July', 'fish', 'Herring', NULL, 237);
INSERT INTO public.food_in_season VALUES ('July', 'fish', 'Mackerel', NULL, 238);
INSERT INTO public.food_in_season VALUES ('July', 'fish', 'Trout', NULL, 239);
INSERT INTO public.food_in_season VALUES ('June', 'fruits', 'Kiwi', NULL, 127);
INSERT INTO public.food_in_season VALUES ('July', 'fruits', 'Strawberries', NULL, 226);
INSERT INTO public.food_in_season VALUES ('July', 'fruits', 'Cherries', NULL, 227);
INSERT INTO public.food_in_season VALUES ('July', 'fruits', 'Raspberries', NULL, 228);
INSERT INTO public.food_in_season VALUES ('July', 'fruits', 'Blackberries', NULL, 229);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Asparagus', NULL, 128);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Lettuce', NULL, 129);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Spinach', NULL, 130);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Peas', NULL, 131);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Fennel', NULL, 132);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Artichokes', NULL, 133);
INSERT INTO public.food_in_season VALUES ('June', 'vegetables', 'Carrots', NULL, 134);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Beets', NULL, 230);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Carrots', NULL, 231);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Cucumbers', NULL, 232);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Zucchini', NULL, 233);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Tomatoes', NULL, 234);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Onions', NULL, 235);
INSERT INTO public.food_in_season VALUES ('July', 'vegetables', 'Potatoes', NULL, 236);
INSERT INTO public.food_in_season VALUES ('August', 'mushrooms', 'Chanterelle', NULL, 346);
INSERT INTO public.food_in_season VALUES ('August', 'mushrooms', 'Porcini', NULL, 347);
INSERT INTO public.food_in_season VALUES ('September', 'mushrooms', 'Chanterelle', NULL, 362);
INSERT INTO public.food_in_season VALUES ('September', 'mushrooms', 'Porcini', NULL, 363);
INSERT INTO public.food_in_season VALUES ('October', 'mushrooms', 'Chanterelle', NULL, 379);
INSERT INTO public.food_in_season VALUES ('October', 'mushrooms', 'Porcini', NULL, 380);
INSERT INTO public.food_in_season VALUES ('November', 'mushrooms', 'Chanterelle', NULL, 396);
INSERT INTO public.food_in_season VALUES ('November', 'mushrooms', 'Porcini', NULL, 397);
INSERT INTO public.food_in_season VALUES ('August', 'fish', 'Herring', NULL, 343);
INSERT INTO public.food_in_season VALUES ('August', 'fish', 'Mackerel', NULL, 344);
INSERT INTO public.food_in_season VALUES ('August', 'fish', 'Trout', NULL, 345);
INSERT INTO public.food_in_season VALUES ('September', 'fish', 'Herring', NULL, 359);
INSERT INTO public.food_in_season VALUES ('September', 'fish', 'Mackerel', NULL, 360);
INSERT INTO public.food_in_season VALUES ('September', 'fish', 'Trout', NULL, 361);
INSERT INTO public.food_in_season VALUES ('October', 'fish', 'Herring', NULL, 375);
INSERT INTO public.food_in_season VALUES ('October', 'fish', 'Cod', NULL, 376);
INSERT INTO public.food_in_season VALUES ('October', 'fish', 'Mackerel', NULL, 377);
INSERT INTO public.food_in_season VALUES ('October', 'fish', 'Trout', NULL, 378);
INSERT INTO public.food_in_season VALUES ('November', 'fish', 'Herring', NULL, 392);
INSERT INTO public.food_in_season VALUES ('November', 'fish', 'Cod', NULL, 393);
INSERT INTO public.food_in_season VALUES ('November', 'fish', 'Mackerel', NULL, 394);
INSERT INTO public.food_in_season VALUES ('November', 'fish', 'Trout', NULL, 395);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Beets', NULL, 336);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Carrots', NULL, 337);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Cucumbers', NULL, 338);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Zucchini', NULL, 339);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Tomatoes', NULL, 340);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Onions', NULL, 341);
INSERT INTO public.food_in_season VALUES ('August', 'vegetables', 'Potatoes', NULL, 342);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Cabbage', NULL, 352);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Carrots', NULL, 353);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Kale', NULL, 354);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Zucchini', NULL, 355);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Tomatoes', NULL, 356);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Onions', NULL, 357);
INSERT INTO public.food_in_season VALUES ('December', 'mushrooms', 'Chanterelle', NULL, 411);
INSERT INTO public.food_in_season VALUES ('December', 'mushrooms', 'Porcini', NULL, 412);
INSERT INTO public.food_in_season VALUES ('December', 'fish', 'Herring', NULL, 408);
INSERT INTO public.food_in_season VALUES ('December', 'fish', 'Cod', NULL, 409);
INSERT INTO public.food_in_season VALUES ('December', 'fish', 'Trout', NULL, 410);
INSERT INTO public.food_in_season VALUES ('August', 'fruits', 'Apples', NULL, 332);
INSERT INTO public.food_in_season VALUES ('August', 'fruits', 'Blackberries', NULL, 333);
INSERT INTO public.food_in_season VALUES ('August', 'fruits', 'Raspberries', NULL, 334);
INSERT INTO public.food_in_season VALUES ('August', 'fruits', 'Peaches', NULL, 335);
INSERT INTO public.food_in_season VALUES ('September', 'fruits', 'Apples', NULL, 348);
INSERT INTO public.food_in_season VALUES ('September', 'fruits', 'Blackberries', NULL, 349);
INSERT INTO public.food_in_season VALUES ('September', 'fruits', 'Raspberries', NULL, 350);
INSERT INTO public.food_in_season VALUES ('September', 'fruits', 'Plums', NULL, 351);
INSERT INTO public.food_in_season VALUES ('October', 'fruits', 'Apples', NULL, 364);
INSERT INTO public.food_in_season VALUES ('October', 'fruits', 'Cranberries', NULL, 365);
INSERT INTO public.food_in_season VALUES ('October', 'fruits', 'Grapes', NULL, 366);
INSERT INTO public.food_in_season VALUES ('November', 'fruits', 'Apples', NULL, 381);
INSERT INTO public.food_in_season VALUES ('November', 'fruits', 'Cranberries', NULL, 382);
INSERT INTO public.food_in_season VALUES ('November', 'fruits', 'Grapes', NULL, 383);
INSERT INTO public.food_in_season VALUES ('December', 'fruits', 'Apples', NULL, 398);
INSERT INTO public.food_in_season VALUES ('December', 'fruits', 'Cranberries', NULL, 399);
INSERT INTO public.food_in_season VALUES ('December', 'fruits', 'Grapes', NULL, 400);
INSERT INTO public.food_in_season VALUES ('March', 'fruits', 'Apples', NULL, 413);
INSERT INTO public.food_in_season VALUES ('March', 'fruits', 'Pears', NULL, 414);
INSERT INTO public.food_in_season VALUES ('September', 'vegetables', 'Potatoes', NULL, 358);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Cabbage', NULL, 367);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Carrots', NULL, 368);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Kale', NULL, 369);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Pumpkin', NULL, 370);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Parsnips', NULL, 371);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Celery', NULL, 372);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Onions', NULL, 373);
INSERT INTO public.food_in_season VALUES ('October', 'vegetables', 'Potatoes', NULL, 374);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Cabbage', NULL, 384);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Carrots', NULL, 385);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Kale', NULL, 386);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Pumpkin', NULL, 387);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Parsnips', NULL, 388);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Celery', NULL, 389);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Onions', NULL, 390);
INSERT INTO public.food_in_season VALUES ('November', 'vegetables', 'Potatoes', NULL, 391);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Cabbage', NULL, 401);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Brussels sprouts', NULL, 402);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Kale', NULL, 403);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Leeks', NULL, 404);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Potatoes', NULL, 405);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Turnips', NULL, 406);
INSERT INTO public.food_in_season VALUES ('December', 'vegetables', 'Onions', NULL, 407);


--
-- TOC entry 3420 (class 0 OID 32962)
-- Dependencies: 222
-- Data for Name: instructions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instructions VALUES (1, 'washme', 'Symbolet med vaskebaljen angiver at tøjet kan maskinvaskes, og figuren viser samtidig også den maksimale vasketemperatur, som tøjet tåler. Hvis symbolet er understreget, betyder det, at tøjet skal vaskes skånsomt. To understregninger angiver, at tøjet skal vaskes meget skånsomt.');
INSERT INTO public.instructions VALUES (2, 'dontwash', 'Tåler ikke vask. Dette symbol angiver, at tøjet hverken tåler maskinvask eller håndvask.');
INSERT INTO public.instructions VALUES (3, 'handwash', 'Håndvask. Dette er symbolet for håndvask, og den maksimale temperatur er 40 grader. Tøjet bør ikke vrides eller skrubbes. Tjek om din vaskemaskine har et specielt program til håndvask.');
INSERT INTO public.instructions VALUES (4, 'chemical_w', 'Et W indikerer, at tøjet tåler kemisk rens i vand. Det udføres af et professionelt vaskeri.');
INSERT INTO public.instructions VALUES (5, 'chemical_p', 'Dette symbol betyder, at tøjet kun tåler kemisk rensning med petroleumsbaserede opløsningsmidler');
INSERT INTO public.instructions VALUES (6, 'nochemicals', 'Hvis tøjet har et symbol med et kryds hen over en cirkel, betyder det, at tøjet ikke tåler kemisk rens. Det må i stedet håndvaskes.');
INSERT INTO public.instructions VALUES (7, 'canbleach', 'En hvid trekant betyder, at tøjet tåler blegning. Alle typer blegeprodukter i almindelig handel kan bruges i vaskeprocessen.');
INSERT INTO public.instructions VALUES (8, 'dontbleach', 'Dette symbol indikerer, at blegemiddel ikke bør anvendes. Tøjet er ikke farveægte eller stærkt nok til at modstå nogen former for blegning.');
INSERT INTO public.instructions VALUES (9, 'toerretumbler', 'Et symbol med hvid cirkel i en firkant betyder, at tøjet kan tørretumbles. Prikkerne angiver, hvor høj en temperatur, tøjet tåler. En prik betyder, at tøjet kun bør tørres ved lav temperatur. To prikker angiver, at tøjet kan tørretumbles ved normal temperatur.');
INSERT INTO public.instructions VALUES (10, 'dontdry', 'Et lignende symbol men med et kryds henover betyder, at tøjet ikke tåler at blive tørretumblet. Sammen med dette symbol angives i stedet en mild metode for tørring.');
INSERT INTO public.instructions VALUES (11, 'ironme', 'Disse symboler viser, at tøjet kan stryges. Prikkerne indikerer temperaturindstillingerne. En prik betyder, at tøjet kan stryges på maks. 110 grader. To prikker betyder, at tøjet kan stryges på maks. 150 grader, og 3 prikker betyder, at tøjet kan stryges på maks. 200 grader.');
INSERT INTO public.instructions VALUES (12, 'dontironme', 'Symbolet indikerer, at tøjet ikke tåler strygning. Strygejern bør ikke bruges.');


--
-- TOC entry 3422 (class 0 OID 32968)
-- Dependencies: 224
-- Data for Name: message; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.message VALUES (1, 'louis', 'hej alle sammen!', '@AlL', '20-03-2024 12:40:33');
INSERT INTO public.message VALUES (2, 'jon', 'Hey there!', 'bingo', '20-03-2024 13:15:22');
INSERT INTO public.message VALUES (3, 'bingo', 'Whats up?', 'jon', '20-03-2024 13:17:45');
INSERT INTO public.message VALUES (4, 'ole', 'Hi guys!', '@AlL', '20-03-2024 13:20:10');
INSERT INTO public.message VALUES (5, 'dennis', 'Hello everyone!', '@AlL', '20-03-2024 13:22:58');
INSERT INTO public.message VALUES (6, 'louis', 'Hows everyone doing today?', '@AlL', '20-03-2024 13:25:37');
INSERT INTO public.message VALUES (7, 'jon', 'IM good, thanks ! ', '@AlL', '20-03-2024 13:28:14');
INSERT INTO public.message VALUES (8, 'bingo', 'Just chilling.', '@AlL', '20-03-2024 13:30:45');
INSERT INTO public.message VALUES (9, 'ole', 'Im doing great, thanks for asking!', '@AlL', '20-03-2024 13:33:21');
INSERT INTO public.message VALUES (10, 'dennis', 'IM doing alright, could be better.', '@AlL', '20-03-2024 13:36:02');
INSERT INTO public.message VALUES (11, 'louis', 'Glad TO hear you guys are doing okay.', '@AlL', '20-03-2024 13:38:49');
INSERT INTO public.message VALUES (12, 'jon', 'Anyone up FOR a game later?', '@AlL', '20-03-2024 13:41:25');
INSERT INTO public.message VALUES (13, 'bingo', 'Sure, what game?', '@AlL', '20-03-2024 13:44:17');
INSERT INTO public.message VALUES (14, 'ole', 'Count me IN!', '@AlL', '20-03-2024 13:47:01');
INSERT INTO public.message VALUES (15, 'dennis', 'Im down for some gaming.', '@AlL', '20-03-2024 13:49:42');
INSERT INTO public.message VALUES (16, 'louis', 'Sounds like fun!', '@AlL', '20-03-2024 13:52:30');
INSERT INTO public.message VALUES (17, 'jon', 'How about we play some Among Us?', '@AlL', '20-03-2024 13:55:12');
INSERT INTO public.message VALUES (18, 'bingo', 'Yeah, that sounds great!', '@AlL', '20-03-2024 13:58:07');
INSERT INTO public.message VALUES (19, 'ole', 'I love Among Us! Count me in!', '@AlL', '20-03-2024 14:01:01');
INSERT INTO public.message VALUES (20, 'dennis', 'Sure, IM up FOR SOME impostor ACTION.', '@AlL', '20-03-2024 14:03:59');
INSERT INTO public.message VALUES (21, 'louis', 'Among Us it IS THEN!', '@AlL', '20-03-2024 14:06:58');
INSERT INTO public.message VALUES (22, 'SYSTEM', 'USER ''jon'' JOINED', '@AlL', '21-03-2024 18:59:16');
INSERT INTO public.message VALUES (23, 'jon', 'hej hej', '@AlL', '21-03-2024 18:59:22');
INSERT INTO public.message VALUES (24, 'SYSTEM', 'USER ''jon'' JOINED', '@AlL', '21-03-2024 19:24:05');
INSERT INTO public.message VALUES (25, 'jon', 'Er der nogle kodebamser på linjen?', '@AlL', '21-03-2024 19:24:26');
INSERT INTO public.message VALUES (26, 'SYSTEM', 'USER ''jon'' JOINED', '@AlL', '22-03-2024 08:31:40');
INSERT INTO public.message VALUES (27, 'jon', 'Hej Bingo - er du vågen?', 'bingo', '22-03-2024 08:32:04');
INSERT INTO public.message VALUES (28, 'SYSTEM', 'USER ''jon'' LEFT', '@AlL', '22-03-2024 08:37:04');
INSERT INTO public.message VALUES (29, 'SYSTEM', 'USER ''bingo'' JOINED', '@AlL', '02-04-2024 16:47:36');
INSERT INTO public.message VALUES (30, 'bingo', 'Så er jon på linjen igen', '@AlL', '02-04-2024 16:47:55');
INSERT INTO public.message VALUES (31, 'SYSTEM', 'USER ''jon'' JOINED', '@AlL', '02-04-2024 16:47:59');
INSERT INTO public.message VALUES (32, 'jon', 'Hej med dig Bingo', '@AlL', '02-04-2024 16:48:18');
INSERT INTO public.message VALUES (33, 'SYSTEM', 'USER ''jon'' LEFT', '@AlL', '02-04-2024 16:53:21');
INSERT INTO public.message VALUES (34, 'SYSTEM', 'USER ''bingo'' LEFT', '@AlL', '02-04-2024 16:53:31');


--
-- TOC entry 3426 (class 0 OID 32976)
-- Dependencies: 228
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES (1, 'jon', '1234', 'user');
INSERT INTO public.users VALUES (2, 'bingo', '1234', 'admin');
INSERT INTO public.users VALUES (3, 'ole', '1234', 'postgres');
INSERT INTO public.users VALUES (5, 'dennis', '1234', 'postgres');
INSERT INTO public.users VALUES (6, '@AlL', '1eshtrd92Rgsdg8374ag65', 'system');
INSERT INTO public.users VALUES (7, 'SYSTEM', '1eshtrd92Rgsdg8374ag65', 'system');
INSERT INTO public.users VALUES (8, 'louis', '1234', 'user');


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 218
-- Name: c1_team_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.c1_team_team_id_seq', 42, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 221
-- Name: food_in_season_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_in_season_food_id_seq', 414, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 223
-- Name: instructions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instructions_id_seq', 12, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 225
-- Name: message_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.message_message_id_seq', 34, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 226
-- Name: task_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_task_id_seq', 43, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_story_us_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_story_us_id_seq', 2, true);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 5, true);


--
-- TOC entry 3251 (class 2606 OID 32989)
-- Name: c1_team c1_team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_team
    ADD CONSTRAINT c1_team_pkey PRIMARY KEY (team_id);


--
-- TOC entry 3255 (class 2606 OID 32991)
-- Name: food_in_season food_in_season_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_in_season
    ADD CONSTRAINT food_in_season_pkey PRIMARY KEY (food_id);


--
-- TOC entry 3257 (class 2606 OID 32993)
-- Name: instructions instructions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instructions
    ADD CONSTRAINT instructions_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 32995)
-- Name: c1_lifecycle lifecycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_lifecycle
    ADD CONSTRAINT lifecycle_pkey PRIMARY KEY (lifecycle_id);


--
-- TOC entry 3259 (class 2606 OID 32997)
-- Name: message messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT messages_pkey PRIMARY KEY (message_id);


--
-- TOC entry 3249 (class 2606 OID 32999)
-- Name: c1_task task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_task
    ADD CONSTRAINT task_pkey PRIMARY KEY (task_id);


--
-- TOC entry 3261 (class 2606 OID 33001)
-- Name: users unique_username; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_username UNIQUE (username);


--
-- TOC entry 3253 (class 2606 OID 33003)
-- Name: c1_user_story user_story_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_user_story
    ADD CONSTRAINT user_story_pkey PRIMARY KEY (us_id);


--
-- TOC entry 3263 (class 2606 OID 33005)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3264 (class 2606 OID 33006)
-- Name: c1_task lifecycle_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_task
    ADD CONSTRAINT lifecycle_fkey FOREIGN KEY (lifecycle_id) REFERENCES public.c1_lifecycle(lifecycle_id) NOT VALID;


--
-- TOC entry 3268 (class 2606 OID 33011)
-- Name: message receiver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT receiver FOREIGN KEY (receiver) REFERENCES public.users(username) NOT VALID;


--
-- TOC entry 3269 (class 2606 OID 33016)
-- Name: message sender; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.message
    ADD CONSTRAINT sender FOREIGN KEY (sender) REFERENCES public.users(username) NOT VALID;


--
-- TOC entry 3265 (class 2606 OID 33021)
-- Name: c1_task team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_task
    ADD CONSTRAINT team_fkey FOREIGN KEY (team_id) REFERENCES public.c1_team(team_id) NOT VALID;


--
-- TOC entry 3267 (class 2606 OID 33026)
-- Name: c1_user_story team_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_user_story
    ADD CONSTRAINT team_fkey FOREIGN KEY (team_id) REFERENCES public.c1_team(team_id) NOT VALID;


--
-- TOC entry 3266 (class 2606 OID 33031)
-- Name: c1_task us_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.c1_task
    ADD CONSTRAINT us_fkey FOREIGN KEY (us_id) REFERENCES public.c1_user_story(us_id) NOT VALID;


-- Completed on 2024-04-02 15:12:23 UTC

--
-- PostgreSQL database dump complete
--


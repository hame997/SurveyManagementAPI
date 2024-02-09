--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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
-- Name: answer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answer (
    id integer NOT NULL,
    questionid integer,
    text character varying(255)
);


ALTER TABLE public.answer OWNER TO postgres;

--
-- Name: answer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answer_id_seq OWNER TO postgres;

--
-- Name: answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answer_id_seq OWNED BY public.answer.id;


--
-- Name: answerresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.answerresult (
    id integer NOT NULL,
    questionid integer,
    questiontext character varying(255),
    answerid integer,
    answertext character varying(255)
);


ALTER TABLE public.answerresult OWNER TO postgres;

--
-- Name: answerresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.answerresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answerresult_id_seq OWNER TO postgres;

--
-- Name: answerresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.answerresult_id_seq OWNED BY public.answerresult.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    id integer NOT NULL,
    surveyid integer,
    text character varying(255),
    typeofquestion character varying(50)
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_id_seq OWNED BY public.question.id;


--
-- Name: questionresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionresult (
    id integer NOT NULL,
    questionid integer,
    questiontext character varying(255),
    answerresults json
);


ALTER TABLE public.questionresult OWNER TO postgres;

--
-- Name: questionresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questionresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questionresult_id_seq OWNER TO postgres;

--
-- Name: questionresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questionresult_id_seq OWNED BY public.questionresult.id;


--
-- Name: survey; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.survey (
    id integer NOT NULL,
    title character varying(100),
    surveystarttime timestamp without time zone,
    surveyendtime timestamp without time zone,
    description text,
    createdby character varying(100)
);


ALTER TABLE public.survey OWNER TO postgres;

--
-- Name: survey_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.survey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.survey_id_seq OWNER TO postgres;

--
-- Name: survey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.survey_id_seq OWNED BY public.survey.id;


--
-- Name: surveymanagement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surveymanagement (
    id integer NOT NULL,
    surveyid integer,
    userid character varying(100)
);


ALTER TABLE public.surveymanagement OWNER TO postgres;

--
-- Name: surveymanagement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surveymanagement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surveymanagement_id_seq OWNER TO postgres;

--
-- Name: surveymanagement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surveymanagement_id_seq OWNED BY public.surveymanagement.id;


--
-- Name: surveyresponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surveyresponse (
    id integer NOT NULL,
    surveyid integer,
    userid character varying(100)
);


ALTER TABLE public.surveyresponse OWNER TO postgres;

--
-- Name: surveyresponse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surveyresponse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surveyresponse_id_seq OWNER TO postgres;

--
-- Name: surveyresponse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surveyresponse_id_seq OWNED BY public.surveyresponse.id;


--
-- Name: surveyresult; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.surveyresult (
    id integer NOT NULL,
    surveyid integer,
    submissiontime timestamp without time zone,
    respondentname character varying(100)
);


ALTER TABLE public.surveyresult OWNER TO postgres;

--
-- Name: surveyresult_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.surveyresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.surveyresult_id_seq OWNER TO postgres;

--
-- Name: surveyresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.surveyresult_id_seq OWNED BY public.surveyresult.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    passwordhash character varying(100),
    role character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer ALTER COLUMN id SET DEFAULT nextval('public.answer_id_seq'::regclass);


--
-- Name: answerresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answerresult ALTER COLUMN id SET DEFAULT nextval('public.answerresult_id_seq'::regclass);


--
-- Name: question id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN id SET DEFAULT nextval('public.question_id_seq'::regclass);


--
-- Name: questionresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionresult ALTER COLUMN id SET DEFAULT nextval('public.questionresult_id_seq'::regclass);


--
-- Name: survey id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey ALTER COLUMN id SET DEFAULT nextval('public.survey_id_seq'::regclass);


--
-- Name: surveymanagement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveymanagement ALTER COLUMN id SET DEFAULT nextval('public.surveymanagement_id_seq'::regclass);


--
-- Name: surveyresponse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresponse ALTER COLUMN id SET DEFAULT nextval('public.surveyresponse_id_seq'::regclass);


--
-- Name: surveyresult id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresult ALTER COLUMN id SET DEFAULT nextval('public.surveyresult_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answer (id, questionid, text) FROM stdin;
\.


--
-- Data for Name: answerresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.answerresult (id, questionid, questiontext, answerid, answertext) FROM stdin;
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question (id, surveyid, text, typeofquestion) FROM stdin;
\.


--
-- Data for Name: questionresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionresult (id, questionid, questiontext, answerresults) FROM stdin;
\.


--
-- Data for Name: survey; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.survey (id, title, surveystarttime, surveyendtime, description, createdby) FROM stdin;
\.


--
-- Data for Name: surveymanagement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surveymanagement (id, surveyid, userid) FROM stdin;
\.


--
-- Data for Name: surveyresponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surveyresponse (id, surveyid, userid) FROM stdin;
\.


--
-- Data for Name: surveyresult; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.surveyresult (id, surveyid, submissiontime, respondentname) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, passwordhash, role) FROM stdin;
\.


--
-- Name: answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answer_id_seq', 1, false);


--
-- Name: answerresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.answerresult_id_seq', 1, false);


--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_id_seq', 1, false);


--
-- Name: questionresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionresult_id_seq', 1, false);


--
-- Name: survey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.survey_id_seq', 1, false);


--
-- Name: surveymanagement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surveymanagement_id_seq', 1, false);


--
-- Name: surveyresponse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surveyresponse_id_seq', 1, false);


--
-- Name: surveyresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.surveyresult_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: answer answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answer
    ADD CONSTRAINT answer_pkey PRIMARY KEY (id);


--
-- Name: answerresult answerresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.answerresult
    ADD CONSTRAINT answerresult_pkey PRIMARY KEY (id);


--
-- Name: question question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: questionresult questionresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionresult
    ADD CONSTRAINT questionresult_pkey PRIMARY KEY (id);


--
-- Name: survey survey_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.survey
    ADD CONSTRAINT survey_pkey PRIMARY KEY (id);


--
-- Name: surveymanagement surveymanagement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveymanagement
    ADD CONSTRAINT surveymanagement_pkey PRIMARY KEY (id);


--
-- Name: surveyresponse surveyresponse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresponse
    ADD CONSTRAINT surveyresponse_pkey PRIMARY KEY (id);


--
-- Name: surveyresult surveyresult_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresult
    ADD CONSTRAINT surveyresult_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: surveymanagement fk_survey_management_survey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveymanagement
    ADD CONSTRAINT fk_survey_management_survey FOREIGN KEY (surveyid) REFERENCES public.survey(id);


--
-- Name: surveyresponse fk_survey_response_survey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresponse
    ADD CONSTRAINT fk_survey_response_survey FOREIGN KEY (surveyid) REFERENCES public.survey(id);


--
-- Name: surveyresult fk_survey_result_survey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.surveyresult
    ADD CONSTRAINT fk_survey_result_survey FOREIGN KEY (surveyid) REFERENCES public.survey(id);


--
-- PostgreSQL database dump complete
--


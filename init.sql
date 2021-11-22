--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Debian 14.1-1.pgdg110+1)
-- Dumped by pg_dump version 14.0

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: food_food; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.food_food (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    name character varying(200) NOT NULL,
    cover_image character varying(100) NOT NULL
);


ALTER TABLE public.food_food OWNER TO postgres;

--
-- Name: food_food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.food_food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.food_food_id_seq OWNER TO postgres;

--
-- Name: food_food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.food_food_id_seq OWNED BY public.food_food.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_order (
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    order_token uuid NOT NULL,
    restaurant_id bigint NOT NULL,
    user_id bigint NOT NULL,
    status character varying(20) NOT NULL
);


ALTER TABLE public.order_order OWNER TO postgres;

--
-- Name: order_orderfood; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_orderfood (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    food_id bigint NOT NULL,
    order_id uuid NOT NULL,
    total smallint NOT NULL,
    price numeric(6,2) NOT NULL,
    CONSTRAINT order_orderfood_total_check CHECK ((total >= 0))
);


ALTER TABLE public.order_orderfood OWNER TO postgres;

--
-- Name: order_orderfood_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_orderfood_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderfood_id_seq OWNER TO postgres;

--
-- Name: order_orderfood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_orderfood_id_seq OWNED BY public.order_orderfood.id;


--
-- Name: restaurant_menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_menu (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    food_id bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    "Amount" numeric(6,2) NOT NULL
);


ALTER TABLE public.restaurant_menu OWNER TO postgres;

--
-- Name: restaurant_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_menu_id_seq OWNER TO postgres;

--
-- Name: restaurant_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_menu_id_seq OWNED BY public.restaurant_menu.id;


--
-- Name: restaurant_restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_restaurant (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    name character varying(200) NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.restaurant_restaurant OWNER TO postgres;

--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_restaurant_id_seq OWNER TO postgres;

--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_restaurant_id_seq OWNED BY public.restaurant_restaurant.id;


--
-- Name: restaurant_restaurantcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_restaurantcategory (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    title character varying(200) NOT NULL,
    slug character varying(200) NOT NULL
);


ALTER TABLE public.restaurant_restaurantcategory OWNER TO postgres;

--
-- Name: restaurant_restaurantcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_restaurantcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_restaurantcategory_id_seq OWNER TO postgres;

--
-- Name: restaurant_restaurantcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_restaurantcategory_id_seq OWNED BY public.restaurant_restaurantcategory.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: food_food id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_food ALTER COLUMN id SET DEFAULT nextval('public.food_food_id_seq'::regclass);


--
-- Name: order_orderfood id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderfood ALTER COLUMN id SET DEFAULT nextval('public.order_orderfood_id_seq'::regclass);


--
-- Name: restaurant_menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_menu ALTER COLUMN id SET DEFAULT nextval('public.restaurant_menu_id_seq'::regclass);


--
-- Name: restaurant_restaurant id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurant ALTER COLUMN id SET DEFAULT nextval('public.restaurant_restaurant_id_seq'::regclass);


--
-- Name: restaurant_restaurantcategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurantcategory ALTER COLUMN id SET DEFAULT nextval('public.restaurant_restaurantcategory_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add User	6	add_user
22	Can change User	6	change_user
23	Can delete User	6	delete_user
24	Can view User	6	view_user
25	Can add Food	7	add_food
26	Can change Food	7	change_food
27	Can delete Food	7	delete_food
28	Can view Food	7	view_food
29	Can add Restaurant Category	8	add_restaurantcategory
30	Can change Restaurant Category	8	change_restaurantcategory
31	Can delete Restaurant Category	8	delete_restaurantcategory
32	Can view Restaurant Category	8	view_restaurantcategory
33	Can add Restaurant	9	add_restaurant
34	Can change Restaurant	9	change_restaurant
35	Can delete Restaurant	9	delete_restaurant
36	Can view Restaurant	9	view_restaurant
37	Can add Menu Item	10	add_menu
38	Can change Menu Item	10	change_menu
39	Can delete Menu Item	10	delete_menu
40	Can view Menu Item	10	view_menu
41	Can add Order	11	add_order
42	Can change Order	11	change_order
43	Can delete Order	11	delete_order
44	Can view Order	11	view_order
45	Can add Order Item	12	add_orderfood
46	Can change Order Item	12	change_orderfood
47	Can delete Order Item	12	delete_orderfood
48	Can view Order Item	12	view_orderfood
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email) FROM stdin;
1	pbkdf2_sha256$260000$hpE9roZRdBDZJIVA23mrIw$dQKTW0PtShXbYUJJ8VNOOj9u70EHaKZwhwDztQ6BvGQ=	2021-11-21 18:53:23.633131+00	t	Mehmet	KAYKISIZ	t	t	2021-11-20 21:03:42+00	m.kaykisiz@gmail.com
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-11-20 21:05:43.569283+00	1	Food object (1)	1	[{"added": {}}]	5	1
2	2021-11-20 21:05:48.48249+00	2	Food object (2)	1	[{"added": {}}]	5	1
3	2021-11-20 21:06:00.938592+00	3	Food object (3)	1	[{"added": {}}]	5	1
4	2021-11-20 21:06:06.590687+00	4	Food object (4)	1	[{"added": {}}]	5	1
5	2021-11-20 21:06:13.192923+00	5	Food object (5)	1	[{"added": {}}]	5	1
6	2021-11-20 21:06:20.729459+00	6	Food object (6)	1	[{"added": {}}]	5	1
7	2021-11-20 21:06:36.346526+00	7	Food object (7)	1	[{"added": {}}]	5	1
8	2021-11-20 21:06:41.519364+00	8	Food object (8)	1	[{"added": {}}]	5	1
9	2021-11-20 21:06:49.387684+00	9	Food object (9)	1	[{"added": {}}]	5	1
10	2021-11-20 21:12:42.974128+00	9	Food object (9)	2	[{"changed": {"fields": ["Name"]}}]	5	1
11	2021-11-20 21:17:51.299846+00	1	Döner/Kebap	1	[{"added": {}}]	6	1
12	2021-11-20 21:19:03.643209+00	1	Süper Dönerci	1	[{"added": {}}]	7	1
13	2021-11-20 21:19:25.260656+00	2	Ev Yemekleri	1	[{"added": {}}]	6	1
14	2021-11-20 21:19:39.331246+00	2	Harika Ev Yemekleri	1	[{"added": {}}]	7	1
15	2021-11-20 21:19:56.993231+00	3	Fast-Food	1	[{"added": {}}]	6	1
16	2021-11-20 21:19:59.528425+00	3	Bizim Büfe	1	[{"added": {}}]	7	1
17	2021-11-20 21:27:27.880679+00	3	Bizim Büfe	2	[{"added": {"name": "Menu Item", "object": "Bizim B\\u00fcfe Yengen Tost"}}, {"added": {"name": "Menu Item", "object": "Bizim B\\u00fcfe Goral\\u0131"}}, {"added": {"name": "Menu Item", "object": "Bizim B\\u00fcfe Dilli Ka\\u015farl\\u0131"}}]	7	1
18	2021-11-20 21:27:40.938067+00	2	Harika Ev Yemekleri	2	[{"added": {"name": "Menu Item", "object": "Harika Ev Yemekleri Kuru Fas\\u00fclye"}}, {"added": {"name": "Menu Item", "object": "Harika Ev Yemekleri Mercimek \\u00c7orbas\\u0131"}}, {"added": {"name": "Menu Item", "object": "Harika Ev Yemekleri Pilav"}}]	7	1
19	2021-11-20 21:27:53.227272+00	1	Süper Dönerci	2	[{"added": {"name": "Menu Item", "object": "S\\u00fcper D\\u00f6nerci D\\u00f6ner"}}, {"added": {"name": "Menu Item", "object": "S\\u00fcper D\\u00f6nerci Etibol \\u0130skender"}}, {"added": {"name": "Menu Item", "object": "S\\u00fcper D\\u00f6nerci \\u0130skender"}}]	7	1
20	2021-11-20 21:35:09.600365+00	c05731e4-f5ec-4c8f-9c09-d1d7f2304ea2	c05731e4-f5ec-4c8f-9c09-d1d7f2304ea2  2021-11-20 21:35:09.600255	1	[{"added": {}}, {"added": {"name": "Order Item", "object": "c05731e4-f5ec-4c8f-9c09-d1d7f2304ea2  2021-11-20 21:35:09.599226 Dilli Ka\\u015farl\\u0131"}}, {"added": {"name": "Order Item", "object": "c05731e4-f5ec-4c8f-9c09-d1d7f2304ea2  2021-11-20 21:35:09.599259 Goral\\u0131"}}, {"added": {"name": "Order Item", "object": "c05731e4-f5ec-4c8f-9c09-d1d7f2304ea2  2021-11-20 21:35:09.599282 Goral\\u0131"}}]	11	1
21	2021-11-20 21:35:09.746336+00	61e22d7d-da0e-4cb7-a67e-d5fa2e50d505	61e22d7d-da0e-4cb7-a67e-d5fa2e50d505  2021-11-20 21:35:09.746092	1	[{"added": {}}, {"added": {"name": "Order Item", "object": "61e22d7d-da0e-4cb7-a67e-d5fa2e50d505  2021-11-20 21:35:09.745881 Dilli Ka\\u015farl\\u0131"}}, {"added": {"name": "Order Item", "object": "61e22d7d-da0e-4cb7-a67e-d5fa2e50d505  2021-11-20 21:35:09.745954 Goral\\u0131"}}, {"added": {"name": "Order Item", "object": "61e22d7d-da0e-4cb7-a67e-d5fa2e50d505  2021-11-20 21:35:09.745998 Goral\\u0131"}}]	11	1
22	2021-11-20 21:36:33.615199+00	1	Mehmet KAYKISIZ m.kaykisiz@gmail.com	2	[{"changed": {"fields": ["Email", "First name", "Last name"]}}]	4	1
23	2021-11-20 21:37:35.820783+00	b35d5414-d9c5-418b-9479-aaeb2fd42b52	b35d5414-d9c5-418b-9479-aaeb2fd42b52 Mehmet KAYKISIZ 2021-11-20 21:37:35.820681	1	[{"added": {}}, {"added": {"name": "Order Item", "object": "b35d5414-d9c5-418b-9479-aaeb2fd42b52 Mehmet KAYKISIZ 2021-11-20 21:37:35.820609 Kuru Fas\\u00fclye"}}]	11	1
24	2021-11-20 21:37:47.743744+00	5fbf0bf2-9cc3-49d3-a484-a38bce9ade0c	5fbf0bf2-9cc3-49d3-a484-a38bce9ade0c Mehmet KAYKISIZ 2021-11-20 21:37:47.743587	1	[{"added": {}}, {"added": {"name": "Order Item", "object": "5fbf0bf2-9cc3-49d3-a484-a38bce9ade0c Mehmet KAYKISIZ 2021-11-20 21:37:47.743473 D\\u00f6ner"}}, {"added": {"name": "Order Item", "object": "5fbf0bf2-9cc3-49d3-a484-a38bce9ade0c Mehmet KAYKISIZ 2021-11-20 21:37:47.743514 Etibol \\u0130skender"}}]	11	1
25	2021-11-21 18:53:35.033162+00	4	test	1	[{"added": {}}]	7	1
26	2021-11-21 21:25:53.744771+00	9	Süper Dönerci İskender	2	[{"changed": {"fields": ["Amount"]}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	user	user
7	food	food
8	restaurant	restaurantcategory
9	restaurant	restaurant
10	restaurant	menu
11	order	order
12	order	orderfood
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-22 16:30:55.708486+00
2	contenttypes	0002_remove_content_type_name	2021-11-22 16:30:55.776353+00
3	auth	0001_initial	2021-11-22 16:30:56.008467+00
4	auth	0002_alter_permission_name_max_length	2021-11-22 16:30:56.02603+00
5	auth	0003_alter_user_email_max_length	2021-11-22 16:30:56.057504+00
6	auth	0004_alter_user_username_opts	2021-11-22 16:30:56.083255+00
7	auth	0005_alter_user_last_login_null	2021-11-22 16:30:56.122485+00
8	auth	0006_require_contenttypes_0002	2021-11-22 16:30:56.147092+00
9	auth	0007_alter_validators_add_error_messages	2021-11-22 16:30:56.18599+00
10	auth	0008_alter_user_username_max_length	2021-11-22 16:30:56.22456+00
11	auth	0009_alter_user_last_name_max_length	2021-11-22 16:30:56.269891+00
12	auth	0010_alter_group_name_max_length	2021-11-22 16:30:56.303947+00
13	auth	0011_update_proxy_permissions	2021-11-22 16:30:56.336827+00
14	auth	0012_alter_user_first_name_max_length	2021-11-22 16:30:56.359152+00
15	user	0001_initial	2021-11-22 16:30:56.666312+00
16	admin	0001_initial	2021-11-22 16:30:56.826053+00
17	admin	0002_logentry_remove_auto_add	2021-11-22 16:30:56.855117+00
18	admin	0003_logentry_add_action_flag_choices	2021-11-22 16:30:56.923182+00
19	food	0001_initial	2021-11-22 16:30:57.063381+00
20	food	0002_alter_food_options	2021-11-22 16:30:57.084135+00
21	restaurant	0001_initial	2021-11-22 16:30:57.556568+00
22	restaurant	0002_alter_menu_restaurant	2021-11-22 16:30:57.732776+00
23	order	0001_initial	2021-11-22 16:30:58.200766+00
24	order	0002_auto_20211120_2124	2021-11-22 16:30:58.272538+00
25	order	0003_order_status	2021-11-22 16:30:58.340312+00
26	order	0004_auto_20211121_1838	2021-11-22 16:30:58.409478+00
27	order	0005_orderfood_price	2021-11-22 16:30:58.448669+00
28	order	0006_rename_price_orderfood_price	2021-11-22 16:30:58.490873+00
29	restaurant	0003_menu_item_count	2021-11-22 16:30:58.530568+00
30	restaurant	0004_remove_menu_item_count	2021-11-22 16:30:58.563756+00
31	restaurant	0005_menu_amount	2021-11-22 16:30:58.59586+00
32	sessions	0001_initial	2021-11-22 16:30:58.72619+00
33	user	0002_alter_user_options	2021-11-22 16:30:58.771872+00
34	user	0003_auto_20211103_1802	2021-11-22 16:30:58.837787+00
35	user	0004_user_profile_image	2021-11-22 16:30:58.882118+00
36	user	0005_auto_20211120_1454	2021-11-22 16:30:58.949423+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: food_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_food (id, created_at, modified_at, deleted_at, name, cover_image) FROM stdin;
1	2021-11-20 21:05:43.566188+00	2021-11-20 21:05:43.566254+00	\N	Döner	
2	2021-11-20 21:05:48.480141+00	2021-11-20 21:05:48.480187+00	\N	İskender	
3	2021-11-20 21:06:00.937026+00	2021-11-20 21:06:00.937074+00	\N	Etibol İskender	
4	2021-11-20 21:06:06.589118+00	2021-11-20 21:06:06.589209+00	\N	Kuru Fasülye	
5	2021-11-20 21:06:13.191334+00	2021-11-20 21:06:13.191382+00	\N	Pilav	
6	2021-11-20 21:06:20.727745+00	2021-11-20 21:06:20.727794+00	\N	Mercimek Çorbası	
7	2021-11-20 21:06:36.343931+00	2021-11-20 21:06:36.344074+00	\N	Goralı	
8	2021-11-20 21:06:41.518307+00	2021-11-20 21:06:41.518353+00	\N	Dilli Kaşarlı	
9	2021-11-20 21:06:49.385865+00	2021-11-20 21:12:42.971997+00	\N	Yengen Tost	
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_order (created_at, modified_at, deleted_at, order_token, restaurant_id, user_id, status) FROM stdin;
\.


--
-- Data for Name: order_orderfood; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_orderfood (id, created_at, modified_at, deleted_at, food_id, order_id, total, price) FROM stdin;
\.


--
-- Data for Name: restaurant_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_menu (id, created_at, modified_at, deleted_at, food_id, restaurant_id, "Amount") FROM stdin;
\.


--
-- Data for Name: restaurant_restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_restaurant (id, created_at, modified_at, deleted_at, name, category_id) FROM stdin;
\.


--
-- Data for Name: restaurant_restaurantcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_restaurantcategory (id, created_at, modified_at, deleted_at, title, slug) FROM stdin;
1	2021-11-20 21:17:51.298432+00	2021-11-20 21:17:51.298478+00	\N	Döner/Kebap	donerkebap
2	2021-11-20 21:19:25.258674+00	2021-11-20 21:19:25.258724+00	\N	Ev Yemekleri	ev-yemekleri
3	2021-11-20 21:19:56.991837+00	2021-11-20 21:19:56.991887+00	\N	Fast-Food	fast-food
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 36, true);


--
-- Name: food_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_food_id_seq', 1, false);


--
-- Name: order_orderfood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_orderfood_id_seq', 1, false);


--
-- Name: restaurant_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_menu_id_seq', 1, false);


--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_restaurant_id_seq', 1, false);


--
-- Name: restaurant_restaurantcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_restaurantcategory_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user auth_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_email_key UNIQUE (email);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: food_food food_food_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_food
    ADD CONSTRAINT food_food_name_key UNIQUE (name);


--
-- Name: food_food food_food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.food_food
    ADD CONSTRAINT food_food_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (order_token);


--
-- Name: order_orderfood order_orderfood_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderfood
    ADD CONSTRAINT order_orderfood_pkey PRIMARY KEY (id);


--
-- Name: restaurant_menu restaurant_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_menu
    ADD CONSTRAINT restaurant_menu_pkey PRIMARY KEY (id);


--
-- Name: restaurant_restaurant restaurant_restaurant_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restaurant_name_key UNIQUE (name);


--
-- Name: restaurant_restaurant restaurant_restaurant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restaurant_pkey PRIMARY KEY (id);


--
-- Name: restaurant_restaurantcategory restaurant_restaurantcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurantcategory
    ADD CONSTRAINT restaurant_restaurantcategory_pkey PRIMARY KEY (id);


--
-- Name: restaurant_restaurantcategory restaurant_restaurantcategory_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurantcategory
    ADD CONSTRAINT restaurant_restaurantcategory_slug_key UNIQUE (slug);


--
-- Name: restaurant_restaurantcategory restaurant_restaurantcategory_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurantcategory
    ADD CONSTRAINT restaurant_restaurantcategory_title_key UNIQUE (title);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_email_1c89df09_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_email_1c89df09_like ON public.auth_user USING btree (email varchar_pattern_ops);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: food_food_created_at_9ba25462; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX food_food_created_at_9ba25462 ON public.food_food USING btree (created_at);


--
-- Name: food_food_modified_at_1e1795c2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX food_food_modified_at_1e1795c2 ON public.food_food USING btree (modified_at);


--
-- Name: food_food_name_2facd972_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX food_food_name_2facd972_like ON public.food_food USING btree (name varchar_pattern_ops);


--
-- Name: order_order_created_at_c7d3f2bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_created_at_c7d3f2bc ON public.order_order USING btree (created_at);


--
-- Name: order_order_modified_at_76ba85bc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_modified_at_76ba85bc ON public.order_order USING btree (modified_at);


--
-- Name: order_order_order_i_7f3f54_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_order_i_7f3f54_idx ON public.order_orderfood USING btree (order_id, food_id);


--
-- Name: order_order_restaurant_id_3f9d7053; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_restaurant_id_3f9d7053 ON public.order_order USING btree (restaurant_id);


--
-- Name: order_order_status_1e381235; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_status_1e381235 ON public.order_order USING btree (status);


--
-- Name: order_order_status_1e381235_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_status_1e381235_like ON public.order_order USING btree (status varchar_pattern_ops);


--
-- Name: order_order_user_id_7cf9bc2b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_order_user_id_7cf9bc2b ON public.order_order USING btree (user_id);


--
-- Name: order_orderfood_created_at_129cb3eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_orderfood_created_at_129cb3eb ON public.order_orderfood USING btree (created_at);


--
-- Name: order_orderfood_food_id_142130d0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_orderfood_food_id_142130d0 ON public.order_orderfood USING btree (food_id);


--
-- Name: order_orderfood_modified_at_6d252106; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_orderfood_modified_at_6d252106 ON public.order_orderfood USING btree (modified_at);


--
-- Name: order_orderfood_order_id_e980224d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX order_orderfood_order_id_e980224d ON public.order_orderfood USING btree (order_id);


--
-- Name: restaurant__restaur_a43a43_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant__restaur_a43a43_idx ON public.restaurant_menu USING btree (restaurant_id, food_id);


--
-- Name: restaurant_menu_created_at_306d0364; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_menu_created_at_306d0364 ON public.restaurant_menu USING btree (created_at);


--
-- Name: restaurant_menu_food_id_2f851ed8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_menu_food_id_2f851ed8 ON public.restaurant_menu USING btree (food_id);


--
-- Name: restaurant_menu_modified_at_496c6c8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_menu_modified_at_496c6c8f ON public.restaurant_menu USING btree (modified_at);


--
-- Name: restaurant_menu_restaurant_id_af786758; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_menu_restaurant_id_af786758 ON public.restaurant_menu USING btree (restaurant_id);


--
-- Name: restaurant_restaurant_category_id_b2573cd6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurant_category_id_b2573cd6 ON public.restaurant_restaurant USING btree (category_id);


--
-- Name: restaurant_restaurant_created_at_d4f6db88; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurant_created_at_d4f6db88 ON public.restaurant_restaurant USING btree (created_at);


--
-- Name: restaurant_restaurant_modified_at_ef9df760; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurant_modified_at_ef9df760 ON public.restaurant_restaurant USING btree (modified_at);


--
-- Name: restaurant_restaurant_name_5e925c4a_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurant_name_5e925c4a_like ON public.restaurant_restaurant USING btree (name varchar_pattern_ops);


--
-- Name: restaurant_restaurantcategory_created_at_4aaa764e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurantcategory_created_at_4aaa764e ON public.restaurant_restaurantcategory USING btree (created_at);


--
-- Name: restaurant_restaurantcategory_modified_at_2ebcbf23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurantcategory_modified_at_2ebcbf23 ON public.restaurant_restaurantcategory USING btree (modified_at);


--
-- Name: restaurant_restaurantcategory_slug_d2ebbcfb_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurantcategory_slug_d2ebbcfb_like ON public.restaurant_restaurantcategory USING btree (slug varchar_pattern_ops);


--
-- Name: restaurant_restaurantcategory_title_11659ee1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX restaurant_restaurantcategory_title_11659ee1_like ON public.restaurant_restaurantcategory USING btree (title varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_restaurant_id_3f9d7053_fk_restaurant_restaurant_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_restaurant_id_3f9d7053_fk_restaurant_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurant_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_user_id_7cf9bc2b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderfood order_orderfood_food_id_142130d0_fk_food_food_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderfood
    ADD CONSTRAINT order_orderfood_food_id_142130d0_fk_food_food_id FOREIGN KEY (food_id) REFERENCES public.food_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderfood order_orderfood_order_id_e980224d_fk_order_order_order_token; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_orderfood
    ADD CONSTRAINT order_orderfood_order_id_e980224d_fk_order_order_order_token FOREIGN KEY (order_id) REFERENCES public.order_order(order_token) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurant_menu restaurant_menu_food_id_2f851ed8_fk_food_food_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_menu
    ADD CONSTRAINT restaurant_menu_food_id_2f851ed8_fk_food_food_id FOREIGN KEY (food_id) REFERENCES public.food_food(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurant_menu restaurant_menu_restaurant_id_af786758_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_menu
    ADD CONSTRAINT restaurant_menu_restaurant_id_af786758_fk_restauran FOREIGN KEY (restaurant_id) REFERENCES public.restaurant_restaurant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: restaurant_restaurant restaurant_restauran_category_id_b2573cd6_fk_restauran; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_restaurant
    ADD CONSTRAINT restaurant_restauran_category_id_b2573cd6_fk_restauran FOREIGN KEY (category_id) REFERENCES public.restaurant_restaurantcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


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
    amount numeric(6,2) NOT NULL
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
1	pbkdf2_sha256$260000$LaZPpfAruSNIOGDpvyaluv$DTQ0ZwFBHzgNdQlJxkRtDs20CvB9iW706VzWjDd/sqc=	2021-11-22 20:45:33.490865+00	t	Mehmet	KAYKISIZ	t	t	2021-11-20 21:03:42+00	m.kaykisiz@gmail.com
2	pbkdf2_sha256$260000$g1fyosRdL4OcD0E891gYnr$/bmF09dXLURwpcxJ0ejbYPG9NtfPW79JAPtF8WGSvn4=	\N	f	Uğur	Özi	f	t	2021-11-22 21:24:39+00	uozy@yspt.com
3	pbkdf2_sha256$260000$RCfPcIgQv0edbtEEzf3K1F$LDvNxWhCI+RE4GrIQNhETUhF8Ytt2dChME7vyJYQvP8=	\N	f	Cenk	Yaldız	f	t	2021-11-22 21:25:41+00	cyaldiz@yspt.com
4	pbkdf2_sha256$260000$HgG4jPBxsMnJLAeYYpQZYL$5J4ybtN1wYpuaRlxT6w+x50JpvVygyi5mFmeIuB6kG8=	\N	f	Selin	Simge	f	t	2021-11-22 21:26:07+00	ssimge@yspt.com
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
2	2021-11-22 21:24:40.052344+00	2	  uozy@yspt.com	1	[{"added": {}}]	6	1
3	2021-11-22 21:25:16.580321+00	2	Uğur Özi uozy@yspt.com	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
4	2021-11-22 21:25:41.541935+00	3	  cyaldiz@yspt.com	1	[{"added": {}}]	6	1
5	2021-11-22 21:25:55.490197+00	3	Cenk Yaldız cyaldiz@yspt.com	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
6	2021-11-22 21:26:07.438174+00	4	  ssimge@yspt.com	1	[{"added": {}}]	6	1
7	2021-11-22 21:26:19.688678+00	4	Selin Simge ssimge@yspt.com	2	[{"changed": {"fields": ["First name", "Last name"]}}]	6	1
8	2021-11-22 21:27:36.359609+00	5	Test 2	1	[{"added": {}}]	9	1
9	2021-11-22 21:27:51.728234+00	4	test	3		9	1
10	2021-11-22 21:27:51.745515+00	5	Test 2	3		9	1
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
37	order	0007_alter_orderfood_order	2021-11-22 21:12:37.600066+00
38	restaurant	0006_rename_amount_menu_amount	2021-11-22 21:12:37.653606+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
55xngpot5qm45y8jwmgy47uwne7mvrdx	.eJxVjD0OwyAUg-_CXCF-A3TsnjOgBw9K2gqkkExV714iZWgXy_Jn-0087Fvxe0-rX5BcCSeX3yxAfKZ6AHxAvTcaW93WJdCjQk_a6dwwvW5n9--gQC9jDThJ56xlQqgMIkedUOWs7VCdeBbArJDDSYccmEbFDePKpEnlELkhny_iZzeh:1mpGBx:4isfOqPvWWFgXOEN_G3nw0M_7CvtrsXQpg-85zZd1rc	2021-12-06 20:45:33.49706+00
\.


--
-- Data for Name: food_food; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.food_food (id, created_at, modified_at, deleted_at, name, cover_image) FROM stdin;
1	2021-11-20 21:05:43.566188+00	2021-11-20 21:05:43.566254+00	\N	Döner	test.png
2	2021-11-20 21:05:48.480141+00	2021-11-20 21:05:48.480187+00	\N	İskender	test.png
3	2021-11-20 21:06:00.937026+00	2021-11-20 21:06:00.937074+00	\N	Etibol İskender	test.png
4	2021-11-20 21:06:06.589118+00	2021-11-20 21:06:06.589209+00	\N	Kuru Fasülye	test.png
5	2021-11-20 21:06:13.191334+00	2021-11-20 21:06:13.191382+00	\N	Pilav	test.png
6	2021-11-20 21:06:20.727745+00	2021-11-20 21:06:20.727794+00	\N	Mercimek Çorbası	test.png
7	2021-11-20 21:06:36.343931+00	2021-11-20 21:06:36.344074+00	\N	Goralı	test.png
8	2021-11-20 21:06:41.518307+00	2021-11-20 21:06:41.518353+00	\N	Dilli Kaşarlı	test.png
9	2021-11-20 21:06:49.385865+00	2021-11-20 21:12:42.971997+00	\N	Yengen Tost	test.png
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_order (created_at, modified_at, deleted_at, order_token, restaurant_id, user_id, status) FROM stdin;
2021-11-20 21:35:09.594979+00	2021-11-20 21:35:09.595015+00	\N	8e424208-dd69-469e-9be4-7461f3c5cbe8	3	1	created
2021-11-20 21:35:09.741658+00	2021-11-20 21:35:09.741713+00	\N	447585f3-c9dc-45ec-b8c8-5a460d5761b7	3	1	created
2021-11-20 21:37:35.818591+00	2021-11-20 21:37:35.818631+00	\N	1fbb5e4b-3ecb-4891-9783-608dad8738d8	2	1	created
2021-11-20 21:37:47.738411+00	2021-11-20 21:37:47.738468+00	\N	5c5e9b2d-f98c-4b16-9eee-e0e1e07329dd	1	1	created
2021-11-21 18:21:06.151462+00	2021-11-21 18:21:06.151678+00	\N	14d66908-2676-4b75-8c0e-a3e305c81b7d	3	1	created
2021-11-21 21:21:49.515933+00	2021-11-21 21:21:49.516012+00	\N	31f122a1-3052-48e5-a385-b9e14d8181c2	3	1	created
2021-11-21 21:22:01.07765+00	2021-11-21 21:22:01.077807+00	\N	53d2b45b-4116-43bb-a4c5-13d3f525fd35	3	1	created
2021-11-21 21:22:12.823043+00	2021-11-21 21:22:12.823149+00	\N	6eeea464-a615-4e3e-901c-963684fabfd0	3	1	created
2021-11-21 21:22:42.732219+00	2021-11-21 21:22:42.732471+00	\N	66c62335-b08e-4638-8d1d-0e12debd3862	3	1	created
2021-11-21 21:22:54.040106+00	2021-11-21 21:22:54.040309+00	\N	22ae73f1-1017-41dd-9f80-ab41e74f3a93	3	1	created
2021-11-21 21:23:34.629582+00	2021-11-21 21:23:34.629718+00	\N	8c5b6c14-4ce1-458d-a9bd-08a693c83114	3	1	created
2021-11-21 21:24:05.948602+00	2021-11-21 21:24:05.948697+00	\N	0c0c857a-b93c-402b-9dfa-bb15356692fc	3	1	created
2021-11-21 21:24:08.356991+00	2021-11-21 21:24:08.357154+00	\N	37336f50-f956-4dc3-96f6-1d60852ed596	3	1	created
2021-11-21 21:24:17.636124+00	2021-11-21 21:24:17.636277+00	\N	5860cd7a-0410-4de0-9e9e-e2bf476cefce	3	1	created
2021-11-21 21:26:02.934303+00	2021-11-21 21:26:02.934443+00	\N	94a23234-0153-4bf6-ac61-5fe0b2a1f54d	3	1	created
2021-11-21 21:26:31.627849+00	2021-11-21 21:26:31.628455+00	\N	2c2794c2-8fbe-4c25-91d7-bb0e1b6eb123	3	1	created
2021-11-21 21:27:53.090827+00	2021-11-21 21:27:53.090926+00	\N	5fd3c70a-bdbe-472a-bbcb-ec11400d3788	3	1	created
2021-11-21 21:28:17.293508+00	2021-11-21 21:28:17.29358+00	\N	bcb6334e-dc5a-42af-9576-98392fa93f3b	3	1	created
2021-11-21 21:28:26.931199+00	2021-11-21 21:28:26.93206+00	\N	38dfa984-2a65-4eb3-89b3-b0fe71c9e011	1	1	created
2021-11-21 21:28:35.807611+00	2021-11-21 21:51:11.377431+00	\N	7aeec407-fdb9-4806-8775-b64a89f7622d	1	1	completed
2021-11-21 22:10:55.100734+00	2021-11-21 22:10:55.100842+00	\N	ee727be4-1f95-43c5-b5ff-476bd794c334	1	1	created
2021-11-21 22:18:44.675363+00	2021-11-21 22:18:46.473738+00	\N	75e8c440-4f3a-4c82-ae36-be261d3b10ef	1	1	waiting
2021-11-21 22:54:59.367652+00	2021-11-21 22:54:59.36775+00	\N	cf069729-db98-4c2b-a60e-45c4af713114	1	1	created
2021-11-21 22:55:36.82845+00	2021-11-21 22:55:36.828541+00	\N	b787b140-8c1c-4687-81d7-f9b582bde8b6	1	1	created
2021-11-21 22:56:32.917911+00	2021-11-21 22:56:32.938381+00	\N	85103e34-991c-4a6f-b91d-a88cc380c828	1	1	waiting
2021-11-21 22:56:49.03057+00	2021-11-21 22:56:49.086314+00	\N	1609107b-3288-428e-aab3-3f2e74c80d85	1	1	waiting
2021-11-21 22:57:45.642665+00	2021-11-21 22:57:45.661008+00	\N	03249d43-cf8d-4515-a78b-d6986b887d54	1	1	waiting
2021-11-21 22:57:54.188646+00	2021-11-21 22:57:54.29301+00	\N	20ff2257-c8aa-4962-874a-b31fc9172717	1	1	waiting
2021-11-21 22:57:57.434999+00	2021-11-21 22:57:57.45056+00	\N	a936fa17-ffdd-4ada-a5ce-56287f466a03	1	1	waiting
2021-11-21 23:02:14.233226+00	2021-11-21 23:02:14.26422+00	\N	ceea5345-4daf-454b-a4f2-ef14ce2d552d	1	1	waiting
2021-11-21 23:04:03.550369+00	2021-11-21 23:04:03.570757+00	\N	38c2dcf4-b15e-4317-8293-ca5ee2d00cc1	1	1	waiting
2021-11-21 23:04:56.077974+00	2021-11-21 23:04:56.107187+00	\N	3ff26157-3978-4e64-9569-d880141aaf89	1	1	waiting
2021-11-21 23:05:13.824221+00	2021-11-21 23:05:13.824323+00	\N	e5af7514-a1f8-4062-bc4f-0bc49dee8f51	1	1	created
2021-11-21 23:05:18.397225+00	2021-11-21 23:05:18.397356+00	\N	89849d6c-4681-495e-be15-1fcfd6d3de42	1	1	created
2021-11-21 23:05:25.246016+00	2021-11-21 23:05:25.246147+00	\N	f5303e18-b170-4bcd-b02e-4ebf28f205d2	1	1	created
2021-11-21 23:08:39.299699+00	2021-11-21 23:08:39.299774+00	\N	f35965fb-9338-4d1d-b769-5ee30b31aa25	1	1	created
2021-11-21 23:08:41.903924+00	2021-11-21 23:08:41.903996+00	\N	47089436-593c-4ebc-b985-481a436822db	1	1	created
2021-11-21 23:08:56.417973+00	2021-11-21 23:08:56.440851+00	\N	8c3aa6cb-52bc-459c-a3c1-bd547e7bf819	1	1	waiting
2021-11-21 23:09:45.264566+00	2021-11-21 23:09:45.281879+00	\N	8ab2b6f7-8207-452f-a96b-f66bb3325d95	1	1	waiting
2021-11-21 23:09:57.600966+00	2021-11-21 23:09:57.620088+00	\N	ad8fa296-839c-4ff2-9d84-9b526ba1115e	1	1	waiting
2021-11-21 23:11:35.147227+00	2021-11-21 23:11:35.169058+00	\N	ad135ed4-83f7-4382-84cc-332b4495f92e	1	1	waiting
2021-11-21 23:11:36.482507+00	2021-11-21 23:11:36.510748+00	\N	9e04a3c0-d98f-402f-ad12-ee18af8fb11d	1	1	waiting
2021-11-21 23:11:37.660757+00	2021-11-21 23:11:37.675795+00	\N	ad3a5957-72d0-4596-837d-f24168aa06c7	1	1	waiting
2021-11-21 23:11:39.283035+00	2021-11-21 23:11:39.30404+00	\N	aff03f85-3884-46d0-be25-8efe37f02c96	1	1	waiting
2021-11-21 23:19:05.764796+00	2021-11-21 23:19:05.792424+00	\N	44cf917d-4e75-4c07-b74e-a6f125bdf264	1	1	waiting
2021-11-21 23:30:13.383311+00	2021-11-21 23:30:13.38345+00	\N	2eaaf3cb-30fe-436e-aed6-efdaeaa94aa6	1	1	created
2021-11-21 23:30:41.296436+00	2021-11-21 23:30:41.326138+00	\N	fcc531d3-495e-41e4-bd9d-c3f111294067	1	1	waiting
2021-11-21 23:32:03.255545+00	2021-11-21 23:32:03.274197+00	\N	5ae92242-6e64-489f-b845-2566e8d5120e	1	1	waiting
2021-11-21 23:32:55.549987+00	2021-11-21 23:32:55.581017+00	\N	7a5ec0ea-7f20-4110-bc11-bc1b42f02277	1	1	waiting
2021-11-21 23:33:05.997222+00	2021-11-21 23:33:06.026862+00	\N	303175b9-a3c3-4d09-8075-25175c0a9de7	1	1	waiting
2021-11-21 23:34:47.497122+00	2021-11-21 23:34:47.520979+00	\N	f686ea9f-52d3-44de-af70-5300a66fa43e	1	1	waiting
2021-11-21 23:35:36.716371+00	2021-11-21 23:35:36.716455+00	\N	e263ab43-74b7-427c-bd9d-a77c21d4223d	1	1	created
2021-11-21 23:36:16.276348+00	2021-11-21 23:36:16.276444+00	\N	64be5274-4b78-49aa-bd18-a41586af8c94	1	1	created
2021-11-21 23:36:20.193087+00	2021-11-21 23:36:20.193277+00	\N	7e5c83b9-359f-4fba-a679-537249d83cf4	1	1	created
2021-11-21 23:37:00.222846+00	2021-11-21 23:37:00.257338+00	\N	5d4db20f-5973-4164-a546-f24f380f47ac	1	1	waiting
2021-11-21 23:37:03.815699+00	2021-11-21 23:37:03.84653+00	\N	21455ca5-331f-4576-9306-bb652e7af495	1	1	waiting
2021-11-21 23:38:47.347736+00	2021-11-21 23:38:47.38728+00	\N	4e704ebe-43b4-43bd-94a2-7e1bfe34a180	1	1	waiting
2021-11-21 23:39:18.257108+00	2021-11-21 23:39:18.307697+00	\N	90ab91d7-02e9-43b5-b2e0-1c44934b5f89	1	1	completed
2021-11-21 23:39:41.587852+00	2021-11-21 23:39:41.658338+00	\N	294fb5cd-5e52-4d86-b175-427fbc7b480f	1	1	completed
2021-11-21 23:39:48.204321+00	2021-11-21 23:39:48.222623+00	\N	2524acc0-8a0b-40ef-9102-dab622b3a2e2	1	1	waiting
2021-11-21 23:39:49.413264+00	2021-11-21 23:39:49.428505+00	\N	03b97747-c4dd-4b9c-b258-de549f0a83c8	1	1	waiting
2021-11-21 23:39:50.404972+00	2021-11-21 23:39:50.421415+00	\N	d96b8d7d-1d39-4798-81b1-1ec1a4a87b43	1	1	waiting
2021-11-21 23:40:32.21286+00	2021-11-21 23:40:32.240266+00	\N	584d590e-5397-474e-a66e-4eccd04ff56a	1	1	completed
2021-11-22 10:15:43.607217+00	2021-11-22 10:15:48.397763+00	\N	678fb99d-b63a-45c8-abf7-fa8b579a401d	1	1	completed
2021-11-22 10:15:55.910983+00	2021-11-22 10:15:55.937278+00	\N	531e577c-f356-4374-a4aa-7b19d04ed0cf	1	1	waiting
2021-11-22 10:16:11.796882+00	2021-11-22 10:16:11.883133+00	\N	ddf7defe-e679-461c-812d-6da7e6df3b08	1	1	completed
2021-11-22 10:16:14.152299+00	2021-11-22 10:16:14.180488+00	\N	5d970903-3799-442e-8290-935d35f949b5	1	1	waiting
2021-11-22 10:16:15.342209+00	2021-11-22 10:16:15.373642+00	\N	561e5351-fc8f-4b62-927e-17f342ff7991	1	1	waiting
2021-11-22 10:16:16.435423+00	2021-11-22 10:16:16.455345+00	\N	6f539a9a-b0ec-48ff-987b-f87095e516b7	1	1	waiting
2021-11-22 10:16:17.75174+00	2021-11-22 10:16:17.82374+00	\N	5071fc69-c249-4880-9b74-3995fa0b9636	1	1	waiting
2021-11-22 10:16:35.035684+00	2021-11-22 10:16:35.119222+00	\N	a14fa521-3e8d-477e-b141-ce0517c371b5	1	1	completed
2021-11-22 10:26:19.147001+00	2021-11-22 10:26:19.182689+00	\N	7564ebc1-f7be-4177-a97b-c68b45c69016	1	1	waiting
2021-11-22 10:26:21.815211+00	2021-11-22 10:26:21.846556+00	\N	27f2d9ec-5e91-458a-9cc9-36157833d65c	1	1	waiting
2021-11-22 10:26:38.466874+00	2021-11-22 10:26:38.525601+00	\N	5d936c31-9168-419d-a389-6ab7c7aa09c8	1	1	completed
2021-11-22 10:29:38.702363+00	2021-11-22 10:29:38.775697+00	\N	0d1e885d-9eb0-453b-ad2f-e39fa27f732f	1	1	completed
2021-11-22 10:29:42.733128+00	2021-11-22 10:29:42.754305+00	\N	f4703d46-d585-46e3-9689-9c711e085217	1	1	waiting
2021-11-22 10:30:10.630009+00	2021-11-22 10:30:10.684236+00	\N	7eda49e7-6e6a-415e-a914-58c233d282b7	1	1	completed
2021-11-22 11:45:33.983083+00	2021-11-22 11:45:33.983188+00	\N	afc3a883-4a1a-4b44-82d5-7be0b2b835b0	1	1	created
2021-11-22 11:50:14.892065+00	2021-11-22 11:50:14.917978+00	\N	995db4a5-8993-4936-a58c-d6682463b168	1	1	waiting
2021-11-22 12:24:57.67899+00	2021-11-22 12:24:57.721352+00	\N	5bf3a523-4468-4543-88e9-0807456c695a	1	1	waiting
2021-11-22 12:25:28.933885+00	2021-11-22 12:25:29.004567+00	\N	82863a65-d83d-40f6-ad12-f3c619e3c11f	1	1	completed
2021-11-22 12:32:05.726322+00	2021-11-22 12:32:05.807081+00	\N	7c9d0b53-728b-47cb-9b0f-b9ac9e546d73	1	1	waiting
2021-11-22 12:40:26.676193+00	2021-11-22 12:40:26.724863+00	\N	d415d643-2cde-4318-b969-76af55c94cfc	1	1	completed
2021-11-22 12:43:11.347245+00	2021-11-22 12:43:31.104117+00	\N	be32365c-f9a8-41f0-9fe7-999f3b499a6a	1	1	waiting
2021-11-22 12:48:35.91265+00	2021-11-22 12:48:35.985033+00	\N	29f0f2a4-f500-485c-9030-81e44e995e3a	1	1	waiting
2021-11-22 12:51:42.369555+00	2021-11-22 12:51:42.403848+00	\N	8e899d99-0002-447d-96f4-5ff1ddbac13d	1	1	waiting
2021-11-22 13:28:03.613475+00	2021-11-22 13:28:03.949529+00	\N	77c453bf-8a63-4c98-9a46-a44d1f83ec96	1	1	waiting
2021-11-22 13:28:10.086516+00	2021-11-22 13:28:10.122894+00	\N	e2d914c2-b44d-45b8-b293-35f07415dd4d	1	1	waiting
2021-11-22 13:28:17.766009+00	2021-11-22 13:28:17.798504+00	\N	1757387d-5864-496b-a825-38f7ab4af1c4	1	1	waiting
2021-11-22 13:33:53.139681+00	2021-11-22 13:33:53.229911+00	\N	d0829fe4-91ed-422e-a209-fa6526840b6b	1	1	waiting
2021-11-22 13:33:58.780835+00	2021-11-22 13:33:58.81747+00	\N	9d941952-bff3-4a71-bcb4-7a0fc823d096	1	1	waiting
2021-11-22 13:37:22.369562+00	2021-11-22 13:37:22.369602+00	\N	077694e9-2f89-4f41-97e9-3ab506f6f6c5	1	1	created
2021-11-22 13:38:08.869668+00	2021-11-22 13:38:08.869721+00	\N	607bc7ec-fcf3-4b20-bef2-c7a39bd9dba9	1	1	created
2021-11-22 13:39:37.797338+00	2021-11-22 13:39:37.797421+00	\N	574e2dcb-fc6e-40b5-9ab2-d9fd4e93dc0a	1	1	created
2021-11-22 13:40:01.414383+00	2021-11-22 13:40:01.414437+00	\N	fae50673-49b1-449a-b66c-9a525747e342	1	1	created
2021-11-22 13:47:58.470517+00	2021-11-22 13:47:58.470566+00	\N	a9427dee-8e35-448f-9554-c2d3adcd2b4c	1	1	created
2021-11-22 13:54:36.455651+00	2021-11-22 13:54:36.455742+00	\N	05413b4d-cb3b-4004-954f-d46d8a94fe42	1	1	created
2021-11-22 21:16:03.654907+00	2021-11-22 21:16:03.654966+00	\N	01549382-8284-41b1-9c8a-23514382fd17	1	1	created
2021-11-22 21:18:17.339839+00	2021-11-22 21:18:17.487725+00	\N	ae2264f9-874f-4fe7-92de-8e89867b8bf8	1	1	waiting
2021-11-22 21:31:15.538716+00	2021-11-22 21:31:15.679622+00	\N	2769a79a-c63d-4b16-af4d-4269d3237667	1	1	waiting
2021-11-22 21:32:01.758942+00	2021-11-22 21:32:01.956841+00	\N	8526c200-c95b-4082-b0f7-040d65297042	1	1	completed
\.


--
-- Data for Name: order_orderfood; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_orderfood (id, created_at, modified_at, deleted_at, food_id, order_id, total, price) FROM stdin;
1	2021-11-22 21:16:03.697248+00	2021-11-22 21:16:03.697305+00	\N	2	01549382-8284-41b1-9c8a-23514382fd17	5	22.50
2	2021-11-22 21:18:17.424055+00	2021-11-22 21:18:17.42408+00	\N	2	ae2264f9-874f-4fe7-92de-8e89867b8bf8	5	22.50
3	2021-11-22 21:31:15.622715+00	2021-11-22 21:31:15.622772+00	\N	2	2769a79a-c63d-4b16-af4d-4269d3237667	5	22.50
4	2021-11-22 21:32:01.842237+00	2021-11-22 21:32:01.842269+00	\N	2	8526c200-c95b-4082-b0f7-040d65297042	5	22.50
\.


--
-- Data for Name: restaurant_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_menu (id, created_at, modified_at, deleted_at, food_id, restaurant_id, amount) FROM stdin;
1	2021-11-20 21:27:27.879014+00	2021-11-20 21:27:27.879062+00	\N	9	3	5.00
2	2021-11-20 21:27:27.879784+00	2021-11-20 21:27:27.879817+00	\N	7	3	7.00
3	2021-11-20 21:27:27.880117+00	2021-11-20 21:27:27.880142+00	\N	8	3	4.00
4	2021-11-20 21:27:40.935913+00	2021-11-20 21:27:40.93605+00	\N	4	2	4.00
5	2021-11-20 21:27:40.937164+00	2021-11-20 21:27:40.937205+00	\N	6	2	3.00
6	2021-11-20 21:27:40.937545+00	2021-11-20 21:27:40.937571+00	\N	5	2	2.00
7	2021-11-20 21:27:53.22503+00	2021-11-20 21:27:53.225166+00	\N	1	1	4.00
8	2021-11-20 21:27:53.22625+00	2021-11-20 21:27:53.226295+00	\N	3	1	4.00
9	2021-11-20 21:27:53.226708+00	2021-11-21 21:25:53.742185+00	\N	2	1	4.50
\.


--
-- Data for Name: restaurant_restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restaurant_restaurant (id, created_at, modified_at, deleted_at, name, category_id) FROM stdin;
1	2021-11-20 21:19:03.641479+00	2021-11-20 21:27:53.223257+00	\N	Süper Dönerci	1
2	2021-11-20 21:19:39.329511+00	2021-11-20 21:27:40.933467+00	\N	Harika Ev Yemekleri	2
3	2021-11-20 21:19:59.526283+00	2021-11-20 21:27:27.877237+00	\N	Bizim Büfe	3
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

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 10, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);


--
-- Name: food_food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.food_food_id_seq', 9, true);


--
-- Name: order_orderfood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_orderfood_id_seq', 4, true);


--
-- Name: restaurant_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_menu_id_seq', 9, true);


--
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_restaurant_id_seq', 5, true);


--
-- Name: restaurant_restaurantcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_restaurantcategory_id_seq', 3, true);


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


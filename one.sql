--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO one;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO one;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO one;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO one;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: accounts_profile; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.accounts_profile (
    id bigint NOT NULL,
    avatar character varying(100),
    bio character varying(221) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.accounts_profile OWNER TO one;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.accounts_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_profile_id_seq OWNER TO one;

--
-- Name: accounts_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.accounts_profile_id_seq OWNED BY public.accounts_profile.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO one;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO one;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO one;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO one;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO one;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO one;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO one;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO one;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO one;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO one;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO one;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO one;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.blog_post (
    id bigint NOT NULL,
    title character varying(221) NOT NULL,
    image character varying(100) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_post OWNER TO one;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO one;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;


--
-- Name: blog_post_tags; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.blog_post_tags (
    id bigint NOT NULL,
    post_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.blog_post_tags OWNER TO one;

--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.blog_post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_tags_id_seq OWNER TO one;

--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.blog_post_tags_id_seq OWNED BY public.blog_post_tags.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.blog_tag (
    id bigint NOT NULL,
    title character varying(221) NOT NULL
);


ALTER TABLE public.blog_tag OWNER TO one;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO one;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.blog_tag_id_seq OWNED BY public.blog_tag.id;


--
-- Name: carts_cart; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.carts_cart (
    id bigint NOT NULL,
    cart_total_price double precision,
    client_id integer NOT NULL
);


ALTER TABLE public.carts_cart OWNER TO one;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.carts_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cart_id_seq OWNER TO one;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.carts_cart_id_seq OWNED BY public.carts_cart.id;


--
-- Name: carts_cartitem; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.carts_cartitem (
    id bigint NOT NULL,
    quantity integer,
    total double precision,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    cart_id bigint,
    product_id bigint
);


ALTER TABLE public.carts_cartitem OWNER TO one;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.carts_cartitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cartitem_id_seq OWNER TO one;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.carts_cartitem_id_seq OWNED BY public.carts_cartitem.id;


--
-- Name: carts_order; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.carts_order (
    id bigint NOT NULL,
    transaction_id uuid NOT NULL,
    phone character varying(21) NOT NULL,
    address character varying(221) NOT NULL,
    note text,
    order_total_price double precision,
    status integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    cart_id bigint,
    client_id integer
);


ALTER TABLE public.carts_order OWNER TO one;

--
-- Name: carts_order_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.carts_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_order_id_seq OWNER TO one;

--
-- Name: carts_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.carts_order_id_seq OWNED BY public.carts_order.id;


--
-- Name: carts_wishlist; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.carts_wishlist (
    id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.carts_wishlist OWNER TO one;

--
-- Name: carts_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.carts_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_wishlist_id_seq OWNER TO one;

--
-- Name: carts_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.carts_wishlist_id_seq OWNED BY public.carts_wishlist.id;


--
-- Name: carts_wishlist_product; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.carts_wishlist_product (
    id bigint NOT NULL,
    wishlist_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.carts_wishlist_product OWNER TO one;

--
-- Name: carts_wishlist_product_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.carts_wishlist_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_wishlist_product_id_seq OWNER TO one;

--
-- Name: carts_wishlist_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.carts_wishlist_product_id_seq OWNED BY public.carts_wishlist_product.id;


--
-- Name: contacts_contact; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.contacts_contact (
    id bigint NOT NULL,
    full_name character varying(221) NOT NULL,
    email character varying(254) NOT NULL,
    message text NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts_contact OWNER TO one;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.contacts_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contacts_contact_id_seq OWNER TO one;

--
-- Name: contacts_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.contacts_contact_id_seq OWNED BY public.contacts_contact.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO one;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO one;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO one;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO one;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO one;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO one;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO one;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO one;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO one;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    title character varying(221) NOT NULL,
    image character varying(100)
);


ALTER TABLE public.products_category OWNER TO one;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO one;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(221) NOT NULL,
    price double precision NOT NULL,
    description text NOT NULL,
    category_id bigint,
    views integer NOT NULL,
    mid_rate double precision NOT NULL
);


ALTER TABLE public.products_product OWNER TO one;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO one;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: products_productimage; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    image character varying(100) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.products_productimage OWNER TO one;

--
-- Name: products_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productimage_id_seq OWNER TO one;

--
-- Name: products_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.products_productimage_id_seq OWNED BY public.products_productimage.id;


--
-- Name: products_rate; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.products_rate (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    rate integer NOT NULL,
    product_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.products_rate OWNER TO one;

--
-- Name: products_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.products_rate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_rate_id_seq OWNER TO one;

--
-- Name: products_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.products_rate_id_seq OWNED BY public.products_rate.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO one;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO one;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO one;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO one;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO one;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO one;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO one;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO one;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: accounts_profile id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.accounts_profile ALTER COLUMN id SET DEFAULT nextval('public.accounts_profile_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: blog_post id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);


--
-- Name: blog_post_tags id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post_tags ALTER COLUMN id SET DEFAULT nextval('public.blog_post_tags_id_seq'::regclass);


--
-- Name: blog_tag id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_tag ALTER COLUMN id SET DEFAULT nextval('public.blog_tag_id_seq'::regclass);


--
-- Name: carts_cart id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cart ALTER COLUMN id SET DEFAULT nextval('public.carts_cart_id_seq'::regclass);


--
-- Name: carts_cartitem id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cartitem ALTER COLUMN id SET DEFAULT nextval('public.carts_cartitem_id_seq'::regclass);


--
-- Name: carts_order id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_order ALTER COLUMN id SET DEFAULT nextval('public.carts_order_id_seq'::regclass);


--
-- Name: carts_wishlist id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist ALTER COLUMN id SET DEFAULT nextval('public.carts_wishlist_id_seq'::regclass);


--
-- Name: carts_wishlist_product id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist_product ALTER COLUMN id SET DEFAULT nextval('public.carts_wishlist_product_id_seq'::regclass);


--
-- Name: contacts_contact id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.contacts_contact ALTER COLUMN id SET DEFAULT nextval('public.contacts_contact_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: products_productimage id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_productimage ALTER COLUMN id SET DEFAULT nextval('public.products_productimage_id_seq'::regclass);


--
-- Name: products_rate id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_rate ALTER COLUMN id SET DEFAULT nextval('public.products_rate_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: accounts_profile; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.accounts_profile (id, avatar, bio, user_id) FROM stdin;
2			2
3	profiles/backblue.gif	Hello world	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: one
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
28	Can view site	7	view_site
29	Can add email address	8	add_emailaddress
30	Can change email address	8	change_emailaddress
31	Can delete email address	8	delete_emailaddress
32	Can view email address	8	view_emailaddress
33	Can add email confirmation	9	add_emailconfirmation
34	Can change email confirmation	9	change_emailconfirmation
35	Can delete email confirmation	9	delete_emailconfirmation
36	Can view email confirmation	9	view_emailconfirmation
37	Can add social account	10	add_socialaccount
38	Can change social account	10	change_socialaccount
39	Can delete social account	10	delete_socialaccount
40	Can view social account	10	view_socialaccount
41	Can add social application	11	add_socialapp
42	Can change social application	11	change_socialapp
43	Can delete social application	11	delete_socialapp
44	Can view social application	11	view_socialapp
45	Can add social application token	12	add_socialtoken
46	Can change social application token	12	change_socialtoken
47	Can delete social application token	12	delete_socialtoken
48	Can view social application token	12	view_socialtoken
49	Can add profile	13	add_profile
50	Can change profile	13	change_profile
51	Can delete profile	13	delete_profile
52	Can view profile	13	view_profile
53	Can add contact	14	add_contact
54	Can change contact	14	change_contact
55	Can delete contact	14	delete_contact
56	Can view contact	14	view_contact
57	Can add category	15	add_category
58	Can change category	15	change_category
59	Can delete category	15	delete_category
60	Can view category	15	view_category
61	Can add rate	16	add_rate
62	Can change rate	16	change_rate
63	Can delete rate	16	delete_rate
64	Can view rate	16	view_rate
65	Can add product image	17	add_productimage
66	Can change product image	17	change_productimage
67	Can delete product image	17	delete_productimage
68	Can view product image	17	view_productimage
69	Can add product	18	add_product
70	Can change product	18	change_product
71	Can delete product	18	delete_product
72	Can view product	18	view_product
73	Can add order	19	add_order
74	Can change order	19	change_order
75	Can delete order	19	delete_order
76	Can view order	19	view_order
77	Can add wish list	20	add_wishlist
78	Can change wish list	20	change_wishlist
79	Can delete wish list	20	delete_wishlist
80	Can view wish list	20	view_wishlist
81	Can add cart	21	add_cart
82	Can change cart	21	change_cart
83	Can delete cart	21	delete_cart
84	Can view cart	21	view_cart
85	Can add cart item	22	add_cartitem
86	Can change cart item	22	change_cartitem
87	Can delete cart item	22	delete_cartitem
88	Can view cart item	22	view_cartitem
89	Can add post	23	add_post
90	Can change post	23	change_post
91	Can delete post	23	delete_post
92	Can view post	23	view_post
93	Can add tag	24	add_tag
94	Can change tag	24	change_tag
95	Can delete tag	24	delete_tag
96	Can view tag	24	view_tag
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$320000$CUAjZoJPyv77gMTXDQqfrP$BSt3QgPYEnFJxNSjHtx1WSsAUdTNBG6feLWL3EH3JYQ=	2022-05-13 14:00:52.07984+00	t	admin				t	t	2022-05-09 15:54:42.359779+00
2	pbkdf2_sha256$320000$2zNUxDUk5yOIe5otScy533$5EpayJkV0SNsswMU6tSPfFRYU1wz7iEAj9rFqAaOB9c=	2022-05-16 14:21:52.715702+00	t	murodalidev				t	t	2022-05-16 14:21:40.468028+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.blog_post (id, title, image, content, created_at) FROM stdin;
1	Cooking tips make cooking simple	blog/xblog-1.jpg.pagespeed.ic.LxmSdcElIm.jpg	Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat\r\nSed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat\r\nSed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat\r\nSed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat\r\nSed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat	2022-05-18 15:02:34.930311+00
2	6 ways to prepare breakfast for 30	blog/xblog-2.jpg.pagespeed.ic.BEPbl29gdJ.jpg	6 ways to prepare breakfast for 30\r\n6 ways to prepare breakfast for 306 ways to prepare breakfast for 30\r\n6 ways to prepare breakfast for 30\r\n6 ways to prepare breakfast for 30	2022-05-18 15:02:55.120783+00
3	Visit the clean farm in the US	blog/xblog-4.jpg.pagespeed.ic.ln84NoXf6O.jpg	Visit the clean farm in the US Visit the clean farm in the US Visit the clean farm in the USVisit the clean farm in the USVisit the clean farm in the USVisit the clean farm in the US Visit the clean farm in the US Visit the clean farm in the US	2022-05-18 15:03:58.97618+00
\.


--
-- Data for Name: blog_post_tags; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.blog_post_tags (id, post_id, tag_id) FROM stdin;
\.


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.blog_tag (id, title) FROM stdin;
1	Apple
2	Beauty
3	Fruit
\.


--
-- Data for Name: carts_cart; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.carts_cart (id, cart_total_price, client_id) FROM stdin;
1	123	1
\.


--
-- Data for Name: carts_cartitem; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.carts_cartitem (id, quantity, total, created_at, updated_at, cart_id, product_id) FROM stdin;
1	1	15000	2022-05-13 15:38:56.23682+00	2022-05-13 15:38:56.237809+00	1	1
\.


--
-- Data for Name: carts_order; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.carts_order (id, transaction_id, phone, address, note, order_total_price, status, created_at, cart_id, client_id) FROM stdin;
1	4b67ebf7-1caf-4fbf-8e0b-431bcee5f7bb	+998977120180	Miroobod, Oybek, Taras Shevchenko 23 (GROSS BUSINESS CENTER)		20000	0	2022-05-13 15:39:34.473469+00	1	1
\.


--
-- Data for Name: carts_wishlist; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.carts_wishlist (id, user_id) FROM stdin;
1	1
\.


--
-- Data for Name: carts_wishlist_product; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.carts_wishlist_product (id, wishlist_id, product_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: contacts_contact; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.contacts_contact (id, full_name, email, message, created_at) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-05-13 15:01:38.482176+00	1	admin	1	[{"added": {}}]	13	1
2	2022-05-13 15:02:58.967818+00	1	Fresh Meat	1	[{"added": {}}]	15	1
3	2022-05-13 15:03:05.601004+00	2	Vegetables	1	[{"added": {}}]	15	1
4	2022-05-13 15:03:11.992439+00	3	Fruit & Nut Gifts	1	[{"added": {}}]	15	1
5	2022-05-13 15:03:22.346281+00	4	Fresh Berries	1	[{"added": {}}]	15	1
6	2022-05-13 15:03:28.551527+00	5	Ocean Foods	1	[{"added": {}}]	15	1
7	2022-05-13 15:03:35.678281+00	6	Butter & Eggs	1	[{"added": {}}]	15	1
8	2022-05-13 15:03:42.953555+00	7	Fastfood	1	[{"added": {}}]	15	1
9	2022-05-13 15:03:49.07288+00	8	Fresh Onion	1	[{"added": {}}]	15	1
10	2022-05-13 15:03:55.964739+00	9	Papayaya & Crisps	1	[{"added": {}}]	15	1
11	2022-05-13 15:04:02.600515+00	10	Oatmeal	1	[{"added": {}}]	15	1
12	2022-05-13 15:04:09.021446+00	11	Fresh Bananas	1	[{"added": {}}]	15	1
13	2022-05-13 15:06:19.911429+00	1	Crab Pool Security	1	[{"added": {}}, {"added": {"name": "product image", "object": "image of Crab Pool Security"}}, {"added": {"name": "product image", "object": "image of Crab Pool Security"}}]	18	1
14	2022-05-13 15:07:31.35049+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	1
15	2022-05-13 15:07:46.235216+00	1	rate of admin	1	[{"added": {}}]	16	1
16	2022-05-13 15:37:17.740994+00	1	wishlist of admin	1	[{"added": {}}]	20	1
17	2022-05-13 15:38:17.588649+00	1	wishlist of admin	2	[]	20	1
18	2022-05-13 15:38:56.238875+00	1	Cart object (1)	1	[{"added": {}}, {"added": {"name": "cart item", "object": "CartItem object (1)"}}]	21	1
19	2022-05-13 15:39:34.475314+00	1	Order object (1)	1	[{"added": {}}]	19	1
20	2022-05-13 15:39:43.53238+00	1	Order object (1)	2	[]	19	1
21	2022-05-14 21:17:32.345176+00	1	admin	3		13	1
22	2022-05-16 14:22:13.624473+00	3	admin	1	[{"added": {}}]	13	2
23	2022-05-16 14:29:09.153402+00	11	Fresh Bananas	2	[{"changed": {"fields": ["Image"]}}]	15	2
24	2022-05-16 14:29:17.35623+00	10	Oatmeal	2	[{"changed": {"fields": ["Image"]}}]	15	2
25	2022-05-16 14:29:25.646665+00	9	Papayaya & Crisps	2	[{"changed": {"fields": ["Image"]}}]	15	2
26	2022-05-16 14:29:33.618617+00	7	Fastfood	2	[{"changed": {"fields": ["Image"]}}]	15	2
27	2022-05-16 14:29:40.668183+00	6	Butter & Eggs	2	[{"changed": {"fields": ["Image"]}}]	15	2
28	2022-05-16 14:29:52.390294+00	5	Ocean Foods	2	[{"changed": {"fields": ["Image"]}}]	15	2
29	2022-05-16 14:30:01.768525+00	4	Fresh Berries	2	[{"changed": {"fields": ["Image"]}}]	15	2
30	2022-05-16 14:30:12.184286+00	3	Fruit & Nut Gifts	2	[{"changed": {"fields": ["Image"]}}]	15	2
31	2022-05-16 14:30:19.548911+00	2	Vegetables	2	[{"changed": {"fields": ["Image"]}}]	15	2
32	2022-05-16 14:30:29.288695+00	1	Fresh Meat	2	[{"changed": {"fields": ["Image"]}}]	15	2
33	2022-05-16 14:35:42.045214+00	8	Fresh Onion	2	[{"changed": {"fields": ["Image"]}}]	15	2
34	2022-05-16 14:46:47.207518+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	2
35	2022-05-16 14:49:49.712431+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	2
36	2022-05-16 14:51:23.427471+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	2
37	2022-05-16 14:58:08.101065+00	9	Papayaya and Crisps	2	[{"changed": {"fields": ["Title"]}}]	15	2
38	2022-05-16 14:58:18.791893+00	6	Butter and Eggs	2	[{"changed": {"fields": ["Title"]}}]	15	2
39	2022-05-16 14:58:28.597285+00	3	Fruit and Nut Gifts	2	[{"changed": {"fields": ["Title"]}}]	15	2
40	2022-05-16 14:58:32.480047+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	2
41	2022-05-16 14:59:24.407434+00	1	Crab Pool Security	2	[{"changed": {"fields": ["Category"]}}]	18	2
42	2022-05-16 15:52:30.431178+00	2	Lavash	1	[{"added": {}}, {"added": {"name": "product image", "object": "image of Lavash"}}]	18	2
43	2022-05-16 15:53:22.666913+00	3	KFS	1	[{"added": {}}, {"added": {"name": "product image", "object": "image of KFS"}}]	18	2
44	2022-05-16 15:53:55.999694+00	4	Hot Eggs	1	[{"added": {}}, {"added": {"name": "product image", "object": "image of Hot Eggs"}}]	18	2
45	2022-05-18 14:32:50.965078+00	4	4 | Hot Eggs	2	[{"added": {"name": "rate", "object": "rate of admin"}}, {"added": {"name": "rate", "object": "rate of murodalidev"}}]	18	2
46	2022-05-18 14:33:11.473176+00	3	3 | KFS	2	[{"added": {"name": "rate", "object": "rate of admin"}}, {"added": {"name": "rate", "object": "rate of murodalidev"}}]	18	2
47	2022-05-18 14:33:28.342474+00	2	2 | Lavash	2	[{"added": {"name": "rate", "object": "rate of admin"}}, {"added": {"name": "rate", "object": "rate of murodalidev"}}]	18	2
48	2022-05-18 14:33:42.9138+00	1	1 | Crab Pool Security	2	[{"added": {"name": "rate", "object": "rate of murodalidev"}}, {"changed": {"name": "rate", "object": "rate of admin", "fields": ["Rate"]}}]	18	2
49	2022-05-18 14:42:04.372082+00	3	3 | KFS	2	[{"changed": {"fields": ["Views"]}}]	18	2
50	2022-05-18 15:02:34.932026+00	1	Cooking tips make cooking simple	1	[{"added": {}}]	23	2
51	2022-05-18 15:02:55.121933+00	2	6 ways to prepare breakfast for 30	1	[{"added": {}}]	23	2
52	2022-05-18 15:03:58.977333+00	3	Visit the clean farm in the US	1	[{"added": {}}]	23	2
53	2022-05-18 16:01:25.059595+00	1	Apple	1	[{"added": {}}]	24	2
54	2022-05-18 16:01:29.747533+00	2	Beauty	1	[{"added": {}}]	24	2
55	2022-05-18 16:01:37.062035+00	3	Fruit	1	[{"added": {}}]	24	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	account	emailaddress
9	account	emailconfirmation
10	socialaccount	socialaccount
11	socialaccount	socialapp
12	socialaccount	socialtoken
13	accounts	profile
14	contacts	contact
15	products	category
16	products	rate
17	products	productimage
18	products	product
19	carts	order
20	carts	wishlist
21	carts	cart
22	carts	cartitem
23	blog	post
24	blog	tag
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-05-09 15:53:52.153213+00
2	auth	0001_initial	2022-05-09 15:53:52.218598+00
3	account	0001_initial	2022-05-09 15:53:52.251035+00
4	account	0002_email_max_length	2022-05-09 15:53:52.262125+00
5	admin	0001_initial	2022-05-09 15:53:52.283595+00
6	admin	0002_logentry_remove_auto_add	2022-05-09 15:53:52.291954+00
7	admin	0003_logentry_add_action_flag_choices	2022-05-09 15:53:52.301201+00
8	contenttypes	0002_remove_content_type_name	2022-05-09 15:53:52.321404+00
9	auth	0002_alter_permission_name_max_length	2022-05-09 15:53:52.332671+00
10	auth	0003_alter_user_email_max_length	2022-05-09 15:53:52.342206+00
11	auth	0004_alter_user_username_opts	2022-05-09 15:53:52.352462+00
12	auth	0005_alter_user_last_login_null	2022-05-09 15:53:52.364267+00
13	auth	0006_require_contenttypes_0002	2022-05-09 15:53:52.36674+00
14	auth	0007_alter_validators_add_error_messages	2022-05-09 15:53:52.376402+00
15	auth	0008_alter_user_username_max_length	2022-05-09 15:53:52.392229+00
16	auth	0009_alter_user_last_name_max_length	2022-05-09 15:53:52.403244+00
17	auth	0010_alter_group_name_max_length	2022-05-09 15:53:52.414973+00
18	auth	0011_update_proxy_permissions	2022-05-09 15:53:52.423527+00
19	auth	0012_alter_user_first_name_max_length	2022-05-09 15:53:52.434376+00
20	sessions	0001_initial	2022-05-09 15:53:52.446393+00
21	sites	0001_initial	2022-05-09 15:53:52.452597+00
22	sites	0002_alter_domain_unique	2022-05-09 15:53:52.460422+00
23	socialaccount	0001_initial	2022-05-09 15:53:52.539056+00
24	socialaccount	0002_token_max_lengths	2022-05-09 15:53:52.563833+00
25	socialaccount	0003_extra_data_default_dict	2022-05-09 15:53:52.573204+00
26	accounts	0001_initial	2022-05-13 15:00:42.951241+00
27	contacts	0001_initial	2022-05-13 15:00:42.959428+00
28	products	0001_initial	2022-05-13 15:00:43.005949+00
29	products	0002_product_category	2022-05-13 15:07:24.260106+00
30	carts	0001_initial	2022-05-13 15:34:48.164922+00
31	products	0003_category_image	2022-05-16 14:28:38.90584+00
32	products	0004_product_total_rate	2022-05-16 15:04:17.879607+00
33	products	0005_remove_product_total_rate	2022-05-16 15:06:50.636653+00
34	products	0006_product_views	2022-05-16 15:17:18.029114+00
35	products	0007_product_mid_rate	2022-05-16 15:36:08.133762+00
36	products	0008_alter_rate_user	2022-05-18 14:32:47.151729+00
37	blog	0001_initial	2022-05-18 15:01:45.994702+00
38	blog	0002_post_tags	2022-05-18 15:59:47.012862+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
rbsagymapeo0owapv8v1d0b41r0zb3pa	.eJxVjDsOwjAQBe_iGlm7wR9MSc8ZrLW9iwPIkeKkQtwdIqWA9s3Me6lI61Lj2nmOY1FnherwuyXKD24bKHdqt0nnqS3zmPSm6J12fZ0KPy-7-3dQqddvLZjAGp9Oxg4oFjxTQj6iL86YIEhD8SjFZXAYJBugEAQs2sQE5IN6fwDR_DeV:1npVqe:wBCQRVs8wyhII2Xf83wzKyxnLITB1LgYfiamERjmkV4	2022-05-27 14:00:52.083519+00
4ehczsplfmhv60pjdj7pmbsnme9aqhxi	.eJxVjEEOwiAQRe_C2hAYoKUu3XsGMsOAVA0kpV0Z765NutDtf-_9lwi4rSVsPS1hZnEWIE6_G2F8pLoDvmO9NRlbXZeZ5K7Ig3Z5bZyel8P9OyjYy7cmSCNmdlZpY9gbspnH0Sk9OVQZGCFN4EFDJLY-Oz2Qc4P3BnFIoEi8P96oN5Q:1nqbbc:nGk5ZbIYVPsB7N2EMaRfKiikOKUlhpVqbwFlnAIEjRU	2022-05-30 14:21:52.721586+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.products_category (id, created_at, updated_at, title, image) FROM stdin;
11	2022-05-13 15:04:09.020547+00	2022-05-16 14:29:09.150902+00	Fresh Bananas	categories/xthumb-4.jpg.pagespeed.ic.N135Z3ySXJ.jpg
10	2022-05-13 15:04:02.599038+00	2022-05-16 14:29:17.354143+00	Oatmeal	categories/xthumb-1.jpg.pagespeed.ic.SeqUEM1dNb.jpg
7	2022-05-13 15:03:42.952606+00	2022-05-16 14:29:33.616429+00	Fastfood	categories/xthumb-4.jpg.pagespeed.ic.N135Z3ySXJ_LJ2f0mN.jpg
5	2022-05-13 15:03:28.550173+00	2022-05-16 14:29:52.387513+00	Ocean Foods	categories/xproduct-details-1.jpg.pagespeed.ic.Bx8YcdG-Av_iaMiPIV.jpg
4	2022-05-13 15:03:22.344979+00	2022-05-16 14:30:01.765683+00	Fresh Berries	categories/xthumb-2.jpg.pagespeed.ic.e3XPI_Gg2F.jpg
2	2022-05-13 15:03:05.599755+00	2022-05-16 14:30:19.547742+00	Vegetables	categories/xthumb-4.jpg.pagespeed.ic.N135Z3ySXJ_eu6dn7C.jpg
1	2022-05-13 15:02:58.96234+00	2022-05-16 14:30:29.286309+00	Fresh Meat	categories/xthumb-2.jpg.pagespeed.ic.e3XPI_Gg2F_PPG1s6W.jpg
8	2022-05-13 15:03:49.071159+00	2022-05-16 14:35:42.042105+00	Fresh Onion	categories/xproduct-details-1.jpg.pagespeed.ic.Bx8YcdG-Av_50Exj2B.jpg
9	2022-05-13 15:03:55.963396+00	2022-05-16 14:58:08.100293+00	Papayaya and Crisps	categories/xthumb-3.jpg.pagespeed.ic.ywo2R_vdns.jpg
6	2022-05-13 15:03:35.67635+00	2022-05-16 14:58:18.79027+00	Butter and Eggs	categories/xproduct-details-1.jpg.pagespeed.ic.Bx8YcdG-Av.jpg
3	2022-05-13 15:03:11.991137+00	2022-05-16 14:58:28.5962+00	Fruit and Nut Gifts	categories/xthumb-3.jpg.pagespeed.ic.ywo2R_vdns_gflLTWz.jpg
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.products_product (id, created_at, updated_at, name, price, description, category_id, views, mid_rate) FROM stdin;
1	2022-05-13 15:06:19.905846+00	2022-05-18 15:47:59.292142+00	Crab Pool Security	15000	Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Sed porttitor lectus nibh. Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui. Proin eget tortor risus.	9	0	1
3	2022-05-16 15:53:22.663186+00	2022-05-18 15:47:59.297706+00	KFS	21000	KFS backet	4	6	4
4	2022-05-16 15:53:55.997062+00	2022-05-18 15:47:59.304127+00	Hot Eggs	6000	hot eggs	6	0	5
2	2022-05-16 15:52:30.427855+00	2022-05-18 15:47:59.315343+00	Lavash	22000	tandir lavash	7	0	3
\.


--
-- Data for Name: products_productimage; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.products_productimage (id, created_at, updated_at, image, product_id) FROM stdin;
1	2022-05-13 15:06:19.908025+00	2022-05-13 15:06:19.908048+00	products/xthumb-1.jpg.pagespeed.ic.SeqUEM1dNb.jpg	1
2	2022-05-13 15:06:19.910156+00	2022-05-13 15:06:19.910176+00	products/xproduct-details-1.jpg.pagespeed.ic.Bx8YcdG-Av.jpg	1
3	2022-05-16 15:52:30.429588+00	2022-05-16 15:52:30.4296+00	products/xlp-3.jpg.pagespeed.ic.mf_XcdZ7zd.jpg	2
4	2022-05-16 15:53:22.664792+00	2022-05-16 15:53:22.664812+00	products/xlp-2.jpg.pagespeed.ic.A6ypl4JLGO.jpg	3
5	2022-05-16 15:53:55.997848+00	2022-05-16 15:53:55.997861+00	products/xlp-2.jpg.pagespeed.ic.A6ypl4JLGO_WkEWuBz.jpg	4
\.


--
-- Data for Name: products_rate; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.products_rate (id, created_at, updated_at, rate, product_id, user_id) FROM stdin;
2	2022-05-18 14:32:50.960304+00	2022-05-18 14:32:50.960339+00	5	4	1
3	2022-05-18 14:32:50.961865+00	2022-05-18 14:32:50.961883+00	5	4	2
4	2022-05-18 14:33:11.467552+00	2022-05-18 14:33:11.467607+00	4	3	1
5	2022-05-18 14:33:11.470211+00	2022-05-18 14:33:11.470277+00	4	3	2
6	2022-05-18 14:33:28.340903+00	2022-05-18 14:33:28.340919+00	3	2	1
7	2022-05-18 14:33:28.341787+00	2022-05-18 14:33:28.3418+00	3	2	2
1	2022-05-13 15:07:46.233995+00	2022-05-18 14:33:42.911849+00	1	1	1
8	2022-05-18 14:33:42.912585+00	2022-05-18 14:33:42.912596+00	1	1	2
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: one
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, false);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: accounts_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.accounts_profile_id_seq', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.blog_post_id_seq', 3, true);


--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.blog_post_tags_id_seq', 1, false);


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.blog_tag_id_seq', 3, true);


--
-- Name: carts_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.carts_cart_id_seq', 1, true);


--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.carts_cartitem_id_seq', 1, true);


--
-- Name: carts_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.carts_order_id_seq', 1, true);


--
-- Name: carts_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.carts_wishlist_id_seq', 1, true);


--
-- Name: carts_wishlist_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.carts_wishlist_product_id_seq', 1, true);


--
-- Name: contacts_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.contacts_contact_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 55, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 38, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.products_category_id_seq', 11, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.products_product_id_seq', 4, true);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.products_productimage_id_seq', 5, true);


--
-- Name: products_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.products_rate_id_seq', 8, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_pkey PRIMARY KEY (id);


--
-- Name: accounts_profile accounts_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_key UNIQUE (user_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_post blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post_tags blog_post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post_tags
    ADD CONSTRAINT blog_post_tags_pkey PRIMARY KEY (id);


--
-- Name: blog_post_tags blog_post_tags_post_id_tag_id_4925ec37_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post_tags
    ADD CONSTRAINT blog_post_tags_post_id_tag_id_4925ec37_uniq UNIQUE (post_id, tag_id);


--
-- Name: blog_tag blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: carts_cart carts_cart_client_id_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cart
    ADD CONSTRAINT carts_cart_client_id_key UNIQUE (client_id);


--
-- Name: carts_cart carts_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cart
    ADD CONSTRAINT carts_cart_pkey PRIMARY KEY (id);


--
-- Name: carts_cartitem carts_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_pkey PRIMARY KEY (id);


--
-- Name: carts_order carts_order_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_order
    ADD CONSTRAINT carts_order_pkey PRIMARY KEY (id);


--
-- Name: carts_order carts_order_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_order
    ADD CONSTRAINT carts_order_transaction_id_key UNIQUE (transaction_id);


--
-- Name: carts_wishlist carts_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist
    ADD CONSTRAINT carts_wishlist_pkey PRIMARY KEY (id);


--
-- Name: carts_wishlist_product carts_wishlist_product_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist_product
    ADD CONSTRAINT carts_wishlist_product_pkey PRIMARY KEY (id);


--
-- Name: carts_wishlist_product carts_wishlist_product_wishlist_id_product_id_a190e3df_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist_product
    ADD CONSTRAINT carts_wishlist_product_wishlist_id_product_id_a190e3df_uniq UNIQUE (wishlist_id, product_id);


--
-- Name: carts_wishlist carts_wishlist_user_id_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist
    ADD CONSTRAINT carts_wishlist_user_id_key UNIQUE (user_id);


--
-- Name: contacts_contact contacts_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.contacts_contact
    ADD CONSTRAINT contacts_contact_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_productimage products_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);


--
-- Name: products_rate products_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_rate
    ADD CONSTRAINT products_rate_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_post_tags_post_id_a1c71c8a; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX blog_post_tags_post_id_a1c71c8a ON public.blog_post_tags USING btree (post_id);


--
-- Name: blog_post_tags_tag_id_0875c551; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX blog_post_tags_tag_id_0875c551 ON public.blog_post_tags USING btree (tag_id);


--
-- Name: carts_cartitem_cart_id_9cb0a756; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_cartitem_cart_id_9cb0a756 ON public.carts_cartitem USING btree (cart_id);


--
-- Name: carts_cartitem_product_id_acd010e4; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_cartitem_product_id_acd010e4 ON public.carts_cartitem USING btree (product_id);


--
-- Name: carts_order_cart_id_484bf242; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_order_cart_id_484bf242 ON public.carts_order USING btree (cart_id);


--
-- Name: carts_order_client_id_9e45de0e; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_order_client_id_9e45de0e ON public.carts_order USING btree (client_id);


--
-- Name: carts_wishlist_product_product_id_19ca1081; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_wishlist_product_product_id_19ca1081 ON public.carts_wishlist_product USING btree (product_id);


--
-- Name: carts_wishlist_product_wishlist_id_31c90f30; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX carts_wishlist_product_wishlist_id_31c90f30 ON public.carts_wishlist_product USING btree (wishlist_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: products_product_category_id_9b594869; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX products_product_category_id_9b594869 ON public.products_product USING btree (category_id);


--
-- Name: products_productimage_product_id_e747596a; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX products_productimage_product_id_e747596a ON public.products_productimage USING btree (product_id);


--
-- Name: products_rate_product_id_5f80af05; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX products_rate_product_id_5f80af05 ON public.products_rate USING btree (product_id);


--
-- Name: products_rate_user_id_a7ddff11; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX products_rate_user_id_a7ddff11 ON public.products_rate USING btree (user_id);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: one
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_profile accounts_profile_user_id_49a85d32_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.accounts_profile
    ADD CONSTRAINT accounts_profile_user_id_49a85d32_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_tags blog_post_tags_post_id_a1c71c8a_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post_tags
    ADD CONSTRAINT blog_post_tags_post_id_a1c71c8a_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES public.blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_tags blog_post_tags_tag_id_0875c551_fk_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.blog_post_tags
    ADD CONSTRAINT blog_post_tags_tag_id_0875c551_fk_blog_tag_id FOREIGN KEY (tag_id) REFERENCES public.blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cart carts_cart_client_id_107eb73a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cart
    ADD CONSTRAINT carts_cart_client_id_107eb73a_fk_auth_user_id FOREIGN KEY (client_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_cart_id_9cb0a756_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_cartitem carts_cartitem_product_id_acd010e4_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_product_id_acd010e4_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_order carts_order_cart_id_484bf242_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_order
    ADD CONSTRAINT carts_order_cart_id_484bf242_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_order carts_order_client_id_9e45de0e_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_order
    ADD CONSTRAINT carts_order_client_id_9e45de0e_fk_auth_user_id FOREIGN KEY (client_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_wishlist_product carts_wishlist_produ_product_id_19ca1081_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist_product
    ADD CONSTRAINT carts_wishlist_produ_product_id_19ca1081_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_wishlist_product carts_wishlist_produ_wishlist_id_31c90f30_fk_carts_wis; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist_product
    ADD CONSTRAINT carts_wishlist_produ_wishlist_id_31c90f30_fk_carts_wis FOREIGN KEY (wishlist_id) REFERENCES public.carts_wishlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: carts_wishlist carts_wishlist_user_id_0bb75b1d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.carts_wishlist
    ADD CONSTRAINT carts_wishlist_user_id_0bb75b1d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_9b594869_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_9b594869_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productimage products_productimag_product_id_e747596a_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_product_id_e747596a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_rate products_rate_product_id_5f80af05_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_rate
    ADD CONSTRAINT products_rate_product_id_5f80af05_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_rate products_rate_user_id_a7ddff11_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.products_rate
    ADD CONSTRAINT products_rate_user_id_a7ddff11_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


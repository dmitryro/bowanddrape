--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE account_emailaddress OWNER TO root;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE account_emailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailaddress_id_seq OWNER TO root;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE account_emailaddress_id_seq OWNED BY account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE account_emailconfirmation OWNER TO root;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE account_emailconfirmation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_emailconfirmation_id_seq OWNER TO root;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE account_emailconfirmation_id_seq OWNED BY account_emailconfirmation.id;


--
-- Name: address_country; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE address_country (
    iso_3166_1_a2 character varying(2) NOT NULL,
    iso_3166_1_a3 character varying(3) NOT NULL,
    iso_3166_1_numeric character varying(3) NOT NULL,
    printable_name character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    display_order smallint NOT NULL,
    is_shipping_country boolean NOT NULL,
    CONSTRAINT address_country_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE address_country OWNER TO root;

--
-- Name: address_useraddress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE address_useraddress (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    phone_number character varying(128) NOT NULL,
    notes text NOT NULL,
    is_default_for_shipping boolean NOT NULL,
    is_default_for_billing boolean NOT NULL,
    num_orders integer NOT NULL,
    hash character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    country_id character varying(2) NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT address_useraddress_num_orders_check CHECK ((num_orders >= 0))
);


ALTER TABLE address_useraddress OWNER TO root;

--
-- Name: address_useraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE address_useraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE address_useraddress_id_seq OWNER TO root;

--
-- Name: address_useraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE address_useraddress_id_seq OWNED BY address_useraddress.id;


--
-- Name: admin_tools_dashboard_preferences; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE admin_tools_dashboard_preferences (
    id integer NOT NULL,
    data text NOT NULL,
    dashboard_id character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin_tools_dashboard_preferences OWNER TO root;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE admin_tools_dashboard_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_tools_dashboard_preferences_id_seq OWNER TO root;

--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE admin_tools_dashboard_preferences_id_seq OWNED BY admin_tools_dashboard_preferences.id;


--
-- Name: admin_tools_menu_bookmark; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE admin_tools_menu_bookmark (
    id integer NOT NULL,
    url character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE admin_tools_menu_bookmark OWNER TO root;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE admin_tools_menu_bookmark_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE admin_tools_menu_bookmark_id_seq OWNER TO root;

--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE admin_tools_menu_bookmark_id_seq OWNED BY admin_tools_menu_bookmark.id;


--
-- Name: analytics_productrecord; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE analytics_productrecord (
    id integer NOT NULL,
    num_views integer NOT NULL,
    num_basket_additions integer NOT NULL,
    num_purchases integer NOT NULL,
    score double precision NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT analytics_productrecord_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT analytics_productrecord_num_purchases_check CHECK ((num_purchases >= 0)),
    CONSTRAINT analytics_productrecord_num_views_check CHECK ((num_views >= 0))
);


ALTER TABLE analytics_productrecord OWNER TO root;

--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE analytics_productrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE analytics_productrecord_id_seq OWNER TO root;

--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE analytics_productrecord_id_seq OWNED BY analytics_productrecord.id;


--
-- Name: analytics_userproductview; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE analytics_userproductview (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE analytics_userproductview OWNER TO root;

--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE analytics_userproductview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE analytics_userproductview_id_seq OWNER TO root;

--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE analytics_userproductview_id_seq OWNED BY analytics_userproductview.id;


--
-- Name: analytics_userrecord; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE analytics_userrecord (
    id integer NOT NULL,
    num_product_views integer NOT NULL,
    num_basket_additions integer NOT NULL,
    num_orders integer NOT NULL,
    num_order_lines integer NOT NULL,
    num_order_items integer NOT NULL,
    total_spent numeric(12,2) NOT NULL,
    date_last_order timestamp with time zone,
    user_id integer NOT NULL,
    CONSTRAINT analytics_userrecord_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT analytics_userrecord_num_order_items_check CHECK ((num_order_items >= 0)),
    CONSTRAINT analytics_userrecord_num_order_lines_check CHECK ((num_order_lines >= 0)),
    CONSTRAINT analytics_userrecord_num_orders_check CHECK ((num_orders >= 0)),
    CONSTRAINT analytics_userrecord_num_product_views_check CHECK ((num_product_views >= 0))
);


ALTER TABLE analytics_userrecord OWNER TO root;

--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE analytics_userrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE analytics_userrecord_id_seq OWNER TO root;

--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE analytics_userrecord_id_seq OWNED BY analytics_userrecord.id;


--
-- Name: analytics_usersearch; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE analytics_usersearch (
    id integer NOT NULL,
    query character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE analytics_usersearch OWNER TO root;

--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE analytics_usersearch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE analytics_usersearch_id_seq OWNER TO root;

--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE analytics_usersearch_id_seq OWNED BY analytics_usersearch.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO root;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO root;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO root;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO root;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO root;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO root;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO root;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE authtoken_token OWNER TO root;

--
-- Name: basket_basket; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE basket_basket (
    id integer NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_merged timestamp with time zone,
    date_submitted timestamp with time zone,
    owner_id integer
);


ALTER TABLE basket_basket OWNER TO root;

--
-- Name: basket_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE basket_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE basket_basket_id_seq OWNER TO root;

--
-- Name: basket_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE basket_basket_id_seq OWNED BY basket_basket.id;


--
-- Name: basket_basket_vouchers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE basket_basket_vouchers (
    id integer NOT NULL,
    basket_id integer NOT NULL,
    voucher_id integer NOT NULL
);


ALTER TABLE basket_basket_vouchers OWNER TO root;

--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE basket_basket_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE basket_basket_vouchers_id_seq OWNER TO root;

--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE basket_basket_vouchers_id_seq OWNED BY basket_basket_vouchers.id;


--
-- Name: basket_line; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE basket_line (
    id integer NOT NULL,
    line_reference character varying(128) NOT NULL,
    quantity integer NOT NULL,
    price_currency character varying(12) NOT NULL,
    price_excl_tax numeric(12,2),
    price_incl_tax numeric(12,2),
    date_created timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL,
    stockrecord_id integer NOT NULL,
    CONSTRAINT basket_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE basket_line OWNER TO root;

--
-- Name: basket_line_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE basket_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE basket_line_id_seq OWNER TO root;

--
-- Name: basket_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE basket_line_id_seq OWNED BY basket_line.id;


--
-- Name: basket_lineattribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE basket_lineattribute (
    id integer NOT NULL,
    value character varying(255) NOT NULL,
    line_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE basket_lineattribute OWNER TO root;

--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE basket_lineattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE basket_lineattribute_id_seq OWNER TO root;

--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE basket_lineattribute_id_seq OWNED BY basket_lineattribute.id;


--
-- Name: blog_blogcategory; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE blog_blogcategory (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE blog_blogcategory OWNER TO root;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE blog_blogcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogcategory_id_seq OWNER TO root;

--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE blog_blogcategory_id_seq OWNED BY blog_blogcategory.id;


--
-- Name: blog_blogpost; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE blog_blogpost (
    id integer NOT NULL,
    comments_count integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    content text NOT NULL,
    allow_comments boolean NOT NULL,
    featured_image character varying(255),
    site_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE blog_blogpost OWNER TO root;

--
-- Name: blog_blogpost_categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE blog_blogpost_categories (
    id integer NOT NULL,
    blogpost_id integer NOT NULL,
    blogcategory_id integer NOT NULL
);


ALTER TABLE blog_blogpost_categories OWNER TO root;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE blog_blogpost_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_categories_id_seq OWNER TO root;

--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE blog_blogpost_categories_id_seq OWNED BY blog_blogpost_categories.id;


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE blog_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_id_seq OWNER TO root;

--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE blog_blogpost_id_seq OWNED BY blog_blogpost.id;


--
-- Name: blog_blogpost_related_posts; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE blog_blogpost_related_posts (
    id integer NOT NULL,
    from_blogpost_id integer NOT NULL,
    to_blogpost_id integer NOT NULL
);


ALTER TABLE blog_blogpost_related_posts OWNER TO root;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE blog_blogpost_related_posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE blog_blogpost_related_posts_id_seq OWNER TO root;

--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE blog_blogpost_related_posts_id_seq OWNED BY blog_blogpost_related_posts.id;


--
-- Name: catalogue_attributeoption; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_attributeoption (
    id integer NOT NULL,
    option character varying(255) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE catalogue_attributeoption OWNER TO root;

--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_attributeoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_attributeoption_id_seq OWNER TO root;

--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_attributeoption_id_seq OWNED BY catalogue_attributeoption.id;


--
-- Name: catalogue_attributeoptiongroup; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_attributeoptiongroup (
    id integer NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE catalogue_attributeoptiongroup OWNER TO root;

--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_attributeoptiongroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_attributeoptiongroup_id_seq OWNER TO root;

--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_attributeoptiongroup_id_seq OWNED BY catalogue_attributeoptiongroup.id;


--
-- Name: catalogue_category; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_category (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    image character varying(255),
    slug character varying(255) NOT NULL,
    CONSTRAINT catalogue_category_depth_check CHECK ((depth >= 0)),
    CONSTRAINT catalogue_category_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE catalogue_category OWNER TO root;

--
-- Name: catalogue_category_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_category_id_seq OWNER TO root;

--
-- Name: catalogue_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_category_id_seq OWNED BY catalogue_category.id;


--
-- Name: catalogue_option; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_option (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    type character varying(128) NOT NULL
);


ALTER TABLE catalogue_option OWNER TO root;

--
-- Name: catalogue_option_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_option_id_seq OWNER TO root;

--
-- Name: catalogue_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_option_id_seq OWNED BY catalogue_option.id;


--
-- Name: catalogue_product; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_product (
    id integer NOT NULL,
    structure character varying(10) NOT NULL,
    upc character varying(64),
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    rating double precision,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    is_discountable boolean NOT NULL,
    parent_id integer,
    product_class_id integer
);


ALTER TABLE catalogue_product OWNER TO root;

--
-- Name: catalogue_product_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_product_id_seq OWNER TO root;

--
-- Name: catalogue_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_product_id_seq OWNED BY catalogue_product.id;


--
-- Name: catalogue_product_product_options; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_product_product_options (
    id integer NOT NULL,
    product_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE catalogue_product_product_options OWNER TO root;

--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_product_product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_product_product_options_id_seq OWNER TO root;

--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_product_product_options_id_seq OWNED BY catalogue_product_product_options.id;


--
-- Name: catalogue_productattribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productattribute (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    type character varying(20) NOT NULL,
    required boolean NOT NULL,
    option_group_id integer,
    product_class_id integer
);


ALTER TABLE catalogue_productattribute OWNER TO root;

--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productattribute_id_seq OWNER TO root;

--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productattribute_id_seq OWNED BY catalogue_productattribute.id;


--
-- Name: catalogue_productattributevalue; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productattributevalue (
    id integer NOT NULL,
    value_text text,
    value_integer integer,
    value_boolean boolean,
    value_float double precision,
    value_richtext text,
    value_date date,
    value_file character varying(255),
    value_image character varying(255),
    entity_object_id integer,
    attribute_id integer NOT NULL,
    entity_content_type_id integer,
    product_id integer NOT NULL,
    value_option_id integer,
    CONSTRAINT catalogue_productattributevalue_entity_object_id_check CHECK ((entity_object_id >= 0))
);


ALTER TABLE catalogue_productattributevalue OWNER TO root;

--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productattributevalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productattributevalue_id_seq OWNER TO root;

--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productattributevalue_id_seq OWNED BY catalogue_productattributevalue.id;


--
-- Name: catalogue_productcategory; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productcategory (
    id integer NOT NULL,
    category_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE catalogue_productcategory OWNER TO root;

--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productcategory_id_seq OWNER TO root;

--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productcategory_id_seq OWNED BY catalogue_productcategory.id;


--
-- Name: catalogue_productclass; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productclass (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    requires_shipping boolean NOT NULL,
    track_stock boolean NOT NULL
);


ALTER TABLE catalogue_productclass OWNER TO root;

--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productclass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productclass_id_seq OWNER TO root;

--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productclass_id_seq OWNED BY catalogue_productclass.id;


--
-- Name: catalogue_productclass_options; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productclass_options (
    id integer NOT NULL,
    productclass_id integer NOT NULL,
    option_id integer NOT NULL
);


ALTER TABLE catalogue_productclass_options OWNER TO root;

--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productclass_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productclass_options_id_seq OWNER TO root;

--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productclass_options_id_seq OWNED BY catalogue_productclass_options.id;


--
-- Name: catalogue_productimage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productimage (
    id integer NOT NULL,
    original character varying(255) NOT NULL,
    caption character varying(200) NOT NULL,
    display_order integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT catalogue_productimage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE catalogue_productimage OWNER TO root;

--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productimage_id_seq OWNER TO root;

--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productimage_id_seq OWNED BY catalogue_productimage.id;


--
-- Name: catalogue_productrecommendation; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE catalogue_productrecommendation (
    id integer NOT NULL,
    ranking smallint NOT NULL,
    primary_id integer NOT NULL,
    recommendation_id integer NOT NULL,
    CONSTRAINT catalogue_productrecommendation_ranking_check CHECK ((ranking >= 0))
);


ALTER TABLE catalogue_productrecommendation OWNER TO root;

--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE catalogue_productrecommendation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE catalogue_productrecommendation_id_seq OWNER TO root;

--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE catalogue_productrecommendation_id_seq OWNED BY catalogue_productrecommendation.id;


--
-- Name: conf_setting; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE conf_setting (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    value character varying(2000) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE conf_setting OWNER TO root;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE conf_setting_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE conf_setting_id_seq OWNER TO root;

--
-- Name: conf_setting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE conf_setting_id_seq OWNED BY conf_setting.id;


--
-- Name: contentitem_code_codeitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_code_codeitem (
    contentitem_ptr_id integer NOT NULL,
    language character varying(50) NOT NULL,
    code text NOT NULL,
    linenumbers boolean NOT NULL
);


ALTER TABLE contentitem_code_codeitem OWNER TO root;

--
-- Name: contentitem_gist_gistitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_gist_gistitem (
    contentitem_ptr_id integer NOT NULL,
    gist_id character varying(128) NOT NULL,
    filename character varying(128) NOT NULL
);


ALTER TABLE contentitem_gist_gistitem OWNER TO root;

--
-- Name: contentitem_googledocsviewer_googledocsvieweritem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_googledocsviewer_googledocsvieweritem (
    contentitem_ptr_id integer NOT NULL,
    url character varying(200) NOT NULL,
    width character varying(10) NOT NULL,
    height character varying(10) NOT NULL
);


ALTER TABLE contentitem_googledocsviewer_googledocsvieweritem OWNER TO root;

--
-- Name: contentitem_iframe_iframeitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_iframe_iframeitem (
    contentitem_ptr_id integer NOT NULL,
    src character varying(200) NOT NULL,
    width character varying(10) NOT NULL,
    height character varying(10) NOT NULL
);


ALTER TABLE contentitem_iframe_iframeitem OWNER TO root;

--
-- Name: contentitem_markup_markupitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_markup_markupitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL,
    language character varying(30) NOT NULL
);


ALTER TABLE contentitem_markup_markupitem OWNER TO root;

--
-- Name: contentitem_oembeditem_oembeditem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_oembeditem_oembeditem (
    contentitem_ptr_id integer NOT NULL,
    embed_url character varying(200) NOT NULL,
    embed_max_width integer,
    embed_max_height integer,
    type character varying(20),
    url character varying(200),
    title character varying(512),
    description text,
    author_name character varying(255),
    author_url character varying(200),
    provider_name character varying(255),
    provider_url character varying(200),
    thumbnail_url character varying(200),
    thumbnail_height integer,
    thumbnail_width integer,
    height integer,
    width integer,
    html text,
    CONSTRAINT contentitem_oembeditem_oembeditem_embed_max_height_check CHECK ((embed_max_height >= 0)),
    CONSTRAINT contentitem_oembeditem_oembeditem_embed_max_width_check CHECK ((embed_max_width >= 0))
);


ALTER TABLE contentitem_oembeditem_oembeditem OWNER TO root;

--
-- Name: contentitem_picture_pictureitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_picture_pictureitem (
    contentitem_ptr_id integer NOT NULL,
    image character varying(100) NOT NULL,
    caption text NOT NULL,
    align character varying(10) NOT NULL,
    url character varying(300) NOT NULL,
    in_new_window boolean NOT NULL
);


ALTER TABLE contentitem_picture_pictureitem OWNER TO root;

--
-- Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_rawhtml_rawhtmlitem (
    contentitem_ptr_id integer NOT NULL,
    html text NOT NULL
);


ALTER TABLE contentitem_rawhtml_rawhtmlitem OWNER TO root;

--
-- Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_sharedcontent_sharedcontentitem (
    contentitem_ptr_id integer NOT NULL,
    shared_content_id integer NOT NULL
);


ALTER TABLE contentitem_sharedcontent_sharedcontentitem OWNER TO root;

--
-- Name: contentitem_text_textitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE contentitem_text_textitem (
    contentitem_ptr_id integer NOT NULL,
    text text NOT NULL,
    text_final text
);


ALTER TABLE contentitem_text_textitem OWNER TO root;

--
-- Name: core_sitepermission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE core_sitepermission (
    id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE core_sitepermission OWNER TO root;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_sitepermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_id_seq OWNER TO root;

--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_sitepermission_id_seq OWNED BY core_sitepermission.id;


--
-- Name: core_sitepermission_sites; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE core_sitepermission_sites (
    id integer NOT NULL,
    sitepermission_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE core_sitepermission_sites OWNER TO root;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE core_sitepermission_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core_sitepermission_sites_id_seq OWNER TO root;

--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE core_sitepermission_sites_id_seq OWNED BY core_sitepermission_sites.id;


--
-- Name: customer_communicationeventtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE customer_communicationeventtype (
    id integer NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    email_subject_template character varying(255),
    email_body_template text,
    email_body_html_template text,
    sms_template character varying(170),
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


ALTER TABLE customer_communicationeventtype OWNER TO root;

--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customer_communicationeventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_communicationeventtype_id_seq OWNER TO root;

--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customer_communicationeventtype_id_seq OWNED BY customer_communicationeventtype.id;


--
-- Name: customer_email; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE customer_email (
    id integer NOT NULL,
    subject text NOT NULL,
    body_text text NOT NULL,
    body_html text NOT NULL,
    date_sent timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE customer_email OWNER TO root;

--
-- Name: customer_email_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customer_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_email_id_seq OWNER TO root;

--
-- Name: customer_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customer_email_id_seq OWNED BY customer_email.id;


--
-- Name: customer_notification; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE customer_notification (
    id integer NOT NULL,
    subject character varying(255) NOT NULL,
    body text NOT NULL,
    category character varying(255) NOT NULL,
    location character varying(32) NOT NULL,
    date_sent timestamp with time zone NOT NULL,
    date_read timestamp with time zone,
    recipient_id integer NOT NULL,
    sender_id integer
);


ALTER TABLE customer_notification OWNER TO root;

--
-- Name: customer_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customer_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_notification_id_seq OWNER TO root;

--
-- Name: customer_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customer_notification_id_seq OWNED BY customer_notification.id;


--
-- Name: customer_productalert; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE customer_productalert (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    key character varying(128) NOT NULL,
    status character varying(20) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_confirmed timestamp with time zone,
    date_cancelled timestamp with time zone,
    date_closed timestamp with time zone,
    product_id integer NOT NULL,
    user_id integer
);


ALTER TABLE customer_productalert OWNER TO root;

--
-- Name: customer_productalert_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE customer_productalert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customer_productalert_id_seq OWNER TO root;

--
-- Name: customer_productalert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE customer_productalert_id_seq OWNED BY customer_productalert.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_admin_log (
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


ALTER TABLE django_admin_log OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO root;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_comment_flags; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_comment_flags (
    id integer NOT NULL,
    flag character varying(30) NOT NULL,
    flag_date timestamp with time zone NOT NULL,
    comment_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE django_comment_flags OWNER TO root;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_comment_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comment_flags_id_seq OWNER TO root;

--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_comment_flags_id_seq OWNED BY django_comment_flags.id;


--
-- Name: django_comments; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_comments (
    id integer NOT NULL,
    object_pk text NOT NULL,
    user_name character varying(50) NOT NULL,
    user_email character varying(254) NOT NULL,
    user_url character varying(200) NOT NULL,
    comment text NOT NULL,
    submit_date timestamp with time zone NOT NULL,
    ip_address inet,
    is_public boolean NOT NULL,
    is_removed boolean NOT NULL,
    content_type_id integer NOT NULL,
    site_id integer NOT NULL,
    user_id integer
);


ALTER TABLE django_comments OWNER TO root;

--
-- Name: django_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_comments_id_seq OWNER TO root;

--
-- Name: django_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_comments_id_seq OWNED BY django_comments.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO root;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE django_flatpage OWNER TO root;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_flatpage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_flatpage_id_seq OWNER TO root;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_flatpage_id_seq OWNED BY django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_flatpage_sites (
    id integer NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE django_flatpage_sites OWNER TO root;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_flatpage_sites_id_seq OWNER TO root;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_flatpage_sites_id_seq OWNED BY django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO root;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_redirect; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_redirect (
    id integer NOT NULL,
    site_id integer NOT NULL,
    old_path character varying(200) NOT NULL,
    new_path character varying(200) NOT NULL
);


ALTER TABLE django_redirect OWNER TO root;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_redirect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_redirect_id_seq OWNER TO root;

--
-- Name: django_redirect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_redirect_id_seq OWNED BY django_redirect.id;


--
-- Name: django_rq_jobs_job; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_rq_jobs_job (
    id integer NOT NULL,
    task character varying(200) NOT NULL,
    args character varying(255),
    schedule_type character varying(1) NOT NULL,
    repeats smallint NOT NULL,
    next_run timestamp with time zone,
    last_run timestamp with time zone,
    rq_id character varying(64),
    rq_origin character varying(64)
);


ALTER TABLE django_rq_jobs_job OWNER TO root;

--
-- Name: django_rq_jobs_job_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_rq_jobs_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_rq_jobs_job_id_seq OWNER TO root;

--
-- Name: django_rq_jobs_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_rq_jobs_job_id_seq OWNED BY django_rq_jobs_job.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO root;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE django_site OWNER TO root;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_site_id_seq OWNER TO root;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE easy_thumbnails_source OWNER TO root;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_source_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_source_id_seq OWNED BY easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE easy_thumbnails_thumbnail OWNER TO root;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_thumbnail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnail_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_thumbnail_id_seq OWNED BY easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE easy_thumbnails_thumbnaildimensions OWNER TO root;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE easy_thumbnails_thumbnaildimensions_id_seq OWNER TO root;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE easy_thumbnails_thumbnaildimensions_id_seq OWNED BY easy_thumbnails_thumbnaildimensions.id;


--
-- Name: fluent_contents_contentitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE fluent_contents_contentitem (
    id integer NOT NULL,
    parent_id integer,
    language_code character varying(15) NOT NULL,
    sort_order integer NOT NULL,
    parent_type_id integer NOT NULL,
    placeholder_id integer,
    polymorphic_ctype_id integer
);


ALTER TABLE fluent_contents_contentitem OWNER TO root;

--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE fluent_contents_contentitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fluent_contents_contentitem_id_seq OWNER TO root;

--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE fluent_contents_contentitem_id_seq OWNED BY fluent_contents_contentitem.id;


--
-- Name: fluent_contents_placeholder; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE fluent_contents_placeholder (
    id integer NOT NULL,
    slot character varying(50) NOT NULL,
    role character varying(1) NOT NULL,
    parent_id integer,
    title character varying(255) NOT NULL,
    parent_type_id integer
);


ALTER TABLE fluent_contents_placeholder OWNER TO root;

--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE fluent_contents_placeholder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fluent_contents_placeholder_id_seq OWNER TO root;

--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE fluent_contents_placeholder_id_seq OWNED BY fluent_contents_placeholder.id;


--
-- Name: fluent_coremodulpage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE fluent_coremodulpage (
    page_ptr_id integer NOT NULL,
    template_name character varying(255) NOT NULL
);


ALTER TABLE fluent_coremodulpage OWNER TO root;

--
-- Name: forms_field; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE forms_field (
    id integer NOT NULL,
    _order integer,
    label character varying(200) NOT NULL,
    field_type integer NOT NULL,
    required boolean NOT NULL,
    visible boolean NOT NULL,
    choices character varying(1000) NOT NULL,
    "default" character varying(2000) NOT NULL,
    placeholder_text character varying(100) NOT NULL,
    help_text character varying(100) NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_field OWNER TO root;

--
-- Name: forms_field_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE forms_field_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_field_id_seq OWNER TO root;

--
-- Name: forms_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE forms_field_id_seq OWNED BY forms_field.id;


--
-- Name: forms_fieldentry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE forms_fieldentry (
    id integer NOT NULL,
    field_id integer NOT NULL,
    value character varying(2000),
    entry_id integer NOT NULL
);


ALTER TABLE forms_fieldentry OWNER TO root;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE forms_fieldentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_fieldentry_id_seq OWNER TO root;

--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE forms_fieldentry_id_seq OWNED BY forms_fieldentry.id;


--
-- Name: forms_form; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE forms_form (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    button_text character varying(50) NOT NULL,
    response text NOT NULL,
    send_email boolean NOT NULL,
    email_from character varying(254) NOT NULL,
    email_copies character varying(200) NOT NULL,
    email_subject character varying(200) NOT NULL,
    email_message text NOT NULL
);


ALTER TABLE forms_form OWNER TO root;

--
-- Name: forms_formentry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE forms_formentry (
    id integer NOT NULL,
    entry_time timestamp with time zone NOT NULL,
    form_id integer NOT NULL
);


ALTER TABLE forms_formentry OWNER TO root;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE forms_formentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forms_formentry_id_seq OWNER TO root;

--
-- Name: forms_formentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE forms_formentry_id_seq OWNED BY forms_formentry.id;


--
-- Name: galleries_gallery; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE galleries_gallery (
    page_ptr_id integer NOT NULL,
    content text NOT NULL,
    zip_import character varying(100) NOT NULL
);


ALTER TABLE galleries_gallery OWNER TO root;

--
-- Name: galleries_galleryimage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE galleries_galleryimage (
    id integer NOT NULL,
    _order integer,
    file character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    gallery_id integer NOT NULL
);


ALTER TABLE galleries_galleryimage OWNER TO root;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE galleries_galleryimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE galleries_galleryimage_id_seq OWNER TO root;

--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE galleries_galleryimage_id_seq OWNED BY galleries_galleryimage.id;


--
-- Name: generic_assignedkeyword; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE generic_assignedkeyword (
    id integer NOT NULL,
    _order integer,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    keyword_id integer NOT NULL
);


ALTER TABLE generic_assignedkeyword OWNER TO root;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE generic_assignedkeyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_assignedkeyword_id_seq OWNER TO root;

--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE generic_assignedkeyword_id_seq OWNED BY generic_assignedkeyword.id;


--
-- Name: generic_keyword; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE generic_keyword (
    id integer NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    site_id integer NOT NULL
);


ALTER TABLE generic_keyword OWNER TO root;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE generic_keyword_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_keyword_id_seq OWNER TO root;

--
-- Name: generic_keyword_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE generic_keyword_id_seq OWNED BY generic_keyword.id;


--
-- Name: generic_rating; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE generic_rating (
    id integer NOT NULL,
    value integer NOT NULL,
    rating_date timestamp with time zone,
    object_pk integer NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE generic_rating OWNER TO root;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE generic_rating_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE generic_rating_id_seq OWNER TO root;

--
-- Name: generic_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE generic_rating_id_seq OWNED BY generic_rating.id;


--
-- Name: generic_threadedcomment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE generic_threadedcomment (
    comment_ptr_id integer NOT NULL,
    rating_count integer NOT NULL,
    rating_sum integer NOT NULL,
    rating_average double precision NOT NULL,
    by_author boolean NOT NULL,
    replied_to_id integer
);


ALTER TABLE generic_threadedcomment OWNER TO root;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oauth2_provider_accesstoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer
);


ALTER TABLE oauth2_provider_accesstoken OWNER TO root;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_accesstoken_id_seq OWNER TO root;

--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oauth2_provider_accesstoken_id_seq OWNED BY oauth2_provider_accesstoken.id;


--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oauth2_provider_application (
    id integer NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    skip_authorization boolean NOT NULL
);


ALTER TABLE oauth2_provider_application OWNER TO root;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_application_id_seq OWNER TO root;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oauth2_provider_application_id_seq OWNED BY oauth2_provider_application.id;


--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oauth2_provider_grant (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE oauth2_provider_grant OWNER TO root;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_grant_id_seq OWNER TO root;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oauth2_provider_grant_id_seq OWNED BY oauth2_provider_grant.id;


--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oauth2_provider_refreshtoken (
    id integer NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id integer NOT NULL,
    application_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE oauth2_provider_refreshtoken OWNER TO root;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2_provider_refreshtoken_id_seq OWNER TO root;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oauth2_provider_refreshtoken_id_seq OWNED BY oauth2_provider_refreshtoken.id;


--
-- Name: offer_benefit; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_benefit (
    id integer NOT NULL,
    type character varying(128) NOT NULL,
    value numeric(12,2),
    max_affected_items integer,
    proxy_class character varying(255),
    range_id integer,
    CONSTRAINT offer_benefit_max_affected_items_check CHECK ((max_affected_items >= 0))
);


ALTER TABLE offer_benefit OWNER TO root;

--
-- Name: offer_benefit_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_benefit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_benefit_id_seq OWNER TO root;

--
-- Name: offer_benefit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_benefit_id_seq OWNED BY offer_benefit.id;


--
-- Name: offer_compoundcondition; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_compoundcondition (
    condition_ptr_id integer NOT NULL,
    conjunction character varying(10) NOT NULL
);


ALTER TABLE offer_compoundcondition OWNER TO root;

--
-- Name: offer_compoundcondition_subconditions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_compoundcondition_subconditions (
    id integer NOT NULL,
    compoundcondition_id integer NOT NULL,
    condition_id integer NOT NULL
);


ALTER TABLE offer_compoundcondition_subconditions OWNER TO root;

--
-- Name: offer_compoundcondition_subconditions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_compoundcondition_subconditions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_compoundcondition_subconditions_id_seq OWNER TO root;

--
-- Name: offer_compoundcondition_subconditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_compoundcondition_subconditions_id_seq OWNED BY offer_compoundcondition_subconditions.id;


--
-- Name: offer_condition; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_condition (
    id integer NOT NULL,
    type character varying(128) NOT NULL,
    value numeric(12,2),
    proxy_class character varying(255),
    range_id integer
);


ALTER TABLE offer_condition OWNER TO root;

--
-- Name: offer_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_condition_id_seq OWNER TO root;

--
-- Name: offer_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_condition_id_seq OWNED BY offer_condition.id;


--
-- Name: offer_conditionaloffer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_conditionaloffer (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    offer_type character varying(128) NOT NULL,
    status character varying(64) NOT NULL,
    priority integer NOT NULL,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone,
    max_global_applications integer,
    max_user_applications integer,
    max_basket_applications integer,
    max_discount numeric(12,2),
    total_discount numeric(12,2) NOT NULL,
    num_applications integer NOT NULL,
    num_orders integer NOT NULL,
    redirect_url character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    benefit_id integer NOT NULL,
    condition_id integer NOT NULL,
    CONSTRAINT offer_conditionaloffer_max_basket_applications_check CHECK ((max_basket_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_max_global_applications_check CHECK ((max_global_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_max_user_applications_check CHECK ((max_user_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_num_applications_check CHECK ((num_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_num_orders_check CHECK ((num_orders >= 0))
);


ALTER TABLE offer_conditionaloffer OWNER TO root;

--
-- Name: offer_conditionaloffer_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_conditionaloffer_groups (
    id integer NOT NULL,
    conditionaloffer_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE offer_conditionaloffer_groups OWNER TO root;

--
-- Name: offer_conditionaloffer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_conditionaloffer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_conditionaloffer_groups_id_seq OWNER TO root;

--
-- Name: offer_conditionaloffer_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_conditionaloffer_groups_id_seq OWNED BY offer_conditionaloffer_groups.id;


--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_conditionaloffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_conditionaloffer_id_seq OWNER TO root;

--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_conditionaloffer_id_seq OWNED BY offer_conditionaloffer.id;


--
-- Name: offer_range; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_range (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    is_public boolean NOT NULL,
    includes_all_products boolean NOT NULL,
    proxy_class character varying(255),
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE offer_range OWNER TO root;

--
-- Name: offer_range_classes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_range_classes (
    id integer NOT NULL,
    range_id integer NOT NULL,
    productclass_id integer NOT NULL
);


ALTER TABLE offer_range_classes OWNER TO root;

--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_range_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_range_classes_id_seq OWNER TO root;

--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_range_classes_id_seq OWNED BY offer_range_classes.id;


--
-- Name: offer_range_excluded_products; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_range_excluded_products (
    id integer NOT NULL,
    range_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE offer_range_excluded_products OWNER TO root;

--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_range_excluded_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_range_excluded_products_id_seq OWNER TO root;

--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_range_excluded_products_id_seq OWNED BY offer_range_excluded_products.id;


--
-- Name: offer_range_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_range_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_range_id_seq OWNER TO root;

--
-- Name: offer_range_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_range_id_seq OWNED BY offer_range.id;


--
-- Name: offer_range_included_categories; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_range_included_categories (
    id integer NOT NULL,
    range_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE offer_range_included_categories OWNER TO root;

--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_range_included_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_range_included_categories_id_seq OWNER TO root;

--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_range_included_categories_id_seq OWNED BY offer_range_included_categories.id;


--
-- Name: offer_rangeproduct; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_rangeproduct (
    id integer NOT NULL,
    display_order integer NOT NULL,
    product_id integer NOT NULL,
    range_id integer NOT NULL
);


ALTER TABLE offer_rangeproduct OWNER TO root;

--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_rangeproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_rangeproduct_id_seq OWNER TO root;

--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_rangeproduct_id_seq OWNED BY offer_rangeproduct.id;


--
-- Name: offer_rangeproductfileupload; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE offer_rangeproductfileupload (
    id integer NOT NULL,
    filepath character varying(255) NOT NULL,
    size integer NOT NULL,
    date_uploaded timestamp with time zone NOT NULL,
    status character varying(32) NOT NULL,
    error_message character varying(255) NOT NULL,
    date_processed timestamp with time zone,
    num_new_skus integer,
    num_unknown_skus integer,
    num_duplicate_skus integer,
    range_id integer NOT NULL,
    uploaded_by_id integer NOT NULL,
    CONSTRAINT offer_rangeproductfileupload_num_duplicate_skus_check CHECK ((num_duplicate_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_num_new_skus_check CHECK ((num_new_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_num_unknown_skus_check CHECK ((num_unknown_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_size_check CHECK ((size >= 0))
);


ALTER TABLE offer_rangeproductfileupload OWNER TO root;

--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE offer_rangeproductfileupload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE offer_rangeproductfileupload_id_seq OWNER TO root;

--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE offer_rangeproductfileupload_id_seq OWNED BY offer_rangeproductfileupload.id;


--
-- Name: order_billingaddress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_billingaddress (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE order_billingaddress OWNER TO root;

--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_billingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_billingaddress_id_seq OWNER TO root;

--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_billingaddress_id_seq OWNED BY order_billingaddress.id;


--
-- Name: order_communicationevent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_communicationevent (
    id integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE order_communicationevent OWNER TO root;

--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_communicationevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_communicationevent_id_seq OWNER TO root;

--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_communicationevent_id_seq OWNED BY order_communicationevent.id;


--
-- Name: order_line; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_line (
    id integer NOT NULL,
    partner_name character varying(128) NOT NULL,
    partner_sku character varying(128) NOT NULL,
    partner_line_reference character varying(128) NOT NULL,
    partner_line_notes text NOT NULL,
    title character varying(255) NOT NULL,
    upc character varying(128),
    quantity integer NOT NULL,
    line_price_incl_tax numeric(12,2) NOT NULL,
    line_price_excl_tax numeric(12,2) NOT NULL,
    line_price_before_discounts_incl_tax numeric(12,2) NOT NULL,
    line_price_before_discounts_excl_tax numeric(12,2) NOT NULL,
    unit_cost_price numeric(12,2),
    unit_price_incl_tax numeric(12,2),
    unit_price_excl_tax numeric(12,2),
    unit_retail_price numeric(12,2),
    status character varying(255) NOT NULL,
    est_dispatch_date date,
    order_id integer NOT NULL,
    partner_id integer,
    product_id integer,
    stockrecord_id integer,
    CONSTRAINT order_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE order_line OWNER TO root;

--
-- Name: order_line_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_line_id_seq OWNER TO root;

--
-- Name: order_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_line_id_seq OWNED BY order_line.id;


--
-- Name: order_lineattribute; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_lineattribute (
    id integer NOT NULL,
    type character varying(128) NOT NULL,
    value character varying(255) NOT NULL,
    line_id integer NOT NULL,
    option_id integer
);


ALTER TABLE order_lineattribute OWNER TO root;

--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_lineattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_lineattribute_id_seq OWNER TO root;

--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_lineattribute_id_seq OWNED BY order_lineattribute.id;


--
-- Name: order_lineprice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_lineprice (
    id integer NOT NULL,
    quantity integer NOT NULL,
    price_incl_tax numeric(12,2) NOT NULL,
    price_excl_tax numeric(12,2) NOT NULL,
    shipping_incl_tax numeric(12,2) NOT NULL,
    shipping_excl_tax numeric(12,2) NOT NULL,
    line_id integer NOT NULL,
    order_id integer NOT NULL,
    CONSTRAINT order_lineprice_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE order_lineprice OWNER TO root;

--
-- Name: order_lineprice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_lineprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_lineprice_id_seq OWNER TO root;

--
-- Name: order_lineprice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_lineprice_id_seq OWNED BY order_lineprice.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_order (
    id integer NOT NULL,
    number character varying(128) NOT NULL,
    currency character varying(12) NOT NULL,
    total_incl_tax numeric(12,2) NOT NULL,
    total_excl_tax numeric(12,2) NOT NULL,
    shipping_incl_tax numeric(12,2) NOT NULL,
    shipping_excl_tax numeric(12,2) NOT NULL,
    shipping_method character varying(128) NOT NULL,
    shipping_code character varying(128) NOT NULL,
    status character varying(100) NOT NULL,
    guest_email character varying(254) NOT NULL,
    date_placed timestamp with time zone NOT NULL,
    basket_id integer,
    billing_address_id integer,
    shipping_address_id integer,
    site_id integer,
    user_id integer
);


ALTER TABLE order_order OWNER TO root;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_order_id_seq OWNER TO root;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_order_id_seq OWNED BY order_order.id;


--
-- Name: order_orderdiscount; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_orderdiscount (
    id integer NOT NULL,
    category character varying(64) NOT NULL,
    offer_id integer,
    offer_name character varying(128) NOT NULL,
    voucher_id integer,
    voucher_code character varying(128) NOT NULL,
    frequency integer,
    amount numeric(12,2) NOT NULL,
    message text NOT NULL,
    order_id integer NOT NULL,
    CONSTRAINT order_orderdiscount_frequency_check CHECK ((frequency >= 0)),
    CONSTRAINT order_orderdiscount_offer_id_check CHECK ((offer_id >= 0)),
    CONSTRAINT order_orderdiscount_voucher_id_check CHECK ((voucher_id >= 0))
);


ALTER TABLE order_orderdiscount OWNER TO root;

--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_orderdiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_orderdiscount_id_seq OWNER TO root;

--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_orderdiscount_id_seq OWNED BY order_orderdiscount.id;


--
-- Name: order_ordernote; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_ordernote (
    id integer NOT NULL,
    note_type character varying(128) NOT NULL,
    message text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    order_id integer NOT NULL,
    user_id integer
);


ALTER TABLE order_ordernote OWNER TO root;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_ordernote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_ordernote_id_seq OWNER TO root;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_ordernote_id_seq OWNED BY order_ordernote.id;


--
-- Name: order_paymentevent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_paymentevent (
    id integer NOT NULL,
    amount numeric(12,2) NOT NULL,
    reference character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id integer NOT NULL,
    order_id integer NOT NULL,
    shipping_event_id integer
);


ALTER TABLE order_paymentevent OWNER TO root;

--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_paymentevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_paymentevent_id_seq OWNER TO root;

--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_paymentevent_id_seq OWNED BY order_paymentevent.id;


--
-- Name: order_paymenteventquantity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_paymenteventquantity (
    id integer NOT NULL,
    quantity integer NOT NULL,
    event_id integer NOT NULL,
    line_id integer NOT NULL,
    CONSTRAINT order_paymenteventquantity_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE order_paymenteventquantity OWNER TO root;

--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_paymenteventquantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_paymenteventquantity_id_seq OWNER TO root;

--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_paymenteventquantity_id_seq OWNED BY order_paymenteventquantity.id;


--
-- Name: order_paymenteventtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_paymenteventtype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE order_paymenteventtype OWNER TO root;

--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_paymenteventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_paymenteventtype_id_seq OWNER TO root;

--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_paymenteventtype_id_seq OWNED BY order_paymenteventtype.id;


--
-- Name: order_shippingaddress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_shippingaddress (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    phone_number character varying(128) NOT NULL,
    notes text NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE order_shippingaddress OWNER TO root;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_shippingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_shippingaddress_id_seq OWNER TO root;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_shippingaddress_id_seq OWNED BY order_shippingaddress.id;


--
-- Name: order_shippingevent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_shippingevent (
    id integer NOT NULL,
    notes text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id integer NOT NULL,
    order_id integer NOT NULL
);


ALTER TABLE order_shippingevent OWNER TO root;

--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_shippingevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_shippingevent_id_seq OWNER TO root;

--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_shippingevent_id_seq OWNED BY order_shippingevent.id;


--
-- Name: order_shippingeventquantity; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_shippingeventquantity (
    id integer NOT NULL,
    quantity integer NOT NULL,
    event_id integer NOT NULL,
    line_id integer NOT NULL,
    CONSTRAINT order_shippingeventquantity_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE order_shippingeventquantity OWNER TO root;

--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_shippingeventquantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_shippingeventquantity_id_seq OWNER TO root;

--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_shippingeventquantity_id_seq OWNED BY order_shippingeventquantity.id;


--
-- Name: order_shippingeventtype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_shippingeventtype (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE order_shippingeventtype OWNER TO root;

--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE order_shippingeventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_shippingeventtype_id_seq OWNER TO root;

--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE order_shippingeventtype_id_seq OWNED BY order_shippingeventtype.id;


--
-- Name: oscar_accounts_account; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_account (
    id integer NOT NULL,
    name character varying(128),
    description text,
    code character varying(128),
    status character varying(32) NOT NULL,
    credit_limit numeric(12,2),
    balance numeric(12,2),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    can_be_used_for_non_products boolean NOT NULL,
    date_created timestamp with time zone NOT NULL,
    account_type_id integer,
    primary_user_id integer,
    product_range_id integer
);


ALTER TABLE oscar_accounts_account OWNER TO root;

--
-- Name: oscar_accounts_account_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_account_id_seq OWNER TO root;

--
-- Name: oscar_accounts_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_account_id_seq OWNED BY oscar_accounts_account.id;


--
-- Name: oscar_accounts_account_secondary_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_account_secondary_users (
    id integer NOT NULL,
    account_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE oscar_accounts_account_secondary_users OWNER TO root;

--
-- Name: oscar_accounts_account_secondary_users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_account_secondary_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_account_secondary_users_id_seq OWNER TO root;

--
-- Name: oscar_accounts_account_secondary_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_account_secondary_users_id_seq OWNED BY oscar_accounts_account_secondary_users.id;


--
-- Name: oscar_accounts_accounttype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_accounttype (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    code character varying(128),
    name character varying(128) NOT NULL,
    CONSTRAINT oscar_accounts_accounttype_depth_check CHECK ((depth >= 0)),
    CONSTRAINT oscar_accounts_accounttype_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE oscar_accounts_accounttype OWNER TO root;

--
-- Name: oscar_accounts_accounttype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_accounttype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_accounttype_id_seq OWNER TO root;

--
-- Name: oscar_accounts_accounttype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_accounttype_id_seq OWNED BY oscar_accounts_accounttype.id;


--
-- Name: oscar_accounts_ipaddressrecord; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_ipaddressrecord (
    id integer NOT NULL,
    ip_address inet NOT NULL,
    total_failures integer NOT NULL,
    consecutive_failures integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_last_failure timestamp with time zone,
    CONSTRAINT oscar_accounts_ipaddressrecord_consecutive_failures_check CHECK ((consecutive_failures >= 0)),
    CONSTRAINT oscar_accounts_ipaddressrecord_total_failures_check CHECK ((total_failures >= 0))
);


ALTER TABLE oscar_accounts_ipaddressrecord OWNER TO root;

--
-- Name: oscar_accounts_ipaddressrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_ipaddressrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_ipaddressrecord_id_seq OWNER TO root;

--
-- Name: oscar_accounts_ipaddressrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_ipaddressrecord_id_seq OWNED BY oscar_accounts_ipaddressrecord.id;


--
-- Name: oscar_accounts_transaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_transaction (
    id integer NOT NULL,
    amount numeric(12,2) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    account_id integer NOT NULL,
    transfer_id integer NOT NULL
);


ALTER TABLE oscar_accounts_transaction OWNER TO root;

--
-- Name: oscar_accounts_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_transaction_id_seq OWNER TO root;

--
-- Name: oscar_accounts_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_transaction_id_seq OWNED BY oscar_accounts_transaction.id;


--
-- Name: oscar_accounts_transfer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_accounts_transfer (
    id integer NOT NULL,
    reference character varying(64),
    amount numeric(12,2) NOT NULL,
    merchant_reference character varying(128),
    description character varying(256),
    username character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    destination_id integer NOT NULL,
    parent_id integer,
    source_id integer NOT NULL,
    user_id integer
);


ALTER TABLE oscar_accounts_transfer OWNER TO root;

--
-- Name: oscar_accounts_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_accounts_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_accounts_transfer_id_seq OWNER TO root;

--
-- Name: oscar_accounts_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_accounts_transfer_id_seq OWNED BY oscar_accounts_transfer.id;


--
-- Name: oscar_wagtail_productlistitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_wagtail_productlistitem (
    id integer NOT NULL,
    sort_order integer,
    parent_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE oscar_wagtail_productlistitem OWNER TO root;

--
-- Name: oscar_wagtail_productlistitem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_wagtail_productlistitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_wagtail_productlistitem_id_seq OWNER TO root;

--
-- Name: oscar_wagtail_productlistitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_wagtail_productlistitem_id_seq OWNED BY oscar_wagtail_productlistitem.id;


--
-- Name: oscar_wagtail_productlistsnippet; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscar_wagtail_productlistsnippet (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    code character varying(100) NOT NULL
);


ALTER TABLE oscar_wagtail_productlistsnippet OWNER TO root;

--
-- Name: oscar_wagtail_productlistsnippet_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscar_wagtail_productlistsnippet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscar_wagtail_productlistsnippet_id_seq OWNER TO root;

--
-- Name: oscar_wagtail_productlistsnippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscar_wagtail_productlistsnippet_id_seq OWNED BY oscar_wagtail_productlistsnippet.id;


--
-- Name: oscarapi_apikey; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE oscarapi_apikey (
    id integer NOT NULL,
    key character varying(255) NOT NULL
);


ALTER TABLE oscarapi_apikey OWNER TO root;

--
-- Name: oscarapi_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE oscarapi_apikey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oscarapi_apikey_id_seq OWNER TO root;

--
-- Name: oscarapi_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE oscarapi_apikey_id_seq OWNED BY oscarapi_apikey.id;


--
-- Name: pages_link; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pages_link (
    page_ptr_id integer NOT NULL
);


ALTER TABLE pages_link OWNER TO root;

--
-- Name: pages_page; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pages_page (
    id integer NOT NULL,
    keywords_string character varying(500) NOT NULL,
    title character varying(500) NOT NULL,
    slug character varying(2000),
    _meta_title character varying(500),
    description text NOT NULL,
    gen_description boolean NOT NULL,
    created timestamp with time zone,
    updated timestamp with time zone,
    status integer NOT NULL,
    publish_date timestamp with time zone,
    expiry_date timestamp with time zone,
    short_url character varying(200),
    in_sitemap boolean NOT NULL,
    _order integer,
    in_menus character varying(100),
    titles character varying(1000),
    content_model character varying(50),
    login_required boolean NOT NULL,
    parent_id integer,
    site_id integer NOT NULL
);


ALTER TABLE pages_page OWNER TO root;

--
-- Name: pages_page_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pages_page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pages_page_id_seq OWNER TO root;

--
-- Name: pages_page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pages_page_id_seq OWNED BY pages_page.id;


--
-- Name: pages_richtextpage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pages_richtextpage (
    page_ptr_id integer NOT NULL,
    content text NOT NULL
);


ALTER TABLE pages_richtextpage OWNER TO root;

--
-- Name: partner_partner; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE partner_partner (
    id integer NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE partner_partner OWNER TO root;

--
-- Name: partner_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE partner_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_partner_id_seq OWNER TO root;

--
-- Name: partner_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE partner_partner_id_seq OWNED BY partner_partner.id;


--
-- Name: partner_partner_users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE partner_partner_users (
    id integer NOT NULL,
    partner_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE partner_partner_users OWNER TO root;

--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE partner_partner_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_partner_users_id_seq OWNER TO root;

--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE partner_partner_users_id_seq OWNED BY partner_partner_users.id;


--
-- Name: partner_partneraddress; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE partner_partneraddress (
    id integer NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    country_id character varying(2) NOT NULL,
    partner_id integer NOT NULL
);


ALTER TABLE partner_partneraddress OWNER TO root;

--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE partner_partneraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_partneraddress_id_seq OWNER TO root;

--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE partner_partneraddress_id_seq OWNED BY partner_partneraddress.id;


--
-- Name: partner_stockalert; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE partner_stockalert (
    id integer NOT NULL,
    threshold integer NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_closed timestamp with time zone,
    stockrecord_id integer NOT NULL,
    CONSTRAINT partner_stockalert_threshold_check CHECK ((threshold >= 0))
);


ALTER TABLE partner_stockalert OWNER TO root;

--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE partner_stockalert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_stockalert_id_seq OWNER TO root;

--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE partner_stockalert_id_seq OWNED BY partner_stockalert.id;


--
-- Name: partner_stockrecord; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE partner_stockrecord (
    id integer NOT NULL,
    partner_sku character varying(128) NOT NULL,
    price_currency character varying(12) NOT NULL,
    price_excl_tax numeric(12,2),
    price_retail numeric(12,2),
    cost_price numeric(12,2),
    num_in_stock integer,
    num_allocated integer,
    low_stock_threshold integer,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    partner_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT partner_stockrecord_low_stock_threshold_check CHECK ((low_stock_threshold >= 0)),
    CONSTRAINT partner_stockrecord_num_in_stock_check CHECK ((num_in_stock >= 0))
);


ALTER TABLE partner_stockrecord OWNER TO root;

--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE partner_stockrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partner_stockrecord_id_seq OWNER TO root;

--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE partner_stockrecord_id_seq OWNED BY partner_stockrecord.id;


--
-- Name: payment_bankcard; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE payment_bankcard (
    id integer NOT NULL,
    card_type character varying(128) NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(32) NOT NULL,
    expiry_date date NOT NULL,
    partner_reference character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE payment_bankcard OWNER TO root;

--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE payment_bankcard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_bankcard_id_seq OWNER TO root;

--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE payment_bankcard_id_seq OWNED BY payment_bankcard.id;


--
-- Name: payment_source; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE payment_source (
    id integer NOT NULL,
    currency character varying(12) NOT NULL,
    amount_allocated numeric(12,2) NOT NULL,
    amount_debited numeric(12,2) NOT NULL,
    amount_refunded numeric(12,2) NOT NULL,
    reference character varying(255) NOT NULL,
    label character varying(128) NOT NULL,
    order_id integer NOT NULL,
    source_type_id integer NOT NULL
);


ALTER TABLE payment_source OWNER TO root;

--
-- Name: payment_source_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE payment_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_source_id_seq OWNER TO root;

--
-- Name: payment_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE payment_source_id_seq OWNED BY payment_source.id;


--
-- Name: payment_sourcetype; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE payment_sourcetype (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE payment_sourcetype OWNER TO root;

--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE payment_sourcetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_sourcetype_id_seq OWNER TO root;

--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE payment_sourcetype_id_seq OWNED BY payment_sourcetype.id;


--
-- Name: payment_transaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE payment_transaction (
    id integer NOT NULL,
    txn_type character varying(128) NOT NULL,
    amount numeric(12,2) NOT NULL,
    reference character varying(128) NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE payment_transaction OWNER TO root;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE payment_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE payment_transaction_id_seq OWNER TO root;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE payment_transaction_id_seq OWNED BY payment_transaction.id;


--
-- Name: paypal_expresstransaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE paypal_expresstransaction (
    id integer NOT NULL,
    raw_request text NOT NULL,
    raw_response text NOT NULL,
    response_time double precision NOT NULL,
    date_created timestamp with time zone NOT NULL,
    method character varying(32) NOT NULL,
    version character varying(8) NOT NULL,
    amount numeric(12,2),
    currency character varying(8),
    ack character varying(32) NOT NULL,
    correlation_id character varying(32),
    token character varying(32),
    error_code character varying(32),
    error_message character varying(256)
);


ALTER TABLE paypal_expresstransaction OWNER TO root;

--
-- Name: paypal_expresstransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE paypal_expresstransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paypal_expresstransaction_id_seq OWNER TO root;

--
-- Name: paypal_expresstransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE paypal_expresstransaction_id_seq OWNED BY paypal_expresstransaction.id;


--
-- Name: paypal_payflowtransaction; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE paypal_payflowtransaction (
    id integer NOT NULL,
    raw_request text NOT NULL,
    raw_response text NOT NULL,
    response_time double precision NOT NULL,
    date_created timestamp with time zone NOT NULL,
    comment1 character varying(128) NOT NULL,
    trxtype character varying(12) NOT NULL,
    tender character varying(12),
    amount numeric(12,2),
    pnref character varying(32),
    ppref character varying(32),
    result character varying(32),
    respmsg character varying(512) NOT NULL,
    authcode character varying(32),
    cvv2match character varying(12),
    avsaddr character varying(1),
    avszip character varying(1)
);


ALTER TABLE paypal_payflowtransaction OWNER TO root;

--
-- Name: paypal_payflowtransaction_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE paypal_payflowtransaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paypal_payflowtransaction_id_seq OWNER TO root;

--
-- Name: paypal_payflowtransaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE paypal_payflowtransaction_id_seq OWNED BY paypal_payflowtransaction.id;


--
-- Name: pinax_stripe_bitcoinreceiver; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_bitcoinreceiver (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    amount numeric(9,2) NOT NULL,
    amount_received numeric(9,2) NOT NULL,
    bitcoin_amount integer NOT NULL,
    bitcoin_amount_received integer NOT NULL,
    bitcoin_uri text NOT NULL,
    currency character varying(10) NOT NULL,
    description text NOT NULL,
    email text NOT NULL,
    filled boolean NOT NULL,
    inbound_address text NOT NULL,
    payment text NOT NULL,
    refund_address text NOT NULL,
    uncaptured_funds boolean NOT NULL,
    used_for_payment boolean NOT NULL,
    customer_id integer NOT NULL,
    CONSTRAINT pinax_stripe_bitcoinreceiver_bitcoin_amount_check CHECK ((bitcoin_amount >= 0)),
    CONSTRAINT pinax_stripe_bitcoinreceiver_bitcoin_amount_received_check CHECK ((bitcoin_amount_received >= 0))
);


ALTER TABLE pinax_stripe_bitcoinreceiver OWNER TO root;

--
-- Name: pinax_stripe_bitcoinreceiver_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_bitcoinreceiver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_bitcoinreceiver_id_seq OWNER TO root;

--
-- Name: pinax_stripe_bitcoinreceiver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_bitcoinreceiver_id_seq OWNED BY pinax_stripe_bitcoinreceiver.id;


--
-- Name: pinax_stripe_card; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_card (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    name text NOT NULL,
    address_line_1 text NOT NULL,
    address_line_1_check character varying(15) NOT NULL,
    address_line_2 text NOT NULL,
    address_city text NOT NULL,
    address_state text NOT NULL,
    address_country text NOT NULL,
    address_zip text NOT NULL,
    address_zip_check character varying(15) NOT NULL,
    brand text NOT NULL,
    country character varying(2) NOT NULL,
    cvc_check character varying(15) NOT NULL,
    dynamic_last4 character varying(4) NOT NULL,
    tokenization_method character varying(15) NOT NULL,
    exp_month integer NOT NULL,
    exp_year integer NOT NULL,
    funding character varying(15) NOT NULL,
    last4 character varying(4) NOT NULL,
    fingerprint text NOT NULL,
    customer_id integer NOT NULL
);


ALTER TABLE pinax_stripe_card OWNER TO root;

--
-- Name: pinax_stripe_card_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_card_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_card_id_seq OWNER TO root;

--
-- Name: pinax_stripe_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_card_id_seq OWNED BY pinax_stripe_card.id;


--
-- Name: pinax_stripe_charge; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_charge (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    source character varying(100) NOT NULL,
    currency character varying(10) NOT NULL,
    amount numeric(9,2),
    amount_refunded numeric(9,2),
    description text NOT NULL,
    paid boolean,
    disputed boolean,
    refunded boolean,
    captured boolean,
    receipt_sent boolean NOT NULL,
    charge_created timestamp with time zone,
    customer_id integer NOT NULL,
    invoice_id integer
);


ALTER TABLE pinax_stripe_charge OWNER TO root;

--
-- Name: pinax_stripe_charge_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_charge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_charge_id_seq OWNER TO root;

--
-- Name: pinax_stripe_charge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_charge_id_seq OWNED BY pinax_stripe_charge.id;


--
-- Name: pinax_stripe_customer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_customer (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    account_balance numeric(9,2),
    currency character varying(10) NOT NULL,
    delinquent boolean NOT NULL,
    default_source text NOT NULL,
    date_purged timestamp with time zone,
    user_id integer
);


ALTER TABLE pinax_stripe_customer OWNER TO root;

--
-- Name: pinax_stripe_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_customer_id_seq OWNER TO root;

--
-- Name: pinax_stripe_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_customer_id_seq OWNED BY pinax_stripe_customer.id;


--
-- Name: pinax_stripe_event; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_event (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    kind character varying(250) NOT NULL,
    livemode boolean NOT NULL,
    webhook_message text NOT NULL,
    validated_message text,
    valid boolean,
    processed boolean NOT NULL,
    request character varying(100) NOT NULL,
    pending_webhooks integer NOT NULL,
    api_version character varying(100) NOT NULL,
    customer_id integer,
    CONSTRAINT pinax_stripe_event_pending_webhooks_check CHECK ((pending_webhooks >= 0))
);


ALTER TABLE pinax_stripe_event OWNER TO root;

--
-- Name: pinax_stripe_event_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_event_id_seq OWNER TO root;

--
-- Name: pinax_stripe_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_event_id_seq OWNED BY pinax_stripe_event.id;


--
-- Name: pinax_stripe_eventprocessingexception; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_eventprocessingexception (
    id integer NOT NULL,
    data text NOT NULL,
    message character varying(500) NOT NULL,
    traceback text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    event_id integer
);


ALTER TABLE pinax_stripe_eventprocessingexception OWNER TO root;

--
-- Name: pinax_stripe_eventprocessingexception_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_eventprocessingexception_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_eventprocessingexception_id_seq OWNER TO root;

--
-- Name: pinax_stripe_eventprocessingexception_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_eventprocessingexception_id_seq OWNED BY pinax_stripe_eventprocessingexception.id;


--
-- Name: pinax_stripe_invoice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_invoice (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    amount_due numeric(9,2) NOT NULL,
    attempted boolean,
    attempt_count integer,
    statement_descriptor text NOT NULL,
    currency character varying(10) NOT NULL,
    closed boolean NOT NULL,
    description text NOT NULL,
    paid boolean NOT NULL,
    receipt_number text NOT NULL,
    period_end timestamp with time zone NOT NULL,
    period_start timestamp with time zone NOT NULL,
    subtotal numeric(9,2) NOT NULL,
    total numeric(9,2) NOT NULL,
    date timestamp with time zone NOT NULL,
    webhooks_delivered_at timestamp with time zone,
    charge_id integer,
    customer_id integer NOT NULL,
    subscription_id integer,
    CONSTRAINT pinax_stripe_invoice_attempt_count_check CHECK ((attempt_count >= 0))
);


ALTER TABLE pinax_stripe_invoice OWNER TO root;

--
-- Name: pinax_stripe_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_invoice_id_seq OWNER TO root;

--
-- Name: pinax_stripe_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_invoice_id_seq OWNED BY pinax_stripe_invoice.id;


--
-- Name: pinax_stripe_invoiceitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_invoiceitem (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    amount numeric(9,2) NOT NULL,
    currency character varying(10) NOT NULL,
    kind character varying(25) NOT NULL,
    period_start timestamp with time zone NOT NULL,
    period_end timestamp with time zone NOT NULL,
    proration boolean NOT NULL,
    line_type character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    quantity integer,
    invoice_id integer NOT NULL,
    plan_id integer,
    subscription_id integer
);


ALTER TABLE pinax_stripe_invoiceitem OWNER TO root;

--
-- Name: pinax_stripe_invoiceitem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_invoiceitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_invoiceitem_id_seq OWNER TO root;

--
-- Name: pinax_stripe_invoiceitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_invoiceitem_id_seq OWNED BY pinax_stripe_invoiceitem.id;


--
-- Name: pinax_stripe_plan; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_plan (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    amount numeric(9,2) NOT NULL,
    currency character varying(15) NOT NULL,
    "interval" character varying(15) NOT NULL,
    interval_count integer NOT NULL,
    name character varying(150) NOT NULL,
    statement_descriptor text NOT NULL,
    trial_period_days integer
);


ALTER TABLE pinax_stripe_plan OWNER TO root;

--
-- Name: pinax_stripe_plan_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_plan_id_seq OWNER TO root;

--
-- Name: pinax_stripe_plan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_plan_id_seq OWNED BY pinax_stripe_plan.id;


--
-- Name: pinax_stripe_subscription; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_subscription (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    application_fee_percent numeric(3,2),
    cancel_at_period_end boolean NOT NULL,
    canceled_at timestamp with time zone,
    current_period_end timestamp with time zone,
    current_period_start timestamp with time zone,
    ended_at timestamp with time zone,
    quantity integer NOT NULL,
    start timestamp with time zone NOT NULL,
    status character varying(25) NOT NULL,
    trial_end timestamp with time zone,
    trial_start timestamp with time zone,
    customer_id integer NOT NULL,
    plan_id integer NOT NULL
);


ALTER TABLE pinax_stripe_subscription OWNER TO root;

--
-- Name: pinax_stripe_subscription_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_subscription_id_seq OWNER TO root;

--
-- Name: pinax_stripe_subscription_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_subscription_id_seq OWNED BY pinax_stripe_subscription.id;


--
-- Name: pinax_stripe_transfer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_transfer (
    id integer NOT NULL,
    stripe_id character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    amount numeric(9,2) NOT NULL,
    currency character varying(25) NOT NULL,
    status character varying(25) NOT NULL,
    date timestamp with time zone NOT NULL,
    description text,
    event_id integer NOT NULL
);


ALTER TABLE pinax_stripe_transfer OWNER TO root;

--
-- Name: pinax_stripe_transfer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_transfer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_transfer_id_seq OWNER TO root;

--
-- Name: pinax_stripe_transfer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_transfer_id_seq OWNED BY pinax_stripe_transfer.id;


--
-- Name: pinax_stripe_transferchargefee; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE pinax_stripe_transferchargefee (
    id integer NOT NULL,
    amount numeric(9,2) NOT NULL,
    currency character varying(10) NOT NULL,
    application text,
    description text,
    kind character varying(150) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    transfer_id integer NOT NULL
);


ALTER TABLE pinax_stripe_transferchargefee OWNER TO root;

--
-- Name: pinax_stripe_transferchargefee_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE pinax_stripe_transferchargefee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pinax_stripe_transferchargefee_id_seq OWNER TO root;

--
-- Name: pinax_stripe_transferchargefee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE pinax_stripe_transferchargefee_id_seq OWNED BY pinax_stripe_transferchargefee.id;


--
-- Name: promotions_automaticproductlist; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_automaticproductlist (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    link_url character varying(200) NOT NULL,
    link_text character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    method character varying(128) NOT NULL,
    num_products smallint NOT NULL,
    CONSTRAINT promotions_automaticproductlist_num_products_check CHECK ((num_products >= 0))
);


ALTER TABLE promotions_automaticproductlist OWNER TO root;

--
-- Name: promotions_automaticproductlist_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_automaticproductlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_automaticproductlist_id_seq OWNER TO root;

--
-- Name: promotions_automaticproductlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_automaticproductlist_id_seq OWNED BY promotions_automaticproductlist.id;


--
-- Name: promotions_handpickedproductlist; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_handpickedproductlist (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    link_url character varying(200) NOT NULL,
    link_text character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE promotions_handpickedproductlist OWNER TO root;

--
-- Name: promotions_handpickedproductlist_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_handpickedproductlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_handpickedproductlist_id_seq OWNER TO root;

--
-- Name: promotions_handpickedproductlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_handpickedproductlist_id_seq OWNED BY promotions_handpickedproductlist.id;


--
-- Name: promotions_image; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_image (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    link_url character varying(200) NOT NULL,
    image character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE promotions_image OWNER TO root;

--
-- Name: promotions_image_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_image_id_seq OWNER TO root;

--
-- Name: promotions_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_image_id_seq OWNED BY promotions_image.id;


--
-- Name: promotions_keywordpromotion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_keywordpromotion (
    id integer NOT NULL,
    object_id integer NOT NULL,
    "position" character varying(100) NOT NULL,
    display_order integer NOT NULL,
    clicks integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    keyword character varying(200) NOT NULL,
    filter character varying(200) NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT promotions_keywordpromotion_clicks_check CHECK ((clicks >= 0)),
    CONSTRAINT promotions_keywordpromotion_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT promotions_keywordpromotion_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE promotions_keywordpromotion OWNER TO root;

--
-- Name: promotions_keywordpromotion_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_keywordpromotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_keywordpromotion_id_seq OWNER TO root;

--
-- Name: promotions_keywordpromotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_keywordpromotion_id_seq OWNED BY promotions_keywordpromotion.id;


--
-- Name: promotions_multiimage; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_multiimage (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE promotions_multiimage OWNER TO root;

--
-- Name: promotions_multiimage_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_multiimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_multiimage_id_seq OWNER TO root;

--
-- Name: promotions_multiimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_multiimage_id_seq OWNED BY promotions_multiimage.id;


--
-- Name: promotions_multiimage_images; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_multiimage_images (
    id integer NOT NULL,
    multiimage_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE promotions_multiimage_images OWNER TO root;

--
-- Name: promotions_multiimage_images_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_multiimage_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_multiimage_images_id_seq OWNER TO root;

--
-- Name: promotions_multiimage_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_multiimage_images_id_seq OWNED BY promotions_multiimage_images.id;


--
-- Name: promotions_orderedproduct; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_orderedproduct (
    id integer NOT NULL,
    display_order integer NOT NULL,
    list_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT promotions_orderedproduct_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE promotions_orderedproduct OWNER TO root;

--
-- Name: promotions_orderedproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_orderedproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_orderedproduct_id_seq OWNER TO root;

--
-- Name: promotions_orderedproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_orderedproduct_id_seq OWNED BY promotions_orderedproduct.id;


--
-- Name: promotions_orderedproductlist; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_orderedproductlist (
    handpickedproductlist_ptr_id integer NOT NULL,
    display_order integer NOT NULL,
    tabbed_block_id integer NOT NULL,
    CONSTRAINT promotions_orderedproductlist_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE promotions_orderedproductlist OWNER TO root;

--
-- Name: promotions_pagepromotion; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_pagepromotion (
    id integer NOT NULL,
    object_id integer NOT NULL,
    "position" character varying(100) NOT NULL,
    display_order integer NOT NULL,
    clicks integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    page_url character varying(128) NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT promotions_pagepromotion_clicks_check CHECK ((clicks >= 0)),
    CONSTRAINT promotions_pagepromotion_display_order_check CHECK ((display_order >= 0)),
    CONSTRAINT promotions_pagepromotion_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE promotions_pagepromotion OWNER TO root;

--
-- Name: promotions_pagepromotion_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_pagepromotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_pagepromotion_id_seq OWNER TO root;

--
-- Name: promotions_pagepromotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_pagepromotion_id_seq OWNED BY promotions_pagepromotion.id;


--
-- Name: promotions_rawhtml; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_rawhtml (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    display_type character varying(128) NOT NULL,
    body text NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE promotions_rawhtml OWNER TO root;

--
-- Name: promotions_rawhtml_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_rawhtml_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_rawhtml_id_seq OWNER TO root;

--
-- Name: promotions_rawhtml_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_rawhtml_id_seq OWNED BY promotions_rawhtml.id;


--
-- Name: promotions_singleproduct; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_singleproduct (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE promotions_singleproduct OWNER TO root;

--
-- Name: promotions_singleproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_singleproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_singleproduct_id_seq OWNER TO root;

--
-- Name: promotions_singleproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_singleproduct_id_seq OWNED BY promotions_singleproduct.id;


--
-- Name: promotions_tabbedblock; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE promotions_tabbedblock (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE promotions_tabbedblock OWNER TO root;

--
-- Name: promotions_tabbedblock_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE promotions_tabbedblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE promotions_tabbedblock_id_seq OWNER TO root;

--
-- Name: promotions_tabbedblock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE promotions_tabbedblock_id_seq OWNED BY promotions_tabbedblock.id;


--
-- Name: registration_api_registrationprofile; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE registration_api_registrationprofile (
    id integer NOT NULL,
    user_id integer NOT NULL,
    activation_key character varying(40) NOT NULL
);


ALTER TABLE registration_api_registrationprofile OWNER TO root;

--
-- Name: registration_api_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE registration_api_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_api_registrationprofile_id_seq OWNER TO root;

--
-- Name: registration_api_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE registration_api_registrationprofile_id_seq OWNED BY registration_api_registrationprofile.id;


--
-- Name: registration_registrationprofile; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE registration_registrationprofile (
    id integer NOT NULL,
    activation_key character varying(40) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE registration_registrationprofile OWNER TO root;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE registration_registrationprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE registration_registrationprofile_id_seq OWNER TO root;

--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE registration_registrationprofile_id_seq OWNED BY registration_registrationprofile.id;


--
-- Name: reviews_productreview; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE reviews_productreview (
    id integer NOT NULL,
    score smallint NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    homepage character varying(200) NOT NULL,
    status smallint NOT NULL,
    total_votes integer NOT NULL,
    delta_votes integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id integer,
    user_id integer
);


ALTER TABLE reviews_productreview OWNER TO root;

--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE reviews_productreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_productreview_id_seq OWNER TO root;

--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE reviews_productreview_id_seq OWNED BY reviews_productreview.id;


--
-- Name: reviews_vote; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE reviews_vote (
    id integer NOT NULL,
    delta smallint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    review_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE reviews_vote OWNER TO root;

--
-- Name: reviews_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE reviews_vote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_vote_id_seq OWNER TO root;

--
-- Name: reviews_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE reviews_vote_id_seq OWNED BY reviews_vote.id;


--
-- Name: sharedcontent_sharedcontent; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE sharedcontent_sharedcontent (
    id integer NOT NULL,
    slug character varying(50) NOT NULL,
    is_cross_site boolean NOT NULL,
    parent_site_id integer NOT NULL
);


ALTER TABLE sharedcontent_sharedcontent OWNER TO root;

--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE sharedcontent_sharedcontent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sharedcontent_sharedcontent_id_seq OWNER TO root;

--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE sharedcontent_sharedcontent_id_seq OWNED BY sharedcontent_sharedcontent.id;


--
-- Name: sharedcontent_sharedcontent_translation; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE sharedcontent_sharedcontent_translation (
    id integer NOT NULL,
    language_code character varying(15) NOT NULL,
    title character varying(200) NOT NULL,
    master_id integer
);


ALTER TABLE sharedcontent_sharedcontent_translation OWNER TO root;

--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE sharedcontent_sharedcontent_translation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sharedcontent_sharedcontent_translation_id_seq OWNER TO root;

--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE sharedcontent_sharedcontent_translation_id_seq OWNED BY sharedcontent_sharedcontent_translation.id;


--
-- Name: shipping_orderanditemcharges; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_orderanditemcharges (
    id integer NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    price_per_order numeric(12,2) NOT NULL,
    price_per_item numeric(12,2) NOT NULL,
    free_shipping_threshold numeric(12,2)
);


ALTER TABLE shipping_orderanditemcharges OWNER TO root;

--
-- Name: shipping_orderanditemcharges_countries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_orderanditemcharges_countries (
    id integer NOT NULL,
    orderanditemcharges_id integer NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE shipping_orderanditemcharges_countries OWNER TO root;

--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_orderanditemcharges_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_orderanditemcharges_countries_id_seq OWNER TO root;

--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_orderanditemcharges_countries_id_seq OWNED BY shipping_orderanditemcharges_countries.id;


--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_orderanditemcharges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_orderanditemcharges_id_seq OWNER TO root;

--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_orderanditemcharges_id_seq OWNED BY shipping_orderanditemcharges.id;


--
-- Name: shipping_shippingcompany; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_shippingcompany (
    id integer NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    default_weight numeric(12,3) NOT NULL,
    api_user character varying(64) NOT NULL,
    api_key character varying(255) NOT NULL,
    api_type character varying(10) NOT NULL,
    origin character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    status character varying(10) NOT NULL,
    payment_type character varying(10) NOT NULL
);


ALTER TABLE shipping_shippingcompany OWNER TO root;

--
-- Name: shipping_shippingcompany_containers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_shippingcompany_containers (
    id integer NOT NULL,
    shippingcompany_id integer NOT NULL,
    shippingcontainer_id integer NOT NULL
);


ALTER TABLE shipping_shippingcompany_containers OWNER TO root;

--
-- Name: shipping_shippingcompany_containers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_shippingcompany_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_shippingcompany_containers_id_seq OWNER TO root;

--
-- Name: shipping_shippingcompany_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_shippingcompany_containers_id_seq OWNED BY shipping_shippingcompany_containers.id;


--
-- Name: shipping_shippingcompany_countries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_shippingcompany_countries (
    id integer NOT NULL,
    shippingcompany_id integer NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE shipping_shippingcompany_countries OWNER TO root;

--
-- Name: shipping_shippingcompany_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_shippingcompany_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_shippingcompany_countries_id_seq OWNER TO root;

--
-- Name: shipping_shippingcompany_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_shippingcompany_countries_id_seq OWNED BY shipping_shippingcompany_countries.id;


--
-- Name: shipping_shippingcompany_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_shippingcompany_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_shippingcompany_id_seq OWNER TO root;

--
-- Name: shipping_shippingcompany_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_shippingcompany_id_seq OWNED BY shipping_shippingcompany.id;


--
-- Name: shipping_shippingcontainer; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_shippingcontainer (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    image character varying(255) NOT NULL,
    height numeric(12,3) NOT NULL,
    width numeric(12,3) NOT NULL,
    lenght numeric(12,3) NOT NULL,
    max_load numeric(12,3) NOT NULL
);


ALTER TABLE shipping_shippingcontainer OWNER TO root;

--
-- Name: shipping_shippingcontainer_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_shippingcontainer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_shippingcontainer_id_seq OWNER TO root;

--
-- Name: shipping_shippingcontainer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_shippingcontainer_id_seq OWNED BY shipping_shippingcontainer.id;


--
-- Name: shipping_weightband; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_weightband (
    id integer NOT NULL,
    upper_limit numeric(12,3) NOT NULL,
    charge numeric(12,2) NOT NULL,
    method_id integer NOT NULL
);


ALTER TABLE shipping_weightband OWNER TO root;

--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_weightband_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_weightband_id_seq OWNER TO root;

--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_weightband_id_seq OWNED BY shipping_weightband.id;


--
-- Name: shipping_weightbased; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_weightbased (
    id integer NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    default_weight numeric(12,3) NOT NULL
);


ALTER TABLE shipping_weightbased OWNER TO root;

--
-- Name: shipping_weightbased_countries; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE shipping_weightbased_countries (
    id integer NOT NULL,
    weightbased_id integer NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE shipping_weightbased_countries OWNER TO root;

--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_weightbased_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_weightbased_countries_id_seq OWNER TO root;

--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_weightbased_countries_id_seq OWNED BY shipping_weightbased_countries.id;


--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE shipping_weightbased_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shipping_weightbased_id_seq OWNER TO root;

--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE shipping_weightbased_id_seq OWNED BY shipping_weightbased.id;


--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE social_auth_association OWNER TO root;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE social_auth_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_association_id_seq OWNER TO root;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE social_auth_association_id_seq OWNED BY social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL
);


ALTER TABLE social_auth_code OWNER TO root;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE social_auth_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_code_id_seq OWNER TO root;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE social_auth_code_id_seq OWNED BY social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE social_auth_nonce OWNER TO root;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE social_auth_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_nonce_id_seq OWNER TO root;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE social_auth_nonce_id_seq OWNED BY social_auth_nonce.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE social_auth_usersocialauth OWNER TO root;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE social_auth_usersocialauth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE social_auth_usersocialauth_id_seq OWNER TO root;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE social_auth_usersocialauth_id_seq OWNED BY social_auth_usersocialauth.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE socialaccount_socialaccount OWNER TO root;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE socialaccount_socialaccount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialaccount_id_seq OWNER TO root;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE socialaccount_socialaccount_id_seq OWNED BY socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE socialaccount_socialapp OWNER TO root;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE socialaccount_socialapp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialapp_id_seq OWNER TO root;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE socialaccount_socialapp_id_seq OWNED BY socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE socialaccount_socialapp_sites OWNER TO root;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialapp_sites_id_seq OWNER TO root;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE socialaccount_socialapp_sites_id_seq OWNED BY socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE socialaccount_socialtoken OWNER TO root;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE socialaccount_socialtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE socialaccount_socialtoken_id_seq OWNER TO root;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE socialaccount_socialtoken_id_seq OWNED BY socialaccount_socialtoken.id;


--
-- Name: tastypie_apiaccess; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE tastypie_apiaccess (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    request_method character varying(10) NOT NULL,
    accessed integer NOT NULL,
    CONSTRAINT tastypie_apiaccess_accessed_check CHECK ((accessed >= 0))
);


ALTER TABLE tastypie_apiaccess OWNER TO root;

--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE tastypie_apiaccess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apiaccess_id_seq OWNER TO root;

--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE tastypie_apiaccess_id_seq OWNED BY tastypie_apiaccess.id;


--
-- Name: tastypie_apikey; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE tastypie_apikey (
    id integer NOT NULL,
    key character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE tastypie_apikey OWNER TO root;

--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE tastypie_apikey_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tastypie_apikey_id_seq OWNER TO root;

--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE tastypie_apikey_id_seq OWNED BY tastypie_apikey.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE thumbnail_kvstore OWNER TO root;

--
-- Name: twitter_query; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE twitter_query (
    id integer NOT NULL,
    type character varying(10) NOT NULL,
    value character varying(140) NOT NULL,
    interested boolean NOT NULL
);


ALTER TABLE twitter_query OWNER TO root;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE twitter_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_query_id_seq OWNER TO root;

--
-- Name: twitter_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE twitter_query_id_seq OWNED BY twitter_query.id;


--
-- Name: twitter_tweet; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE twitter_tweet (
    id integer NOT NULL,
    remote_id character varying(50) NOT NULL,
    created_at timestamp with time zone,
    text text,
    profile_image_url character varying(200),
    user_name character varying(100),
    full_name character varying(100),
    retweeter_profile_image_url character varying(200),
    retweeter_user_name character varying(100),
    retweeter_full_name character varying(100),
    query_id integer NOT NULL
);


ALTER TABLE twitter_tweet OWNER TO root;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE twitter_tweet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE twitter_tweet_id_seq OWNER TO root;

--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE twitter_tweet_id_seq OWNED BY twitter_tweet.id;


--
-- Name: voucher_voucher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE voucher_voucher (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    usage character varying(128) NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone NOT NULL,
    num_basket_additions integer NOT NULL,
    num_orders integer NOT NULL,
    total_discount numeric(12,2) NOT NULL,
    date_created date NOT NULL,
    limit_usage_by_group boolean NOT NULL,
    parent_id integer,
    CONSTRAINT voucher_voucher_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT voucher_voucher_num_orders_check CHECK ((num_orders >= 0))
);


ALTER TABLE voucher_voucher OWNER TO root;

--
-- Name: voucher_voucher_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE voucher_voucher_groups (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE voucher_voucher_groups OWNER TO root;

--
-- Name: voucher_voucher_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE voucher_voucher_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voucher_voucher_groups_id_seq OWNER TO root;

--
-- Name: voucher_voucher_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE voucher_voucher_groups_id_seq OWNED BY voucher_voucher_groups.id;


--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE voucher_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voucher_voucher_id_seq OWNER TO root;

--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE voucher_voucher_id_seq OWNED BY voucher_voucher.id;


--
-- Name: voucher_voucher_offers; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE voucher_voucher_offers (
    id integer NOT NULL,
    voucher_id integer NOT NULL,
    conditionaloffer_id integer NOT NULL
);


ALTER TABLE voucher_voucher_offers OWNER TO root;

--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE voucher_voucher_offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voucher_voucher_offers_id_seq OWNER TO root;

--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE voucher_voucher_offers_id_seq OWNED BY voucher_voucher_offers.id;


--
-- Name: voucher_voucherapplication; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE voucher_voucherapplication (
    id integer NOT NULL,
    date_created date NOT NULL,
    order_id integer NOT NULL,
    user_id integer,
    voucher_id integer NOT NULL
);


ALTER TABLE voucher_voucherapplication OWNER TO root;

--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE voucher_voucherapplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE voucher_voucherapplication_id_seq OWNER TO root;

--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE voucher_voucherapplication_id_seq OWNED BY voucher_voucherapplication.id;


--
-- Name: widgy_node; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE widgy_node (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    content_id integer NOT NULL,
    is_frozen boolean NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT widgy_node_content_id_check CHECK ((content_id >= 0)),
    CONSTRAINT widgy_node_depth_check CHECK ((depth >= 0)),
    CONSTRAINT widgy_node_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE widgy_node OWNER TO root;

--
-- Name: widgy_node_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE widgy_node_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgy_node_id_seq OWNER TO root;

--
-- Name: widgy_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE widgy_node_id_seq OWNED BY widgy_node.id;


--
-- Name: widgy_versioncommit; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE widgy_versioncommit (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    message text,
    publish_at timestamp with time zone NOT NULL,
    author_id integer,
    parent_id integer,
    root_node_id integer NOT NULL,
    tracker_id integer NOT NULL
);


ALTER TABLE widgy_versioncommit OWNER TO root;

--
-- Name: widgy_versioncommit_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE widgy_versioncommit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgy_versioncommit_id_seq OWNER TO root;

--
-- Name: widgy_versioncommit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE widgy_versioncommit_id_seq OWNED BY widgy_versioncommit.id;


--
-- Name: widgy_versiontracker; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE widgy_versiontracker (
    id integer NOT NULL,
    head_id integer,
    working_copy_id integer NOT NULL
);


ALTER TABLE widgy_versiontracker OWNER TO root;

--
-- Name: widgy_versiontracker_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE widgy_versiontracker_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE widgy_versiontracker_id_seq OWNER TO root;

--
-- Name: widgy_versiontracker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE widgy_versiontracker_id_seq OWNED BY widgy_versiontracker.id;


--
-- Name: wishlists_line; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE wishlists_line (
    id integer NOT NULL,
    quantity integer NOT NULL,
    title character varying(255) NOT NULL,
    product_id integer,
    wishlist_id integer NOT NULL,
    CONSTRAINT wishlists_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE wishlists_line OWNER TO root;

--
-- Name: wishlists_line_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE wishlists_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wishlists_line_id_seq OWNER TO root;

--
-- Name: wishlists_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE wishlists_line_id_seq OWNED BY wishlists_line.id;


--
-- Name: wishlists_wishlist; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE wishlists_wishlist (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    key character varying(6) NOT NULL,
    visibility character varying(20) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE wishlists_wishlist OWNER TO root;

--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE wishlists_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE wishlists_wishlist_id_seq OWNER TO root;

--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE wishlists_wishlist_id_seq OWNED BY wishlists_wishlist.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailaddress ALTER COLUMN id SET DEFAULT nextval('account_emailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('account_emailconfirmation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_useraddress ALTER COLUMN id SET DEFAULT nextval('address_useraddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_dashboard_preferences ALTER COLUMN id SET DEFAULT nextval('admin_tools_dashboard_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_menu_bookmark ALTER COLUMN id SET DEFAULT nextval('admin_tools_menu_bookmark_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_productrecord ALTER COLUMN id SET DEFAULT nextval('analytics_productrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userproductview ALTER COLUMN id SET DEFAULT nextval('analytics_userproductview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userrecord ALTER COLUMN id SET DEFAULT nextval('analytics_userrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_usersearch ALTER COLUMN id SET DEFAULT nextval('analytics_usersearch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket ALTER COLUMN id SET DEFAULT nextval('basket_basket_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket_vouchers ALTER COLUMN id SET DEFAULT nextval('basket_basket_vouchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line ALTER COLUMN id SET DEFAULT nextval('basket_line_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_lineattribute ALTER COLUMN id SET DEFAULT nextval('basket_lineattribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogcategory ALTER COLUMN id SET DEFAULT nextval('blog_blogcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_categories ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_related_posts ALTER COLUMN id SET DEFAULT nextval('blog_blogpost_related_posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoption ALTER COLUMN id SET DEFAULT nextval('catalogue_attributeoption_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoptiongroup ALTER COLUMN id SET DEFAULT nextval('catalogue_attributeoptiongroup_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_category ALTER COLUMN id SET DEFAULT nextval('catalogue_category_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_option ALTER COLUMN id SET DEFAULT nextval('catalogue_option_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product ALTER COLUMN id SET DEFAULT nextval('catalogue_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product_product_options ALTER COLUMN id SET DEFAULT nextval('catalogue_product_product_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattribute ALTER COLUMN id SET DEFAULT nextval('catalogue_productattribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue ALTER COLUMN id SET DEFAULT nextval('catalogue_productattributevalue_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productcategory ALTER COLUMN id SET DEFAULT nextval('catalogue_productcategory_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass ALTER COLUMN id SET DEFAULT nextval('catalogue_productclass_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass_options ALTER COLUMN id SET DEFAULT nextval('catalogue_productclass_options_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productimage ALTER COLUMN id SET DEFAULT nextval('catalogue_productimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productrecommendation ALTER COLUMN id SET DEFAULT nextval('catalogue_productrecommendation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY conf_setting ALTER COLUMN id SET DEFAULT nextval('conf_setting_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission_sites ALTER COLUMN id SET DEFAULT nextval('core_sitepermission_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_communicationeventtype ALTER COLUMN id SET DEFAULT nextval('customer_communicationeventtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_email ALTER COLUMN id SET DEFAULT nextval('customer_email_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_notification ALTER COLUMN id SET DEFAULT nextval('customer_notification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_productalert ALTER COLUMN id SET DEFAULT nextval('customer_productalert_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comment_flags ALTER COLUMN id SET DEFAULT nextval('django_comment_flags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comments ALTER COLUMN id SET DEFAULT nextval('django_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage ALTER COLUMN id SET DEFAULT nextval('django_flatpage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('django_flatpage_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_redirect ALTER COLUMN id SET DEFAULT nextval('django_redirect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_rq_jobs_job ALTER COLUMN id SET DEFAULT nextval('django_rq_jobs_job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_contentitem ALTER COLUMN id SET DEFAULT nextval('fluent_contents_contentitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_placeholder ALTER COLUMN id SET DEFAULT nextval('fluent_contents_placeholder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_field ALTER COLUMN id SET DEFAULT nextval('forms_field_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_fieldentry ALTER COLUMN id SET DEFAULT nextval('forms_fieldentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_formentry ALTER COLUMN id SET DEFAULT nextval('forms_formentry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY galleries_galleryimage ALTER COLUMN id SET DEFAULT nextval('galleries_galleryimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_assignedkeyword ALTER COLUMN id SET DEFAULT nextval('generic_assignedkeyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_keyword ALTER COLUMN id SET DEFAULT nextval('generic_keyword_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_rating ALTER COLUMN id SET DEFAULT nextval('generic_rating_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_accesstoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_accesstoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_application ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_application_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_grant ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_grant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken ALTER COLUMN id SET DEFAULT nextval('oauth2_provider_refreshtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_benefit ALTER COLUMN id SET DEFAULT nextval('offer_benefit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition_subconditions ALTER COLUMN id SET DEFAULT nextval('offer_compoundcondition_subconditions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_condition ALTER COLUMN id SET DEFAULT nextval('offer_condition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer ALTER COLUMN id SET DEFAULT nextval('offer_conditionaloffer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer_groups ALTER COLUMN id SET DEFAULT nextval('offer_conditionaloffer_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range ALTER COLUMN id SET DEFAULT nextval('offer_range_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_classes ALTER COLUMN id SET DEFAULT nextval('offer_range_classes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_excluded_products ALTER COLUMN id SET DEFAULT nextval('offer_range_excluded_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_included_categories ALTER COLUMN id SET DEFAULT nextval('offer_range_included_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproduct ALTER COLUMN id SET DEFAULT nextval('offer_rangeproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproductfileupload ALTER COLUMN id SET DEFAULT nextval('offer_rangeproductfileupload_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_billingaddress ALTER COLUMN id SET DEFAULT nextval('order_billingaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_communicationevent ALTER COLUMN id SET DEFAULT nextval('order_communicationevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line ALTER COLUMN id SET DEFAULT nextval('order_line_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineattribute ALTER COLUMN id SET DEFAULT nextval('order_lineattribute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineprice ALTER COLUMN id SET DEFAULT nextval('order_lineprice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order ALTER COLUMN id SET DEFAULT nextval('order_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_orderdiscount ALTER COLUMN id SET DEFAULT nextval('order_orderdiscount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_ordernote ALTER COLUMN id SET DEFAULT nextval('order_ordernote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymentevent ALTER COLUMN id SET DEFAULT nextval('order_paymentevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventquantity ALTER COLUMN id SET DEFAULT nextval('order_paymenteventquantity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventtype ALTER COLUMN id SET DEFAULT nextval('order_paymenteventtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingaddress ALTER COLUMN id SET DEFAULT nextval('order_shippingaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingevent ALTER COLUMN id SET DEFAULT nextval('order_shippingevent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventquantity ALTER COLUMN id SET DEFAULT nextval('order_shippingeventquantity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventtype ALTER COLUMN id SET DEFAULT nextval('order_shippingeventtype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_account_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account_secondary_users ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_account_secondary_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_accounttype ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_accounttype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_ipaddressrecord ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_ipaddressrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transaction ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_transaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer ALTER COLUMN id SET DEFAULT nextval('oscar_accounts_transfer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistitem ALTER COLUMN id SET DEFAULT nextval('oscar_wagtail_productlistitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistsnippet ALTER COLUMN id SET DEFAULT nextval('oscar_wagtail_productlistsnippet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscarapi_apikey ALTER COLUMN id SET DEFAULT nextval('oscarapi_apikey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_page ALTER COLUMN id SET DEFAULT nextval('pages_page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner ALTER COLUMN id SET DEFAULT nextval('partner_partner_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner_users ALTER COLUMN id SET DEFAULT nextval('partner_partner_users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partneraddress ALTER COLUMN id SET DEFAULT nextval('partner_partneraddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockalert ALTER COLUMN id SET DEFAULT nextval('partner_stockalert_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockrecord ALTER COLUMN id SET DEFAULT nextval('partner_stockrecord_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_bankcard ALTER COLUMN id SET DEFAULT nextval('payment_bankcard_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_source ALTER COLUMN id SET DEFAULT nextval('payment_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_sourcetype ALTER COLUMN id SET DEFAULT nextval('payment_sourcetype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_transaction ALTER COLUMN id SET DEFAULT nextval('payment_transaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY paypal_expresstransaction ALTER COLUMN id SET DEFAULT nextval('paypal_expresstransaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY paypal_payflowtransaction ALTER COLUMN id SET DEFAULT nextval('paypal_payflowtransaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_bitcoinreceiver ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_bitcoinreceiver_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_card ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_card_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_charge ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_charge_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_customer ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_customer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_event ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_eventprocessingexception ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_eventprocessingexception_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_invoice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoiceitem ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_invoiceitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_plan ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_plan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_subscription ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_subscription_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transfer ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_transfer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transferchargefee ALTER COLUMN id SET DEFAULT nextval('pinax_stripe_transferchargefee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_automaticproductlist ALTER COLUMN id SET DEFAULT nextval('promotions_automaticproductlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_handpickedproductlist ALTER COLUMN id SET DEFAULT nextval('promotions_handpickedproductlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_image ALTER COLUMN id SET DEFAULT nextval('promotions_image_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_keywordpromotion ALTER COLUMN id SET DEFAULT nextval('promotions_keywordpromotion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage ALTER COLUMN id SET DEFAULT nextval('promotions_multiimage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage_images ALTER COLUMN id SET DEFAULT nextval('promotions_multiimage_images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproduct ALTER COLUMN id SET DEFAULT nextval('promotions_orderedproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_pagepromotion ALTER COLUMN id SET DEFAULT nextval('promotions_pagepromotion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_rawhtml ALTER COLUMN id SET DEFAULT nextval('promotions_rawhtml_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_singleproduct ALTER COLUMN id SET DEFAULT nextval('promotions_singleproduct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_tabbedblock ALTER COLUMN id SET DEFAULT nextval('promotions_tabbedblock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_api_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_api_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_registrationprofile ALTER COLUMN id SET DEFAULT nextval('registration_registrationprofile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_productreview ALTER COLUMN id SET DEFAULT nextval('reviews_productreview_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_vote ALTER COLUMN id SET DEFAULT nextval('reviews_vote_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent ALTER COLUMN id SET DEFAULT nextval('sharedcontent_sharedcontent_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation ALTER COLUMN id SET DEFAULT nextval('sharedcontent_sharedcontent_translation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges ALTER COLUMN id SET DEFAULT nextval('shipping_orderanditemcharges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges_countries ALTER COLUMN id SET DEFAULT nextval('shipping_orderanditemcharges_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany ALTER COLUMN id SET DEFAULT nextval('shipping_shippingcompany_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_containers ALTER COLUMN id SET DEFAULT nextval('shipping_shippingcompany_containers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_countries ALTER COLUMN id SET DEFAULT nextval('shipping_shippingcompany_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcontainer ALTER COLUMN id SET DEFAULT nextval('shipping_shippingcontainer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightband ALTER COLUMN id SET DEFAULT nextval('shipping_weightband_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased ALTER COLUMN id SET DEFAULT nextval('shipping_weightbased_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased_countries ALTER COLUMN id SET DEFAULT nextval('shipping_weightbased_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_association ALTER COLUMN id SET DEFAULT nextval('social_auth_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_code ALTER COLUMN id SET DEFAULT nextval('social_auth_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('social_auth_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('social_auth_usersocialauth_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apiaccess ALTER COLUMN id SET DEFAULT nextval('tastypie_apiaccess_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apikey ALTER COLUMN id SET DEFAULT nextval('tastypie_apikey_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY twitter_query ALTER COLUMN id SET DEFAULT nextval('twitter_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY twitter_tweet ALTER COLUMN id SET DEFAULT nextval('twitter_tweet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher ALTER COLUMN id SET DEFAULT nextval('voucher_voucher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_groups ALTER COLUMN id SET DEFAULT nextval('voucher_voucher_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_offers ALTER COLUMN id SET DEFAULT nextval('voucher_voucher_offers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucherapplication ALTER COLUMN id SET DEFAULT nextval('voucher_voucherapplication_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_node ALTER COLUMN id SET DEFAULT nextval('widgy_node_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit ALTER COLUMN id SET DEFAULT nextval('widgy_versioncommit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker ALTER COLUMN id SET DEFAULT nextval('widgy_versiontracker_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_line ALTER COLUMN id SET DEFAULT nextval('wishlists_line_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_wishlist ALTER COLUMN id SET DEFAULT nextval('wishlists_wishlist_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('account_emailaddress_id_seq', 1, false);


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('account_emailconfirmation_id_seq', 1, false);


--
-- Data for Name: address_country; Type: TABLE DATA; Schema: public; Owner: root
--

COPY address_country (iso_3166_1_a2, iso_3166_1_a3, iso_3166_1_numeric, printable_name, name, display_order, is_shipping_country) FROM stdin;
AF	AFG	004	Afghanistan	Islamic Republic of Afghanistan	0	t
AX	ALA	248	Åland Islands		0	t
AL	ALB	008	Albania	Republic of Albania	0	t
DZ	DZA	012	Algeria	People's Democratic Republic of Algeria	0	t
AS	ASM	016	American Samoa		0	t
AD	AND	020	Andorra	Principality of Andorra	0	t
AO	AGO	024	Angola	Republic of Angola	0	t
AI	AIA	660	Anguilla		0	t
AQ	ATA	010	Antarctica		0	t
AG	ATG	028	Antigua and Barbuda		0	t
AR	ARG	032	Argentina	Argentine Republic	0	t
AM	ARM	051	Armenia	Republic of Armenia	0	t
AW	ABW	533	Aruba		0	t
AU	AUS	036	Australia		0	t
AT	AUT	040	Austria	Republic of Austria	0	t
AZ	AZE	031	Azerbaijan	Republic of Azerbaijan	0	t
BS	BHS	044	Bahamas	Commonwealth of the Bahamas	0	t
BH	BHR	048	Bahrain	Kingdom of Bahrain	0	t
BD	BGD	050	Bangladesh	People's Republic of Bangladesh	0	t
BB	BRB	052	Barbados		0	t
BY	BLR	112	Belarus	Republic of Belarus	0	t
BE	BEL	056	Belgium	Kingdom of Belgium	0	t
BZ	BLZ	084	Belize		0	t
BJ	BEN	204	Benin	Republic of Benin	0	t
BM	BMU	060	Bermuda		0	t
BT	BTN	064	Bhutan	Kingdom of Bhutan	0	t
BO	BOL	068	Bolivia, Plurinational State of	Plurinational State of Bolivia	0	t
BQ	BES	535	Bonaire, Sint Eustatius and Saba	Bonaire, Sint Eustatius and Saba	0	t
BA	BIH	070	Bosnia and Herzegovina	Republic of Bosnia and Herzegovina	0	t
BW	BWA	072	Botswana	Republic of Botswana	0	t
BV	BVT	074	Bouvet Island		0	t
BR	BRA	076	Brazil	Federative Republic of Brazil	0	t
IO	IOT	086	British Indian Ocean Territory		0	t
BN	BRN	096	Brunei Darussalam		0	t
BG	BGR	100	Bulgaria	Republic of Bulgaria	0	t
BF	BFA	854	Burkina Faso		0	t
BI	BDI	108	Burundi	Republic of Burundi	0	t
KH	KHM	116	Cambodia	Kingdom of Cambodia	0	t
CM	CMR	120	Cameroon	Republic of Cameroon	0	t
CA	CAN	124	Canada		0	t
CV	CPV	132	Cape Verde	Republic of Cape Verde	0	t
KY	CYM	136	Cayman Islands		0	t
CF	CAF	140	Central African Republic		0	t
TD	TCD	148	Chad	Republic of Chad	0	t
CL	CHL	152	Chile	Republic of Chile	0	t
CN	CHN	156	China	People's Republic of China	0	t
CX	CXR	162	Christmas Island		0	t
CC	CCK	166	Cocos (Keeling) Islands		0	t
CO	COL	170	Colombia	Republic of Colombia	0	t
KM	COM	174	Comoros	Union of the Comoros	0	t
CG	COG	178	Congo	Republic of the Congo	0	t
CD	COD	180	Congo, The Democratic Republic of the		0	t
CK	COK	184	Cook Islands		0	t
CR	CRI	188	Costa Rica	Republic of Costa Rica	0	t
CI	CIV	384	Côte d'Ivoire	Republic of Côte d'Ivoire	0	t
HR	HRV	191	Croatia	Republic of Croatia	0	t
CU	CUB	192	Cuba	Republic of Cuba	0	t
CW	CUW	531	Curaçao	Curaçao	0	t
CY	CYP	196	Cyprus	Republic of Cyprus	0	t
CZ	CZE	203	Czech Republic		0	t
DK	DNK	208	Denmark	Kingdom of Denmark	0	t
DJ	DJI	262	Djibouti	Republic of Djibouti	0	t
DM	DMA	212	Dominica	Commonwealth of Dominica	0	t
DO	DOM	214	Dominican Republic		0	t
EC	ECU	218	Ecuador	Republic of Ecuador	0	t
EG	EGY	818	Egypt	Arab Republic of Egypt	0	t
SV	SLV	222	El Salvador	Republic of El Salvador	0	t
GQ	GNQ	226	Equatorial Guinea	Republic of Equatorial Guinea	0	t
ER	ERI	232	Eritrea	the State of Eritrea	0	t
EE	EST	233	Estonia	Republic of Estonia	0	t
ET	ETH	231	Ethiopia	Federal Democratic Republic of Ethiopia	0	t
FK	FLK	238	Falkland Islands (Malvinas)		0	t
FO	FRO	234	Faroe Islands		0	t
FJ	FJI	242	Fiji	Republic of Fiji	0	t
FI	FIN	246	Finland	Republic of Finland	0	t
FR	FRA	250	France	French Republic	0	t
GF	GUF	254	French Guiana		0	t
PF	PYF	258	French Polynesia		0	t
TF	ATF	260	French Southern Territories		0	t
GA	GAB	266	Gabon	Gabonese Republic	0	t
GM	GMB	270	Gambia	Republic of the Gambia	0	t
GE	GEO	268	Georgia		0	t
DE	DEU	276	Germany	Federal Republic of Germany	0	t
GH	GHA	288	Ghana	Republic of Ghana	0	t
GI	GIB	292	Gibraltar		0	t
GR	GRC	300	Greece	Hellenic Republic	0	t
GL	GRL	304	Greenland		0	t
GD	GRD	308	Grenada		0	t
GP	GLP	312	Guadeloupe		0	t
GU	GUM	316	Guam		0	t
GT	GTM	320	Guatemala	Republic of Guatemala	0	t
GG	GGY	831	Guernsey		0	t
GN	GIN	324	Guinea	Republic of Guinea	0	t
GW	GNB	624	Guinea-Bissau	Republic of Guinea-Bissau	0	t
GY	GUY	328	Guyana	Republic of Guyana	0	t
HT	HTI	332	Haiti	Republic of Haiti	0	t
HM	HMD	334	Heard Island and McDonald Islands		0	t
VA	VAT	336	Holy See (Vatican City State)		0	t
HN	HND	340	Honduras	Republic of Honduras	0	t
HK	HKG	344	Hong Kong	Hong Kong Special Administrative Region of China	0	t
HU	HUN	348	Hungary	Hungary	0	t
IS	ISL	352	Iceland	Republic of Iceland	0	t
IN	IND	356	India	Republic of India	0	t
ID	IDN	360	Indonesia	Republic of Indonesia	0	t
IR	IRN	364	Iran, Islamic Republic of	Islamic Republic of Iran	0	t
IQ	IRQ	368	Iraq	Republic of Iraq	0	t
IE	IRL	372	Ireland		0	t
IM	IMN	833	Isle of Man		0	t
IL	ISR	376	Israel	State of Israel	0	t
IT	ITA	380	Italy	Italian Republic	0	t
JM	JAM	388	Jamaica		0	t
JP	JPN	392	Japan		0	t
JE	JEY	832	Jersey		0	t
JO	JOR	400	Jordan	Hashemite Kingdom of Jordan	0	t
KZ	KAZ	398	Kazakhstan	Republic of Kazakhstan	0	t
KE	KEN	404	Kenya	Republic of Kenya	0	t
KI	KIR	296	Kiribati	Republic of Kiribati	0	t
KP	PRK	408	Korea, Democratic People's Republic of	Democratic People's Republic of Korea	0	t
KR	KOR	410	Korea, Republic of		0	t
KW	KWT	414	Kuwait	State of Kuwait	0	t
KG	KGZ	417	Kyrgyzstan	Kyrgyz Republic	0	t
LA	LAO	418	Lao People's Democratic Republic		0	t
LV	LVA	428	Latvia	Republic of Latvia	0	t
LB	LBN	422	Lebanon	Lebanese Republic	0	t
LS	LSO	426	Lesotho	Kingdom of Lesotho	0	t
LR	LBR	430	Liberia	Republic of Liberia	0	t
LY	LBY	434	Libya	Libya	0	t
LI	LIE	438	Liechtenstein	Principality of Liechtenstein	0	t
LT	LTU	440	Lithuania	Republic of Lithuania	0	t
LU	LUX	442	Luxembourg	Grand Duchy of Luxembourg	0	t
MO	MAC	446	Macao	Macao Special Administrative Region of China	0	t
MK	MKD	807	Macedonia, Republic of	The Former Yugoslav Republic of Macedonia	0	t
MG	MDG	450	Madagascar	Republic of Madagascar	0	t
MW	MWI	454	Malawi	Republic of Malawi	0	t
MY	MYS	458	Malaysia		0	t
MV	MDV	462	Maldives	Republic of Maldives	0	t
ML	MLI	466	Mali	Republic of Mali	0	t
MT	MLT	470	Malta	Republic of Malta	0	t
MH	MHL	584	Marshall Islands	Republic of the Marshall Islands	0	t
MQ	MTQ	474	Martinique		0	t
MR	MRT	478	Mauritania	Islamic Republic of Mauritania	0	t
MU	MUS	480	Mauritius	Republic of Mauritius	0	t
YT	MYT	175	Mayotte		0	t
MX	MEX	484	Mexico	United Mexican States	0	t
FM	FSM	583	Micronesia, Federated States of	Federated States of Micronesia	0	t
MD	MDA	498	Moldova, Republic of	Republic of Moldova	0	t
MC	MCO	492	Monaco	Principality of Monaco	0	t
MN	MNG	496	Mongolia		0	t
ME	MNE	499	Montenegro	Montenegro	0	t
MS	MSR	500	Montserrat		0	t
MA	MAR	504	Morocco	Kingdom of Morocco	0	t
MZ	MOZ	508	Mozambique	Republic of Mozambique	0	t
MM	MMR	104	Myanmar	Republic of Myanmar	0	t
NA	NAM	516	Namibia	Republic of Namibia	0	t
NR	NRU	520	Nauru	Republic of Nauru	0	t
NP	NPL	524	Nepal	Federal Democratic Republic of Nepal	0	t
NL	NLD	528	Netherlands	Kingdom of the Netherlands	0	t
NC	NCL	540	New Caledonia		0	t
NZ	NZL	554	New Zealand		0	t
NI	NIC	558	Nicaragua	Republic of Nicaragua	0	t
NE	NER	562	Niger	Republic of the Niger	0	t
NG	NGA	566	Nigeria	Federal Republic of Nigeria	0	t
NU	NIU	570	Niue	Niue	0	t
NF	NFK	574	Norfolk Island		0	t
MP	MNP	580	Northern Mariana Islands	Commonwealth of the Northern Mariana Islands	0	t
NO	NOR	578	Norway	Kingdom of Norway	0	t
OM	OMN	512	Oman	Sultanate of Oman	0	t
PK	PAK	586	Pakistan	Islamic Republic of Pakistan	0	t
PW	PLW	585	Palau	Republic of Palau	0	t
PS	PSE	275	Palestine, State of	the State of Palestine	0	t
PA	PAN	591	Panama	Republic of Panama	0	t
PG	PNG	598	Papua New Guinea	Independent State of Papua New Guinea	0	t
PY	PRY	600	Paraguay	Republic of Paraguay	0	t
PE	PER	604	Peru	Republic of Peru	0	t
PH	PHL	608	Philippines	Republic of the Philippines	0	t
PN	PCN	612	Pitcairn		0	t
PL	POL	616	Poland	Republic of Poland	0	t
PT	PRT	620	Portugal	Portuguese Republic	0	t
PR	PRI	630	Puerto Rico		0	t
QA	QAT	634	Qatar	State of Qatar	0	t
RE	REU	638	Réunion		0	t
RO	ROU	642	Romania		0	t
RU	RUS	643	Russian Federation		0	t
RW	RWA	646	Rwanda	Rwandese Republic	0	t
BL	BLM	652	Saint Barthélemy		0	t
SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha		0	t
KN	KNA	659	Saint Kitts and Nevis		0	t
LC	LCA	662	Saint Lucia		0	t
MF	MAF	663	Saint Martin (French part)		0	t
PM	SPM	666	Saint Pierre and Miquelon		0	t
VC	VCT	670	Saint Vincent and the Grenadines		0	t
WS	WSM	882	Samoa	Independent State of Samoa	0	t
SM	SMR	674	San Marino	Republic of San Marino	0	t
ST	STP	678	Sao Tome and Principe	Democratic Republic of Sao Tome and Principe	0	t
SA	SAU	682	Saudi Arabia	Kingdom of Saudi Arabia	0	t
SN	SEN	686	Senegal	Republic of Senegal	0	t
RS	SRB	688	Serbia	Republic of Serbia	0	t
SC	SYC	690	Seychelles	Republic of Seychelles	0	t
SL	SLE	694	Sierra Leone	Republic of Sierra Leone	0	t
SG	SGP	702	Singapore	Republic of Singapore	0	t
SX	SXM	534	Sint Maarten (Dutch part)	Sint Maarten (Dutch part)	0	t
SK	SVK	703	Slovakia	Slovak Republic	0	t
SI	SVN	705	Slovenia	Republic of Slovenia	0	t
SB	SLB	090	Solomon Islands		0	t
SO	SOM	706	Somalia	Federal Republic of Somalia	0	t
ZA	ZAF	710	South Africa	Republic of South Africa	0	t
GS	SGS	239	South Georgia and the South Sandwich Islands		0	t
ES	ESP	724	Spain	Kingdom of Spain	0	t
LK	LKA	144	Sri Lanka	Democratic Socialist Republic of Sri Lanka	0	t
SD	SDN	729	Sudan	Republic of the Sudan	0	t
SR	SUR	740	Suriname	Republic of Suriname	0	t
SS	SSD	728	South Sudan	Republic of South Sudan	0	t
SJ	SJM	744	Svalbard and Jan Mayen		0	t
SZ	SWZ	748	Swaziland	Kingdom of Swaziland	0	t
SE	SWE	752	Sweden	Kingdom of Sweden	0	t
CH	CHE	756	Switzerland	Swiss Confederation	0	t
SY	SYR	760	Syrian Arab Republic		0	t
TW	TWN	158	Taiwan, Province of China	Taiwan, Province of China	0	t
TJ	TJK	762	Tajikistan	Republic of Tajikistan	0	t
TZ	TZA	834	Tanzania, United Republic of	United Republic of Tanzania	0	t
TH	THA	764	Thailand	Kingdom of Thailand	0	t
TL	TLS	626	Timor-Leste	Democratic Republic of Timor-Leste	0	t
TG	TGO	768	Togo	Togolese Republic	0	t
TK	TKL	772	Tokelau		0	t
TO	TON	776	Tonga	Kingdom of Tonga	0	t
TT	TTO	780	Trinidad and Tobago	Republic of Trinidad and Tobago	0	t
TN	TUN	788	Tunisia	Republic of Tunisia	0	t
TR	TUR	792	Turkey	Republic of Turkey	0	t
TM	TKM	795	Turkmenistan		0	t
TC	TCA	796	Turks and Caicos Islands		0	t
TV	TUV	798	Tuvalu		0	t
UG	UGA	800	Uganda	Republic of Uganda	0	t
UA	UKR	804	Ukraine		0	t
AE	ARE	784	United Arab Emirates		0	t
GB	GBR	826	United Kingdom	United Kingdom of Great Britain and Northern Ireland	0	t
US	USA	840	United States	United States of America	0	t
UM	UMI	581	United States Minor Outlying Islands		0	t
UY	URY	858	Uruguay	Eastern Republic of Uruguay	0	t
UZ	UZB	860	Uzbekistan	Republic of Uzbekistan	0	t
VU	VUT	548	Vanuatu	Republic of Vanuatu	0	t
VE	VEN	862	Venezuela, Bolivarian Republic of	Bolivarian Republic of Venezuela	0	t
VN	VNM	704	Viet Nam	Socialist Republic of Viet Nam	0	t
VG	VGB	092	Virgin Islands, British	British Virgin Islands	0	t
VI	VIR	850	Virgin Islands, U.S.	Virgin Islands of the United States	0	t
WF	WLF	876	Wallis and Futuna		0	t
EH	ESH	732	Western Sahara		0	t
YE	YEM	887	Yemen	Republic of Yemen	0	t
ZM	ZMB	894	Zambia	Republic of Zambia	0	t
ZW	ZWE	716	Zimbabwe	Republic of Zimbabwe	0	t
\.


--
-- Data for Name: address_useraddress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY address_useraddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, phone_number, notes, is_default_for_shipping, is_default_for_billing, num_orders, hash, date_created, country_id, user_id) FROM stdin;
1	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D		Brooklyn	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York 11235 United States of America	+17184046471		f	f	17	1297435131	2016-08-09 23:47:04.34496-04	US	1
\.


--
-- Name: address_useraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('address_useraddress_id_seq', 1, true);


--
-- Data for Name: admin_tools_dashboard_preferences; Type: TABLE DATA; Schema: public; Owner: root
--

COPY admin_tools_dashboard_preferences (id, data, dashboard_id, user_id) FROM stdin;
\.


--
-- Name: admin_tools_dashboard_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('admin_tools_dashboard_preferences_id_seq', 1, false);


--
-- Data for Name: admin_tools_menu_bookmark; Type: TABLE DATA; Schema: public; Owner: root
--

COPY admin_tools_menu_bookmark (id, url, title, user_id) FROM stdin;
\.


--
-- Name: admin_tools_menu_bookmark_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('admin_tools_menu_bookmark_id_seq', 1, false);


--
-- Data for Name: analytics_productrecord; Type: TABLE DATA; Schema: public; Owner: root
--

COPY analytics_productrecord (id, num_views, num_basket_additions, num_purchases, score, product_id) FROM stdin;
1	24	52	34	0	3
3	13	19	9	0	6
\.


--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('analytics_productrecord_id_seq', 3, true);


--
-- Data for Name: analytics_userproductview; Type: TABLE DATA; Schema: public; Owner: root
--

COPY analytics_userproductview (id, date_created, product_id, user_id) FROM stdin;
1	2016-08-09 11:52:00.781479-04	3	1
2	2016-08-09 11:52:39.305746-04	3	1
3	2016-08-09 21:04:23.18837-04	3	1
4	2016-08-11 00:07:20.699801-04	3	1
5	2016-08-11 00:23:18.629472-04	3	1
6	2016-08-11 00:24:24.497723-04	3	1
7	2016-08-11 08:22:01.293205-04	3	1
8	2016-08-11 08:27:52.368572-04	3	1
9	2016-08-11 10:22:22.190913-04	3	1
15	2016-08-11 12:28:59.462184-04	3	1
16	2016-08-11 12:29:07.564809-04	3	1
17	2016-08-11 12:31:35.857003-04	3	1
18	2016-08-11 12:31:41.001432-04	3	1
19	2016-08-11 12:45:33.918541-04	3	1
25	2016-08-11 14:28:49.614655-04	6	1
26	2016-08-11 14:29:09.150637-04	6	1
27	2016-08-11 14:56:48.767016-04	3	1
28	2016-08-11 14:57:13.109988-04	6	1
29	2016-08-11 14:57:33.67966-04	6	1
30	2016-08-11 17:43:08.184052-04	6	1
31	2016-08-11 17:49:26.564301-04	3	1
32	2016-08-11 17:50:00.102724-04	3	1
33	2016-08-11 18:30:38.062387-04	3	1
34	2016-08-11 18:31:34.025664-04	3	1
35	2016-08-12 07:22:47.301999-04	3	1
36	2016-08-12 10:31:38.532671-04	3	1
37	2016-08-12 10:33:58.032587-04	6	1
38	2016-08-12 10:36:26.802263-04	6	1
39	2016-08-12 11:19:51.59343-04	6	1
40	2016-08-12 11:19:58.997378-04	6	1
41	2016-08-14 17:21:45.953203-04	6	1
42	2016-08-14 17:22:19.476217-04	6	1
43	2016-08-14 17:22:23.292737-04	6	1
44	2016-08-14 22:28:54.011331-04	3	1
45	2016-08-14 22:58:45.072343-04	6	1
\.


--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('analytics_userproductview_id_seq', 45, true);


--
-- Data for Name: analytics_userrecord; Type: TABLE DATA; Schema: public; Owner: root
--

COPY analytics_userrecord (id, num_product_views, num_basket_additions, num_orders, num_order_lines, num_order_items, total_spent, date_last_order, user_id) FROM stdin;
1	45	61	17	23	44	961.80	2016-08-12 17:00:37.562504-04	1
\.


--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('analytics_userrecord_id_seq', 1, true);


--
-- Data for Name: analytics_usersearch; Type: TABLE DATA; Schema: public; Owner: root
--

COPY analytics_usersearch (id, query, date_created, user_id) FROM stdin;
1	shirt	2016-08-09 21:20:47.805306-04	1
2	sweat	2016-08-09 21:20:55.204778-04	1
3	Sweathirts	2016-08-09 21:21:15.635069-04	1
4	Sweathirts	2016-08-09 21:21:23.439627-04	1
5		2016-08-09 21:21:27.953026-04	1
6		2016-08-09 21:21:29.586444-04	1
7	shirt	2016-08-09 21:48:35.807072-04	1
8	sweat	2016-08-09 21:48:49.960685-04	1
9	shirt	2016-08-10 09:56:25.445403-04	1
10	shirt	2016-08-11 12:28:45.843523-04	1
11	shirt	2016-08-11 14:59:59.161865-04	1
12	shirt	2016-08-12 07:22:35.986961-04	1
13		2016-08-13 21:07:41.979169-04	1
14	shirt	2016-08-13 21:07:54.593193-04	1
15	shirt	2016-08-13 21:07:58.917402-04	1
16	test	2016-08-14 18:55:52.140364-04	1
17	shirt	2016-08-14 18:55:56.776758-04	1
\.


--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('analytics_usersearch_id_seq', 17, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add site	7	add_site
20	Can change site	7	change_site
21	Can delete site	7	delete_site
22	Can add redirect	8	add_redirect
23	Can change redirect	8	change_redirect
24	Can delete redirect	8	delete_redirect
25	Can add bookmark	9	add_bookmark
26	Can change bookmark	9	change_bookmark
27	Can delete bookmark	9	delete_bookmark
28	Can add dashboard preferences	10	add_dashboardpreferences
29	Can change dashboard preferences	10	change_dashboardpreferences
30	Can delete dashboard preferences	10	delete_dashboardpreferences
31	Can add job	11	add_job
32	Can change job	11	change_job
33	Can delete job	11	delete_job
34	Can add user social auth	12	add_usersocialauth
35	Can change user social auth	12	change_usersocialauth
36	Can delete user social auth	12	delete_usersocialauth
37	Can add nonce	13	add_nonce
38	Can change nonce	13	change_nonce
39	Can delete nonce	13	delete_nonce
40	Can add association	14	add_association
41	Can change association	14	change_association
42	Can delete association	14	delete_association
43	Can add code	15	add_code
44	Can change code	15	change_code
45	Can delete code	15	delete_code
46	Can add registration profile	16	add_registrationprofile
47	Can change registration profile	16	change_registrationprofile
48	Can delete registration profile	16	delete_registrationprofile
49	Can add registration profile	17	add_registrationprofile
50	Can change registration profile	17	change_registrationprofile
51	Can delete registration profile	17	delete_registrationprofile
52	Can add Token	18	add_token
53	Can change Token	18	change_token
54	Can delete Token	18	delete_token
55	Can add api access	19	add_apiaccess
56	Can change api access	19	change_apiaccess
57	Can delete api access	19	delete_apiaccess
58	Can add api key	20	add_apikey
59	Can change api key	20	change_apikey
60	Can delete api key	20	delete_apikey
61	Can add email address	21	add_emailaddress
62	Can change email address	21	change_emailaddress
63	Can delete email address	21	delete_emailaddress
64	Can add email confirmation	22	add_emailconfirmation
65	Can change email confirmation	22	change_emailconfirmation
66	Can delete email confirmation	22	delete_emailconfirmation
67	Can add social application	23	add_socialapp
68	Can change social application	23	change_socialapp
69	Can delete social application	23	delete_socialapp
70	Can add social account	24	add_socialaccount
71	Can change social account	24	change_socialaccount
72	Can delete social account	24	delete_socialaccount
73	Can add social application token	25	add_socialtoken
74	Can change social application token	25	change_socialtoken
75	Can delete social application token	25	delete_socialtoken
76	Can add Product record	26	add_productrecord
77	Can change Product record	26	change_productrecord
78	Can delete Product record	26	delete_productrecord
79	Can add User record	27	add_userrecord
80	Can change User record	27	change_userrecord
81	Can delete User record	27	delete_userrecord
82	Can add User product view	28	add_userproductview
83	Can change User product view	28	change_userproductview
84	Can delete User product view	28	delete_userproductview
85	Can add User search query	29	add_usersearch
86	Can change User search query	29	change_usersearch
87	Can delete User search query	29	delete_usersearch
88	Can add User address	30	add_useraddress
89	Can change User address	30	change_useraddress
90	Can delete User address	30	delete_useraddress
91	Can add Country	31	add_country
92	Can change Country	31	change_country
93	Can delete Country	31	delete_country
94	Can add Order and Item Charge	32	add_orderanditemcharges
95	Can change Order and Item Charge	32	change_orderanditemcharges
96	Can delete Order and Item Charge	32	delete_orderanditemcharges
97	Can add Weight-based Shipping Method	33	add_weightbased
98	Can change Weight-based Shipping Method	33	change_weightbased
379	Can delete card	126	delete_card
99	Can delete Weight-based Shipping Method	33	delete_weightbased
100	Can add Weight Band	34	add_weightband
101	Can change Weight Band	34	change_weightband
102	Can delete Weight Band	34	delete_weightband
103	Can add Product class	35	add_productclass
104	Can change Product class	35	change_productclass
105	Can delete Product class	35	delete_productclass
106	Can add Category	36	add_category
107	Can change Category	36	change_category
108	Can delete Category	36	delete_category
109	Can add Product category	37	add_productcategory
110	Can change Product category	37	change_productcategory
111	Can delete Product category	37	delete_productcategory
112	Can add Product	38	add_product
113	Can change Product	38	change_product
114	Can delete Product	38	delete_product
115	Can add Product recommendation	39	add_productrecommendation
116	Can change Product recommendation	39	change_productrecommendation
117	Can delete Product recommendation	39	delete_productrecommendation
118	Can add Product attribute	40	add_productattribute
119	Can change Product attribute	40	change_productattribute
120	Can delete Product attribute	40	delete_productattribute
121	Can add Product attribute value	41	add_productattributevalue
122	Can change Product attribute value	41	change_productattributevalue
123	Can delete Product attribute value	41	delete_productattributevalue
124	Can add Attribute option group	42	add_attributeoptiongroup
125	Can change Attribute option group	42	change_attributeoptiongroup
126	Can delete Attribute option group	42	delete_attributeoptiongroup
127	Can add Attribute option	43	add_attributeoption
128	Can change Attribute option	43	change_attributeoption
129	Can delete Attribute option	43	delete_attributeoption
130	Can add Option	44	add_option
131	Can change Option	44	change_option
132	Can delete Option	44	delete_option
133	Can add Product image	45	add_productimage
134	Can change Product image	45	change_productimage
135	Can delete Product image	45	delete_productimage
136	Can add Product review	46	add_productreview
137	Can change Product review	46	change_productreview
138	Can delete Product review	46	delete_productreview
139	Can add Vote	47	add_vote
140	Can change Vote	47	change_vote
141	Can delete Vote	47	delete_vote
142	Can add Fulfillment partner	48	add_partner
143	Can change Fulfillment partner	48	change_partner
144	Can delete Fulfillment partner	48	delete_partner
145	Can access dashboard	48	dashboard_access
146	Can add Partner address	49	add_partneraddress
147	Can change Partner address	49	change_partneraddress
148	Can delete Partner address	49	delete_partneraddress
149	Can add Stock record	50	add_stockrecord
150	Can change Stock record	50	change_stockrecord
151	Can delete Stock record	50	delete_stockrecord
152	Can add Stock alert	51	add_stockalert
153	Can change Stock alert	51	change_stockalert
154	Can delete Stock alert	51	delete_stockalert
155	Can add Basket	52	add_basket
156	Can change Basket	52	change_basket
157	Can delete Basket	52	delete_basket
158	Can add Basket line	53	add_line
159	Can change Basket line	53	change_line
160	Can delete Basket line	53	delete_line
161	Can add Line attribute	54	add_lineattribute
162	Can change Line attribute	54	change_lineattribute
163	Can delete Line attribute	54	delete_lineattribute
164	Can add Transaction	55	add_transaction
165	Can change Transaction	55	change_transaction
166	Can delete Transaction	55	delete_transaction
167	Can add Source	56	add_source
168	Can change Source	56	change_source
169	Can delete Source	56	delete_source
170	Can add Source Type	57	add_sourcetype
171	Can change Source Type	57	change_sourcetype
172	Can delete Source Type	57	delete_sourcetype
173	Can add Bankcard	58	add_bankcard
174	Can change Bankcard	58	change_bankcard
175	Can delete Bankcard	58	delete_bankcard
176	Can add Conditional offer	59	add_conditionaloffer
177	Can change Conditional offer	59	change_conditionaloffer
178	Can delete Conditional offer	59	delete_conditionaloffer
179	Can add Benefit	60	add_benefit
180	Can change Benefit	60	change_benefit
181	Can delete Benefit	60	delete_benefit
182	Can add Condition	61	add_condition
183	Can change Condition	61	change_condition
184	Can delete Condition	61	delete_condition
185	Can add Range	62	add_range
186	Can change Range	62	change_range
187	Can delete Range	62	delete_range
188	Can add range product	63	add_rangeproduct
189	Can change range product	63	change_rangeproduct
190	Can delete range product	63	delete_rangeproduct
191	Can add Range Product Uploaded File	64	add_rangeproductfileupload
192	Can change Range Product Uploaded File	64	change_rangeproductfileupload
193	Can delete Range Product Uploaded File	64	delete_rangeproductfileupload
194	Can add Count condition	61	add_countcondition
195	Can change Count condition	61	change_countcondition
196	Can delete Count condition	61	delete_countcondition
197	Can add Coverage Condition	61	add_coveragecondition
198	Can change Coverage Condition	61	change_coveragecondition
199	Can delete Coverage Condition	61	delete_coveragecondition
200	Can add Value condition	61	add_valuecondition
201	Can change Value condition	61	change_valuecondition
202	Can delete Value condition	61	delete_valuecondition
203	Can add Percentage discount benefit	60	add_percentagediscountbenefit
204	Can change Percentage discount benefit	60	change_percentagediscountbenefit
205	Can delete Percentage discount benefit	60	delete_percentagediscountbenefit
206	Can add Absolute discount benefit	60	add_absolutediscountbenefit
207	Can change Absolute discount benefit	60	change_absolutediscountbenefit
208	Can delete Absolute discount benefit	60	delete_absolutediscountbenefit
209	Can add Fixed price benefit	60	add_fixedpricebenefit
210	Can change Fixed price benefit	60	change_fixedpricebenefit
211	Can delete Fixed price benefit	60	delete_fixedpricebenefit
212	Can add Multibuy discount benefit	60	add_multibuydiscountbenefit
213	Can change Multibuy discount benefit	60	change_multibuydiscountbenefit
214	Can delete Multibuy discount benefit	60	delete_multibuydiscountbenefit
215	Can add shipping benefit	60	add_shippingbenefit
216	Can change shipping benefit	60	change_shippingbenefit
217	Can delete shipping benefit	60	delete_shippingbenefit
218	Can add Shipping absolute discount benefit	60	add_shippingabsolutediscountbenefit
219	Can change Shipping absolute discount benefit	60	change_shippingabsolutediscountbenefit
220	Can delete Shipping absolute discount benefit	60	delete_shippingabsolutediscountbenefit
221	Can add Fixed price shipping benefit	60	add_shippingfixedpricebenefit
222	Can change Fixed price shipping benefit	60	change_shippingfixedpricebenefit
223	Can delete Fixed price shipping benefit	60	delete_shippingfixedpricebenefit
224	Can add Shipping percentage discount benefit	60	add_shippingpercentagediscountbenefit
225	Can change Shipping percentage discount benefit	60	change_shippingpercentagediscountbenefit
226	Can delete Shipping percentage discount benefit	60	delete_shippingpercentagediscountbenefit
227	Can add Payment Event Quantity	76	add_paymenteventquantity
228	Can change Payment Event Quantity	76	change_paymenteventquantity
229	Can delete Payment Event Quantity	76	delete_paymenteventquantity
230	Can add Shipping Event Quantity	77	add_shippingeventquantity
231	Can change Shipping Event Quantity	77	change_shippingeventquantity
232	Can delete Shipping Event Quantity	77	delete_shippingeventquantity
233	Can add Order	78	add_order
234	Can change Order	78	change_order
235	Can delete Order	78	delete_order
236	Can add Order Note	79	add_ordernote
237	Can change Order Note	79	change_ordernote
238	Can delete Order Note	79	delete_ordernote
239	Can add Communication Event	80	add_communicationevent
240	Can change Communication Event	80	change_communicationevent
241	Can delete Communication Event	80	delete_communicationevent
242	Can add Shipping address	81	add_shippingaddress
243	Can change Shipping address	81	change_shippingaddress
244	Can delete Shipping address	81	delete_shippingaddress
245	Can add Billing address	82	add_billingaddress
246	Can change Billing address	82	change_billingaddress
247	Can delete Billing address	82	delete_billingaddress
248	Can add Order Line	83	add_line
249	Can change Order Line	83	change_line
250	Can delete Order Line	83	delete_line
251	Can add Line Price	84	add_lineprice
252	Can change Line Price	84	change_lineprice
253	Can delete Line Price	84	delete_lineprice
254	Can add Line Attribute	85	add_lineattribute
255	Can change Line Attribute	85	change_lineattribute
256	Can delete Line Attribute	85	delete_lineattribute
257	Can add Shipping Event	86	add_shippingevent
258	Can change Shipping Event	86	change_shippingevent
259	Can delete Shipping Event	86	delete_shippingevent
260	Can add Shipping Event Type	87	add_shippingeventtype
261	Can change Shipping Event Type	87	change_shippingeventtype
262	Can delete Shipping Event Type	87	delete_shippingeventtype
263	Can add Payment Event	88	add_paymentevent
264	Can change Payment Event	88	change_paymentevent
265	Can delete Payment Event	88	delete_paymentevent
266	Can add Payment Event Type	89	add_paymenteventtype
267	Can change Payment Event Type	89	change_paymenteventtype
268	Can delete Payment Event Type	89	delete_paymenteventtype
269	Can add Order Discount	90	add_orderdiscount
270	Can change Order Discount	90	change_orderdiscount
271	Can delete Order Discount	90	delete_orderdiscount
272	Can add Email	91	add_email
273	Can change Email	91	change_email
274	Can delete Email	91	delete_email
275	Can add Communication event type	92	add_communicationeventtype
276	Can change Communication event type	92	change_communicationeventtype
277	Can delete Communication event type	92	delete_communicationeventtype
278	Can add Notification	93	add_notification
279	Can change Notification	93	change_notification
280	Can delete Notification	93	delete_notification
281	Can add Product alert	94	add_productalert
282	Can change Product alert	94	change_productalert
283	Can delete Product alert	94	delete_productalert
284	Can add Page Promotion	95	add_pagepromotion
285	Can change Page Promotion	95	change_pagepromotion
286	Can delete Page Promotion	95	delete_pagepromotion
287	Can add Keyword Promotion	96	add_keywordpromotion
288	Can change Keyword Promotion	96	change_keywordpromotion
289	Can delete Keyword Promotion	96	delete_keywordpromotion
290	Can add Raw HTML	97	add_rawhtml
291	Can change Raw HTML	97	change_rawhtml
292	Can delete Raw HTML	97	delete_rawhtml
293	Can add Image	98	add_image
294	Can change Image	98	change_image
295	Can delete Image	98	delete_image
296	Can add Multi Image	99	add_multiimage
297	Can change Multi Image	99	change_multiimage
298	Can delete Multi Image	99	delete_multiimage
299	Can add Single product	100	add_singleproduct
300	Can change Single product	100	change_singleproduct
301	Can delete Single product	100	delete_singleproduct
302	Can add Hand Picked Product List	101	add_handpickedproductlist
303	Can change Hand Picked Product List	101	change_handpickedproductlist
304	Can delete Hand Picked Product List	101	delete_handpickedproductlist
305	Can add Ordered product	102	add_orderedproduct
306	Can change Ordered product	102	change_orderedproduct
307	Can delete Ordered product	102	delete_orderedproduct
308	Can add Automatic product list	103	add_automaticproductlist
309	Can change Automatic product list	103	change_automaticproductlist
310	Can delete Automatic product list	103	delete_automaticproductlist
311	Can add Ordered Product List	104	add_orderedproductlist
312	Can change Ordered Product List	104	change_orderedproductlist
313	Can delete Ordered Product List	104	delete_orderedproductlist
314	Can add Tabbed Block	105	add_tabbedblock
315	Can change Tabbed Block	105	change_tabbedblock
316	Can delete Tabbed Block	105	delete_tabbedblock
317	Can add Voucher	106	add_voucher
318	Can change Voucher	106	change_voucher
319	Can delete Voucher	106	delete_voucher
320	Can add Voucher Application	107	add_voucherapplication
321	Can change Voucher Application	107	change_voucherapplication
322	Can delete Voucher Application	107	delete_voucherapplication
323	Can add Wish List	108	add_wishlist
324	Can change Wish List	108	change_wishlist
325	Can delete Wish List	108	delete_wishlist
326	Can add Wish list line	109	add_line
327	Can change Wish list line	109	change_line
328	Can delete Wish list line	109	delete_line
329	Can add kv store	110	add_kvstore
330	Can change kv store	110	change_kvstore
331	Can delete kv store	110	delete_kvstore
332	Can add express transaction	111	add_expresstransaction
333	Can change express transaction	111	change_expresstransaction
334	Can delete express transaction	111	delete_expresstransaction
335	Can add payflow transaction	112	add_payflowtransaction
336	Can change payflow transaction	112	change_payflowtransaction
337	Can delete payflow transaction	112	delete_payflowtransaction
338	Can add api key	113	add_apikey
339	Can change api key	113	change_apikey
340	Can delete api key	113	delete_apikey
341	Can add account type	114	add_accounttype
342	Can change account type	114	change_accounttype
343	Can delete account type	114	delete_accounttype
344	Can add account	115	add_account
345	Can change account	115	change_account
346	Can delete account	115	delete_account
347	Can add transfer	116	add_transfer
348	Can change transfer	116	change_transfer
349	Can delete transfer	116	delete_transfer
350	Can add transaction	117	add_transaction
351	Can change transaction	117	change_transaction
352	Can delete transaction	117	delete_transaction
353	Can add IP address record	118	add_ipaddressrecord
354	Can change IP address record	118	change_ipaddressrecord
355	Can delete IP address record	118	delete_ipaddressrecord
356	Can add flat page	119	add_flatpage
357	Can change flat page	119	change_flatpage
358	Can delete flat page	119	delete_flatpage
359	Can add plan	120	add_plan
360	Can change plan	120	change_plan
361	Can delete plan	120	delete_plan
362	Can add event processing exception	121	add_eventprocessingexception
363	Can change event processing exception	121	change_eventprocessingexception
364	Can delete event processing exception	121	delete_eventprocessingexception
365	Can add event	122	add_event
366	Can change event	122	change_event
367	Can delete event	122	delete_event
368	Can add transfer	123	add_transfer
369	Can change transfer	123	change_transfer
370	Can delete transfer	123	delete_transfer
371	Can add transfer charge fee	124	add_transferchargefee
372	Can change transfer charge fee	124	change_transferchargefee
373	Can delete transfer charge fee	124	delete_transferchargefee
374	Can add customer	125	add_customer
375	Can change customer	125	change_customer
376	Can delete customer	125	delete_customer
377	Can add card	126	add_card
378	Can change card	126	change_card
380	Can add bitcoin receiver	127	add_bitcoinreceiver
381	Can change bitcoin receiver	127	change_bitcoinreceiver
382	Can delete bitcoin receiver	127	delete_bitcoinreceiver
383	Can add subscription	128	add_subscription
384	Can change subscription	128	change_subscription
385	Can delete subscription	128	delete_subscription
386	Can add invoice	129	add_invoice
387	Can change invoice	129	change_invoice
388	Can delete invoice	129	delete_invoice
389	Can add invoice item	130	add_invoiceitem
390	Can change invoice item	130	change_invoiceitem
391	Can delete invoice item	130	delete_invoiceitem
392	Can add charge	131	add_charge
393	Can change charge	131	change_charge
394	Can delete charge	131	delete_charge
401	Can add application	134	add_application
402	Can change application	134	change_application
403	Can delete application	134	delete_application
404	Can add grant	135	add_grant
405	Can change grant	135	change_grant
406	Can delete grant	135	delete_grant
407	Can add access token	136	add_accesstoken
408	Can change access token	136	change_accesstoken
409	Can delete access token	136	delete_accesstoken
410	Can add refresh token	137	add_refreshtoken
411	Can change refresh token	137	change_refreshtoken
412	Can delete refresh token	137	delete_refreshtoken
413	Can add product list snippet	138	add_productlistsnippet
414	Can change product list snippet	138	change_productlistsnippet
415	Can delete product list snippet	138	delete_productlistsnippet
416	Can add product list item	139	add_productlistitem
417	Can change product list item	139	change_productlistitem
418	Can delete product list item	139	delete_productlistitem
419	Can add source	140	add_source
420	Can change source	140	change_source
421	Can delete source	140	delete_source
422	Can add thumbnail	141	add_thumbnail
423	Can change thumbnail	141	change_thumbnail
424	Can delete thumbnail	141	delete_thumbnail
425	Can add thumbnail dimensions	142	add_thumbnaildimensions
426	Can change thumbnail dimensions	142	change_thumbnaildimensions
427	Can delete thumbnail dimensions	142	delete_thumbnaildimensions
431	Can add Setting	144	add_setting
432	Can change Setting	144	change_setting
433	Can delete Setting	144	delete_setting
434	Can add Site permission	145	add_sitepermission
435	Can change Site permission	145	change_sitepermission
436	Can delete Site permission	145	delete_sitepermission
437	Can add Comment	146	add_threadedcomment
438	Can change Comment	146	change_threadedcomment
439	Can delete Comment	146	delete_threadedcomment
440	Can add Keyword	147	add_keyword
441	Can change Keyword	147	change_keyword
442	Can delete Keyword	147	delete_keyword
443	Can add assigned keyword	148	add_assignedkeyword
444	Can change assigned keyword	148	change_assignedkeyword
445	Can delete assigned keyword	148	delete_assignedkeyword
446	Can add Rating	149	add_rating
447	Can change Rating	149	change_rating
448	Can delete Rating	149	delete_rating
449	Can add Page	150	add_page
450	Can change Page	150	change_page
451	Can delete Page	150	delete_page
452	Can add Rich text page	151	add_richtextpage
453	Can change Rich text page	151	change_richtextpage
454	Can delete Rich text page	151	delete_richtextpage
455	Can add Link	152	add_link
456	Can change Link	152	change_link
457	Can delete Link	152	delete_link
458	Can add Blog post	153	add_blogpost
459	Can change Blog post	153	change_blogpost
460	Can delete Blog post	153	delete_blogpost
461	Can add Blog Category	154	add_blogcategory
462	Can change Blog Category	154	change_blogcategory
463	Can delete Blog Category	154	delete_blogcategory
464	Can add Form	155	add_form
465	Can change Form	155	change_form
466	Can delete Form	155	delete_form
467	Can add Field	156	add_field
468	Can change Field	156	change_field
469	Can delete Field	156	delete_field
470	Can add Form entry	157	add_formentry
471	Can change Form entry	157	change_formentry
472	Can delete Form entry	157	delete_formentry
473	Can add Form field entry	158	add_fieldentry
474	Can change Form field entry	158	change_fieldentry
475	Can delete Form field entry	158	delete_fieldentry
476	Can add Gallery	159	add_gallery
477	Can change Gallery	159	change_gallery
478	Can delete Gallery	159	delete_gallery
479	Can add Image	160	add_galleryimage
480	Can change Image	160	change_galleryimage
481	Can delete Image	160	delete_galleryimage
482	Can add Twitter query	161	add_query
483	Can change Twitter query	161	change_query
484	Can delete Twitter query	161	delete_query
485	Can add Tweet	162	add_tweet
486	Can change Tweet	162	change_tweet
487	Can delete Tweet	162	delete_tweet
488	Can add comment	163	add_comment
489	Can change comment	163	change_comment
490	Can delete comment	163	delete_comment
491	Can moderate comments	163	can_moderate
492	Can add comment flag	164	add_commentflag
493	Can change comment flag	164	change_commentflag
494	Can delete comment flag	164	delete_commentflag
495	Can add API-based Shipping Method	165	add_shippingcompany
496	Can change API-based Shipping Method	165	change_shippingcompany
497	Can delete API-based Shipping Method	165	delete_shippingcompany
498	Can add Shipping Container	166	add_shippingcontainer
499	Can change Shipping Container	166	change_shippingcontainer
500	Can delete Shipping Container	166	delete_shippingcontainer
504	Can add node	168	add_node
505	Can change node	168	change_node
506	Can delete node	168	delete_node
507	Can add unknown widget	169	add_unknownwidget
508	Can change unknown widget	169	change_unknownwidget
509	Can delete unknown widget	169	delete_unknownwidget
510	Can add version commit	170	add_versioncommit
511	Can change version commit	170	change_versioncommit
512	Can delete version commit	170	delete_versioncommit
513	Can add version tracker	171	add_versiontracker
514	Can change version tracker	171	change_versiontracker
515	Can delete version tracker	171	delete_versiontracker
516	Can add Placeholder	172	add_placeholder
517	Can change Placeholder	172	change_placeholder
518	Can delete Placeholder	172	delete_placeholder
519	Can add Contentitem link	173	add_contentitem
520	Can change Contentitem link	173	change_contentitem
521	Can delete Contentitem link	173	delete_contentitem
522	Can add Text	174	add_textitem
523	Can change Text	174	change_textitem
524	Can delete Text	174	delete_textitem
525	Can add Code snippet	175	add_codeitem
526	Can change Code snippet	175	change_codeitem
527	Can delete Code snippet	175	delete_codeitem
528	Can add GitHub Gist snippet	176	add_gistitem
529	Can change GitHub Gist snippet	176	change_gistitem
530	Can delete GitHub Gist snippet	176	delete_gistitem
531	Can add Iframe	177	add_iframeitem
532	Can change Iframe	177	change_iframeitem
533	Can delete Iframe	177	delete_iframeitem
534	Can add Markup code	178	add_markupitem
535	Can change Markup code	178	change_markupitem
536	Can delete Markup code	178	delete_markupitem
537	Can add Markdown	178	add_markdownmarkupitem
538	Can change Markdown	178	change_markdownmarkupitem
539	Can delete Markdown	178	delete_markdownmarkupitem
540	Can add Textile	178	add_textilemarkupitem
541	Can change Textile	178	change_textilemarkupitem
542	Can delete Textile	178	delete_textilemarkupitem
543	Can add reStructuredText	178	add_restructuredtextmarkupitem
544	Can change reStructuredText	178	change_restructuredtextmarkupitem
545	Can delete reStructuredText	178	delete_restructuredtextmarkupitem
546	Can add HTML code	182	add_rawhtmlitem
547	Can change HTML code	182	change_rawhtmlitem
548	Can delete HTML code	182	delete_rawhtmlitem
549	Can add Picture	183	add_pictureitem
550	Can change Picture	183	change_pictureitem
551	Can delete Picture	183	delete_pictureitem
552	Can add Online media	184	add_oembeditem
553	Can change Online media	184	change_oembeditem
554	Can delete Online media	184	delete_oembeditem
555	Can add Shared content	186	add_sharedcontent
556	Can change Shared content	186	change_sharedcontent
557	Can delete Shared content	186	delete_sharedcontent
558	Can add Shared content	187	add_sharedcontentitem
559	Can change Shared content	187	change_sharedcontentitem
560	Can delete Shared content	187	delete_sharedcontentitem
561	Can add Embedded document	188	add_googledocsvieweritem
562	Can change Embedded document	188	change_googledocsvieweritem
563	Can delete Embedded document	188	delete_googledocsvieweritem
564	Can add Core page	189	add_coremodulpage
565	Can change Core page	189	change_coremodulpage
566	Can delete Core page	189	delete_coremodulpage
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_permission_id_seq', 566, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$24000$tiQs6H4WxB9h$jaBqWmeWuIAX6HfGb/30yoR6pCABEIuzGIva5bIwpWQ=	2016-08-14 21:08:18.390974-04	t	root	Bow &	Drape	dmitryro@gmail.com	t	t	2016-08-09 06:34:02-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_id_seq', 2, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: root
--

COPY authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: basket_basket; Type: TABLE DATA; Schema: public; Owner: root
--

COPY basket_basket (id, status, date_created, date_merged, date_submitted, owner_id) FROM stdin;
2	Merged	2016-08-09 13:56:04.707331-04	2016-08-09 14:21:38.761349-04	\N	\N
3	Merged	2016-08-09 14:22:19.057875-04	2016-08-09 14:22:53.550873-04	\N	\N
4	Merged	2016-08-09 16:19:02.425239-04	2016-08-09 16:26:26.410082-04	\N	\N
5	Submitted	2016-08-09 23:07:57.876525-04	\N	2016-08-09 23:11:22.040188-04	\N
6	Merged	2016-08-09 23:32:22.871351-04	2016-08-09 23:45:31.827386-04	\N	\N
1	Submitted	2016-08-09 11:52:00.929702-04	\N	2016-08-09 23:47:04.525961-04	1
7	Submitted	2016-08-09 23:47:13.16319-04	\N	2016-08-10 00:06:42.763721-04	1
9	Merged	2016-08-10 11:02:54.095235-04	2016-08-10 12:14:34.647665-04	\N	\N
11	Merged	2016-08-11 00:11:03.324412-04	2016-08-11 00:23:18.774507-04	\N	\N
8	Submitted	2016-08-10 00:06:56.739938-04	\N	2016-08-11 00:24:02.740545-04	1
12	Submitted	2016-08-11 00:24:24.600962-04	\N	2016-08-11 11:02:47.425989-04	1
13	Submitted	2016-08-11 11:05:56.221791-04	\N	2016-08-11 12:00:49.892507-04	1
14	Submitted	2016-08-11 12:11:59.846865-04	\N	2016-08-11 12:21:32.789335-04	1
15	Submitted	2016-08-11 12:21:52.896104-04	\N	2016-08-11 12:29:31.508092-04	1
16	Submitted	2016-08-11 12:29:41.190036-04	\N	2016-08-11 13:37:06.671784-04	1
17	Submitted	2016-08-11 13:37:18.450738-04	\N	2016-08-11 13:59:49.206168-04	1
18	Submitted	2016-08-11 14:00:02.929142-04	\N	2016-08-11 14:02:39.303238-04	1
19	Submitted	2016-08-11 14:03:54.924553-04	\N	2016-08-11 14:58:06.108107-04	1
20	Submitted	2016-08-11 14:58:15.075522-04	\N	2016-08-11 15:16:20.838654-04	1
21	Submitted	2016-08-11 15:16:29.244255-04	\N	2016-08-11 17:51:16.489915-04	1
22	Submitted	2016-08-11 17:51:44.190801-04	\N	2016-08-11 23:33:24.42728-04	1
23	Submitted	2016-08-11 23:33:35.947646-04	\N	2016-08-12 10:37:23.829149-04	1
24	Submitted	2016-08-12 10:37:33.202045-04	\N	2016-08-12 10:41:03.388812-04	1
25	Submitted	2016-08-12 10:41:58.896894-04	\N	2016-08-12 17:00:37.823849-04	1
26	Frozen	2016-08-12 17:00:45.67842-04	\N	\N	1
27	Open	2016-08-14 19:44:49.783129-04	\N	\N	1
28	Frozen	2016-08-14 19:58:00.181688-04	\N	\N	\N
29	Merged	2016-08-14 20:38:05.076472-04	2016-08-14 20:44:59.233221-04	\N	\N
\.


--
-- Name: basket_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('basket_basket_id_seq', 29, true);


--
-- Data for Name: basket_basket_vouchers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY basket_basket_vouchers (id, basket_id, voucher_id) FROM stdin;
\.


--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('basket_basket_vouchers_id_seq', 1, false);


--
-- Data for Name: basket_line; Type: TABLE DATA; Schema: public; Owner: root
--

COPY basket_line (id, line_reference, quantity, price_currency, price_excl_tax, price_incl_tax, date_created, basket_id, product_id, stockrecord_id) FROM stdin;
4	3_1	3	USD	20.00	20.00	2016-08-09 23:07:57.938242-04	5	3	1
1	3_1	3	USD	20.00	20.00	2016-08-09 13:56:04.789611-04	1	3	1
6	3_1	1	USD	20.00	20.00	2016-08-10 00:06:03.981702-04	7	3	1
7	3_1	7	USD	20.00	20.00	2016-08-10 09:56:18.23057-04	8	3	1
10	3_1	1	USD	20.00	20.00	2016-08-11 09:01:17.576337-04	12	3	1
13	3_1	1	USD	20.00	20.00	2016-08-11 12:21:08.580916-04	14	3	1
14	3_1	4	USD	20.00	20.00	2016-08-11 12:22:02.359548-04	15	3	1
16	6_3	2	USD	20.00	20.00	2016-08-11 13:34:32.451938-04	16	6	3
18	6_3	1	USD	20.00	20.00	2016-08-11 13:49:40.129233-04	17	6	3
17	3_1	4	USD	20.00	20.00	2016-08-11 13:43:47.22157-04	17	3	1
19	3_1	1	USD	20.00	20.00	2016-08-11 14:01:59.27004-04	18	3	1
20	3_1	1	USD	20.00	20.00	2016-08-11 14:03:55.032574-04	19	3	1
21	6_3	3	USD	20.00	20.00	2016-08-11 14:29:08.765785-04	19	6	3
22	3_1	1	USD	20.00	20.00	2016-08-11 15:05:44.882429-04	20	3	1
23	6_3	1	USD	20.00	20.00	2016-08-11 15:15:50.055423-04	20	6	3
24	3_1	2	USD	20.00	20.00	2016-08-11 17:49:59.801307-04	21	3	1
26	3_1	1	USD	20.00	20.00	2016-08-11 18:17:34.476052-04	22	3	1
27	6_3	1	USD	20.00	20.00	2016-08-11 23:32:32.22551-04	22	6	3
28	3_1	1	USD	20.00	20.00	2016-08-12 10:36:43.196082-04	23	3	1
29	3_1	1	USD	20.00	20.00	2016-08-12 10:39:18.280419-04	24	3	1
30	6_3	1	USD	20.00	20.00	2016-08-12 11:10:21.849134-04	25	6	3
31	3_1	2	USD	20.00	20.00	2016-08-12 11:10:26.952596-04	25	3	1
32	6_3	5	USD	20.00	20.00	2016-08-13 21:07:14.191829-04	26	6	3
33	3_1	3	USD	20.00	20.00	2016-08-13 21:07:58.400775-04	26	3	1
35	6_3	1	USD	20.00	20.00	2016-08-14 19:58:00.258899-04	28	6	3
34	6_3	1	USD	20.00	20.00	2016-08-14 19:55:11.829097-04	27	6	3
37	3_1	1	USD	20.00	20.00	2016-08-14 22:58:38.362463-04	27	3	1
\.


--
-- Name: basket_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('basket_line_id_seq', 37, true);


--
-- Data for Name: basket_lineattribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY basket_lineattribute (id, value, line_id, option_id) FROM stdin;
\.


--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('basket_lineattribute_id_seq', 1, false);


--
-- Data for Name: blog_blogcategory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY blog_blogcategory (id, title, slug, site_id) FROM stdin;
\.


--
-- Name: blog_blogcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('blog_blogcategory_id_seq', 1, false);


--
-- Data for Name: blog_blogpost; Type: TABLE DATA; Schema: public; Owner: root
--

COPY blog_blogpost (id, comments_count, keywords_string, rating_count, rating_sum, rating_average, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, content, allow_comments, featured_image, site_id, user_id) FROM stdin;
\.


--
-- Data for Name: blog_blogpost_categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY blog_blogpost_categories (id, blogpost_id, blogcategory_id) FROM stdin;
\.


--
-- Name: blog_blogpost_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('blog_blogpost_categories_id_seq', 1, false);


--
-- Name: blog_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('blog_blogpost_id_seq', 1, false);


--
-- Data for Name: blog_blogpost_related_posts; Type: TABLE DATA; Schema: public; Owner: root
--

COPY blog_blogpost_related_posts (id, from_blogpost_id, to_blogpost_id) FROM stdin;
\.


--
-- Name: blog_blogpost_related_posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('blog_blogpost_related_posts_id_seq', 1, false);


--
-- Data for Name: catalogue_attributeoption; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_attributeoption (id, option, group_id) FROM stdin;
1	SIZE      XS   S    M    L    XL   XXL	1
2	BUST    34" 36"  38" 40" 43"  46"	1
3	WAIST  32" 33"  35" 38" 41"  44"	1
4	HIPS     32" 33"  35" 38" 41"  44"	1
\.


--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_attributeoption_id_seq', 4, true);


--
-- Data for Name: catalogue_attributeoptiongroup; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_attributeoptiongroup (id, name) FROM stdin;
1	SIZING
\.


--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_attributeoptiongroup_id_seq', 1, true);


--
-- Data for Name: catalogue_category; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_category (id, path, depth, numchild, name, description, image, slug) FROM stdin;
1	00020002	2	0	sweatshirts	<p>Sweatshirts Category</p>	categories/image_shirt_2f0Olug.jpg	sweathirts
3	00020001	2	0	T-Shirts	<p>T-Shirts</p>	categories/tease.jpg_canvas_430_430_6wj6wTK.png	t-shirts
2	0002	1	2	Women's Clothing	<p>Women's Clothing</p>	categories/image_shirt_8Sth07S.jpg	womens-clothing
\.


--
-- Name: catalogue_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_category_id_seq', 3, true);


--
-- Data for Name: catalogue_option; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_option (id, name, code, type) FROM stdin;
1	Sizes	sizes	Optional
\.


--
-- Name: catalogue_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_option_id_seq', 1, true);


--
-- Data for Name: catalogue_product; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_product (id, structure, upc, title, slug, description, rating, date_created, date_updated, is_discountable, parent_id, product_class_id) FROM stdin;
3	standalone	10012	Cool Sweatshirt	cool-sweatshirt	<p>Cool Sweatshirt</p>	5	2016-08-09 11:51:50.661853-04	2016-08-12 10:33:34.464702-04	t	\N	1
6	standalone	01231	Cool T-Shirt	cool-t-shirt	<p>Cool T-Shirt</p>	\N	2016-08-11 13:33:19.981998-04	2016-08-12 10:33:47.863267-04	t	\N	3
\.


--
-- Name: catalogue_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_product_id_seq', 6, true);


--
-- Data for Name: catalogue_product_product_options; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_product_product_options (id, product_id, option_id) FROM stdin;
\.


--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_product_product_options_id_seq', 1, false);


--
-- Data for Name: catalogue_productattribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productattribute (id, name, code, type, required, option_group_id, product_class_id) FROM stdin;
4	Size	size	text	f	\N	2
5	Slug	slug	text	f	\N	2
8	SIZE	size	option	f	1	3
9	BUST	bust	option	f	1	3
10	WAIST	waist	option	f	1	3
11	HIPS	hips	option	f	1	3
3	SIZE	size	option	f	1	1
1	BUST	bust	option	f	1	1
2	WAIST	waist	option	f	1	1
12	HIPS	hips	option	f	1	1
\.


--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productattribute_id_seq', 12, true);


--
-- Data for Name: catalogue_productattributevalue; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productattributevalue (id, value_text, value_integer, value_boolean, value_float, value_richtext, value_date, value_file, value_image, entity_object_id, attribute_id, entity_content_type_id, product_id, value_option_id) FROM stdin;
2	\N	\N	\N	\N	\N	\N			\N	8	\N	6	1
3	\N	\N	\N	\N	\N	\N			\N	9	\N	6	2
4	\N	\N	\N	\N	\N	\N			\N	11	\N	6	4
5	\N	\N	\N	\N	\N	\N			\N	10	\N	6	3
6	\N	\N	\N	\N	\N	\N			\N	1	\N	3	2
7	\N	\N	\N	\N	\N	\N			\N	12	\N	3	4
8	\N	\N	\N	\N	\N	\N			\N	3	\N	3	1
9	\N	\N	\N	\N	\N	\N			\N	2	\N	3	3
\.


--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productattributevalue_id_seq', 9, true);


--
-- Data for Name: catalogue_productcategory; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productcategory (id, category_id, product_id) FROM stdin;
1	1	3
3	3	6
4	2	6
\.


--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productcategory_id_seq', 4, true);


--
-- Data for Name: catalogue_productclass; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productclass (id, name, slug, requires_shipping, track_stock) FROM stdin;
2	Bags	bags	t	t
3	T-Shirts	t-shirts	t	t
1	Sweathirts	sweathirts	t	t
\.


--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productclass_id_seq', 3, true);


--
-- Data for Name: catalogue_productclass_options; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productclass_options (id, productclass_id, option_id) FROM stdin;
\.


--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productclass_options_id_seq', 1, false);


--
-- Data for Name: catalogue_productimage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productimage (id, original, caption, display_order, date_created, product_id) FROM stdin;
8	images/products/2016/08/image_shirt_ljNBxZC.jpg		0	2016-08-11 08:59:15.633776-04	3
10	images/products/2016/08/tease.jpg_canvas_430_430_5a44c8s.png		0	2016-08-11 13:33:20.143061-04	6
\.


--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productimage_id_seq', 10, true);


--
-- Data for Name: catalogue_productrecommendation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY catalogue_productrecommendation (id, ranking, primary_id, recommendation_id) FROM stdin;
2	10	6	6
\.


--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('catalogue_productrecommendation_id_seq', 2, true);


--
-- Data for Name: conf_setting; Type: TABLE DATA; Schema: public; Owner: root
--

COPY conf_setting (id, name, value, site_id) FROM stdin;
\.


--
-- Name: conf_setting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('conf_setting_id_seq', 1, false);


--
-- Data for Name: contentitem_code_codeitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_code_codeitem (contentitem_ptr_id, language, code, linenumbers) FROM stdin;
\.


--
-- Data for Name: contentitem_gist_gistitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_gist_gistitem (contentitem_ptr_id, gist_id, filename) FROM stdin;
\.


--
-- Data for Name: contentitem_googledocsviewer_googledocsvieweritem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_googledocsviewer_googledocsvieweritem (contentitem_ptr_id, url, width, height) FROM stdin;
\.


--
-- Data for Name: contentitem_iframe_iframeitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_iframe_iframeitem (contentitem_ptr_id, src, width, height) FROM stdin;
\.


--
-- Data for Name: contentitem_markup_markupitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_markup_markupitem (contentitem_ptr_id, text, language) FROM stdin;
\.


--
-- Data for Name: contentitem_oembeditem_oembeditem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_oembeditem_oembeditem (contentitem_ptr_id, embed_url, embed_max_width, embed_max_height, type, url, title, description, author_name, author_url, provider_name, provider_url, thumbnail_url, thumbnail_height, thumbnail_width, height, width, html) FROM stdin;
\.


--
-- Data for Name: contentitem_picture_pictureitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_picture_pictureitem (contentitem_ptr_id, image, caption, align, url, in_new_window) FROM stdin;
\.


--
-- Data for Name: contentitem_rawhtml_rawhtmlitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_rawhtml_rawhtmlitem (contentitem_ptr_id, html) FROM stdin;
\.


--
-- Data for Name: contentitem_sharedcontent_sharedcontentitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_sharedcontent_sharedcontentitem (contentitem_ptr_id, shared_content_id) FROM stdin;
\.


--
-- Data for Name: contentitem_text_textitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY contentitem_text_textitem (contentitem_ptr_id, text, text_final) FROM stdin;
\.


--
-- Data for Name: core_sitepermission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_sitepermission (id, user_id) FROM stdin;
\.


--
-- Name: core_sitepermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_sitepermission_id_seq', 1, false);


--
-- Data for Name: core_sitepermission_sites; Type: TABLE DATA; Schema: public; Owner: root
--

COPY core_sitepermission_sites (id, sitepermission_id, site_id) FROM stdin;
\.


--
-- Name: core_sitepermission_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('core_sitepermission_sites_id_seq', 1, false);


--
-- Data for Name: customer_communicationeventtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customer_communicationeventtype (id, code, name, category, email_subject_template, email_body_template, email_body_html_template, sms_template, date_created, date_updated) FROM stdin;
1	a101	Dmitry Roitman	Order related	dmitryro@gmail.com	some	some		2016-08-10 15:29:17.078311-04	2016-08-11 14:38:31.118155-04
\.


--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customer_communicationeventtype_id_seq', 1, true);


--
-- Data for Name: customer_email; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customer_email (id, subject, body_text, body_html, date_sent, user_id) FROM stdin;
1	Confirmation of order 100001	Hello,\n\nWe are pleased to confirm your order 100001 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 3 - price: $60.00\n\nCart total: $60.00\nShipping: $0.00\nOrder Total: $60.00\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100001 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 3 - price: $60.00</li>\n    \n</ul>\n<p>\nCart total: $60.00<br/>\nShipping: $0.00<br/>\nOrder Total: $60.00\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-09 23:47:04.595112-04	1
2	Confirmation of order 100007	Hello,\n\nWe are pleased to confirm your order 100007 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $19.80\nShipping: $0.00\nOrder Total: $19.80\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100007 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $19.80<br/>\nShipping: $0.00<br/>\nOrder Total: $19.80\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-10 00:06:42.832549-04	1
5	Confirmation of order 100008	Hello,\n\nWe are pleased to confirm your order 100008 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 7 - price: $138.60\n\nCart total: $138.60\nShipping: $0.00\nOrder Total: $138.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100008 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 7 - price: $138.60</li>\n    \n</ul>\n<p>\nCart total: $138.60<br/>\nShipping: $0.00<br/>\nOrder Total: $138.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 00:24:02.79794-04	1
6	Confirmation of order 100012	Hello,\n\nWe are pleased to confirm your order 100012 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $19.80\nShipping: $0.00\nOrder Total: $19.80\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100012 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $19.80<br/>\nShipping: $0.00<br/>\nOrder Total: $19.80\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 11:02:47.482654-04	1
7	Confirmation of order 100013	Hello,\n\nWe are pleased to confirm your order 100013 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool T-Shirt - quantity: 2 - price: $39.60\n\nCart total: $39.60\nShipping: $0.00\nOrder Total: $39.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100013 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool T-Shirt - quantity: 2 - price: $39.60</li>\n    \n</ul>\n<p>\nCart total: $39.60<br/>\nShipping: $0.00<br/>\nOrder Total: $39.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 12:00:49.95397-04	1
8	Confirmation of order 100014	Hello,\n\nWe are pleased to confirm your order 100014 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool T-Shirt - quantity: 2 - price: $39.60\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $59.40\nShipping: $0.00\nOrder Total: $59.40\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100014 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool T-Shirt - quantity: 2 - price: $39.60</li>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $59.40<br/>\nShipping: $0.00<br/>\nOrder Total: $59.40\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 12:21:32.873972-04	1
9	Confirmation of order 100015	Hello,\n\nWe are pleased to confirm your order 100015 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 4 - price: $79.20\n\nCart total: $79.20\nShipping: $0.00\nOrder Total: $79.20\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100015 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 4 - price: $79.20</li>\n    \n</ul>\n<p>\nCart total: $79.20<br/>\nShipping: $0.00<br/>\nOrder Total: $79.20\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 12:29:31.562826-04	1
10	Confirmation of order 100016	Hello,\n\nWe are pleased to confirm your order 100016 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool T-Shirt - quantity: 2 - price: $39.60\n\nCart total: $39.60\nShipping: $0.00\nOrder Total: $39.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100016 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool T-Shirt - quantity: 2 - price: $39.60</li>\n    \n</ul>\n<p>\nCart total: $39.60<br/>\nShipping: $0.00<br/>\nOrder Total: $39.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 13:37:06.737871-04	1
11	Confirmation of order 100017	Hello,\n\nWe are pleased to confirm your order 100017 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 4 - price: $79.20\n * Cool T-Shirt - quantity: 1 - price: $19.80\n\nCart total: $99.00\nShipping: $10.00\nOrder Total: $109.00\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100017 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 4 - price: $79.20</li>\n    \n    <li>Cool T-Shirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $99.00<br/>\nShipping: $10.00<br/>\nOrder Total: $109.00\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 13:59:49.301427-04	1
12	Confirmation of order 100018	Hello,\n\nWe are pleased to confirm your order 100018 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $19.80\nShipping: $10.00\nOrder Total: $29.80\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100018 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $19.80<br/>\nShipping: $10.00<br/>\nOrder Total: $29.80\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 14:02:39.364287-04	1
13	Confirmation of order 100019	Hello,\n\nWe are pleased to confirm your order 100019 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n * Cool T-Shirt - quantity: 3 - price: $59.40\n\nCart total: $79.20\nShipping: $10.00\nOrder Total: $89.20\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100019 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n    <li>Cool T-Shirt - quantity: 3 - price: $59.40</li>\n    \n</ul>\n<p>\nCart total: $79.20<br/>\nShipping: $10.00<br/>\nOrder Total: $89.20\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 14:58:06.197388-04	1
14	Confirmation of order 100020	Hello,\n\nWe are pleased to confirm your order 100020 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n * Cool T-Shirt - quantity: 1 - price: $19.80\n\nCart total: $39.60\nShipping: $10.00\nOrder Total: $49.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100020 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n    <li>Cool T-Shirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $39.60<br/>\nShipping: $10.00<br/>\nOrder Total: $49.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 15:16:20.897653-04	1
15	Confirmation of order 100021	Hello,\n\nWe are pleased to confirm your order 100021 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 2 - price: $39.60\n\nCart total: $39.60\nShipping: $10.00\nOrder Total: $49.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100021 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 2 - price: $39.60</li>\n    \n</ul>\n<p>\nCart total: $39.60<br/>\nShipping: $10.00<br/>\nOrder Total: $49.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 17:51:16.579331-04	1
16	Confirmation of order 100022	Hello,\n\nWe are pleased to confirm your order 100022 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n * Cool T-Shirt - quantity: 1 - price: $19.80\n\nCart total: $39.60\nShipping: $10.00\nOrder Total: $49.60\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100022 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n    <li>Cool T-Shirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $39.60<br/>\nShipping: $10.00<br/>\nOrder Total: $49.60\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-11 23:33:24.487509-04	1
17	Confirmation of order 100023	Hello,\n\nWe are pleased to confirm your order 100023 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $19.80\nShipping: $10.00\nOrder Total: $29.80\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100023 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $19.80<br/>\nShipping: $10.00<br/>\nOrder Total: $29.80\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-12 10:37:23.886878-04	1
18	Confirmation of order 100024	Hello,\n\nWe are pleased to confirm your order 100024 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool Sweatshirt - quantity: 1 - price: $19.80\n\nCart total: $19.80\nShipping: $10.00\nOrder Total: $29.80\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100024 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool Sweatshirt - quantity: 1 - price: $19.80</li>\n    \n</ul>\n<p>\nCart total: $19.80<br/>\nShipping: $10.00<br/>\nOrder Total: $29.80\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The example.com team</p>\n	2016-08-12 10:41:03.474096-04	1
19	Confirmation of order 100025	Hello,\n\nWe are pleased to confirm your order 100025 has been received and\nwill be processed shortly.\n\nYour order contains:\n\n * Cool T-Shirt - quantity: 1 - price: $19.80\n * Cool Sweatshirt - quantity: 2 - price: $39.60\n\nCart total: $59.40\nShipping: $10.00\nOrder Total: $69.40\n\nShipping address:\n\n  Mr Dmitry Roitman\n  150 West End Avenue\n  Apt. 6D\n  Brooklyn\n  New York\n  New York\n  11235\n  United States\n\n\n\n\nThe team\n	\n<p xmlns="http://www.w3.org/1999/html">Hello,</p>\n\n<p>We are pleased to confirm your order 100025 has been received and\nwill be processed shortly.</p>\n\n<p>Your order contains:</p>\n\n<ul>\n    \n    <li>Cool T-Shirt - quantity: 1 - price: $19.80</li>\n    \n    <li>Cool Sweatshirt - quantity: 2 - price: $39.60</li>\n    \n</ul>\n<p>\nCart total: $59.40<br/>\nShipping: $10.00<br/>\nOrder Total: $69.40\n</p>\n\n<p>Shipping address:</p>\n<p>  Mr Dmitry Roitman<br/>\n  150 West End Avenue<br/>\n  Apt. 6D<br/>\n  Brooklyn<br/>\n  New York<br/>\n  New York<br/>\n  11235<br/>\n  United States<br/>\n</p>\n\n\n\n\n<p>Thanks for using our site!</p>\n<p>The bowanddrape.cms.3dact.com team</p>\n	2016-08-12 17:00:37.911177-04	1
\.


--
-- Name: customer_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customer_email_id_seq', 19, true);


--
-- Data for Name: customer_notification; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customer_notification (id, subject, body, category, location, date_sent, date_read, recipient_id, sender_id) FROM stdin;
1	\n\n<a href="/catalogue/cool-sweatshirt_3/">Cool Sweatshirt</a> is back in stock\n\n			Inbox	2016-08-11 12:39:37.126499-04	2016-08-11 13:47:52.042887-04	1	\N
\.


--
-- Name: customer_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customer_notification_id_seq', 1, true);


--
-- Data for Name: customer_productalert; Type: TABLE DATA; Schema: public; Owner: root
--

COPY customer_productalert (id, email, key, status, date_created, date_confirmed, date_cancelled, date_closed, product_id, user_id) FROM stdin;
1			Closed	2016-08-11 12:31:40.788875-04	\N	\N	2016-08-11 12:39:37.140629-04	3	1
\.


--
-- Name: customer_productalert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('customer_productalert_id_seq', 1, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2016-08-10 11:46:31.256333-04	1	root	2	Changed first_name, last_name and email.	4	1
2	2016-08-10 11:46:53.944794-04	1	root	2	Changed email.	4	1
5	2016-08-10 11:54:21.0411-04	3	T-Shirts	1	Added.	35	1
6	2016-08-10 12:46:47.317644-04	1	root	2	Changed email.	4	1
7	2016-08-10 12:47:06.845916-04	1	root	2	Changed password.	4	1
8	2016-08-10 13:45:51.466525-04	2	Ec_vzQRtz_khgJqGqhX2yrB7bJYFO1	3		4	1
9	2016-08-10 14:41:39.030285-04	1	root	2	Changed email.	4	1
10	2016-08-10 15:27:10.218279-04	4	Product '<missing product>', quantity '1'	1	Added.	83	1
11	2016-08-10 15:27:31.716894-04	4	Product 'Cool Sweatshirt', quantity '1'	2	Changed stockrecord and product.	83	1
12	2016-08-10 15:27:51.847832-04	1	Place in Escrow	1	Added.	89	1
13	2016-08-10 15:28:03.108253-04	2	Release from Escrow	1	Added.	89	1
14	2016-08-10 15:29:17.081338-04	1	Order Placed	1	Added.	92	1
15	2016-08-10 15:29:27.320643-04	1	'Order Placed' event for order #100001	1	Added.	80	1
16	2016-08-10 15:30:04.664088-04	1	SKU	1	Added.	40	1
17	2016-08-10 16:42:45.012216-04	1	Deferred income	1	Added.	114	1
18	2016-08-10 16:51:42.100083-04	2	Deferred ncome	1	Added.	114	1
19	2016-08-11 14:42:29.96589-04	3	Refund Issued	1	Added.	89	1
20	2016-08-11 14:43:23.808254-04	1	Sizes	1	Added.	44	1
21	2016-08-11 14:43:44.341103-04	1	Sizes	1	Added.	42	1
22	2016-08-11 14:47:18.859424-04	1	SIZING	2	Changed name. Added Attribute option "SIZE". Added Attribute option "BUST". Added Attribute option "WAIST". Added Attribute option "HIPS".	42	1
23	2016-08-11 14:56:27.327469-04	1	SIZING	2	Changed option for Attribute option "SIZE      XS   S    M    L    XL   XXL". Changed option for Attribute option "BUST    34" 36"  38" 40" 43"  46"". Changed option for Attribute option "WAIST  32" 33"  35" 38" 41"  44"". Changed option for Attribute option "HIPS     32" 33"  35" 38" 41"  44"".	42	1
3	2016-08-10 11:51:46.928073-04	1	USPS	1	Added.	\N	1
4	2016-08-10 11:53:17.513321-04	2	UPS	1	Added.	\N	1
24	2016-08-12 14:27:15.688358-04	1	bowanddrape.cms.3dact.com	2	Changed domain and name.	7	1
25	2016-08-12 15:19:44.823372-04	1	Account	1	Added.	115	1
26	2016-08-12 15:22:30.991191-04	3	ac	1	Added.	114	1
27	2016-08-12 15:26:14.471043-04	2	bowanddrape.commerce.3dact.com	1	Added.	7	1
28	2016-08-12 15:26:48.277895-04	1	/about/ -- About	2	Changed url and sites.	119	1
29	2016-08-12 15:27:47.926179-04	1	deferred income	2	Changed name.	114	1
30	2016-08-12 15:28:12.890497-04	4	de	1	Added.	114	1
31	2016-08-12 15:28:47.464443-04	5	de	1	Added.	114	1
32	2016-08-12 15:30:34.998825-04	6	code	1	Added.	114	1
33	2016-08-12 15:31:44.506003-04	7	defincome	1	Added.	114	1
34	2016-08-12 15:32:02.443152-04	7	defincome	2	Changed depth.	114	1
35	2016-08-12 15:32:50.108184-04	8	path	1	Added.	114	1
36	2016-08-12 15:33:20.43441-04	8	path	2	Changed depth and numchild.	114	1
37	2016-08-12 15:34:15.635107-04	9	code	1	Added.	114	1
38	2016-08-12 15:34:35.395115-04	10	code	1	Added.	114	1
39	2016-08-12 15:34:53.658227-04	3	deferred income	2	Changed name.	114	1
40	2016-08-12 15:36:55.894103-04	11	di	1	Added.	114	1
41	2016-08-12 15:37:14.459082-04	11	Deferred income	2	Changed name.	114	1
42	2016-08-12 15:37:38.149882-04	3	Deferred income	2	Changed name.	114	1
43	2016-08-12 15:38:12.45916-04	11	deferred income	2	Changed name.	114	1
44	2016-08-12 15:39:18.937775-04	12	deferred_income	1	Added.	114	1
45	2016-08-12 15:41:57.451042-04	1	deferred income	2	Changed numchild.	114	1
46	2016-08-12 15:42:11.566881-04	1	deferred income	2	Changed numchild.	114	1
47	2016-08-12 15:42:20.870482-04	1	deferred income	2	Changed numchild.	114	1
48	2016-08-12 15:42:33.51221-04	12	deferred_income	2	Changed depth and numchild.	114	1
49	2016-08-12 15:43:10.751187-04	12	deferred_income	2	Changed numchild.	114	1
50	2016-08-12 15:45:45.712212-04	10	code	2	Changed depth.	114	1
51	2016-08-12 15:47:46.969896-04	13	one	1	Added.	114	1
52	2016-08-12 15:48:01.107081-04	10	code	2	Changed depth.	114	1
53	2016-08-12 15:49:04.954446-04	13	one	2	Changed numchild.	114	1
54	2016-08-12 15:49:19.77665-04	3	Deferred income	2	Changed numchild.	114	1
55	2016-08-12 15:49:48.58183-04	13	one	2	Changed depth and numchild.	114	1
56	2016-08-12 15:51:39.679178-04	14	deferred_income	1	Added.	114	1
57	2016-08-12 15:52:14.366768-04	14	deferred_income	2	Changed numchild.	114	1
58	2016-08-12 15:52:42.832518-04	1	deferred income	2	Changed numchild.	114	1
59	2016-08-12 15:52:58.25169-04	1	deferred income	2	Changed numchild.	114	1
60	2016-08-12 15:53:09.190097-04	1	deferred income	2	Changed numchild.	114	1
61	2016-08-12 15:53:28.172832-04	1	deferred income	2	Changed numchild.	114	1
62	2016-08-12 15:53:39.091706-04	1	deferred income	2	Changed numchild.	114	1
63	2016-08-12 15:54:01.646788-04	13	one	2	Changed depth.	114	1
64	2016-08-12 15:57:04.563048-04	1	deferred income	2	Changed numchild.	114	1
65	2016-08-12 15:57:32.038391-04	10	code	2	Changed depth and numchild.	114	1
66	2016-08-12 15:58:39.915082-04	10	code	2	Changed depth.	114	1
67	2016-08-12 16:00:14.51414-04	3	Deferred income	2	Changed depth and numchild.	114	1
68	2016-08-12 16:02:18.097501-04	10	code	2	Changed numchild.	114	1
69	2016-08-12 16:02:28.786091-04	10	code	2	Changed numchild.	114	1
70	2016-08-12 16:02:43.770429-04	1	deferred income	2	Changed numchild.	114	1
71	2016-08-12 16:03:00.768897-04	3	Deferred income	2	Changed depth and numchild.	114	1
72	2016-08-12 16:04:21.901163-04	15	c1	1	Added.	114	1
73	2016-08-12 16:05:45.800625-04	1	deferred income	2	Changed path.	114	1
74	2016-08-12 16:06:27.32639-04	15	c1	2	Changed path and depth.	114	1
75	2016-08-12 16:07:12.913614-04	15	deferred_income_one	2	Changed name.	114	1
76	2016-08-12 16:07:32.952096-04	10	code	2	Changed depth.	114	1
77	2016-08-12 16:19:43.33772-04	16	code	1	Added.	114	1
78	2016-08-12 16:21:24.832434-04	1	deferred income	2	Changed depth.	114	1
79	2016-08-12 16:26:17.041512-04	1	Packaging	1	Added.	87	1
80	2016-08-12 16:26:31.14768-04	2	Processing	1	Added.	87	1
81	2016-08-12 16:26:49.041484-04	3	Transit	1	Added.	87	1
82	2016-08-12 16:26:56.076753-04	4	Returning	1	Added.	87	1
83	2016-08-12 16:29:48.69084-04	1	Contact	1	Added.	151	1
84	2016-08-12 17:55:49.297593-04	17	code	1	Added.	114	1
85	2016-08-12 17:56:17.9995-04	1	deferred income	2	Changed numchild.	114	1
86	2016-08-12 17:56:31.84615-04	16	code	2	Changed depth.	114	1
87	2016-08-12 22:12:31.043042-04	16	code	2	Changed numchild.	114	1
88	2016-08-12 22:13:04.53433-04	16	code	2	Changed numchild.	114	1
89	2016-08-12 22:13:16.93807-04	16	code	2	Changed depth.	114	1
90	2016-08-13 19:12:18.314172-04	2	About	1	Added.	151	1
91	2016-08-13 19:12:53.450111-04	1	Contact	3		150	1
92	2016-08-13 19:13:35.964479-04	3	Contact	1	Added.	151	1
93	2016-08-13 19:25:36.983587-04	4	CUSTOMIZE YOUR OWN	1	Added.	151	1
94	2016-08-13 19:28:49.44014-04	3	SHOP	2	Changed title and keywords.	151	1
95	2016-08-13 19:29:01.695667-04	3	SHOP	2	Changed content and keywords.	151	1
96	2016-08-13 19:29:24.881007-04	2	LIMITED EDITION	2	Changed title, content and keywords.	151	1
97	2016-08-13 19:31:18.153312-04	5	RHONY FANS!	1	Added.	151	1
98	2016-08-13 19:32:02.115722-04	6	BRIDAL	1	Added.	151	1
99	2016-08-13 19:32:31.05191-04	7	PUNNY GIRLS	1	Added.	151	1
100	2016-08-13 20:29:37.934044-04	8	FLUENT	1	Added. Added Placeholder "Main". Added Placeholder "Sidepanel".	189	1
101	2016-08-13 20:32:38.836598-04	8	FLUENT	2	Changed keywords.	189	1
102	2016-08-13 20:35:22.81906-04	8	FLUENT	2	Changed keywords.	189	1
103	2016-08-13 21:01:59.130454-04	8	FLUENT	3		150	1
104	2016-08-13 21:03:39.489703-04	4	CUSTOMIZE YOUR OWN	2	Changed content and keywords.	151	1
105	2016-08-14 11:27:20.189791-04	16	code	2	Changed numchild.	114	1
106	2016-08-14 11:28:00.769506-04	15	deferred_income_one	2	Changed numchild.	114	1
107	2016-08-14 11:28:01.409589-04	15	deferred_income_one	2	No fields changed.	114	1
108	2016-08-14 11:28:22.158984-04	1	deferred income	2	Changed numchild.	114	1
109	2016-08-14 11:28:37.091516-04	1	deferred income	2	Changed depth.	114	1
110	2016-08-14 11:28:37.432697-04	1	deferred income	2	No fields changed.	114	1
111	2016-08-14 11:28:58.723704-04	1	deferred income	2	Changed numchild.	114	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 111, true);


--
-- Data for Name: django_comment_flags; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_comment_flags (id, flag, flag_date, comment_id, user_id) FROM stdin;
\.


--
-- Name: django_comment_flags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_comment_flags_id_seq', 1, false);


--
-- Data for Name: django_comments; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_comments (id, object_pk, user_name, user_email, user_url, comment, submit_date, ip_address, is_public, is_removed, content_type_id, site_id, user_id) FROM stdin;
\.


--
-- Name: django_comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_comments_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	redirects	redirect
9	menu	bookmark
10	dashboard	dashboardpreferences
11	django_rq_jobs	job
12	default	usersocialauth
13	default	nonce
14	default	association
15	default	code
16	registration	registrationprofile
17	registration_api	registrationprofile
18	authtoken	token
19	tastypie	apiaccess
20	tastypie	apikey
21	account	emailaddress
22	account	emailconfirmation
23	socialaccount	socialapp
24	socialaccount	socialaccount
25	socialaccount	socialtoken
26	analytics	productrecord
27	analytics	userrecord
28	analytics	userproductview
29	analytics	usersearch
30	address	useraddress
31	address	country
32	shipping	orderanditemcharges
33	shipping	weightbased
34	shipping	weightband
35	catalogue	productclass
36	catalogue	category
37	catalogue	productcategory
38	catalogue	product
39	catalogue	productrecommendation
40	catalogue	productattribute
41	catalogue	productattributevalue
42	catalogue	attributeoptiongroup
43	catalogue	attributeoption
44	catalogue	option
45	catalogue	productimage
46	reviews	productreview
47	reviews	vote
48	partner	partner
49	partner	partneraddress
50	partner	stockrecord
51	partner	stockalert
52	basket	basket
53	basket	line
54	basket	lineattribute
55	payment	transaction
56	payment	source
57	payment	sourcetype
58	payment	bankcard
59	offer	conditionaloffer
60	offer	benefit
61	offer	condition
62	offer	range
63	offer	rangeproduct
64	offer	rangeproductfileupload
65	offer	shippingfixedpricebenefit
66	offer	coveragecondition
67	offer	countcondition
68	offer	valuecondition
69	offer	multibuydiscountbenefit
70	offer	shippingpercentagediscountbenefit
71	offer	absolutediscountbenefit
72	offer	shippingbenefit
73	offer	shippingabsolutediscountbenefit
74	offer	percentagediscountbenefit
75	offer	fixedpricebenefit
76	order	paymenteventquantity
77	order	shippingeventquantity
78	order	order
79	order	ordernote
80	order	communicationevent
81	order	shippingaddress
82	order	billingaddress
83	order	line
84	order	lineprice
85	order	lineattribute
86	order	shippingevent
87	order	shippingeventtype
88	order	paymentevent
89	order	paymenteventtype
90	order	orderdiscount
91	customer	email
92	customer	communicationeventtype
93	customer	notification
94	customer	productalert
95	promotions	pagepromotion
96	promotions	keywordpromotion
97	promotions	rawhtml
98	promotions	image
99	promotions	multiimage
100	promotions	singleproduct
101	promotions	handpickedproductlist
102	promotions	orderedproduct
103	promotions	automaticproductlist
104	promotions	orderedproductlist
105	promotions	tabbedblock
106	voucher	voucher
107	voucher	voucherapplication
108	wishlists	wishlist
109	wishlists	line
110	thumbnail	kvstore
111	paypal	expresstransaction
112	paypal	payflowtransaction
113	oscarapi	apikey
114	oscar_accounts	accounttype
115	oscar_accounts	account
116	oscar_accounts	transfer
117	oscar_accounts	transaction
118	oscar_accounts	ipaddressrecord
119	flatpages	flatpage
120	pinax_stripe	plan
121	pinax_stripe	eventprocessingexception
122	pinax_stripe	event
123	pinax_stripe	transfer
124	pinax_stripe	transferchargefee
125	pinax_stripe	customer
126	pinax_stripe	card
127	pinax_stripe	bitcoinreceiver
128	pinax_stripe	subscription
129	pinax_stripe	invoice
130	pinax_stripe	invoiceitem
131	pinax_stripe	charge
134	oauth2_provider	application
135	oauth2_provider	grant
136	oauth2_provider	accesstoken
137	oauth2_provider	refreshtoken
138	oscar_wagtail	productlistsnippet
139	oscar_wagtail	productlistitem
140	easy_thumbnails	source
141	easy_thumbnails	thumbnail
142	easy_thumbnails	thumbnaildimensions
144	conf	setting
145	core	sitepermission
146	generic	threadedcomment
147	generic	keyword
148	generic	assignedkeyword
149	generic	rating
150	pages	page
151	pages	richtextpage
152	pages	link
153	blog	blogpost
154	blog	blogcategory
155	forms	form
156	forms	field
157	forms	formentry
158	forms	fieldentry
159	galleries	gallery
160	galleries	galleryimage
161	twitter	query
162	twitter	tweet
163	django_comments	comment
164	django_comments	commentflag
165	shipping	shippingcompany
166	shipping	shippingcontainer
168	widgy	node
169	widgy	unknownwidget
170	widgy	versioncommit
171	widgy	versiontracker
172	fluent_contents	placeholder
173	fluent_contents	contentitem
174	text	textitem
175	code	codeitem
176	gist	gistitem
177	iframe	iframeitem
178	markup	markupitem
179	markup	textilemarkupitem
180	markup	markdownmarkupitem
181	markup	restructuredtextmarkupitem
182	rawhtml	rawhtmlitem
183	picture	pictureitem
184	oembeditem	oembeditem
185	sharedcontent	sharedcontenttranslation
186	sharedcontent	sharedcontent
187	sharedcontent	sharedcontentitem
188	googledocsviewer	googledocsvieweritem
189	fluent	coremodulpage
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_content_type_id_seq', 189, true);


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
2	dashboard/pages/about/	About	<p>About</p>	f		f
1	/about/	About	<p>Some about text</p>	f		f
\.


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_flatpage_id_seq', 2, true);


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	1
2	2	1
3	1	2
\.


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_flatpage_sites_id_seq', 3, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-08-09 06:31:58.004671-04
2	auth	0001_initial	2016-08-09 06:31:58.885427-04
3	account	0001_initial	2016-08-09 06:31:59.259363-04
4	account	0002_email_max_length	2016-08-09 06:31:59.349507-04
5	admin	0001_initial	2016-08-09 06:31:59.553992-04
6	admin	0002_logentry_remove_auto_add	2016-08-09 06:31:59.664169-04
7	contenttypes	0002_remove_content_type_name	2016-08-09 06:31:59.812203-04
8	auth	0002_alter_permission_name_max_length	2016-08-09 06:31:59.862177-04
9	auth	0003_alter_user_email_max_length	2016-08-09 06:31:59.927285-04
10	auth	0004_alter_user_username_opts	2016-08-09 06:31:59.985649-04
11	auth	0005_alter_user_last_login_null	2016-08-09 06:32:00.04824-04
12	auth	0006_require_contenttypes_0002	2016-08-09 06:32:00.060072-04
13	auth	0007_alter_validators_add_error_messages	2016-08-09 06:32:00.108828-04
14	authtoken	0001_initial	2016-08-09 06:32:00.254281-04
15	authtoken	0002_auto_20160226_1747	2016-08-09 06:32:00.606938-04
16	dashboard	0001_initial	2016-08-09 06:32:00.874916-04
17	default	0001_initial	2016-08-09 06:32:01.662741-04
18	default	0002_add_related_name	2016-08-09 06:32:01.835055-04
19	default	0003_alter_email_max_length	2016-08-09 06:32:01.892774-04
20	default	0004_auto_20160423_0400	2016-08-09 06:32:01.982814-04
21	django_rq_jobs	0001_initial	2016-08-09 06:32:02.078843-04
22	django_rq_jobs	0002_auto_20150721_1255	2016-08-09 06:32:02.153458-04
23	django_rq_jobs	0003_auto_20150729_1103	2016-08-09 06:32:02.214582-04
24	menu	0001_initial	2016-08-09 06:32:02.396139-04
25	sites	0001_initial	2016-08-09 06:32:02.470668-04
26	redirects	0001_initial	2016-08-09 06:32:02.706694-04
27	registration	0001_initial	2016-08-09 06:32:02.96852-04
28	sessions	0001_initial	2016-08-09 06:32:03.109606-04
29	sites	0002_alter_domain_unique	2016-08-09 06:32:03.242436-04
30	socialaccount	0001_initial	2016-08-09 06:32:04.05363-04
31	socialaccount	0002_token_max_lengths	2016-08-09 06:32:04.568984-04
32	socialaccount	0003_extra_data_default_dict	2016-08-09 06:32:04.650407-04
33	tastypie	0001_initial	2016-08-09 06:32:04.969721-04
34	django_rq_jobs	0004_auto_20160809_0729	2016-08-09 07:29:29.781721-04
35	address	0001_initial	2016-08-09 07:40:09.930556-04
36	catalogue	0001_initial	2016-08-09 07:40:13.569518-04
37	analytics	0001_initial	2016-08-09 07:40:14.345683-04
38	analytics	0002_auto_20140827_1705	2016-08-09 07:40:14.957467-04
39	partner	0001_initial	2016-08-09 07:40:17.167077-04
40	customer	0001_initial	2016-08-09 07:40:18.398981-04
41	basket	0001_initial	2016-08-09 07:40:18.765196-04
42	basket	0002_auto_20140827_1705	2016-08-09 07:40:19.757865-04
43	order	0001_initial	2016-08-09 07:40:27.126063-04
44	offer	0001_initial	2016-08-09 07:40:30.451586-04
45	voucher	0001_initial	2016-08-09 07:40:31.404305-04
46	basket	0003_basket_vouchers	2016-08-09 07:40:31.844695-04
47	basket	0004_auto_20141007_2032	2016-08-09 07:40:32.11603-04
48	basket	0005_auto_20150604_1450	2016-08-09 07:40:32.518641-04
49	basket	0006_auto_20160111_1108	2016-08-09 07:40:32.754594-04
50	basket	0007_slugfield_noop	2016-08-09 07:40:33.193427-04
51	catalogue	0002_auto_20150217_1221	2016-08-09 07:40:33.667746-04
52	catalogue	0003_data_migration_slugs	2016-08-09 07:40:33.728174-04
53	catalogue	0004_auto_20150217_1710	2016-08-09 07:40:33.993762-04
54	catalogue	0005_auto_20150604_1450	2016-08-09 07:40:34.324546-04
55	catalogue	0006_auto_20150807_1725	2016-08-09 07:40:34.599371-04
56	catalogue	0007_auto_20151207_1440	2016-08-09 07:40:34.988851-04
57	catalogue	0008_auto_20160304_1652	2016-08-09 07:40:35.268298-04
58	catalogue	0009_slugfield_noop	2016-08-09 07:40:35.714098-04
59	customer	0002_auto_20150807_1725	2016-08-09 07:40:35.964735-04
60	customer	0003_update_email_length	2016-08-09 07:40:36.280737-04
61	offer	0002_auto_20151210_1053	2016-08-09 07:40:37.780445-04
62	order	0002_auto_20141007_2032	2016-08-09 07:40:38.016098-04
63	order	0003_auto_20150113_1629	2016-08-09 07:40:38.289663-04
64	order	0004_auto_20160111_1108	2016-08-09 07:40:38.551364-04
65	order	0005_update_email_length	2016-08-09 07:40:38.853156-04
66	partner	0002_auto_20141007_2032	2016-08-09 07:40:39.133165-04
67	partner	0003_auto_20150604_1450	2016-08-09 07:40:39.578148-04
68	partner	0004_auto_20160107_1755	2016-08-09 07:40:39.830049-04
69	payment	0001_initial	2016-08-09 07:40:41.530179-04
70	payment	0002_auto_20141007_2032	2016-08-09 07:40:41.801254-04
71	payment	0003_auto_20160323_1520	2016-08-09 07:40:42.117256-04
72	promotions	0001_initial	2016-08-09 07:40:45.414272-04
73	promotions	0002_auto_20150604_1450	2016-08-09 07:40:46.040768-04
74	reviews	0001_initial	2016-08-09 07:40:48.1272-04
75	reviews	0002_update_email_length	2016-08-09 07:40:48.488509-04
76	shipping	0001_initial	2016-08-09 07:40:50.234288-04
77	shipping	0002_auto_20150604_1450	2016-08-09 07:40:51.209833-04
78	thumbnail	0001_initial	2016-08-09 07:40:54.293348-04
79	wishlists	0001_initial	2016-08-09 07:40:55.986738-04
80	wishlists	0002_auto_20160111_1108	2016-08-09 07:40:56.322666-04
81	oscar_accounts	0001_initial	2016-08-09 11:27:53.273579-04
82	oscar_accounts	0002_core_accounts	2016-08-09 11:27:53.351667-04
83	oscar_accounts	0003_alter_ip_address	2016-08-09 11:27:53.415304-04
84	oscarapi	0001_initial	2016-08-09 11:27:53.576847-04
85	flatpages	0001_initial	2016-08-09 11:37:06.351442-04
86	pinax_stripe	0001_initial	2016-08-09 13:22:23.891002-04
87	pinax_stripe	0002_auto_20151205_1451	2016-08-09 13:22:23.986564-04
88	pinax_stripe	0003_make_cvc_check_blankable	2016-08-09 13:22:24.323355-04
89	shipping	0003_auto_20160809_2319	2016-08-09 23:19:39.074631-04
90	shipping	0003_auto_20160809_2342	2016-08-09 23:44:14.840965-04
91	oauth2_provider	0001_initial	2016-08-10 13:04:03.282142-04
92	oauth2_provider	0002_08_updates	2016-08-10 13:04:04.457608-04
93	oscar_wagtail	0001_initial	2016-08-10 15:04:35.891639-04
94	catalogue	0009_auto_20160810_2245	2016-08-11 00:01:25.818806-04
95	catalogue	0010_auto_20160810_2248	2016-08-11 00:01:26.619512-04
96	easy_thumbnails	0001_initial	2016-08-11 00:01:28.304497-04
97	easy_thumbnails	0002_thumbnaildimensions	2016-08-11 00:01:28.484323-04
98	shipping	0004_auto_20160810_2245	2016-08-11 00:01:45.239802-04
99	shipping	0005_auto_20160810_2248	2016-08-11 00:01:45.622115-04
100	shipping	0003_auto_20160811_1321	2016-08-11 13:24:02.769544-04
101	offer	0002_compoundcondition	2016-08-12 00:29:43.679195-04
102	offer	0003_merge	2016-08-12 00:29:43.953372-04
103	offer	0004_conditionaloffer_groups	2016-08-12 00:29:44.401255-04
104	offer	0005_auto_20160719_1238	2016-08-12 00:29:44.895995-04
105	voucher	0002_auto_20160503_1138	2016-08-12 00:29:59.93129-04
106	voucher	0003_voucher_parent	2016-08-12 00:30:00.369546-04
107	voucher	0004_auto_20160812_0030	2016-08-12 00:30:48.838163-04
108	catalogue	0011_merge	2016-08-12 00:35:49.737723-04
109	blog	0001_initial	2016-08-12 12:12:37.826789-04
110	blog	0002_auto_20150527_1555	2016-08-12 12:12:37.967773-04
111	conf	0001_initial	2016-08-12 12:12:38.16291-04
112	core	0001_initial	2016-08-12 12:12:38.45734-04
113	core	0002_auto_20150414_2140	2016-08-12 12:12:38.628035-04
114	django_comments	0001_initial	2016-08-12 12:12:39.145745-04
115	django_comments	0002_update_user_email_field_length	2016-08-12 12:12:39.240631-04
116	django_comments	0003_add_submit_date_index	2016-08-12 12:12:39.348156-04
117	pages	0001_initial	2016-08-12 12:12:39.814417-04
118	forms	0001_initial	2016-08-12 12:12:40.525474-04
119	forms	0002_auto_20141227_0224	2016-08-12 12:12:40.646454-04
120	forms	0003_emailfield	2016-08-12 12:12:40.739395-04
121	forms	0004_auto_20150517_0510	2016-08-12 12:12:40.823102-04
122	forms	0005_auto_20151026_1600	2016-08-12 12:12:40.911398-04
123	galleries	0001_initial	2016-08-12 12:12:41.249747-04
124	galleries	0002_auto_20141227_0224	2016-08-12 12:12:41.378385-04
125	generic	0001_initial	2016-08-12 12:12:42.249253-04
126	generic	0002_auto_20141227_0224	2016-08-12 12:12:42.383403-04
127	pages	0002_auto_20141227_0224	2016-08-12 12:12:42.541646-04
128	pages	0003_auto_20150527_1555	2016-08-12 12:12:42.658493-04
129	twitter	0001_initial	2016-08-12 12:12:43.014588-04
130	shipping	0004_auto_20160812_1738	2016-08-12 13:38:33.874976-04
131	shipping	0005_auto_20160812_1741	2016-08-12 13:41:15.502151-04
132	widgy	0001_initial	2016-08-12 18:04:56.161183-04
133	fluent_contents	0001_initial	2016-08-13 20:09:46.238752-04
134	code	0001_initial	2016-08-13 20:09:46.603546-04
135	gist	0001_initial	2016-08-13 20:09:53.742414-04
136	googledocsviewer	0001_initial	2016-08-13 20:09:54.137127-04
137	iframe	0001_initial	2016-08-13 20:09:54.504683-04
138	markup	0001_initial	2016-08-13 20:09:55.109212-04
139	oembeditem	0001_initial	2016-08-13 20:09:57.615626-04
140	picture	0001_initial	2016-08-13 20:10:05.093677-04
141	picture	0002_auto_20160813_2009	2016-08-13 20:10:05.457793-04
142	rawhtml	0001_initial	2016-08-13 20:10:13.94714-04
143	sharedcontent	0001_initial	2016-08-13 20:10:18.824745-04
144	text	0001_initial	2016-08-13 20:10:23.525814-04
145	text	0002_textitem_text_final	2016-08-13 20:10:23.98591-04
146	fluent	0001_initial	2016-08-13 20:17:56.389545-04
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_migrations_id_seq', 146, true);


--
-- Data for Name: django_redirect; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_redirect (id, site_id, old_path, new_path) FROM stdin;
\.


--
-- Name: django_redirect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_redirect_id_seq', 1, false);


--
-- Data for Name: django_rq_jobs_job; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_rq_jobs_job (id, task, args, schedule_type, repeats, next_run, last_run, rq_id, rq_origin) FROM stdin;
\.


--
-- Name: django_rq_jobs_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_rq_jobs_job_id_seq', 1, false);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
o06myvy1lcmjwrcv5ku80t3ndwxf5r8r	NmE2MDQ2NzlkOTZmNmFkZjFiMjY0NGRiOWQ3YzYxYWRiZTljZGFkNTp7Il9hdXRoX3VzZXJfaGFzaCI6IjdlNTEyMTQ4YWVlMTlkMDkwYmZjNWJkYjQ2NmY1YzI3NzQ1OTJiMzciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=	2016-08-16 07:08:11.712045-04
xu3427zr30xyvbse5ret9srgzgmed319	MmU0NTdjMjkxN2U1NGE3NmNmNzgzMDkyOTQxYTM1MWJlYmZlZTU3NDp7Il9hdXRoX3VzZXJfaGFzaCI6IjhhYWE2YTRiZWRhODE3ZjZlMmQ4MDZhODQ0ZGY2MDliZWUzMDkyYjgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJvc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2016-08-17 14:42:13.470976-04
16i3d901r7m3ybvdqon4cx5kjbq5n6un	MzM3YTAwMWIzZDUyMzQyN2NhNDQyN2ZjOGRhMmMwYzgwMjk1YmU1NTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwib2ZmZXJfd2l6YXJkIjp7fSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfbGFuZ3VhZ2UiOiJhZiIsImNoZWNrb3V0X29yZGVyX2lkIjozLCJfYXV0aF91c2VyX2hhc2giOiI3ZTUxMjE0OGFlZTE5ZDA5MGJmYzViZGI0NjZmNWMyNzc0NTkyYjM3IiwiY2hlY2tvdXRfZGF0YSI6eyJndWVzdCI6eyJlbWFpbCI6IndAZy5jb20ifSwic2hpcHBpbmciOnsidXNlcl9hZGRyZXNzX2lkIjoxLCJtZXRob2RfY29kZSI6ImZyZWUtc2hpcHBpbmcifX19	2016-08-17 12:24:07.379541-04
rx82tnbd3ywynl19y5wgh49ppdn300kp	YWM1ODVkMzY1NzExOGQ0YTQ5NGNjZWM1NTRiNWVmYzlmNjA3MjhjNzp7ImNoZWNrb3V0X29yZGVyX2lkIjo0LCJfYXV0aF91c2VyX2JhY2tlbmQiOiJvc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjExMTlmYjI1NjY2NGM3NGI2Zjk1OGI3ZDFlZDU1ZjliYzU1MTUwMCIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiY2hlY2tvdXRfZGF0YSI6e319	2016-08-25 00:24:02.817497-04
t2f3kd970645bwk109aoue7n2hnsczsi	NGYyMGNjNWE1MmU1YzVhMDUyNDk0ZTA5ZjU2NGI5NDk5YjZhYzFmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjIxMTE5ZmIyNTY2NjRjNzRiNmY5NThiN2QxZWQ1NWY5YmM1NTE1MDAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJvc2Nhci5hcHBzLmN1c3RvbWVyLmF1dGhfYmFja2VuZHMuRW1haWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==	2016-08-25 08:17:53.468976-04
zz2kfw6a86as4tbiq3npdrg3mysl0z9k	NzY3Njc0NDc1ZWJiMTA4M2M2NDNjYWVkNmVmNWE0OTJmNzljMTA1Mjp7Il9hdXRoX3VzZXJfaGFzaCI6IjU5ODYwZGRjOWE5M2U2MmJkZTVjZDY2YzkwZGNhMzk2ODUwMDEwMmEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJtZXp6YW5pbmUuY29yZS5hdXRoX2JhY2tlbmRzLk1lenphbmluZUJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSJ9	2016-08-26 12:14:51.066545-04
zkkynycjih8u2pjdjts1nhqol9lfrf2o	YjBkNjJlNjEwNTVmYzU0YjBlODQyODhjN2YxMDI5ODI3Njk5MmJlYjp7ImNoZWNrb3V0X2RhdGEiOnsic2hpcHBpbmciOnsidXNlcl9hZGRyZXNzX2lkIjoxLCJtZXRob2RfY29kZSI6ImZyZWUtc2hpcHBpbmcifX0sIl9hdXRoX3VzZXJfaGFzaCI6IjU5ODYwZGRjOWE5M2U2MmJkZTVjZDY2YzkwZGNhMzk2ODUwMDEwMmEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6Im1lenphbmluZS5jb3JlLmF1dGhfYmFja2VuZHMuTWV6emFuaW5lQmFja2VuZCJ9	2016-08-28 11:43:00.452377-04
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: root
--

COPY django_site (id, domain, name) FROM stdin;
1	bowanddrape.cms.3dact.com	bowanddrape.cms.3dact.com
2	bowanddrape.commerce.3dact.com	commerce
\.


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('django_site_id_seq', 2, true);


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_source_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Data for Name: fluent_contents_contentitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY fluent_contents_contentitem (id, parent_id, language_code, sort_order, parent_type_id, placeholder_id, polymorphic_ctype_id) FROM stdin;
\.


--
-- Name: fluent_contents_contentitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('fluent_contents_contentitem_id_seq', 1, false);


--
-- Data for Name: fluent_contents_placeholder; Type: TABLE DATA; Schema: public; Owner: root
--

COPY fluent_contents_placeholder (id, slot, role, parent_id, title, parent_type_id) FROM stdin;
\.


--
-- Name: fluent_contents_placeholder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('fluent_contents_placeholder_id_seq', 2, true);


--
-- Data for Name: fluent_coremodulpage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY fluent_coremodulpage (page_ptr_id, template_name) FROM stdin;
\.


--
-- Data for Name: forms_field; Type: TABLE DATA; Schema: public; Owner: root
--

COPY forms_field (id, _order, label, field_type, required, visible, choices, "default", placeholder_text, help_text, form_id) FROM stdin;
\.


--
-- Name: forms_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('forms_field_id_seq', 1, false);


--
-- Data for Name: forms_fieldentry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY forms_fieldentry (id, field_id, value, entry_id) FROM stdin;
\.


--
-- Name: forms_fieldentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('forms_fieldentry_id_seq', 1, false);


--
-- Data for Name: forms_form; Type: TABLE DATA; Schema: public; Owner: root
--

COPY forms_form (page_ptr_id, content, button_text, response, send_email, email_from, email_copies, email_subject, email_message) FROM stdin;
\.


--
-- Data for Name: forms_formentry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY forms_formentry (id, entry_time, form_id) FROM stdin;
\.


--
-- Name: forms_formentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('forms_formentry_id_seq', 1, false);


--
-- Data for Name: galleries_gallery; Type: TABLE DATA; Schema: public; Owner: root
--

COPY galleries_gallery (page_ptr_id, content, zip_import) FROM stdin;
\.


--
-- Data for Name: galleries_galleryimage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY galleries_galleryimage (id, _order, file, description, gallery_id) FROM stdin;
\.


--
-- Name: galleries_galleryimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('galleries_galleryimage_id_seq', 1, false);


--
-- Data for Name: generic_assignedkeyword; Type: TABLE DATA; Schema: public; Owner: root
--

COPY generic_assignedkeyword (id, _order, object_pk, content_type_id, keyword_id) FROM stdin;
\.


--
-- Name: generic_assignedkeyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('generic_assignedkeyword_id_seq', 1, false);


--
-- Data for Name: generic_keyword; Type: TABLE DATA; Schema: public; Owner: root
--

COPY generic_keyword (id, title, slug, site_id) FROM stdin;
\.


--
-- Name: generic_keyword_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('generic_keyword_id_seq', 1, false);


--
-- Data for Name: generic_rating; Type: TABLE DATA; Schema: public; Owner: root
--

COPY generic_rating (id, value, rating_date, object_pk, content_type_id, user_id) FROM stdin;
\.


--
-- Name: generic_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('generic_rating_id_seq', 1, false);


--
-- Data for Name: generic_threadedcomment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY generic_threadedcomment (comment_ptr_id, rating_count, rating_sum, rating_average, by_author, replied_to_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id) FROM stdin;
\.


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization) FROM stdin;
\.


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oauth2_provider_application_id_seq', 1, false);


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id) FROM stdin;
\.


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oauth2_provider_grant_id_seq', 1, false);


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id) FROM stdin;
\.


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Data for Name: offer_benefit; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_benefit (id, type, value, max_affected_items, proxy_class, range_id) FROM stdin;
1		1.00	10	oscar.apps.offer.benefits.PercentageDiscountBenefit	1
2		1.00	\N	oscar.apps.offer.benefits.PercentageDiscountBenefit	1
\.


--
-- Name: offer_benefit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_benefit_id_seq', 2, true);


--
-- Data for Name: offer_compoundcondition; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_compoundcondition (condition_ptr_id, conjunction) FROM stdin;
\.


--
-- Data for Name: offer_compoundcondition_subconditions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_compoundcondition_subconditions (id, compoundcondition_id, condition_id) FROM stdin;
\.


--
-- Name: offer_compoundcondition_subconditions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_compoundcondition_subconditions_id_seq', 1, false);


--
-- Data for Name: offer_condition; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_condition (id, type, value, proxy_class, range_id) FROM stdin;
1		1.00	oscar.apps.offer.conditions.CountCondition	1
2		1.00	oscar.apps.offer.conditions.CountCondition	1
\.


--
-- Name: offer_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_condition_id_seq', 2, true);


--
-- Data for Name: offer_conditionaloffer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_conditionaloffer (id, name, slug, description, offer_type, status, priority, start_datetime, end_datetime, max_global_applications, max_user_applications, max_basket_applications, max_discount, total_discount, num_applications, num_orders, redirect_url, date_created, benefit_id, condition_id) FROM stdin;
2	Offer for coupon 'Test Coupon'	offer-for-coupon-test-coupon		Voucher	Open	0	\N	\N	\N	\N	\N	\N	0.00	0	0		2016-08-10 15:07:15.221899-04	2	2
1	sample offer	sample-offer	<p>sample offer</p>	Site	Open	0	2016-08-10 00:00:00-04	2016-10-07 05:00:30-04	20	20	1	10.00	8.20	16	16		2016-08-10 00:05:40.138423-04	1	1
\.


--
-- Data for Name: offer_conditionaloffer_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_conditionaloffer_groups (id, conditionaloffer_id, group_id) FROM stdin;
\.


--
-- Name: offer_conditionaloffer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_conditionaloffer_groups_id_seq', 1, false);


--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_conditionaloffer_id_seq', 2, true);


--
-- Data for Name: offer_range; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_range (id, name, slug, description, is_public, includes_all_products, proxy_class, date_created) FROM stdin;
1	range	range	<p>some range</p>	t	t	\N	2016-08-10 00:03:04.422389-04
\.


--
-- Data for Name: offer_range_classes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_range_classes (id, range_id, productclass_id) FROM stdin;
\.


--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_range_classes_id_seq', 1, false);


--
-- Data for Name: offer_range_excluded_products; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_range_excluded_products (id, range_id, product_id) FROM stdin;
\.


--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_range_excluded_products_id_seq', 1, false);


--
-- Name: offer_range_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_range_id_seq', 1, true);


--
-- Data for Name: offer_range_included_categories; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_range_included_categories (id, range_id, category_id) FROM stdin;
\.


--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_range_included_categories_id_seq', 1, false);


--
-- Data for Name: offer_rangeproduct; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_rangeproduct (id, display_order, product_id, range_id) FROM stdin;
\.


--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_rangeproduct_id_seq', 1, false);


--
-- Data for Name: offer_rangeproductfileupload; Type: TABLE DATA; Schema: public; Owner: root
--

COPY offer_rangeproductfileupload (id, filepath, size, date_uploaded, status, error_message, date_processed, num_new_skus, num_unknown_skus, num_duplicate_skus, range_id, uploaded_by_id) FROM stdin;
\.


--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('offer_rangeproductfileupload_id_seq', 1, false);


--
-- Data for Name: order_billingaddress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_billingaddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, country_id) FROM stdin;
\.


--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_billingaddress_id_seq', 1, false);


--
-- Data for Name: order_communicationevent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_communicationevent (id, date_created, event_type_id, order_id) FROM stdin;
1	2016-08-10 15:29:27.317145-04	1	2
\.


--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_communicationevent_id_seq', 1, true);


--
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_line (id, partner_name, partner_sku, partner_line_reference, partner_line_notes, title, upc, quantity, line_price_incl_tax, line_price_excl_tax, line_price_before_discounts_incl_tax, line_price_before_discounts_excl_tax, unit_cost_price, unit_price_incl_tax, unit_price_excl_tax, unit_retail_price, status, est_dispatch_date, order_id, partner_id, product_id, stockrecord_id) FROM stdin;
1	Our Vendor	10211			Cool Sweatshirt	10012	3	60.00	60.00	60.00	60.00	20.00	20.00	20.00	20.00	Pending	\N	1	1	3	1
2	Our Vendor	10211			Cool Sweatshirt	10012	3	60.00	60.00	60.00	60.00	20.00	20.00	20.00	20.00	Pending	\N	2	1	3	1
3	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	3	1	3	1
4	Our Great Partner	1042			Our Partner's Line		1	10.00	9.00	10.00	10.00	\N	\N	\N	\N		\N	2	1	3	1
5	Our Vendor	10211			Cool Sweatshirt	10012	7	138.60	138.60	140.00	140.00	20.00	20.00	20.00	20.00	Pending	\N	4	1	3	1
6	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	5	1	3	1
9	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	7	1	3	1
10	Our Vendor	10211			Cool Sweatshirt	10012	4	79.20	79.20	80.00	80.00	20.00	20.00	20.00	20.00	Pending	\N	8	1	3	1
7	Our Vendor	103013			Cool T-Shirt	0101020	2	39.60	39.60	40.00	40.00	20.00	20.00	20.00	20.00	Pending	\N	6	1	\N	\N
8	Our Vendor	103013			Cool T-Shirt	0101020	2	39.60	39.60	40.00	40.00	20.00	20.00	20.00	20.00	Pending	\N	7	1	\N	\N
11	Our Vendor	19191			Cool T-Shirt	01231	2	39.60	39.60	40.00	40.00	20.00	20.00	20.00	20.00	Pending	\N	9	1	6	3
12	Our Vendor	10211			Cool Sweatshirt	10012	4	79.20	79.20	80.00	80.00	20.00	20.00	20.00	20.00	Pending	\N	10	1	3	1
13	Our Vendor	19191			Cool T-Shirt	01231	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	10	1	6	3
14	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	11	1	3	1
15	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	12	1	3	1
16	Our Vendor	19191			Cool T-Shirt	01231	3	59.40	59.40	60.00	60.00	20.00	20.00	20.00	20.00	Pending	\N	12	1	6	3
17	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	13	1	3	1
18	Our Vendor	19191			Cool T-Shirt	01231	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	13	1	6	3
19	Our Vendor	10211			Cool Sweatshirt	10012	2	39.60	39.60	40.00	40.00	20.00	20.00	20.00	20.00	Pending	\N	14	1	3	1
20	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	15	1	3	1
21	Our Vendor	19191			Cool T-Shirt	01231	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	15	1	6	3
22	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	16	1	3	1
23	Our Vendor	10211			Cool Sweatshirt	10012	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	17	1	3	1
24	Our Vendor	19191			Cool T-Shirt	01231	1	19.80	19.80	20.00	20.00	20.00	20.00	20.00	20.00	Pending	\N	18	1	6	3
25	Our Vendor	10211			Cool Sweatshirt	10012	2	39.60	39.60	40.00	40.00	20.00	20.00	20.00	20.00	Pending	\N	18	1	3	1
\.


--
-- Name: order_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_line_id_seq', 25, true);


--
-- Data for Name: order_lineattribute; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_lineattribute (id, type, value, line_id, option_id) FROM stdin;
\.


--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_lineattribute_id_seq', 1, false);


--
-- Data for Name: order_lineprice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_lineprice (id, quantity, price_incl_tax, price_excl_tax, shipping_incl_tax, shipping_excl_tax, line_id, order_id) FROM stdin;
1	3	20.00	20.00	0.00	0.00	1	1
2	3	20.00	20.00	0.00	0.00	2	2
3	1	19.80	19.80	0.00	0.00	3	3
4	7	19.80	19.80	0.00	0.00	5	4
5	1	19.80	19.80	0.00	0.00	6	5
6	2	19.80	19.80	0.00	0.00	7	6
7	2	19.80	19.80	0.00	0.00	8	7
8	1	19.80	19.80	0.00	0.00	9	7
9	4	19.80	19.80	0.00	0.00	10	8
10	2	19.80	19.80	0.00	0.00	11	9
11	4	19.80	19.80	0.00	0.00	12	10
12	1	19.80	19.80	0.00	0.00	13	10
13	1	19.80	19.80	0.00	0.00	14	11
14	1	19.80	19.80	0.00	0.00	15	12
15	3	19.80	19.80	0.00	0.00	16	12
16	1	19.80	19.80	0.00	0.00	17	13
17	1	19.80	19.80	0.00	0.00	18	13
18	2	19.80	19.80	0.00	0.00	19	14
19	1	19.80	19.80	0.00	0.00	20	15
20	1	19.80	19.80	0.00	0.00	21	15
21	1	19.80	19.80	0.00	0.00	22	16
22	1	19.80	19.80	0.00	0.00	23	17
23	1	19.80	19.80	0.00	0.00	24	18
24	2	19.80	19.80	0.00	0.00	25	18
\.


--
-- Name: order_lineprice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_lineprice_id_seq', 24, true);


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_order (id, number, currency, total_incl_tax, total_excl_tax, shipping_incl_tax, shipping_excl_tax, shipping_method, shipping_code, status, guest_email, date_placed, basket_id, billing_address_id, shipping_address_id, site_id, user_id) FROM stdin;
1	100005	USD	60.00	60.00	0.00	0.00	Free shipping	free-shipping	Pending	r@ggg.com	2016-08-09 23:11:21.920599-04	5	\N	1	1	\N
2	100001	USD	60.00	60.00	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-09 23:47:04.361926-04	1	\N	2	1	1
3	100007	USD	19.80	19.80	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-10 00:06:42.578886-04	7	\N	3	1	1
5	100012	USD	19.80	19.80	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-11 11:02:47.219572-04	12	\N	5	1	1
4	100008	USD	138.60	138.60	0.00	0.00	Free shipping	free-shipping	Cancelled		2016-08-11 00:24:02.515532-04	8	\N	4	1	1
6	100013	USD	39.60	39.60	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-11 12:00:49.6883-04	13	\N	6	1	1
7	100014	USD	59.40	59.40	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-11 12:21:32.492535-04	14	\N	7	1	1
8	100015	USD	79.20	79.20	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-11 12:29:31.303551-04	15	\N	8	1	1
9	100016	USD	39.60	39.60	0.00	0.00	Free shipping	free-shipping	Pending		2016-08-11 13:37:06.446241-04	16	\N	9	1	1
10	100017	USD	109.00	109.00	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 13:59:48.913723-04	17	\N	10	1	1
11	100018	USD	29.80	29.80	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 14:02:39.121891-04	18	\N	11	1	1
12	100019	USD	89.20	89.20	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 14:58:05.844395-04	19	\N	12	1	1
13	100020	USD	49.60	49.60	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 15:16:20.536041-04	20	\N	13	1	1
14	100021	USD	49.60	49.60	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 17:51:16.301245-04	21	\N	14	1	1
15	100022	USD	49.60	49.60	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-11 23:33:24.075184-04	22	\N	15	1	1
16	100023	USD	29.80	29.80	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-12 10:37:23.639558-04	23	\N	16	1	1
17	100024	USD	29.80	29.80	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-12 10:41:03.218107-04	24	\N	17	1	1
18	100025	USD	69.40	69.40	10.00	10.00	Fixed price shipping	fixed-price-shipping	Pending		2016-08-12 17:00:37.562504-04	25	\N	18	1	1
\.


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_order_id_seq', 18, true);


--
-- Data for Name: order_orderdiscount; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_orderdiscount (id, category, offer_id, offer_name, voucher_id, voucher_code, frequency, amount, message, order_id) FROM stdin;
1	Basket	1	sample offer	\N		1	0.20		3
2	Basket	1	sample offer	\N		1	1.40		4
3	Basket	1	sample offer	\N		1	0.20		5
4	Basket	1	sample offer	\N		1	0.40		6
5	Basket	1	sample offer	\N		1	0.60		7
6	Basket	1	sample offer	\N		1	0.80		8
7	Basket	1	sample offer	\N		1	0.40		9
8	Basket	1	sample offer	\N		1	1.00		10
9	Basket	1	sample offer	\N		1	0.20		11
10	Basket	1	sample offer	\N		1	0.80		12
11	Basket	1	sample offer	\N		1	0.40		13
12	Basket	1	sample offer	\N		1	0.40		14
13	Basket	1	sample offer	\N		1	0.40		15
14	Basket	1	sample offer	\N		1	0.20		16
15	Basket	1	sample offer	\N		1	0.20		17
16	Basket	1	sample offer	\N		1	0.60		18
\.


--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_orderdiscount_id_seq', 16, true);


--
-- Data for Name: order_ordernote; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_ordernote (id, note_type, message, date_created, date_updated, order_id, user_id) FROM stdin;
1	System	Order status changed from 'Pending' to 'Cancelled'	2016-08-11 11:08:15.693621-04	2016-08-11 11:08:15.693722-04	4	1
\.


--
-- Name: order_ordernote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_ordernote_id_seq', 1, true);


--
-- Data for Name: order_paymentevent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_paymentevent (id, amount, reference, date_created, event_type_id, order_id, shipping_event_id) FROM stdin;
\.


--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_paymentevent_id_seq', 1, false);


--
-- Data for Name: order_paymenteventquantity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_paymenteventquantity (id, quantity, event_id, line_id) FROM stdin;
\.


--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_paymenteventquantity_id_seq', 1, false);


--
-- Data for Name: order_paymenteventtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_paymenteventtype (id, name, code) FROM stdin;
1	Place in Escrow	place-in-escrow
2	Release from Escrow	release-from-escrow
3	Refund Issued	refund-issued
\.


--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_paymenteventtype_id_seq', 3, true);


--
-- Data for Name: order_shippingaddress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_shippingaddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, phone_number, notes, country_id) FROM stdin;
1	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D		Brooklyn	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York 11235 United States of America	+17184046471	Leave it under the door	US
2	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
3	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
4	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
5	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
6	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
7	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
8	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
9	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
10	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
11	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
12	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
13	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
14	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
15	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
16	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
17	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
18	Mr	Dmitry	Roitman	150 West End Avenue	Apt. 6D	Brooklyn	New York	New York	11235	Dmitry Roitman 150 West End Avenue Apt. 6D Brooklyn New York New York 11235 United States of America	+17184046471		US
\.


--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_shippingaddress_id_seq', 18, true);


--
-- Data for Name: order_shippingevent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_shippingevent (id, notes, date_created, event_type_id, order_id) FROM stdin;
\.


--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_shippingevent_id_seq', 1, false);


--
-- Data for Name: order_shippingeventquantity; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_shippingeventquantity (id, quantity, event_id, line_id) FROM stdin;
\.


--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_shippingeventquantity_id_seq', 1, false);


--
-- Data for Name: order_shippingeventtype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_shippingeventtype (id, name, code) FROM stdin;
1	Packaging	packaging
2	Processing	processing
3	Transit	transit
4	Returning	returning
\.


--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('order_shippingeventtype_id_seq', 4, true);


--
-- Data for Name: oscar_accounts_account; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_account (id, name, description, code, status, credit_limit, balance, start_date, end_date, can_be_used_for_non_products, date_created, account_type_id, primary_user_id, product_range_id) FROM stdin;
1	Account	account	\N	Open	0.00	0.00	2016-08-12 17:00:00-04	2016-08-31 20:00:00-04	t	2016-08-12 15:19:44.813988-04	1	1	1
\.


--
-- Name: oscar_accounts_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_account_id_seq', 1, true);


--
-- Data for Name: oscar_accounts_account_secondary_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_account_secondary_users (id, account_id, user_id) FROM stdin;
\.


--
-- Name: oscar_accounts_account_secondary_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_account_secondary_users_id_seq', 1, false);


--
-- Data for Name: oscar_accounts_accounttype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_accounttype (id, path, depth, numchild, code, name) FROM stdin;
3	accounttype	1	10	101	Deferred income
10	pathtwo	1	10	code	code
17	test	1	0	code3	code
16	TYPE	1	0	code_three	code
15	accounttype/defaccount/two	1	1	c1	deferred_income_one
1	accounttype/defaccount	1	1	def	deferred income
\.


--
-- Name: oscar_accounts_accounttype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_accounttype_id_seq', 17, true);


--
-- Data for Name: oscar_accounts_ipaddressrecord; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_ipaddressrecord (id, ip_address, total_failures, consecutive_failures, date_created, date_last_failure) FROM stdin;
\.


--
-- Name: oscar_accounts_ipaddressrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_ipaddressrecord_id_seq', 1, false);


--
-- Data for Name: oscar_accounts_transaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_transaction (id, amount, date_created, account_id, transfer_id) FROM stdin;
\.


--
-- Name: oscar_accounts_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_transaction_id_seq', 1, false);


--
-- Data for Name: oscar_accounts_transfer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_accounts_transfer (id, reference, amount, merchant_reference, description, username, date_created, destination_id, parent_id, source_id, user_id) FROM stdin;
\.


--
-- Name: oscar_accounts_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_accounts_transfer_id_seq', 1, false);


--
-- Data for Name: oscar_wagtail_productlistitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_wagtail_productlistitem (id, sort_order, parent_id, product_id) FROM stdin;
\.


--
-- Name: oscar_wagtail_productlistitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_wagtail_productlistitem_id_seq', 1, false);


--
-- Data for Name: oscar_wagtail_productlistsnippet; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscar_wagtail_productlistsnippet (id, title, code) FROM stdin;
\.


--
-- Name: oscar_wagtail_productlistsnippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscar_wagtail_productlistsnippet_id_seq', 1, false);


--
-- Data for Name: oscarapi_apikey; Type: TABLE DATA; Schema: public; Owner: root
--

COPY oscarapi_apikey (id, key) FROM stdin;
\.


--
-- Name: oscarapi_apikey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('oscarapi_apikey_id_seq', 1, false);


--
-- Data for Name: pages_link; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pages_link (page_ptr_id) FROM stdin;
\.


--
-- Data for Name: pages_page; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pages_page (id, keywords_string, title, slug, _meta_title, description, gen_description, created, updated, status, publish_date, expiry_date, short_url, in_sitemap, _order, in_menus, titles, content_model, login_required, parent_id, site_id) FROM stdin;
3		SHOP	contact		SHOP	t	2016-08-13 19:13:35.939091-04	2016-08-13 19:29:01.680601-04	2	2016-08-13 19:13:25-04	\N	\N	t	1	1,2,3	SHOP	richtextpage	f	\N	1
2		LIMITED EDITION	about		LIMITED EDITION	t	2016-08-13 19:12:18.29872-04	2016-08-13 19:29:24.866891-04	2	2016-08-13 19:12:14-04	\N	\N	t	2	1,2,3	LIMITED EDITION	richtextpage	f	\N	1
6		BRIDAL	bridal		BRIDAL	t	2016-08-13 19:32:02.10375-04	2016-08-13 19:32:02.10375-04	2	2016-08-13 19:31:55-04	\N	\N	t	3	1,2,3	BRIDAL	richtextpage	f	\N	1
7		PUNNY GIRLS	punny-girls		PUNNY GIRLS	t	2016-08-13 19:32:31.034696-04	2016-08-13 19:32:31.034696-04	2	2016-08-13 19:32:24-04	\N	\N	t	4	1,2,3	PUNNY GIRLS	richtextpage	f	\N	1
5		RHONY FANS!	rhony-fans		\nRHONY FANS!\n	t	2016-08-13 19:31:18.138598-04	2016-08-13 19:31:18.138598-04	2	2016-08-13 19:31:06-04	\N	\N	t	5	1,2,3	RHONY FANS!	richtextpage	f	\N	1
4		CUSTOMIZE YOUR OWN	customize-your-own		CUSTOMIZE YOUR OWN	t	2016-08-13 19:25:36.971319-04	2016-08-13 21:03:39.461599-04	2	2016-08-13 19:25:36-04	\N	\N	t	0	1,2,3	CUSTOMIZE YOUR OWN	richtextpage	f	\N	1
\.


--
-- Name: pages_page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pages_page_id_seq', 8, true);


--
-- Data for Name: pages_richtextpage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pages_richtextpage (page_ptr_id, content) FROM stdin;
3	<p>SHOP</p>
2	<p>LIMITED EDITION</p>
5	<ul class="top-major-list" id="top-major-list">\n<li><a class="top-major-list-item" href="http://www.bowanddrape.com/c/RHONY">RHONY FANS!</a></li>\n</ul>
6	<p>BRIDAL</p>
7	<p>PUNNY GIRLS</p>
4	<p><a class="top-major-list-item" href="http://www.bowanddrape.com/customize-your-own">CUSTOMIZE YOUR OWN</a></p>\r\n<div style="color:#ffaa44;width:120px;height:20px">TEST</div>
\.


--
-- Data for Name: partner_partner; Type: TABLE DATA; Schema: public; Owner: root
--

COPY partner_partner (id, code, name) FROM stdin;
1	our-vendor	Our Vendor
\.


--
-- Name: partner_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('partner_partner_id_seq', 1, true);


--
-- Data for Name: partner_partner_users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY partner_partner_users (id, partner_id, user_id) FROM stdin;
\.


--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('partner_partner_users_id_seq', 1, false);


--
-- Data for Name: partner_partneraddress; Type: TABLE DATA; Schema: public; Owner: root
--

COPY partner_partneraddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, country_id, partner_id) FROM stdin;
\.


--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('partner_partneraddress_id_seq', 1, false);


--
-- Data for Name: partner_stockalert; Type: TABLE DATA; Schema: public; Owner: root
--

COPY partner_stockalert (id, threshold, status, date_created, date_closed, stockrecord_id) FROM stdin;
1	10	Closed	2016-08-11 00:24:02.607544-04	2016-08-11 12:39:37.099393-04	1
3	10	Closed	2016-08-11 13:59:49.006431-04	2016-08-12 10:33:34.615727-04	1
\.


--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('partner_stockalert_id_seq', 3, true);


--
-- Data for Name: partner_stockrecord; Type: TABLE DATA; Schema: public; Owner: root
--

COPY partner_stockrecord (id, partner_sku, price_currency, price_excl_tax, price_retail, cost_price, num_in_stock, num_allocated, low_stock_threshold, date_created, date_updated, partner_id, product_id) FROM stdin;
3	19191	USD	20.00	20.00	20.00	20	9	5	2016-08-11 13:33:57.921625-04	2016-08-12 17:00:37.630189-04	1	6
1	10211	USD	20.00	20.00	20.00	50	34	10	2016-08-09 11:51:50.864439-04	2016-08-12 17:00:37.709115-04	1	3
\.


--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('partner_stockrecord_id_seq', 3, true);


--
-- Data for Name: payment_bankcard; Type: TABLE DATA; Schema: public; Owner: root
--

COPY payment_bankcard (id, card_type, name, number, expiry_date, partner_reference, user_id) FROM stdin;
\.


--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('payment_bankcard_id_seq', 1, false);


--
-- Data for Name: payment_source; Type: TABLE DATA; Schema: public; Owner: root
--

COPY payment_source (id, currency, amount_allocated, amount_debited, amount_refunded, reference, label, order_id, source_type_id) FROM stdin;
\.


--
-- Name: payment_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('payment_source_id_seq', 1, false);


--
-- Data for Name: payment_sourcetype; Type: TABLE DATA; Schema: public; Owner: root
--

COPY payment_sourcetype (id, name, code) FROM stdin;
\.


--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('payment_sourcetype_id_seq', 1, false);


--
-- Data for Name: payment_transaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY payment_transaction (id, txn_type, amount, reference, status, date_created, source_id) FROM stdin;
\.


--
-- Name: payment_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('payment_transaction_id_seq', 1, false);


--
-- Data for Name: paypal_expresstransaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY paypal_expresstransaction (id, raw_request, raw_response, response_time, date_created, method, version, amount, currency, ack, correlation_id, token, error_code, error_message) FROM stdin;
1	L_PAYMENTREQUEST_0_QTY1=2&L_PAYMENTREQUEST_0_QTY0=4&MAXAMT=118.80&L_PAYMENTREQUEST_0_QTY2=1&L_PAYMENTREQUEST_0_DESC2=Special+Offer%3A+sample+offer&L_PAYMENTREQUEST_0_DESC1=Cool+Sweatshirt&L_PAYMENTREQUEST_0_DESC0=Cool+T-Shirt&SHIPTOSTREET=150+West+End+Avenue&SHIPTOCITY=New+York&SHIPTONAME=Dmitry+Roitman&USER=sdk-three_api1.sdk.com&SIGNATURE=A-IzJhZZjhg29XQ2qnhapuwxIDzyAZQ92FRP5dqBzVesOkzbdUONzmOU&L_PAYMENTREQUEST_0_NAME1=Cool+Sweatshirt&SHIPTOCOUNTRYCODE=US&EMAIL=dmitryro%40gmail.com&SHIPTOZIP=11235&ALLOWNOTE=1&REQCONFIRMSHIPPING=0&CALLBACKTIMEOUT=3&PAYMENTREQUEST_0_AMT=128.80&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=118.80&RETURNURL=http%3A%2F%2Fbowanddrape.commerce.3dact.com%2Fcheckout%2Fpaypal%2Fpreview%2F26%2F&L_PAYMENTREQUEST_0_NAME0=Cool+T-Shirt&L_PAYMENTREQUEST_0_NAME2=Special+Offer%3A+sample+offer&PAYMENTREQUEST_0_CURRENCYCODE=USD&VERSION=119&PAYMENTREQUEST_0_MAXAMT=118.80&L_PAYMENTREQUEST_0_AMT2=-1.20&L_PAYMENTREQUEST_0_AMT1=20.00&L_PAYMENTREQUEST_0_AMT0=20.00&SHIPTOSTREET2=Apt.+6D&L_PAYMENTREQUEST_0_NUMBER1=10012&L_PAYMENTREQUEST_0_NUMBER0=01231&SHIPTOSTATE=NY&PWD=QFZCWN5HZM8VBG7Q&PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYMENTREQUEST_0_SHIPPINGAMT=10.00&CANCELURL=http%3A%2F%2Fbowanddrape.commerce.3dact.com%2Fcheckout%2Fpaypal%2Fcancel%2F26%2F&ADDROVERRIDE=1	TIMESTAMP=2016%2d08%2d14T21%3a47%3a01Z&CORRELATIONID=7fd5677c95f7c&ACK=Failure&VERSION=119&BUILD=24362847&L_ERRORCODE0=10736&L_SHORTMESSAGE0=Shipping%20Address%20Invalid%20City%20State%20Postal%20Code&L_LONGMESSAGE0=A%20match%20of%20the%20Shipping%20Address%20City%2c%20State%2c%20and%20Postal%20Code%20failed%2e&L_SEVERITYCODE0=Error	864.455938339233398	2016-08-14 17:47:01.144529-04	SetExpressCheckout	119	\N	\N	Failure	\N	\N	10736	A match of the Shipping Address City, State, and Postal Code failed.
2	L_PAYMENTREQUEST_0_QTY1=3&L_PAYMENTREQUEST_0_QTY0=5&MAXAMT=158.40&L_PAYMENTREQUEST_0_QTY2=1&L_PAYMENTREQUEST_0_DESC2=Special+Offer%3A+sample+offer&L_PAYMENTREQUEST_0_DESC1=Cool+Sweatshirt&L_PAYMENTREQUEST_0_DESC0=Cool+T-Shirt&SHIPTOSTREET=150+West+End+Avenue&SHIPTOCITY=Brooklyn&SHIPTONAME=Dmitry+Roitman&USER=sdk-three_api1.sdk.com&SIGNATURE=A-IzJhZZjhg29XQ2qnhapuwxIDzyAZQ92FRP5dqBzVesOkzbdUONzmOU&L_PAYMENTREQUEST_0_NAME1=Cool+Sweatshirt&SHIPTOCOUNTRYCODE=US&EMAIL=dmitryro%40gmail.com&SHIPTOZIP=11235&ALLOWNOTE=1&REQCONFIRMSHIPPING=0&CALLBACKTIMEOUT=3&PAYMENTREQUEST_0_AMT=168.40&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=158.40&RETURNURL=http%3A%2F%2Fbowanddrape.commerce.3dact.com%2Fcheckout%2Fpaypal%2Fpreview%2F26%2F&L_PAYMENTREQUEST_0_NAME0=Cool+T-Shirt&L_PAYMENTREQUEST_0_NAME2=Special+Offer%3A+sample+offer&PAYMENTREQUEST_0_CURRENCYCODE=USD&VERSION=119&PAYMENTREQUEST_0_MAXAMT=158.40&L_PAYMENTREQUEST_0_AMT2=-1.60&L_PAYMENTREQUEST_0_AMT1=20.00&L_PAYMENTREQUEST_0_AMT0=20.00&SHIPTOSTREET2=Apt.+6D&L_PAYMENTREQUEST_0_NUMBER1=10012&L_PAYMENTREQUEST_0_NUMBER0=01231&SHIPTOSTATE=NY&PWD=QFZCWN5HZM8VBG7Q&PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYMENTREQUEST_0_SHIPPINGAMT=10.00&CANCELURL=http%3A%2F%2Fbowanddrape.commerce.3dact.com%2Fcheckout%2Fpaypal%2Fcancel%2F26%2F&ADDROVERRIDE=1	TOKEN=EC%2d4H772841WY856190H&TIMESTAMP=2016%2d08%2d14T23%3a25%3a45Z&CORRELATIONID=16f5769af54&ACK=Success&VERSION=119&BUILD=24362847	773.972034454345703	2016-08-14 19:25:45.446645-04	SetExpressCheckout	119	168.40	USD	Success	16f5769af54	EC-4H772841WY856190H	\N	\N
3	L_PAYMENTREQUEST_0_QTY1=1&L_PAYMENTREQUEST_0_QTY0=1&MAXAMT=19.80&L_PAYMENTREQUEST_0_DESC1=Special+Offer%3A+sample+offer&L_PAYMENTREQUEST_0_DESC0=Cool+T-Shirt&REQCONFIRMSHIPPING=0&SHIPTOCITY=Brooklyn&SHIPTONAME=Dmitry+Roitman&USER=sdk-three_api1.sdk.com&SIGNATURE=A-IzJhZZjhg29XQ2qnhapuwxIDzyAZQ92FRP5dqBzVesOkzbdUONzmOU&L_PAYMENTREQUEST_0_NAME1=Special+Offer%3A+sample+offer&SHIPTOCOUNTRYCODE=US&ALLOWNOTE=1&SHIPTOZIP=11235&SHIPTOSTREET=150+West+End+Avenue&CALLBACKTIMEOUT=3&PAYMENTREQUEST_0_AMT=29.80&PAYMENTREQUEST_0_HANDLINGAMT=0.00&PAYMENTREQUEST_0_TAXAMT=0.00&METHOD=SetExpressCheckout&PAYMENTREQUEST_0_ITEMAMT=19.80&RETURNURL=http%3A%2F%2Fbowanddrape.3dact.com%2Fcheckout%2Fpaypal%2Fpreview%2F28%2F&L_PAYMENTREQUEST_0_NAME0=Cool+T-Shirt&PAYMENTREQUEST_0_CURRENCYCODE=USD&VERSION=119&PAYMENTREQUEST_0_MAXAMT=19.80&L_PAYMENTREQUEST_0_AMT1=-0.20&L_PAYMENTREQUEST_0_AMT0=20.00&SHIPTOSTREET2=Apt.+6D&L_PAYMENTREQUEST_0_NUMBER0=01231&SHIPTOSTATE=NY&PWD=QFZCWN5HZM8VBG7Q&PAYMENTREQUEST_0_PAYMENTACTION=Sale&PAYMENTREQUEST_0_SHIPPINGAMT=10.00&CANCELURL=http%3A%2F%2Fbowanddrape.3dact.com%2Fcheckout%2Fpaypal%2Fcancel%2F28%2F&ADDROVERRIDE=1	TOKEN=EC%2d1GM19581WH8362643&TIMESTAMP=2016%2d08%2d14T23%3a58%3a49Z&CORRELATIONID=7ba73340db6b2&ACK=Success&VERSION=119&BUILD=24362847	767.999172210693359	2016-08-14 19:58:49.286031-04	SetExpressCheckout	119	29.80	USD	Success	7ba73340db6b2	EC-1GM19581WH8362643	\N	\N
\.


--
-- Name: paypal_expresstransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('paypal_expresstransaction_id_seq', 3, true);


--
-- Data for Name: paypal_payflowtransaction; Type: TABLE DATA; Schema: public; Owner: root
--

COPY paypal_payflowtransaction (id, raw_request, raw_response, response_time, date_created, comment1, trxtype, tender, amount, pnref, ppref, result, respmsg, authcode, cvv2match, avsaddr, avszip) FROM stdin;
\.


--
-- Name: paypal_payflowtransaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('paypal_payflowtransaction_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_bitcoinreceiver; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_bitcoinreceiver (id, stripe_id, created_at, active, amount, amount_received, bitcoin_amount, bitcoin_amount_received, bitcoin_uri, currency, description, email, filled, inbound_address, payment, refund_address, uncaptured_funds, used_for_payment, customer_id) FROM stdin;
\.


--
-- Name: pinax_stripe_bitcoinreceiver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_bitcoinreceiver_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_card; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_card (id, stripe_id, created_at, name, address_line_1, address_line_1_check, address_line_2, address_city, address_state, address_country, address_zip, address_zip_check, brand, country, cvc_check, dynamic_last4, tokenization_method, exp_month, exp_year, funding, last4, fingerprint, customer_id) FROM stdin;
\.


--
-- Name: pinax_stripe_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_card_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_charge; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_charge (id, stripe_id, created_at, source, currency, amount, amount_refunded, description, paid, disputed, refunded, captured, receipt_sent, charge_created, customer_id, invoice_id) FROM stdin;
\.


--
-- Name: pinax_stripe_charge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_charge_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_customer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_customer (id, stripe_id, created_at, account_balance, currency, delinquent, default_source, date_purged, user_id) FROM stdin;
\.


--
-- Name: pinax_stripe_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_customer_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_event; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_event (id, stripe_id, created_at, kind, livemode, webhook_message, validated_message, valid, processed, request, pending_webhooks, api_version, customer_id) FROM stdin;
\.


--
-- Name: pinax_stripe_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_event_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_eventprocessingexception; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_eventprocessingexception (id, data, message, traceback, created_at, event_id) FROM stdin;
\.


--
-- Name: pinax_stripe_eventprocessingexception_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_eventprocessingexception_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_invoice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_invoice (id, stripe_id, created_at, amount_due, attempted, attempt_count, statement_descriptor, currency, closed, description, paid, receipt_number, period_end, period_start, subtotal, total, date, webhooks_delivered_at, charge_id, customer_id, subscription_id) FROM stdin;
\.


--
-- Name: pinax_stripe_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_invoice_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_invoiceitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_invoiceitem (id, stripe_id, created_at, amount, currency, kind, period_start, period_end, proration, line_type, description, quantity, invoice_id, plan_id, subscription_id) FROM stdin;
\.


--
-- Name: pinax_stripe_invoiceitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_invoiceitem_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_plan; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_plan (id, stripe_id, created_at, amount, currency, "interval", interval_count, name, statement_descriptor, trial_period_days) FROM stdin;
\.


--
-- Name: pinax_stripe_plan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_plan_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_subscription; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_subscription (id, stripe_id, created_at, application_fee_percent, cancel_at_period_end, canceled_at, current_period_end, current_period_start, ended_at, quantity, start, status, trial_end, trial_start, customer_id, plan_id) FROM stdin;
\.


--
-- Name: pinax_stripe_subscription_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_subscription_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_transfer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_transfer (id, stripe_id, created_at, amount, currency, status, date, description, event_id) FROM stdin;
\.


--
-- Name: pinax_stripe_transfer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_transfer_id_seq', 1, false);


--
-- Data for Name: pinax_stripe_transferchargefee; Type: TABLE DATA; Schema: public; Owner: root
--

COPY pinax_stripe_transferchargefee (id, amount, currency, application, description, kind, created_at, transfer_id) FROM stdin;
\.


--
-- Name: pinax_stripe_transferchargefee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('pinax_stripe_transferchargefee_id_seq', 1, false);


--
-- Data for Name: promotions_automaticproductlist; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_automaticproductlist (id, name, description, link_url, link_text, date_created, method, num_products) FROM stdin;
\.


--
-- Name: promotions_automaticproductlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_automaticproductlist_id_seq', 1, false);


--
-- Data for Name: promotions_handpickedproductlist; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_handpickedproductlist (id, name, description, link_url, link_text, date_created) FROM stdin;
\.


--
-- Name: promotions_handpickedproductlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_handpickedproductlist_id_seq', 1, false);


--
-- Data for Name: promotions_image; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_image (id, name, link_url, image, date_created) FROM stdin;
\.


--
-- Name: promotions_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_image_id_seq', 1, false);


--
-- Data for Name: promotions_keywordpromotion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_keywordpromotion (id, object_id, "position", display_order, clicks, date_created, keyword, filter, content_type_id) FROM stdin;
\.


--
-- Name: promotions_keywordpromotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_keywordpromotion_id_seq', 1, false);


--
-- Data for Name: promotions_multiimage; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_multiimage (id, name, date_created) FROM stdin;
\.


--
-- Name: promotions_multiimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_multiimage_id_seq', 1, false);


--
-- Data for Name: promotions_multiimage_images; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_multiimage_images (id, multiimage_id, image_id) FROM stdin;
\.


--
-- Name: promotions_multiimage_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_multiimage_images_id_seq', 1, false);


--
-- Data for Name: promotions_orderedproduct; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_orderedproduct (id, display_order, list_id, product_id) FROM stdin;
\.


--
-- Name: promotions_orderedproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_orderedproduct_id_seq', 1, false);


--
-- Data for Name: promotions_orderedproductlist; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_orderedproductlist (handpickedproductlist_ptr_id, display_order, tabbed_block_id) FROM stdin;
\.


--
-- Data for Name: promotions_pagepromotion; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_pagepromotion (id, object_id, "position", display_order, clicks, date_created, page_url, content_type_id) FROM stdin;
1	1	page	0	0	2016-08-13 19:16:01.857927-04	/about/	97
\.


--
-- Name: promotions_pagepromotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_pagepromotion_id_seq', 1, true);


--
-- Data for Name: promotions_rawhtml; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_rawhtml (id, name, display_type, body, date_created) FROM stdin;
1	Side Section		<strong>SECTION</strong>	2016-08-11 12:14:46.168344-04
\.


--
-- Name: promotions_rawhtml_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_rawhtml_id_seq', 1, true);


--
-- Data for Name: promotions_singleproduct; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_singleproduct (id, name, description, date_created, product_id) FROM stdin;
\.


--
-- Name: promotions_singleproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_singleproduct_id_seq', 1, false);


--
-- Data for Name: promotions_tabbedblock; Type: TABLE DATA; Schema: public; Owner: root
--

COPY promotions_tabbedblock (id, name, date_created) FROM stdin;
\.


--
-- Name: promotions_tabbedblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('promotions_tabbedblock_id_seq', 1, false);


--
-- Data for Name: registration_api_registrationprofile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY registration_api_registrationprofile (id, user_id, activation_key) FROM stdin;
\.


--
-- Name: registration_api_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('registration_api_registrationprofile_id_seq', 1, false);


--
-- Data for Name: registration_registrationprofile; Type: TABLE DATA; Schema: public; Owner: root
--

COPY registration_registrationprofile (id, activation_key, user_id) FROM stdin;
\.


--
-- Name: registration_registrationprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('registration_registrationprofile_id_seq', 1, false);


--
-- Data for Name: reviews_productreview; Type: TABLE DATA; Schema: public; Owner: root
--

COPY reviews_productreview (id, score, title, body, name, email, homepage, status, total_votes, delta_votes, date_created, product_id, user_id) FROM stdin;
1	5	Amazing Sweatshirt	I love it.				1	0	0	2016-08-09 11:52:39.104646-04	3	1
\.


--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('reviews_productreview_id_seq', 1, true);


--
-- Data for Name: reviews_vote; Type: TABLE DATA; Schema: public; Owner: root
--

COPY reviews_vote (id, delta, date_created, review_id, user_id) FROM stdin;
\.


--
-- Name: reviews_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('reviews_vote_id_seq', 1, false);


--
-- Data for Name: sharedcontent_sharedcontent; Type: TABLE DATA; Schema: public; Owner: root
--

COPY sharedcontent_sharedcontent (id, slug, is_cross_site, parent_site_id) FROM stdin;
\.


--
-- Name: sharedcontent_sharedcontent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('sharedcontent_sharedcontent_id_seq', 1, false);


--
-- Data for Name: sharedcontent_sharedcontent_translation; Type: TABLE DATA; Schema: public; Owner: root
--

COPY sharedcontent_sharedcontent_translation (id, language_code, title, master_id) FROM stdin;
\.


--
-- Name: sharedcontent_sharedcontent_translation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('sharedcontent_sharedcontent_translation_id_seq', 1, false);


--
-- Data for Name: shipping_orderanditemcharges; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_orderanditemcharges (id, code, name, description, price_per_order, price_per_item, free_shipping_threshold) FROM stdin;
\.


--
-- Data for Name: shipping_orderanditemcharges_countries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_orderanditemcharges_countries (id, orderanditemcharges_id, country_id) FROM stdin;
\.


--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_orderanditemcharges_countries_id_seq', 1, false);


--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_orderanditemcharges_id_seq', 1, false);


--
-- Data for Name: shipping_shippingcompany; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_shippingcompany (id, code, name, description, default_weight, api_user, api_key, api_type, origin, is_active, status, payment_type) FROM stdin;
\.


--
-- Data for Name: shipping_shippingcompany_containers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_shippingcompany_containers (id, shippingcompany_id, shippingcontainer_id) FROM stdin;
\.


--
-- Name: shipping_shippingcompany_containers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_shippingcompany_containers_id_seq', 1, false);


--
-- Data for Name: shipping_shippingcompany_countries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_shippingcompany_countries (id, shippingcompany_id, country_id) FROM stdin;
\.


--
-- Name: shipping_shippingcompany_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_shippingcompany_countries_id_seq', 1, false);


--
-- Name: shipping_shippingcompany_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_shippingcompany_id_seq', 1, false);


--
-- Data for Name: shipping_shippingcontainer; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_shippingcontainer (id, name, description, image, height, width, lenght, max_load) FROM stdin;
\.


--
-- Name: shipping_shippingcontainer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_shippingcontainer_id_seq', 1, false);


--
-- Data for Name: shipping_weightband; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_weightband (id, upper_limit, charge, method_id) FROM stdin;
\.


--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_weightband_id_seq', 1, false);


--
-- Data for Name: shipping_weightbased; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_weightbased (id, code, name, description, default_weight) FROM stdin;
\.


--
-- Data for Name: shipping_weightbased_countries; Type: TABLE DATA; Schema: public; Owner: root
--

COPY shipping_weightbased_countries (id, weightbased_id, country_id) FROM stdin;
\.


--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_weightbased_countries_id_seq', 1, false);


--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('shipping_weightbased_id_seq', 1, false);


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: root
--

COPY social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('social_auth_association_id_seq', 1, false);


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: root
--

COPY social_auth_code (id, email, code, verified) FROM stdin;
\.


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('social_auth_code_id_seq', 1, false);


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: root
--

COPY social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('social_auth_nonce_id_seq', 1, false);


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: root
--

COPY social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('social_auth_usersocialauth_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: root
--

COPY socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('socialaccount_socialaccount_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: root
--

COPY socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('socialaccount_socialapp_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: root
--

COPY socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('socialaccount_socialtoken_id_seq', 1, false);


--
-- Data for Name: tastypie_apiaccess; Type: TABLE DATA; Schema: public; Owner: root
--

COPY tastypie_apiaccess (id, identifier, url, request_method, accessed) FROM stdin;
\.


--
-- Name: tastypie_apiaccess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('tastypie_apiaccess_id_seq', 1, false);


--
-- Data for Name: tastypie_apikey; Type: TABLE DATA; Schema: public; Owner: root
--

COPY tastypie_apikey (id, key, created, user_id) FROM stdin;
\.


--
-- Name: tastypie_apikey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('tastypie_apikey_id_seq', 1, false);


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: root
--

COPY thumbnail_kvstore (key, value) FROM stdin;
sorl-thumbnail||image||cb1b9948a41929a3197946f81cd733d5	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a8/9f/a89fff85379697e380358539a48bcee6.jpg", "size": [133, 200]}
sorl-thumbnail||image||9d6e376c880cdd7849ef666c85de7deb	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/d6/13/d6134b4a239e767fab1e62ea790f94de.jpg", "size": [266, 400]}
sorl-thumbnail||image||ca97a43053bded6a4a7150681e8ca7e8	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/4c/10/4c107b329a0aa1e73bfff49f5767c621.jpg", "size": [103, 155]}
sorl-thumbnail||image||be3de440e6975993c6d69686d044fccd	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f6/06/f606a80d0cbc4f0c547ecefc3b4f267c.jpg", "size": [67, 100]}
oscar-sandbox||image||1cdc4eaf027e714ab4cfbee6e363e897	{"storage": "django.core.files.storage.FileSystemStorage", "name": "images/products/2016/08/image_shirt_ljNBxZC.jpg", "size": [286, 430]}
oscar-sandbox||image||faff7c3da69a5c7d1a5a67a6e41286a2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/23/de/23de17c6de8ca502ffbc9640349436ca.jpg", "size": [47, 70]}
oscar-sandbox||thumbnails||1cdc4eaf027e714ab4cfbee6e363e897	["faff7c3da69a5c7d1a5a67a6e41286a2"]
oscar-sandbox||image||dca1bb3f8ddb51795121199ed188da9f	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/95/9e/959e4acae16fbad16549f1e955842f94.jpg", "size": [103, 155]}
oscar-sandbox||image||85efc4f4b6a4e83ff0a528eccc4b1953	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/a9/0b/a90bb61822887800d872b7d14129a880.jpg", "size": [67, 100]}
oscar-sandbox||image||b6d5b9c0bd11e795f6bfc23a46102a55	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/bb/91/bb91344cf8ac1fcce5718b82a9b28fb3.jpg", "size": [266, 400]}
oscar-sandbox||image||23eeb84912defa185fd0d6d3861e1d23	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/92/97/92976db023e7e899fd9b11f123189e61.jpg", "size": [133, 200]}
oscar-sandbox||image||333d9bc5d06398a67bb04eb910e0936c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "image_not_found.jpg", "size": [400, 300]}
oscar-sandbox||image||703902d69ceadbcc077fe481ec2060f4	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/17/d5/17d59725435216b0e455fcb9659a84f3.jpg", "size": [100, 75]}
oscar-sandbox||thumbnails||333d9bc5d06398a67bb04eb910e0936c	["703902d69ceadbcc077fe481ec2060f4"]
oscar-sandbox||image||82d86649c337485d7ce16762750e524c	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ee/d6/eed6bcfd8732ca981f2d25a20233226c.jpg", "size": [207, 155]}
oscar-sandbox||image||8c49628853bc32a76a137c9ee14e9593	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/59/d3/59d3d8c74e03cbba3aed4051c18d6a8c.jpg", "size": [400, 300]}
oscar-sandbox||image||9abdd56e9fe48c5e148077069347df5a	{"storage": "django.core.files.storage.FileSystemStorage", "name": "images/products/2016/08/tease.jpg_canvas_430_430_5a44c8s.png", "size": [430, 430]}
oscar-sandbox||image||67eeee206b8379666e2422f577a2ed7e	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/c5/32/c532623062b017450ff14833ed18578a.jpg", "size": [200, 200]}
oscar-sandbox||thumbnails||9abdd56e9fe48c5e148077069347df5a	["67eeee206b8379666e2422f577a2ed7e"]
oscar-sandbox||image||8aebac185d01076476e2e306f94dc4f3	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/f2/2c/f22c28c37ae334e4a2d941e85f7c6eb6.jpg", "size": [70, 70]}
oscar-sandbox||image||af0280be6d6f2e3eeef8a3d68a269f22	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/ee/e6/eee634a36331170125fa07df263f3e35.jpg", "size": [155, 155]}
oscar-sandbox||image||424ccb47aa354f1b7af56910452b3cd2	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/09/5b/095b2a10c588743788b5d2cb60c4e8ce.jpg", "size": [100, 100]}
oscar-sandbox||image||45bce35562d37e87fb28fa98d9bae62d	{"storage": "django.core.files.storage.FileSystemStorage", "name": "cache/b9/48/b948a38fe4cfc3317bdc49b3803d1c30.jpg", "size": [400, 400]}
\.


--
-- Data for Name: twitter_query; Type: TABLE DATA; Schema: public; Owner: root
--

COPY twitter_query (id, type, value, interested) FROM stdin;
1	search	from:stephen_mcd mezzanine	t
\.


--
-- Name: twitter_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('twitter_query_id_seq', 1, true);


--
-- Data for Name: twitter_tweet; Type: TABLE DATA; Schema: public; Owner: root
--

COPY twitter_tweet (id, remote_id, created_at, text, profile_image_url, user_name, full_name, retweeter_profile_image_url, retweeter_user_name, retweeter_full_name, query_id) FROM stdin;
\.


--
-- Name: twitter_tweet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('twitter_tweet_id_seq', 1, false);


--
-- Data for Name: voucher_voucher; Type: TABLE DATA; Schema: public; Owner: root
--

COPY voucher_voucher (id, name, code, usage, start_datetime, end_datetime, num_basket_additions, num_orders, total_discount, date_created, limit_usage_by_group, parent_id) FROM stdin;
1	Test Coupon	101	Single use	2016-08-10 15:06:23-04	2016-09-01 15:06:23-04	0	0	0.00	2016-08-10	f	\N
\.


--
-- Data for Name: voucher_voucher_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY voucher_voucher_groups (id, voucher_id, group_id) FROM stdin;
\.


--
-- Name: voucher_voucher_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('voucher_voucher_groups_id_seq', 1, false);


--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('voucher_voucher_id_seq', 1, true);


--
-- Data for Name: voucher_voucher_offers; Type: TABLE DATA; Schema: public; Owner: root
--

COPY voucher_voucher_offers (id, voucher_id, conditionaloffer_id) FROM stdin;
1	1	2
\.


--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('voucher_voucher_offers_id_seq', 1, true);


--
-- Data for Name: voucher_voucherapplication; Type: TABLE DATA; Schema: public; Owner: root
--

COPY voucher_voucherapplication (id, date_created, order_id, user_id, voucher_id) FROM stdin;
\.


--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('voucher_voucherapplication_id_seq', 1, false);


--
-- Data for Name: widgy_node; Type: TABLE DATA; Schema: public; Owner: root
--

COPY widgy_node (id, path, depth, numchild, content_id, is_frozen, content_type_id) FROM stdin;
\.


--
-- Name: widgy_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('widgy_node_id_seq', 1, false);


--
-- Data for Name: widgy_versioncommit; Type: TABLE DATA; Schema: public; Owner: root
--

COPY widgy_versioncommit (id, created_at, message, publish_at, author_id, parent_id, root_node_id, tracker_id) FROM stdin;
\.


--
-- Name: widgy_versioncommit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('widgy_versioncommit_id_seq', 1, false);


--
-- Data for Name: widgy_versiontracker; Type: TABLE DATA; Schema: public; Owner: root
--

COPY widgy_versiontracker (id, head_id, working_copy_id) FROM stdin;
\.


--
-- Name: widgy_versiontracker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('widgy_versiontracker_id_seq', 1, false);


--
-- Data for Name: wishlists_line; Type: TABLE DATA; Schema: public; Owner: root
--

COPY wishlists_line (id, quantity, title, product_id, wishlist_id) FROM stdin;
1	1	Cool T-Shirt	6	1
\.


--
-- Name: wishlists_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('wishlists_line_id_seq', 1, true);


--
-- Data for Name: wishlists_wishlist; Type: TABLE DATA; Schema: public; Owner: root
--

COPY wishlists_wishlist (id, name, key, visibility, date_created, owner_id) FROM stdin;
1	Default Wish List	88641d	Private	2016-08-09 15:26:46.041302-04	1
\.


--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('wishlists_wishlist_id_seq', 1, true);


--
-- Name: account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: address_country_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_country
    ADD CONSTRAINT address_country_pkey PRIMARY KEY (iso_3166_1_a2);


--
-- Name: address_useraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_useraddress
    ADD CONSTRAINT address_useraddress_pkey PRIMARY KEY (id);


--
-- Name: address_useraddress_user_id_9d1738c7_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_useraddress
    ADD CONSTRAINT address_useraddress_user_id_9d1738c7_uniq UNIQUE (user_id, hash);


--
-- Name: admin_tools_dashboard_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_pkey PRIMARY KEY (id);


--
-- Name: admin_tools_dashboard_preferences_user_id_74da8e56_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferences_user_id_74da8e56_uniq UNIQUE (user_id, dashboard_id);


--
-- Name: admin_tools_menu_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_pkey PRIMARY KEY (id);


--
-- Name: analytics_productrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_productrecord
    ADD CONSTRAINT analytics_productrecord_pkey PRIMARY KEY (id);


--
-- Name: analytics_productrecord_product_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_productrecord
    ADD CONSTRAINT analytics_productrecord_product_id_key UNIQUE (product_id);


--
-- Name: analytics_userproductview_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userproductview
    ADD CONSTRAINT analytics_userproductview_pkey PRIMARY KEY (id);


--
-- Name: analytics_userrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_pkey PRIMARY KEY (id);


--
-- Name: analytics_userrecord_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_user_id_key UNIQUE (user_id);


--
-- Name: analytics_usersearch_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_usersearch
    ADD CONSTRAINT analytics_usersearch_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: basket_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket
    ADD CONSTRAINT basket_basket_pkey PRIMARY KEY (id);


--
-- Name: basket_basket_vouchers_basket_id_0731eee2_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket_vouchers
    ADD CONSTRAINT basket_basket_vouchers_basket_id_0731eee2_uniq UNIQUE (basket_id, voucher_id);


--
-- Name: basket_basket_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket_vouchers
    ADD CONSTRAINT basket_basket_vouchers_pkey PRIMARY KEY (id);


--
-- Name: basket_line_basket_id_8977e974_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line
    ADD CONSTRAINT basket_line_basket_id_8977e974_uniq UNIQUE (basket_id, line_reference);


--
-- Name: basket_line_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line
    ADD CONSTRAINT basket_line_pkey PRIMARY KEY (id);


--
-- Name: basket_lineattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_pkey PRIMARY KEY (id);


--
-- Name: blog_blogcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_categories_blogpost_id_a64d32c5_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_blogpost_id_a64d32c5_uniq UNIQUE (blogpost_id, blogcategory_id);


--
-- Name: blog_blogpost_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categories_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_pkey PRIMARY KEY (id);


--
-- Name: blog_blogpost_related_posts_from_blogpost_id_3bd0f49f_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_from_blogpost_id_3bd0f49f_uniq UNIQUE (from_blogpost_id, to_blogpost_id);


--
-- Name: blog_blogpost_related_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_related_posts_pkey PRIMARY KEY (id);


--
-- Name: catalogue_attributeoption_group_id_7a8f6c11_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoption
    ADD CONSTRAINT catalogue_attributeoption_group_id_7a8f6c11_uniq UNIQUE (group_id, option);


--
-- Name: catalogue_attributeoption_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoption
    ADD CONSTRAINT catalogue_attributeoption_pkey PRIMARY KEY (id);


--
-- Name: catalogue_attributeoptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoptiongroup
    ADD CONSTRAINT catalogue_attributeoptiongroup_pkey PRIMARY KEY (id);


--
-- Name: catalogue_category_path_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_category
    ADD CONSTRAINT catalogue_category_path_key UNIQUE (path);


--
-- Name: catalogue_category_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_category
    ADD CONSTRAINT catalogue_category_pkey PRIMARY KEY (id);


--
-- Name: catalogue_option_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_option
    ADD CONSTRAINT catalogue_option_code_key UNIQUE (code);


--
-- Name: catalogue_option_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_option
    ADD CONSTRAINT catalogue_option_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product
    ADD CONSTRAINT catalogue_product_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product_product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_product_options_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product_product_options_product_id_9b3abb31_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_product_options_product_id_9b3abb31_uniq UNIQUE (product_id, option_id);


--
-- Name: catalogue_product_upc_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product
    ADD CONSTRAINT catalogue_product_upc_key UNIQUE (upc);


--
-- Name: catalogue_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattribute
    ADD CONSTRAINT catalogue_productattribute_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productattributevalue_attribute_id_1e8e7112_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_attribute_id_1e8e7112_uniq UNIQUE (attribute_id, product_id);


--
-- Name: catalogue_productattributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productcategory_product_id_8f0dbfe2_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_product_id_8f0dbfe2_uniq UNIQUE (product_id, category_id);


--
-- Name: catalogue_productclass_options_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclass_options_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productclass_options_productclass_id_2266c635_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclass_options_productclass_id_2266c635_uniq UNIQUE (productclass_id, option_id);


--
-- Name: catalogue_productclass_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass
    ADD CONSTRAINT catalogue_productclass_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productclass_slug_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass
    ADD CONSTRAINT catalogue_productclass_slug_key UNIQUE (slug);


--
-- Name: catalogue_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productimage
    ADD CONSTRAINT catalogue_productimage_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productimage_product_id_2df78171_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productimage
    ADD CONSTRAINT catalogue_productimage_product_id_2df78171_uniq UNIQUE (product_id, display_order);


--
-- Name: catalogue_productrecommendation_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecommendation_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productrecommendation_primary_id_da1fdf43_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecommendation_primary_id_da1fdf43_uniq UNIQUE (primary_id, recommendation_id);


--
-- Name: conf_setting_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_pkey PRIMARY KEY (id);


--
-- Name: contentitem_code_codeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_code_codeitem
    ADD CONSTRAINT contentitem_code_codeitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_gist_gistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_gist_gistitem
    ADD CONSTRAINT contentitem_gist_gistitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_googledocsviewer_googledocsvieweritem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_googledocsviewer_googledocsvieweritem
    ADD CONSTRAINT contentitem_googledocsviewer_googledocsvieweritem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_iframe_iframeitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_iframe_iframeitem
    ADD CONSTRAINT contentitem_iframe_iframeitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_markup_markupitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_markup_markupitem
    ADD CONSTRAINT contentitem_markup_markupitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_oembeditem_oembeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_oembeditem_oembeditem
    ADD CONSTRAINT contentitem_oembeditem_oembeditem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_picture_pictureitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_picture_pictureitem
    ADD CONSTRAINT contentitem_picture_pictureitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_rawhtml_rawhtmlitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT contentitem_rawhtml_rawhtmlitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_sharedcontent_sharedcontentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT contentitem_sharedcontent_sharedcontentitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: contentitem_text_textitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_text_textitem
    ADD CONSTRAINT contentitem_text_textitem_pkey PRIMARY KEY (contentitem_ptr_id);


--
-- Name: core_sitepermission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_pkey PRIMARY KEY (id);


--
-- Name: core_sitepermission_sites_sitepermission_id_e3e7353a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_sitepermission_id_e3e7353a_uniq UNIQUE (sitepermission_id, site_id);


--
-- Name: core_sitepermission_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_key UNIQUE (user_id);


--
-- Name: customer_communicationeventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_communicationeventtype
    ADD CONSTRAINT customer_communicationeventtype_code_key UNIQUE (code);


--
-- Name: customer_communicationeventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_communicationeventtype
    ADD CONSTRAINT customer_communicationeventtype_pkey PRIMARY KEY (id);


--
-- Name: customer_email_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_email
    ADD CONSTRAINT customer_email_pkey PRIMARY KEY (id);


--
-- Name: customer_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_notification
    ADD CONSTRAINT customer_notification_pkey PRIMARY KEY (id);


--
-- Name: customer_productalert_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_productalert
    ADD CONSTRAINT customer_productalert_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_pkey PRIMARY KEY (id);


--
-- Name: django_comment_flags_user_id_537f77a7_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_537f77a7_uniq UNIQUE (user_id, comment_id, flag);


--
-- Name: django_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites_flatpage_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_pkey PRIMARY KEY (id);


--
-- Name: django_redirect_site_id_ac5dd16b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_ac5dd16b_uniq UNIQUE (site_id, old_path);


--
-- Name: django_rq_jobs_job_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_rq_jobs_job
    ADD CONSTRAINT django_rq_jobs_job_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source_storage_hash_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_storage_hash_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: fluent_contents_contentitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluent_contents_contentitem_pkey PRIMARY KEY (id);


--
-- Name: fluent_contents_placeholder_parent_type_id_93a6e260_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placeholder_parent_type_id_93a6e260_uniq UNIQUE (parent_type_id, parent_id, slot);


--
-- Name: fluent_contents_placeholder_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluent_contents_placeholder_pkey PRIMARY KEY (id);


--
-- Name: fluent_coremodulpage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_coremodulpage
    ADD CONSTRAINT fluent_coremodulpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: forms_field_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_pkey PRIMARY KEY (id);


--
-- Name: forms_fieldentry_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_pkey PRIMARY KEY (id);


--
-- Name: forms_form_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: forms_formentry_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_pkey PRIMARY KEY (id);


--
-- Name: galleries_gallery_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: galleries_galleryimage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT galleries_galleryimage_pkey PRIMARY KEY (id);


--
-- Name: generic_assignedkeyword_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeyword_pkey PRIMARY KEY (id);


--
-- Name: generic_keyword_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_pkey PRIMARY KEY (id);


--
-- Name: generic_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_pkey PRIMARY KEY (id);


--
-- Name: generic_threadedcomment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_threadedcomment_pkey PRIMARY KEY (comment_ptr_id);


--
-- Name: oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: offer_benefit_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_benefit
    ADD CONSTRAINT offer_benefit_pkey PRIMARY KEY (id);


--
-- Name: offer_compoundcondition_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition
    ADD CONSTRAINT offer_compoundcondition_pkey PRIMARY KEY (condition_ptr_id);


--
-- Name: offer_compoundcondition_subc_compoundcondition_id_1211021a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition_subconditions
    ADD CONSTRAINT offer_compoundcondition_subc_compoundcondition_id_1211021a_uniq UNIQUE (compoundcondition_id, condition_id);


--
-- Name: offer_compoundcondition_subconditions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition_subconditions
    ADD CONSTRAINT offer_compoundcondition_subconditions_pkey PRIMARY KEY (id);


--
-- Name: offer_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_condition
    ADD CONSTRAINT offer_condition_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer_groups_conditionaloffer_id_0fd01892_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer_groups
    ADD CONSTRAINT offer_conditionaloffer_groups_conditionaloffer_id_0fd01892_uniq UNIQUE (conditionaloffer_id, group_id);


--
-- Name: offer_conditionaloffer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer_groups
    ADD CONSTRAINT offer_conditionaloffer_groups_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_name_key UNIQUE (name);


--
-- Name: offer_conditionaloffer_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer_slug_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_slug_key UNIQUE (slug);


--
-- Name: offer_range_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_classes
    ADD CONSTRAINT offer_range_classes_pkey PRIMARY KEY (id);


--
-- Name: offer_range_classes_range_id_28eeefae_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_classes
    ADD CONSTRAINT offer_range_classes_range_id_28eeefae_uniq UNIQUE (range_id, productclass_id);


--
-- Name: offer_range_excluded_products_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_excluded_products
    ADD CONSTRAINT offer_range_excluded_products_pkey PRIMARY KEY (id);


--
-- Name: offer_range_excluded_products_range_id_eb1cfe87_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_excluded_products
    ADD CONSTRAINT offer_range_excluded_products_range_id_eb1cfe87_uniq UNIQUE (range_id, product_id);


--
-- Name: offer_range_included_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_included_categories
    ADD CONSTRAINT offer_range_included_categories_pkey PRIMARY KEY (id);


--
-- Name: offer_range_included_categories_range_id_a661d336_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_included_categories
    ADD CONSTRAINT offer_range_included_categories_range_id_a661d336_uniq UNIQUE (range_id, category_id);


--
-- Name: offer_range_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range
    ADD CONSTRAINT offer_range_name_key UNIQUE (name);


--
-- Name: offer_range_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range
    ADD CONSTRAINT offer_range_pkey PRIMARY KEY (id);


--
-- Name: offer_range_proxy_class_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range
    ADD CONSTRAINT offer_range_proxy_class_key UNIQUE (proxy_class);


--
-- Name: offer_range_slug_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range
    ADD CONSTRAINT offer_range_slug_key UNIQUE (slug);


--
-- Name: offer_rangeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_pkey PRIMARY KEY (id);


--
-- Name: offer_rangeproduct_range_id_c46b1be8_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_range_id_c46b1be8_uniq UNIQUE (range_id, product_id);


--
-- Name: offer_rangeproductfileupload_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfileupload_pkey PRIMARY KEY (id);


--
-- Name: order_billingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_billingaddress
    ADD CONSTRAINT order_billingaddress_pkey PRIMARY KEY (id);


--
-- Name: order_communicationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_communicationevent
    ADD CONSTRAINT order_communicationevent_pkey PRIMARY KEY (id);


--
-- Name: order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_pkey PRIMARY KEY (id);


--
-- Name: order_lineattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineattribute
    ADD CONSTRAINT order_lineattribute_pkey PRIMARY KEY (id);


--
-- Name: order_lineprice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineprice
    ADD CONSTRAINT order_lineprice_pkey PRIMARY KEY (id);


--
-- Name: order_order_number_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_order_number_key UNIQUE (number);


--
-- Name: order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_orderdiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_orderdiscount
    ADD CONSTRAINT order_orderdiscount_pkey PRIMARY KEY (id);


--
-- Name: order_ordernote_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_ordernote
    ADD CONSTRAINT order_ordernote_pkey PRIMARY KEY (id);


--
-- Name: order_paymentevent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymentevent
    ADD CONSTRAINT order_paymentevent_pkey PRIMARY KEY (id);


--
-- Name: order_paymenteventquantity_event_id_765c5209_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_event_id_765c5209_uniq UNIQUE (event_id, line_id);


--
-- Name: order_paymenteventquantity_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_pkey PRIMARY KEY (id);


--
-- Name: order_paymenteventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_code_key UNIQUE (code);


--
-- Name: order_paymenteventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_name_key UNIQUE (name);


--
-- Name: order_paymenteventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_pkey PRIMARY KEY (id);


--
-- Name: order_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingaddress
    ADD CONSTRAINT order_shippingaddress_pkey PRIMARY KEY (id);


--
-- Name: order_shippingevent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingevent
    ADD CONSTRAINT order_shippingevent_pkey PRIMARY KEY (id);


--
-- Name: order_shippingeventquantity_event_id_91687107_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_event_id_91687107_uniq UNIQUE (event_id, line_id);


--
-- Name: order_shippingeventquantity_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_pkey PRIMARY KEY (id);


--
-- Name: order_shippingeventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_code_key UNIQUE (code);


--
-- Name: order_shippingeventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_name_key UNIQUE (name);


--
-- Name: order_shippingeventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_account_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_accounts_account_code_key UNIQUE (code);


--
-- Name: oscar_accounts_account_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_accounts_account_name_key UNIQUE (name);


--
-- Name: oscar_accounts_account_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_accounts_account_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_account_secondary_users_account_id_87e6566a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account_secondary_users
    ADD CONSTRAINT oscar_accounts_account_secondary_users_account_id_87e6566a_uniq UNIQUE (account_id, user_id);


--
-- Name: oscar_accounts_account_secondary_users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account_secondary_users
    ADD CONSTRAINT oscar_accounts_account_secondary_users_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_accounttype_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_accounttype
    ADD CONSTRAINT oscar_accounts_accounttype_code_key UNIQUE (code);


--
-- Name: oscar_accounts_accounttype_path_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_accounttype
    ADD CONSTRAINT oscar_accounts_accounttype_path_key UNIQUE (path);


--
-- Name: oscar_accounts_accounttype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_accounttype
    ADD CONSTRAINT oscar_accounts_accounttype_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_ipaddressrecord_ip_address_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_ipaddressrecord
    ADD CONSTRAINT oscar_accounts_ipaddressrecord_ip_address_key UNIQUE (ip_address);


--
-- Name: oscar_accounts_ipaddressrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_ipaddressrecord
    ADD CONSTRAINT oscar_accounts_ipaddressrecord_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transaction
    ADD CONSTRAINT oscar_accounts_transaction_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_transaction_transfer_id_051060d4_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transaction
    ADD CONSTRAINT oscar_accounts_transaction_transfer_id_051060d4_uniq UNIQUE (transfer_id, account_id);


--
-- Name: oscar_accounts_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_accounts_transfer_pkey PRIMARY KEY (id);


--
-- Name: oscar_accounts_transfer_reference_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_accounts_transfer_reference_key UNIQUE (reference);


--
-- Name: oscar_wagtail_productlistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistitem
    ADD CONSTRAINT oscar_wagtail_productlistitem_pkey PRIMARY KEY (id);


--
-- Name: oscar_wagtail_productlistsnippet_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistsnippet
    ADD CONSTRAINT oscar_wagtail_productlistsnippet_code_key UNIQUE (code);


--
-- Name: oscar_wagtail_productlistsnippet_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistsnippet
    ADD CONSTRAINT oscar_wagtail_productlistsnippet_pkey PRIMARY KEY (id);


--
-- Name: oscarapi_apikey_key_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscarapi_apikey
    ADD CONSTRAINT oscarapi_apikey_key_key UNIQUE (key);


--
-- Name: oscarapi_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscarapi_apikey
    ADD CONSTRAINT oscarapi_apikey_pkey PRIMARY KEY (id);


--
-- Name: pages_link_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: pages_page_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_pkey PRIMARY KEY (id);


--
-- Name: pages_richtextpage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_pkey PRIMARY KEY (page_ptr_id);


--
-- Name: partner_partner_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner
    ADD CONSTRAINT partner_partner_code_key UNIQUE (code);


--
-- Name: partner_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner
    ADD CONSTRAINT partner_partner_pkey PRIMARY KEY (id);


--
-- Name: partner_partner_users_partner_id_9e5c0517_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner_users
    ADD CONSTRAINT partner_partner_users_partner_id_9e5c0517_uniq UNIQUE (partner_id, user_id);


--
-- Name: partner_partner_users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner_users
    ADD CONSTRAINT partner_partner_users_pkey PRIMARY KEY (id);


--
-- Name: partner_partneraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partneraddress
    ADD CONSTRAINT partner_partneraddress_pkey PRIMARY KEY (id);


--
-- Name: partner_stockalert_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockalert
    ADD CONSTRAINT partner_stockalert_pkey PRIMARY KEY (id);


--
-- Name: partner_stockrecord_partner_id_8441e010_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_partner_id_8441e010_uniq UNIQUE (partner_id, partner_sku);


--
-- Name: partner_stockrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_pkey PRIMARY KEY (id);


--
-- Name: payment_bankcard_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_bankcard
    ADD CONSTRAINT payment_bankcard_pkey PRIMARY KEY (id);


--
-- Name: payment_source_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_source
    ADD CONSTRAINT payment_source_pkey PRIMARY KEY (id);


--
-- Name: payment_sourcetype_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_sourcetype
    ADD CONSTRAINT payment_sourcetype_code_key UNIQUE (code);


--
-- Name: payment_sourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_sourcetype
    ADD CONSTRAINT payment_sourcetype_pkey PRIMARY KEY (id);


--
-- Name: payment_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_transaction
    ADD CONSTRAINT payment_transaction_pkey PRIMARY KEY (id);


--
-- Name: paypal_expresstransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY paypal_expresstransaction
    ADD CONSTRAINT paypal_expresstransaction_pkey PRIMARY KEY (id);


--
-- Name: paypal_payflowtransaction_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY paypal_payflowtransaction
    ADD CONSTRAINT paypal_payflowtransaction_pkey PRIMARY KEY (id);


--
-- Name: paypal_payflowtransaction_ppref_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY paypal_payflowtransaction
    ADD CONSTRAINT paypal_payflowtransaction_ppref_key UNIQUE (ppref);


--
-- Name: pinax_stripe_bitcoinreceiver_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_bitcoinreceiver
    ADD CONSTRAINT pinax_stripe_bitcoinreceiver_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_bitcoinreceiver_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_bitcoinreceiver
    ADD CONSTRAINT pinax_stripe_bitcoinreceiver_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_card_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_card
    ADD CONSTRAINT pinax_stripe_card_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_card_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_card
    ADD CONSTRAINT pinax_stripe_card_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_charge_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_charge
    ADD CONSTRAINT pinax_stripe_charge_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_charge_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_charge
    ADD CONSTRAINT pinax_stripe_charge_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_customer
    ADD CONSTRAINT pinax_stripe_customer_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_customer_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_customer
    ADD CONSTRAINT pinax_stripe_customer_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_customer_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_customer
    ADD CONSTRAINT pinax_stripe_customer_user_id_key UNIQUE (user_id);


--
-- Name: pinax_stripe_event_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_event
    ADD CONSTRAINT pinax_stripe_event_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_event_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_event
    ADD CONSTRAINT pinax_stripe_event_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_eventprocessingexception_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_eventprocessingexception
    ADD CONSTRAINT pinax_stripe_eventprocessingexception_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice
    ADD CONSTRAINT pinax_stripe_invoice_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_invoice_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice
    ADD CONSTRAINT pinax_stripe_invoice_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_invoiceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoiceitem
    ADD CONSTRAINT pinax_stripe_invoiceitem_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_plan_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_plan
    ADD CONSTRAINT pinax_stripe_plan_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_plan_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_plan
    ADD CONSTRAINT pinax_stripe_plan_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_subscription_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_subscription
    ADD CONSTRAINT pinax_stripe_subscription_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_subscription_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_subscription
    ADD CONSTRAINT pinax_stripe_subscription_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_transfer_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transfer
    ADD CONSTRAINT pinax_stripe_transfer_pkey PRIMARY KEY (id);


--
-- Name: pinax_stripe_transfer_stripe_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transfer
    ADD CONSTRAINT pinax_stripe_transfer_stripe_id_key UNIQUE (stripe_id);


--
-- Name: pinax_stripe_transferchargefee_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transferchargefee
    ADD CONSTRAINT pinax_stripe_transferchargefee_pkey PRIMARY KEY (id);


--
-- Name: promotions_automaticproductlist_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_automaticproductlist
    ADD CONSTRAINT promotions_automaticproductlist_pkey PRIMARY KEY (id);


--
-- Name: promotions_handpickedproductlist_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_handpickedproductlist
    ADD CONSTRAINT promotions_handpickedproductlist_pkey PRIMARY KEY (id);


--
-- Name: promotions_image_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_image
    ADD CONSTRAINT promotions_image_pkey PRIMARY KEY (id);


--
-- Name: promotions_keywordpromotion_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_keywordpromotion
    ADD CONSTRAINT promotions_keywordpromotion_pkey PRIMARY KEY (id);


--
-- Name: promotions_multiimage_images_multiimage_id_29363bca_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage_images
    ADD CONSTRAINT promotions_multiimage_images_multiimage_id_29363bca_uniq UNIQUE (multiimage_id, image_id);


--
-- Name: promotions_multiimage_images_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage_images
    ADD CONSTRAINT promotions_multiimage_images_pkey PRIMARY KEY (id);


--
-- Name: promotions_multiimage_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage
    ADD CONSTRAINT promotions_multiimage_pkey PRIMARY KEY (id);


--
-- Name: promotions_orderedproduct_list_id_1e22874a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproduct
    ADD CONSTRAINT promotions_orderedproduct_list_id_1e22874a_uniq UNIQUE (list_id, product_id);


--
-- Name: promotions_orderedproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproduct
    ADD CONSTRAINT promotions_orderedproduct_pkey PRIMARY KEY (id);


--
-- Name: promotions_orderedproductlist_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproductlist
    ADD CONSTRAINT promotions_orderedproductlist_pkey PRIMARY KEY (handpickedproductlist_ptr_id);


--
-- Name: promotions_pagepromotion_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_pagepromotion
    ADD CONSTRAINT promotions_pagepromotion_pkey PRIMARY KEY (id);


--
-- Name: promotions_rawhtml_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_rawhtml
    ADD CONSTRAINT promotions_rawhtml_pkey PRIMARY KEY (id);


--
-- Name: promotions_singleproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_singleproduct
    ADD CONSTRAINT promotions_singleproduct_pkey PRIMARY KEY (id);


--
-- Name: promotions_tabbedblock_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_tabbedblock
    ADD CONSTRAINT promotions_tabbedblock_pkey PRIMARY KEY (id);


--
-- Name: registration_api_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_api_registrationprofile
    ADD CONSTRAINT registration_api_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_api_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_api_registrationprofile
    ADD CONSTRAINT registration_api_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: registration_registrationprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_pkey PRIMARY KEY (id);


--
-- Name: registration_registrationprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofile_user_id_key UNIQUE (user_id);


--
-- Name: reviews_productreview_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_productreview
    ADD CONSTRAINT reviews_productreview_pkey PRIMARY KEY (id);


--
-- Name: reviews_productreview_product_id_c4fdc4cd_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_productreview
    ADD CONSTRAINT reviews_productreview_product_id_c4fdc4cd_uniq UNIQUE (product_id, user_id);


--
-- Name: reviews_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_vote
    ADD CONSTRAINT reviews_vote_pkey PRIMARY KEY (id);


--
-- Name: reviews_vote_user_id_bb858939_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_vote
    ADD CONSTRAINT reviews_vote_user_id_bb858939_uniq UNIQUE (user_id, review_id);


--
-- Name: sharedcontent_sharedcontent_parent_site_id_f384bc82_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedcontent_parent_site_id_f384bc82_uniq UNIQUE (parent_site_id, slug);


--
-- Name: sharedcontent_sharedcontent_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedcontent_pkey PRIMARY KEY (id);


--
-- Name: sharedcontent_sharedcontent_transla_language_code_5b41670f_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcontent_transla_language_code_5b41670f_uniq UNIQUE (language_code, master_id);


--
-- Name: sharedcontent_sharedcontent_translation_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcontent_sharedcontent_translation_pkey PRIMARY KEY (id);


--
-- Name: shipping_orderanditemcharg_orderanditemcharges_id_9f0c9c8f_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_orderanditemcharg_orderanditemcharges_id_9f0c9c8f_uniq UNIQUE (orderanditemcharges_id, country_id);


--
-- Name: shipping_orderanditemcharges_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_code_key UNIQUE (code);


--
-- Name: shipping_orderanditemcharges_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_orderanditemcharges_countries_pkey PRIMARY KEY (id);


--
-- Name: shipping_orderanditemcharges_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_name_key UNIQUE (name);


--
-- Name: shipping_orderanditemcharges_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingcompany_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany
    ADD CONSTRAINT shipping_shippingcompany_code_key UNIQUE (code);


--
-- Name: shipping_shippingcompany_conta_shippingcompany_id_12a6eee1_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_containers
    ADD CONSTRAINT shipping_shippingcompany_conta_shippingcompany_id_12a6eee1_uniq UNIQUE (shippingcompany_id, shippingcontainer_id);


--
-- Name: shipping_shippingcompany_containers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_containers
    ADD CONSTRAINT shipping_shippingcompany_containers_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingcompany_count_shippingcompany_id_0b8d918b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_countries
    ADD CONSTRAINT shipping_shippingcompany_count_shippingcompany_id_0b8d918b_uniq UNIQUE (shippingcompany_id, country_id);


--
-- Name: shipping_shippingcompany_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_countries
    ADD CONSTRAINT shipping_shippingcompany_countries_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingcompany_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany
    ADD CONSTRAINT shipping_shippingcompany_name_key UNIQUE (name);


--
-- Name: shipping_shippingcompany_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany
    ADD CONSTRAINT shipping_shippingcompany_pkey PRIMARY KEY (id);


--
-- Name: shipping_shippingcontainer_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcontainer
    ADD CONSTRAINT shipping_shippingcontainer_name_key UNIQUE (name);


--
-- Name: shipping_shippingcontainer_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcontainer
    ADD CONSTRAINT shipping_shippingcontainer_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightband_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightband
    ADD CONSTRAINT shipping_weightband_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightbased_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_code_key UNIQUE (code);


--
-- Name: shipping_weightbased_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased_countries
    ADD CONSTRAINT shipping_weightbased_countries_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightbased_countries_weightbased_id_de8c5e42_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased_countries
    ADD CONSTRAINT shipping_weightbased_countries_weightbased_id_de8c5e42_uniq UNIQUE (weightbased_id, country_id);


--
-- Name: shipping_weightbased_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_name_key UNIQUE (name);


--
-- Name: shipping_weightbased_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_code_email_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_email_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce_server_url_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth_provider_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount_provider_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_socialapp_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialtoken_app_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apiaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apiaccess
    ADD CONSTRAINT tastypie_apiaccess_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apikey_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_pkey PRIMARY KEY (id);


--
-- Name: tastypie_apikey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_key UNIQUE (user_id);


--
-- Name: thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: twitter_query_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY twitter_query
    ADD CONSTRAINT twitter_query_pkey PRIMARY KEY (id);


--
-- Name: twitter_tweet_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucher_code_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher
    ADD CONSTRAINT voucher_voucher_code_key UNIQUE (code);


--
-- Name: voucher_voucher_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_groups
    ADD CONSTRAINT voucher_voucher_groups_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucher_groups_voucher_id_41660bbe_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_groups
    ADD CONSTRAINT voucher_voucher_groups_voucher_id_41660bbe_uniq UNIQUE (voucher_id, group_id);


--
-- Name: voucher_voucher_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_offers
    ADD CONSTRAINT voucher_voucher_offers_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucher_offers_voucher_id_01628a7f_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_offers
    ADD CONSTRAINT voucher_voucher_offers_voucher_id_01628a7f_uniq UNIQUE (voucher_id, conditionaloffer_id);


--
-- Name: voucher_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher
    ADD CONSTRAINT voucher_voucher_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucherapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_pkey PRIMARY KEY (id);


--
-- Name: widgy_node_content_type_id_4b818ed6_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_node
    ADD CONSTRAINT widgy_node_content_type_id_4b818ed6_uniq UNIQUE (content_type_id, content_id);


--
-- Name: widgy_node_path_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_node
    ADD CONSTRAINT widgy_node_path_key UNIQUE (path);


--
-- Name: widgy_node_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_node
    ADD CONSTRAINT widgy_node_pkey PRIMARY KEY (id);


--
-- Name: widgy_versioncommit_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit
    ADD CONSTRAINT widgy_versioncommit_pkey PRIMARY KEY (id);


--
-- Name: widgy_versiontracker_head_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker
    ADD CONSTRAINT widgy_versiontracker_head_id_key UNIQUE (head_id);


--
-- Name: widgy_versiontracker_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker
    ADD CONSTRAINT widgy_versiontracker_pkey PRIMARY KEY (id);


--
-- Name: widgy_versiontracker_working_copy_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker
    ADD CONSTRAINT widgy_versiontracker_working_copy_id_key UNIQUE (working_copy_id);


--
-- Name: wishlists_line_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_line
    ADD CONSTRAINT wishlists_line_pkey PRIMARY KEY (id);


--
-- Name: wishlists_line_wishlist_id_78f04673_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_line
    ADD CONSTRAINT wishlists_line_wishlist_id_78f04673_uniq UNIQUE (wishlist_id, product_id);


--
-- Name: wishlists_wishlist_key_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_key_key UNIQUE (key);


--
-- Name: wishlists_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX account_emailaddress_e8701ad4 ON account_emailaddress USING btree (user_id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailconfirmation_6f1edeac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX account_emailconfirmation_6f1edeac ON account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: address_country_010c8bce; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_country_010c8bce ON address_country USING btree (display_order);


--
-- Name: address_country_0b3676f8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_country_0b3676f8 ON address_country USING btree (is_shipping_country);


--
-- Name: address_country_iso_3166_1_a2_f395eed0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_country_iso_3166_1_a2_f395eed0_like ON address_country USING btree (iso_3166_1_a2 varchar_pattern_ops);


--
-- Name: address_useraddress_0800fc57; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_useraddress_0800fc57 ON address_useraddress USING btree (hash);


--
-- Name: address_useraddress_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_useraddress_93bfec8a ON address_useraddress USING btree (country_id);


--
-- Name: address_useraddress_country_id_fa26a249_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_useraddress_country_id_fa26a249_like ON address_useraddress USING btree (country_id varchar_pattern_ops);


--
-- Name: address_useraddress_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_useraddress_e8701ad4 ON address_useraddress USING btree (user_id);


--
-- Name: address_useraddress_hash_e0a6b290_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX address_useraddress_hash_e0a6b290_like ON address_useraddress USING btree (hash varchar_pattern_ops);


--
-- Name: admin_tools_dashboard_preferences_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX admin_tools_dashboard_preferences_e8701ad4 ON admin_tools_dashboard_preferences USING btree (user_id);


--
-- Name: admin_tools_menu_bookmark_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX admin_tools_menu_bookmark_e8701ad4 ON admin_tools_menu_bookmark USING btree (user_id);


--
-- Name: analytics_productrecord_81a5c7b1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_productrecord_81a5c7b1 ON analytics_productrecord USING btree (num_purchases);


--
-- Name: analytics_userproductview_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_userproductview_9bea82de ON analytics_userproductview USING btree (product_id);


--
-- Name: analytics_userproductview_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_userproductview_e8701ad4 ON analytics_userproductview USING btree (user_id);


--
-- Name: analytics_userrecord_25cd4b4a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_userrecord_25cd4b4a ON analytics_userrecord USING btree (num_order_items);


--
-- Name: analytics_userrecord_29bdb5ea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_userrecord_29bdb5ea ON analytics_userrecord USING btree (num_orders);


--
-- Name: analytics_userrecord_89bb6879; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_userrecord_89bb6879 ON analytics_userrecord USING btree (num_order_lines);


--
-- Name: analytics_usersearch_1b1cc7f0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_usersearch_1b1cc7f0 ON analytics_usersearch USING btree (query);


--
-- Name: analytics_usersearch_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_usersearch_e8701ad4 ON analytics_usersearch USING btree (user_id);


--
-- Name: analytics_usersearch_query_ad36478b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX analytics_usersearch_query_ad36478b_like ON analytics_usersearch USING btree (query varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: basket_basket_5e7b1936; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_basket_5e7b1936 ON basket_basket USING btree (owner_id);


--
-- Name: basket_basket_vouchers_3e8639ee; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_basket_vouchers_3e8639ee ON basket_basket_vouchers USING btree (voucher_id);


--
-- Name: basket_basket_vouchers_afdeaea9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_basket_vouchers_afdeaea9 ON basket_basket_vouchers USING btree (basket_id);


--
-- Name: basket_line_271c5733; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_line_271c5733 ON basket_line USING btree (stockrecord_id);


--
-- Name: basket_line_767217f5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_line_767217f5 ON basket_line USING btree (line_reference);


--
-- Name: basket_line_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_line_9bea82de ON basket_line USING btree (product_id);


--
-- Name: basket_line_afdeaea9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_line_afdeaea9 ON basket_line USING btree (basket_id);


--
-- Name: basket_line_line_reference_08e91113_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_line_line_reference_08e91113_like ON basket_line USING btree (line_reference varchar_pattern_ops);


--
-- Name: basket_lineattribute_28df3725; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_lineattribute_28df3725 ON basket_lineattribute USING btree (option_id);


--
-- Name: basket_lineattribute_b3ae486a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX basket_lineattribute_b3ae486a ON basket_lineattribute USING btree (line_id);


--
-- Name: blog_blogcategory_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogcategory_9365d6e7 ON blog_blogcategory USING btree (site_id);


--
-- Name: blog_blogpost_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_9365d6e7 ON blog_blogpost USING btree (site_id);


--
-- Name: blog_blogpost_categories_53a0aca2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_categories_53a0aca2 ON blog_blogpost_categories USING btree (blogpost_id);


--
-- Name: blog_blogpost_categories_efb54956; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_categories_efb54956 ON blog_blogpost_categories USING btree (blogcategory_id);


--
-- Name: blog_blogpost_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_e8701ad4 ON blog_blogpost USING btree (user_id);


--
-- Name: blog_blogpost_publish_date_703abc16_uniq; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_publish_date_703abc16_uniq ON blog_blogpost USING btree (publish_date);


--
-- Name: blog_blogpost_related_posts_191c4981; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_related_posts_191c4981 ON blog_blogpost_related_posts USING btree (from_blogpost_id);


--
-- Name: blog_blogpost_related_posts_71f16e58; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX blog_blogpost_related_posts_71f16e58 ON blog_blogpost_related_posts USING btree (to_blogpost_id);


--
-- Name: catalogue_attributeoption_0e939a4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_attributeoption_0e939a4f ON catalogue_attributeoption USING btree (group_id);


--
-- Name: catalogue_category_2dbcba41; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_category_2dbcba41 ON catalogue_category USING btree (slug);


--
-- Name: catalogue_category_b068931c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_category_b068931c ON catalogue_category USING btree (name);


--
-- Name: catalogue_category_name_1f342ac2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_category_name_1f342ac2_like ON catalogue_category USING btree (name varchar_pattern_ops);


--
-- Name: catalogue_category_path_1c5b79c2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_category_path_1c5b79c2_like ON catalogue_category USING btree (path varchar_pattern_ops);


--
-- Name: catalogue_category_slug_9635febd_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_category_slug_9635febd_like ON catalogue_category USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_option_code_0697b920_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_option_code_0697b920_like ON catalogue_option USING btree (code varchar_pattern_ops);


--
-- Name: catalogue_product_2dbcba41; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_2dbcba41 ON catalogue_product USING btree (slug);


--
-- Name: catalogue_product_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_6be37982 ON catalogue_product USING btree (parent_id);


--
-- Name: catalogue_product_9474e4b5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_9474e4b5 ON catalogue_product USING btree (date_updated);


--
-- Name: catalogue_product_c6619e6f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_c6619e6f ON catalogue_product USING btree (product_class_id);


--
-- Name: catalogue_product_product_options_28df3725; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_product_options_28df3725 ON catalogue_product_product_options USING btree (option_id);


--
-- Name: catalogue_product_product_options_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_product_options_9bea82de ON catalogue_product_product_options USING btree (product_id);


--
-- Name: catalogue_product_slug_c8e2e2b9_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_slug_c8e2e2b9_like ON catalogue_product USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_product_upc_91f72b90_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_product_upc_91f72b90_like ON catalogue_product USING btree (upc varchar_pattern_ops);


--
-- Name: catalogue_productattribute_2f493fea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattribute_2f493fea ON catalogue_productattribute USING btree (option_group_id);


--
-- Name: catalogue_productattribute_c1336794; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattribute_c1336794 ON catalogue_productattribute USING btree (code);


--
-- Name: catalogue_productattribute_c6619e6f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattribute_c6619e6f ON catalogue_productattribute USING btree (product_class_id);


--
-- Name: catalogue_productattribute_code_9ffea293_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattribute_code_9ffea293_like ON catalogue_productattribute USING btree (code varchar_pattern_ops);


--
-- Name: catalogue_productattributevalue_314d12bc; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattributevalue_314d12bc ON catalogue_productattributevalue USING btree (value_option_id);


--
-- Name: catalogue_productattributevalue_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattributevalue_9bea82de ON catalogue_productattributevalue USING btree (product_id);


--
-- Name: catalogue_productattributevalue_e582ed73; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattributevalue_e582ed73 ON catalogue_productattributevalue USING btree (attribute_id);


--
-- Name: catalogue_productattributevalue_ed18ba79; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productattributevalue_ed18ba79 ON catalogue_productattributevalue USING btree (entity_content_type_id);


--
-- Name: catalogue_productcategory_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productcategory_9bea82de ON catalogue_productcategory USING btree (product_id);


--
-- Name: catalogue_productcategory_b583a629; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productcategory_b583a629 ON catalogue_productcategory USING btree (category_id);


--
-- Name: catalogue_productclass_options_28df3725; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productclass_options_28df3725 ON catalogue_productclass_options USING btree (option_id);


--
-- Name: catalogue_productclass_options_ebf7b0c6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productclass_options_ebf7b0c6 ON catalogue_productclass_options USING btree (productclass_id);


--
-- Name: catalogue_productclass_slug_270c6b2b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productclass_slug_270c6b2b_like ON catalogue_productclass USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_productimage_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productimage_9bea82de ON catalogue_productimage USING btree (product_id);


--
-- Name: catalogue_productrecommendation_095f2624; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productrecommendation_095f2624 ON catalogue_productrecommendation USING btree (primary_id);


--
-- Name: catalogue_productrecommendation_c65d5c4d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX catalogue_productrecommendation_c65d5c4d ON catalogue_productrecommendation USING btree (recommendation_id);


--
-- Name: conf_setting_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX conf_setting_9365d6e7 ON conf_setting USING btree (site_id);


--
-- Name: contentitem_markup_markupitem_8512ae7d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX contentitem_markup_markupitem_8512ae7d ON contentitem_markup_markupitem USING btree (language);


--
-- Name: contentitem_markup_markupitem_language_dc97746e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX contentitem_markup_markupitem_language_dc97746e_like ON contentitem_markup_markupitem USING btree (language varchar_pattern_ops);


--
-- Name: contentitem_sharedcontent_sharedcontentitem_9855ad04; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX contentitem_sharedcontent_sharedcontentitem_9855ad04 ON contentitem_sharedcontent_sharedcontentitem USING btree (shared_content_id);


--
-- Name: core_sitepermission_sites_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX core_sitepermission_sites_9365d6e7 ON core_sitepermission_sites USING btree (site_id);


--
-- Name: core_sitepermission_sites_f6687ce4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX core_sitepermission_sites_f6687ce4 ON core_sitepermission_sites USING btree (sitepermission_id);


--
-- Name: customer_communicationeventtype_code_984beacb_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_communicationeventtype_code_984beacb_like ON customer_communicationeventtype USING btree (code varchar_pattern_ops);


--
-- Name: customer_email_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_email_e8701ad4 ON customer_email USING btree (user_id);


--
-- Name: customer_notification_8b938c66; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_notification_8b938c66 ON customer_notification USING btree (recipient_id);


--
-- Name: customer_notification_924b1846; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_notification_924b1846 ON customer_notification USING btree (sender_id);


--
-- Name: customer_productalert_0c83f57c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_0c83f57c ON customer_productalert USING btree (email);


--
-- Name: customer_productalert_3c6e0b8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_3c6e0b8a ON customer_productalert USING btree (key);


--
-- Name: customer_productalert_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_9bea82de ON customer_productalert USING btree (product_id);


--
-- Name: customer_productalert_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_e8701ad4 ON customer_productalert USING btree (user_id);


--
-- Name: customer_productalert_email_e5f35f45_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_email_e5f35f45_like ON customer_productalert USING btree (email varchar_pattern_ops);


--
-- Name: customer_productalert_key_a26f3bdc_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX customer_productalert_key_a26f3bdc_like ON customer_productalert USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_comment_flags_327a6c43; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comment_flags_327a6c43 ON django_comment_flags USING btree (flag);


--
-- Name: django_comment_flags_69b97d17; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comment_flags_69b97d17 ON django_comment_flags USING btree (comment_id);


--
-- Name: django_comment_flags_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comment_flags_e8701ad4 ON django_comment_flags USING btree (user_id);


--
-- Name: django_comment_flags_flag_8b141fcb_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comment_flags_flag_8b141fcb_like ON django_comment_flags USING btree (flag varchar_pattern_ops);


--
-- Name: django_comments_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comments_417f1b1c ON django_comments USING btree (content_type_id);


--
-- Name: django_comments_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comments_9365d6e7 ON django_comments USING btree (site_id);


--
-- Name: django_comments_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comments_e8701ad4 ON django_comments USING btree (user_id);


--
-- Name: django_comments_submit_date_514ed2d9_uniq; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_comments_submit_date_514ed2d9_uniq ON django_comments USING btree (submit_date);


--
-- Name: django_flatpage_572d4e42; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_flatpage_572d4e42 ON django_flatpage USING btree (url);


--
-- Name: django_flatpage_sites_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_flatpage_sites_9365d6e7 ON django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_sites_c3368d3a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_flatpage_sites_c3368d3a ON django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_flatpage_url_41612362_like ON django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_redirect_91a0b591; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_redirect_91a0b591 ON django_redirect USING btree (old_path);


--
-- Name: django_redirect_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_redirect_9365d6e7 ON django_redirect USING btree (site_id);


--
-- Name: django_redirect_old_path_c6cc94d3_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_redirect_old_path_c6cc94d3_like ON django_redirect USING btree (old_path varchar_pattern_ops);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_site_domain_a2e37b91_like ON django_site USING btree (domain varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_b068931c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_source_b068931c ON easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_b454e115; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_source_b454e115 ON easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_0afd9202; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_thumbnail_0afd9202 ON easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_b068931c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_thumbnail_b068931c ON easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_b454e115; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_thumbnail_b454e115 ON easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: fluent_contents_contentitem_2e3c0484; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_2e3c0484 ON fluent_contents_contentitem USING btree (parent_type_id);


--
-- Name: fluent_contents_contentitem_60716c2f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_60716c2f ON fluent_contents_contentitem USING btree (language_code);


--
-- Name: fluent_contents_contentitem_667a6151; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_667a6151 ON fluent_contents_contentitem USING btree (placeholder_id);


--
-- Name: fluent_contents_contentitem_a73f1f77; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_a73f1f77 ON fluent_contents_contentitem USING btree (sort_order);


--
-- Name: fluent_contents_contentitem_d3e32c49; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_d3e32c49 ON fluent_contents_contentitem USING btree (polymorphic_ctype_id);


--
-- Name: fluent_contents_contentitem_language_code_2304b6a8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_contentitem_language_code_2304b6a8_like ON fluent_contents_contentitem USING btree (language_code varchar_pattern_ops);


--
-- Name: fluent_contents_placeholder_2e3c0484; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_placeholder_2e3c0484 ON fluent_contents_placeholder USING btree (parent_type_id);


--
-- Name: fluent_contents_placeholder_5e97994e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_placeholder_5e97994e ON fluent_contents_placeholder USING btree (slot);


--
-- Name: fluent_contents_placeholder_slot_d7cb855e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX fluent_contents_placeholder_slot_d7cb855e_like ON fluent_contents_placeholder USING btree (slot varchar_pattern_ops);


--
-- Name: forms_field_d6cba1ad; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX forms_field_d6cba1ad ON forms_field USING btree (form_id);


--
-- Name: forms_fieldentry_b64a62ea; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX forms_fieldentry_b64a62ea ON forms_fieldentry USING btree (entry_id);


--
-- Name: forms_formentry_d6cba1ad; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX forms_formentry_d6cba1ad ON forms_formentry USING btree (form_id);


--
-- Name: galleries_galleryimage_6d994cdb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX galleries_galleryimage_6d994cdb ON galleries_galleryimage USING btree (gallery_id);


--
-- Name: generic_assignedkeyword_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_assignedkeyword_417f1b1c ON generic_assignedkeyword USING btree (content_type_id);


--
-- Name: generic_assignedkeyword_5c003bba; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_assignedkeyword_5c003bba ON generic_assignedkeyword USING btree (keyword_id);


--
-- Name: generic_keyword_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_keyword_9365d6e7 ON generic_keyword USING btree (site_id);


--
-- Name: generic_rating_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_rating_417f1b1c ON generic_rating USING btree (content_type_id);


--
-- Name: generic_rating_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_rating_e8701ad4 ON generic_rating USING btree (user_id);


--
-- Name: generic_threadedcomment_21ce1e68; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX generic_threadedcomment_21ce1e68 ON generic_threadedcomment USING btree (replied_to_id);


--
-- Name: oauth2_provider_accesstoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_6bc0a4eb ON oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_94a08da1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_94a08da1 ON oauth2_provider_accesstoken USING btree (token);


--
-- Name: oauth2_provider_accesstoken_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_e8701ad4 ON oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_application_9d667c2b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_9d667c2b ON oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_application_e8701ad4 ON oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_6bc0a4eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_6bc0a4eb ON oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_c1336794; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_c1336794 ON oauth2_provider_grant USING btree (code);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_grant_e8701ad4 ON oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_6bc0a4eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_6bc0a4eb ON oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_94a08da1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_94a08da1 ON oauth2_provider_refreshtoken USING btree (token);


--
-- Name: oauth2_provider_refreshtoken_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_e8701ad4 ON oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_token_d090daa4_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth2_provider_refreshtoken_token_d090daa4_like ON oauth2_provider_refreshtoken USING btree (token varchar_pattern_ops);


--
-- Name: offer_benefit_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_benefit_ee6537b7 ON offer_benefit USING btree (range_id);


--
-- Name: offer_compoundcondition_subconditions_a5d9eec5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_compoundcondition_subconditions_a5d9eec5 ON offer_compoundcondition_subconditions USING btree (compoundcondition_id);


--
-- Name: offer_compoundcondition_subconditions_bb531585; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_compoundcondition_subconditions_bb531585 ON offer_compoundcondition_subconditions USING btree (condition_id);


--
-- Name: offer_condition_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_condition_ee6537b7 ON offer_condition USING btree (range_id);


--
-- Name: offer_conditionaloffer_326fa416; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_326fa416 ON offer_conditionaloffer USING btree (benefit_id);


--
-- Name: offer_conditionaloffer_bb531585; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_bb531585 ON offer_conditionaloffer USING btree (condition_id);


--
-- Name: offer_conditionaloffer_groups_0e939a4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_groups_0e939a4f ON offer_conditionaloffer_groups USING btree (group_id);


--
-- Name: offer_conditionaloffer_groups_a8841877; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_groups_a8841877 ON offer_conditionaloffer_groups USING btree (conditionaloffer_id);


--
-- Name: offer_conditionaloffer_name_340601c2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_name_340601c2_like ON offer_conditionaloffer USING btree (name varchar_pattern_ops);


--
-- Name: offer_conditionaloffer_slug_e4649c01_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_conditionaloffer_slug_e4649c01_like ON offer_conditionaloffer USING btree (slug varchar_pattern_ops);


--
-- Name: offer_range_classes_ebf7b0c6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_classes_ebf7b0c6 ON offer_range_classes USING btree (productclass_id);


--
-- Name: offer_range_classes_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_classes_ee6537b7 ON offer_range_classes USING btree (range_id);


--
-- Name: offer_range_excluded_products_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_excluded_products_9bea82de ON offer_range_excluded_products USING btree (product_id);


--
-- Name: offer_range_excluded_products_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_excluded_products_ee6537b7 ON offer_range_excluded_products USING btree (range_id);


--
-- Name: offer_range_included_categories_b583a629; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_included_categories_b583a629 ON offer_range_included_categories USING btree (category_id);


--
-- Name: offer_range_included_categories_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_included_categories_ee6537b7 ON offer_range_included_categories USING btree (range_id);


--
-- Name: offer_range_name_c72a602f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_name_c72a602f_like ON offer_range USING btree (name varchar_pattern_ops);


--
-- Name: offer_range_proxy_class_3c9917c6_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_proxy_class_3c9917c6_like ON offer_range USING btree (proxy_class varchar_pattern_ops);


--
-- Name: offer_range_slug_ce39e53b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_range_slug_ce39e53b_like ON offer_range USING btree (slug varchar_pattern_ops);


--
-- Name: offer_rangeproduct_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_rangeproduct_9bea82de ON offer_rangeproduct USING btree (product_id);


--
-- Name: offer_rangeproduct_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_rangeproduct_ee6537b7 ON offer_rangeproduct USING btree (range_id);


--
-- Name: offer_rangeproductfileupload_4095e96b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_rangeproductfileupload_4095e96b ON offer_rangeproductfileupload USING btree (uploaded_by_id);


--
-- Name: offer_rangeproductfileupload_ee6537b7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX offer_rangeproductfileupload_ee6537b7 ON offer_rangeproductfileupload USING btree (range_id);


--
-- Name: order_billingaddress_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_billingaddress_93bfec8a ON order_billingaddress USING btree (country_id);


--
-- Name: order_billingaddress_country_id_17f57dca_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_billingaddress_country_id_17f57dca_like ON order_billingaddress USING btree (country_id varchar_pattern_ops);


--
-- Name: order_communicationevent_5e891baf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_communicationevent_5e891baf ON order_communicationevent USING btree (event_type_id);


--
-- Name: order_communicationevent_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_communicationevent_69dfcb07 ON order_communicationevent USING btree (order_id);


--
-- Name: order_line_271c5733; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_line_271c5733 ON order_line USING btree (stockrecord_id);


--
-- Name: order_line_4e98b6eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_line_4e98b6eb ON order_line USING btree (partner_id);


--
-- Name: order_line_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_line_69dfcb07 ON order_line USING btree (order_id);


--
-- Name: order_line_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_line_9bea82de ON order_line USING btree (product_id);


--
-- Name: order_lineattribute_28df3725; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_lineattribute_28df3725 ON order_lineattribute USING btree (option_id);


--
-- Name: order_lineattribute_b3ae486a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_lineattribute_b3ae486a ON order_lineattribute USING btree (line_id);


--
-- Name: order_lineprice_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_lineprice_69dfcb07 ON order_lineprice USING btree (order_id);


--
-- Name: order_lineprice_b3ae486a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_lineprice_b3ae486a ON order_lineprice USING btree (line_id);


--
-- Name: order_order_8fb9ffec; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_8fb9ffec ON order_order USING btree (shipping_address_id);


--
-- Name: order_order_90e84921; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_90e84921 ON order_order USING btree (date_placed);


--
-- Name: order_order_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_9365d6e7 ON order_order USING btree (site_id);


--
-- Name: order_order_afdeaea9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_afdeaea9 ON order_order USING btree (basket_id);


--
-- Name: order_order_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_e8701ad4 ON order_order USING btree (user_id);


--
-- Name: order_order_e9192ced; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_e9192ced ON order_order USING btree (billing_address_id);


--
-- Name: order_order_number_49f06f1b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_order_number_49f06f1b_like ON order_order USING btree (number varchar_pattern_ops);


--
-- Name: order_orderdiscount_08e4f7cd; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_orderdiscount_08e4f7cd ON order_orderdiscount USING btree (voucher_code);


--
-- Name: order_orderdiscount_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_orderdiscount_69dfcb07 ON order_orderdiscount USING btree (order_id);


--
-- Name: order_orderdiscount_9eeed246; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_orderdiscount_9eeed246 ON order_orderdiscount USING btree (offer_name);


--
-- Name: order_orderdiscount_offer_name_706d6119_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_orderdiscount_offer_name_706d6119_like ON order_orderdiscount USING btree (offer_name varchar_pattern_ops);


--
-- Name: order_orderdiscount_voucher_code_6ee4f360_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_orderdiscount_voucher_code_6ee4f360_like ON order_orderdiscount USING btree (voucher_code varchar_pattern_ops);


--
-- Name: order_ordernote_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_ordernote_69dfcb07 ON order_ordernote USING btree (order_id);


--
-- Name: order_ordernote_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_ordernote_e8701ad4 ON order_ordernote USING btree (user_id);


--
-- Name: order_paymentevent_5e891baf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymentevent_5e891baf ON order_paymentevent USING btree (event_type_id);


--
-- Name: order_paymentevent_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymentevent_69dfcb07 ON order_paymentevent USING btree (order_id);


--
-- Name: order_paymentevent_78cafb71; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymentevent_78cafb71 ON order_paymentevent USING btree (shipping_event_id);


--
-- Name: order_paymenteventquantity_4437cfac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymenteventquantity_4437cfac ON order_paymenteventquantity USING btree (event_id);


--
-- Name: order_paymenteventquantity_b3ae486a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymenteventquantity_b3ae486a ON order_paymenteventquantity USING btree (line_id);


--
-- Name: order_paymenteventtype_code_19e3e888_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymenteventtype_code_19e3e888_like ON order_paymenteventtype USING btree (code varchar_pattern_ops);


--
-- Name: order_paymenteventtype_name_e4bcca28_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_paymenteventtype_name_e4bcca28_like ON order_paymenteventtype USING btree (name varchar_pattern_ops);


--
-- Name: order_shippingaddress_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingaddress_93bfec8a ON order_shippingaddress USING btree (country_id);


--
-- Name: order_shippingaddress_country_id_29abf9a0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingaddress_country_id_29abf9a0_like ON order_shippingaddress USING btree (country_id varchar_pattern_ops);


--
-- Name: order_shippingevent_5e891baf; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingevent_5e891baf ON order_shippingevent USING btree (event_type_id);


--
-- Name: order_shippingevent_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingevent_69dfcb07 ON order_shippingevent USING btree (order_id);


--
-- Name: order_shippingeventquantity_4437cfac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingeventquantity_4437cfac ON order_shippingeventquantity USING btree (event_id);


--
-- Name: order_shippingeventquantity_b3ae486a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingeventquantity_b3ae486a ON order_shippingeventquantity USING btree (line_id);


--
-- Name: order_shippingeventtype_code_db3854de_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingeventtype_code_db3854de_like ON order_shippingeventtype USING btree (code varchar_pattern_ops);


--
-- Name: order_shippingeventtype_name_6d9a48a2_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX order_shippingeventtype_name_6d9a48a2_like ON order_shippingeventtype USING btree (name varchar_pattern_ops);


--
-- Name: oscar_accounts_account_050c75d8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_050c75d8 ON oscar_accounts_account USING btree (primary_user_id);


--
-- Name: oscar_accounts_account_87599c2c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_87599c2c ON oscar_accounts_account USING btree (product_range_id);


--
-- Name: oscar_accounts_account_code_434d8a7a_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_code_434d8a7a_like ON oscar_accounts_account USING btree (code varchar_pattern_ops);


--
-- Name: oscar_accounts_account_d18f477c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_d18f477c ON oscar_accounts_account USING btree (account_type_id);


--
-- Name: oscar_accounts_account_name_10965ccd_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_name_10965ccd_like ON oscar_accounts_account USING btree (name varchar_pattern_ops);


--
-- Name: oscar_accounts_account_secondary_users_8a089c2a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_secondary_users_8a089c2a ON oscar_accounts_account_secondary_users USING btree (account_id);


--
-- Name: oscar_accounts_account_secondary_users_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_account_secondary_users_e8701ad4 ON oscar_accounts_account_secondary_users USING btree (user_id);


--
-- Name: oscar_accounts_accounttype_code_b4375be6_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_accounttype_code_b4375be6_like ON oscar_accounts_accounttype USING btree (code varchar_pattern_ops);


--
-- Name: oscar_accounts_accounttype_path_ec7684a6_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_accounttype_path_ec7684a6_like ON oscar_accounts_accounttype USING btree (path varchar_pattern_ops);


--
-- Name: oscar_accounts_transaction_684f267f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transaction_684f267f ON oscar_accounts_transaction USING btree (transfer_id);


--
-- Name: oscar_accounts_transaction_8a089c2a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transaction_8a089c2a ON oscar_accounts_transaction USING btree (account_id);


--
-- Name: oscar_accounts_transfer_0afd9202; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transfer_0afd9202 ON oscar_accounts_transfer USING btree (source_id);


--
-- Name: oscar_accounts_transfer_279358a3; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transfer_279358a3 ON oscar_accounts_transfer USING btree (destination_id);


--
-- Name: oscar_accounts_transfer_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transfer_6be37982 ON oscar_accounts_transfer USING btree (parent_id);


--
-- Name: oscar_accounts_transfer_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transfer_e8701ad4 ON oscar_accounts_transfer USING btree (user_id);


--
-- Name: oscar_accounts_transfer_reference_753a9b76_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_accounts_transfer_reference_753a9b76_like ON oscar_accounts_transfer USING btree (reference varchar_pattern_ops);


--
-- Name: oscar_wagtail_productlistitem_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_wagtail_productlistitem_6be37982 ON oscar_wagtail_productlistitem USING btree (parent_id);


--
-- Name: oscar_wagtail_productlistitem_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_wagtail_productlistitem_9bea82de ON oscar_wagtail_productlistitem USING btree (product_id);


--
-- Name: oscar_wagtail_productlistsnippet_code_49979c62_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscar_wagtail_productlistsnippet_code_49979c62_like ON oscar_wagtail_productlistsnippet USING btree (code varchar_pattern_ops);


--
-- Name: oscarapi_apikey_key_0481646b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oscarapi_apikey_key_0481646b_like ON oscarapi_apikey USING btree (key varchar_pattern_ops);


--
-- Name: pages_page_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pages_page_6be37982 ON pages_page USING btree (parent_id);


--
-- Name: pages_page_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pages_page_9365d6e7 ON pages_page USING btree (site_id);


--
-- Name: pages_page_publish_date_eb7c8d46_uniq; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pages_page_publish_date_eb7c8d46_uniq ON pages_page USING btree (publish_date);


--
-- Name: partner_partner_code_13d0debd_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partner_code_13d0debd_like ON partner_partner USING btree (code varchar_pattern_ops);


--
-- Name: partner_partner_users_4e98b6eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partner_users_4e98b6eb ON partner_partner_users USING btree (partner_id);


--
-- Name: partner_partner_users_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partner_users_e8701ad4 ON partner_partner_users USING btree (user_id);


--
-- Name: partner_partneraddress_4e98b6eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partneraddress_4e98b6eb ON partner_partneraddress USING btree (partner_id);


--
-- Name: partner_partneraddress_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partneraddress_93bfec8a ON partner_partneraddress USING btree (country_id);


--
-- Name: partner_partneraddress_country_id_02c4f979_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_partneraddress_country_id_02c4f979_like ON partner_partneraddress USING btree (country_id varchar_pattern_ops);


--
-- Name: partner_stockalert_271c5733; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_stockalert_271c5733 ON partner_stockalert USING btree (stockrecord_id);


--
-- Name: partner_stockrecord_4e98b6eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_stockrecord_4e98b6eb ON partner_stockrecord USING btree (partner_id);


--
-- Name: partner_stockrecord_9474e4b5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_stockrecord_9474e4b5 ON partner_stockrecord USING btree (date_updated);


--
-- Name: partner_stockrecord_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX partner_stockrecord_9bea82de ON partner_stockrecord USING btree (product_id);


--
-- Name: payment_bankcard_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX payment_bankcard_e8701ad4 ON payment_bankcard USING btree (user_id);


--
-- Name: payment_source_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX payment_source_69dfcb07 ON payment_source USING btree (order_id);


--
-- Name: payment_source_ed5cb66b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX payment_source_ed5cb66b ON payment_source USING btree (source_type_id);


--
-- Name: payment_sourcetype_code_e479088c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX payment_sourcetype_code_e479088c_like ON payment_sourcetype USING btree (code varchar_pattern_ops);


--
-- Name: payment_transaction_0afd9202; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX payment_transaction_0afd9202 ON payment_transaction USING btree (source_id);


--
-- Name: paypal_payflowtransaction_4e83d0f4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX paypal_payflowtransaction_4e83d0f4 ON paypal_payflowtransaction USING btree (comment1);


--
-- Name: paypal_payflowtransaction_comment1_d4d0e6af_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX paypal_payflowtransaction_comment1_d4d0e6af_like ON paypal_payflowtransaction USING btree (comment1 varchar_pattern_ops);


--
-- Name: paypal_payflowtransaction_ppref_4e7ded68_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX paypal_payflowtransaction_ppref_4e7ded68_like ON paypal_payflowtransaction USING btree (ppref varchar_pattern_ops);


--
-- Name: pinax_stripe_bitcoinreceiver_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_bitcoinreceiver_cb24373b ON pinax_stripe_bitcoinreceiver USING btree (customer_id);


--
-- Name: pinax_stripe_bitcoinreceiver_stripe_id_76e24039_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_bitcoinreceiver_stripe_id_76e24039_like ON pinax_stripe_bitcoinreceiver USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_card_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_card_cb24373b ON pinax_stripe_card USING btree (customer_id);


--
-- Name: pinax_stripe_card_stripe_id_4ebbb559_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_card_stripe_id_4ebbb559_like ON pinax_stripe_card USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_charge_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_charge_cb24373b ON pinax_stripe_charge USING btree (customer_id);


--
-- Name: pinax_stripe_charge_f1f5d967; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_charge_f1f5d967 ON pinax_stripe_charge USING btree (invoice_id);


--
-- Name: pinax_stripe_charge_stripe_id_ef4c5691_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_charge_stripe_id_ef4c5691_like ON pinax_stripe_charge USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_customer_stripe_id_e898d16b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_customer_stripe_id_e898d16b_like ON pinax_stripe_customer USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_event_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_event_cb24373b ON pinax_stripe_event USING btree (customer_id);


--
-- Name: pinax_stripe_event_stripe_id_7f64ee28_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_event_stripe_id_7f64ee28_like ON pinax_stripe_event USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_eventprocessingexception_4437cfac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_eventprocessingexception_4437cfac ON pinax_stripe_eventprocessingexception USING btree (event_id);


--
-- Name: pinax_stripe_invoice_a7fa9be2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoice_a7fa9be2 ON pinax_stripe_invoice USING btree (charge_id);


--
-- Name: pinax_stripe_invoice_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoice_cb24373b ON pinax_stripe_invoice USING btree (customer_id);


--
-- Name: pinax_stripe_invoice_ef42673f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoice_ef42673f ON pinax_stripe_invoice USING btree (subscription_id);


--
-- Name: pinax_stripe_invoice_stripe_id_a7a98045_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoice_stripe_id_a7a98045_like ON pinax_stripe_invoice USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_invoiceitem_60fb6a05; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoiceitem_60fb6a05 ON pinax_stripe_invoiceitem USING btree (plan_id);


--
-- Name: pinax_stripe_invoiceitem_ef42673f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoiceitem_ef42673f ON pinax_stripe_invoiceitem USING btree (subscription_id);


--
-- Name: pinax_stripe_invoiceitem_f1f5d967; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_invoiceitem_f1f5d967 ON pinax_stripe_invoiceitem USING btree (invoice_id);


--
-- Name: pinax_stripe_plan_stripe_id_4f3ae535_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_plan_stripe_id_4f3ae535_like ON pinax_stripe_plan USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_subscription_60fb6a05; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_subscription_60fb6a05 ON pinax_stripe_subscription USING btree (plan_id);


--
-- Name: pinax_stripe_subscription_cb24373b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_subscription_cb24373b ON pinax_stripe_subscription USING btree (customer_id);


--
-- Name: pinax_stripe_subscription_stripe_id_34883282_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_subscription_stripe_id_34883282_like ON pinax_stripe_subscription USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_transfer_4437cfac; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_transfer_4437cfac ON pinax_stripe_transfer USING btree (event_id);


--
-- Name: pinax_stripe_transfer_stripe_id_89e1dac1_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_transfer_stripe_id_89e1dac1_like ON pinax_stripe_transfer USING btree (stripe_id varchar_pattern_ops);


--
-- Name: pinax_stripe_transferchargefee_684f267f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX pinax_stripe_transferchargefee_684f267f ON pinax_stripe_transferchargefee USING btree (transfer_id);


--
-- Name: promotions_keywordpromotion_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_keywordpromotion_417f1b1c ON promotions_keywordpromotion USING btree (content_type_id);


--
-- Name: promotions_multiimage_images_8f22ac31; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_multiimage_images_8f22ac31 ON promotions_multiimage_images USING btree (multiimage_id);


--
-- Name: promotions_multiimage_images_f33175e6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_multiimage_images_f33175e6 ON promotions_multiimage_images USING btree (image_id);


--
-- Name: promotions_orderedproduct_4da3e820; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_orderedproduct_4da3e820 ON promotions_orderedproduct USING btree (list_id);


--
-- Name: promotions_orderedproduct_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_orderedproduct_9bea82de ON promotions_orderedproduct USING btree (product_id);


--
-- Name: promotions_orderedproductlist_1f46f425; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_orderedproductlist_1f46f425 ON promotions_orderedproductlist USING btree (tabbed_block_id);


--
-- Name: promotions_pagepromotion_072c6e88; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_pagepromotion_072c6e88 ON promotions_pagepromotion USING btree (page_url);


--
-- Name: promotions_pagepromotion_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_pagepromotion_417f1b1c ON promotions_pagepromotion USING btree (content_type_id);


--
-- Name: promotions_pagepromotion_page_url_eee0cc4e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_pagepromotion_page_url_eee0cc4e_like ON promotions_pagepromotion USING btree (page_url varchar_pattern_ops);


--
-- Name: promotions_singleproduct_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX promotions_singleproduct_9bea82de ON promotions_singleproduct USING btree (product_id);


--
-- Name: reviews_productreview_979acfd1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reviews_productreview_979acfd1 ON reviews_productreview USING btree (delta_votes);


--
-- Name: reviews_productreview_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reviews_productreview_9bea82de ON reviews_productreview USING btree (product_id);


--
-- Name: reviews_productreview_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reviews_productreview_e8701ad4 ON reviews_productreview USING btree (user_id);


--
-- Name: reviews_vote_5bd2a989; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reviews_vote_5bd2a989 ON reviews_vote USING btree (review_id);


--
-- Name: reviews_vote_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX reviews_vote_e8701ad4 ON reviews_vote USING btree (user_id);


--
-- Name: sharedcontent_sharedcontent_2dbcba41; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_2dbcba41 ON sharedcontent_sharedcontent USING btree (slug);


--
-- Name: sharedcontent_sharedcontent_4e147804; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_4e147804 ON sharedcontent_sharedcontent USING btree (parent_site_id);


--
-- Name: sharedcontent_sharedcontent_slug_ebe1a524_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_slug_ebe1a524_like ON sharedcontent_sharedcontent USING btree (slug varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_transla_language_code_ab3c904c_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_transla_language_code_ab3c904c_like ON sharedcontent_sharedcontent_translation USING btree (language_code varchar_pattern_ops);


--
-- Name: sharedcontent_sharedcontent_translation_60716c2f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_translation_60716c2f ON sharedcontent_sharedcontent_translation USING btree (language_code);


--
-- Name: sharedcontent_sharedcontent_translation_90349b61; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX sharedcontent_sharedcontent_translation_90349b61 ON sharedcontent_sharedcontent_translation USING btree (master_id);


--
-- Name: shipping_orderanditemcharges_code_cbeb9206_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_orderanditemcharges_code_cbeb9206_like ON shipping_orderanditemcharges USING btree (code varchar_pattern_ops);


--
-- Name: shipping_orderanditemcharges_countries_2e9e2d8d; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_orderanditemcharges_countries_2e9e2d8d ON shipping_orderanditemcharges_countries USING btree (orderanditemcharges_id);


--
-- Name: shipping_orderanditemcharges_countries_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_orderanditemcharges_countries_93bfec8a ON shipping_orderanditemcharges_countries USING btree (country_id);


--
-- Name: shipping_orderanditemcharges_countries_country_id_30387f2e_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_orderanditemcharges_countries_country_id_30387f2e_like ON shipping_orderanditemcharges_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: shipping_orderanditemcharges_name_c575f5bc_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_orderanditemcharges_name_c575f5bc_like ON shipping_orderanditemcharges USING btree (name varchar_pattern_ops);


--
-- Name: shipping_shippingcompany_code_d76747a0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_code_d76747a0_like ON shipping_shippingcompany USING btree (code varchar_pattern_ops);


--
-- Name: shipping_shippingcompany_containers_0dd65876; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_containers_0dd65876 ON shipping_shippingcompany_containers USING btree (shippingcontainer_id);


--
-- Name: shipping_shippingcompany_containers_7a37b76e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_containers_7a37b76e ON shipping_shippingcompany_containers USING btree (shippingcompany_id);


--
-- Name: shipping_shippingcompany_countries_7a37b76e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_countries_7a37b76e ON shipping_shippingcompany_countries USING btree (shippingcompany_id);


--
-- Name: shipping_shippingcompany_countries_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_countries_93bfec8a ON shipping_shippingcompany_countries USING btree (country_id);


--
-- Name: shipping_shippingcompany_countries_country_id_4c976fc4_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_countries_country_id_4c976fc4_like ON shipping_shippingcompany_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: shipping_shippingcompany_name_719f9996_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcompany_name_719f9996_like ON shipping_shippingcompany USING btree (name varchar_pattern_ops);


--
-- Name: shipping_shippingcontainer_name_ab44cf49_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_shippingcontainer_name_ab44cf49_like ON shipping_shippingcontainer USING btree (name varchar_pattern_ops);


--
-- Name: shipping_weightband_836f12fb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightband_836f12fb ON shipping_weightband USING btree (method_id);


--
-- Name: shipping_weightbased_code_abff8e3d_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightbased_code_abff8e3d_like ON shipping_weightbased USING btree (code varchar_pattern_ops);


--
-- Name: shipping_weightbased_countries_30de71ed; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightbased_countries_30de71ed ON shipping_weightbased_countries USING btree (weightbased_id);


--
-- Name: shipping_weightbased_countries_93bfec8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightbased_countries_93bfec8a ON shipping_weightbased_countries USING btree (country_id);


--
-- Name: shipping_weightbased_countries_country_id_06117384_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightbased_countries_country_id_06117384_like ON shipping_weightbased_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: shipping_weightbased_name_ff8fabb8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX shipping_weightbased_name_ff8fabb8_like ON shipping_weightbased USING btree (name varchar_pattern_ops);


--
-- Name: social_auth_code_c1336794; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_code_c1336794 ON social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_code_code_a2393167_like ON social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX social_auth_usersocialauth_e8701ad4 ON social_auth_usersocialauth USING btree (user_id);


--
-- Name: socialaccount_socialaccount_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX socialaccount_socialaccount_e8701ad4 ON socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_9365d6e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX socialaccount_socialapp_sites_9365d6e7 ON socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_fe95b0a0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX socialaccount_socialapp_sites_fe95b0a0 ON socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_8a089c2a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX socialaccount_socialtoken_8a089c2a ON socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_f382adfe; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX socialaccount_socialtoken_f382adfe ON socialaccount_socialtoken USING btree (app_id);


--
-- Name: tastypie_apikey_3c6e0b8a; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tastypie_apikey_3c6e0b8a ON tastypie_apikey USING btree (key);


--
-- Name: tastypie_apikey_key_17b411bb_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX tastypie_apikey_key_17b411bb_like ON tastypie_apikey USING btree (key varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: twitter_tweet_0bbeda9c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX twitter_tweet_0bbeda9c ON twitter_tweet USING btree (query_id);


--
-- Name: voucher_voucher_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_6be37982 ON voucher_voucher USING btree (parent_id);


--
-- Name: voucher_voucher_code_43d30a18_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_code_43d30a18_like ON voucher_voucher USING btree (code varchar_pattern_ops);


--
-- Name: voucher_voucher_groups_0e939a4f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_groups_0e939a4f ON voucher_voucher_groups USING btree (group_id);


--
-- Name: voucher_voucher_groups_3e8639ee; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_groups_3e8639ee ON voucher_voucher_groups USING btree (voucher_id);


--
-- Name: voucher_voucher_offers_3e8639ee; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_offers_3e8639ee ON voucher_voucher_offers USING btree (voucher_id);


--
-- Name: voucher_voucher_offers_a8841877; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucher_offers_a8841877 ON voucher_voucher_offers USING btree (conditionaloffer_id);


--
-- Name: voucher_voucherapplication_3e8639ee; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucherapplication_3e8639ee ON voucher_voucherapplication USING btree (voucher_id);


--
-- Name: voucher_voucherapplication_69dfcb07; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucherapplication_69dfcb07 ON voucher_voucherapplication USING btree (order_id);


--
-- Name: voucher_voucherapplication_e8701ad4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX voucher_voucherapplication_e8701ad4 ON voucher_voucherapplication USING btree (user_id);


--
-- Name: widgy_node_417f1b1c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_node_417f1b1c ON widgy_node USING btree (content_type_id);


--
-- Name: widgy_node_path_6c5d7687_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_node_path_6c5d7687_like ON widgy_node USING btree (path varchar_pattern_ops);


--
-- Name: widgy_versioncommit_268dde56; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_versioncommit_268dde56 ON widgy_versioncommit USING btree (root_node_id);


--
-- Name: widgy_versioncommit_4f331e2f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_versioncommit_4f331e2f ON widgy_versioncommit USING btree (author_id);


--
-- Name: widgy_versioncommit_6be37982; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_versioncommit_6be37982 ON widgy_versioncommit USING btree (parent_id);


--
-- Name: widgy_versioncommit_ca3b814c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX widgy_versioncommit_ca3b814c ON widgy_versioncommit USING btree (tracker_id);


--
-- Name: wishlists_line_9bea82de; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX wishlists_line_9bea82de ON wishlists_line USING btree (product_id);


--
-- Name: wishlists_line_e2f8e270; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX wishlists_line_e2f8e270 ON wishlists_line USING btree (wishlist_id);


--
-- Name: wishlists_wishlist_5e7b1936; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX wishlists_wishlist_5e7b1936 ON wishlists_wishlist USING btree (owner_id);


--
-- Name: wishlists_wishlist_key_88d419b8_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX wishlists_wishlist_key_88d419b8_like ON wishlists_wishlist USING btree (key varchar_pattern_ops);


--
-- Name: D32925b5ae86f6995dc554babb47150a; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges_countries
    ADD CONSTRAINT "D32925b5ae86f6995dc554babb47150a" FOREIGN KEY (orderanditemcharges_id) REFERENCES shipping_orderanditemcharges(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: D596312c20c0215221f57fd72f1301e8; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition_subconditions
    ADD CONSTRAINT "D596312c20c0215221f57fd72f1301e8" FOREIGN KEY (compoundcondition_id) REFERENCES offer_compoundcondition(condition_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailconfirmation
    ADD CONSTRAINT account_em_email_address_id_5b7f8c58_fk_account_emailaddress_id FOREIGN KEY (email_address_id) REFERENCES account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailaddress_user_id_2c513194_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ad11d0c1662f6ed6839bc6d43c9ce4f3; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT ad11d0c1662f6ed6839bc6d43c9ce4f3 FOREIGN KEY (replied_to_id) REFERENCES generic_threadedcomment(comment_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: address_us_country_id_fa26a249_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_useraddress
    ADD CONSTRAINT address_us_country_id_fa26a249_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: address_useraddress_user_id_6edf0244_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY address_useraddress
    ADD CONSTRAINT address_useraddress_user_id_6edf0244_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_dashboard_preferen_user_id_8f768e6c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_dashboard_preferences
    ADD CONSTRAINT admin_tools_dashboard_preferen_user_id_8f768e6c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY admin_tools_menu_bookmark
    ADD CONSTRAINT admin_tools_menu_bookmark_user_id_0382e410_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_productre_product_id_dad3a871_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_productrecord
    ADD CONSTRAINT analytics_productre_product_id_dad3a871_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userprodu_product_id_a55b87ad_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userproductview
    ADD CONSTRAINT analytics_userprodu_product_id_a55b87ad_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userproductview
    ADD CONSTRAINT analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userrecord_user_id_702cff4c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_user_id_702cff4c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_usersearch_user_id_1775992d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY analytics_usersearch
    ADD CONSTRAINT analytics_usersearch_user_id_1775992d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_basket_owner_id_3a018de5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket
    ADD CONSTRAINT basket_basket_owner_id_3a018de5_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_basket_voucher_voucher_id_c2b66981_fk_voucher_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket_vouchers
    ADD CONSTRAINT basket_basket_voucher_voucher_id_c2b66981_fk_voucher_voucher_id FOREIGN KEY (voucher_id) REFERENCES voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_basket_vouchers_basket_id_f857c2f8_fk_basket_basket_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_basket_vouchers
    ADD CONSTRAINT basket_basket_vouchers_basket_id_f857c2f8_fk_basket_basket_id FOREIGN KEY (basket_id) REFERENCES basket_basket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line_basket_id_b615c905_fk_basket_basket_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line
    ADD CONSTRAINT basket_line_basket_id_b615c905_fk_basket_basket_id FOREIGN KEY (basket_id) REFERENCES basket_basket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line_product_id_303d743e_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line
    ADD CONSTRAINT basket_line_product_id_303d743e_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_line
    ADD CONSTRAINT basket_line_stockrecord_id_7039d8a4_fk_partner_stockrecord_id FOREIGN KEY (stockrecord_id) REFERENCES partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_line_id_c41e0cdf_fk_basket_line_id FOREIGN KEY (line_id) REFERENCES basket_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_option_id_9387a3f7_fk_catalogue_option_id FOREIGN KEY (option_id) REFERENCES catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogcategory_site_id_42b9c96d_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogcategory
    ADD CONSTRAINT blog_blogcategory_site_id_42b9c96d_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost__blogcategory_id_f6695246_fk_blog_blogcategory_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost__blogcategory_id_f6695246_fk_blog_blogcategory_id FOREIGN KEY (blogcategory_id) REFERENCES blog_blogcategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_categori_blogpost_id_daeea608_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_categories
    ADD CONSTRAINT blog_blogpost_categori_blogpost_id_daeea608_fk_blog_blogpost_id FOREIGN KEY (blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_rel_from_blogpost_id_27ea4c18_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_rel_from_blogpost_id_27ea4c18_fk_blog_blogpost_id FOREIGN KEY (from_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_relat_to_blogpost_id_35f7acdd_fk_blog_blogpost_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost_related_posts
    ADD CONSTRAINT blog_blogpost_relat_to_blogpost_id_35f7acdd_fk_blog_blogpost_id FOREIGN KEY (to_blogpost_id) REFERENCES blog_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_site_id_7995688f_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_site_id_7995688f_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_blogpost_user_id_12ed6b16_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY blog_blogpost
    ADD CONSTRAINT blog_blogpost_user_id_12ed6b16_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c4dab8143c600a126a2a414988f853ee; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproductlist
    ADD CONSTRAINT c4dab8143c600a126a2a414988f853ee FOREIGN KEY (handpickedproductlist_ptr_id) REFERENCES promotions_handpickedproductlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_115f19ef_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_iframe_iframeitem
    ADD CONSTRAINT c_contentitem_ptr_id_115f19ef_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_48add792_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT c_contentitem_ptr_id_48add792_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_4bfd1736_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_picture_pictureitem
    ADD CONSTRAINT c_contentitem_ptr_id_4bfd1736_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_59b6f800_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_oembeditem_oembeditem
    ADD CONSTRAINT c_contentitem_ptr_id_59b6f800_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_64ef0d49_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_markup_markupitem
    ADD CONSTRAINT c_contentitem_ptr_id_64ef0d49_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_72bbe1af_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_code_codeitem
    ADD CONSTRAINT c_contentitem_ptr_id_72bbe1af_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_7b33cf75_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_googledocsviewer_googledocsvieweritem
    ADD CONSTRAINT c_contentitem_ptr_id_7b33cf75_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_88945008_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_gist_gistitem
    ADD CONSTRAINT c_contentitem_ptr_id_88945008_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_a20d2b03_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_rawhtml_rawhtmlitem
    ADD CONSTRAINT c_contentitem_ptr_id_a20d2b03_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_contentitem_ptr_id_dcbe22d0_fk_fluent_contents_contentitem_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_text_textitem
    ADD CONSTRAINT c_contentitem_ptr_id_dcbe22d0_fk_fluent_contents_contentitem_id FOREIGN KEY (contentitem_ptr_id) REFERENCES fluent_contents_contentitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: c_option_group_id_6b422dc2_fk_catalogue_attributeoptiongroup_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattribute
    ADD CONSTRAINT c_option_group_id_6b422dc2_fk_catalogue_attributeoptiongroup_id FOREIGN KEY (option_group_id) REFERENCES catalogue_attributeoptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catal_entity_content_type_id_f7186ab5_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catal_entity_content_type_id_f7186ab5_fk_django_content_type_id FOREIGN KEY (entity_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalo_value_option_id_21026066_fk_catalogue_attributeoption_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catalo_value_option_id_21026066_fk_catalogue_attributeoption_id FOREIGN KEY (value_option_id) REFERENCES catalogue_attributeoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogu_attribute_id_0287c1e7_fk_catalogue_productattribute_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catalogu_attribute_id_0287c1e7_fk_catalogue_productattribute_id FOREIGN KEY (attribute_id) REFERENCES catalogue_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogu_group_id_3d4a5e24_fk_catalogue_attributeoptiongroup_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_attributeoption
    ADD CONSTRAINT catalogu_group_id_3d4a5e24_fk_catalogue_attributeoptiongroup_id FOREIGN KEY (group_id) REFERENCES catalogue_attributeoptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogu_product_class_id_0c6c5b54_fk_catalogue_productclass_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product
    ADD CONSTRAINT catalogu_product_class_id_0c6c5b54_fk_catalogue_productclass_id FOREIGN KEY (product_class_id) REFERENCES catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogu_product_class_id_7af808ec_fk_catalogue_productclass_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattribute
    ADD CONSTRAINT catalogu_product_class_id_7af808ec_fk_catalogue_productclass_id FOREIGN KEY (product_class_id) REFERENCES catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_pr_recommendation_id_daf8ae95_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productrecommendation
    ADD CONSTRAINT catalogue_pr_recommendation_id_daf8ae95_fk_catalogue_product_id FOREIGN KEY (recommendation_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product_category_id_176db535_fk_catalogue_category_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productcategory
    ADD CONSTRAINT catalogue_product_category_id_176db535_fk_catalogue_category_id FOREIGN KEY (category_id) REFERENCES catalogue_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product_p_product_id_ad2b46bd_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_p_product_id_ad2b46bd_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product
    ADD CONSTRAINT catalogue_product_parent_id_9bfd2382_fk_catalogue_product_id FOREIGN KEY (parent_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product_pro_option_id_ff470e13_fk_catalogue_option_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_pro_option_id_ff470e13_fk_catalogue_option_id FOREIGN KEY (option_id) REFERENCES catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productat_product_id_a03cd90e_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productat_product_id_a03cd90e_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productca_product_id_846a4061_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productcategory
    ADD CONSTRAINT catalogue_productca_product_id_846a4061_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productclas_option_id_b099542c_fk_catalogue_option_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclas_option_id_b099542c_fk_catalogue_option_id FOREIGN KEY (option_id) REFERENCES catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productclass_id_732df4c8_fk_catalogue_productclass_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclass_id_732df4c8_fk_catalogue_productclass_id FOREIGN KEY (productclass_id) REFERENCES catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productim_product_id_49474fe8_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productimage
    ADD CONSTRAINT catalogue_productim_product_id_49474fe8_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productre_primary_id_6e51a55c_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productre_primary_id_6e51a55c_fk_catalogue_product_id FOREIGN KEY (primary_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: co_shared_content_id_0333a198_fk_sharedcontent_sharedcontent_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY contentitem_sharedcontent_sharedcontentitem
    ADD CONSTRAINT co_shared_content_id_0333a198_fk_sharedcontent_sharedcontent_id FOREIGN KEY (shared_content_id) REFERENCES sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: conf_setting_site_id_b235f7ed_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY conf_setting
    ADD CONSTRAINT conf_setting_site_id_b235f7ed_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitep_sitepermission_id_d33bc79e_fk_core_sitepermission_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitep_sitepermission_id_d33bc79e_fk_core_sitepermission_id FOREIGN KEY (sitepermission_id) REFERENCES core_sitepermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_sites_site_id_38038b76_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission_sites
    ADD CONSTRAINT core_sitepermission_sites_site_id_38038b76_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_sitepermission_user_id_0a3cbb11_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY core_sitepermission
    ADD CONSTRAINT core_sitepermission_user_id_0a3cbb11_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_email_user_id_a69ad588_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_email
    ADD CONSTRAINT customer_email_user_id_a69ad588_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_notification_recipient_id_d99de5c8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_notification
    ADD CONSTRAINT customer_notification_recipient_id_d99de5c8_fk_auth_user_id FOREIGN KEY (recipient_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_notification_sender_id_affa1632_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_notification
    ADD CONSTRAINT customer_notification_sender_id_affa1632_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_productale_product_id_7e529a41_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_productalert
    ADD CONSTRAINT customer_productale_product_id_7e529a41_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_productalert_user_id_677ad6d6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY customer_productalert
    ADD CONSTRAINT customer_productalert_user_id_677ad6d6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comme_content_type_id_c4afe962_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comme_content_type_id_c4afe962_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_comment_id_d8054933_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_comment_id_d8054933_fk_django_comments_id FOREIGN KEY (comment_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comment_flags_user_id_f3f81f0a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comment_flags
    ADD CONSTRAINT django_comment_flags_user_id_f3f81f0a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_site_id_9dcf666e_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_site_id_9dcf666e_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_comments_user_id_a0a440a1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_comments
    ADD CONSTRAINT django_comments_user_id_a0a440a1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_flatpage_id FOREIGN KEY (flatpage_id) REFERENCES django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_redirect_site_id_c3e37341_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY django_redirect
    ADD CONSTRAINT django_redirect_site_id_c3e37341_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thum_thumbnail_id_c3a0c549_fk_easy_thumbnails_thumbnail_id FOREIGN KEY (thumbnail_id) REFERENCES easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_source_id_5b57bc77_fk_easy_thumbnails_source_id FOREIGN KEY (source_id) REFERENCES easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluen_placeholder_id_fb2e98ff_fk_fluent_contents_placeholder_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluen_placeholder_id_fb2e98ff_fk_fluent_contents_placeholder_id FOREIGN KEY (placeholder_id) REFERENCES fluent_contents_placeholder(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent__polymorphic_ctype_id_8989bd3f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluent__polymorphic_ctype_id_8989bd3f_fk_django_content_type_id FOREIGN KEY (polymorphic_ctype_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_conten_parent_type_id_01f70240_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_placeholder
    ADD CONSTRAINT fluent_conten_parent_type_id_01f70240_fk_django_content_type_id FOREIGN KEY (parent_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_conten_parent_type_id_9a2fbcb3_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_contents_contentitem
    ADD CONSTRAINT fluent_conten_parent_type_id_9a2fbcb3_fk_django_content_type_id FOREIGN KEY (parent_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fluent_coremodulpage_page_ptr_id_97163616_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY fluent_coremodulpage
    ADD CONSTRAINT fluent_coremodulpage_page_ptr_id_97163616_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_field
    ADD CONSTRAINT forms_field_form_id_9ca5dc7e_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_fieldentry
    ADD CONSTRAINT forms_fieldentry_entry_id_c4fdc570_fk_forms_formentry_id FOREIGN KEY (entry_id) REFERENCES forms_formentry(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_form
    ADD CONSTRAINT forms_form_page_ptr_id_d3bcbf3a_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY forms_formentry
    ADD CONSTRAINT forms_formentry_form_id_d0f23912_fk_forms_form_page_ptr_id FOREIGN KEY (form_id) REFERENCES forms_form(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries__gallery_id_af12d3f5_fk_galleries_gallery_page_ptr_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY galleries_galleryimage
    ADD CONSTRAINT galleries__gallery_id_af12d3f5_fk_galleries_gallery_page_ptr_id FOREIGN KEY (gallery_id) REFERENCES galleries_gallery(page_ptr_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY galleries_gallery
    ADD CONSTRAINT galleries_gallery_page_ptr_id_8562ba87_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assi_content_type_id_3dd89a7f_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assi_content_type_id_3dd89a7f_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_assignedkeywo_keyword_id_44c17f9d_fk_generic_keyword_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_assignedkeyword
    ADD CONSTRAINT generic_assignedkeywo_keyword_id_44c17f9d_fk_generic_keyword_id FOREIGN KEY (keyword_id) REFERENCES generic_keyword(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_keyword_site_id_c5be0acc_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_keyword
    ADD CONSTRAINT generic_keyword_site_id_c5be0acc_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rati_content_type_id_eaf475fa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rati_content_type_id_eaf475fa_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_rating_user_id_60020469_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_rating
    ADD CONSTRAINT generic_rating_user_id_60020469_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: generic_threadedc_comment_ptr_id_e208ed60_fk_django_comments_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY generic_threadedcomment
    ADD CONSTRAINT generic_threadedc_comment_ptr_id_e208ed60_fk_django_comments_id FOREIGN KEY (comment_ptr_id) REFERENCES django_comments(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oaut_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oaut_access_token_id_775e84e8_fk_oauth2_provider_accesstoken_id FOREIGN KEY (access_token_id) REFERENCES oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_user_id_6e4c9a65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application_user_id_79829054_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_user_id_79829054_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_user_id_da837fce_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth_application_id_2d1c311b_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth_application_id_2d1c311b_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth_application_id_81923564_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_grant
    ADD CONSTRAINT oauth_application_id_81923564_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth_application_id_b22886e1_fk_oauth2_provider_application_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oauth2_provider_accesstoken
    ADD CONSTRAINT oauth_application_id_b22886e1_fk_oauth2_provider_application_id FOREIGN KEY (application_id) REFERENCES oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_benefit_range_id_ab19c5ab_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_benefit
    ADD CONSTRAINT offer_benefit_range_id_ab19c5ab_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_compoundc_condition_ptr_id_31f2fc34_fk_offer_condition_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition
    ADD CONSTRAINT offer_compoundc_condition_ptr_id_31f2fc34_fk_offer_condition_id FOREIGN KEY (condition_ptr_id) REFERENCES offer_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_compoundcondi_condition_id_aef6058e_fk_offer_condition_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_compoundcondition_subconditions
    ADD CONSTRAINT offer_compoundcondi_condition_id_aef6058e_fk_offer_condition_id FOREIGN KEY (condition_id) REFERENCES offer_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_condition_range_id_b023a2aa_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_condition
    ADD CONSTRAINT offer_condition_range_id_b023a2aa_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionalof_condition_id_e6baa945_fk_offer_condition_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer
    ADD CONSTRAINT offer_conditionalof_condition_id_e6baa945_fk_offer_condition_id FOREIGN KEY (condition_id) REFERENCES offer_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_benefit_id_f43f68b5_fk_offer_benefit_id FOREIGN KEY (benefit_id) REFERENCES offer_benefit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionaloffer_group_group_id_1d98bf28_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer_groups
    ADD CONSTRAINT offer_conditionaloffer_group_group_id_1d98bf28_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionaloffer_id_4471350f_fk_offer_conditionaloffer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_conditionaloffer_groups
    ADD CONSTRAINT offer_conditionaloffer_id_4471350f_fk_offer_conditionaloffer_id FOREIGN KEY (conditionaloffer_id) REFERENCES offer_conditionaloffer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_ran_productclass_id_6f6de46d_fk_catalogue_productclass_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_classes
    ADD CONSTRAINT offer_ran_productclass_id_6f6de46d_fk_catalogue_productclass_id FOREIGN KEY (productclass_id) REFERENCES catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_range_classes_range_id_7d3e573e_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_classes
    ADD CONSTRAINT offer_range_classes_range_id_7d3e573e_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_range_exclude_product_id_78c49bfc_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_excluded_products
    ADD CONSTRAINT offer_range_exclude_product_id_78c49bfc_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_range_excluded_produc_range_id_cce4a032_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_excluded_products
    ADD CONSTRAINT offer_range_excluded_produc_range_id_cce4a032_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_range_inclu_category_id_c61569a5_fk_catalogue_category_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_included_categories
    ADD CONSTRAINT offer_range_inclu_category_id_c61569a5_fk_catalogue_category_id FOREIGN KEY (category_id) REFERENCES catalogue_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_range_included_catego_range_id_1b616138_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_range_included_categories
    ADD CONSTRAINT offer_range_included_catego_range_id_1b616138_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_product_id_723b3ea3_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproduct_range_id_ee358495_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_range_id_ee358495_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproductfileu_uploaded_by_id_c01a3250_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfileu_uploaded_by_id_c01a3250_fk_auth_user_id FOREIGN KEY (uploaded_by_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproductfileuploa_range_id_c055ebf8_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfileuploa_range_id_c055ebf8_fk_offer_range_id FOREIGN KEY (range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: or_event_type_id_4bc9ee29_fk_customer_communicationeventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_communicationevent
    ADD CONSTRAINT or_event_type_id_4bc9ee29_fk_customer_communicationeventtype_id FOREIGN KEY (event_type_id) REFERENCES customer_communicationeventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order__shipping_address_id_57e64931_fk_order_shippingaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order__shipping_address_id_57e64931_fk_order_shippingaddress_id FOREIGN KEY (shipping_address_id) REFERENCES order_shippingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_bill_country_id_17f57dca_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_billingaddress
    ADD CONSTRAINT order_bill_country_id_17f57dca_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_communicationevent_order_id_94e784ac_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_communicationevent
    ADD CONSTRAINT order_communicationevent_order_id_94e784ac_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line_order_id_b9148391_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_order_id_b9148391_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line_partner_id_258a2fb9_fk_partner_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_partner_id_258a2fb9_fk_partner_partner_id FOREIGN KEY (partner_id) REFERENCES partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line_product_id_e620902d_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_product_id_e620902d_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_line
    ADD CONSTRAINT order_line_stockrecord_id_1d65aff5_fk_partner_stockrecord_id FOREIGN KEY (stockrecord_id) REFERENCES partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineattribute_line_id_adf6dd87_fk_order_line_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineattribute
    ADD CONSTRAINT order_lineattribute_line_id_adf6dd87_fk_order_line_id FOREIGN KEY (line_id) REFERENCES order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineattribute_option_id_b54d597c_fk_catalogue_option_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineattribute
    ADD CONSTRAINT order_lineattribute_option_id_b54d597c_fk_catalogue_option_id FOREIGN KEY (option_id) REFERENCES catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineprice_line_id_2de52446_fk_order_line_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineprice
    ADD CONSTRAINT order_lineprice_line_id_2de52446_fk_order_line_id FOREIGN KEY (line_id) REFERENCES order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineprice_order_id_66792e56_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_lineprice
    ADD CONSTRAINT order_lineprice_order_id_66792e56_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_or_billing_address_id_8fe537cf_fk_order_billingaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_or_billing_address_id_8fe537cf_fk_order_billingaddress_id FOREIGN KEY (billing_address_id) REFERENCES order_billingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_basket_id_8b0acbb2_fk_basket_basket_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_order_basket_id_8b0acbb2_fk_basket_basket_id FOREIGN KEY (basket_id) REFERENCES basket_basket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_site_id_e27f3526_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_order_site_id_e27f3526_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order_user_id_7cf9bc2b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderdiscount_order_id_bc91e123_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_orderdiscount
    ADD CONSTRAINT order_orderdiscount_order_id_bc91e123_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote_order_id_7d97583d_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_ordernote
    ADD CONSTRAINT order_ordernote_order_id_7d97583d_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote_user_id_48d7a672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_ordernote
    ADD CONSTRAINT order_ordernote_user_id_48d7a672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paym_shipping_event_id_213dcfb8_fk_order_shippingevent_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymentevent
    ADD CONSTRAINT order_paym_shipping_event_id_213dcfb8_fk_order_shippingevent_id FOREIGN KEY (shipping_event_id) REFERENCES order_shippingevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_payme_event_type_id_568c7161_fk_order_paymenteventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymentevent
    ADD CONSTRAINT order_payme_event_type_id_568c7161_fk_order_paymenteventtype_id FOREIGN KEY (event_type_id) REFERENCES order_paymenteventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymentevent_order_id_395b3e82_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymentevent
    ADD CONSTRAINT order_paymentevent_order_id_395b3e82_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymenteventqu_event_id_a540165a_fk_order_paymentevent_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventqu_event_id_a540165a_fk_order_paymentevent_id FOREIGN KEY (event_id) REFERENCES order_paymentevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymenteventquantity_line_id_df44b021_fk_order_line_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_line_id_df44b021_fk_order_line_id FOREIGN KEY (line_id) REFERENCES order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ship_country_id_29abf9a0_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingaddress
    ADD CONSTRAINT order_ship_country_id_29abf9a0_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ship_event_type_id_9f1efb20_fk_order_shippingeventtype_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingevent
    ADD CONSTRAINT order_ship_event_type_id_9f1efb20_fk_order_shippingeventtype_id FOREIGN KEY (event_type_id) REFERENCES order_shippingeventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingevent_event_id_1c7fb9c7_fk_order_shippingevent_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventquantity
    ADD CONSTRAINT order_shippingevent_event_id_1c7fb9c7_fk_order_shippingevent_id FOREIGN KEY (event_id) REFERENCES order_shippingevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingevent_order_id_8c031fb6_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingevent
    ADD CONSTRAINT order_shippingevent_order_id_8c031fb6_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_line_id_3b089ee0_fk_order_line_id FOREIGN KEY (line_id) REFERENCES order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_acco_destination_id_540bd15f_fk_oscar_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_acco_destination_id_540bd15f_fk_oscar_accounts_account_id FOREIGN KEY (destination_id) REFERENCES oscar_accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accoun_transfer_id_08f32042_fk_oscar_accounts_transfer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transaction
    ADD CONSTRAINT oscar_accoun_transfer_id_08f32042_fk_oscar_accounts_transfer_id FOREIGN KEY (transfer_id) REFERENCES oscar_accounts_transfer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_account_type_id_ce445182_fk_oscar_accounts_accounttype_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_account_type_id_ce445182_fk_oscar_accounts_accounttype_id FOREIGN KEY (account_type_id) REFERENCES oscar_accounts_accounttype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts__source_id_0f016dfb_fk_oscar_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_accounts__source_id_0f016dfb_fk_oscar_accounts_account_id FOREIGN KEY (source_id) REFERENCES oscar_accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_acco_product_range_id_b773d7c3_fk_offer_range_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_accounts_acco_product_range_id_b773d7c3_fk_offer_range_id FOREIGN KEY (product_range_id) REFERENCES offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_account_id_5ba1ded6_fk_oscar_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account_secondary_users
    ADD CONSTRAINT oscar_accounts_account_id_5ba1ded6_fk_oscar_accounts_account_id FOREIGN KEY (account_id) REFERENCES oscar_accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_account_id_c9c544ff_fk_oscar_accounts_account_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transaction
    ADD CONSTRAINT oscar_accounts_account_id_c9c544ff_fk_oscar_accounts_account_id FOREIGN KEY (account_id) REFERENCES oscar_accounts_account(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_account_primary_user_id_95919c13_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account
    ADD CONSTRAINT oscar_accounts_account_primary_user_id_95919c13_fk_auth_user_id FOREIGN KEY (primary_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_account_seconda_user_id_b4a44a6f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_account_secondary_users
    ADD CONSTRAINT oscar_accounts_account_seconda_user_id_b4a44a6f_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_parent_id_e1d7ef5b_fk_oscar_accounts_transfer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_accounts_parent_id_e1d7ef5b_fk_oscar_accounts_transfer_id FOREIGN KEY (parent_id) REFERENCES oscar_accounts_transfer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_accounts_transfer_user_id_c34c8716_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_accounts_transfer
    ADD CONSTRAINT oscar_accounts_transfer_user_id_c34c8716_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_parent_id_ad3937b3_fk_oscar_wagtail_productlistsnippet_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistitem
    ADD CONSTRAINT oscar_parent_id_ad3937b3_fk_oscar_wagtail_productlistsnippet_id FOREIGN KEY (parent_id) REFERENCES oscar_wagtail_productlistsnippet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oscar_wagtail_produ_product_id_cd8f4610_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY oscar_wagtail_productlistitem
    ADD CONSTRAINT oscar_wagtail_produ_product_id_cd8f4610_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_link_page_ptr_id_37d469f7_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_link
    ADD CONSTRAINT pages_link_page_ptr_id_37d469f7_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_parent_id_133fa4d3_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_parent_id_133fa4d3_fk_pages_page_id FOREIGN KEY (parent_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_page_site_id_47a43e5b_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_page
    ADD CONSTRAINT pages_page_site_id_47a43e5b_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pages_richtextpage
    ADD CONSTRAINT pages_richtextpage_page_ptr_id_8ca99b83_fk_pages_page_id FOREIGN KEY (page_ptr_id) REFERENCES pages_page(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_pa_country_id_02c4f979_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partneraddress
    ADD CONSTRAINT partner_pa_country_id_02c4f979_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partner_users_partner_id_1883dfd9_fk_partner_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner_users
    ADD CONSTRAINT partner_partner_users_partner_id_1883dfd9_fk_partner_partner_id FOREIGN KEY (partner_id) REFERENCES partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partner_users_user_id_d75d6e40_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partner_users
    ADD CONSTRAINT partner_partner_users_user_id_d75d6e40_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partneraddres_partner_id_59551b0a_fk_partner_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_partneraddress
    ADD CONSTRAINT partner_partneraddres_partner_id_59551b0a_fk_partner_partner_id FOREIGN KEY (partner_id) REFERENCES partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stock_stockrecord_id_68ad503a_fk_partner_stockrecord_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockalert
    ADD CONSTRAINT partner_stock_stockrecord_id_68ad503a_fk_partner_stockrecord_id FOREIGN KEY (stockrecord_id) REFERENCES partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stockrecord_partner_id_4155a586_fk_partner_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_partner_id_4155a586_fk_partner_partner_id FOREIGN KEY (partner_id) REFERENCES partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_product_id_62fd9e45_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_bankcard_user_id_08e1d04c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_bankcard
    ADD CONSTRAINT payment_bankcard_user_id_08e1d04c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_source_order_id_6b7f2215_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_source
    ADD CONSTRAINT payment_source_order_id_6b7f2215_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_source_source_type_id_700828fe_fk_payment_sourcetype_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_source
    ADD CONSTRAINT payment_source_source_type_id_700828fe_fk_payment_sourcetype_id FOREIGN KEY (source_type_id) REFERENCES payment_sourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_transaction_source_id_c5ac31e8_fk_payment_source_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY payment_transaction
    ADD CONSTRAINT payment_transaction_source_id_c5ac31e8_fk_payment_source_id FOREIGN KEY (source_id) REFERENCES payment_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax__subscription_id_5931b291_fk_pinax_stripe_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoiceitem
    ADD CONSTRAINT pinax__subscription_id_5931b291_fk_pinax_stripe_subscription_id FOREIGN KEY (subscription_id) REFERENCES pinax_stripe_subscription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax__subscription_id_d5917133_fk_pinax_stripe_subscription_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice
    ADD CONSTRAINT pinax__subscription_id_d5917133_fk_pinax_stripe_subscription_id FOREIGN KEY (subscription_id) REFERENCES pinax_stripe_subscription(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_b_customer_id_39d40560_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_bitcoinreceiver
    ADD CONSTRAINT pinax_stripe_b_customer_id_39d40560_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_c_customer_id_a370a8b8_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_charge
    ADD CONSTRAINT pinax_stripe_c_customer_id_a370a8b8_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_c_customer_id_bb30b7ec_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_card
    ADD CONSTRAINT pinax_stripe_c_customer_id_bb30b7ec_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_cha_invoice_id_bb6e58e0_fk_pinax_stripe_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_charge
    ADD CONSTRAINT pinax_stripe_cha_invoice_id_bb6e58e0_fk_pinax_stripe_invoice_id FOREIGN KEY (invoice_id) REFERENCES pinax_stripe_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_customer_user_id_ae4f84ed_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_customer
    ADD CONSTRAINT pinax_stripe_customer_user_id_ae4f84ed_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_e_customer_id_c1c71259_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_event
    ADD CONSTRAINT pinax_stripe_e_customer_id_c1c71259_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_eventpr_event_id_be3f2eed_fk_pinax_stripe_event_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_eventprocessingexception
    ADD CONSTRAINT pinax_stripe_eventpr_event_id_be3f2eed_fk_pinax_stripe_event_id FOREIGN KEY (event_id) REFERENCES pinax_stripe_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_i_customer_id_7ae23cf9_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice
    ADD CONSTRAINT pinax_stripe_i_customer_id_7ae23cf9_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_inv_invoice_id_76f586b7_fk_pinax_stripe_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoiceitem
    ADD CONSTRAINT pinax_stripe_inv_invoice_id_76f586b7_fk_pinax_stripe_invoice_id FOREIGN KEY (invoice_id) REFERENCES pinax_stripe_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_invoi_charge_id_eb59524b_fk_pinax_stripe_charge_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoice
    ADD CONSTRAINT pinax_stripe_invoi_charge_id_eb59524b_fk_pinax_stripe_charge_id FOREIGN KEY (charge_id) REFERENCES pinax_stripe_charge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_invoiceit_plan_id_749f3d51_fk_pinax_stripe_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_invoiceitem
    ADD CONSTRAINT pinax_stripe_invoiceit_plan_id_749f3d51_fk_pinax_stripe_plan_id FOREIGN KEY (plan_id) REFERENCES pinax_stripe_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_s_customer_id_b2fa12eb_fk_pinax_stripe_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_subscription
    ADD CONSTRAINT pinax_stripe_s_customer_id_b2fa12eb_fk_pinax_stripe_customer_id FOREIGN KEY (customer_id) REFERENCES pinax_stripe_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_subscript_plan_id_245fbbc7_fk_pinax_stripe_plan_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_subscription
    ADD CONSTRAINT pinax_stripe_subscript_plan_id_245fbbc7_fk_pinax_stripe_plan_id FOREIGN KEY (plan_id) REFERENCES pinax_stripe_plan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_t_transfer_id_a29e5837_fk_pinax_stripe_transfer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transferchargefee
    ADD CONSTRAINT pinax_stripe_t_transfer_id_a29e5837_fk_pinax_stripe_transfer_id FOREIGN KEY (transfer_id) REFERENCES pinax_stripe_transfer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: pinax_stripe_transfe_event_id_775b2242_fk_pinax_stripe_event_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY pinax_stripe_transfer
    ADD CONSTRAINT pinax_stripe_transfe_event_id_775b2242_fk_pinax_stripe_event_id FOREIGN KEY (event_id) REFERENCES pinax_stripe_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promoti_list_id_94f390b0_fk_promotions_handpickedproductlist_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproduct
    ADD CONSTRAINT promoti_list_id_94f390b0_fk_promotions_handpickedproductlist_id FOREIGN KEY (list_id) REFERENCES promotions_handpickedproductlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotion_tabbed_block_id_a018e8d5_fk_promotions_tabbedblock_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproductlist
    ADD CONSTRAINT promotion_tabbed_block_id_a018e8d5_fk_promotions_tabbedblock_id FOREIGN KEY (tabbed_block_id) REFERENCES promotions_tabbedblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_k_content_type_id_91959aa4_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_keywordpromotion
    ADD CONSTRAINT promotions_k_content_type_id_91959aa4_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_m_multiimage_id_62ed9a9f_fk_promotions_multiimage_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage_images
    ADD CONSTRAINT promotions_m_multiimage_id_62ed9a9f_fk_promotions_multiimage_id FOREIGN KEY (multiimage_id) REFERENCES promotions_multiimage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_multiimage__image_id_bb6eca34_fk_promotions_image_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_multiimage_images
    ADD CONSTRAINT promotions_multiimage__image_id_bb6eca34_fk_promotions_image_id FOREIGN KEY (image_id) REFERENCES promotions_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_orderedp_product_id_94dede36_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_orderedproduct
    ADD CONSTRAINT promotions_orderedp_product_id_94dede36_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_p_content_type_id_00707bff_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_pagepromotion
    ADD CONSTRAINT promotions_p_content_type_id_00707bff_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: promotions_singlepr_product_id_d7ad5e03_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY promotions_singleproduct
    ADD CONSTRAINT promotions_singlepr_product_id_d7ad5e03_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_api_registrationp_user_id_4674d279_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_api_registrationprofile
    ADD CONSTRAINT registration_api_registrationp_user_id_4674d279_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY registration_registrationprofile
    ADD CONSTRAINT registration_registrationprofi_user_id_5fcbf725_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_productrevi_product_id_52e52a32_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_productreview
    ADD CONSTRAINT reviews_productrevi_product_id_52e52a32_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_productreview_user_id_8acb5ddd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_productreview
    ADD CONSTRAINT reviews_productreview_user_id_8acb5ddd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_vote
    ADD CONSTRAINT reviews_vote_review_id_371b2d8d_fk_reviews_productreview_id FOREIGN KEY (review_id) REFERENCES reviews_productreview(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_vote_user_id_5fb87b53_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY reviews_vote
    ADD CONSTRAINT reviews_vote_user_id_5fb87b53_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcont_master_id_ff437c98_fk_sharedcontent_sharedcontent_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent_translation
    ADD CONSTRAINT sharedcont_master_id_ff437c98_fk_sharedcontent_sharedcontent_id FOREIGN KEY (master_id) REFERENCES sharedcontent_sharedcontent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: sharedcontent_sharedc_parent_site_id_c9ee0f73_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY sharedcontent_sharedcontent
    ADD CONSTRAINT sharedcontent_sharedc_parent_site_id_c9ee0f73_fk_django_site_id FOREIGN KEY (parent_site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ship_shippingcompany_id_2d6c4efb_fk_shipping_shippingcompany_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_containers
    ADD CONSTRAINT ship_shippingcompany_id_2d6c4efb_fk_shipping_shippingcompany_id FOREIGN KEY (shippingcompany_id) REFERENCES shipping_shippingcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ship_shippingcompany_id_fa0a587e_fk_shipping_shippingcompany_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_countries
    ADD CONSTRAINT ship_shippingcompany_id_fa0a587e_fk_shipping_shippingcompany_id FOREIGN KEY (shippingcompany_id) REFERENCES shipping_shippingcompany(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_o_country_id_30387f2e_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_o_country_id_30387f2e_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_s_country_id_4c976fc4_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_countries
    ADD CONSTRAINT shipping_s_country_id_4c976fc4_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_w_country_id_06117384_fk_address_country_iso_3166_1_a2; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased_countries
    ADD CONSTRAINT shipping_w_country_id_06117384_fk_address_country_iso_3166_1_a2 FOREIGN KEY (country_id) REFERENCES address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_wei_weightbased_id_93e3132f_fk_shipping_weightbased_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightbased_countries
    ADD CONSTRAINT shipping_wei_weightbased_id_93e3132f_fk_shipping_weightbased_id FOREIGN KEY (weightbased_id) REFERENCES shipping_weightbased(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_weightba_method_id_b699a1ba_fk_shipping_weightbased_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_weightband
    ADD CONSTRAINT shipping_weightba_method_id_b699a1ba_fk_shipping_weightbased_id FOREIGN KEY (method_id) REFERENCES shipping_weightbased(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shippingcontainer_id_50d9ae57_fk_shipping_shippingcontainer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY shipping_shippingcompany_containers
    ADD CONSTRAINT shippingcontainer_id_50d9ae57_fk_shipping_shippingcontainer_id FOREIGN KEY (shippingcontainer_id) REFERENCES shipping_shippingcontainer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialacc_account_id_951f210e_fk_socialaccount_socialaccount_id FOREIGN KEY (account_id) REFERENCES socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccou_socialapp_id_97fb6e7d_fk_socialaccount_socialapp_id FOREIGN KEY (socialapp_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_soc_app_id_636a42d7_fk_socialaccount_socialapp_id FOREIGN KEY (app_id) REFERENCES socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_site_site_id_2579dee5_fk_django_site_id FOREIGN KEY (site_id) REFERENCES django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tastypie_apikey_user_id_8c8fa920_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY tastypie_apikey
    ADD CONSTRAINT tastypie_apikey_user_id_8c8fa920_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: twitter_tweet_query_id_bd42b699_fk_twitter_query_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY twitter_tweet
    ADD CONSTRAINT twitter_tweet_query_id_bd42b699_fk_twitter_query_id FOREIGN KEY (query_id) REFERENCES twitter_query(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: vouch_conditionaloffer_id_f9682bfb_fk_offer_conditionaloffer_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_offers
    ADD CONSTRAINT vouch_conditionaloffer_id_f9682bfb_fk_offer_conditionaloffer_id FOREIGN KEY (conditionaloffer_id) REFERENCES offer_conditionaloffer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucher_group_voucher_id_bde2b9e1_fk_voucher_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_groups
    ADD CONSTRAINT voucher_voucher_group_voucher_id_bde2b9e1_fk_voucher_voucher_id FOREIGN KEY (voucher_id) REFERENCES voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucher_groups_group_id_9d69a7ec_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_groups
    ADD CONSTRAINT voucher_voucher_groups_group_id_9d69a7ec_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucher_offer_voucher_id_7f9c575d_fk_voucher_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher_offers
    ADD CONSTRAINT voucher_voucher_offer_voucher_id_7f9c575d_fk_voucher_voucher_id FOREIGN KEY (voucher_id) REFERENCES voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucher_parent_id_53e715e4_fk_voucher_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucher
    ADD CONSTRAINT voucher_voucher_parent_id_53e715e4_fk_voucher_voucher_id FOREIGN KEY (parent_id) REFERENCES voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplic_voucher_id_5204edb7_fk_voucher_voucher_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplic_voucher_id_5204edb7_fk_voucher_voucher_id FOREIGN KEY (voucher_id) REFERENCES voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplication_order_id_30248a05_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_order_id_30248a05_fk_order_order_id FOREIGN KEY (order_id) REFERENCES order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplication_user_id_df53a393_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_user_id_df53a393_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_node_content_type_id_5d78c811_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_node
    ADD CONSTRAINT widgy_node_content_type_id_5d78c811_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versioncom_tracker_id_fe2bf1e8_fk_widgy_versiontracker_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit
    ADD CONSTRAINT widgy_versioncom_tracker_id_fe2bf1e8_fk_widgy_versiontracker_id FOREIGN KEY (tracker_id) REFERENCES widgy_versiontracker(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versioncommi_parent_id_0a54a581_fk_widgy_versioncommit_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit
    ADD CONSTRAINT widgy_versioncommi_parent_id_0a54a581_fk_widgy_versioncommit_id FOREIGN KEY (parent_id) REFERENCES widgy_versioncommit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versioncommit_author_id_80666168_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit
    ADD CONSTRAINT widgy_versioncommit_author_id_80666168_fk_auth_user_id FOREIGN KEY (author_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versioncommit_root_node_id_a4c7da12_fk_widgy_node_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versioncommit
    ADD CONSTRAINT widgy_versioncommit_root_node_id_a4c7da12_fk_widgy_node_id FOREIGN KEY (root_node_id) REFERENCES widgy_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versiontracker_head_id_5b687d8d_fk_widgy_versioncommit_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker
    ADD CONSTRAINT widgy_versiontracker_head_id_5b687d8d_fk_widgy_versioncommit_id FOREIGN KEY (head_id) REFERENCES widgy_versioncommit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: widgy_versiontracker_working_copy_id_e7b37561_fk_widgy_node_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY widgy_versiontracker
    ADD CONSTRAINT widgy_versiontracker_working_copy_id_e7b37561_fk_widgy_node_id FOREIGN KEY (working_copy_id) REFERENCES widgy_node(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_line
    ADD CONSTRAINT wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_line_wishlist_id_4cffe302_fk_wishlists_wishlist_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_line
    ADD CONSTRAINT wishlists_line_wishlist_id_4cffe302_fk_wishlists_wishlist_id FOREIGN KEY (wishlist_id) REFERENCES wishlists_wishlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


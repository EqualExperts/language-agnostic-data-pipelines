--
-- PostgreSQL database dump
--

-- Dumped from database version 11.11
-- Dumped by pg_dump version 11.11

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

SET default_with_oids = false;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    topic character varying(32) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer,
    model character varying(16),
    model_id integer,
    database_id integer,
    table_id integer,
    custom_id character varying(48),
    details character varying NOT NULL
);


ALTER TABLE public.activity OWNER TO metabase_user;

--
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq OWNER TO metabase_user;

--
-- Name: activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.activity_id_seq OWNED BY public.activity.id;


--
-- Name: card_label; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.card_label (
    id integer NOT NULL,
    card_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.card_label OWNER TO metabase_user;

--
-- Name: card_label_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.card_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_label_id_seq OWNER TO metabase_user;

--
-- Name: card_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.card_label_id_seq OWNED BY public.card_label.id;


--
-- Name: collection; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    color character(7) NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    location character varying(254) DEFAULT '/'::character varying NOT NULL,
    personal_owner_id integer,
    slug character varying(254) NOT NULL,
    namespace character varying(254)
);


ALTER TABLE public.collection OWNER TO metabase_user;

--
-- Name: TABLE collection; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.collection IS 'Collections are an optional way to organize Cards and handle permissions for them.';


--
-- Name: COLUMN collection.name; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.name IS 'The user-facing name of this Collection.';


--
-- Name: COLUMN collection.description; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.description IS 'Optional description for this Collection.';


--
-- Name: COLUMN collection.color; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.color IS 'Seven-character hex color for this Collection, including the preceding hash sign.';


--
-- Name: COLUMN collection.archived; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.archived IS 'Whether this Collection has been archived and should be hidden from users.';


--
-- Name: COLUMN collection.location; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.location IS 'Directory-structure path of ancestor Collections. e.g. "/1/2/" means our Parent is Collection 2, and their parent is Collection 1.';


--
-- Name: COLUMN collection.personal_owner_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.personal_owner_id IS 'If set, this Collection is a personal Collection, for exclusive use of the User with this ID.';


--
-- Name: COLUMN collection.slug; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.slug IS 'Sluggified version of the Collection name. Used only for display purposes in URL; not unique or indexed.';


--
-- Name: COLUMN collection.namespace; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection.namespace IS 'The namespace (hierachy) this Collection belongs to. NULL means the Collection is in the default namespace.';


--
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO metabase_user;

--
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- Name: collection_revision; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.collection_revision (
    id integer NOT NULL,
    before text NOT NULL,
    after text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    remark text
);


ALTER TABLE public.collection_revision OWNER TO metabase_user;

--
-- Name: TABLE collection_revision; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.collection_revision IS 'Used to keep track of changes made to collections.';


--
-- Name: COLUMN collection_revision.before; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection_revision.before IS 'Serialized JSON of the collections graph before the changes.';


--
-- Name: COLUMN collection_revision.after; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection_revision.after IS 'Serialized JSON of the collections graph after the changes.';


--
-- Name: COLUMN collection_revision.user_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection_revision.user_id IS 'The ID of the admin who made this set of changes.';


--
-- Name: COLUMN collection_revision.created_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection_revision.created_at IS 'The timestamp of when these changes were made.';


--
-- Name: COLUMN collection_revision.remark; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.collection_revision.remark IS 'Optional remarks explaining why these changes were made.';


--
-- Name: collection_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.collection_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_revision_id_seq OWNER TO metabase_user;

--
-- Name: collection_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.collection_revision_id_seq OWNED BY public.collection_revision.id;


--
-- Name: computation_job; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.computation_job (
    id integer NOT NULL,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying(254) NOT NULL,
    status character varying(254) NOT NULL,
    context text,
    ended_at timestamp without time zone
);


ALTER TABLE public.computation_job OWNER TO metabase_user;

--
-- Name: TABLE computation_job; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.computation_job IS 'Stores submitted async computation jobs.';


--
-- Name: computation_job_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.computation_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computation_job_id_seq OWNER TO metabase_user;

--
-- Name: computation_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.computation_job_id_seq OWNED BY public.computation_job.id;


--
-- Name: computation_job_result; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.computation_job_result (
    id integer NOT NULL,
    job_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    permanence character varying(254) NOT NULL,
    payload text NOT NULL
);


ALTER TABLE public.computation_job_result OWNER TO metabase_user;

--
-- Name: TABLE computation_job_result; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.computation_job_result IS 'Stores results of async computation jobs.';


--
-- Name: computation_job_result_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.computation_job_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computation_job_result_id_seq OWNER TO metabase_user;

--
-- Name: computation_job_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.computation_job_result_id_seq OWNED BY public.computation_job_result.id;


--
-- Name: core_session; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.core_session (
    id character varying(254) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    anti_csrf_token text
);


ALTER TABLE public.core_session OWNER TO metabase_user;

--
-- Name: COLUMN core_session.anti_csrf_token; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.core_session.anti_csrf_token IS 'Anti-CSRF token for full-app embed sessions.';


--
-- Name: core_user; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.core_user (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(254) NOT NULL,
    last_name character varying(254) NOT NULL,
    password character varying(254) NOT NULL,
    password_salt character varying(254) DEFAULT 'default'::character varying NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_active boolean NOT NULL,
    reset_token character varying(254),
    reset_triggered bigint,
    is_qbnewb boolean DEFAULT true NOT NULL,
    google_auth boolean DEFAULT false NOT NULL,
    ldap_auth boolean DEFAULT false NOT NULL,
    login_attributes text,
    updated_at timestamp without time zone,
    sso_source character varying(254),
    locale character varying(5)
);


ALTER TABLE public.core_user OWNER TO metabase_user;

--
-- Name: COLUMN core_user.login_attributes; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.core_user.login_attributes IS 'JSON serialized map with attributes used for row level permissions';


--
-- Name: COLUMN core_user.updated_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.core_user.updated_at IS 'When was this User last updated?';


--
-- Name: COLUMN core_user.sso_source; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.core_user.sso_source IS 'String to indicate the SSO backend the user is from';


--
-- Name: COLUMN core_user.locale; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.core_user.locale IS 'Preferred ISO locale (language/country) code, e.g "en" or "en-US", for this User. Overrides site default.';


--
-- Name: core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.core_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_user_id_seq OWNER TO metabase_user;

--
-- Name: core_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.core_user_id_seq OWNED BY public.core_user.id;


--
-- Name: dashboard_favorite; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.dashboard_favorite (
    id integer NOT NULL,
    user_id integer NOT NULL,
    dashboard_id integer NOT NULL
);


ALTER TABLE public.dashboard_favorite OWNER TO metabase_user;

--
-- Name: TABLE dashboard_favorite; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.dashboard_favorite IS 'Presence of a row here indicates a given User has favorited a given Dashboard.';


--
-- Name: COLUMN dashboard_favorite.user_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dashboard_favorite.user_id IS 'ID of the User who favorited the Dashboard.';


--
-- Name: COLUMN dashboard_favorite.dashboard_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dashboard_favorite.dashboard_id IS 'ID of the Dashboard favorited by the User.';


--
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.dashboard_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_favorite_id_seq OWNER TO metabase_user;

--
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.dashboard_favorite_id_seq OWNED BY public.dashboard_favorite.id;


--
-- Name: dashboardcard_series; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.dashboardcard_series (
    id integer NOT NULL,
    dashboardcard_id integer NOT NULL,
    card_id integer NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.dashboardcard_series OWNER TO metabase_user;

--
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.dashboardcard_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboardcard_series_id_seq OWNER TO metabase_user;

--
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.dashboardcard_series_id_seq OWNED BY public.dashboardcard_series.id;


--
-- Name: data_migrations; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.data_migrations (
    id character varying(254) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.data_migrations OWNER TO metabase_user;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO metabase_user;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO metabase_user;

--
-- Name: dependency; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.dependency (
    id integer NOT NULL,
    model character varying(32) NOT NULL,
    model_id integer NOT NULL,
    dependent_on_model character varying(32) NOT NULL,
    dependent_on_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dependency OWNER TO metabase_user;

--
-- Name: dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.dependency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependency_id_seq OWNER TO metabase_user;

--
-- Name: dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.dependency_id_seq OWNED BY public.dependency.id;


--
-- Name: dimension; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.dimension (
    id integer NOT NULL,
    field_id integer NOT NULL,
    name character varying(254) NOT NULL,
    type character varying(254) NOT NULL,
    human_readable_field_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dimension OWNER TO metabase_user;

--
-- Name: TABLE dimension; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.dimension IS 'Stores references to alternate views of existing fields, such as remapping an integer to a description, like an enum';


--
-- Name: COLUMN dimension.field_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.field_id IS 'ID of the field this dimension row applies to';


--
-- Name: COLUMN dimension.name; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.name IS 'Short description used as the display name of this new column';


--
-- Name: COLUMN dimension.type; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.type IS 'Either internal for a user defined remapping or external for a foreign key based remapping';


--
-- Name: COLUMN dimension.human_readable_field_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.human_readable_field_id IS 'Only used with external type remappings. Indicates which field on the FK related table to use for display';


--
-- Name: COLUMN dimension.created_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.created_at IS 'The timestamp of when the dimension was created.';


--
-- Name: COLUMN dimension.updated_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.dimension.updated_at IS 'The timestamp of when these dimension was last updated.';


--
-- Name: dimension_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.dimension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimension_id_seq OWNER TO metabase_user;

--
-- Name: dimension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.dimension_id_seq OWNED BY public.dimension.id;


--
-- Name: group_table_access_policy; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.group_table_access_policy (
    id integer NOT NULL,
    group_id integer NOT NULL,
    table_id integer NOT NULL,
    card_id integer,
    attribute_remappings text
);


ALTER TABLE public.group_table_access_policy OWNER TO metabase_user;

--
-- Name: TABLE group_table_access_policy; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.group_table_access_policy IS 'Records that a given Card (Question) should automatically replace a given Table as query source for a given a Perms Group.';


--
-- Name: COLUMN group_table_access_policy.group_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.group_table_access_policy.group_id IS 'ID of the Permissions Group this policy affects.';


--
-- Name: COLUMN group_table_access_policy.table_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.group_table_access_policy.table_id IS 'ID of the Table that should get automatically replaced as query source for the Permissions Group.';


--
-- Name: COLUMN group_table_access_policy.card_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.group_table_access_policy.card_id IS 'ID of the Card (Question) to be used to replace the Table.';


--
-- Name: COLUMN group_table_access_policy.attribute_remappings; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.group_table_access_policy.attribute_remappings IS 'JSON-encoded map of user attribute identifier to the param name used in the Card.';


--
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.group_table_access_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_table_access_policy_id_seq OWNER TO metabase_user;

--
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.group_table_access_policy_id_seq OWNED BY public.group_table_access_policy.id;


--
-- Name: label; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.label (
    id integer NOT NULL,
    name character varying(254) NOT NULL,
    slug character varying(254) NOT NULL,
    icon character varying(128)
);


ALTER TABLE public.label OWNER TO metabase_user;

--
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_id_seq OWNER TO metabase_user;

--
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- Name: metabase_database; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metabase_database (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    details text,
    engine character varying(254) NOT NULL,
    is_sample boolean DEFAULT false NOT NULL,
    is_full_sync boolean DEFAULT true NOT NULL,
    points_of_interest text,
    caveats text,
    metadata_sync_schedule character varying(254) DEFAULT '0 50 * * * ? *'::character varying NOT NULL,
    cache_field_values_schedule character varying(254) DEFAULT '0 50 0 * * ? *'::character varying NOT NULL,
    timezone character varying(254),
    is_on_demand boolean DEFAULT false NOT NULL,
    options text,
    auto_run_queries boolean DEFAULT true NOT NULL
);


ALTER TABLE public.metabase_database OWNER TO metabase_user;

--
-- Name: COLUMN metabase_database.metadata_sync_schedule; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.metadata_sync_schedule IS 'The cron schedule string for when this database should undergo the metadata sync process (and analysis for new fields).';


--
-- Name: COLUMN metabase_database.cache_field_values_schedule; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.cache_field_values_schedule IS 'The cron schedule string for when FieldValues for eligible Fields should be updated.';


--
-- Name: COLUMN metabase_database.timezone; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.timezone IS 'Timezone identifier for the database, set by the sync process';


--
-- Name: COLUMN metabase_database.is_on_demand; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.is_on_demand IS 'Whether we should do On-Demand caching of FieldValues for this DB. This means FieldValues are updated when their Field is used in a Dashboard or Card param.';


--
-- Name: COLUMN metabase_database.options; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.options IS 'Serialized JSON containing various options like QB behavior.';


--
-- Name: COLUMN metabase_database.auto_run_queries; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_database.auto_run_queries IS 'Whether to automatically run queries when doing simple filtering and summarizing in the Query Builder.';


--
-- Name: metabase_database_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metabase_database_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_database_id_seq OWNER TO metabase_user;

--
-- Name: metabase_database_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metabase_database_id_seq OWNED BY public.metabase_database.id;


--
-- Name: metabase_field; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metabase_field (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    base_type character varying(255) NOT NULL,
    special_type character varying(255),
    active boolean DEFAULT true NOT NULL,
    description text,
    preview_display boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    table_id integer NOT NULL,
    parent_id integer,
    display_name character varying(254),
    visibility_type character varying(32) DEFAULT 'normal'::character varying NOT NULL,
    fk_target_field_id integer,
    last_analyzed timestamp with time zone,
    points_of_interest text,
    caveats text,
    fingerprint text,
    fingerprint_version integer DEFAULT 0 NOT NULL,
    database_type text NOT NULL,
    has_field_values text,
    settings text,
    database_position integer DEFAULT 0 NOT NULL,
    custom_position integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.metabase_field OWNER TO metabase_user;

--
-- Name: COLUMN metabase_field.fingerprint; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_field.fingerprint IS 'Serialized JSON containing non-identifying information about this Field, such as min, max, and percent JSON. Used for classification.';


--
-- Name: COLUMN metabase_field.fingerprint_version; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_field.fingerprint_version IS 'The version of the fingerprint for this Field. Used so we can keep track of which Fields need to be analyzed again when new things are added to fingerprints.';


--
-- Name: COLUMN metabase_field.database_type; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_field.database_type IS 'The actual type of this column in the database. e.g. VARCHAR or TEXT.';


--
-- Name: COLUMN metabase_field.has_field_values; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_field.has_field_values IS 'Whether we have FieldValues ("list"), should ad-hoc search ("search"), disable entirely ("none"), or infer dynamically (null)"';


--
-- Name: COLUMN metabase_field.settings; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.metabase_field.settings IS 'Serialized JSON FE-specific settings like formatting, etc. Scope of what is stored here may increase in future.';


--
-- Name: metabase_field_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metabase_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_field_id_seq OWNER TO metabase_user;

--
-- Name: metabase_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metabase_field_id_seq OWNED BY public.metabase_field.id;


--
-- Name: metabase_fieldvalues; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metabase_fieldvalues (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "values" text,
    human_readable_values text,
    field_id integer NOT NULL
);


ALTER TABLE public.metabase_fieldvalues OWNER TO metabase_user;

--
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metabase_fieldvalues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_fieldvalues_id_seq OWNER TO metabase_user;

--
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metabase_fieldvalues_id_seq OWNED BY public.metabase_fieldvalues.id;


--
-- Name: metabase_table; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metabase_table (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    entity_name character varying(254),
    entity_type character varying(254),
    active boolean NOT NULL,
    db_id integer NOT NULL,
    display_name character varying(254),
    visibility_type character varying(254),
    schema character varying(254),
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL,
    field_order character varying(254) DEFAULT 'database'::character varying NOT NULL
);


ALTER TABLE public.metabase_table OWNER TO metabase_user;

--
-- Name: metabase_table_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metabase_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_table_id_seq OWNER TO metabase_user;

--
-- Name: metabase_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metabase_table_id_seq OWNED BY public.metabase_table.id;


--
-- Name: metric; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metric (
    id integer NOT NULL,
    table_id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    archived boolean DEFAULT false NOT NULL,
    definition text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    points_of_interest text,
    caveats text,
    how_is_this_calculated text,
    show_in_getting_started boolean DEFAULT false NOT NULL
);


ALTER TABLE public.metric OWNER TO metabase_user;

--
-- Name: metric_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metric_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_id_seq OWNER TO metabase_user;

--
-- Name: metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metric_id_seq OWNED BY public.metric.id;


--
-- Name: metric_important_field; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.metric_important_field (
    id integer NOT NULL,
    metric_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.metric_important_field OWNER TO metabase_user;

--
-- Name: metric_important_field_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.metric_important_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_important_field_id_seq OWNER TO metabase_user;

--
-- Name: metric_important_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.metric_important_field_id_seq OWNED BY public.metric_important_field.id;


--
-- Name: native_query_snippet; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.native_query_snippet (
    id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    content text NOT NULL,
    creator_id integer NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    collection_id integer
);


ALTER TABLE public.native_query_snippet OWNER TO metabase_user;

--
-- Name: TABLE native_query_snippet; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.native_query_snippet IS 'Query snippets (raw text) to be substituted in native queries';


--
-- Name: COLUMN native_query_snippet.name; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.native_query_snippet.name IS 'Name of the query snippet';


--
-- Name: COLUMN native_query_snippet.content; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.native_query_snippet.content IS 'Raw query snippet';


--
-- Name: COLUMN native_query_snippet.collection_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.native_query_snippet.collection_id IS 'ID of the Snippet Folder (Collection) this Snippet is in, if any';


--
-- Name: native_query_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.native_query_snippet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.native_query_snippet_id_seq OWNER TO metabase_user;

--
-- Name: native_query_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.native_query_snippet_id_seq OWNED BY public.native_query_snippet.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    object character varying(254) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.permissions OWNER TO metabase_user;

--
-- Name: permissions_group; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.permissions_group (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.permissions_group OWNER TO metabase_user;

--
-- Name: permissions_group_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.permissions_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_group_id_seq OWNER TO metabase_user;

--
-- Name: permissions_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.permissions_group_id_seq OWNED BY public.permissions_group.id;


--
-- Name: permissions_group_membership; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.permissions_group_membership (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.permissions_group_membership OWNER TO metabase_user;

--
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.permissions_group_membership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_group_membership_id_seq OWNER TO metabase_user;

--
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.permissions_group_membership_id_seq OWNED BY public.permissions_group_membership.id;


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO metabase_user;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: permissions_revision; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.permissions_revision (
    id integer NOT NULL,
    before text NOT NULL,
    after text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    remark text
);


ALTER TABLE public.permissions_revision OWNER TO metabase_user;

--
-- Name: TABLE permissions_revision; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.permissions_revision IS 'Used to keep track of changes made to permissions.';


--
-- Name: COLUMN permissions_revision.before; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.permissions_revision.before IS 'Serialized JSON of the permissions before the changes.';


--
-- Name: COLUMN permissions_revision.after; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.permissions_revision.after IS 'Serialized JSON of the permissions after the changes.';


--
-- Name: COLUMN permissions_revision.user_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.permissions_revision.user_id IS 'The ID of the admin who made this set of changes.';


--
-- Name: COLUMN permissions_revision.created_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.permissions_revision.created_at IS 'The timestamp of when these changes were made.';


--
-- Name: COLUMN permissions_revision.remark; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.permissions_revision.remark IS 'Optional remarks explaining why these changes were made.';


--
-- Name: permissions_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.permissions_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_revision_id_seq OWNER TO metabase_user;

--
-- Name: permissions_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.permissions_revision_id_seq OWNED BY public.permissions_revision.id;


--
-- Name: pulse; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.pulse (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    skip_if_empty boolean DEFAULT false NOT NULL,
    alert_condition character varying(254),
    alert_first_only boolean,
    alert_above_goal boolean,
    collection_id integer,
    collection_position smallint,
    archived boolean DEFAULT false
);


ALTER TABLE public.pulse OWNER TO metabase_user;

--
-- Name: COLUMN pulse.skip_if_empty; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.skip_if_empty IS 'Skip a scheduled Pulse if none of its questions have any results';


--
-- Name: COLUMN pulse.alert_condition; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.alert_condition IS 'Condition (i.e. "rows" or "goal") used as a guard for alerts';


--
-- Name: COLUMN pulse.alert_first_only; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.alert_first_only IS 'True if the alert should be disabled after the first notification';


--
-- Name: COLUMN pulse.alert_above_goal; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.alert_above_goal IS 'For a goal condition, alert when above the goal';


--
-- Name: COLUMN pulse.collection_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.collection_id IS 'Options ID of Collection this Pulse belongs to.';


--
-- Name: COLUMN pulse.collection_position; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- Name: COLUMN pulse.archived; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse.archived IS 'Has this pulse been archived?';


--
-- Name: pulse_card; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.pulse_card (
    id integer NOT NULL,
    pulse_id integer NOT NULL,
    card_id integer NOT NULL,
    "position" integer NOT NULL,
    include_csv boolean DEFAULT false NOT NULL,
    include_xls boolean DEFAULT false NOT NULL
);


ALTER TABLE public.pulse_card OWNER TO metabase_user;

--
-- Name: COLUMN pulse_card.include_csv; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse_card.include_csv IS 'True if a CSV of the data should be included for this pulse card';


--
-- Name: COLUMN pulse_card.include_xls; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.pulse_card.include_xls IS 'True if a XLS of the data should be included for this pulse card';


--
-- Name: pulse_card_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.pulse_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_card_id_seq OWNER TO metabase_user;

--
-- Name: pulse_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.pulse_card_id_seq OWNED BY public.pulse_card.id;


--
-- Name: pulse_channel; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.pulse_channel (
    id integer NOT NULL,
    pulse_id integer NOT NULL,
    channel_type character varying(32) NOT NULL,
    details text NOT NULL,
    schedule_type character varying(32) NOT NULL,
    schedule_hour integer,
    schedule_day character varying(64),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    schedule_frame character varying(32),
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.pulse_channel OWNER TO metabase_user;

--
-- Name: pulse_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.pulse_channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_channel_id_seq OWNER TO metabase_user;

--
-- Name: pulse_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.pulse_channel_id_seq OWNED BY public.pulse_channel.id;


--
-- Name: pulse_channel_recipient; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.pulse_channel_recipient (
    id integer NOT NULL,
    pulse_channel_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.pulse_channel_recipient OWNER TO metabase_user;

--
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.pulse_channel_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_channel_recipient_id_seq OWNER TO metabase_user;

--
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.pulse_channel_recipient_id_seq OWNED BY public.pulse_channel_recipient.id;


--
-- Name: pulse_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.pulse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_id_seq OWNER TO metabase_user;

--
-- Name: pulse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.pulse_id_seq OWNED BY public.pulse.id;


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_blob_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_blob_triggers IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO metabase_user;

--
-- Name: TABLE qrtz_calendars; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_calendars IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_cron_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_cron_triggers IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_fired_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_fired_triggers IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO metabase_user;

--
-- Name: TABLE qrtz_job_details; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_job_details IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO metabase_user;

--
-- Name: TABLE qrtz_locks; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_locks IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO metabase_user;

--
-- Name: TABLE qrtz_paused_trigger_grps; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_paused_trigger_grps IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO metabase_user;

--
-- Name: TABLE qrtz_scheduler_state; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_scheduler_state IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_simple_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_simple_triggers IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_simprop_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_simprop_triggers IS 'Used for Quartz scheduler.';


--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO metabase_user;

--
-- Name: TABLE qrtz_triggers; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.qrtz_triggers IS 'Used for Quartz scheduler.';


--
-- Name: query; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.query (
    query_hash bytea NOT NULL,
    average_execution_time integer NOT NULL,
    query text
);


ALTER TABLE public.query OWNER TO metabase_user;

--
-- Name: TABLE query; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.query IS 'Information (such as average execution time) for different queries that have been previously ran.';


--
-- Name: COLUMN query.query_hash; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query.query_hash IS 'The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict.)';


--
-- Name: COLUMN query.average_execution_time; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query.average_execution_time IS 'Average execution time for the query, round to nearest number of milliseconds. This is updated as a rolling average.';


--
-- Name: COLUMN query.query; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query.query IS 'The actual "query dictionary" for this query.';


--
-- Name: query_cache; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.query_cache (
    query_hash bytea NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    results bytea NOT NULL
);


ALTER TABLE public.query_cache OWNER TO metabase_user;

--
-- Name: TABLE query_cache; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.query_cache IS 'Cached results of queries are stored here when using the DB-based query cache.';


--
-- Name: COLUMN query_cache.query_hash; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_cache.query_hash IS 'The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict).';


--
-- Name: COLUMN query_cache.updated_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_cache.updated_at IS 'The timestamp of when these query results were last refreshed.';


--
-- Name: COLUMN query_cache.results; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_cache.results IS 'Cached, compressed results of running the query with the given hash.';


--
-- Name: query_execution; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.query_execution (
    id integer NOT NULL,
    hash bytea NOT NULL,
    started_at timestamp with time zone NOT NULL,
    running_time integer NOT NULL,
    result_rows integer NOT NULL,
    native boolean NOT NULL,
    context character varying(32),
    error text,
    executor_id integer,
    card_id integer,
    dashboard_id integer,
    pulse_id integer,
    database_id integer
);


ALTER TABLE public.query_execution OWNER TO metabase_user;

--
-- Name: TABLE query_execution; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.query_execution IS 'A log of executed queries, used for calculating historic execution times, auditing, and other purposes.';


--
-- Name: COLUMN query_execution.hash; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.hash IS 'The hash of the query dictionary. This is a 256-bit SHA3 hash of the query.';


--
-- Name: COLUMN query_execution.started_at; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.started_at IS 'Timestamp of when this query started running.';


--
-- Name: COLUMN query_execution.running_time; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.running_time IS 'The time, in milliseconds, this query took to complete.';


--
-- Name: COLUMN query_execution.result_rows; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.result_rows IS 'Number of rows in the query results.';


--
-- Name: COLUMN query_execution.native; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.native IS 'Whether the query was a native query, as opposed to an MBQL one (e.g., created with the GUI).';


--
-- Name: COLUMN query_execution.context; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.context IS 'Short string specifying how this query was executed, e.g. in a Dashboard or Pulse.';


--
-- Name: COLUMN query_execution.error; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.error IS 'Error message returned by failed query, if any.';


--
-- Name: COLUMN query_execution.executor_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.executor_id IS 'The ID of the User who triggered this query execution, if any.';


--
-- Name: COLUMN query_execution.card_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.card_id IS 'The ID of the Card (Question) associated with this query execution, if any.';


--
-- Name: COLUMN query_execution.dashboard_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.dashboard_id IS 'The ID of the Dashboard associated with this query execution, if any.';


--
-- Name: COLUMN query_execution.pulse_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.pulse_id IS 'The ID of the Pulse associated with this query execution, if any.';


--
-- Name: COLUMN query_execution.database_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.query_execution.database_id IS 'ID of the database this query was ran against.';


--
-- Name: query_execution_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.query_execution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_execution_id_seq OWNER TO metabase_user;

--
-- Name: query_execution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.query_execution_id_seq OWNED BY public.query_execution.id;


--
-- Name: report_card; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.report_card (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    display character varying(254) NOT NULL,
    dataset_query text NOT NULL,
    visualization_settings text NOT NULL,
    creator_id integer NOT NULL,
    database_id integer,
    table_id integer,
    query_type character varying(16),
    archived boolean DEFAULT false NOT NULL,
    collection_id integer,
    public_uuid character(36),
    made_public_by_id integer,
    enable_embedding boolean DEFAULT false NOT NULL,
    embedding_params text,
    cache_ttl integer,
    result_metadata text,
    collection_position smallint
);


ALTER TABLE public.report_card OWNER TO metabase_user;

--
-- Name: COLUMN report_card.collection_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.collection_id IS 'Optional ID of Collection this Card belongs to.';


--
-- Name: COLUMN report_card.public_uuid; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.public_uuid IS 'Unique UUID used to in publically-accessible links to this Card.';


--
-- Name: COLUMN report_card.made_public_by_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.made_public_by_id IS 'The ID of the User who first publically shared this Card.';


--
-- Name: COLUMN report_card.enable_embedding; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.enable_embedding IS 'Is this Card allowed to be embedded in different websites (using a signed JWT)?';


--
-- Name: COLUMN report_card.embedding_params; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.embedding_params IS 'Serialized JSON containing information about required parameters that must be supplied when embedding this Card.';


--
-- Name: COLUMN report_card.cache_ttl; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.cache_ttl IS 'The maximum time, in seconds, to return cached results for this Card rather than running a new query.';


--
-- Name: COLUMN report_card.result_metadata; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.result_metadata IS 'Serialized JSON containing metadata about the result columns from running the query.';


--
-- Name: COLUMN report_card.collection_position; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_card.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- Name: report_card_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.report_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_card_id_seq OWNER TO metabase_user;

--
-- Name: report_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.report_card_id_seq OWNED BY public.report_card.id;


--
-- Name: report_cardfavorite; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.report_cardfavorite (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    card_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.report_cardfavorite OWNER TO metabase_user;

--
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.report_cardfavorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_cardfavorite_id_seq OWNER TO metabase_user;

--
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.report_cardfavorite_id_seq OWNED BY public.report_cardfavorite.id;


--
-- Name: report_dashboard; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.report_dashboard (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    creator_id integer NOT NULL,
    parameters text NOT NULL,
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL,
    public_uuid character(36),
    made_public_by_id integer,
    enable_embedding boolean DEFAULT false NOT NULL,
    embedding_params text,
    archived boolean DEFAULT false NOT NULL,
    "position" integer,
    collection_id integer,
    collection_position smallint
);


ALTER TABLE public.report_dashboard OWNER TO metabase_user;

--
-- Name: COLUMN report_dashboard.public_uuid; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.public_uuid IS 'Unique UUID used to in publically-accessible links to this Dashboard.';


--
-- Name: COLUMN report_dashboard.made_public_by_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.made_public_by_id IS 'The ID of the User who first publically shared this Dashboard.';


--
-- Name: COLUMN report_dashboard.enable_embedding; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.enable_embedding IS 'Is this Dashboard allowed to be embedded in different websites (using a signed JWT)?';


--
-- Name: COLUMN report_dashboard.embedding_params; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.embedding_params IS 'Serialized JSON containing information about required parameters that must be supplied when embedding this Dashboard.';


--
-- Name: COLUMN report_dashboard.archived; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.archived IS 'Is this Dashboard archived (effectively treated as deleted?)';


--
-- Name: COLUMN report_dashboard."position"; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard."position" IS 'The position this Dashboard should appear in the Dashboards list, lower-numbered positions appearing before higher numbered ones.';


--
-- Name: COLUMN report_dashboard.collection_id; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.collection_id IS 'Optional ID of Collection this Dashboard belongs to.';


--
-- Name: COLUMN report_dashboard.collection_position; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.report_dashboard.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- Name: report_dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.report_dashboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_dashboard_id_seq OWNER TO metabase_user;

--
-- Name: report_dashboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.report_dashboard_id_seq OWNED BY public.report_dashboard.id;


--
-- Name: report_dashboardcard; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.report_dashboardcard (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "sizeX" integer NOT NULL,
    "sizeY" integer NOT NULL,
    "row" integer DEFAULT 0 NOT NULL,
    col integer DEFAULT 0 NOT NULL,
    card_id integer,
    dashboard_id integer NOT NULL,
    parameter_mappings text NOT NULL,
    visualization_settings text NOT NULL
);


ALTER TABLE public.report_dashboardcard OWNER TO metabase_user;

--
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.report_dashboardcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_dashboardcard_id_seq OWNER TO metabase_user;

--
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.report_dashboardcard_id_seq OWNED BY public.report_dashboardcard.id;


--
-- Name: revision; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.revision (
    id integer NOT NULL,
    model character varying(16) NOT NULL,
    model_id integer NOT NULL,
    user_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    object character varying NOT NULL,
    is_reversion boolean DEFAULT false NOT NULL,
    is_creation boolean DEFAULT false NOT NULL,
    message text
);


ALTER TABLE public.revision OWNER TO metabase_user;

--
-- Name: revision_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.revision_id_seq OWNER TO metabase_user;

--
-- Name: revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.revision_id_seq OWNED BY public.revision.id;


--
-- Name: segment; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.segment (
    id integer NOT NULL,
    table_id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    archived boolean DEFAULT false NOT NULL,
    definition text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL
);


ALTER TABLE public.segment OWNER TO metabase_user;

--
-- Name: segment_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segment_id_seq OWNER TO metabase_user;

--
-- Name: segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.segment_id_seq OWNED BY public.segment.id;


--
-- Name: setting; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.setting (
    key character varying(254) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.setting OWNER TO metabase_user;

--
-- Name: task_history; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.task_history (
    id integer NOT NULL,
    task character varying(254) NOT NULL,
    db_id integer,
    started_at timestamp without time zone NOT NULL,
    ended_at timestamp without time zone NOT NULL,
    duration integer NOT NULL,
    task_details text
);


ALTER TABLE public.task_history OWNER TO metabase_user;

--
-- Name: TABLE task_history; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON TABLE public.task_history IS 'Timing and metadata info about background/quartz processes';


--
-- Name: COLUMN task_history.task; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.task_history.task IS 'Name of the task';


--
-- Name: COLUMN task_history.task_details; Type: COMMENT; Schema: public; Owner: metabase_user
--

COMMENT ON COLUMN public.task_history.task_details IS 'JSON string with additional info on the task';


--
-- Name: task_history_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.task_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_history_id_seq OWNER TO metabase_user;

--
-- Name: task_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.task_history_id_seq OWNED BY public.task_history.id;


--
-- Name: view_log; Type: TABLE; Schema: public; Owner: metabase_user
--

CREATE TABLE public.view_log (
    id integer NOT NULL,
    user_id integer,
    model character varying(16) NOT NULL,
    model_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.view_log OWNER TO metabase_user;

--
-- Name: view_log_id_seq; Type: SEQUENCE; Schema: public; Owner: metabase_user
--

CREATE SEQUENCE public.view_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.view_log_id_seq OWNER TO metabase_user;

--
-- Name: view_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: metabase_user
--

ALTER SEQUENCE public.view_log_id_seq OWNED BY public.view_log.id;


--
-- Name: activity id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.activity ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq'::regclass);


--
-- Name: card_label id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.card_label ALTER COLUMN id SET DEFAULT nextval('public.card_label_id_seq'::regclass);


--
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- Name: collection_revision id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection_revision ALTER COLUMN id SET DEFAULT nextval('public.collection_revision_id_seq'::regclass);


--
-- Name: computation_job id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job ALTER COLUMN id SET DEFAULT nextval('public.computation_job_id_seq'::regclass);


--
-- Name: computation_job_result id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job_result ALTER COLUMN id SET DEFAULT nextval('public.computation_job_result_id_seq'::regclass);


--
-- Name: core_user id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.core_user ALTER COLUMN id SET DEFAULT nextval('public.core_user_id_seq'::regclass);


--
-- Name: dashboard_favorite id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboard_favorite ALTER COLUMN id SET DEFAULT nextval('public.dashboard_favorite_id_seq'::regclass);


--
-- Name: dashboardcard_series id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboardcard_series ALTER COLUMN id SET DEFAULT nextval('public.dashboardcard_series_id_seq'::regclass);


--
-- Name: dependency id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dependency ALTER COLUMN id SET DEFAULT nextval('public.dependency_id_seq'::regclass);


--
-- Name: dimension id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dimension ALTER COLUMN id SET DEFAULT nextval('public.dimension_id_seq'::regclass);


--
-- Name: group_table_access_policy id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy ALTER COLUMN id SET DEFAULT nextval('public.group_table_access_policy_id_seq'::regclass);


--
-- Name: label id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- Name: metabase_database id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_database ALTER COLUMN id SET DEFAULT nextval('public.metabase_database_id_seq'::regclass);


--
-- Name: metabase_field id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_field ALTER COLUMN id SET DEFAULT nextval('public.metabase_field_id_seq'::regclass);


--
-- Name: metabase_fieldvalues id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_fieldvalues ALTER COLUMN id SET DEFAULT nextval('public.metabase_fieldvalues_id_seq'::regclass);


--
-- Name: metabase_table id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_table ALTER COLUMN id SET DEFAULT nextval('public.metabase_table_id_seq'::regclass);


--
-- Name: metric id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric ALTER COLUMN id SET DEFAULT nextval('public.metric_id_seq'::regclass);


--
-- Name: metric_important_field id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric_important_field ALTER COLUMN id SET DEFAULT nextval('public.metric_important_field_id_seq'::regclass);


--
-- Name: native_query_snippet id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.native_query_snippet ALTER COLUMN id SET DEFAULT nextval('public.native_query_snippet_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: permissions_group id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group ALTER COLUMN id SET DEFAULT nextval('public.permissions_group_id_seq'::regclass);


--
-- Name: permissions_group_membership id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group_membership ALTER COLUMN id SET DEFAULT nextval('public.permissions_group_membership_id_seq'::regclass);


--
-- Name: permissions_revision id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_revision ALTER COLUMN id SET DEFAULT nextval('public.permissions_revision_id_seq'::regclass);


--
-- Name: pulse id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse ALTER COLUMN id SET DEFAULT nextval('public.pulse_id_seq'::regclass);


--
-- Name: pulse_card id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_card ALTER COLUMN id SET DEFAULT nextval('public.pulse_card_id_seq'::regclass);


--
-- Name: pulse_channel id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel ALTER COLUMN id SET DEFAULT nextval('public.pulse_channel_id_seq'::regclass);


--
-- Name: pulse_channel_recipient id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel_recipient ALTER COLUMN id SET DEFAULT nextval('public.pulse_channel_recipient_id_seq'::regclass);


--
-- Name: query_execution id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.query_execution ALTER COLUMN id SET DEFAULT nextval('public.query_execution_id_seq'::regclass);


--
-- Name: report_card id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card ALTER COLUMN id SET DEFAULT nextval('public.report_card_id_seq'::regclass);


--
-- Name: report_cardfavorite id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_cardfavorite ALTER COLUMN id SET DEFAULT nextval('public.report_cardfavorite_id_seq'::regclass);


--
-- Name: report_dashboard id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard ALTER COLUMN id SET DEFAULT nextval('public.report_dashboard_id_seq'::regclass);


--
-- Name: report_dashboardcard id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboardcard ALTER COLUMN id SET DEFAULT nextval('public.report_dashboardcard_id_seq'::regclass);


--
-- Name: revision id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.revision ALTER COLUMN id SET DEFAULT nextval('public.revision_id_seq'::regclass);


--
-- Name: segment id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.segment ALTER COLUMN id SET DEFAULT nextval('public.segment_id_seq'::regclass);


--
-- Name: task_history id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.task_history ALTER COLUMN id SET DEFAULT nextval('public.task_history_id_seq'::regclass);


--
-- Name: view_log id; Type: DEFAULT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.view_log ALTER COLUMN id SET DEFAULT nextval('public.view_log_id_seq'::regclass);


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.activity (id, topic, "timestamp", user_id, model, model_id, database_id, table_id, custom_id, details) FROM stdin;
1	install	2021-03-20 09:21:13.634364+00	\N	install	\N	\N	\N	\N	{}
2	user-joined	2021-03-20 09:36:53.372409+00	1	user	1	\N	\N	\N	{}
3	card-create	2021-03-20 09:51:03.652368+00	1	card	1	2	\N	\N	{"name":"Covid19 Daily Cases in UK","description":null}
\.


--
-- Data for Name: card_label; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.card_label (id, card_id, label_id) FROM stdin;
\.


--
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.collection (id, name, description, color, archived, location, personal_owner_id, slug, namespace) FROM stdin;
1	Metabase User's Personal Collection	\N	#31698A	f	/	1	metabase_user_s_personal_collection	\N
\.


--
-- Data for Name: collection_revision; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.collection_revision (id, before, after, user_id, created_at, remark) FROM stdin;
\.


--
-- Data for Name: computation_job; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.computation_job (id, creator_id, created_at, updated_at, type, status, context, ended_at) FROM stdin;
\.


--
-- Data for Name: computation_job_result; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.computation_job_result (id, job_id, created_at, updated_at, permanence, payload) FROM stdin;
\.


--
-- Data for Name: core_session; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.core_session (id, user_id, created_at, anti_csrf_token) FROM stdin;
\.


--
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.core_user (id, email, first_name, last_name, password, password_salt, date_joined, last_login, is_superuser, is_active, reset_token, reset_triggered, is_qbnewb, google_auth, ldap_auth, login_attributes, updated_at, sso_source, locale) FROM stdin;
1	covid19_user@nonexistingemail.com	Metabase	User	$2a$10$gx/qePScBTF/Tkvlo1SGD.9/fIPO7hhtQQUnAwHBRXP/2N16pUmam	8f9d0be4-268c-4ac5-b21a-47b214bcd9e4	2021-03-20 09:36:53.154639+00	2021-03-20 09:36:53.372979+00	t	t	\N	\N	f	f	f	\N	2021-03-20 09:52:23.005503	\N	\N
\.


--
-- Data for Name: dashboard_favorite; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.dashboard_favorite (id, user_id, dashboard_id) FROM stdin;
\.


--
-- Data for Name: dashboardcard_series; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.dashboardcard_series (id, dashboardcard_id, card_id, "position") FROM stdin;
\.


--
-- Data for Name: data_migrations; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.data_migrations (id, "timestamp") FROM stdin;
add-users-to-default-permissions-groups	2021-03-20 09:21:12.200371
add-admin-group-root-entry	2021-03-20 09:21:12.225811
add-databases-to-magic-permissions-groups	2021-03-20 09:21:12.231882
migrate-field-types	2021-03-20 09:21:12.422152
fix-invalid-field-types	2021-03-20 09:21:12.465257
copy-site-url-setting-and-remove-trailing-slashes	2021-03-20 09:21:12.485965
ensure-protocol-specified-in-site-url	2021-03-20 09:21:12.614084
populate-card-database-id	2021-03-20 09:21:12.632501
migrate-humanization-setting	2021-03-20 09:21:12.642526
mark-category-fields-as-list	2021-03-20 09:21:12.657966
add-legacy-sql-directive-to-bigquery-sql-cards	2021-03-20 09:21:12.666318
clear-ldap-user-local-passwords	2021-03-20 09:21:12.677512
add-migrated-collections	2021-03-20 09:21:12.73139
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:09.920844	1	EXECUTED	8:7182ca8e82947c24fa827d31f78b19aa	createTable tableName=core_organization; createTable tableName=core_user; createTable tableName=core_userorgperm; addUniqueConstraint constraintName=idx_unique_user_id_organization_id, tableName=core_userorgperm; createIndex indexName=idx_userorgp...		\N	3.6.3	\N	\N	6232069624
2	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:09.946495	2	EXECUTED	8:bdcf1238e2ccb4fbe66d7f9e1d9b9529	createTable tableName=core_session		\N	3.6.3	\N	\N	6232069624
4	cammsaul	migrations/000_migrations.yaml	2021-03-20 09:21:09.954001	3	EXECUTED	8:a8e7822a91ea122212d376f5c2d4158f	createTable tableName=setting		\N	3.6.3	\N	\N	6232069624
5	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:09.958308	4	EXECUTED	8:4f8653d16f4b102b3dff647277b6b988	addColumn tableName=core_organization		\N	3.6.3	\N	\N	6232069624
6	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:09.977411	5	EXECUTED	8:2d2f5d1756ecb81da7c09ccfb9b1565a	dropNotNullConstraint columnName=organization_id, tableName=metabase_database; dropForeignKeyConstraint baseTableName=metabase_database, constraintName=fk_database_ref_organization_id; dropNotNullConstraint columnName=organization_id, tableName=re...		\N	3.6.3	\N	\N	6232069624
7	cammsaul	migrations/000_migrations.yaml	2021-03-20 09:21:09.989528	6	EXECUTED	8:c57c69fd78d804beb77d261066521f7f	addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6232069624
8	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:09.994632	7	EXECUTED	8:960ec59bbcb4c9f3fa8362eca9af4075	addColumn tableName=metabase_table; addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6232069624
9	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:09.99877	8	EXECUTED	8:d560283a190e3c60802eb04f5532a49d	addColumn tableName=metabase_table		\N	3.6.3	\N	\N	6232069624
10	cammsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.011474	9	EXECUTED	8:9f03a236be31f54e8e5c894fe5fc7f00	createTable tableName=revision; createIndex indexName=idx_revision_model_model_id, tableName=revision		\N	3.6.3	\N	\N	6232069624
11	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.01563	10	EXECUTED	8:ca6561cab1eedbcf4dcb6d6e22cd46c6	sql		\N	3.6.3	\N	\N	6232069624
12	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.024549	11	EXECUTED	8:bedbea570e5dfc694b4cf5a8f6a4f445	addColumn tableName=report_card		\N	3.6.3	\N	\N	6232069624
13	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.039957	12	EXECUTED	8:c2c65930bad8d3e9bab3bb6ae562fe0c	createTable tableName=activity; createIndex indexName=idx_activity_timestamp, tableName=activity; createIndex indexName=idx_activity_user_id, tableName=activity; createIndex indexName=idx_activity_custom_id, tableName=activity		\N	3.6.3	\N	\N	6232069624
14	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.0529	13	EXECUTED	8:320d2ca8ead3f31309674b2b7f54f395	createTable tableName=view_log; createIndex indexName=idx_view_log_user_id, tableName=view_log; createIndex indexName=idx_view_log_timestamp, tableName=view_log		\N	3.6.3	\N	\N	6232069624
15	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.05829	14	EXECUTED	8:505b91530103673a9be3382cd2db1070	addColumn tableName=revision		\N	3.6.3	\N	\N	6232069624
16	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.062393	15	EXECUTED	8:ecc7f02641a589e6d35f88587ac6e02b	dropNotNullConstraint columnName=last_login, tableName=core_user		\N	3.6.3	\N	\N	6232069624
17	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.071409	16	EXECUTED	8:051c23cd15359364b9895c1569c319e7	addColumn tableName=metabase_database; sql		\N	3.6.3	\N	\N	6232069624
18	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.079375	17	EXECUTED	8:62a0483dde183cfd18dd0a86e9354288	createTable tableName=data_migrations; createIndex indexName=idx_data_migrations_id, tableName=data_migrations		\N	3.6.3	\N	\N	6232069624
19	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.083127	18	EXECUTED	8:269b129dbfc39a6f9e0d3bc61c3c3b70	addColumn tableName=metabase_table		\N	3.6.3	\N	\N	6232069624
20	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.130263	19	EXECUTED	8:0afa34e8b528b83aa19b4142984f8095	createTable tableName=pulse; createIndex indexName=idx_pulse_creator_id, tableName=pulse; createTable tableName=pulse_card; createIndex indexName=idx_pulse_card_pulse_id, tableName=pulse_card; createIndex indexName=idx_pulse_card_card_id, tableNam...		\N	3.6.3	\N	\N	6232069624
21	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.14349	20	EXECUTED	8:fb2cd308b17ab81b502d057ecde4fc1b	createTable tableName=segment; createIndex indexName=idx_segment_creator_id, tableName=segment; createIndex indexName=idx_segment_table_id, tableName=segment		\N	3.6.3	\N	\N	6232069624
22	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.14778	21	EXECUTED	8:80bc8a62a90791a79adedcf1ac3c6f08	addColumn tableName=revision		\N	3.6.3	\N	\N	6232069624
23	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.15801	22	EXECUTED	8:b6f054835db2b2688a1be1de3707f9a9	modifyDataType columnName=rows, tableName=metabase_table		\N	3.6.3	\N	\N	6232069624
24	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.172747	23	EXECUTED	8:60825b125b452747098b577310c142b1	createTable tableName=dependency; createIndex indexName=idx_dependency_model, tableName=dependency; createIndex indexName=idx_dependency_model_id, tableName=dependency; createIndex indexName=idx_dependency_dependent_on_model, tableName=dependency;...		\N	3.6.3	\N	\N	6232069624
25	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.187509	24	EXECUTED	8:61f25563911117df72f5621d78f10089	createTable tableName=metric; createIndex indexName=idx_metric_creator_id, tableName=metric; createIndex indexName=idx_metric_table_id, tableName=metric		\N	3.6.3	\N	\N	6232069624
26	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.192578	25	EXECUTED	8:ddef40b95c55cf4ac0e6a5161911a4cb	addColumn tableName=metabase_database; sql		\N	3.6.3	\N	\N	6232069624
27	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.209234	26	EXECUTED	8:001855139df2d5dac4eb954e5abe6486	createTable tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_dashboardcard_id, tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_card_id, tableName=dashboardcard_series		\N	3.6.3	\N	\N	6232069624
28	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.21346	27	EXECUTED	8:428e4eb05e4e29141735adf9ae141a0b	addColumn tableName=core_user		\N	3.6.3	\N	\N	6232069624
29	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.217216	28	EXECUTED	8:8b02731cc34add3722c926dfd7376ae0	addColumn tableName=pulse_channel		\N	3.6.3	\N	\N	6232069624
30	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.224374	29	EXECUTED	8:2c3a50cef177cb90d47a9973cd5934e5	addColumn tableName=metabase_field; addNotNullConstraint columnName=visibility_type, tableName=metabase_field		\N	3.6.3	\N	\N	6232069624
31	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.228266	30	EXECUTED	8:30a33a82bab0bcbb2ccb6738d48e1421	addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6232069624
57	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.684693	56	EXECUTED	8:aab81d477e2d19a9ab18c58b78c9af88	addColumn tableName=report_card	Added 0.25.0	\N	3.6.3	\N	\N	6232069624
32	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.252988	31	EXECUTED	8:40830260b92cedad8da273afd5eca678	createTable tableName=label; createIndex indexName=idx_label_slug, tableName=label; createTable tableName=card_label; addUniqueConstraint constraintName=unique_card_label_card_id_label_id, tableName=card_label; createIndex indexName=idx_card_label...		\N	3.6.3	\N	\N	6232069624
32	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.304246	32	EXECUTED	8:483c6c6c8e0a8d056f7b9112d0b0125c	createTable tableName=raw_table; createIndex indexName=idx_rawtable_database_id, tableName=raw_table; addUniqueConstraint constraintName=uniq_raw_table_db_schema_name, tableName=raw_table; createTable tableName=raw_column; createIndex indexName=id...		\N	3.6.3	\N	\N	6232069624
34	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:10.308241	33	EXECUTED	8:52b082600b05bbbc46bfe837d1f37a82	addColumn tableName=pulse_channel		\N	3.6.3	\N	\N	6232069624
35	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.311968	34	EXECUTED	8:91b72167fca724e6b6a94b64f886cf09	modifyDataType columnName=value, tableName=setting		\N	3.6.3	\N	\N	6232069624
36	agilliland	migrations/000_migrations.yaml	2021-03-20 09:21:10.320605	35	EXECUTED	8:252e08892449dceb16c3d91337bd9573	addColumn tableName=report_dashboard; addNotNullConstraint columnName=parameters, tableName=report_dashboard; addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=parameter_mappings, tableName=report_dashboardcard		\N	3.6.3	\N	\N	6232069624
37	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:10.330469	36	EXECUTED	8:07d959eff81777e5690e2920583cfe5f	addColumn tableName=query_queryexecution; addNotNullConstraint columnName=query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_queryexecution_query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_querye...		\N	3.6.3	\N	\N	6232069624
38	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.363748	37	EXECUTED	8:43604ab55179b50306eb39353e760b46	addColumn tableName=metabase_database; addColumn tableName=metabase_table; addColumn tableName=metabase_field; addColumn tableName=report_dashboard; addColumn tableName=metric; addColumn tableName=segment; addColumn tableName=metabase_database; ad...		\N	3.6.3	\N	\N	6232069624
39	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.368479	38	EXECUTED	8:334adc22af5ded71ff27759b7a556951	addColumn tableName=core_user		\N	3.6.3	\N	\N	6232069624
40	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.415245	39	EXECUTED	8:ee7f50a264d6cf8d891bd01241eebd2c	createTable tableName=permissions_group; createIndex indexName=idx_permissions_group_name, tableName=permissions_group; createTable tableName=permissions_group_membership; addUniqueConstraint constraintName=unique_permissions_group_membership_user...		\N	3.6.3	\N	\N	6232069624
41	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.427433	40	EXECUTED	8:fae0855adf2f702f1133e32fc98d02a5	dropColumn columnName=field_type, tableName=metabase_field; addDefaultValue columnName=active, tableName=metabase_field; addDefaultValue columnName=preview_display, tableName=metabase_field; addDefaultValue columnName=position, tableName=metabase_...		\N	3.6.3	\N	\N	6232069624
42	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.491523	41	EXECUTED	8:e32b3a1624fa289a6ee1f3f0a2dac1f6	dropForeignKeyConstraint baseTableName=query_queryexecution, constraintName=fk_queryexecution_ref_query_id; dropColumn columnName=query_id, tableName=query_queryexecution; dropColumn columnName=is_staff, tableName=core_user; dropColumn columnName=...		\N	3.6.3	\N	\N	6232069624
43	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.506065	42	EXECUTED	8:165e9384e46d6f9c0330784955363f70	createTable tableName=permissions_revision		\N	3.6.3	\N	\N	6232069624
44	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.514767	43	EXECUTED	8:2e356e8a1049286f1c78324828ee7867	dropColumn columnName=public_perms, tableName=report_card; dropColumn columnName=public_perms, tableName=report_dashboard; dropColumn columnName=public_perms, tableName=pulse		\N	3.6.3	\N	\N	6232069624
45	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:10.519703	44	EXECUTED	8:421edd38ee0cb0983162f57193f81b0b	addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=visualization_settings, tableName=report_dashboardcard		\N	3.6.3	\N	\N	6232069624
46	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.53283	45	EXECUTED	8:131df3cdd9a8c67b32c5988a3fb7fe3d	addNotNullConstraint columnName=row, tableName=report_dashboardcard; addNotNullConstraint columnName=col, tableName=report_dashboardcard; addDefaultValue columnName=row, tableName=report_dashboardcard; addDefaultValue columnName=col, tableName=rep...		\N	3.6.3	\N	\N	6232069624
47	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.555885	46	EXECUTED	8:1d2474e49a27db344c250872df58a6ed	createTable tableName=collection; createIndex indexName=idx_collection_slug, tableName=collection; addColumn tableName=report_card; createIndex indexName=idx_card_collection_id, tableName=report_card		\N	3.6.3	\N	\N	6232069624
48	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.567573	47	EXECUTED	8:720ce9d4b9e6f0917aea035e9dc5d95d	createTable tableName=collection_revision		\N	3.6.3	\N	\N	6232069624
49	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.594643	48	EXECUTED	8:56dcab086b21de1df002561efeac8bb6	addColumn tableName=report_card; createIndex indexName=idx_card_public_uuid, tableName=report_card; addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_public_uuid, tableName=report_dashboard; dropNotNullConstraint columnName...		\N	3.6.3	\N	\N	6232069624
50	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.602868	49	EXECUTED	8:388da4c48984aad647709514e4ba9204	addColumn tableName=report_card; addColumn tableName=report_dashboard		\N	3.6.3	\N	\N	6232069624
51	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.627238	50	EXECUTED	8:43c90b5b9f6c14bfd0e41cc0b184617e	createTable tableName=query_execution; createIndex indexName=idx_query_execution_started_at, tableName=query_execution; createIndex indexName=idx_query_execution_query_hash_started_at, tableName=query_execution		\N	3.6.3	\N	\N	6232069624
52	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.640513	51	EXECUTED	8:5af9ea2a96cd6e75a8ac1e6afde7126b	createTable tableName=query_cache; createIndex indexName=idx_query_cache_updated_at, tableName=query_cache; addColumn tableName=report_card		\N	3.6.3	\N	\N	6232069624
53	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.651489	52	EXECUTED	8:78d015c5090c57cd6972eb435601d3d0	createTable tableName=query		\N	3.6.3	\N	\N	6232069624
54	tlrobinson	migrations/000_migrations.yaml	2021-03-20 09:21:10.660587	53	EXECUTED	8:e410005b585f5eeb5f202076ff9468f7	addColumn tableName=pulse		\N	3.6.3	\N	\N	6232069624
55	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.677221	54	EXECUTED	8:87c4becde5fe208ba2c356128df86fba	addColumn tableName=report_dashboard; createTable tableName=dashboard_favorite; addUniqueConstraint constraintName=unique_dashboard_favorite_user_id_dashboard_id, tableName=dashboard_favorite; createIndex indexName=idx_dashboard_favorite_user_id, ...		\N	3.6.3	\N	\N	6232069624
56	wwwiiilll	migrations/000_migrations.yaml	2021-03-20 09:21:10.681111	55	EXECUTED	8:9f46051abaee599e2838733512a32ad0	addColumn tableName=core_user	Added 0.25.0	\N	3.6.3	\N	\N	6232069624
58	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.702576	57	EXECUTED	8:3554219ca39e0fd682d0fba57531e917	createTable tableName=dimension; addUniqueConstraint constraintName=unique_dimension_field_id_name, tableName=dimension; createIndex indexName=idx_dimension_field_id, tableName=dimension	Added 0.25.0	\N	3.6.3	\N	\N	6232069624
59	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.706648	58	EXECUTED	8:5b6ce52371e0e9eee88e6d766225a94b	addColumn tableName=metabase_field	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
60	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.712871	59	EXECUTED	8:4f997b2cd3309882e900493892381f38	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
61	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.716975	60	EXECUTED	8:7dded6fd5bf74d79b9a0b62511981272	addColumn tableName=metabase_field	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
62	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.721338	61	EXECUTED	8:cb32e6eaa1a2140703def2730f81fef2	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
63	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.72557	62	EXECUTED	8:226f73b9f6617495892d281b0f8303db	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
64	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.729597	63	EXECUTED	8:4dcc8ffd836b56756f494d5dfce07b50	dropForeignKeyConstraint baseTableName=raw_table, constraintName=fk_rawtable_ref_database	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
66	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.733609	64	EXECUTED	8:e77d66af8e3b83d46c5a0064a75a1aac	sql; sql	Added 0.26.0	\N	3.6.3	\N	\N	6232069624
67	attekei	migrations/000_migrations.yaml	2021-03-20 09:21:10.748915	65	EXECUTED	8:59dfc37744fc362e0e312488fbc9a69b	createTable tableName=computation_job; createTable tableName=computation_job_result	Added 0.27.0	\N	3.6.3	\N	\N	6232069624
68	sbelak	migrations/000_migrations.yaml	2021-03-20 09:21:10.753173	66	EXECUTED	8:ca201aeb20c1719a46c6bcc3fc95c81d	addColumn tableName=computation_job	Added 0.27.0	\N	3.6.3	\N	\N	6232069624
69	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.761333	67	EXECUTED	8:97b7768436b9e8d695bae984020d754c	addColumn tableName=pulse; dropNotNullConstraint columnName=name, tableName=pulse	Added 0.27.0	\N	3.6.3	\N	\N	6232069624
70	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.766077	68	EXECUTED	8:4e4eff7abb983b1127a32ba8107e7fb8	addColumn tableName=metabase_field; addNotNullConstraint columnName=database_type, tableName=metabase_field	Added 0.28.0	\N	3.6.3	\N	\N	6232069624
71	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.769283	69	EXECUTED	8:755e5c3dd8a55793f29b2c95cb79c211	dropNotNullConstraint columnName=card_id, tableName=report_dashboardcard	Added 0.28.0	\N	3.6.3	\N	\N	6232069624
72	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.774092	70	EXECUTED	8:ed16046dfa04c139f48e9068eb4faee4	addColumn tableName=pulse_card	Added 0.28.0	\N	3.6.3	\N	\N	6232069624
73	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.777503	71	EXECUTED	8:3c0f03d18ff78a0bcc9915e1d9c518d6	addColumn tableName=metabase_database	Added 0.29.0	\N	3.6.3	\N	\N	6232069624
74	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.781843	72	EXECUTED	8:16726d6560851325930c25caf3c8ab96	addColumn tableName=metabase_field	Added 0.29.0	\N	3.6.3	\N	\N	6232069624
75	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.786846	73	EXECUTED	8:6072cabfe8188872d8e3da9a675f88c1	addColumn tableName=report_card	Added 0.28.2	\N	3.6.3	\N	\N	6232069624
76	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.79126	74	EXECUTED	8:9b7190c9171ccca72617d508875c3c82	addColumn tableName=metabase_table	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
77	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.794859	75	EXECUTED	8:07f0a6cd8dbbd9b89be0bd7378f7bdc8	addColumn tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
78	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.812025	76	EXECUTED	8:1977d7278269cdd0dc4f941f9e82f548	createTable tableName=group_table_access_policy; createIndex indexName=idx_gtap_table_id_group_id, tableName=group_table_access_policy; addUniqueConstraint constraintName=unique_gtap_table_id_group_id, tableName=group_table_access_policy	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
79	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.826997	77	EXECUTED	8:3f31cb67f9cdf7754ca95cade22d87a2	addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_collection_id, tableName=report_dashboard; addColumn tableName=pulse; createIndex indexName=idx_pulse_collection_id, tableName=pulse	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
80	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.832929	78	EXECUTED	8:199d0ce28955117819ca15bcc29323e5	addColumn tableName=collection; createIndex indexName=idx_collection_location, tableName=collection		\N	3.6.3	\N	\N	6232069624
81	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.838487	79	EXECUTED	8:3a6dc22403660529194d004ca7f7ad39	addColumn tableName=report_dashboard; addColumn tableName=report_card; addColumn tableName=pulse	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
82	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.844158	80	EXECUTED	8:ac4b94df8c648f88cfff661284d6392d	addColumn tableName=core_user; sql	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
83	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.848464	81	EXECUTED	8:ccd897d737737c05248293c7d56efe96	dropNotNullConstraint columnName=card_id, tableName=group_table_access_policy	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
84	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.859976	82	EXECUTED	8:58afc10c3e283a8050ea471aac447a97	renameColumn newColumnName=archived, oldColumnName=is_active, tableName=metric; addDefaultValue columnName=archived, tableName=metric; renameColumn newColumnName=archived, oldColumnName=is_active, tableName=segment; addDefaultValue columnName=arch...	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
85	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.87713	83	EXECUTED	8:9b4c9878a5018452dd63eb6d7c17f415	addColumn tableName=collection; createIndex indexName=idx_collection_personal_owner_id, tableName=collection; addColumn tableName=collection; sql; addNotNullConstraint columnName=_slug, tableName=collection; dropColumn columnName=slug, tableName=c...	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
86	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.885566	84	EXECUTED	8:50c75bb29f479e0b3fb782d89f7d6717	sql	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
87	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:10.893987	85	EXECUTED	8:0eccf19a93cb0ba4017aafd1d308c097	dropTable tableName=raw_column; dropTable tableName=raw_table	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
88	senior	migrations/000_migrations.yaml	2021-03-20 09:21:10.9003	86	EXECUTED	8:04ff5a0738473938fc31d68c1d9952e1	addColumn tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
89	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.021754	87	EXECUTED	8:94d5c406e3ec44e2bc85abe96f6fd91c	createTable tableName=QRTZ_JOB_DETAILS; addPrimaryKey constraintName=PK_QRTZ_JOB_DETAILS, tableName=QRTZ_JOB_DETAILS; createTable tableName=QRTZ_TRIGGERS; addPrimaryKey constraintName=PK_QRTZ_TRIGGERS, tableName=QRTZ_TRIGGERS; addForeignKeyConstra...	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
90	senior	migrations/000_migrations.yaml	2021-03-20 09:21:11.03401	88	EXECUTED	8:8562a72a1190deadc5fa59a23a6396dc	addColumn tableName=core_user; sql; dropColumn columnName=saml_auth, tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
91	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.038298	89	EXECUTED	8:9b8831e1e409f08e874c4ece043d0340	dropColumn columnName=raw_table_id, tableName=metabase_table; dropColumn columnName=raw_column_id, tableName=metabase_field	Added 0.30.0	\N	3.6.3	\N	\N	6232069624
92	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.043718	90	EXECUTED	8:1e5bc2d66778316ea640a561862c23b4	addColumn tableName=query_execution	Added 0.31.0	\N	3.6.3	\N	\N	6232069624
93	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.05097	91	EXECUTED	8:93b0d408a3970e30d7184ed1166b5476	addColumn tableName=query	Added 0.31.0	\N	3.6.3	\N	\N	6232069624
94	senior	migrations/000_migrations.yaml	2021-03-20 09:21:11.063979	92	EXECUTED	8:a2a1eedf1e8f8756856c9d49c7684bfe	createTable tableName=task_history; createIndex indexName=idx_task_history_end_time, tableName=task_history; createIndex indexName=idx_task_history_db_id, tableName=task_history	Added 0.31.0	\N	3.6.3	\N	\N	6232069624
95	senior	migrations/000_migrations.yaml	2021-03-20 09:21:11.07358	93	EXECUTED	8:9824808283004e803003b938399a4cf0	addUniqueConstraint constraintName=idx_databasechangelog_id_author_filename, tableName=DATABASECHANGELOG	Added 0.31.0	\N	3.6.3	\N	\N	6232069624
96	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.081222	94	EXECUTED	8:5cb2f36edcca9c6e14c5e109d6aeb68b	addColumn tableName=metabase_field	Added 0.31.0	\N	3.6.3	\N	\N	6232069624
97	senior	migrations/000_migrations.yaml	2021-03-20 09:21:11.084741	95	MARK_RAN	8:9169e238663c5d036bd83428d2fa8e4b	modifyDataType columnName=results, tableName=query_cache	Added 0.32.0	\N	3.6.3	\N	\N	6232069624
98	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.104401	96	EXECUTED	8:f036d20a4dc86fb60ffb64ea838ed6b9	addUniqueConstraint constraintName=idx_uniq_table_db_id_schema_name, tableName=metabase_table; sql	Added 0.32.0	\N	3.6.3	\N	\N	6232069624
99	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.113912	97	EXECUTED	8:274bb516dd95b76c954b26084eed1dfe	addUniqueConstraint constraintName=idx_uniq_field_table_id_parent_id_name, tableName=metabase_field; sql	Added 0.32.0	\N	3.6.3	\N	\N	6232069624
100	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.119239	98	EXECUTED	8:948014f13b6198b50e3b7a066fae2ae0	sql	Added 0.32.0	\N	3.6.3	\N	\N	6232069624
101	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.123898	99	EXECUTED	8:58eabb08a175fafe8985208545374675	createIndex indexName=idx_field_parent_id, tableName=metabase_field	Added 0.32.0	\N	3.6.3	\N	\N	6232069624
103	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.127605	100	EXECUTED	8:fda3670fd16a40fd9d0f89a003098d54	addColumn tableName=metabase_database	Added 0.32.10	\N	3.6.3	\N	\N	6232069624
104	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.133002	101	EXECUTED	8:21709f17e6d1b521d3d3b8cbb5445218	addColumn tableName=core_session	Added EE 1.1.6/CE 0.33.0	\N	3.6.3	\N	\N	6232069624
106	sb	migrations/000_migrations.yaml	2021-03-20 09:21:11.136455	102	EXECUTED	8:a3dd42bbe25c415ce21e4c180dc1c1d7	modifyDataType columnName=database_type, tableName=metabase_field	Added 0.33.5	\N	3.6.3	\N	\N	6232069624
107	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.138635	103	MARK_RAN	8:605c2b4d212315c83727aa3d914cf57f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
108	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.140836	104	MARK_RAN	8:d11419da9384fd27d7b1670707ac864c	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
109	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.142974	105	MARK_RAN	8:a5f4ea412eb1d5c1bc824046ad11692f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
110	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.145024	106	MARK_RAN	8:82343097044b9652f73f3d3a2ddd04fe	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
111	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.147331	107	MARK_RAN	8:528de1245ba3aa106871d3e5b3eee0ba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
112	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.149621	108	MARK_RAN	8:010a3931299429d1adfa91941c806ea4	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
113	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.152248	109	MARK_RAN	8:8f8e0836064bdea82487ecf64a129767	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
114	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.154503	110	MARK_RAN	8:7a0bcb25ece6d9a311d6c6be7ed89bb7	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
115	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.158363	111	MARK_RAN	8:55c10c2ff7e967e3ea1fdffc5aeed93a	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
116	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.160623	112	MARK_RAN	8:dbf7c3a1d8b1eb77b7f5888126b13c2e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
117	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.162473	113	MARK_RAN	8:f2d7f9fb1b6713bc5362fe40bfe3f91f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
118	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.164641	114	MARK_RAN	8:17f4410e30a0c7e84a36517ebf4dab64	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
119	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.16659	115	MARK_RAN	8:195cf171ac1d5531e455baf44d9d6561	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
120	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.168784	116	MARK_RAN	8:61f53fac337020aec71868656a719bba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
121	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.170968	117	MARK_RAN	8:1baa145d2ffe1e18d097a63a95476c5f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
122	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.173738	118	MARK_RAN	8:929b3c551a8f631cdce2511612d82d62	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
123	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.176544	119	MARK_RAN	8:35e5baddf78df5829fe6889d216436e5	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
124	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.1786	120	MARK_RAN	8:ce2322ca187dfac51be8f12f6a132818	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
125	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.180715	121	MARK_RAN	8:dd948ac004ceb9d0a300a8e06806945f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
126	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.182947	122	MARK_RAN	8:3d34c0d4e5dbb32b432b83d5322e2aa3	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
127	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.185126	123	MARK_RAN	8:18314b269fe11898a433ca9048400975	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
128	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.187348	124	MARK_RAN	8:44acbe257817286d88b7892e79363b66	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
129	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.190273	125	MARK_RAN	8:f890168c47cc2113a8af77ed3875c4b3	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
130	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.192615	126	MARK_RAN	8:ecdcf1fd66b3477e5b6882c3286b2fd8	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
131	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.195003	127	MARK_RAN	8:453af2935194978c65b19eae445d85c9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
132	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.197514	128	MARK_RAN	8:d2c37bc80b42a15b65f148bcb1daa86e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
133	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.199883	129	MARK_RAN	8:5b9b539d146fbdb762577dc98e7f3430	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
134	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.202405	130	MARK_RAN	8:4d0f688a168db3e357a808263b6ad355	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
135	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.204615	131	MARK_RAN	8:2ca54b0828c6aca615fb42064f1ec728	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
136	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.206833	132	MARK_RAN	8:7115eebbcf664509b9fc0c39cb6f29e9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
137	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.208978	133	MARK_RAN	8:da754ac6e51313a32de6f6389b29e1ca	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
138	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.210989	134	MARK_RAN	8:bfb201761052189e96538f0de3ac76cf	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
139	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.212888	135	MARK_RAN	8:fdad4ec86aefb0cdf850b1929b618508	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
140	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.214823	136	MARK_RAN	8:a0cfe6468160bba8c9d602da736c41fb	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
141	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.21683	137	MARK_RAN	8:b6b7faa02cba069e1ed13e365f59cb6b	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
142	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.219233	138	MARK_RAN	8:0c291eb50cc0f1fef3d55cfe6b62bedb	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
143	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.221686	139	MARK_RAN	8:3d9a5cb41f77a33e834d0562fdddeab6	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
144	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.223721	140	MARK_RAN	8:1d5b7f79f97906105e90d330a17c4062	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
145	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.22712	141	MARK_RAN	8:b162dd48ef850ab4300e2d714eac504e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
146	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.229893	142	MARK_RAN	8:8c0c1861582d15fe7859358f5d553c91	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
147	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.23406	143	MARK_RAN	8:5ccf590332ea0744414e40a990a43275	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
148	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.243239	144	MARK_RAN	8:12b42e87d40cd7b6399c1fb0c6704fa7	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
149	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.245621	145	MARK_RAN	8:dd45bfc4af5e05701a064a5f2a046d7f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
150	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.247971	146	MARK_RAN	8:48beda94aeaa494f798c38a66b90fb2a	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
151	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.25021	147	MARK_RAN	8:bb752a7d09d437c7ac294d5ab2600079	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
152	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.252525	148	MARK_RAN	8:4bcbc472f2d6ae3a5e7eca425940e52b	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
153	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.254689	149	MARK_RAN	8:adce2cca96fe0531b00f9bed6bed8352	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
154	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.256984	150	MARK_RAN	8:7a1df4f7a679f47459ea1a1c0991cfba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
155	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.259288	151	MARK_RAN	8:3c78b79c784e3a3ce09a77db1b1d0374	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
156	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.261753	152	MARK_RAN	8:51859ee6cca4aca9d141a3350eb5d6b1	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
157	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.264124	153	MARK_RAN	8:0197c46bf8536a75dbf7e9aee731f3b2	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
158	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.267195	154	MARK_RAN	8:2ebdd5a179ce2487b2e23b6be74a407c	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
159	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.269471	155	MARK_RAN	8:c62719dad239c51f045315273b56e2a9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
160	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.272594	156	MARK_RAN	8:1441c71af662abb809cba3b3b360ce81	sql	Added 0.34.2	\N	3.6.3	\N	\N	6232069624
162	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.284699	157	EXECUTED	8:c37f015ad11d77d66e09925eed605cdf	dropTable tableName=query_queryexecution	Added 0.23.0 as a data migration; converted to Liquibase migration in 0.35.0	\N	3.6.3	\N	\N	6232069624
163	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.288978	158	EXECUTED	8:9ef66a82624d70738fc89807a2398ed1	dropColumn columnName=read_permissions, tableName=report_card	Added 0.35.0	\N	3.6.3	\N	\N	6232069624
164	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.293618	159	EXECUTED	8:f19470701bbb33f19f91b1199a915881	addColumn tableName=core_user	Added 0.35.0	\N	3.6.3	\N	\N	6232069624
165	sb	migrations/000_migrations.yaml	2021-03-20 09:21:11.300556	160	EXECUTED	8:8848644da9dd9e40924ae71ac4c7c370	addColumn tableName=metabase_field; addColumn tableName=metabase_table; sql	Added field_order to Table and database_position to Field	\N	3.6.3	\N	\N	6232069624
166	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.312489	161	EXECUTED	8:92dafa5c15c46e2af8380304449c7dfa	modifyDataType columnName=updated_at, tableName=metabase_fieldvalues; modifyDataType columnName=updated_at, tableName=query_cache	Added 0.36.0/1.35.4	\N	3.6.3	\N	\N	6232069624
167	walterl, camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.332575	162	EXECUTED	8:4c11dc8c5e829b5263c198fe7879f161	sql; createTable tableName=native_query_snippet; createIndex indexName=idx_snippet_name, tableName=native_query_snippet	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
168	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.344886	163	EXECUTED	8:6d40bfa472bccd2d54284aeb89e1ec3c	modifyDataType columnName=started_at, tableName=query_execution	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
169	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.348177	164	EXECUTED	8:2b97e6eaa7854e179abb9f3749f73b18	dropColumn columnName=rows, tableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
170	sb	migrations/000_migrations.yaml	2021-03-20 09:21:11.351804	165	EXECUTED	8:dbd6ee52b0f9195e449a6d744606b599	dropColumn columnName=fields_hash, tableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
171	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.359721	166	EXECUTED	8:0798080c0796e6ab3e791bff007118b8	addColumn tableName=native_query_snippet; createIndex indexName=idx_snippet_collection_id, tableName=native_query_snippet	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
172	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.3633	167	EXECUTED	8:212f4010b504e358853fd017032f844f	addColumn tableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
173	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.367565	168	EXECUTED	8:4d32b4b7be3f4801e51aeffa5dd47649	dropForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
174	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.387218	169	EXECUTED	8:66f31503ba532702e54ea531af668531	addForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
175	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.394813	170	EXECUTED	8:c3ceddfca8827d73474cd9a70ea01d1c	dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
176	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.39982	171	EXECUTED	8:89c918faa84b7f3f5fa291d4da74414c	addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
177	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.403593	172	EXECUTED	8:d45f2198befc83de1f1f963c750607af	dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
178	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.408165	173	EXECUTED	8:63d396999449da2d42b3d3e22f3454fa	addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id, referencedTableName=label	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
179	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.412846	174	EXECUTED	8:2a0a7956402ef074e5d54c73ac2d5405	dropForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
180	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.418072	175	EXECUTED	8:b02225e5940a2bcca3d550f24f80123e	addForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
181	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.428361	176	EXECUTED	8:16923f06b2bbb60c6ac78a0c4b7e4d4f	dropForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
182	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.435385	177	EXECUTED	8:d59d864c038c530a49056704c93f231d	addForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
183	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.440175	178	EXECUTED	8:c5ed9a4f44ee92af620a47c80e010a6b	dropForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
184	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.445153	179	EXECUTED	8:70317e2bdaac90b9ddc33b1b93ada479	addForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
185	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.450032	180	EXECUTED	8:12e7457ec2d2b1a99a3fadfc64d7b7f9	dropForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
186	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.455024	181	EXECUTED	8:526987d0f6b2f01d7bfc9e3179721be6	addForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id, referencedTableName=computation_job	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
187	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.459486	182	EXECUTED	8:3fbb75c0c491dc6628583184202b8f39	dropForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
188	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.478112	183	EXECUTED	8:4dc500830cd4c5715ca8b0956e37b3d5	addForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
189	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.483029	184	EXECUTED	8:e07396e0ee587dcf321d21cffa9eec29	dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
190	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.488274	185	EXECUTED	8:eded791094a16bf398896c790645c411	addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
191	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.492566	186	EXECUTED	8:bb5b9a3d64b2e44318e159e7f1fecde2	dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
192	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.49832	187	EXECUTED	8:7d96911036dec2fee64fe8ae57c131b3	addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id, referencedTableName=report_dashboardcard	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
193	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.502958	188	EXECUTED	8:db171179fe094db9fee7e2e7df60fa4e	dropForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
194	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.511538	189	EXECUTED	8:fccb724d7ae7606e2e7638de1791392a	addForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
195	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.518105	190	EXECUTED	8:1d720af9f917007024c91d40410bc91d	dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
196	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.525401	191	EXECUTED	8:c52f5dbf742feef12a3803bda92a425b	addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
197	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.530261	192	EXECUTED	8:9c1c950b709050abe91cea17fd5970cc	dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
198	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.53767	193	EXECUTED	8:e24198ff4825a41d17ceaebd71692103	addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
199	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.542237	194	EXECUTED	8:146efae3f2938538961835fe07433ee1	dropForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
200	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.548283	195	EXECUTED	8:f5e7e79cb81b8d2245663c482746c853	addForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
201	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.55356	196	EXECUTED	8:2d79321a27fde6cb3c4fabdb86dc60ec	dropForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
202	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.558869	197	EXECUTED	8:d0cefed061c4abbf2b0a0fd2a66817cb	addForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id, referencedTableName=metabase_database	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
203	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.562797	198	EXECUTED	8:28b4ec07bfbf4b86532fe9357effdb8b	dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
204	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.567701	199	EXECUTED	8:7195937fd2144533edfa2302ba2ae653	addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
205	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.572152	200	EXECUTED	8:4b2d5f1458641dd1b9dbc5f41600be8e	dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
206	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.578134	201	EXECUTED	8:959ef448c23aaf3acf5b69f297fe4b2f	addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
207	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.581908	202	EXECUTED	8:18135d674f2fe502313adb0475f5f139	dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
208	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.588013	203	EXECUTED	8:4c86c17a00a81dfdf35a181e3dd3b08f	addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
209	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.592582	204	EXECUTED	8:1b9c3544bf89093fc9e4f7f191fdc6df	dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
210	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.597499	205	EXECUTED	8:842d166cdf7b0a29c88efdaf95c9d0bf	addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id, referencedTableName=metric	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
211	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.602404	206	EXECUTED	8:91c64815a1aefb07dd124d493bfeeea9	dropForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
212	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.60761	207	EXECUTED	8:b25064ee26b71f61906a833bc22ebbc2	addForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
213	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.612118	208	EXECUTED	8:60a7d628e4f68ee4c85f5f298b1d9865	dropForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
214	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.618576	209	EXECUTED	8:1c3c480313967a2d9f324a094ba25f4d	addForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id, referencedTableName=permissions_group	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
215	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.622905	210	EXECUTED	8:5d2c67ccead52970e9d85beb7eda48b9	dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
216	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.627663	211	EXECUTED	8:35fcd5d48600e887188eb1b990e6cc35	addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id, referencedTableName=permissions_group	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
217	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.633571	212	EXECUTED	8:da7460a35a724109ae9b5096cd18666b	dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
218	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.638822	213	EXECUTED	8:dc04b7eb04cd870c53102cb37fd75a5f	addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
219	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.643715	214	EXECUTED	8:02c690f34fe8803e42441f5037d33017	dropForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
220	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.648517	215	EXECUTED	8:8b8447405d7b2b52358c9676d64b7651	addForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
221	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.652666	216	EXECUTED	8:54a4c0d8a4eda80dc81fb549a629d075	dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
222	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.662895	217	EXECUTED	8:c5f22e925be3a8fd0e4f47a491f599ee	addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
223	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.666613	218	EXECUTED	8:de743e384ff90a6a31a3caebe0abb775	dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
224	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.672506	219	EXECUTED	8:b8fdf9c14d7ea3131a0a6b1f1036f91a	addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
225	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.676346	220	EXECUTED	8:495a4e12cf75cac5ff54738772e6a998	dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
226	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.682257	221	EXECUTED	8:cf383d74bc407065c78c060203ba4560	addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
227	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.688191	222	EXECUTED	8:e23eaf74ab7edacfb34bd5caf05cf66f	dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
228	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.694118	223	EXECUTED	8:d458ddb160f61e93bb69738f262de2b4	addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id, referencedTableName=pulse	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
229	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.700997	224	EXECUTED	8:1cb939d172989cb1629e9a3da768596d	dropForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
230	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.707604	225	EXECUTED	8:62baea3334ac5f21feac84497f6bf643	addForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id, referencedTableName=pulse	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
231	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.711743	226	EXECUTED	8:d096a9ce70fc0b7dfbc67ee1be4c3e31	dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
232	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.716929	227	EXECUTED	8:be2457ae1e386c9d5ec5bfa4ae681fd6	addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id, referencedTableName=pulse_channel	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
233	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.722237	228	EXECUTED	8:d5c018882af16093de446e025e2599b7	dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
234	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.740551	229	EXECUTED	8:edb6ced6c353064c46fa00b54e187aef	addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
235	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.746552	230	EXECUTED	8:550c64e41e55233d52ac3ef24d664be1	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
236	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.759363	231	EXECUTED	8:04300b298b663fc2a2f3a324d1051c3c	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
237	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.763092	232	EXECUTED	8:227a9133cdff9f1b60d8af53688ab12e	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
238	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.768132	233	EXECUTED	8:7000766ddca2c914ac517611e7d86549	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
239	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.772424	234	EXECUTED	8:672f4972653f70464982008a7abea3e1	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
240	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.777998	235	EXECUTED	8:165b07c8ceb004097c83ee1b689164e4	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
241	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.784656	236	EXECUTED	8:b0a9e3d801e64e0a66c3190e458c01ae	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
242	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.793897	237	EXECUTED	8:bf10f944715f87c3ad0dd7472d84df62	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id, referencedTableName=metabase_database	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
243	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.79872	238	EXECUTED	8:cba5d2bfb36e13c60d82cc6cca659b61	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
244	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.805262	239	EXECUTED	8:4d40104eaa47d01981644462ef56f369	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
245	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.810072	240	EXECUTED	8:a8f9206dadfe23662d547035f71e3846	dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
246	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.818363	241	EXECUTED	8:e5db34b9db22254f7445fd65ecf45356	addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
247	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.828643	242	EXECUTED	8:76de7337a12a5ef42dcbb9274bd2d70f	dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
248	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.844273	243	EXECUTED	8:0640fb00a090cbe5dc545afbe0d25811	addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
249	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.850355	244	EXECUTED	8:16ef5909a72ac4779427e432b3b3ce18	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
250	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.855436	245	EXECUTED	8:2e80ebe19816b7bde99050638772cf99	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
251	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.860207	246	EXECUTED	8:c12aa099f293b1e3d71da5e3edb3c45a	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
252	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.866986	247	EXECUTED	8:26b16d4d0cf7a77c1d687f49b029f421	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
253	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.871698	248	EXECUTED	8:bbf118edaa88a8ad486ec0d6965504b6	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
254	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.878241	249	EXECUTED	8:7fc35d78c63f41eb4dbd23cfd1505f0b	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
255	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.88424	250	EXECUTED	8:f6564a7516ace55104a3173eebf4c629	dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
256	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.890964	251	EXECUTED	8:61db9be3b4dd7ed1e9d01a7254e87544	addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
257	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.895694	252	EXECUTED	8:c8b51dc7ba4da9f7995a0b0c17fadad2	dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
258	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.900684	253	EXECUTED	8:58974c6ad8aee63f09e6e48b1a78c267	addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id, referencedTableName=report_dashboard	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
259	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.905025	254	EXECUTED	8:be4a52feb3b12e655c0bbd34477749b0	dropForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
260	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.910019	255	EXECUTED	8:4b370f9c9073a6f8f585aab713c57f47	addForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
261	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.91422	256	EXECUTED	8:173fe552fdf72fdb4efbc01a6ac4f7ad	dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
262	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.918872	257	EXECUTED	8:50927b8b1d1809f32c11d2e649dbcb94	addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
263	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.922836	258	EXECUTED	8:0b10c8664506917cc50359e9634c121c	dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
264	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.927343	259	EXECUTED	8:b132aedf6fbdcc5d956a2d3a154cc035	addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
265	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.931279	260	EXECUTED	8:2e339ecb05463b3765f9bb266bd28297	dropForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
266	camsaul	migrations/000_migrations.yaml	2021-03-20 09:21:11.936085	261	EXECUTED	8:31506e118764f5e520f755f26c696bb8	addForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6232069624
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.dependency (id, model, model_id, dependent_on_model, dependent_on_id, created_at) FROM stdin;
\.


--
-- Data for Name: dimension; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.dimension (id, field_id, name, type, human_readable_field_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: group_table_access_policy; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.group_table_access_policy (id, group_id, table_id, card_id, attribute_remappings) FROM stdin;
\.


--
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.label (id, name, slug, icon) FROM stdin;
\.


--
-- Data for Name: metabase_database; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_database (id, created_at, updated_at, name, description, details, engine, is_sample, is_full_sync, points_of_interest, caveats, metadata_sync_schedule, cache_field_values_schedule, timezone, is_on_demand, options, auto_run_queries) FROM stdin;
1	2021-03-20 09:21:13.632853+00	2021-03-20 09:21:14.429415+00	Sample Dataset	\N	{"db":"zip:/app/metabase.jar!/sample-dataset.db;USER=GUEST;PASSWORD=guest"}	h2	t	t	\N	\N	0 50 * * * ? *	0 50 0 * * ? *	UTC	f	\N	t
2	2021-03-20 09:36:53.154639+00	2021-03-20 09:36:53.437512+00	covid19	\N	{"host":"postgres-postgresql","port":5432,"dbname":"covid19_dev","user":"covid19_user","password":"covid19_password","ssl":false,"additional-options":null,"tunnel-enabled":false}	postgres	f	t	\N	\N	0 0 * * * ? *	0 0 0 * * ? *	UTC	f	\N	t
\.


--
-- Data for Name: metabase_field; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_field (id, created_at, updated_at, name, base_type, special_type, active, description, preview_display, "position", table_id, parent_id, display_name, visibility_type, fk_target_field_id, last_analyzed, points_of_interest, caveats, fingerprint, fingerprint_version, database_type, has_field_values, settings, database_position, custom_position) FROM stdin;
9	2021-03-20 09:21:14.726366+00	2021-03-20 09:21:14.726366+00	ID	type/BigInteger	type/PK	t	This is a unique ID for the product. It is also called the “Invoice number” or “Confirmation number” in customer facing emails and screens.	t	0	2	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
17	2021-03-20 09:21:14.831813+00	2021-03-20 09:21:20.30374+00	STATE	type/Text	type/State	t	The state or province of the account’s billing address	t	7	3	\N	State	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":49,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":2.0}}}	4	CHAR	auto-list	\N	7	0
22	2021-03-20 09:21:14.84466+00	2021-03-20 09:21:14.84466+00	ID	type/BigInteger	type/PK	t	A unique identifier given to each user.	t	0	3	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
30	2021-03-20 09:21:14.922413+00	2021-03-20 09:21:14.922413+00	ID	type/BigInteger	type/PK	t	The numerical product number. Only used internally. All external communication should use the title or EAN.	t	0	1	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
36	2021-03-20 09:21:14.974755+00	2021-03-20 09:21:14.974755+00	ID	type/BigInteger	type/PK	t	A unique internal identifier for the review. Should not be used externally.	t	0	4	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
6	2021-03-20 09:21:14.718578+00	2021-03-20 09:21:17.404093+00	SUBTOTAL	type/Float	\N	t	The raw, pre-tax cost of the order. Note that this might be different in the future from the product price due to promotions, credits, etc.	t	3	2	\N	Subtotal	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":340,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":49.74894519060184,"q3":105.42965746993103,"max":148.22900526552291,"sd":32.53705013056317,"avg":77.01295465356547}}}	4	DOUBLE	\N	\N	3	0
3	2021-03-20 09:21:14.709526+00	2021-03-20 09:21:17.416626+00	USER_ID	type/Integer	type/FK	t	The id of the user who made this order. Note that in some cases where an order was created on behalf of a customer who phoned the order in, this might be the employee who handled the request.	t	1	2	\N	User ID	normal	22	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":929,"nil%":0.0}}	4	INTEGER	\N	\N	1	0
4	2021-03-20 09:21:14.712398+00	2021-03-20 09:21:20.244293+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date and time an order was submitted.	t	7	2	\N	Created At	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":9998,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-30T18:56:13.352Z","latest":"2020-04-19T14:07:15.657Z"}}}	4	TIMESTAMP	\N	\N	7	0
29	2021-03-20 09:21:14.920008+00	2021-03-20 09:21:20.319047+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date the product was added to our catalog.	t	7	1	\N	Created At	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-26T19:29:55.147Z","latest":"2019-04-15T13:34:19.931Z"}}}	4	TIMESTAMP	\N	\N	7	0
24	2021-03-20 09:21:14.907655+00	2021-03-20 09:21:19.784948+00	EAN	type/Text	\N	t	The international article number. A 13 digit number uniquely identifying the product.	t	1	1	\N	Ean	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":13.0}}}	4	CHAR	\N	\N	1	0
23	2021-03-20 09:21:14.904947+00	2021-03-20 09:21:19.787764+00	PRICE	type/Float	\N	t	The list price of the product. Note that this is not always the price the product sold for due to discounts, promotions, etc.	t	5	1	\N	Price	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":170,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":37.25154462926434,"q3":75.45898071609447,"max":98.81933684368194,"sd":21.711481557852057,"avg":55.74639966792074}}}	4	DOUBLE	\N	\N	5	0
32	2021-03-20 09:21:14.965381+00	2021-03-20 09:21:20.20871+00	BODY	type/Text	type/Description	t	The review the user left. Limited to 2000 characters.	t	4	4	\N	Body	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":177.41996402877697}}}	4	CLOB	\N	\N	4	0
7	2021-03-20 09:21:14.721332+00	2021-03-20 09:21:17.413696+00	TOTAL	type/Float	\N	t	The total billed amount.	t	5	2	\N	Total	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":10000,"nil%":0.0},"type":{"type/Number":{"min":12.061602936923117,"q1":52.006147617878135,"q3":109.55803018499738,"max":238.32732001721533,"sd":38.35967664847571,"avg":82.96014815230805}}}	4	DOUBLE	\N	\N	5	0
2	2021-03-20 09:21:14.706922+00	2021-03-20 09:21:20.256807+00	QUANTITY	type/Integer	type/Quantity	t	Number of products bought.	t	8	2	\N	Quantity	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":62,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":1.755882607764982,"q3":4.882654507928044,"max":100.0,"sd":4.214258386403798,"avg":3.7015}}}	4	INTEGER	auto-list	\N	8	0
1	2021-03-20 09:21:14.703247+00	2021-03-20 09:21:20.248632+00	DISCOUNT	type/Float	type/Discount	t	Discount amount.	t	6	2	\N	Discount	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":701,"nil%":0.898},"type":{"type/Number":{"min":0.17088996672584322,"q1":2.9786226681458743,"q3":7.338187788658235,"max":61.69684269960571,"sd":3.053663125001991,"avg":5.161255547580326}}}	4	DOUBLE	\N	\N	6	0
13	2021-03-20 09:21:14.821981+00	2021-03-20 09:21:19.553158+00	ADDRESS	type/Text	\N	t	The street address of the account’s billing address	t	1	3	\N	Address	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2490,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":20.85}}}	4	VARCHAR	\N	\N	1	0
15	2021-03-20 09:21:14.82668+00	2021-03-20 09:21:20.280538+00	EMAIL	type/Text	type/Email	t	The contact email for the account.	t	2	3	\N	Email	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":1.0,"average-length":24.1824}}}	4	VARCHAR	\N	\N	2	0
11	2021-03-20 09:21:14.816854+00	2021-03-20 09:21:19.587975+00	PASSWORD	type/Text	\N	t	This is the salted password of the user. It should not be visible	t	3	3	\N	Password	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":36.0}}}	4	VARCHAR	\N	\N	3	0
14	2021-03-20 09:21:14.824324+00	2021-03-20 09:21:20.294626+00	NAME	type/Text	type/Name	t	The name of the user who owns an account	t	4	3	\N	Name	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2499,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":13.532}}}	4	VARCHAR	\N	\N	4	0
21	2021-03-20 09:21:14.84236+00	2021-03-20 09:21:20.271997+00	CITY	type/Text	type/City	t	The city of the account’s billing address	t	5	3	\N	City	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":1966,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":8.284}}}	4	VARCHAR	\N	\N	5	0
12	2021-03-20 09:21:14.819349+00	2021-03-20 09:21:20.288303+00	LONGITUDE	type/Float	type/Longitude	t	This is the longitude of the user on sign-up. It might be updated in the future to the last seen location.	t	6	3	\N	Longitude	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":-166.5425726,"q1":-101.58350792373135,"q3":-84.65289348288829,"max":-67.96735199999999,"sd":15.399698968175663,"avg":-95.18741780363999}}}	4	DOUBLE	\N	\N	6	0
18	2021-03-20 09:21:14.834115+00	2021-03-20 09:21:20.299706+00	SOURCE	type/Text	type/Source	t	The channel through which we acquired this user. Valid values include: Affiliate, Facebook, Google, Organic and Twitter	t	8	3	\N	Source	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":7.4084}}}	4	VARCHAR	auto-list	\N	8	0
16	2021-03-20 09:21:14.829511+00	2021-03-20 09:21:19.557773+00	BIRTH_DATE	type/Date	\N	t	The date of birth of the user	t	9	3	\N	Birth Date	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2308,"nil%":0.0},"type":{"type/DateTime":{"earliest":"1958-04-26","latest":"2000-04-03"}}}	4	DATE	\N	\N	9	0
19	2021-03-20 09:21:14.836985+00	2021-03-20 09:21:20.284499+00	LATITUDE	type/Float	type/Latitude	t	This is the latitude of the user on sign-up. It might be updated in the future to the last seen location.	t	11	3	\N	Latitude	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":25.775827,"q1":35.302705923023126,"q3":43.773802584662,"max":70.6355001,"sd":6.390832341883712,"avg":39.87934670484002}}}	4	DOUBLE	\N	\N	11	0
20	2021-03-20 09:21:14.839737+00	2021-03-20 09:21:19.602934+00	ZIP	type/Text	type/ZipCode	t	The postal code of the account’s billing address	t	10	3	\N	Zip	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2234,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":5.0}}}	4	CHAR	\N	\N	10	0
10	2021-03-20 09:21:14.814208+00	2021-03-20 09:21:20.275857+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date the user record was created. Also referred to as the user’s "join date"	t	12	3	\N	Created At	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-19T21:35:18.752Z","latest":"2019-04-19T14:06:27.3Z"}}}	4	TIMESTAMP	\N	\N	12	0
28	2021-03-20 09:21:14.917594+00	2021-03-20 09:21:20.324351+00	RATING	type/Float	type/Score	t	The average rating users have given the product. This ranges from 1 - 5	t	6	1	\N	Rating	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":23,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":3.5120465053408525,"q3":4.216124969497314,"max":5.0,"sd":1.3605488657451452,"avg":3.4715}}}	4	DOUBLE	\N	\N	6	0
27	2021-03-20 09:21:14.915259+00	2021-03-20 09:21:20.328204+00	TITLE	type/Text	type/Title	t	The name of the product as it should be displayed to customers.	t	2	1	\N	Title	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":199,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":21.495}}}	4	VARCHAR	\N	\N	2	0
25	2021-03-20 09:21:14.909945+00	2021-03-20 09:21:20.331901+00	VENDOR	type/Text	type/Company	t	The source of the product.	t	4	1	\N	Vendor	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":20.6}}}	4	VARCHAR	\N	\N	4	0
34	2021-03-20 09:21:14.9698+00	2021-03-20 09:21:20.339544+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The day and time a review was written by a user.	t	5	4	\N	Created At	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-06-03T00:37:05.818Z","latest":"2020-04-19T14:15:25.677Z"}}}	4	TIMESTAMP	\N	\N	5	0
33	2021-03-20 09:21:14.967494+00	2021-03-20 09:21:20.21412+00	PRODUCT_ID	type/Integer	type/FK	t	The product the review was for	t	1	4	\N	Product ID	normal	30	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":176,"nil%":0.0}}	4	INTEGER	\N	\N	1	0
35	2021-03-20 09:21:14.972199+00	2021-03-20 09:21:20.219383+00	REVIEWER	type/Text	\N	t	The user who left the review	t	2	4	\N	Reviewer	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":1076,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":9.972122302158274}}}	4	VARCHAR	\N	\N	2	0
39	2021-03-20 09:36:53.52804+00	2021-03-20 09:36:53.52804+00	day	type/Date	type/PK	t	\N	t	0	6	\N	Day	normal	\N	\N	\N	\N	\N	0	date	\N	\N	0	0
26	2021-03-20 09:21:14.912799+00	2021-03-20 09:21:20.315486+00	CATEGORY	type/Text	type/Category	t	The type of product, valid values include: Doohicky, Gadget, Gizmo and Widget	t	3	1	\N	Category	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":6.375}}}	4	VARCHAR	auto-list	\N	3	0
31	2021-03-20 09:21:14.962645+00	2021-03-20 09:21:20.344206+00	RATING	type/Integer	type/Score	t	The rating (on a scale of 1-5) the user left.	t	3	4	\N	Rating	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Number":{"min":1.0,"q1":3.54744353181696,"q3":4.764807071650455,"max":5.0,"sd":1.0443899855660577,"avg":3.987410071942446}}}	4	SMALLINT	auto-list	\N	3	0
40	2021-03-20 09:36:53.529514+00	2021-03-20 09:36:53.703089+00	updated_at	type/DateTime	\N	t	\N	t	3	6	\N	Updated At	normal	\N	2021-03-20 09:36:53.773405+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-03-20T09:11:12.101017Z","latest":"2021-03-20T09:14:05.242342Z"}}}	4	timestamp	\N	\N	3	0
38	2021-03-20 09:36:53.526543+00	2021-03-20 09:36:53.738402+00	created_at	type/DateTime	type/CreationTimestamp	t	\N	t	2	6	\N	Created At	normal	\N	2021-03-20 09:36:53.773405+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-03-20T09:11:12.101017Z","latest":"2021-03-20T09:14:05.242342Z"}}}	4	timestamp	\N	\N	2	0
37	2021-03-20 09:36:53.523968+00	2021-03-20 09:36:53.741115+00	payload	type/Text	type/SerializedJSON	t	\N	t	1	6	\N	Payload	normal	\N	2021-03-20 09:36:53.773405+00	\N	\N	{"global":{"distinct-count":443,"nil%":0.006741573033707865},"type":{"type/Text":{"percent-json":0.9932584269662921,"percent-url":0.0,"percent-email":0.0,"average-length":41.32359550561798}}}	4	jsonb	\N	\N	1	0
42	2021-03-20 09:36:53.56308+00	2021-03-20 09:36:53.746909+00	created_at	type/Text	type/Category	t	\N	t	1	5	\N	Created At	normal	\N	2021-03-20 09:36:53.773405+00	\N	\N	{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":23.0}}}	4	varchar	auto-list	\N	1	0
41	2021-03-20 09:36:53.561554+00	2021-03-20 09:36:53.752475+00	id	type/Text	type/PK	t	\N	t	0	5	\N	ID	normal	\N	2021-03-20 09:36:53.773405+00	\N	\N	\N	4	varchar	\N	\N	0	0
44	2021-03-20 09:46:56.2082+00	2021-03-20 09:46:56.398152+00	cases	type/Integer	\N	t	\N	t	1	7	\N	Cases	normal	\N	2021-03-20 09:46:56.431653+00	\N	\N	{"global":{"distinct-count":375,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":471.91647934781037,"q3":12969.465360340368,"max":61757.0,"sd":12157.940713807011,"avg":8246.597752808988}}}	4	int4	\N	\N	1	0
43	2021-03-20 09:46:56.20621+00	2021-03-20 09:46:56.400245+00	day	type/Date	\N	t	\N	t	0	7	\N	Day	normal	\N	2021-03-20 09:46:56.431653+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2020-01-01","latest":"2021-03-20"}}}	4	date	\N	\N	0	0
5	2021-03-20 09:21:14.715663+00	2021-03-20 09:21:17.388918+00	PRODUCT_ID	type/Integer	type/FK	t	The product ID. This is an internal identifier for the product, NOT the SKU.	t	2	2	\N	Product ID	normal	30	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0}}	4	INTEGER	\N	\N	2	0
8	2021-03-20 09:21:14.723783+00	2021-03-20 09:21:17.409379+00	TAX	type/Float	\N	t	This is the amount of local and federal taxes that are collected on the purchase. Note that other governmental fees on some products are not included here, but instead are accounted for in the subtotal.	t	4	2	\N	Tax	normal	\N	2021-03-20 09:21:20.380414+00	\N	\N	{"global":{"distinct-count":797,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":2.273340386603857,"q3":5.337275338216307,"max":11.12,"sd":2.3206651358900316,"avg":3.8722100000000004}}}	4	DOUBLE	\N	\N	4	0
\.


--
-- Data for Name: metabase_fieldvalues; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_fieldvalues (id, created_at, updated_at, "values", human_readable_values, field_id) FROM stdin;
1	2021-03-20 09:21:21.079631+00	2021-03-20 09:21:21.079631+00	[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,63,65,67,68,69,70,71,72,73,75,78,82,83,88,100]	\N	2
2	2021-03-20 09:21:21.136782+00	2021-03-20 09:21:21.136782+00	["Affiliate","Facebook","Google","Organic","Twitter"]	\N	18
3	2021-03-20 09:21:21.163571+00	2021-03-20 09:21:21.163571+00	["AK","AL","AR","AZ","CA","CO","CT","DE","FL","GA","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY"]	\N	17
4	2021-03-20 09:21:21.193665+00	2021-03-20 09:21:21.193665+00	["Doohickey","Gadget","Gizmo","Widget"]	\N	26
5	2021-03-20 09:21:21.235573+00	2021-03-20 09:21:21.235573+00	[1,2,3,4,5]	\N	31
6	2021-03-20 09:36:53.80475+00	2021-03-20 09:36:53.80475+00	["2021-03-20T09:06:44.450"]	\N	42
\.


--
-- Data for Name: metabase_table; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_table (id, created_at, updated_at, name, description, entity_name, entity_type, active, db_id, display_name, visibility_type, schema, points_of_interest, caveats, show_in_getting_started, field_order) FROM stdin;
6	2021-03-20 09:36:53.485536+00	2021-03-20 09:36:53.757959+00	covid_19_ingestion	\N	\N	entity/GenericTable	t	2	Cov ID 19 Ingestion	\N	public	\N	\N	f	database
5	2021-03-20 09:36:53.474692+00	2021-03-20 09:36:53.763391+00	ragtime_migrations	\N	\N	entity/GenericTable	t	2	Ragtime Migrations	\N	public	\N	\N	f	database
7	2021-03-20 09:46:56.18018+00	2021-03-20 09:46:56.418721+00	covid_19_cases_per_day	\N	\N	entity/GenericTable	t	2	Cov ID 19 Cases Per Day	\N	public	\N	\N	f	database
2	2021-03-20 09:21:14.535843+00	2021-03-20 09:50:00.128333+00	ORDERS	This is a confirmed order for a product from a user.	\N	entity/TransactionTable	t	1	Orders	\N	PUBLIC	\N	\N	f	database
3	2021-03-20 09:21:14.547328+00	2021-03-20 09:50:00.156575+00	PEOPLE	This is a user account. Note that employees and customer support staff will have accounts.	\N	entity/UserTable	t	1	People	\N	PUBLIC	\N	\N	f	database
1	2021-03-20 09:21:14.514598+00	2021-03-20 09:50:00.188123+00	PRODUCTS	This is our product catalog. It includes all products ever sold by the Sample Company.	\N	entity/ProductTable	t	1	Products	\N	PUBLIC	\N	\N	f	database
4	2021-03-20 09:21:14.557877+00	2021-03-20 09:50:00.2059+00	REVIEWS	These are reviews our customers have left on products. Note that these are not tied to orders so it is possible people have reviewed products they did not purchase from us.	\N	entity/GenericTable	t	1	Reviews	\N	PUBLIC	\N	\N	f	database
\.


--
-- Data for Name: metric; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metric (id, table_id, creator_id, name, description, archived, definition, created_at, updated_at, points_of_interest, caveats, how_is_this_calculated, show_in_getting_started) FROM stdin;
\.


--
-- Data for Name: metric_important_field; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metric_important_field (id, metric_id, field_id) FROM stdin;
\.


--
-- Data for Name: native_query_snippet; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.native_query_snippet (id, name, description, content, creator_id, archived, created_at, updated_at, collection_id) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.permissions (id, object, group_id) FROM stdin;
1	/	2
2	/collection/root/	1
3	/collection/root/	3
4	/db/1/	1
5	/db/2/	1
\.


--
-- Data for Name: permissions_group; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.permissions_group (id, name) FROM stdin;
1	All Users
2	Administrators
3	MetaBot
\.


--
-- Data for Name: permissions_group_membership; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.permissions_group_membership (id, user_id, group_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- Data for Name: permissions_revision; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.permissions_revision (id, before, after, user_id, created_at, remark) FROM stdin;
\.


--
-- Data for Name: pulse; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.pulse (id, creator_id, name, created_at, updated_at, skip_if_empty, alert_condition, alert_first_only, alert_above_goal, collection_id, collection_position, archived) FROM stdin;
\.


--
-- Data for Name: pulse_card; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.pulse_card (id, pulse_id, card_id, "position", include_csv, include_xls) FROM stdin;
\.


--
-- Data for Name: pulse_channel; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.pulse_channel (id, pulse_id, channel_type, details, schedule_type, schedule_hour, schedule_day, created_at, updated_at, schedule_frame, enabled) FROM stdin;
\.


--
-- Data for Name: pulse_channel_recipient; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.pulse_channel_recipient (id, pulse_channel_id, user_id) FROM stdin;
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
MetabaseScheduler	metabase.task.upgrade-checks.trigger	DEFAULT	0 15 6,18 * * ? *	UTC
MetabaseScheduler	metabase.task.anonymous-stats.trigger	DEFAULT	0 15 7 * * ? *	UTC
MetabaseScheduler	metabase.task.abandonment-emails.trigger	DEFAULT	0 0 12 * * ? *	UTC
MetabaseScheduler	metabase.task.follow-up-emails.trigger	DEFAULT	0 0 12 * * ? *	UTC
MetabaseScheduler	metabase.task.update-field-values.trigger.1	DEFAULT	0 50 0 * * ? *	UTC
MetabaseScheduler	metabase.task.update-field-values.trigger.2	DEFAULT	0 0 0 * * ? *	UTC
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.1	DEFAULT	0 50 * * * ? *	UTC
MetabaseScheduler	metabase.task.task-history-cleanup.trigger	DEFAULT	0 0 * * * ? *	UTC
MetabaseScheduler	metabase.task.send-pulses.trigger	DEFAULT	0 0 * * * ? *	UTC
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.2	DEFAULT	0 0 * * * ? *	UTC
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
MetabaseScheduler	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze for all databases	metabase.task.sync_databases.SyncAndAnalyzeDatabase	t	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.update-field-values.job	DEFAULT	update-field-values for all databases	metabase.task.sync_databases.UpdateFieldValues	t	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.upgrade-checks.job	DEFAULT	\N	metabase.task.upgrade_checks.CheckForNewVersions	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.anonymous-stats.job	DEFAULT	\N	metabase.task.send_anonymous_stats.SendAnonymousUsageStats	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.abandonment-emails.job	DEFAULT	\N	metabase.task.follow_up_emails.AbandonmentEmail	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.send-pulses.job	DEFAULT	\N	metabase.task.send_pulses.SendPulses	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.follow-up-emails.job	DEFAULT	\N	metabase.task.follow_up_emails.FollowUpEmail	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.task-history-cleanup.job	DEFAULT	\N	metabase.task.task_history_cleanup.TaskHistoryCleanup	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
MetabaseScheduler	STATE_ACCESS
MetabaseScheduler	TRIGGER_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
MetabaseScheduler	metabase-684c766d98-qjpmd1616232073140	1616236161454	7500
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
MetabaseScheduler	metabase.task.upgrade-checks.trigger	DEFAULT	metabase.task.upgrade-checks.job	DEFAULT	\N	1616264100000	-1	5	WAITING	CRON	1616232073000	0	\N	0	\\x
MetabaseScheduler	metabase.task.anonymous-stats.trigger	DEFAULT	metabase.task.anonymous-stats.job	DEFAULT	\N	1616310900000	-1	5	WAITING	CRON	1616232073000	0	\N	0	\\x
MetabaseScheduler	metabase.task.abandonment-emails.trigger	DEFAULT	metabase.task.abandonment-emails.job	DEFAULT	\N	1616241600000	-1	5	WAITING	CRON	1616232073000	0	\N	0	\\x
MetabaseScheduler	metabase.task.follow-up-emails.trigger	DEFAULT	metabase.task.follow-up-emails.job	DEFAULT	\N	1616241600000	-1	5	WAITING	CRON	1616232073000	0	\N	0	\\x
MetabaseScheduler	metabase.task.update-field-values.trigger.1	DEFAULT	metabase.task.update-field-values.job	DEFAULT	update-field-values Database 1	1616287800000	-1	5	WAITING	CRON	1616232073000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800
MetabaseScheduler	metabase.task.update-field-values.trigger.2	DEFAULT	metabase.task.update-field-values.job	DEFAULT	update-field-values Database 2	1616284800000	-1	5	WAITING	CRON	1616233013000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000027800
MetabaseScheduler	metabase.task.task-history-cleanup.trigger	DEFAULT	metabase.task.task-history-cleanup.job	DEFAULT	\N	1616238000000	1616234400000	5	WAITING	CRON	1616232073000	0	\N	0	\\x
MetabaseScheduler	metabase.task.send-pulses.trigger	DEFAULT	metabase.task.send-pulses.job	DEFAULT	\N	1616238000000	1616234400000	5	WAITING	CRON	1616232073000	0	\N	1	\\x
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.1	DEFAULT	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze Database 1	1616237400000	1616233800000	5	WAITING	CRON	1616232073000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.2	DEFAULT	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze Database 2	1616238000000	1616234400000	5	WAITING	CRON	1616233013000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000027800
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.query (query_hash, average_execution_time, query) FROM stdin;
\\x88eb2cb40e20602fc92fc699c4382d37c370905c50b932167f6e6471929ed910	365	{"type":"native","native":{"query":"select * from covid_19_cases_per_day","template-tags":{}},"database":2,"middleware":{"add-default-userland-constraints?":true}}
\\xbcab772bded8062cae2820d06b0d70269b89051f719bff5296bf343b06d126f5	578	{"database":2,"query":{"source-table":6},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x103fe9e491bf5de3905337700fad9ae72e10c9f462e1b1b35534d4c9c2a57c5e	418	{"database":2,"query":{"source-table":7},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x120a46ddf8777087876693af6a58807c6998e59ffbb08a899c7c60a9a95fda4c	345	{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"native","middleware":null,"native":{"query":"select * from covid_19_cases_per_day","template-tags":{}},"database":2,"async?":true,"cache-ttl":null}
\.


--
-- Data for Name: query_cache; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.query_cache (query_hash, updated_at, results) FROM stdin;
\.


--
-- Data for Name: query_execution; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.query_execution (id, hash, started_at, running_time, result_rows, native, context, error, executor_id, card_id, dashboard_id, pulse_id, database_id) FROM stdin;
1	\\xbcab772bded8062cae2820d06b0d70269b89051f719bff5296bf343b06d126f5	2021-03-20 09:37:12.267392+00	641	445	f	ad-hoc	\N	1	\N	\N	\N	2
2	\\xbcab772bded8062cae2820d06b0d70269b89051f719bff5296bf343b06d126f5	2021-03-20 09:37:34.99184+00	394	445	f	ad-hoc	\N	1	\N	\N	\N	2
3	\\x103fe9e491bf5de3905337700fad9ae72e10c9f462e1b1b35534d4c9c2a57c5e	2021-03-20 09:47:29.798004+00	430	445	f	ad-hoc	\N	1	\N	\N	\N	2
4	\\x103fe9e491bf5de3905337700fad9ae72e10c9f462e1b1b35534d4c9c2a57c5e	2021-03-20 09:48:13.406657+00	432	445	f	ad-hoc	\N	1	\N	\N	\N	2
5	\\x88eb2cb40e20602fc92fc699c4382d37c370905c50b932167f6e6471929ed910	2021-03-20 09:49:53.119584+00	365	445	t	ad-hoc	\N	1	\N	\N	\N	2
6	\\xbcab772bded8062cae2820d06b0d70269b89051f719bff5296bf343b06d126f5	2021-03-20 09:51:56.43704+00	231	445	f	ad-hoc	\N	1	\N	\N	\N	2
7	\\x103fe9e491bf5de3905337700fad9ae72e10c9f462e1b1b35534d4c9c2a57c5e	2021-03-20 09:52:12.373739+00	311	445	f	ad-hoc	\N	1	\N	\N	\N	2
8	\\x120a46ddf8777087876693af6a58807c6998e59ffbb08a899c7c60a9a95fda4c	2021-03-20 09:52:21.362636+00	345	445	t	question	\N	1	1	\N	\N	2
\.


--
-- Data for Name: report_card; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.report_card (id, created_at, updated_at, name, description, display, dataset_query, visualization_settings, creator_id, database_id, table_id, query_type, archived, collection_id, public_uuid, made_public_by_id, enable_embedding, embedding_params, cache_ttl, result_metadata, collection_position) FROM stdin;
1	2021-03-20 09:51:03.621328+00	2021-03-20 09:52:21.705284+00	Covid19 Daily Cases in UK	\N	line	{"type":"native","native":{"query":"select * from covid_19_cases_per_day","template-tags":{}},"database":2}	{"graph.dimensions":["day"],"graph.metrics":["cases"]}	1	2	\N	native	f	\N	\N	\N	f	\N	\N	[{"base_type":"type/Date","display_name":"day","name":"day","special_type":null,"fingerprint":{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2020-01-01T00:00:00Z","latest":"2021-03-20T00:00:00Z"}}}},{"base_type":"type/Integer","display_name":"cases","name":"cases","special_type":null,"fingerprint":{"global":{"distinct-count":375,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":471.91647934781037,"q3":12969.465360340368,"max":61757.0,"sd":12157.940713807011,"avg":8246.597752808988}}}}]	\N
\.


--
-- Data for Name: report_cardfavorite; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.report_cardfavorite (id, created_at, updated_at, card_id, owner_id) FROM stdin;
\.


--
-- Data for Name: report_dashboard; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.report_dashboard (id, created_at, updated_at, name, description, creator_id, parameters, points_of_interest, caveats, show_in_getting_started, public_uuid, made_public_by_id, enable_embedding, embedding_params, archived, "position", collection_id, collection_position) FROM stdin;
\.


--
-- Data for Name: report_dashboardcard; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.report_dashboardcard (id, created_at, updated_at, "sizeX", "sizeY", "row", col, card_id, dashboard_id, parameter_mappings, visualization_settings) FROM stdin;
\.


--
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.revision (id, model, model_id, user_id, "timestamp", object, is_reversion, is_creation, message) FROM stdin;
1	Card	1	1	2021-03-20 09:51:03.655575+00	{"description":null,"archived":false,"collection_position":null,"table_id":null,"database_id":2,"enable_embedding":false,"collection_id":null,"query_type":"native","name":"Covid19 Daily Cases in UK","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"native","native":{"query":"select * from covid_19_cases_per_day","template-tags":{}},"database":2},"id":1,"display":"line","visualization_settings":{"graph.dimensions":["day"],"graph.metrics":["cases"]},"public_uuid":null}	f	t	\N
\.


--
-- Data for Name: segment; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.segment (id, table_id, creator_id, name, description, archived, definition, created_at, updated_at, points_of_interest, caveats, show_in_getting_started) FROM stdin;
\.


--
-- Data for Name: setting; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.setting (key, value) FROM stdin;
redirect-all-requests-to-https	false
site-url	http://172.17.0.16:3000
site-name	Covid19
admin-email	covid19_user@nonexistingemail.com
site-locale	en
anon-tracking-enabled	false
show-homepage-xrays	false
settings-last-updated	2021-03-20 09:51:43.274756+00
\.


--
-- Data for Name: task_history; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.task_history (id, task, db_id, started_at, ended_at, duration, task_details) FROM stdin;
1	sync	1	2021-03-20 09:21:13.758421	2021-03-20 09:21:15.265236	1506	\N
2	sync-timezone	1	2021-03-20 09:21:13.759726	2021-03-20 09:21:14.431683	671	{"timezone-id":"UTC"}
3	sync-tables	1	2021-03-20 09:21:14.432234	2021-03-20 09:21:14.566952	134	{"updated-tables":4,"total-tables":0}
4	sync-fields	1	2021-03-20 09:21:14.567097	2021-03-20 09:21:14.987899	420	{"total-fields":36,"updated-fields":36}
5	sync-fks	1	2021-03-20 09:21:14.988159	2021-03-20 09:21:15.046705	58	{"total-fks":3,"updated-fks":3,"total-failed":0}
6	sync-metabase-metadata	1	2021-03-20 09:21:15.046911	2021-03-20 09:21:15.26517	218	\N
7	analyze	1	2021-03-20 09:21:15.360948	2021-03-20 09:21:20.367456	5006	\N
8	fingerprint-fields	1	2021-03-20 09:21:15.360988	2021-03-20 09:21:20.222408	4861	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":32,"fingerprints-attempted":32}
9	classify-fields	1	2021-03-20 09:21:20.222486	2021-03-20 09:21:20.348289	125	{"fields-classified":32,"fields-failed":0}
10	classify-tables	1	2021-03-20 09:21:20.348363	2021-03-20 09:21:20.367383	19	{"total-tables":4,"tables-classified":4}
11	field values scanning	1	2021-03-20 09:21:20.385234	2021-03-20 09:21:21.240342	855	\N
12	update-field-values	1	2021-03-20 09:21:20.385265	2021-03-20 09:21:21.240229	854	{"errors":0,"created":5,"updated":0,"deleted":0}
13	sync	2	2021-03-20 09:36:53.374326	2021-03-20 09:36:53.611091	236	\N
14	sync-timezone	2	2021-03-20 09:36:53.374349	2021-03-20 09:36:53.439818	65	{"timezone-id":"UTC"}
15	sync-tables	2	2021-03-20 09:36:53.439958	2021-03-20 09:36:53.488538	48	{"updated-tables":2,"total-tables":0}
16	sync-fields	2	2021-03-20 09:36:53.488594	2021-03-20 09:36:53.568183	79	{"total-fields":6,"updated-fields":6}
17	sync-fks	2	2021-03-20 09:36:53.568339	2021-03-20 09:36:53.602585	34	{"total-fks":0,"updated-fks":0,"total-failed":0}
18	sync-metabase-metadata	2	2021-03-20 09:36:53.6028	2021-03-20 09:36:53.611064	8	\N
19	analyze	2	2021-03-20 09:36:53.625144	2021-03-20 09:36:53.765602	140	\N
20	fingerprint-fields	2	2021-03-20 09:36:53.625162	2021-03-20 09:36:53.733199	108	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":5,"fingerprints-attempted":5}
21	classify-fields	2	2021-03-20 09:36:53.73339	2021-03-20 09:36:53.754336	20	{"fields-classified":5,"fields-failed":0}
22	classify-tables	2	2021-03-20 09:36:53.754533	2021-03-20 09:36:53.76555	11	{"total-tables":2,"tables-classified":2}
23	field values scanning	2	2021-03-20 09:36:53.776558	2021-03-20 09:36:53.812863	36	\N
24	update-field-values	2	2021-03-20 09:36:53.776577	2021-03-20 09:36:53.812823	36	{"errors":0,"created":1,"updated":0,"deleted":0}
25	sync	2	2021-03-20 09:46:56.149694	2021-03-20 09:46:56.299611	149	\N
26	sync-timezone	2	2021-03-20 09:46:56.149715	2021-03-20 09:46:56.156681	6	{"timezone-id":"UTC"}
27	sync-tables	2	2021-03-20 09:46:56.156755	2021-03-20 09:46:56.184421	27	{"updated-tables":1,"total-tables":2}
28	sync-fields	2	2021-03-20 09:46:56.184596	2021-03-20 09:46:56.249853	65	{"total-fields":8,"updated-fields":2}
29	sync-fks	2	2021-03-20 09:46:56.249891	2021-03-20 09:46:56.288497	38	{"total-fks":0,"updated-fks":0,"total-failed":0}
30	sync-metabase-metadata	2	2021-03-20 09:46:56.288541	2021-03-20 09:46:56.299587	11	\N
31	analyze	2	2021-03-20 09:46:56.319666	2021-03-20 09:46:56.424973	105	\N
32	fingerprint-fields	2	2021-03-20 09:46:56.319681	2021-03-20 09:46:56.408338	88	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":2,"fingerprints-attempted":2}
33	classify-fields	2	2021-03-20 09:46:56.408395	2021-03-20 09:46:56.41529	6	{"fields-classified":2,"fields-failed":0}
34	classify-tables	2	2021-03-20 09:46:56.415337	2021-03-20 09:46:56.42494	9	{"total-tables":3,"tables-classified":1}
35	sync	1	2021-03-20 09:50:00.017589	2021-03-20 09:50:00.223333	205	\N
36	sync-timezone	1	2021-03-20 09:50:00.017606	2021-03-20 09:50:00.023343	5	{"timezone-id":"UTC"}
37	sync-tables	1	2021-03-20 09:50:00.023392	2021-03-20 09:50:00.032191	8	{"updated-tables":0,"total-tables":4}
38	sync-fields	1	2021-03-20 09:50:00.032336	2021-03-20 09:50:00.11333	80	{"total-fields":36,"updated-fields":0}
39	sync-fks	1	2021-03-20 09:50:00.113372	2021-03-20 09:50:00.122256	8	{"total-fks":3,"updated-fks":0,"total-failed":0}
40	sync-metabase-metadata	1	2021-03-20 09:50:00.122305	2021-03-20 09:50:00.223308	101	\N
41	analyze	1	2021-03-20 09:50:00.234372	2021-03-20 09:50:00.255186	20	\N
42	fingerprint-fields	1	2021-03-20 09:50:00.234388	2021-03-20 09:50:00.245943	11	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":0,"fingerprints-attempted":0}
43	classify-fields	1	2021-03-20 09:50:00.246001	2021-03-20 09:50:00.251185	5	{"fields-classified":0,"fields-failed":0}
44	classify-tables	1	2021-03-20 09:50:00.25123	2021-03-20 09:50:00.25498	3	{"total-tables":4,"tables-classified":0}
45	task-history-cleanup	\N	2021-03-20 10:00:00.017	2021-03-20 10:00:00.021	4	\N
46	send-pulses	\N	2021-03-20 10:00:00.027	2021-03-20 10:00:00.045	18	\N
47	sync	2	2021-03-20 10:00:00.05541	2021-03-20 10:00:00.184624	129	\N
48	sync-timezone	2	2021-03-20 10:00:00.055427	2021-03-20 10:00:00.059394	3	{"timezone-id":"UTC"}
49	sync-tables	2	2021-03-20 10:00:00.059435	2021-03-20 10:00:00.07285	13	{"updated-tables":0,"total-tables":3}
50	sync-fields	2	2021-03-20 10:00:00.072921	2021-03-20 10:00:00.131507	58	{"total-fields":8,"updated-fields":0}
51	sync-fks	2	2021-03-20 10:00:00.131546	2021-03-20 10:00:00.175461	43	{"total-fks":0,"updated-fks":0,"total-failed":0}
52	sync-metabase-metadata	2	2021-03-20 10:00:00.175549	2021-03-20 10:00:00.184598	9	\N
53	analyze	2	2021-03-20 10:00:00.195813	2021-03-20 10:00:00.217092	21	\N
54	fingerprint-fields	2	2021-03-20 10:00:00.195826	2021-03-20 10:00:00.206799	10	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":0,"fingerprints-attempted":0}
55	classify-fields	2	2021-03-20 10:00:00.206855	2021-03-20 10:00:00.211868	5	{"fields-classified":0,"fields-failed":0}
56	classify-tables	2	2021-03-20 10:00:00.211957	2021-03-20 10:00:00.216987	5	{"total-tables":3,"tables-classified":0}
\.


--
-- Data for Name: view_log; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.view_log (id, user_id, model, model_id, "timestamp") FROM stdin;
1	1	card	1	2021-03-20 09:51:03.64301+00
2	1	card	1	2021-03-20 09:52:21.151811+00
\.


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.activity_id_seq', 3, true);


--
-- Name: card_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.card_label_id_seq', 1, false);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.collection_id_seq', 1, true);


--
-- Name: collection_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.collection_revision_id_seq', 1, false);


--
-- Name: computation_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.computation_job_id_seq', 1, false);


--
-- Name: computation_job_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.computation_job_result_id_seq', 1, false);


--
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.core_user_id_seq', 1, true);


--
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.dashboard_favorite_id_seq', 1, false);


--
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.dashboardcard_series_id_seq', 1, false);


--
-- Name: dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.dependency_id_seq', 1, false);


--
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.dimension_id_seq', 1, false);


--
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.group_table_access_policy_id_seq', 1, false);


--
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.label_id_seq', 1, false);


--
-- Name: metabase_database_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_database_id_seq', 2, true);


--
-- Name: metabase_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_field_id_seq', 44, true);


--
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_fieldvalues_id_seq', 6, true);


--
-- Name: metabase_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_table_id_seq', 7, true);


--
-- Name: metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metric_id_seq', 1, false);


--
-- Name: metric_important_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metric_important_field_id_seq', 1, false);


--
-- Name: native_query_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.native_query_snippet_id_seq', 1, false);


--
-- Name: permissions_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.permissions_group_id_seq', 3, true);


--
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.permissions_group_membership_id_seq', 2, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 5, true);


--
-- Name: permissions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.permissions_revision_id_seq', 1, false);


--
-- Name: pulse_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.pulse_card_id_seq', 1, false);


--
-- Name: pulse_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.pulse_channel_id_seq', 1, false);


--
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.pulse_channel_recipient_id_seq', 1, false);


--
-- Name: pulse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.pulse_id_seq', 1, false);


--
-- Name: query_execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.query_execution_id_seq', 8, true);


--
-- Name: report_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.report_card_id_seq', 1, true);


--
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.report_cardfavorite_id_seq', 1, false);


--
-- Name: report_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.report_dashboard_id_seq', 1, false);


--
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.report_dashboardcard_id_seq', 1, false);


--
-- Name: revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.revision_id_seq', 1, true);


--
-- Name: segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.segment_id_seq', 1, false);


--
-- Name: task_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.task_history_id_seq', 56, true);


--
-- Name: view_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.view_log_id_seq', 2, true);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: card_label card_label_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT card_label_pkey PRIMARY KEY (id);


--
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- Name: collection_revision collection_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection_revision
    ADD CONSTRAINT collection_revision_pkey PRIMARY KEY (id);


--
-- Name: computation_job computation_job_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job
    ADD CONSTRAINT computation_job_pkey PRIMARY KEY (id);


--
-- Name: computation_job_result computation_job_result_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job_result
    ADD CONSTRAINT computation_job_result_pkey PRIMARY KEY (id);


--
-- Name: core_session core_session_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.core_session
    ADD CONSTRAINT core_session_pkey PRIMARY KEY (id);


--
-- Name: core_user core_user_email_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_email_key UNIQUE (email);


--
-- Name: core_user core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);


--
-- Name: dashboard_favorite dashboard_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT dashboard_favorite_pkey PRIMARY KEY (id);


--
-- Name: dashboardcard_series dashboardcard_series_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT dashboardcard_series_pkey PRIMARY KEY (id);


--
-- Name: data_migrations data_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.data_migrations
    ADD CONSTRAINT data_migrations_pkey PRIMARY KEY (id);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: dependency dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (id);


--
-- Name: dimension dimension_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT dimension_pkey PRIMARY KEY (id);


--
-- Name: group_table_access_policy group_table_access_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT group_table_access_policy_pkey PRIMARY KEY (id);


--
-- Name: databasechangelog idx_databasechangelog_id_author_filename; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.databasechangelog
    ADD CONSTRAINT idx_databasechangelog_id_author_filename UNIQUE (id, author, filename);


--
-- Name: metabase_field idx_uniq_field_table_id_parent_id_name; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT idx_uniq_field_table_id_parent_id_name UNIQUE (table_id, parent_id, name);


--
-- Name: metabase_table idx_uniq_table_db_id_schema_name; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT idx_uniq_table_db_id_schema_name UNIQUE (db_id, schema, name);


--
-- Name: report_cardfavorite idx_unique_cardfavorite_card_id_owner_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT idx_unique_cardfavorite_card_id_owner_id UNIQUE (card_id, owner_id);


--
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- Name: label label_slug_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_slug_key UNIQUE (slug);


--
-- Name: metabase_database metabase_database_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_database
    ADD CONSTRAINT metabase_database_pkey PRIMARY KEY (id);


--
-- Name: metabase_field metabase_field_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT metabase_field_pkey PRIMARY KEY (id);


--
-- Name: metabase_fieldvalues metabase_fieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_fieldvalues
    ADD CONSTRAINT metabase_fieldvalues_pkey PRIMARY KEY (id);


--
-- Name: metabase_table metabase_table_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT metabase_table_pkey PRIMARY KEY (id);


--
-- Name: metric_important_field metric_important_field_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT metric_important_field_pkey PRIMARY KEY (id);


--
-- Name: metric metric_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT metric_pkey PRIMARY KEY (id);


--
-- Name: native_query_snippet native_query_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT native_query_snippet_name_key UNIQUE (name);


--
-- Name: native_query_snippet native_query_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT native_query_snippet_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_group_id_object_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_group_id_object_key UNIQUE (group_id, object);


--
-- Name: permissions_group_membership permissions_group_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT permissions_group_membership_pkey PRIMARY KEY (id);


--
-- Name: permissions_group permissions_group_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group
    ADD CONSTRAINT permissions_group_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions_revision permissions_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_revision
    ADD CONSTRAINT permissions_revision_pkey PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers pk_qrtz_blob_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT pk_qrtz_blob_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars pk_qrtz_calendars; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT pk_qrtz_calendars PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers pk_qrtz_cron_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT pk_qrtz_cron_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers pk_qrtz_fired_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT pk_qrtz_fired_triggers PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details pk_qrtz_job_details; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT pk_qrtz_job_details PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks pk_qrtz_locks; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT pk_qrtz_locks PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_scheduler_state pk_qrtz_scheduler_state; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT pk_qrtz_scheduler_state PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers pk_qrtz_simple_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT pk_qrtz_simple_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers pk_qrtz_simprop_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT pk_qrtz_simprop_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers pk_qrtz_triggers; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT pk_qrtz_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_paused_trigger_grps pk_sched_name; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT pk_sched_name PRIMARY KEY (sched_name, trigger_group);


--
-- Name: pulse_card pulse_card_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT pulse_card_pkey PRIMARY KEY (id);


--
-- Name: pulse_channel pulse_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel
    ADD CONSTRAINT pulse_channel_pkey PRIMARY KEY (id);


--
-- Name: pulse_channel_recipient pulse_channel_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT pulse_channel_recipient_pkey PRIMARY KEY (id);


--
-- Name: pulse pulse_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT pulse_pkey PRIMARY KEY (id);


--
-- Name: query_cache query_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.query_cache
    ADD CONSTRAINT query_cache_pkey PRIMARY KEY (query_hash);


--
-- Name: query_execution query_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.query_execution
    ADD CONSTRAINT query_execution_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (query_hash);


--
-- Name: report_card report_card_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT report_card_pkey PRIMARY KEY (id);


--
-- Name: report_card report_card_public_uuid_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT report_card_public_uuid_key UNIQUE (public_uuid);


--
-- Name: report_cardfavorite report_cardfavorite_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT report_cardfavorite_pkey PRIMARY KEY (id);


--
-- Name: report_dashboard report_dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT report_dashboard_pkey PRIMARY KEY (id);


--
-- Name: report_dashboard report_dashboard_public_uuid_key; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT report_dashboard_public_uuid_key UNIQUE (public_uuid);


--
-- Name: report_dashboardcard report_dashboardcard_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT report_dashboardcard_pkey PRIMARY KEY (id);


--
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- Name: segment segment_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT segment_pkey PRIMARY KEY (id);


--
-- Name: setting setting_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT setting_pkey PRIMARY KEY (key);


--
-- Name: task_history task_history_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id);


--
-- Name: card_label unique_card_label_card_id_label_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT unique_card_label_card_id_label_id UNIQUE (card_id, label_id);


--
-- Name: collection unique_collection_personal_owner_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT unique_collection_personal_owner_id UNIQUE (personal_owner_id);


--
-- Name: dashboard_favorite unique_dashboard_favorite_user_id_dashboard_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT unique_dashboard_favorite_user_id_dashboard_id UNIQUE (user_id, dashboard_id);


--
-- Name: dimension unique_dimension_field_id_name; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT unique_dimension_field_id_name UNIQUE (field_id, name);


--
-- Name: group_table_access_policy unique_gtap_table_id_group_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT unique_gtap_table_id_group_id UNIQUE (table_id, group_id);


--
-- Name: metric_important_field unique_metric_important_field_metric_id_field_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT unique_metric_important_field_metric_id_field_id UNIQUE (metric_id, field_id);


--
-- Name: permissions_group_membership unique_permissions_group_membership_user_id_group_id; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT unique_permissions_group_membership_user_id_group_id UNIQUE (user_id, group_id);


--
-- Name: permissions_group unique_permissions_group_name; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group
    ADD CONSTRAINT unique_permissions_group_name UNIQUE (name);


--
-- Name: view_log view_log_pkey; Type: CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.view_log
    ADD CONSTRAINT view_log_pkey PRIMARY KEY (id);


--
-- Name: idx_activity_custom_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_activity_custom_id ON public.activity USING btree (custom_id);


--
-- Name: idx_activity_timestamp; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_activity_timestamp ON public.activity USING btree ("timestamp");


--
-- Name: idx_activity_user_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_activity_user_id ON public.activity USING btree (user_id);


--
-- Name: idx_card_collection_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_card_collection_id ON public.report_card USING btree (collection_id);


--
-- Name: idx_card_creator_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_card_creator_id ON public.report_card USING btree (creator_id);


--
-- Name: idx_card_label_card_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_card_label_card_id ON public.card_label USING btree (card_id);


--
-- Name: idx_card_label_label_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_card_label_label_id ON public.card_label USING btree (label_id);


--
-- Name: idx_card_public_uuid; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_card_public_uuid ON public.report_card USING btree (public_uuid);


--
-- Name: idx_cardfavorite_card_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_cardfavorite_card_id ON public.report_cardfavorite USING btree (card_id);


--
-- Name: idx_cardfavorite_owner_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_cardfavorite_owner_id ON public.report_cardfavorite USING btree (owner_id);


--
-- Name: idx_collection_location; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_collection_location ON public.collection USING btree (location);


--
-- Name: idx_collection_personal_owner_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_collection_personal_owner_id ON public.collection USING btree (personal_owner_id);


--
-- Name: idx_dashboard_collection_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboard_collection_id ON public.report_dashboard USING btree (collection_id);


--
-- Name: idx_dashboard_creator_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboard_creator_id ON public.report_dashboard USING btree (creator_id);


--
-- Name: idx_dashboard_favorite_dashboard_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboard_favorite_dashboard_id ON public.dashboard_favorite USING btree (dashboard_id);


--
-- Name: idx_dashboard_favorite_user_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboard_favorite_user_id ON public.dashboard_favorite USING btree (user_id);


--
-- Name: idx_dashboard_public_uuid; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboard_public_uuid ON public.report_dashboard USING btree (public_uuid);


--
-- Name: idx_dashboardcard_card_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboardcard_card_id ON public.report_dashboardcard USING btree (card_id);


--
-- Name: idx_dashboardcard_dashboard_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboardcard_dashboard_id ON public.report_dashboardcard USING btree (dashboard_id);


--
-- Name: idx_dashboardcard_series_card_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboardcard_series_card_id ON public.dashboardcard_series USING btree (card_id);


--
-- Name: idx_dashboardcard_series_dashboardcard_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dashboardcard_series_dashboardcard_id ON public.dashboardcard_series USING btree (dashboardcard_id);


--
-- Name: idx_data_migrations_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_data_migrations_id ON public.data_migrations USING btree (id);


--
-- Name: idx_dependency_dependent_on_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dependency_dependent_on_id ON public.dependency USING btree (dependent_on_id);


--
-- Name: idx_dependency_dependent_on_model; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dependency_dependent_on_model ON public.dependency USING btree (dependent_on_model);


--
-- Name: idx_dependency_model; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dependency_model ON public.dependency USING btree (model);


--
-- Name: idx_dependency_model_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dependency_model_id ON public.dependency USING btree (model_id);


--
-- Name: idx_dimension_field_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_dimension_field_id ON public.dimension USING btree (field_id);


--
-- Name: idx_field_parent_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_field_parent_id ON public.metabase_field USING btree (parent_id);


--
-- Name: idx_field_table_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_field_table_id ON public.metabase_field USING btree (table_id);


--
-- Name: idx_fieldvalues_field_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_fieldvalues_field_id ON public.metabase_fieldvalues USING btree (field_id);


--
-- Name: idx_gtap_table_id_group_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_gtap_table_id_group_id ON public.group_table_access_policy USING btree (table_id, group_id);


--
-- Name: idx_label_slug; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_label_slug ON public.label USING btree (slug);


--
-- Name: idx_metabase_table_db_id_schema; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metabase_table_db_id_schema ON public.metabase_table USING btree (db_id, schema);


--
-- Name: idx_metabase_table_show_in_getting_started; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metabase_table_show_in_getting_started ON public.metabase_table USING btree (show_in_getting_started);


--
-- Name: idx_metric_creator_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metric_creator_id ON public.metric USING btree (creator_id);


--
-- Name: idx_metric_important_field_field_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metric_important_field_field_id ON public.metric_important_field USING btree (field_id);


--
-- Name: idx_metric_important_field_metric_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metric_important_field_metric_id ON public.metric_important_field USING btree (metric_id);


--
-- Name: idx_metric_show_in_getting_started; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metric_show_in_getting_started ON public.metric USING btree (show_in_getting_started);


--
-- Name: idx_metric_table_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_metric_table_id ON public.metric USING btree (table_id);


--
-- Name: idx_permissions_group_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_id ON public.permissions USING btree (group_id);


--
-- Name: idx_permissions_group_id_object; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_id_object ON public.permissions USING btree (group_id, object);


--
-- Name: idx_permissions_group_membership_group_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_membership_group_id ON public.permissions_group_membership USING btree (group_id);


--
-- Name: idx_permissions_group_membership_group_id_user_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_membership_group_id_user_id ON public.permissions_group_membership USING btree (group_id, user_id);


--
-- Name: idx_permissions_group_membership_user_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_membership_user_id ON public.permissions_group_membership USING btree (user_id);


--
-- Name: idx_permissions_group_name; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_group_name ON public.permissions_group USING btree (name);


--
-- Name: idx_permissions_object; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_permissions_object ON public.permissions USING btree (object);


--
-- Name: idx_pulse_card_card_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_card_card_id ON public.pulse_card USING btree (card_id);


--
-- Name: idx_pulse_card_pulse_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_card_pulse_id ON public.pulse_card USING btree (pulse_id);


--
-- Name: idx_pulse_channel_pulse_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_channel_pulse_id ON public.pulse_channel USING btree (pulse_id);


--
-- Name: idx_pulse_channel_schedule_type; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_channel_schedule_type ON public.pulse_channel USING btree (schedule_type);


--
-- Name: idx_pulse_collection_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_collection_id ON public.pulse USING btree (collection_id);


--
-- Name: idx_pulse_creator_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_pulse_creator_id ON public.pulse USING btree (creator_id);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_query_cache_updated_at; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_query_cache_updated_at ON public.query_cache USING btree (updated_at);


--
-- Name: idx_query_execution_query_hash_started_at; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_query_execution_query_hash_started_at ON public.query_execution USING btree (hash, started_at);


--
-- Name: idx_query_execution_started_at; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_query_execution_started_at ON public.query_execution USING btree (started_at);


--
-- Name: idx_report_dashboard_show_in_getting_started; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_report_dashboard_show_in_getting_started ON public.report_dashboard USING btree (show_in_getting_started);


--
-- Name: idx_revision_model_model_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_revision_model_model_id ON public.revision USING btree (model, model_id);


--
-- Name: idx_segment_creator_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_segment_creator_id ON public.segment USING btree (creator_id);


--
-- Name: idx_segment_show_in_getting_started; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_segment_show_in_getting_started ON public.segment USING btree (show_in_getting_started);


--
-- Name: idx_segment_table_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_segment_table_id ON public.segment USING btree (table_id);


--
-- Name: idx_snippet_collection_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_snippet_collection_id ON public.native_query_snippet USING btree (collection_id);


--
-- Name: idx_snippet_name; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_snippet_name ON public.native_query_snippet USING btree (name);


--
-- Name: idx_table_db_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_table_db_id ON public.metabase_table USING btree (db_id);


--
-- Name: idx_task_history_db_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_task_history_db_id ON public.task_history USING btree (db_id);


--
-- Name: idx_task_history_end_time; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_task_history_end_time ON public.task_history USING btree (ended_at);


--
-- Name: idx_uniq_field_table_id_parent_id_name_2col; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE UNIQUE INDEX idx_uniq_field_table_id_parent_id_name_2col ON public.metabase_field USING btree (table_id, name) WHERE (parent_id IS NULL);


--
-- Name: idx_uniq_table_db_id_schema_name_2col; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE UNIQUE INDEX idx_uniq_table_db_id_schema_name_2col ON public.metabase_table USING btree (db_id, name) WHERE (schema IS NULL);


--
-- Name: idx_view_log_timestamp; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_view_log_timestamp ON public.view_log USING btree (model_id);


--
-- Name: idx_view_log_user_id; Type: INDEX; Schema: public; Owner: metabase_user
--

CREATE INDEX idx_view_log_user_id ON public.view_log USING btree (user_id);


--
-- Name: activity fk_activity_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fk_activity_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_card fk_card_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- Name: card_label fk_card_label_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT fk_card_label_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: card_label fk_card_label_ref_label_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT fk_card_label_ref_label_id FOREIGN KEY (label_id) REFERENCES public.label(id) ON DELETE CASCADE;


--
-- Name: report_card fk_card_made_public_by_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_made_public_by_id FOREIGN KEY (made_public_by_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_card fk_card_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_cardfavorite fk_cardfavorite_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT fk_cardfavorite_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: report_cardfavorite fk_cardfavorite_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT fk_cardfavorite_ref_user_id FOREIGN KEY (owner_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: collection fk_collection_personal_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT fk_collection_personal_owner_id FOREIGN KEY (personal_owner_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: collection_revision fk_collection_revision_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.collection_revision
    ADD CONSTRAINT fk_collection_revision_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: computation_job fk_computation_job_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job
    ADD CONSTRAINT fk_computation_job_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: computation_job_result fk_computation_result_ref_job_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.computation_job_result
    ADD CONSTRAINT fk_computation_result_ref_job_id FOREIGN KEY (job_id) REFERENCES public.computation_job(id) ON DELETE CASCADE;


--
-- Name: report_dashboard fk_dashboard_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- Name: dashboard_favorite fk_dashboard_favorite_dashboard_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT fk_dashboard_favorite_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES public.report_dashboard(id) ON DELETE CASCADE;


--
-- Name: dashboard_favorite fk_dashboard_favorite_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT fk_dashboard_favorite_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_dashboard fk_dashboard_made_public_by_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_made_public_by_id FOREIGN KEY (made_public_by_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_dashboard fk_dashboard_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: report_dashboardcard fk_dashboardcard_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT fk_dashboardcard_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: report_dashboardcard fk_dashboardcard_ref_dashboard_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT fk_dashboardcard_ref_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES public.report_dashboard(id) ON DELETE CASCADE;


--
-- Name: dashboardcard_series fk_dashboardcard_series_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT fk_dashboardcard_series_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: dashboardcard_series fk_dashboardcard_series_ref_dashboardcard_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT fk_dashboardcard_series_ref_dashboardcard_id FOREIGN KEY (dashboardcard_id) REFERENCES public.report_dashboardcard(id) ON DELETE CASCADE;


--
-- Name: dimension fk_dimension_displayfk_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT fk_dimension_displayfk_ref_field_id FOREIGN KEY (human_readable_field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- Name: dimension fk_dimension_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT fk_dimension_ref_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- Name: metabase_field fk_field_parent_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT fk_field_parent_ref_field_id FOREIGN KEY (parent_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- Name: metabase_field fk_field_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT fk_field_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- Name: metabase_fieldvalues fk_fieldvalues_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_fieldvalues
    ADD CONSTRAINT fk_fieldvalues_ref_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- Name: group_table_access_policy fk_gtap_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: group_table_access_policy fk_gtap_group_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- Name: group_table_access_policy fk_gtap_table_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- Name: metric_important_field fk_metric_important_field_metabase_field_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT fk_metric_important_field_metabase_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- Name: metric_important_field fk_metric_important_field_metric_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT fk_metric_important_field_metric_id FOREIGN KEY (metric_id) REFERENCES public.metric(id) ON DELETE CASCADE;


--
-- Name: metric fk_metric_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT fk_metric_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: metric fk_metric_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT fk_metric_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- Name: permissions_group_membership fk_permissions_group_group_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT fk_permissions_group_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- Name: permissions fk_permissions_group_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT fk_permissions_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- Name: permissions_group_membership fk_permissions_group_membership_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT fk_permissions_group_membership_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: permissions_revision fk_permissions_revision_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.permissions_revision
    ADD CONSTRAINT fk_permissions_revision_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: pulse_card fk_pulse_card_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT fk_pulse_card_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- Name: pulse_card fk_pulse_card_ref_pulse_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT fk_pulse_card_ref_pulse_id FOREIGN KEY (pulse_id) REFERENCES public.pulse(id) ON DELETE CASCADE;


--
-- Name: pulse_channel_recipient fk_pulse_channel_recipient_ref_pulse_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT fk_pulse_channel_recipient_ref_pulse_channel_id FOREIGN KEY (pulse_channel_id) REFERENCES public.pulse_channel(id) ON DELETE CASCADE;


--
-- Name: pulse_channel_recipient fk_pulse_channel_recipient_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT fk_pulse_channel_recipient_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: pulse_channel fk_pulse_channel_ref_pulse_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse_channel
    ADD CONSTRAINT fk_pulse_channel_ref_pulse_id FOREIGN KEY (pulse_id) REFERENCES public.pulse(id) ON DELETE CASCADE;


--
-- Name: pulse fk_pulse_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT fk_pulse_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- Name: pulse fk_pulse_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT fk_pulse_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: qrtz_blob_triggers fk_qrtz_blob_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT fk_qrtz_blob_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_cron_triggers fk_qrtz_cron_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT fk_qrtz_cron_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simple_triggers fk_qrtz_simple_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT fk_qrtz_simple_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers fk_qrtz_simprop_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT fk_qrtz_simprop_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers fk_qrtz_triggers_job_details; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT fk_qrtz_triggers_job_details FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);


--
-- Name: report_card fk_report_card_ref_database_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_report_card_ref_database_id FOREIGN KEY (database_id) REFERENCES public.metabase_database(id) ON DELETE CASCADE;


--
-- Name: report_card fk_report_card_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_report_card_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- Name: revision fk_revision_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT fk_revision_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: segment fk_segment_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT fk_segment_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: segment fk_segment_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT fk_segment_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- Name: core_session fk_session_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.core_session
    ADD CONSTRAINT fk_session_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: native_query_snippet fk_snippet_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT fk_snippet_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- Name: native_query_snippet fk_snippet_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT fk_snippet_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- Name: metabase_table fk_table_ref_database_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT fk_table_ref_database_id FOREIGN KEY (db_id) REFERENCES public.metabase_database(id) ON DELETE CASCADE;


--
-- Name: view_log fk_view_log_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: metabase_user
--

ALTER TABLE ONLY public.view_log
    ADD CONSTRAINT fk_view_log_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

pod "postgres-postgresql-client" deleted

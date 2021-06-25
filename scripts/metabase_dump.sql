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

ALTER TABLE ONLY public.view_log DROP CONSTRAINT fk_view_log_ref_user_id;
ALTER TABLE ONLY public.metabase_table DROP CONSTRAINT fk_table_ref_database_id;
ALTER TABLE ONLY public.native_query_snippet DROP CONSTRAINT fk_snippet_creator_id;
ALTER TABLE ONLY public.native_query_snippet DROP CONSTRAINT fk_snippet_collection_id;
ALTER TABLE ONLY public.core_session DROP CONSTRAINT fk_session_ref_user_id;
ALTER TABLE ONLY public.segment DROP CONSTRAINT fk_segment_ref_table_id;
ALTER TABLE ONLY public.segment DROP CONSTRAINT fk_segment_ref_creator_id;
ALTER TABLE ONLY public.revision DROP CONSTRAINT fk_revision_ref_user_id;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT fk_report_card_ref_table_id;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT fk_report_card_ref_database_id;
ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT fk_qrtz_triggers_job_details;
ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT fk_qrtz_simprop_triggers_triggers;
ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT fk_qrtz_simple_triggers_triggers;
ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT fk_qrtz_cron_triggers_triggers;
ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT fk_qrtz_blob_triggers_triggers;
ALTER TABLE ONLY public.pulse DROP CONSTRAINT fk_pulse_ref_creator_id;
ALTER TABLE ONLY public.pulse DROP CONSTRAINT fk_pulse_collection_id;
ALTER TABLE ONLY public.pulse_channel DROP CONSTRAINT fk_pulse_channel_ref_pulse_id;
ALTER TABLE ONLY public.pulse_channel_recipient DROP CONSTRAINT fk_pulse_channel_recipient_ref_user_id;
ALTER TABLE ONLY public.pulse_channel_recipient DROP CONSTRAINT fk_pulse_channel_recipient_ref_pulse_channel_id;
ALTER TABLE ONLY public.pulse_card DROP CONSTRAINT fk_pulse_card_ref_pulse_id;
ALTER TABLE ONLY public.pulse_card DROP CONSTRAINT fk_pulse_card_ref_card_id;
ALTER TABLE ONLY public.permissions_revision DROP CONSTRAINT fk_permissions_revision_user_id;
ALTER TABLE ONLY public.permissions_group_membership DROP CONSTRAINT fk_permissions_group_membership_user_id;
ALTER TABLE ONLY public.permissions DROP CONSTRAINT fk_permissions_group_id;
ALTER TABLE ONLY public.permissions_group_membership DROP CONSTRAINT fk_permissions_group_group_id;
ALTER TABLE ONLY public.metric DROP CONSTRAINT fk_metric_ref_table_id;
ALTER TABLE ONLY public.metric DROP CONSTRAINT fk_metric_ref_creator_id;
ALTER TABLE ONLY public.metric_important_field DROP CONSTRAINT fk_metric_important_field_metric_id;
ALTER TABLE ONLY public.metric_important_field DROP CONSTRAINT fk_metric_important_field_metabase_field_id;
ALTER TABLE ONLY public.group_table_access_policy DROP CONSTRAINT fk_gtap_table_id;
ALTER TABLE ONLY public.group_table_access_policy DROP CONSTRAINT fk_gtap_group_id;
ALTER TABLE ONLY public.group_table_access_policy DROP CONSTRAINT fk_gtap_card_id;
ALTER TABLE ONLY public.metabase_fieldvalues DROP CONSTRAINT fk_fieldvalues_ref_field_id;
ALTER TABLE ONLY public.metabase_field DROP CONSTRAINT fk_field_ref_table_id;
ALTER TABLE ONLY public.metabase_field DROP CONSTRAINT fk_field_parent_ref_field_id;
ALTER TABLE ONLY public.dimension DROP CONSTRAINT fk_dimension_ref_field_id;
ALTER TABLE ONLY public.dimension DROP CONSTRAINT fk_dimension_displayfk_ref_field_id;
ALTER TABLE ONLY public.dashboardcard_series DROP CONSTRAINT fk_dashboardcard_series_ref_dashboardcard_id;
ALTER TABLE ONLY public.dashboardcard_series DROP CONSTRAINT fk_dashboardcard_series_ref_card_id;
ALTER TABLE ONLY public.report_dashboardcard DROP CONSTRAINT fk_dashboardcard_ref_dashboard_id;
ALTER TABLE ONLY public.report_dashboardcard DROP CONSTRAINT fk_dashboardcard_ref_card_id;
ALTER TABLE ONLY public.report_dashboard DROP CONSTRAINT fk_dashboard_ref_user_id;
ALTER TABLE ONLY public.report_dashboard DROP CONSTRAINT fk_dashboard_made_public_by_id;
ALTER TABLE ONLY public.dashboard_favorite DROP CONSTRAINT fk_dashboard_favorite_user_id;
ALTER TABLE ONLY public.dashboard_favorite DROP CONSTRAINT fk_dashboard_favorite_dashboard_id;
ALTER TABLE ONLY public.report_dashboard DROP CONSTRAINT fk_dashboard_collection_id;
ALTER TABLE ONLY public.computation_job_result DROP CONSTRAINT fk_computation_result_ref_job_id;
ALTER TABLE ONLY public.computation_job DROP CONSTRAINT fk_computation_job_ref_user_id;
ALTER TABLE ONLY public.collection_revision DROP CONSTRAINT fk_collection_revision_user_id;
ALTER TABLE ONLY public.collection DROP CONSTRAINT fk_collection_personal_owner_id;
ALTER TABLE ONLY public.report_cardfavorite DROP CONSTRAINT fk_cardfavorite_ref_user_id;
ALTER TABLE ONLY public.report_cardfavorite DROP CONSTRAINT fk_cardfavorite_ref_card_id;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT fk_card_ref_user_id;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT fk_card_made_public_by_id;
ALTER TABLE ONLY public.card_label DROP CONSTRAINT fk_card_label_ref_label_id;
ALTER TABLE ONLY public.card_label DROP CONSTRAINT fk_card_label_ref_card_id;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT fk_card_collection_id;
ALTER TABLE ONLY public.activity DROP CONSTRAINT fk_activity_ref_user_id;
DROP INDEX public.idx_view_log_user_id;
DROP INDEX public.idx_view_log_timestamp;
DROP INDEX public.idx_uniq_table_db_id_schema_name_2col;
DROP INDEX public.idx_uniq_field_table_id_parent_id_name_2col;
DROP INDEX public.idx_task_history_end_time;
DROP INDEX public.idx_task_history_db_id;
DROP INDEX public.idx_table_db_id;
DROP INDEX public.idx_snippet_name;
DROP INDEX public.idx_snippet_collection_id;
DROP INDEX public.idx_segment_table_id;
DROP INDEX public.idx_segment_show_in_getting_started;
DROP INDEX public.idx_segment_creator_id;
DROP INDEX public.idx_revision_model_model_id;
DROP INDEX public.idx_report_dashboard_show_in_getting_started;
DROP INDEX public.idx_query_execution_started_at;
DROP INDEX public.idx_query_execution_query_hash_started_at;
DROP INDEX public.idx_query_cache_updated_at;
DROP INDEX public.idx_qrtz_t_state;
DROP INDEX public.idx_qrtz_t_nft_st_misfire_grp;
DROP INDEX public.idx_qrtz_t_nft_st_misfire;
DROP INDEX public.idx_qrtz_t_nft_st;
DROP INDEX public.idx_qrtz_t_nft_misfire;
DROP INDEX public.idx_qrtz_t_next_fire_time;
DROP INDEX public.idx_qrtz_t_n_state;
DROP INDEX public.idx_qrtz_t_n_g_state;
DROP INDEX public.idx_qrtz_t_jg;
DROP INDEX public.idx_qrtz_t_j;
DROP INDEX public.idx_qrtz_t_g;
DROP INDEX public.idx_qrtz_t_c;
DROP INDEX public.idx_qrtz_j_req_recovery;
DROP INDEX public.idx_qrtz_j_grp;
DROP INDEX public.idx_qrtz_ft_trig_inst_name;
DROP INDEX public.idx_qrtz_ft_tg;
DROP INDEX public.idx_qrtz_ft_t_g;
DROP INDEX public.idx_qrtz_ft_jg;
DROP INDEX public.idx_qrtz_ft_j_g;
DROP INDEX public.idx_qrtz_ft_inst_job_req_rcvry;
DROP INDEX public.idx_pulse_creator_id;
DROP INDEX public.idx_pulse_collection_id;
DROP INDEX public.idx_pulse_channel_schedule_type;
DROP INDEX public.idx_pulse_channel_pulse_id;
DROP INDEX public.idx_pulse_card_pulse_id;
DROP INDEX public.idx_pulse_card_card_id;
DROP INDEX public.idx_permissions_object;
DROP INDEX public.idx_permissions_group_name;
DROP INDEX public.idx_permissions_group_membership_user_id;
DROP INDEX public.idx_permissions_group_membership_group_id_user_id;
DROP INDEX public.idx_permissions_group_membership_group_id;
DROP INDEX public.idx_permissions_group_id_object;
DROP INDEX public.idx_permissions_group_id;
DROP INDEX public.idx_metric_table_id;
DROP INDEX public.idx_metric_show_in_getting_started;
DROP INDEX public.idx_metric_important_field_metric_id;
DROP INDEX public.idx_metric_important_field_field_id;
DROP INDEX public.idx_metric_creator_id;
DROP INDEX public.idx_metabase_table_show_in_getting_started;
DROP INDEX public.idx_metabase_table_db_id_schema;
DROP INDEX public.idx_label_slug;
DROP INDEX public.idx_gtap_table_id_group_id;
DROP INDEX public.idx_fieldvalues_field_id;
DROP INDEX public.idx_field_table_id;
DROP INDEX public.idx_field_parent_id;
DROP INDEX public.idx_dimension_field_id;
DROP INDEX public.idx_dependency_model_id;
DROP INDEX public.idx_dependency_model;
DROP INDEX public.idx_dependency_dependent_on_model;
DROP INDEX public.idx_dependency_dependent_on_id;
DROP INDEX public.idx_data_migrations_id;
DROP INDEX public.idx_dashboardcard_series_dashboardcard_id;
DROP INDEX public.idx_dashboardcard_series_card_id;
DROP INDEX public.idx_dashboardcard_dashboard_id;
DROP INDEX public.idx_dashboardcard_card_id;
DROP INDEX public.idx_dashboard_public_uuid;
DROP INDEX public.idx_dashboard_favorite_user_id;
DROP INDEX public.idx_dashboard_favorite_dashboard_id;
DROP INDEX public.idx_dashboard_creator_id;
DROP INDEX public.idx_dashboard_collection_id;
DROP INDEX public.idx_collection_personal_owner_id;
DROP INDEX public.idx_collection_location;
DROP INDEX public.idx_cardfavorite_owner_id;
DROP INDEX public.idx_cardfavorite_card_id;
DROP INDEX public.idx_card_public_uuid;
DROP INDEX public.idx_card_label_label_id;
DROP INDEX public.idx_card_label_card_id;
DROP INDEX public.idx_card_creator_id;
DROP INDEX public.idx_card_collection_id;
DROP INDEX public.idx_activity_user_id;
DROP INDEX public.idx_activity_timestamp;
DROP INDEX public.idx_activity_custom_id;
ALTER TABLE ONLY public.view_log DROP CONSTRAINT view_log_pkey;
ALTER TABLE ONLY public.permissions_group DROP CONSTRAINT unique_permissions_group_name;
ALTER TABLE ONLY public.permissions_group_membership DROP CONSTRAINT unique_permissions_group_membership_user_id_group_id;
ALTER TABLE ONLY public.metric_important_field DROP CONSTRAINT unique_metric_important_field_metric_id_field_id;
ALTER TABLE ONLY public.group_table_access_policy DROP CONSTRAINT unique_gtap_table_id_group_id;
ALTER TABLE ONLY public.dimension DROP CONSTRAINT unique_dimension_field_id_name;
ALTER TABLE ONLY public.dashboard_favorite DROP CONSTRAINT unique_dashboard_favorite_user_id_dashboard_id;
ALTER TABLE ONLY public.collection DROP CONSTRAINT unique_collection_personal_owner_id;
ALTER TABLE ONLY public.card_label DROP CONSTRAINT unique_card_label_card_id_label_id;
ALTER TABLE ONLY public.task_history DROP CONSTRAINT task_history_pkey;
ALTER TABLE ONLY public.setting DROP CONSTRAINT setting_pkey;
ALTER TABLE ONLY public.segment DROP CONSTRAINT segment_pkey;
ALTER TABLE ONLY public.revision DROP CONSTRAINT revision_pkey;
ALTER TABLE ONLY public.report_dashboardcard DROP CONSTRAINT report_dashboardcard_pkey;
ALTER TABLE ONLY public.report_dashboard DROP CONSTRAINT report_dashboard_public_uuid_key;
ALTER TABLE ONLY public.report_dashboard DROP CONSTRAINT report_dashboard_pkey;
ALTER TABLE ONLY public.report_cardfavorite DROP CONSTRAINT report_cardfavorite_pkey;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT report_card_public_uuid_key;
ALTER TABLE ONLY public.report_card DROP CONSTRAINT report_card_pkey;
ALTER TABLE ONLY public.query DROP CONSTRAINT query_pkey;
ALTER TABLE ONLY public.query_execution DROP CONSTRAINT query_execution_pkey;
ALTER TABLE ONLY public.query_cache DROP CONSTRAINT query_cache_pkey;
ALTER TABLE ONLY public.pulse DROP CONSTRAINT pulse_pkey;
ALTER TABLE ONLY public.pulse_channel_recipient DROP CONSTRAINT pulse_channel_recipient_pkey;
ALTER TABLE ONLY public.pulse_channel DROP CONSTRAINT pulse_channel_pkey;
ALTER TABLE ONLY public.pulse_card DROP CONSTRAINT pulse_card_pkey;
ALTER TABLE ONLY public.qrtz_paused_trigger_grps DROP CONSTRAINT pk_sched_name;
ALTER TABLE ONLY public.qrtz_triggers DROP CONSTRAINT pk_qrtz_triggers;
ALTER TABLE ONLY public.qrtz_simprop_triggers DROP CONSTRAINT pk_qrtz_simprop_triggers;
ALTER TABLE ONLY public.qrtz_simple_triggers DROP CONSTRAINT pk_qrtz_simple_triggers;
ALTER TABLE ONLY public.qrtz_scheduler_state DROP CONSTRAINT pk_qrtz_scheduler_state;
ALTER TABLE ONLY public.qrtz_locks DROP CONSTRAINT pk_qrtz_locks;
ALTER TABLE ONLY public.qrtz_job_details DROP CONSTRAINT pk_qrtz_job_details;
ALTER TABLE ONLY public.qrtz_fired_triggers DROP CONSTRAINT pk_qrtz_fired_triggers;
ALTER TABLE ONLY public.qrtz_cron_triggers DROP CONSTRAINT pk_qrtz_cron_triggers;
ALTER TABLE ONLY public.qrtz_calendars DROP CONSTRAINT pk_qrtz_calendars;
ALTER TABLE ONLY public.qrtz_blob_triggers DROP CONSTRAINT pk_qrtz_blob_triggers;
ALTER TABLE ONLY public.permissions_revision DROP CONSTRAINT permissions_revision_pkey;
ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
ALTER TABLE ONLY public.permissions_group DROP CONSTRAINT permissions_group_pkey;
ALTER TABLE ONLY public.permissions_group_membership DROP CONSTRAINT permissions_group_membership_pkey;
ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_group_id_object_key;
ALTER TABLE ONLY public.native_query_snippet DROP CONSTRAINT native_query_snippet_pkey;
ALTER TABLE ONLY public.native_query_snippet DROP CONSTRAINT native_query_snippet_name_key;
ALTER TABLE ONLY public.metric DROP CONSTRAINT metric_pkey;
ALTER TABLE ONLY public.metric_important_field DROP CONSTRAINT metric_important_field_pkey;
ALTER TABLE ONLY public.metabase_table DROP CONSTRAINT metabase_table_pkey;
ALTER TABLE ONLY public.metabase_fieldvalues DROP CONSTRAINT metabase_fieldvalues_pkey;
ALTER TABLE ONLY public.metabase_field DROP CONSTRAINT metabase_field_pkey;
ALTER TABLE ONLY public.metabase_database DROP CONSTRAINT metabase_database_pkey;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_slug_key;
ALTER TABLE ONLY public.label DROP CONSTRAINT label_pkey;
ALTER TABLE ONLY public.report_cardfavorite DROP CONSTRAINT idx_unique_cardfavorite_card_id_owner_id;
ALTER TABLE ONLY public.metabase_table DROP CONSTRAINT idx_uniq_table_db_id_schema_name;
ALTER TABLE ONLY public.metabase_field DROP CONSTRAINT idx_uniq_field_table_id_parent_id_name;
ALTER TABLE ONLY public.databasechangelog DROP CONSTRAINT idx_databasechangelog_id_author_filename;
ALTER TABLE ONLY public.group_table_access_policy DROP CONSTRAINT group_table_access_policy_pkey;
ALTER TABLE ONLY public.dimension DROP CONSTRAINT dimension_pkey;
ALTER TABLE ONLY public.dependency DROP CONSTRAINT dependency_pkey;
ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
ALTER TABLE ONLY public.data_migrations DROP CONSTRAINT data_migrations_pkey;
ALTER TABLE ONLY public.dashboardcard_series DROP CONSTRAINT dashboardcard_series_pkey;
ALTER TABLE ONLY public.dashboard_favorite DROP CONSTRAINT dashboard_favorite_pkey;
ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_pkey;
ALTER TABLE ONLY public.core_user DROP CONSTRAINT core_user_email_key;
ALTER TABLE ONLY public.core_session DROP CONSTRAINT core_session_pkey;
ALTER TABLE ONLY public.computation_job_result DROP CONSTRAINT computation_job_result_pkey;
ALTER TABLE ONLY public.computation_job DROP CONSTRAINT computation_job_pkey;
ALTER TABLE ONLY public.collection_revision DROP CONSTRAINT collection_revision_pkey;
ALTER TABLE ONLY public.collection DROP CONSTRAINT collection_pkey;
ALTER TABLE ONLY public.card_label DROP CONSTRAINT card_label_pkey;
ALTER TABLE ONLY public.activity DROP CONSTRAINT activity_pkey;
ALTER TABLE public.view_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.task_history ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.segment ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.revision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.report_dashboardcard ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.report_dashboard ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.report_cardfavorite ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.report_card ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.query_execution ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pulse_channel_recipient ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pulse_channel ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pulse_card ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.pulse ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permissions_revision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permissions_group_membership ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permissions_group ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.native_query_snippet ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metric_important_field ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metric ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metabase_table ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metabase_fieldvalues ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metabase_field ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.metabase_database ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.label ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.group_table_access_policy ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dimension ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dependency ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dashboardcard_series ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.dashboard_favorite ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.core_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.computation_job_result ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.computation_job ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.collection_revision ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.collection ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.card_label ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.activity ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.view_log_id_seq;
DROP TABLE public.view_log;
DROP SEQUENCE public.task_history_id_seq;
DROP TABLE public.task_history;
DROP TABLE public.setting;
DROP SEQUENCE public.segment_id_seq;
DROP TABLE public.segment;
DROP SEQUENCE public.revision_id_seq;
DROP TABLE public.revision;
DROP SEQUENCE public.report_dashboardcard_id_seq;
DROP TABLE public.report_dashboardcard;
DROP SEQUENCE public.report_dashboard_id_seq;
DROP TABLE public.report_dashboard;
DROP SEQUENCE public.report_cardfavorite_id_seq;
DROP TABLE public.report_cardfavorite;
DROP SEQUENCE public.report_card_id_seq;
DROP TABLE public.report_card;
DROP SEQUENCE public.query_execution_id_seq;
DROP TABLE public.query_execution;
DROP TABLE public.query_cache;
DROP TABLE public.query;
DROP TABLE public.qrtz_triggers;
DROP TABLE public.qrtz_simprop_triggers;
DROP TABLE public.qrtz_simple_triggers;
DROP TABLE public.qrtz_scheduler_state;
DROP TABLE public.qrtz_paused_trigger_grps;
DROP TABLE public.qrtz_locks;
DROP TABLE public.qrtz_job_details;
DROP TABLE public.qrtz_fired_triggers;
DROP TABLE public.qrtz_cron_triggers;
DROP TABLE public.qrtz_calendars;
DROP TABLE public.qrtz_blob_triggers;
DROP SEQUENCE public.pulse_id_seq;
DROP SEQUENCE public.pulse_channel_recipient_id_seq;
DROP TABLE public.pulse_channel_recipient;
DROP SEQUENCE public.pulse_channel_id_seq;
DROP TABLE public.pulse_channel;
DROP SEQUENCE public.pulse_card_id_seq;
DROP TABLE public.pulse_card;
DROP TABLE public.pulse;
DROP SEQUENCE public.permissions_revision_id_seq;
DROP TABLE public.permissions_revision;
DROP SEQUENCE public.permissions_id_seq;
DROP SEQUENCE public.permissions_group_membership_id_seq;
DROP TABLE public.permissions_group_membership;
DROP SEQUENCE public.permissions_group_id_seq;
DROP TABLE public.permissions_group;
DROP TABLE public.permissions;
DROP SEQUENCE public.native_query_snippet_id_seq;
DROP TABLE public.native_query_snippet;
DROP SEQUENCE public.metric_important_field_id_seq;
DROP TABLE public.metric_important_field;
DROP SEQUENCE public.metric_id_seq;
DROP TABLE public.metric;
DROP SEQUENCE public.metabase_table_id_seq;
DROP TABLE public.metabase_table;
DROP SEQUENCE public.metabase_fieldvalues_id_seq;
DROP TABLE public.metabase_fieldvalues;
DROP SEQUENCE public.metabase_field_id_seq;
DROP TABLE public.metabase_field;
DROP SEQUENCE public.metabase_database_id_seq;
DROP TABLE public.metabase_database;
DROP SEQUENCE public.label_id_seq;
DROP TABLE public.label;
DROP SEQUENCE public.group_table_access_policy_id_seq;
DROP TABLE public.group_table_access_policy;
DROP SEQUENCE public.dimension_id_seq;
DROP TABLE public.dimension;
DROP SEQUENCE public.dependency_id_seq;
DROP TABLE public.dependency;
DROP TABLE public.databasechangeloglock;
DROP TABLE public.databasechangelog;
DROP TABLE public.data_migrations;
DROP SEQUENCE public.dashboardcard_series_id_seq;
DROP TABLE public.dashboardcard_series;
DROP SEQUENCE public.dashboard_favorite_id_seq;
DROP TABLE public.dashboard_favorite;
DROP SEQUENCE public.core_user_id_seq;
DROP TABLE public.core_user;
DROP TABLE public.core_session;
DROP SEQUENCE public.computation_job_result_id_seq;
DROP TABLE public.computation_job_result;
DROP SEQUENCE public.computation_job_id_seq;
DROP TABLE public.computation_job;
DROP SEQUENCE public.collection_revision_id_seq;
DROP TABLE public.collection_revision;
DROP SEQUENCE public.collection_id_seq;
DROP TABLE public.collection;
DROP SEQUENCE public.card_label_id_seq;
DROP TABLE public.card_label;
DROP SEQUENCE public.activity_id_seq;
DROP TABLE public.activity;
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
1	install	2021-03-20 16:30:23.890205+00	\N	install	\N	\N	\N	\N	{}
4	user-joined	2021-03-20 18:41:41.884906+00	2	user	2	\N	\N	\N	{}
5	card-create	2021-03-20 19:12:07.237786+00	2	card	2	3	\N	\N	{"name":"Covid19 Daily Cases in UK","description":null}
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
2	dev user's Personal Collection	\N	#31698A	f	/	2	dev_user_s_personal_collection	\N
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
2	devuser@somemail.com	dev	user	$2a$10$M.0qldmzWPyQwNggSSCyle.dPOBxZUrJbO/t8/Kug9RC9NtNFt1d6	4c009d47-251c-4179-a9b8-218e55e5db91	2021-03-20 18:41:41.613671+00	2021-03-20 18:41:41.881645+00	t	t	\N	\N	t	f	f	\N	2021-03-20 18:41:41.881645	\N	\N
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
add-users-to-default-permissions-groups	2021-03-20 16:30:23.114811
add-admin-group-root-entry	2021-03-20 16:30:23.144658
add-databases-to-magic-permissions-groups	2021-03-20 16:30:23.149993
migrate-field-types	2021-03-20 16:30:23.286937
fix-invalid-field-types	2021-03-20 16:30:23.298365
copy-site-url-setting-and-remove-trailing-slashes	2021-03-20 16:30:23.325162
ensure-protocol-specified-in-site-url	2021-03-20 16:30:23.469497
populate-card-database-id	2021-03-20 16:30:23.540027
migrate-humanization-setting	2021-03-20 16:30:23.549003
mark-category-fields-as-list	2021-03-20 16:30:23.560445
add-legacy-sql-directive-to-bigquery-sql-cards	2021-03-20 16:30:23.564916
clear-ldap-user-local-passwords	2021-03-20 16:30:23.570073
add-migrated-collections	2021-03-20 16:30:23.590627
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
4	cammsaul	migrations/000_migrations.yaml	2021-03-20 16:30:20.825848	3	EXECUTED	8:a8e7822a91ea122212d376f5c2d4158f	createTable tableName=setting		\N	3.6.3	\N	\N	6257820403
14	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.92113	13	EXECUTED	8:320d2ca8ead3f31309674b2b7f54f395	createTable tableName=view_log; createIndex indexName=idx_view_log_user_id, tableName=view_log; createIndex indexName=idx_view_log_timestamp, tableName=view_log		\N	3.6.3	\N	\N	6257820403
35	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.295344	34	EXECUTED	8:91b72167fca724e6b6a94b64f886cf09	modifyDataType columnName=value, tableName=setting		\N	3.6.3	\N	\N	6257820403
53	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.601426	52	EXECUTED	8:78d015c5090c57cd6972eb435601d3d0	createTable tableName=query		\N	3.6.3	\N	\N	6257820403
124	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.147167	120	MARK_RAN	8:ce2322ca187dfac51be8f12f6a132818	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
16	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.928965	15	EXECUTED	8:ecc7f02641a589e6d35f88587ac6e02b	dropNotNullConstraint columnName=last_login, tableName=core_user		\N	3.6.3	\N	\N	6257820403
17	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.934463	16	EXECUTED	8:051c23cd15359364b9895c1569c319e7	addColumn tableName=metabase_database; sql		\N	3.6.3	\N	\N	6257820403
32	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.257305	31	EXECUTED	8:40830260b92cedad8da273afd5eca678	createTable tableName=label; createIndex indexName=idx_label_slug, tableName=label; createTable tableName=card_label; addUniqueConstraint constraintName=unique_card_label_card_id_label_id, tableName=card_label; createIndex indexName=idx_card_label...		\N	3.6.3	\N	\N	6257820403
32	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.287379	32	EXECUTED	8:483c6c6c8e0a8d056f7b9112d0b0125c	createTable tableName=raw_table; createIndex indexName=idx_rawtable_database_id, tableName=raw_table; addUniqueConstraint constraintName=uniq_raw_table_db_schema_name, tableName=raw_table; createTable tableName=raw_column; createIndex indexName=id...		\N	3.6.3	\N	\N	6257820403
36	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.304442	35	EXECUTED	8:252e08892449dceb16c3d91337bd9573	addColumn tableName=report_dashboard; addNotNullConstraint columnName=parameters, tableName=report_dashboard; addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=parameter_mappings, tableName=report_dashboardcard		\N	3.6.3	\N	\N	6257820403
37	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:21.314375	36	EXECUTED	8:07d959eff81777e5690e2920583cfe5f	addColumn tableName=query_queryexecution; addNotNullConstraint columnName=query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_queryexecution_query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_querye...		\N	3.6.3	\N	\N	6257820403
2	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.814633	2	EXECUTED	8:bdcf1238e2ccb4fbe66d7f9e1d9b9529	createTable tableName=core_session		\N	3.6.3	\N	\N	6257820403
38	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.348851	37	EXECUTED	8:43604ab55179b50306eb39353e760b46	addColumn tableName=metabase_database; addColumn tableName=metabase_table; addColumn tableName=metabase_field; addColumn tableName=report_dashboard; addColumn tableName=metric; addColumn tableName=segment; addColumn tableName=metabase_database; ad...		\N	3.6.3	\N	\N	6257820403
39	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.353359	38	EXECUTED	8:334adc22af5ded71ff27759b7a556951	addColumn tableName=core_user		\N	3.6.3	\N	\N	6257820403
40	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.403446	39	EXECUTED	8:ee7f50a264d6cf8d891bd01241eebd2c	createTable tableName=permissions_group; createIndex indexName=idx_permissions_group_name, tableName=permissions_group; createTable tableName=permissions_group_membership; addUniqueConstraint constraintName=unique_permissions_group_membership_user...		\N	3.6.3	\N	\N	6257820403
41	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.411123	40	EXECUTED	8:fae0855adf2f702f1133e32fc98d02a5	dropColumn columnName=field_type, tableName=metabase_field; addDefaultValue columnName=active, tableName=metabase_field; addDefaultValue columnName=preview_display, tableName=metabase_field; addDefaultValue columnName=position, tableName=metabase_...		\N	3.6.3	\N	\N	6257820403
42	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.445757	41	EXECUTED	8:e32b3a1624fa289a6ee1f3f0a2dac1f6	dropForeignKeyConstraint baseTableName=query_queryexecution, constraintName=fk_queryexecution_ref_query_id; dropColumn columnName=query_id, tableName=query_queryexecution; dropColumn columnName=is_staff, tableName=core_user; dropColumn columnName=...		\N	3.6.3	\N	\N	6257820403
43	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.4597	42	EXECUTED	8:165e9384e46d6f9c0330784955363f70	createTable tableName=permissions_revision		\N	3.6.3	\N	\N	6257820403
44	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.465525	43	EXECUTED	8:2e356e8a1049286f1c78324828ee7867	dropColumn columnName=public_perms, tableName=report_card; dropColumn columnName=public_perms, tableName=report_dashboard; dropColumn columnName=public_perms, tableName=pulse		\N	3.6.3	\N	\N	6257820403
45	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:21.491957	44	EXECUTED	8:421edd38ee0cb0983162f57193f81b0b	addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=visualization_settings, tableName=report_dashboardcard		\N	3.6.3	\N	\N	6257820403
46	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.501899	45	EXECUTED	8:131df3cdd9a8c67b32c5988a3fb7fe3d	addNotNullConstraint columnName=row, tableName=report_dashboardcard; addNotNullConstraint columnName=col, tableName=report_dashboardcard; addDefaultValue columnName=row, tableName=report_dashboardcard; addDefaultValue columnName=col, tableName=rep...		\N	3.6.3	\N	\N	6257820403
115	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.124848	111	MARK_RAN	8:55c10c2ff7e967e3ea1fdffc5aeed93a	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
47	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.52354	46	EXECUTED	8:1d2474e49a27db344c250872df58a6ed	createTable tableName=collection; createIndex indexName=idx_collection_slug, tableName=collection; addColumn tableName=report_card; createIndex indexName=idx_card_collection_id, tableName=report_card		\N	3.6.3	\N	\N	6257820403
48	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.534962	47	EXECUTED	8:720ce9d4b9e6f0917aea035e9dc5d95d	createTable tableName=collection_revision		\N	3.6.3	\N	\N	6257820403
49	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.555052	48	EXECUTED	8:56dcab086b21de1df002561efeac8bb6	addColumn tableName=report_card; createIndex indexName=idx_card_public_uuid, tableName=report_card; addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_public_uuid, tableName=report_dashboard; dropNotNullConstraint columnName...		\N	3.6.3	\N	\N	6257820403
50	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.562203	49	EXECUTED	8:388da4c48984aad647709514e4ba9204	addColumn tableName=report_card; addColumn tableName=report_dashboard		\N	3.6.3	\N	\N	6257820403
51	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.580235	50	EXECUTED	8:43c90b5b9f6c14bfd0e41cc0b184617e	createTable tableName=query_execution; createIndex indexName=idx_query_execution_started_at, tableName=query_execution; createIndex indexName=idx_query_execution_query_hash_started_at, tableName=query_execution		\N	3.6.3	\N	\N	6257820403
52	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.59259	51	EXECUTED	8:5af9ea2a96cd6e75a8ac1e6afde7126b	createTable tableName=query_cache; createIndex indexName=idx_query_cache_updated_at, tableName=query_cache; addColumn tableName=report_card		\N	3.6.3	\N	\N	6257820403
54	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:21.60555	53	EXECUTED	8:e410005b585f5eeb5f202076ff9468f7	addColumn tableName=pulse		\N	3.6.3	\N	\N	6257820403
22	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.154225	21	EXECUTED	8:80bc8a62a90791a79adedcf1ac3c6f08	addColumn tableName=revision		\N	3.6.3	\N	\N	6257820403
26	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.202888	25	EXECUTED	8:ddef40b95c55cf4ac0e6a5161911a4cb	addColumn tableName=metabase_database; sql		\N	3.6.3	\N	\N	6257820403
55	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.624068	54	EXECUTED	8:87c4becde5fe208ba2c356128df86fba	addColumn tableName=report_dashboard; createTable tableName=dashboard_favorite; addUniqueConstraint constraintName=unique_dashboard_favorite_user_id_dashboard_id, tableName=dashboard_favorite; createIndex indexName=idx_dashboard_favorite_user_id, ...		\N	3.6.3	\N	\N	6257820403
56	wwwiiilll	migrations/000_migrations.yaml	2021-03-20 16:30:21.628122	55	EXECUTED	8:9f46051abaee599e2838733512a32ad0	addColumn tableName=core_user	Added 0.25.0	\N	3.6.3	\N	\N	6257820403
58	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.649145	57	EXECUTED	8:3554219ca39e0fd682d0fba57531e917	createTable tableName=dimension; addUniqueConstraint constraintName=unique_dimension_field_id_name, tableName=dimension; createIndex indexName=idx_dimension_field_id, tableName=dimension	Added 0.25.0	\N	3.6.3	\N	\N	6257820403
59	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.656486	58	EXECUTED	8:5b6ce52371e0e9eee88e6d766225a94b	addColumn tableName=metabase_field	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
60	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.66464	59	EXECUTED	8:4f997b2cd3309882e900493892381f38	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
61	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.670649	60	EXECUTED	8:7dded6fd5bf74d79b9a0b62511981272	addColumn tableName=metabase_field	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
62	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.674515	61	EXECUTED	8:cb32e6eaa1a2140703def2730f81fef2	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
63	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.681775	62	EXECUTED	8:226f73b9f6617495892d281b0f8303db	addColumn tableName=metabase_database	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
64	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.685877	63	EXECUTED	8:4dcc8ffd836b56756f494d5dfce07b50	dropForeignKeyConstraint baseTableName=raw_table, constraintName=fk_rawtable_ref_database	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
66	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.689187	64	EXECUTED	8:e77d66af8e3b83d46c5a0064a75a1aac	sql; sql	Added 0.26.0	\N	3.6.3	\N	\N	6257820403
67	attekei	migrations/000_migrations.yaml	2021-03-20 16:30:21.705444	65	EXECUTED	8:59dfc37744fc362e0e312488fbc9a69b	createTable tableName=computation_job; createTable tableName=computation_job_result	Added 0.27.0	\N	3.6.3	\N	\N	6257820403
68	sbelak	migrations/000_migrations.yaml	2021-03-20 16:30:21.708956	66	EXECUTED	8:ca201aeb20c1719a46c6bcc3fc95c81d	addColumn tableName=computation_job	Added 0.27.0	\N	3.6.3	\N	\N	6257820403
69	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.716645	67	EXECUTED	8:97b7768436b9e8d695bae984020d754c	addColumn tableName=pulse; dropNotNullConstraint columnName=name, tableName=pulse	Added 0.27.0	\N	3.6.3	\N	\N	6257820403
70	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.72149	68	EXECUTED	8:4e4eff7abb983b1127a32ba8107e7fb8	addColumn tableName=metabase_field; addNotNullConstraint columnName=database_type, tableName=metabase_field	Added 0.28.0	\N	3.6.3	\N	\N	6257820403
71	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.724447	69	EXECUTED	8:755e5c3dd8a55793f29b2c95cb79c211	dropNotNullConstraint columnName=card_id, tableName=report_dashboardcard	Added 0.28.0	\N	3.6.3	\N	\N	6257820403
72	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.728562	70	EXECUTED	8:ed16046dfa04c139f48e9068eb4faee4	addColumn tableName=pulse_card	Added 0.28.0	\N	3.6.3	\N	\N	6257820403
73	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.732291	71	EXECUTED	8:3c0f03d18ff78a0bcc9915e1d9c518d6	addColumn tableName=metabase_database	Added 0.29.0	\N	3.6.3	\N	\N	6257820403
74	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.73599	72	EXECUTED	8:16726d6560851325930c25caf3c8ab96	addColumn tableName=metabase_field	Added 0.29.0	\N	3.6.3	\N	\N	6257820403
75	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.73993	73	EXECUTED	8:6072cabfe8188872d8e3da9a675f88c1	addColumn tableName=report_card	Added 0.28.2	\N	3.6.3	\N	\N	6257820403
76	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.743578	74	EXECUTED	8:9b7190c9171ccca72617d508875c3c82	addColumn tableName=metabase_table	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
77	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.747467	75	EXECUTED	8:07f0a6cd8dbbd9b89be0bd7378f7bdc8	addColumn tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
78	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.764046	76	EXECUTED	8:1977d7278269cdd0dc4f941f9e82f548	createTable tableName=group_table_access_policy; createIndex indexName=idx_gtap_table_id_group_id, tableName=group_table_access_policy; addUniqueConstraint constraintName=unique_gtap_table_id_group_id, tableName=group_table_access_policy	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
79	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.807469	77	EXECUTED	8:3f31cb67f9cdf7754ca95cade22d87a2	addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_collection_id, tableName=report_dashboard; addColumn tableName=pulse; createIndex indexName=idx_pulse_collection_id, tableName=pulse	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
80	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.813795	78	EXECUTED	8:199d0ce28955117819ca15bcc29323e5	addColumn tableName=collection; createIndex indexName=idx_collection_location, tableName=collection		\N	3.6.3	\N	\N	6257820403
81	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.819312	79	EXECUTED	8:3a6dc22403660529194d004ca7f7ad39	addColumn tableName=report_dashboard; addColumn tableName=report_card; addColumn tableName=pulse	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
82	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.824037	80	EXECUTED	8:ac4b94df8c648f88cfff661284d6392d	addColumn tableName=core_user; sql	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
83	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.827791	81	EXECUTED	8:ccd897d737737c05248293c7d56efe96	dropNotNullConstraint columnName=card_id, tableName=group_table_access_policy	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
84	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.835921	82	EXECUTED	8:58afc10c3e283a8050ea471aac447a97	renameColumn newColumnName=archived, oldColumnName=is_active, tableName=metric; addDefaultValue columnName=archived, tableName=metric; renameColumn newColumnName=archived, oldColumnName=is_active, tableName=segment; addDefaultValue columnName=arch...	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
85	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.852718	83	EXECUTED	8:9b4c9878a5018452dd63eb6d7c17f415	addColumn tableName=collection; createIndex indexName=idx_collection_personal_owner_id, tableName=collection; addColumn tableName=collection; sql; addNotNullConstraint columnName=_slug, tableName=collection; dropColumn columnName=slug, tableName=c...	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
86	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.856542	84	EXECUTED	8:50c75bb29f479e0b3fb782d89f7d6717	sql	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
87	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.864161	85	EXECUTED	8:0eccf19a93cb0ba4017aafd1d308c097	dropTable tableName=raw_column; dropTable tableName=raw_table	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
88	senior	migrations/000_migrations.yaml	2021-03-20 16:30:21.869087	86	EXECUTED	8:04ff5a0738473938fc31d68c1d9952e1	addColumn tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
89	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.002235	87	EXECUTED	8:94d5c406e3ec44e2bc85abe96f6fd91c	createTable tableName=QRTZ_JOB_DETAILS; addPrimaryKey constraintName=PK_QRTZ_JOB_DETAILS, tableName=QRTZ_JOB_DETAILS; createTable tableName=QRTZ_TRIGGERS; addPrimaryKey constraintName=PK_QRTZ_TRIGGERS, tableName=QRTZ_TRIGGERS; addForeignKeyConstra...	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
90	senior	migrations/000_migrations.yaml	2021-03-20 16:30:22.01536	88	EXECUTED	8:8562a72a1190deadc5fa59a23a6396dc	addColumn tableName=core_user; sql; dropColumn columnName=saml_auth, tableName=core_user	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
91	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.020444	89	EXECUTED	8:9b8831e1e409f08e874c4ece043d0340	dropColumn columnName=raw_table_id, tableName=metabase_table; dropColumn columnName=raw_column_id, tableName=metabase_field	Added 0.30.0	\N	3.6.3	\N	\N	6257820403
92	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.02474	90	EXECUTED	8:1e5bc2d66778316ea640a561862c23b4	addColumn tableName=query_execution	Added 0.31.0	\N	3.6.3	\N	\N	6257820403
93	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.028995	91	EXECUTED	8:93b0d408a3970e30d7184ed1166b5476	addColumn tableName=query	Added 0.31.0	\N	3.6.3	\N	\N	6257820403
94	senior	migrations/000_migrations.yaml	2021-03-20 16:30:22.042891	92	EXECUTED	8:a2a1eedf1e8f8756856c9d49c7684bfe	createTable tableName=task_history; createIndex indexName=idx_task_history_end_time, tableName=task_history; createIndex indexName=idx_task_history_db_id, tableName=task_history	Added 0.31.0	\N	3.6.3	\N	\N	6257820403
95	senior	migrations/000_migrations.yaml	2021-03-20 16:30:22.049332	93	EXECUTED	8:9824808283004e803003b938399a4cf0	addUniqueConstraint constraintName=idx_databasechangelog_id_author_filename, tableName=DATABASECHANGELOG	Added 0.31.0	\N	3.6.3	\N	\N	6257820403
96	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.058814	94	EXECUTED	8:5cb2f36edcca9c6e14c5e109d6aeb68b	addColumn tableName=metabase_field	Added 0.31.0	\N	3.6.3	\N	\N	6257820403
97	senior	migrations/000_migrations.yaml	2021-03-20 16:30:22.061471	95	MARK_RAN	8:9169e238663c5d036bd83428d2fa8e4b	modifyDataType columnName=results, tableName=query_cache	Added 0.32.0	\N	3.6.3	\N	\N	6257820403
98	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.072796	96	EXECUTED	8:f036d20a4dc86fb60ffb64ea838ed6b9	addUniqueConstraint constraintName=idx_uniq_table_db_id_schema_name, tableName=metabase_table; sql	Added 0.32.0	\N	3.6.3	\N	\N	6257820403
99	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.081558	97	EXECUTED	8:274bb516dd95b76c954b26084eed1dfe	addUniqueConstraint constraintName=idx_uniq_field_table_id_parent_id_name, tableName=metabase_field; sql	Added 0.32.0	\N	3.6.3	\N	\N	6257820403
100	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.086523	98	EXECUTED	8:948014f13b6198b50e3b7a066fae2ae0	sql	Added 0.32.0	\N	3.6.3	\N	\N	6257820403
101	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.091728	99	EXECUTED	8:58eabb08a175fafe8985208545374675	createIndex indexName=idx_field_parent_id, tableName=metabase_field	Added 0.32.0	\N	3.6.3	\N	\N	6257820403
103	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.095686	100	EXECUTED	8:fda3670fd16a40fd9d0f89a003098d54	addColumn tableName=metabase_database	Added 0.32.10	\N	3.6.3	\N	\N	6257820403
104	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.101316	101	EXECUTED	8:21709f17e6d1b521d3d3b8cbb5445218	addColumn tableName=core_session	Added EE 1.1.6/CE 0.33.0	\N	3.6.3	\N	\N	6257820403
106	sb	migrations/000_migrations.yaml	2021-03-20 16:30:22.104831	102	EXECUTED	8:a3dd42bbe25c415ce21e4c180dc1c1d7	modifyDataType columnName=database_type, tableName=metabase_field	Added 0.33.5	\N	3.6.3	\N	\N	6257820403
107	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.106924	103	MARK_RAN	8:605c2b4d212315c83727aa3d914cf57f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
108	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.109139	104	MARK_RAN	8:d11419da9384fd27d7b1670707ac864c	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
109	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.111255	105	MARK_RAN	8:a5f4ea412eb1d5c1bc824046ad11692f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
110	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.113693	106	MARK_RAN	8:82343097044b9652f73f3d3a2ddd04fe	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
111	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.116147	107	MARK_RAN	8:528de1245ba3aa106871d3e5b3eee0ba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
112	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.11869	108	MARK_RAN	8:010a3931299429d1adfa91941c806ea4	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
113	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.120795	109	MARK_RAN	8:8f8e0836064bdea82487ecf64a129767	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
114	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.122768	110	MARK_RAN	8:7a0bcb25ece6d9a311d6c6be7ed89bb7	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
116	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.126893	112	MARK_RAN	8:dbf7c3a1d8b1eb77b7f5888126b13c2e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
117	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.129792	113	MARK_RAN	8:f2d7f9fb1b6713bc5362fe40bfe3f91f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
118	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.132099	114	MARK_RAN	8:17f4410e30a0c7e84a36517ebf4dab64	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
119	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.134457	115	MARK_RAN	8:195cf171ac1d5531e455baf44d9d6561	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
120	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.137023	116	MARK_RAN	8:61f53fac337020aec71868656a719bba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
121	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.13961	117	MARK_RAN	8:1baa145d2ffe1e18d097a63a95476c5f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
122	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.142148	118	MARK_RAN	8:929b3c551a8f631cdce2511612d82d62	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
123	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.144681	119	MARK_RAN	8:35e5baddf78df5829fe6889d216436e5	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
125	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.149582	121	MARK_RAN	8:dd948ac004ceb9d0a300a8e06806945f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
126	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.152151	122	MARK_RAN	8:3d34c0d4e5dbb32b432b83d5322e2aa3	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
127	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.154439	123	MARK_RAN	8:18314b269fe11898a433ca9048400975	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
128	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.15673	124	MARK_RAN	8:44acbe257817286d88b7892e79363b66	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
129	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.158919	125	MARK_RAN	8:f890168c47cc2113a8af77ed3875c4b3	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
130	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.16115	126	MARK_RAN	8:ecdcf1fd66b3477e5b6882c3286b2fd8	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
131	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.163776	127	MARK_RAN	8:453af2935194978c65b19eae445d85c9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
132	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.166168	128	MARK_RAN	8:d2c37bc80b42a15b65f148bcb1daa86e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
133	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.168661	129	MARK_RAN	8:5b9b539d146fbdb762577dc98e7f3430	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
134	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.171074	130	MARK_RAN	8:4d0f688a168db3e357a808263b6ad355	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
135	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.174192	131	MARK_RAN	8:2ca54b0828c6aca615fb42064f1ec728	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
136	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.176387	132	MARK_RAN	8:7115eebbcf664509b9fc0c39cb6f29e9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
137	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.178779	133	MARK_RAN	8:da754ac6e51313a32de6f6389b29e1ca	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
138	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.181036	134	MARK_RAN	8:bfb201761052189e96538f0de3ac76cf	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
139	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.183331	135	MARK_RAN	8:fdad4ec86aefb0cdf850b1929b618508	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
140	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.185777	136	MARK_RAN	8:a0cfe6468160bba8c9d602da736c41fb	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
141	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.188209	137	MARK_RAN	8:b6b7faa02cba069e1ed13e365f59cb6b	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
142	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.190567	138	MARK_RAN	8:0c291eb50cc0f1fef3d55cfe6b62bedb	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
143	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.192888	139	MARK_RAN	8:3d9a5cb41f77a33e834d0562fdddeab6	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
144	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.195291	140	MARK_RAN	8:1d5b7f79f97906105e90d330a17c4062	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
145	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.197767	141	MARK_RAN	8:b162dd48ef850ab4300e2d714eac504e	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
146	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.200239	142	MARK_RAN	8:8c0c1861582d15fe7859358f5d553c91	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
147	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.202589	143	MARK_RAN	8:5ccf590332ea0744414e40a990a43275	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
148	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.2051	144	MARK_RAN	8:12b42e87d40cd7b6399c1fb0c6704fa7	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
149	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.20756	145	MARK_RAN	8:dd45bfc4af5e05701a064a5f2a046d7f	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
150	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.20982	146	MARK_RAN	8:48beda94aeaa494f798c38a66b90fb2a	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
151	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.212364	147	MARK_RAN	8:bb752a7d09d437c7ac294d5ab2600079	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
152	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.214681	148	MARK_RAN	8:4bcbc472f2d6ae3a5e7eca425940e52b	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
153	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.217016	149	MARK_RAN	8:adce2cca96fe0531b00f9bed6bed8352	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
154	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.219422	150	MARK_RAN	8:7a1df4f7a679f47459ea1a1c0991cfba	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
155	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.222123	151	MARK_RAN	8:3c78b79c784e3a3ce09a77db1b1d0374	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
156	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.224492	152	MARK_RAN	8:51859ee6cca4aca9d141a3350eb5d6b1	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
157	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.226668	153	MARK_RAN	8:0197c46bf8536a75dbf7e9aee731f3b2	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
158	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.229013	154	MARK_RAN	8:2ebdd5a179ce2487b2e23b6be74a407c	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
159	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.23118	155	MARK_RAN	8:c62719dad239c51f045315273b56e2a9	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
160	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.233794	156	MARK_RAN	8:1441c71af662abb809cba3b3b360ce81	sql	Added 0.34.2	\N	3.6.3	\N	\N	6257820403
162	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.244029	157	EXECUTED	8:c37f015ad11d77d66e09925eed605cdf	dropTable tableName=query_queryexecution	Added 0.23.0 as a data migration; converted to Liquibase migration in 0.35.0	\N	3.6.3	\N	\N	6257820403
163	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.247771	158	EXECUTED	8:9ef66a82624d70738fc89807a2398ed1	dropColumn columnName=read_permissions, tableName=report_card	Added 0.35.0	\N	3.6.3	\N	\N	6257820403
164	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.25227	159	EXECUTED	8:f19470701bbb33f19f91b1199a915881	addColumn tableName=core_user	Added 0.35.0	\N	3.6.3	\N	\N	6257820403
165	sb	migrations/000_migrations.yaml	2021-03-20 16:30:22.259227	160	EXECUTED	8:8848644da9dd9e40924ae71ac4c7c370	addColumn tableName=metabase_field; addColumn tableName=metabase_table; sql	Added field_order to Table and database_position to Field	\N	3.6.3	\N	\N	6257820403
166	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.273593	161	EXECUTED	8:92dafa5c15c46e2af8380304449c7dfa	modifyDataType columnName=updated_at, tableName=metabase_fieldvalues; modifyDataType columnName=updated_at, tableName=query_cache	Added 0.36.0/1.35.4	\N	3.6.3	\N	\N	6257820403
167	walterl, camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.289188	162	EXECUTED	8:4c11dc8c5e829b5263c198fe7879f161	sql; createTable tableName=native_query_snippet; createIndex indexName=idx_snippet_name, tableName=native_query_snippet	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
168	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.302544	163	EXECUTED	8:6d40bfa472bccd2d54284aeb89e1ec3c	modifyDataType columnName=started_at, tableName=query_execution	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
169	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.306541	164	EXECUTED	8:2b97e6eaa7854e179abb9f3749f73b18	dropColumn columnName=rows, tableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
170	sb	migrations/000_migrations.yaml	2021-03-20 16:30:22.31061	165	EXECUTED	8:dbd6ee52b0f9195e449a6d744606b599	dropColumn columnName=fields_hash, tableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
171	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.319171	166	EXECUTED	8:0798080c0796e6ab3e791bff007118b8	addColumn tableName=native_query_snippet; createIndex indexName=idx_snippet_collection_id, tableName=native_query_snippet	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
172	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.322985	167	EXECUTED	8:212f4010b504e358853fd017032f844f	addColumn tableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
173	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.326858	168	EXECUTED	8:4d32b4b7be3f4801e51aeffa5dd47649	dropForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
174	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.331926	169	EXECUTED	8:66f31503ba532702e54ea531af668531	addForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
175	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.33592	170	EXECUTED	8:c3ceddfca8827d73474cd9a70ea01d1c	dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
176	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.341078	171	EXECUTED	8:89c918faa84b7f3f5fa291d4da74414c	addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
177	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.345408	172	EXECUTED	8:d45f2198befc83de1f1f963c750607af	dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
178	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.350342	173	EXECUTED	8:63d396999449da2d42b3d3e22f3454fa	addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id, referencedTableName=label	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
179	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.354689	174	EXECUTED	8:2a0a7956402ef074e5d54c73ac2d5405	dropForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
180	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.359296	175	EXECUTED	8:b02225e5940a2bcca3d550f24f80123e	addForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
181	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.36362	176	EXECUTED	8:16923f06b2bbb60c6ac78a0c4b7e4d4f	dropForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
182	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.368375	177	EXECUTED	8:d59d864c038c530a49056704c93f231d	addForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
183	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.37273	178	EXECUTED	8:c5ed9a4f44ee92af620a47c80e010a6b	dropForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
184	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.389445	179	EXECUTED	8:70317e2bdaac90b9ddc33b1b93ada479	addForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
185	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.399391	180	EXECUTED	8:12e7457ec2d2b1a99a3fadfc64d7b7f9	dropForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
186	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.417862	181	EXECUTED	8:526987d0f6b2f01d7bfc9e3179721be6	addForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id, referencedTableName=computation_job	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
188	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.450707	183	EXECUTED	8:4dc500830cd4c5715ca8b0956e37b3d5	addForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
189	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.464893	184	EXECUTED	8:e07396e0ee587dcf321d21cffa9eec29	dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
190	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.469766	185	EXECUTED	8:eded791094a16bf398896c790645c411	addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
191	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.473429	186	EXECUTED	8:bb5b9a3d64b2e44318e159e7f1fecde2	dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
192	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.478494	187	EXECUTED	8:7d96911036dec2fee64fe8ae57c131b3	addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id, referencedTableName=report_dashboardcard	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
193	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.4832	188	EXECUTED	8:db171179fe094db9fee7e2e7df60fa4e	dropForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
194	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.488713	189	EXECUTED	8:fccb724d7ae7606e2e7638de1791392a	addForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
195	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.493913	190	EXECUTED	8:1d720af9f917007024c91d40410bc91d	dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
196	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.500086	191	EXECUTED	8:c52f5dbf742feef12a3803bda92a425b	addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
197	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.50465	192	EXECUTED	8:9c1c950b709050abe91cea17fd5970cc	dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
198	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.510164	193	EXECUTED	8:e24198ff4825a41d17ceaebd71692103	addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
199	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.515693	194	EXECUTED	8:146efae3f2938538961835fe07433ee1	dropForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
200	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.520724	195	EXECUTED	8:f5e7e79cb81b8d2245663c482746c853	addForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
201	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.525451	196	EXECUTED	8:2d79321a27fde6cb3c4fabdb86dc60ec	dropForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
202	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.530521	197	EXECUTED	8:d0cefed061c4abbf2b0a0fd2a66817cb	addForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id, referencedTableName=metabase_database	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
203	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.53459	198	EXECUTED	8:28b4ec07bfbf4b86532fe9357effdb8b	dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
204	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.53963	199	EXECUTED	8:7195937fd2144533edfa2302ba2ae653	addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
205	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.543525	200	EXECUTED	8:4b2d5f1458641dd1b9dbc5f41600be8e	dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
206	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.548558	201	EXECUTED	8:959ef448c23aaf3acf5b69f297fe4b2f	addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
207	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.552527	202	EXECUTED	8:18135d674f2fe502313adb0475f5f139	dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
208	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.55744	203	EXECUTED	8:4c86c17a00a81dfdf35a181e3dd3b08f	addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id, referencedTableName=metabase_field	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
209	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.561495	204	EXECUTED	8:1b9c3544bf89093fc9e4f7f191fdc6df	dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
210	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.567544	205	EXECUTED	8:842d166cdf7b0a29c88efdaf95c9d0bf	addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id, referencedTableName=metric	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
211	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.571022	206	EXECUTED	8:91c64815a1aefb07dd124d493bfeeea9	dropForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
212	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.57544	207	EXECUTED	8:b25064ee26b71f61906a833bc22ebbc2	addForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
213	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.579237	208	EXECUTED	8:60a7d628e4f68ee4c85f5f298b1d9865	dropForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
214	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.583894	209	EXECUTED	8:1c3c480313967a2d9f324a094ba25f4d	addForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id, referencedTableName=permissions_group	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
215	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.587324	210	EXECUTED	8:5d2c67ccead52970e9d85beb7eda48b9	dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
216	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.595415	211	EXECUTED	8:35fcd5d48600e887188eb1b990e6cc35	addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id, referencedTableName=permissions_group	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
217	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.598896	212	EXECUTED	8:da7460a35a724109ae9b5096cd18666b	dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
218	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.603199	213	EXECUTED	8:dc04b7eb04cd870c53102cb37fd75a5f	addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
219	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.606927	214	EXECUTED	8:02c690f34fe8803e42441f5037d33017	dropForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
220	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.611616	215	EXECUTED	8:8b8447405d7b2b52358c9676d64b7651	addForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
221	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.61515	216	EXECUTED	8:54a4c0d8a4eda80dc81fb549a629d075	dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
222	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.619363	217	EXECUTED	8:c5f22e925be3a8fd0e4f47a491f599ee	addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
223	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.624676	218	EXECUTED	8:de743e384ff90a6a31a3caebe0abb775	dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
224	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.63172	219	EXECUTED	8:b8fdf9c14d7ea3131a0a6b1f1036f91a	addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
225	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.635509	220	EXECUTED	8:495a4e12cf75cac5ff54738772e6a998	dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
187	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.434271	182	EXECUTED	8:3fbb75c0c491dc6628583184202b8f39	dropForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
226	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.640396	221	EXECUTED	8:cf383d74bc407065c78c060203ba4560	addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
227	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.64444	222	EXECUTED	8:e23eaf74ab7edacfb34bd5caf05cf66f	dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
228	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.649233	223	EXECUTED	8:d458ddb160f61e93bb69738f262de2b4	addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id, referencedTableName=pulse	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
229	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.653388	224	EXECUTED	8:1cb939d172989cb1629e9a3da768596d	dropForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
230	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.658553	225	EXECUTED	8:62baea3334ac5f21feac84497f6bf643	addForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id, referencedTableName=pulse	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
231	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.662678	226	EXECUTED	8:d096a9ce70fc0b7dfbc67ee1be4c3e31	dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
232	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.673199	227	EXECUTED	8:be2457ae1e386c9d5ec5bfa4ae681fd6	addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id, referencedTableName=pulse_channel	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
233	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.677343	228	EXECUTED	8:d5c018882af16093de446e025e2599b7	dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
234	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.682207	229	EXECUTED	8:edb6ced6c353064c46fa00b54e187aef	addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
235	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.686948	230	EXECUTED	8:550c64e41e55233d52ac3ef24d664be1	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
236	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.692171	231	EXECUTED	8:04300b298b663fc2a2f3a324d1051c3c	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
237	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.696911	232	EXECUTED	8:227a9133cdff9f1b60d8af53688ab12e	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
238	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.702171	233	EXECUTED	8:7000766ddca2c914ac517611e7d86549	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
239	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.706747	234	EXECUTED	8:672f4972653f70464982008a7abea3e1	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
240	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.712449	235	EXECUTED	8:165b07c8ceb004097c83ee1b689164e4	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
241	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.717528	236	EXECUTED	8:b0a9e3d801e64e0a66c3190e458c01ae	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
242	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.723304	237	EXECUTED	8:bf10f944715f87c3ad0dd7472d84df62	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id, referencedTableName=metabase_database	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
243	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.727447	238	EXECUTED	8:cba5d2bfb36e13c60d82cc6cca659b61	dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
244	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.732054	239	EXECUTED	8:4d40104eaa47d01981644462ef56f369	addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
245	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.736201	240	EXECUTED	8:a8f9206dadfe23662d547035f71e3846	dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
253	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.772461	248	EXECUTED	8:bbf118edaa88a8ad486ec0d6965504b6	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
254	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.777944	249	EXECUTED	8:7fc35d78c63f41eb4dbd23cfd1505f0b	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
255	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.781961	250	EXECUTED	8:f6564a7516ace55104a3173eebf4c629	dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
18	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:20.943223	17	EXECUTED	8:62a0483dde183cfd18dd0a86e9354288	createTable tableName=data_migrations; createIndex indexName=idx_data_migrations_id, tableName=data_migrations		\N	3.6.3	\N	\N	6257820403
19	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:20.946862	18	EXECUTED	8:269b129dbfc39a6f9e0d3bc61c3c3b70	addColumn tableName=metabase_table		\N	3.6.3	\N	\N	6257820403
20	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.132428	19	EXECUTED	8:0afa34e8b528b83aa19b4142984f8095	createTable tableName=pulse; createIndex indexName=idx_pulse_creator_id, tableName=pulse; createTable tableName=pulse_card; createIndex indexName=idx_pulse_card_pulse_id, tableName=pulse_card; createIndex indexName=idx_pulse_card_card_id, tableNam...		\N	3.6.3	\N	\N	6257820403
21	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.148871	20	EXECUTED	8:fb2cd308b17ab81b502d057ecde4fc1b	createTable tableName=segment; createIndex indexName=idx_segment_creator_id, tableName=segment; createIndex indexName=idx_segment_table_id, tableName=segment		\N	3.6.3	\N	\N	6257820403
256	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.787037	251	EXECUTED	8:61db9be3b4dd7ed1e9d01a7254e87544	addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
257	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.790923	252	EXECUTED	8:c8b51dc7ba4da9f7995a0b0c17fadad2	dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
258	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.796006	253	EXECUTED	8:58974c6ad8aee63f09e6e48b1a78c267	addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id, referencedTableName=report_dashboard	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
259	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.801298	254	EXECUTED	8:be4a52feb3b12e655c0bbd34477749b0	dropForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
260	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.806739	255	EXECUTED	8:4b370f9c9073a6f8f585aab713c57f47	addForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
261	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.811364	256	EXECUTED	8:173fe552fdf72fdb4efbc01a6ac4f7ad	dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
262	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.816829	257	EXECUTED	8:50927b8b1d1809f32c11d2e649dbcb94	addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
263	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.82098	258	EXECUTED	8:0b10c8664506917cc50359e9634c121c	dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
264	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.825991	259	EXECUTED	8:b132aedf6fbdcc5d956a2d3a154cc035	addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id, referencedTableName=metabase_table	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
265	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.830031	260	EXECUTED	8:2e339ecb05463b3765f9bb266bd28297	dropForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
266	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.834812	261	EXECUTED	8:31506e118764f5e520f755f26c696bb8	addForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
1	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.783745	1	EXECUTED	8:7182ca8e82947c24fa827d31f78b19aa	createTable tableName=core_organization; createTable tableName=core_user; createTable tableName=core_userorgperm; addUniqueConstraint constraintName=idx_unique_user_id_organization_id, tableName=core_userorgperm; createIndex indexName=idx_userorgp...		\N	3.6.3	\N	\N	6257820403
5	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.829814	4	EXECUTED	8:4f8653d16f4b102b3dff647277b6b988	addColumn tableName=core_organization		\N	3.6.3	\N	\N	6257820403
251	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.763423	246	EXECUTED	8:c12aa099f293b1e3d71da5e3edb3c45a	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
252	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.768145	247	EXECUTED	8:26b16d4d0cf7a77c1d687f49b029f421	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
23	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.165648	22	EXECUTED	8:b6f054835db2b2688a1be1de3707f9a9	modifyDataType columnName=rows, tableName=metabase_table		\N	3.6.3	\N	\N	6257820403
24	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.182405	23	EXECUTED	8:60825b125b452747098b577310c142b1	createTable tableName=dependency; createIndex indexName=idx_dependency_model, tableName=dependency; createIndex indexName=idx_dependency_model_id, tableName=dependency; createIndex indexName=idx_dependency_dependent_on_model, tableName=dependency;...		\N	3.6.3	\N	\N	6257820403
25	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.198286	24	EXECUTED	8:61f25563911117df72f5621d78f10089	createTable tableName=metric; createIndex indexName=idx_metric_creator_id, tableName=metric; createIndex indexName=idx_metric_table_id, tableName=metric		\N	3.6.3	\N	\N	6257820403
27	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.215184	26	EXECUTED	8:001855139df2d5dac4eb954e5abe6486	createTable tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_dashboardcard_id, tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_card_id, tableName=dashboardcard_series		\N	3.6.3	\N	\N	6257820403
28	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.219209	27	EXECUTED	8:428e4eb05e4e29141735adf9ae141a0b	addColumn tableName=core_user		\N	3.6.3	\N	\N	6257820403
29	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.222609	28	EXECUTED	8:8b02731cc34add3722c926dfd7376ae0	addColumn tableName=pulse_channel		\N	3.6.3	\N	\N	6257820403
30	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.227571	29	EXECUTED	8:2c3a50cef177cb90d47a9973cd5934e5	addColumn tableName=metabase_field; addNotNullConstraint columnName=visibility_type, tableName=metabase_field		\N	3.6.3	\N	\N	6257820403
31	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:21.231333	30	EXECUTED	8:30a33a82bab0bcbb2ccb6738d48e1421	addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6257820403
57	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:21.631991	56	EXECUTED	8:aab81d477e2d19a9ab18c58b78c9af88	addColumn tableName=report_card	Added 0.25.0	\N	3.6.3	\N	\N	6257820403
34	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:21.291693	33	EXECUTED	8:52b082600b05bbbc46bfe837d1f37a82	addColumn tableName=pulse_channel		\N	3.6.3	\N	\N	6257820403
6	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.843158	5	EXECUTED	8:2d2f5d1756ecb81da7c09ccfb9b1565a	dropNotNullConstraint columnName=organization_id, tableName=metabase_database; dropForeignKeyConstraint baseTableName=metabase_database, constraintName=fk_database_ref_organization_id; dropNotNullConstraint columnName=organization_id, tableName=re...		\N	3.6.3	\N	\N	6257820403
7	cammsaul	migrations/000_migrations.yaml	2021-03-20 16:30:20.856137	6	EXECUTED	8:c57c69fd78d804beb77d261066521f7f	addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6257820403
8	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:20.861297	7	EXECUTED	8:960ec59bbcb4c9f3fa8362eca9af4075	addColumn tableName=metabase_table; addColumn tableName=metabase_field		\N	3.6.3	\N	\N	6257820403
9	tlrobinson	migrations/000_migrations.yaml	2021-03-20 16:30:20.865554	8	EXECUTED	8:d560283a190e3c60802eb04f5532a49d	addColumn tableName=metabase_table		\N	3.6.3	\N	\N	6257820403
10	cammsaul	migrations/000_migrations.yaml	2021-03-20 16:30:20.878597	9	EXECUTED	8:9f03a236be31f54e8e5c894fe5fc7f00	createTable tableName=revision; createIndex indexName=idx_revision_model_model_id, tableName=revision		\N	3.6.3	\N	\N	6257820403
11	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.882825	10	EXECUTED	8:ca6561cab1eedbcf4dcb6d6e22cd46c6	sql		\N	3.6.3	\N	\N	6257820403
12	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.891203	11	EXECUTED	8:bedbea570e5dfc694b4cf5a8f6a4f445	addColumn tableName=report_card		\N	3.6.3	\N	\N	6257820403
13	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.908531	12	EXECUTED	8:c2c65930bad8d3e9bab3bb6ae562fe0c	createTable tableName=activity; createIndex indexName=idx_activity_timestamp, tableName=activity; createIndex indexName=idx_activity_user_id, tableName=activity; createIndex indexName=idx_activity_custom_id, tableName=activity		\N	3.6.3	\N	\N	6257820403
15	agilliland	migrations/000_migrations.yaml	2021-03-20 16:30:20.925267	14	EXECUTED	8:505b91530103673a9be3382cd2db1070	addColumn tableName=revision		\N	3.6.3	\N	\N	6257820403
246	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.741138	241	EXECUTED	8:e5db34b9db22254f7445fd65ecf45356	addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id, referencedTableName=report_card	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
247	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.74514	242	EXECUTED	8:76de7337a12a5ef42dcbb9274bd2d70f	dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
248	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.749919	243	EXECUTED	8:0640fb00a090cbe5dc545afbe0d25811	addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id, referencedTableName=core_user	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
249	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.754356	244	EXECUTED	8:16ef5909a72ac4779427e432b3b3ce18	dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
250	camsaul	migrations/000_migrations.yaml	2021-03-20 16:30:22.759254	245	EXECUTED	8:2e80ebe19816b7bde99050638772cf99	addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id, referencedTableName=collection	Added 0.36.0	\N	3.6.3	\N	\N	6257820403
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
1	2021-03-20 16:30:23.890145+00	2021-03-20 18:39:30.00366+00	Sample Dataset	\N	{"db":"zip:/app/metabase.jar!/sample-dataset.db;USER=GUEST;PASSWORD=guest"}	h2	t	t	\N	\N	0 50 * * * ? *	0 50 0 * * ? *	UTC	f	\N	t
3	2021-03-20 18:41:41.613671+00	2021-03-20 18:41:42.04105+00	covid19	\N	{"host":"postgres-postgresql","port":5432,"dbname":"covid19_dev","user":"covid19_user","password":"covid19_password","ssl":false,"additional-options":null,"tunnel-enabled":false}	postgres	f	t	\N	\N	0 0 * * * ? *	0 0 0 * * ? *	UTC	f	\N	t
\.


--
-- Data for Name: metabase_field; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_field (id, created_at, updated_at, name, base_type, special_type, active, description, preview_display, "position", table_id, parent_id, display_name, visibility_type, fk_target_field_id, last_analyzed, points_of_interest, caveats, fingerprint, fingerprint_version, database_type, has_field_values, settings, database_position, custom_position) FROM stdin;
47	2021-03-20 18:41:42.257336+00	2021-03-20 18:41:42.257336+00	day	type/Date	type/PK	t	\N	t	0	9	\N	Day	normal	\N	\N	\N	\N	\N	0	date	\N	\N	0	0
50	2021-03-20 18:41:42.316427+00	2021-03-20 18:41:42.944363+00	created_at	type/Text	type/Category	t	\N	t	1	8	\N	Created At	normal	\N	2021-03-20 18:41:42.981223+00	\N	\N	{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":23.0}}}	4	varchar	auto-list	\N	1	0
49	2021-03-20 18:41:42.313803+00	2021-03-20 18:41:42.949706+00	id	type/Text	type/PK	t	\N	t	0	8	\N	ID	normal	\N	2021-03-20 18:41:42.981223+00	\N	\N	\N	4	varchar	\N	\N	0	0
5	2021-03-20 16:30:25.225874+00	2021-03-20 16:30:27.956309+00	PRODUCT_ID	type/Integer	type/FK	t	The product ID. This is an internal identifier for the product, NOT the SKU.	t	2	2	\N	Product ID	normal	30	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0}}	4	INTEGER	\N	\N	2	0
8	2021-03-20 16:30:25.232879+00	2021-03-20 16:30:27.96678+00	TAX	type/Float	\N	t	This is the amount of local and federal taxes that are collected on the purchase. Note that other governmental fees on some products are not included here, but instead are accounted for in the subtotal.	t	4	2	\N	Tax	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":797,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":2.273340386603857,"q3":5.337275338216307,"max":11.12,"sd":2.3206651358900316,"avg":3.8722100000000004}}}	4	DOUBLE	\N	\N	4	0
9	2021-03-20 16:30:25.235241+00	2021-03-20 16:30:25.235241+00	ID	type/BigInteger	type/PK	t	This is a unique ID for the product. It is also called the “Invoice number” or “Confirmation number” in customer facing emails and screens.	t	0	2	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
17	2021-03-20 16:30:25.339267+00	2021-03-20 16:30:30.724297+00	STATE	type/Text	type/State	t	The state or province of the account’s billing address	t	7	3	\N	State	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":49,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":2.0}}}	4	CHAR	auto-list	\N	7	0
22	2021-03-20 16:30:25.390073+00	2021-03-20 16:30:25.390073+00	ID	type/BigInteger	type/PK	t	A unique identifier given to each user.	t	0	3	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
30	2021-03-20 16:30:25.621138+00	2021-03-20 16:30:25.621138+00	ID	type/BigInteger	type/PK	t	The numerical product number. Only used internally. All external communication should use the title or EAN.	t	0	1	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
36	2021-03-20 16:30:25.693681+00	2021-03-20 16:30:25.693681+00	ID	type/BigInteger	type/PK	t	A unique internal identifier for the review. Should not be used externally.	t	0	4	\N	ID	normal	\N	\N	\N	\N	\N	0	BIGINT	\N	\N	0	0
48	2021-03-20 18:41:42.259486+00	2021-03-20 19:00:00.508534+00	updated_at	type/DateTime	\N	t	\N	t	3	9	\N	Updated At	normal	\N	2021-03-20 19:00:00.558617+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-03-20T18:42:59.558794Z","latest":"2021-03-20T18:45:30.443221Z"}}}	4	timestamp	\N	\N	3	0
46	2021-03-20 18:41:42.254886+00	2021-03-20 19:00:00.528313+00	created_at	type/DateTime	type/CreationTimestamp	t	\N	t	2	9	\N	Created At	normal	\N	2021-03-20 19:00:00.558617+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-03-20T18:42:59.558794Z","latest":"2021-03-20T18:45:30.443221Z"}}}	4	timestamp	\N	\N	2	0
45	2021-03-20 18:41:42.250751+00	2021-03-20 19:00:00.533632+00	payload	type/Text	type/SerializedJSON	t	\N	t	1	9	\N	Payload	normal	\N	2021-03-20 19:00:00.558617+00	\N	\N	{"global":{"distinct-count":444,"nil%":0.00449438202247191},"type":{"type/Text":{"percent-json":0.9955056179775281,"percent-url":0.0,"percent-email":0.0,"average-length":41.417977528089885}}}	4	jsonb	\N	\N	1	0
6	2021-03-20 16:30:25.228169+00	2021-03-20 16:30:27.963894+00	SUBTOTAL	type/Float	\N	t	The raw, pre-tax cost of the order. Note that this might be different in the future from the product price due to promotions, credits, etc.	t	3	2	\N	Subtotal	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":340,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":49.74894519060184,"q3":105.42965746993103,"max":148.22900526552291,"sd":32.53705013056317,"avg":77.01295465356547}}}	4	DOUBLE	\N	\N	3	0
3	2021-03-20 16:30:25.221357+00	2021-03-20 16:30:28.00079+00	USER_ID	type/Integer	type/FK	t	The id of the user who made this order. Note that in some cases where an order was created on behalf of a customer who phoned the order in, this might be the employee who handled the request.	t	1	2	\N	User ID	normal	22	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":929,"nil%":0.0}}	4	INTEGER	\N	\N	1	0
4	2021-03-20 16:30:25.223497+00	2021-03-20 16:30:30.672694+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date and time an order was submitted.	t	7	2	\N	Created At	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":9998,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-30T18:56:13.352Z","latest":"2020-04-19T14:07:15.657Z"}}}	4	TIMESTAMP	\N	\N	7	0
29	2021-03-20 16:30:25.618549+00	2021-03-20 16:30:30.74019+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date the product was added to our catalog.	t	7	1	\N	Created At	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-26T19:29:55.147Z","latest":"2019-04-15T13:34:19.931Z"}}}	4	TIMESTAMP	\N	\N	7	0
24	2021-03-20 16:30:25.567839+00	2021-03-20 16:30:30.25785+00	EAN	type/Text	\N	t	The international article number. A 13 digit number uniquely identifying the product.	t	1	1	\N	Ean	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":13.0}}}	4	CHAR	\N	\N	1	0
23	2021-03-20 16:30:25.52439+00	2021-03-20 16:30:30.260334+00	PRICE	type/Float	\N	t	The list price of the product. Note that this is not always the price the product sold for due to discounts, promotions, etc.	t	5	1	\N	Price	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":170,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":37.25154462926434,"q3":75.45898071609447,"max":98.81933684368194,"sd":21.711481557852057,"avg":55.74639966792074}}}	4	DOUBLE	\N	\N	5	0
32	2021-03-20 16:30:25.678407+00	2021-03-20 16:30:30.612047+00	BODY	type/Text	type/Description	t	The review the user left. Limited to 2000 characters.	t	4	4	\N	Body	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":177.41996402877697}}}	4	CLOB	\N	\N	4	0
52	2021-03-20 19:00:00.182901+00	2021-03-20 19:00:00.41382+00	cases	type/Integer	\N	t	\N	t	1	10	\N	Cases	normal	\N	2021-03-20 19:00:00.558617+00	\N	\N	{"global":{"distinct-count":376,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":478.5387465890867,"q3":12969.465360340368,"max":61757.0,"sd":12152.777087524772,"avg":8257.231460674157}}}	4	int4	\N	\N	1	0
51	2021-03-20 19:00:00.180325+00	2021-03-20 19:00:00.416749+00	day	type/Date	\N	t	\N	t	0	10	\N	Day	normal	\N	2021-03-20 19:00:00.558617+00	\N	\N	{"global":{"distinct-count":445,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2020-01-01","latest":"2021-03-20"}}}	4	date	\N	\N	0	0
7	2021-03-20 16:30:25.230475+00	2021-03-20 16:30:27.971458+00	TOTAL	type/Float	\N	t	The total billed amount.	t	5	2	\N	Total	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":10000,"nil%":0.0},"type":{"type/Number":{"min":12.061602936923117,"q1":52.006147617878135,"q3":109.55803018499738,"max":238.32732001721533,"sd":38.35967664847571,"avg":82.96014815230805}}}	4	DOUBLE	\N	\N	5	0
2	2021-03-20 16:30:25.219195+00	2021-03-20 16:30:30.684096+00	QUANTITY	type/Integer	type/Quantity	t	Number of products bought.	t	8	2	\N	Quantity	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":62,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":1.755882607764982,"q3":4.882654507928044,"max":100.0,"sd":4.214258386403798,"avg":3.7015}}}	4	INTEGER	auto-list	\N	8	0
1	2021-03-20 16:30:25.216189+00	2021-03-20 16:30:30.676884+00	DISCOUNT	type/Float	type/Discount	t	Discount amount.	t	6	2	\N	Discount	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":701,"nil%":0.898},"type":{"type/Number":{"min":0.17088996672584322,"q1":2.9786226681458743,"q3":7.338187788658235,"max":61.69684269960571,"sd":3.053663125001991,"avg":5.161255547580326}}}	4	DOUBLE	\N	\N	6	0
13	2021-03-20 16:30:25.330653+00	2021-03-20 16:30:30.123706+00	ADDRESS	type/Text	\N	t	The street address of the account’s billing address	t	1	3	\N	Address	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2490,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":20.85}}}	4	VARCHAR	\N	\N	1	0
15	2021-03-20 16:30:25.334899+00	2021-03-20 16:30:30.704563+00	EMAIL	type/Text	type/Email	t	The contact email for the account.	t	2	3	\N	Email	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":1.0,"average-length":24.1824}}}	4	VARCHAR	\N	\N	2	0
11	2021-03-20 16:30:25.325667+00	2021-03-20 16:30:30.144292+00	PASSWORD	type/Text	\N	t	This is the salted password of the user. It should not be visible	t	3	3	\N	Password	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":36.0}}}	4	VARCHAR	\N	\N	3	0
14	2021-03-20 16:30:25.332745+00	2021-03-20 16:30:30.716054+00	NAME	type/Text	type/Name	t	The name of the user who owns an account	t	4	3	\N	Name	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2499,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":13.532}}}	4	VARCHAR	\N	\N	4	0
21	2021-03-20 16:30:25.386605+00	2021-03-20 16:30:30.697026+00	CITY	type/Text	type/City	t	The city of the account’s billing address	t	5	3	\N	City	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":1966,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":8.284}}}	4	VARCHAR	\N	\N	5	0
12	2021-03-20 16:30:25.328154+00	2021-03-20 16:30:30.711791+00	LONGITUDE	type/Float	type/Longitude	t	This is the longitude of the user on sign-up. It might be updated in the future to the last seen location.	t	6	3	\N	Longitude	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":-166.5425726,"q1":-101.58350792373135,"q3":-84.65289348288829,"max":-67.96735199999999,"sd":15.399698968175663,"avg":-95.18741780363999}}}	4	DOUBLE	\N	\N	6	0
18	2021-03-20 16:30:25.358723+00	2021-03-20 16:30:30.72041+00	SOURCE	type/Text	type/Source	t	The channel through which we acquired this user. Valid values include: Affiliate, Facebook, Google, Organic and Twitter	t	8	3	\N	Source	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":7.4084}}}	4	VARCHAR	auto-list	\N	8	0
16	2021-03-20 16:30:25.33714+00	2021-03-20 16:30:30.126647+00	BIRTH_DATE	type/Date	\N	t	The date of birth of the user	t	9	3	\N	Birth Date	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2308,"nil%":0.0},"type":{"type/DateTime":{"earliest":"1958-04-26","latest":"2000-04-03"}}}	4	DATE	\N	\N	9	0
19	2021-03-20 16:30:25.362773+00	2021-03-20 16:30:30.708197+00	LATITUDE	type/Float	type/Latitude	t	This is the latitude of the user on sign-up. It might be updated in the future to the last seen location.	t	11	3	\N	Latitude	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":25.775827,"q1":35.302705923023126,"q3":43.773802584662,"max":70.6355001,"sd":6.390832341883712,"avg":39.87934670484002}}}	4	DOUBLE	\N	\N	11	0
20	2021-03-20 16:30:25.366311+00	2021-03-20 16:30:30.155897+00	ZIP	type/Text	type/ZipCode	t	The postal code of the account’s billing address	t	10	3	\N	Zip	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2234,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":5.0}}}	4	CHAR	\N	\N	10	0
10	2021-03-20 16:30:25.322941+00	2021-03-20 16:30:30.700881+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The date the user record was created. Also referred to as the user’s "join date"	t	12	3	\N	Created At	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-19T21:35:18.752Z","latest":"2019-04-19T14:06:27.3Z"}}}	4	TIMESTAMP	\N	\N	12	0
28	2021-03-20 16:30:25.616431+00	2021-03-20 16:30:30.745022+00	RATING	type/Float	type/Score	t	The average rating users have given the product. This ranges from 1 - 5	t	6	1	\N	Rating	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":23,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":3.5120465053408525,"q3":4.216124969497314,"max":5.0,"sd":1.3605488657451452,"avg":3.4715}}}	4	DOUBLE	\N	\N	6	0
27	2021-03-20 16:30:25.614338+00	2021-03-20 16:30:30.758291+00	TITLE	type/Text	type/Title	t	The name of the product as it should be displayed to customers.	t	2	1	\N	Title	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":199,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":21.495}}}	4	VARCHAR	\N	\N	2	0
25	2021-03-20 16:30:25.586641+00	2021-03-20 16:30:30.761991+00	VENDOR	type/Text	type/Company	t	The source of the product.	t	4	1	\N	Vendor	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":20.6}}}	4	VARCHAR	\N	\N	4	0
34	2021-03-20 16:30:25.687247+00	2021-03-20 16:30:30.769088+00	CREATED_AT	type/DateTime	type/CreationTimestamp	t	The day and time a review was written by a user.	t	5	4	\N	Created At	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-06-03T00:37:05.818Z","latest":"2020-04-19T14:15:25.677Z"}}}	4	TIMESTAMP	\N	\N	5	0
33	2021-03-20 16:30:25.681635+00	2021-03-20 16:30:30.617075+00	PRODUCT_ID	type/Integer	type/FK	t	The product the review was for	t	1	4	\N	Product ID	normal	30	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":176,"nil%":0.0}}	4	INTEGER	\N	\N	1	0
35	2021-03-20 16:30:25.691343+00	2021-03-20 16:30:30.622031+00	REVIEWER	type/Text	\N	t	The user who left the review	t	2	4	\N	Reviewer	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":1076,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":9.972122302158274}}}	4	VARCHAR	\N	\N	2	0
26	2021-03-20 16:30:25.611823+00	2021-03-20 16:30:30.733349+00	CATEGORY	type/Text	type/Category	t	The type of product, valid values include: Doohicky, Gadget, Gizmo and Widget	t	3	1	\N	Category	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"average-length":6.375}}}	4	VARCHAR	auto-list	\N	3	0
31	2021-03-20 16:30:25.675568+00	2021-03-20 16:30:30.773191+00	RATING	type/Integer	type/Score	t	The rating (on a scale of 1-5) the user left.	t	3	4	\N	Rating	normal	\N	2021-03-20 16:30:30.818768+00	\N	\N	{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Number":{"min":1.0,"q1":3.54744353181696,"q3":4.764807071650455,"max":5.0,"sd":1.0443899855660577,"avg":3.987410071942446}}}	4	SMALLINT	auto-list	\N	3	0
\.


--
-- Data for Name: metabase_fieldvalues; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_fieldvalues (id, created_at, updated_at, "values", human_readable_values, field_id) FROM stdin;
1	2021-03-20 16:30:31.655383+00	2021-03-20 16:30:31.655383+00	[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,63,65,67,68,69,70,71,72,73,75,78,82,83,88,100]	\N	2
2	2021-03-20 16:30:31.718341+00	2021-03-20 16:30:31.718341+00	["Affiliate","Facebook","Google","Organic","Twitter"]	\N	18
3	2021-03-20 16:30:31.768578+00	2021-03-20 16:30:31.768578+00	["AK","AL","AR","AZ","CA","CO","CT","DE","FL","GA","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY"]	\N	17
4	2021-03-20 16:30:31.795126+00	2021-03-20 16:30:31.795126+00	["Doohickey","Gadget","Gizmo","Widget"]	\N	26
5	2021-03-20 16:30:31.831313+00	2021-03-20 16:30:31.831313+00	[1,2,3,4,5]	\N	31
7	2021-03-20 18:41:43.088187+00	2021-03-20 18:41:43.088187+00	["2021-03-20T18:09:52.653"]	\N	50
\.


--
-- Data for Name: metabase_table; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.metabase_table (id, created_at, updated_at, name, description, entity_name, entity_type, active, db_id, display_name, visibility_type, schema, points_of_interest, caveats, show_in_getting_started, field_order) FROM stdin;
2	2021-03-20 16:30:24.602079+00	2021-03-20 18:50:00.718687+00	ORDERS	This is a confirmed order for a product from a user.	\N	entity/TransactionTable	t	1	Orders	\N	PUBLIC	\N	\N	f	database
3	2021-03-20 16:30:24.628983+00	2021-03-20 18:50:00.786965+00	PEOPLE	This is a user account. Note that employees and customer support staff will have accounts.	\N	entity/UserTable	t	1	People	\N	PUBLIC	\N	\N	f	database
1	2021-03-20 16:30:24.581525+00	2021-03-20 18:50:00.841487+00	PRODUCTS	This is our product catalog. It includes all products ever sold by the Sample Company.	\N	entity/ProductTable	t	1	Products	\N	PUBLIC	\N	\N	f	database
4	2021-03-20 16:30:24.677965+00	2021-03-20 18:50:00.874287+00	REVIEWS	These are reviews our customers have left on products. Note that these are not tied to orders so it is possible people have reviewed products they did not purchase from us.	\N	entity/GenericTable	t	1	Reviews	\N	PUBLIC	\N	\N	f	database
9	2021-03-20 18:41:42.168838+00	2021-03-20 18:41:42.963572+00	covid_19_ingestion	\N	\N	entity/GenericTable	t	3	Cov ID 19 Ingestion	\N	public	\N	\N	f	database
8	2021-03-20 18:41:42.130806+00	2021-03-20 18:41:42.970118+00	ragtime_migrations	\N	\N	entity/GenericTable	t	3	Ragtime Migrations	\N	public	\N	\N	f	database
10	2021-03-20 19:00:00.136427+00	2021-03-20 19:00:00.541371+00	covid_19_cases_per_day	\N	\N	entity/GenericTable	t	3	Cov ID 19 Cases Per Day	\N	public	\N	\N	f	database
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
6	/db/3/	1
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
3	2	1
4	2	2
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
MetabaseScheduler	metabase.task.update-field-values.trigger.1	DEFAULT	0 50 0 * * ? *	UTC
MetabaseScheduler	metabase.task.upgrade-checks.trigger	DEFAULT	0 15 6,18 * * ? *	UTC
MetabaseScheduler	metabase.task.anonymous-stats.trigger	DEFAULT	0 15 7 * * ? *	UTC
MetabaseScheduler	metabase.task.abandonment-emails.trigger	DEFAULT	0 0 12 * * ? *	UTC
MetabaseScheduler	metabase.task.follow-up-emails.trigger	DEFAULT	0 0 12 * * ? *	UTC
MetabaseScheduler	metabase.task.update-field-values.trigger.3	DEFAULT	0 0 0 * * ? *	UTC
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.1	DEFAULT	0 50 * * * ? *	UTC
MetabaseScheduler	metabase.task.send-pulses.trigger	DEFAULT	0 0 * * * ? *	UTC
MetabaseScheduler	metabase.task.task-history-cleanup.trigger	DEFAULT	0 0 * * * ? *	UTC
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.3	DEFAULT	0 0 * * * ? *	UTC
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
MetabaseScheduler	metabase.task.upgrade-checks.job	DEFAULT	\N	metabase.task.upgrade_checks.CheckForNewVersions	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.anonymous-stats.job	DEFAULT	\N	metabase.task.send_anonymous_stats.SendAnonymousUsageStats	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.abandonment-emails.job	DEFAULT	\N	metabase.task.follow_up_emails.AbandonmentEmail	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.send-pulses.job	DEFAULT	\N	metabase.task.send_pulses.SendPulses	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.follow-up-emails.job	DEFAULT	\N	metabase.task.follow_up_emails.FollowUpEmail	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.task-history-cleanup.job	DEFAULT	\N	metabase.task.task_history_cleanup.TaskHistoryCleanup	f	f	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze for all databases	metabase.task.sync_databases.SyncAndAnalyzeDatabase	t	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
MetabaseScheduler	metabase.task.update-field-values.job	DEFAULT	update-field-values for all databases	metabase.task.sync_databases.UpdateFieldValues	t	t	f	f	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800
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
MetabaseScheduler	metabase-684c766d98-k4l221616265569591	1616267730309	7500
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
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.3	DEFAULT	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze Database 3	1616270400000	1616266800000	5	WAITING	CRON	1616265701000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000037800
MetabaseScheduler	metabase.task.send-pulses.trigger	DEFAULT	metabase.task.send-pulses.job	DEFAULT	\N	1616270400000	1616266800000	5	WAITING	CRON	1616265569000	0	\N	1	\\x
MetabaseScheduler	metabase.task.task-history-cleanup.trigger	DEFAULT	metabase.task.task-history-cleanup.job	DEFAULT	\N	1616270400000	1616266800000	5	WAITING	CRON	1616265569000	0	\N	0	\\x
MetabaseScheduler	metabase.task.sync-and-analyze.trigger.1	DEFAULT	metabase.task.sync-and-analyze.job	DEFAULT	sync-and-analyze Database 1	1616269800000	1616266200000	5	WAITING	CRON	1616265569000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800
MetabaseScheduler	metabase.task.update-field-values.trigger.1	DEFAULT	metabase.task.update-field-values.job	DEFAULT	update-field-values Database 1	1616287800000	-1	5	WAITING	CRON	1616265569000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800
MetabaseScheduler	metabase.task.upgrade-checks.trigger	DEFAULT	metabase.task.upgrade-checks.job	DEFAULT	\N	1616307300000	-1	5	WAITING	CRON	1616265569000	0	\N	0	\\x
MetabaseScheduler	metabase.task.anonymous-stats.trigger	DEFAULT	metabase.task.anonymous-stats.job	DEFAULT	\N	1616310900000	-1	5	WAITING	CRON	1616265569000	0	\N	0	\\x
MetabaseScheduler	metabase.task.abandonment-emails.trigger	DEFAULT	metabase.task.abandonment-emails.job	DEFAULT	\N	1616328000000	-1	5	WAITING	CRON	1616265569000	0	\N	0	\\x
MetabaseScheduler	metabase.task.follow-up-emails.trigger	DEFAULT	metabase.task.follow-up-emails.job	DEFAULT	\N	1616328000000	-1	5	WAITING	CRON	1616265569000	0	\N	0	\\x
MetabaseScheduler	metabase.task.update-field-values.trigger.3	DEFAULT	metabase.task.update-field-values.job	DEFAULT	update-field-values Database 3	1616284800000	-1	5	WAITING	CRON	1616265701000	0	\N	2	\\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000037800
\.


--
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.query (query_hash, average_execution_time, query) FROM stdin;
\\x88eb2cb40e20602fc92fc699c4382d37c370905c50b932167f6e6471929ed910	365	{"type":"native","native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":2,"middleware":{"add-default-userland-constraints?":true}}
\\xbcab772bded8062cae2820d06b0d70269b89051f719bff5296bf343b06d126f5	578	{"database":2,"query":{"source-table":6},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x103fe9e491bf5de3905337700fad9ae72e10c9f462e1b1b35534d4c9c2a57c5e	418	{"database":2,"query":{"source-table":7},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x120a46ddf8777087876693af6a58807c6998e59ffbb08a899c7c60a9a95fda4c	345	{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"native","middleware":null,"native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":2,"async?":true,"cache-ttl":null}
\\xb8b399332acd53f1a6bd854a253b00560e152d49553494d45dca037af2515b1a	54	{"database":3,"query":{"source-table":9},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x853a663ec8859e97a6f4e97c01aa167d507bc9cc17faffd18099b1f305392edb	1300	{"database":3,"query":{"source-table":10},"type":"query","middleware":{"add-default-userland-constraints?":true}}
\\x8fe3a4c0d9499d6dcdfb5d3d0878cd297933600d41f94c8fd3730e4473962d0e	984	{"type":"native","native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":3,"middleware":{"add-default-userland-constraints?":true}}
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
9	\\xb8b399332acd53f1a6bd854a253b00560e152d49553494d45dca037af2515b1a	2021-03-20 18:41:52.608257+00	54	0	f	ad-hoc	\N	2	\N	\N	\N	3
10	\\x853a663ec8859e97a6f4e97c01aa167d507bc9cc17faffd18099b1f305392edb	2021-03-20 19:11:36.63733+00	1300	445	f	ad-hoc	\N	2	\N	\N	\N	3
11	\\x8fe3a4c0d9499d6dcdfb5d3d0878cd297933600d41f94c8fd3730e4473962d0e	2021-03-20 19:11:54.632527+00	984	445	t	ad-hoc	\N	2	\N	\N	\N	3
\.


--
-- Data for Name: report_card; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.report_card (id, created_at, updated_at, name, description, display, dataset_query, visualization_settings, creator_id, database_id, table_id, query_type, archived, collection_id, public_uuid, made_public_by_id, enable_embedding, embedding_params, cache_ttl, result_metadata, collection_position) FROM stdin;
2	2021-03-20 19:12:07.206194+00	2021-03-20 19:12:07.206194+00	Covid19 Daily Cases in UK	\N	line	{"type":"native","native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":3}	{"graph.dimensions":["day"],"graph.metrics":["cases"]}	2	3	\N	native	f	\N	\N	\N	f	\N	\N	[{"base_type":"type/Date","display_name":"day","name":"day","special_type":null,"fingerprint":{"global":{"distinct-count":445,"nil%":0},"type":{"type/DateTime":{"earliest":"2020-01-01T00:00:00Z","latest":"2021-03-20T00:00:00Z"}}}},{"base_type":"type/Integer","display_name":"cases","name":"cases","special_type":null,"fingerprint":{"global":{"distinct-count":376,"nil%":0},"type":{"type/Number":{"min":0,"q1":478.5387465890867,"q3":12969.465360340368,"max":61757,"sd":12152.777087524772,"avg":8257.231460674157}}}}]	\N
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
1	Card	1	1	2021-03-20 09:51:03.655575+00	{"description":null,"archived":false,"collection_position":null,"table_id":null,"database_id":2,"enable_embedding":false,"collection_id":null,"query_type":"native","name":"Covid19 Daily Cases in UK","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"native","native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":2},"id":1,"display":"line","visualization_settings":{"graph.dimensions":["day"],"graph.metrics":["cases"]},"public_uuid":null}	f	t	\N
2	Card	2	2	2021-03-20 19:12:07.264754+00	{"description":null,"archived":false,"collection_position":null,"table_id":null,"database_id":3,"enable_embedding":false,"collection_id":null,"query_type":"native","name":"Covid19 Daily Cases in UK","creator_id":2,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"native","native":{"query":"select * from analytics.covid_19_cases_per_day","template-tags":{}},"database":3},"id":2,"display":"line","visualization_settings":{"graph.dimensions":["day"],"graph.metrics":["cases"]},"public_uuid":null}	f	t	\N
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
show-homepage-xrays	false
settings-last-updated	2021-03-20 19:12:23.093465+00
version-info	{"latest":{"version":"v0.38.2","released":"2021-03-17","patch":true,"highlights":["Data model not showing PostgreSQL tables when they are partitioned","Migrate old pre-1.37 \\"Custom Drill-through\\" settings to x.37+ \\"Click Behavior\\"","Regression with URL links"]},"older":[{"version":"v0.38.1","released":"2021-03-03","patch":true,"highlights":["Serialization `dump` of aggregated questions are not copied over on `load`","Serialization doesn't update Sub-Query variable reference","Oracle, BigQuery filtering by column with day-of-week bucketing not working","Pivot Table export not working on unsaved questions","Pivot Table does not work for users without data permissions","Pivot Table not working with Sandboxed user","BigQuery: Joins in the query builder generate invalid table aliases","BigQuery: Question Stays running until timeout when query is error in Native Query","Serialization: Archived items are included in `dump`","Breadcrumbs can be confusing (the current one \\"seems\\" clickable when it's not)","regexextract breaks query on sandboxed table","Multi-level aggregations fails when filter is the last section","Pivot queries aren't recorded to query execution log","Start of Week not applied to Field Filter in Native question, which can lead to incorrect results","In Safari 14, add-grouping button disappears randomly but consistently","Serialization does not initialize 3rd party drivers when loading a dump","Wrong day names are displayed when using not-Sunday as start of the week and grouping by \\"Day of week\\"","Difficult to see which cells has \\"Click behavior\\" vs normal behavior","Object Detail previous/next buttons not working correctly","Global number formatting does not apply to percentages","Native question filter widget reordering doesn't work"]},{"version":"v0.38.0.1","released":"2021-02-19","patch":false,"highlights":[]},{"version":"v0.38.0","released":"2021-02-16","patch":false,"highlights":["Sandboxed question with `case` Custom Field doesn't substitute the \\"else\\" argument's table","Custom Expression using `case()` function fails when referencing the same column names","Filtering a Custom Column does not give correct results when using \\"Not equal to\\"","Cannot remove columns via QB sidebar, then query fails, but works if being removed via Notebook","fix(rotate-encryption-key) settings-last-updated is not encrypted","For Pivot Tables, download popup doesn't show","Dashboard Subscriptions: Have to click the close button multiple times after viewing a Subscription","Advanced Sandboxing ignores Data Model features like Object Detail of FK","Publish \\"latest\\" OSS JAR","Custom GeoJSON files are not sorted in the dropdown","user@password JDBC connection strings for application DB no longer work","Shrunken bubbles shown in question for null values","Drilling down by a Region Map assigns the wrong value to the filter","Using \\"Reset to defaults\\" on textbox causes it to become a corrupted card on dashboard","Add a lightweight notify api endpoint","Sandboxing on tables with remapped FK (Display Values) causes query to fail","Allow usage of PKCS-12 certificates with Postgres connections","dump-to-h2 does not return a non-zero exit code on failure","Advanced Sandboxing using questions that return more/other columns than the sandboxed table is not possible anymore, but the errors are not helpful","Bar chart x-axis positions can cause different spacing depending on the dates returned","Custom Columns breaks Pivot Table","Pivot tables broken on dashboard after resize","dump-to-h2 with --dump-plaintext should check for presence of MB_ENCRYPTION_SECRET_KEY","Right alignment of pivot table value cells looks broken","Don't inform admins about MB cloud on EE instances","add cmd rotate-encryption-key","Token check retry is too aggressive","Login page should automatically focus on the email input field","Dashboard subscriptions including cards no longer in dashboard","UI should update when a collection changes parent"]},{"version":"v0.37.9","released":"2021-02-11","patch":true,"highlights":[]},{"version":"v0.37.8","released":"2021-01-29","patch":true,"highlights":["Cannot add (date) filter if calendar is collapsed"]},{"version":"v0.37.7","released":"2021-01-20","patch":true,"highlights":[]},{"version":"v0.37.6","released":"2021-01-13","patch":true,"highlights":[]},{"version":"v0.37.5","released":"2021-01-05","patch":true,"highlights":["Linked filters breaking SQL questions on v0.37.2","Embedding loading slow","Cannot toggle off 'Automatically run queries when doing simple filtering and summarizing' "]},{"version":"v0.37.4","released":"2020-12-17","patch":true,"highlights":["Error in Query: Input to aggregation-name does not match schema","Revert #13895","Exports always uses UTC as timezone instead of the selected Report Timezone","Between Dates filter behaves inconsistently based on whether the column is from a joined table or not"]},{"version":"v0.37.3","released":"2020-12-03","patch":true,"highlights":["Fix chain filtering with temporal string params like 'last32weeks'","Linked filters breaking SQL questions on v0.37.2","Running with timezone `Europe/Moscow` shows Pulse timezone as `MT` instead of `MSK` and sends pulses on incorrect time","Order fields to dump by ID","Remove object count from log output"]},{"version":"v0.37.2","released":"2020-11-16","patch":true,"highlights":["When visualization returns `null` (No results), then UI becomes broken"]},{"version":"v0.37.1","released":"2020-11-12","patch":true,"highlights":["Table schema sync performance impact","v0.37.0.2 doesn't sync Vertica schema","Pie chart shows spinner, when returned measure/value is `null` or `0`","Wrong day names are displayed when using not-Sunday as start of the week and grouping by \\"Day of week\\"","When result row is `null`, then frontend incorrectly shows as \\"No results!\\"","Snowflake tables with a GEOGRAPHY column cannot be explored","Cannot edit BigQuery settings without providing service account JSON again","Sync crashes with OOM on very large columns/row samples [proposal]","500 stack overflow error on collection/graph API call","Custom Column after aggregation creates wrong query and fails","The expression editor shouldn't start in error mode without any user input","Pulse attachment file sent without file extension","Metric with unnamed Custom Expression breaks Data Model for table","Nested queries with duplicate column names fail","pulse attachment file(question name) Korean support problem","Pulse Bar Chart Negative Values Formatting"]},{"version":"v0.37.0.2","released":"2020-10-26","patch":false,"highlights":[]},{"version":"v0.36.8.2","released":"2020-10-26","patch":true,"highlights":[]},{"version":"v0.37.0.1","released":"2020-10-23","patch":false,"highlights":[]},{"version":"v0.36.8.1","released":"2020-10-23","patch":true,"highlights":[]},{"version":"v0.37.0","released":"2020-10-22","patch":false,"highlights":["Fix null handling in filters regression","Add translation for Bulgarian","0.37.0-rc3: Click behavior to Dashboard shown on Public/Embedded","NO_COLOR/MB_COLORIZE_LOGS does not remove all ansi codes","0.37.0-rc3: Filtering a joined table column by \\"Is not\\" or \\"Does not contain\\" fails","Update translations for final 0.37 release","0.37.0-rc2: Monday week start displays incorrectly on bar chart","0.37.0-rc2: Linked filter showing all values (not filtering)","Only get substrings in fingerprinting when supported [ci drivers]","0.37.0-rc2: log4j should not output to file by default","0.37-RC2: we should suppress drag behavior when custom click behavior is set","0.37-RC2: disable Done button in cases where click behavior target isn't specified","0.37-RC2: weird edit state when saving a dashboard with incomplete click behavior","0.37-RC2: Interactivity summary tokens squashed on small dashboard cards","0.37.0-rc2: Hovering on custom map no longer displays region name, displays region identifier instead","0.37.0-rc1: \\"Click behavior\\" to URL for non-table card, doesn't show reference fields to use as variables","0.37.0-rc1: Variables from Saved Question are referencing the same question","0.37.0-rc2: Cannot create custom drill-through to dashboard","0.37-rc1: after clicking a custom link that passes a value to a param, clicking Back shouldn't bring that value to the original dashboard","0.37-rc1: When mapping dashboard filters to columns, SQL questions should display the name of the column mapped to the field filter","0.37-rc1: customizing a dashboard card's click behavior without specifying a destination causes strange behavior","0.37-rc1: canceling the dashboard archive action takes you to the collection","Embedded versions of new chain filters endpoints ","\\"Does not contain\\" and \\"Is not\\" filter also removes nulls","Docs - 37 release - new dashboard functionality","forward slash on table name causes ORA-01424 and blocks the sync step","Update login layout and illustration.","MySQL grouping on a TIME field is not working","Field Filter variables in SQL question don’t show table name when connecting filters in dashboard","Upgrade to log4j 2.x"]},{"version":"v0.36.8","released":"2020-10-22","patch":true,"highlights":[]},{"version":"v0.36.7","released":"2020-10-09","patch":true,"highlights":["Presto not respecting SSL and always uses http instead of https","Footer (with export/fullscreen/refresh buttons) on Public/Embedded questions disappears when using Premium Embedding","Postgres sync not respecting SSH tunneling"]},{"version":"v0.36.6","released":"2020-09-15T22:58:04.727Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.5.1","released":"2020-09-11T23:16:26.199Z","patch":true,"highlights":["Remappings should work on broken out fields"]},{"version":"v0.36.4","released":"2020-08-17T22:41:20.449Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.3","released":"2020-08-04T23:57:45.595Z","patch":true,"highlights":["Support for externally linked tables"]},{"version":"v0.36.2","released":"2020-07-31T17:46:34.479Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.1","released":"2020-07-30T18:10:44.459Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.0","released":"2020-07-21T19:56:40.066Z","patch":false,"highlights":["SQL/native query snippets","Language selection"]},{"version":"v0.35.4","released":"2020-05-29T17:31:58.191Z","patch":true,"highlights":["Security fix for BigQuery and SparkSQL","Turkish translation available again","More than 20 additional bug fixes and enhancements"]},{"version":"v0.35.3","released":"2020-04-21T21:18:24.959Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.35.2","released":"2020-04-10T23:03:53.756Z","patch":true,"highlights":["Fix email and premium embedding settings","Fix table permissions for database without a schema","Fix \\"Error reducing result rows\\" error"]},{"version":"v0.35.1","released":"2020-04-02T21:52:06.867Z","patch":true,"highlights":["Issue with date field filters after v0.35.0 upgrade","Unable to filter on manually JOINed table"]},{"version":"v0.35.0","released":"2020-03-25T18:29:17.286Z","patch":false,"highlights":["Filter expressions, string extracts, and more","Reference saved questions in your SQL queries","Performance improvements"]},{"version":"v0.34.3","released":"2020-02-25T20:47:03.897Z","patch":true,"highlights":["Line, area, bar, combo, and scatter charts now allow a maximum of 100 series instead of 20.","Chart labels now have more options to show significant decimal values.","Various bug fixes"]},{"version":"v0.34.2","released":"2020-02-05T22:02:15.277Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.34.1","released":"2020-01-14T00:02:42.489Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.34.0","released":"2019-12-20T01:21:39.568Z","patch":false,"highlights":["Added support for variables and field filters in native Mongo queries","Added option to display data values on Line, Bar, and Area charts","Many Timezone fixes"]},{"version":"v0.33.7.3","released":"2019-12-17T01:45:45.720Z","patch":true,"highlights":["Important security fix for Google Auth login"]},{"version":"v0.33.7","released":"2019-12-13T20:35:14.667Z","patch":true,"highlights":["Important security fix for Google Auth login"]},{"version":"v0.33.6","released":"2019-11-19T20:35:14.667Z","patch":true,"highlights":["Fixed regression that could cause saved questions to fail to render (#11297)","Fixed regression where No Results icon didn't show (#11282)","Pie chart visual improvements (#10837)"]},{"version":"v0.33.5","released":"2019-11-08T20:35:14.667Z","patch":true,"highlights":["Added Slovak translation","Fixed support for MySQL 8 with the default authentication method","Fixed issues with X-axis label formatting in timeseries charts"]},{"version":"v0.33.4","released":"2019-10-08T20:35:14.667Z","patch":true,"highlights":["Custom expression support for joined columns","Fixed issue with filtering by month-of-year in MongoDB","Misc Bug Fixes"]},{"version":"v0.33.3","released":"2019-09-20T08:09:36.358Z","patch":true,"highlights":["Chinese and Persian translations now available again","Misc Bug Fixes "]},{"version":"v0.33.2","released":"2019-09-04T08:09:36.358Z","patch":true,"highlights":["Fixed Cards not saving","Fixed searrch not working "]},{"version":"v0.33.1","released":"2019-09-04T08:09:36.358Z","patch":true,"highlights":["Fixed conditional formatting not working","Fixed an issue where some previously saved column settings were not applied ","Fixed an issue where pulses were not loading "]},{"version":"v0.33.0","released":"2019-08-19T08:09:36.358Z","patch":false,"highlights":["Notebook mode + Simple Query Mode","Joins","Post Aggregation filters"]},{"version":"v0.32.10","released":"2019-07-28T08:09:36.358Z","patch":true,"highlights":["Fix User can't logout / gets automatically logged in.","Fix No data displayed when pivoting data","Fixed Dashboard Filters on Linked Entities Broke"]},{"version":"v0.32.9","released":"2019-06-14T08:09:36.358Z","patch":true,"highlights":["Fix issues connecting to MongoDB Atlas Cluster","Fix database addition on setup","Fixed numeric category error with Postgres"]},{"version":"v0.32.8","released":"2019-05-13T08:09:36.358Z","patch":true,"highlights":["Fix i18n"]},{"version":"v0.32.7","released":"2019-05-09T08:09:36.358Z","patch":true,"highlights":["Fix published SHA Hash"]},{"version":"v0.32.6","released":"2019-05-08T12:09:36.358Z","patch":true,"highlights":["Fixed regression where Dashboards would fail to fully populate","Performance improvements when running queries","Security improvements"]},{"version":"v0.32.5","released":"2019-04-20T12:09:36.358Z","patch":true,"highlights":["Improve long-running query handling","Fix H2 to MySQL/Postgres migration issue","Fix issue with embedded maps with custom GeoJSON"]},{"version":"v0.32.4","released":"2019-04-09T12:09:36.358Z","patch":true,"highlights":["Fix issue where Google Auth login did not work","FFix issue where Google Auth login did not work"]},{"version":"v0.32.3","released":"2019-04-08T12:09:36.358Z","patch":true,"highlights":["Fixed Snowflake connection issues","Fixed Dashboard copy","Fixed non-root context logins"]},{"version":"v0.32.2","released":"2019-04-03T12:09:36.358Z","patch":true,"highlights":["Fixed dashboard date filters ","Fixed SSL error using Quartz w/ MySQL","Fix colors in dashboards"]},{"version":"v0.32.1","released":"2019-03-29T12:09:36.358Z","patch":true,"highlights":["Fixed MySQL connections with SSL","Fixed table sync issue"]},{"version":"v0.32.0","released":"2019-03-28T12:09:36.358Z","patch":false,"highlights":["Modular Drivers (reducing memory consumption)","Async queries (improving responsiveness)","Reduced memory consumption."]},{"version":"v0.31.2","released":"2018-12-07T12:09:36.358Z","patch":true,"highlights":["Added German translation","Fixed Heroku out-of-memory errors","Fixed issue with Slack-based Pulses due to rate limiting."]},{"version":"v0.31.1","released":"2018-11-21T12:09:36.358Z","patch":true,"highlights":["Ability to clone dashboards","Faster startup time and lower memory consumption","Migration issue fixes."]},{"version":"v0.31.0","released":"2018-11-08T12:09:36.358Z","patch":false,"highlights":["New visualizations and combo charts","Granular formatting controls","Snowflake Support"]},{"version":"v0.30.4","released":"2018-09-27T12:09:36.358Z","patch":true,"highlights":["Metabase fails to launch in Chinese","Fix token status checking","Fix BigQuery SQL parameters with encrypted DB details"]},{"version":"v0.30.3","released":"2018-09-13T12:09:36.358Z","patch":true,"highlights":["Localization for Chinese, Japanese, Turkish, Persian","Self referencing FK leads to exception","Security improvements"]},{"version":"v0.30.2","released":"2018-09-06T12:09:36.358Z","patch":true,"highlights":["Localization for French + Norwegian","Stability fixes for HTTP/2"]},{"version":"v0.30.1","released":"2018-08-08T12:09:36.358Z","patch":true,"highlights":["Localization for Portuguese","Timezone fix","SQL Template tag re-ordering fix"]},{"version":"v0.30.0","released":"2018-08-08T12:09:36.358Z","patch":false,"highlights":["App wide search","Enhanced Collection permissions","Comparison X-Rays"]},{"version":"v0.29.3","released":"2018-05-12T12:09:36.358Z","patch":true,"highlights":["Fix X-ray rules loading on Oracle JVM 8"]},{"version":"v0.29.2","released":"2018-05-10T12:09:36.358Z","patch":true,"highlights":["Fix Spark Driver"]},{"version":"v0.29.1","released":"2018-05-10T11:09:36.358Z","patch":true,"highlights":["Better heroku memory consumption","Fixed X-Ray Bugs","Drill through from line chart selects wrong date"]},{"version":"v0.29.0","released":"2018-05-01T11:09:36.358Z","patch":false,"highlights":["New and Improved X-Rays","Search field values","Spark SQL Support"]},{"version":"v0.28.6","released":"2018-04-12T11:09:36.358Z","patch":true,"highlights":["Fix chart rendering in pulses"]},{"version":"v0.28.5","released":"2018-04-04T11:09:36.358Z","patch":true,"highlights":["Fix memory consumption for SQL templates","Fix public dashboards parameter validation","Fix Unable to add cards to dashboards or search for cards, StackOverflowError on backend"]},{"version":"v0.28.4","released":"2018-03-29T11:09:36.358Z","patch":true,"highlights":["Fix broken embedded dashboards","Fix migration regression","Fix input typing bug"]},{"version":"v0.28.3","released":"2018-03-23T11:09:36.358Z","patch":true,"highlights":["Security improvements"]},{"version":"v0.28.2","released":"2018-03-20T11:09:36.358Z","patch":true,"highlights":["Security improvements","Sort on custom and saved metrics","Performance improvements for large numbers of questions and dashboards"]},{"version":"v0.28.1","released":"2018-02-09T11:09:36.358Z","patch":true,"highlights":["Fix admin panel update string","Fix pulse rendering bug","Fix CSV & XLS download bug"]},{"version":"v0.28.0","released":"2018-02-07T11:09:36.358Z","patch":false,"highlights":["Text Cards in Dashboards","Pulse + Alert attachments","Performance Improvements"]},{"version":"v0.27.2","released":"2017-12-12T11:09:36.358Z","patch":true,"highlights":["Migration bug fix"]},{"version":"v0.27.1","released":"2017-12-01T11:09:36.358Z","patch":true,"highlights":["Migration bug fix","Apply filters to embedded downloads"]},{"version":"v0.27.0","released":"2017-11-27T11:09:36.358Z","patch":false,"highlights":["Alerts","X-Ray insights","Charting improvements"]},{"version":"v0.26.2","released":"2017-09-27T11:09:36.358Z","patch":true,"highlights":["Update Redshift Driver","Support Java 9","Fix performance issue with fields listing"]},{"version":"v0.26.1","released":"2017-09-27T11:09:36.358Z","patch":true,"highlights":["Fix migration issue on MySQL"]},{"version":"v0.26.0","released":"2017-09-26T11:09:36.358Z","patch":true,"highlights":["Segment + Metric X-Rays and Comparisons","Better control over metadata introspection process","Improved Timezone support and bug fixes"]},{"version":"v0.25.2","released":"2017-08-09T11:09:36.358Z","patch":true,"highlights":["Bug and performance fixes"]},{"version":"v0.25.1","released":"2017-07-27T11:09:36.358Z","patch":true,"highlights":["After upgrading to 0.25, unknown protocol error.","Don't show saved questions in the permissions database lists","Elastic beanstalk upgrades broken in 0.25 "]},{"version":"v0.25.0","released":"2017-07-25T11:09:36.358Z","patch":false,"highlights":["Nested questions","Enum and custom remapping support","LDAP authentication support"]},{"version":"v0.24.2","released":"2017-06-01T11:09:36.358Z","patch":true,"highlights":["Misc Bug fixes"]},{"version":"v0.24.1","released":"2017-05-10T11:09:36.358Z","patch":true,"highlights":["Fix upgrades with MySQL/Mariadb"]},{"version":"v0.24.0","released":"2017-05-10T11:09:36.358Z","patch":false,"highlights":["Drill-through + Actions","Result Caching","Presto Driver"]},{"version":"v0.23.1","released":"2017-03-30T11:09:36.358Z","patch":true,"highlights":["Filter widgets for SQL Template Variables","Fix spurious startup error","Java 7 startup bug fixed"]},{"version":"v0.23.0","released":"2017-03-21T11:09:36.358Z","patch":false,"highlights":["Public links for cards + dashboards","Embedding cards + dashboards in other applications","Encryption of database credentials"]},{"version":"v0.22.2","released":"2017-01-10T11:09:36.358Z","patch":true,"highlights":["Fix startup on OpenJDK 7"]},{"version":"v0.22.1","released":"2017-01-10T11:09:36.358Z","patch":true,"highlights":["IMPORTANT: Closed a Collections Permissions security hole","Improved startup performance","Bug fixes"]},{"version":"v0.22.0","released":"2017-01-10T11:09:36.358Z","patch":false,"highlights":["Collections + Collections Permissions","Multiple Aggregations","Custom Expressions"]},{"version":"v0.21.1","released":"2016-12-08T11:09:36.358Z","patch":true,"highlights":["BigQuery bug fixes","Charting bug fixes"]},{"version":"v0.21.0","released":"2016-12-08T11:09:36.358Z","patch":false,"highlights":["Google Analytics Driver","Vertica Driver","Better Time + Date Filters"]},{"version":"v0.20.3","released":"2016-10-26T11:09:36.358Z","patch":true,"highlights":["Fix H2->MySQL/PostgreSQL migrations, part 2"]},{"version":"v0.20.2","released":"2016-10-25T11:09:36.358Z","patch":true,"highlights":["Support Oracle 10+11","Fix H2->MySQL/PostgreSQL migrations","Revision timestamp fix"]},{"version":"v0.20.1","released":"2016-10-18T11:09:36.358Z","patch":true,"highlights":["Lots of bug fixes"]},{"version":"v0.20.0","released":"2016-10-11T11:09:36.358Z","patch":false,"highlights":["Data access permissions","Oracle Driver","Charting improvements"]},{"version":"v0.19.3","released":"2016-08-12T11:09:36.358Z","patch":true,"highlights":["fix Dashboard editing header"]},{"version":"v0.19.2","released":"2016-08-10T11:09:36.358Z","patch":true,"highlights":["fix Dashboard chart titles","fix pin map saving"]},{"version":"v0.19.1","released":"2016-08-04T11:09:36.358Z","patch":true,"highlights":["fix Dashboard Filter Editing","fix CSV Download of SQL Templates","fix Metabot enabled toggle"]},{"version":"v0.19.0","released":"2016-08-01T21:09:36.358Z","patch":false,"highlights":["SSO via Google Accounts","SQL Templates","Better charting controls"]},{"version":"v0.18.1","released":"2016-06-29T21:09:36.358Z","patch":true,"highlights":["Fix for Hour of day sorting bug","Fix for Column ordering bug in BigQuery","Fix for Mongo charting bug"]},{"version":"v0.18.0","released":"2016-06-022T21:09:36.358Z","patch":false,"highlights":["Dashboard Filters","Crate.IO Support","Checklist for Metabase Admins","Converting Metabase Questions -> SQL"]},{"version":"v0.17.1","released":"2016-05-04T21:09:36.358Z","patch":true,"highlights":["Fix for Line chart ordering bug","Fix for Time granularity bugs"]},{"version":"v0.17.0","released":"2016-05-04T21:09:36.358Z","patch":false,"highlights":["Tags + Search for Saved Questions","Calculated columns","Faster Syncing of Metadata","Lots of database driver improvements and bug fixes"]},{"version":"v0.16.1","released":"2016-05-04T21:09:36.358Z","patch":true,"highlights":["Fixes for several time alignment issues (timezones)","Resolved problem with SQL Server db connections"]},{"version":"v0.16.0","released":"2016-05-04T21:09:36.358Z","patch":false,"highlights":["Fullscreen (and fabulous) Dashboards","Say hello to Metabot in Slack"]}]}
redirect-all-requests-to-https	false
site-url	http://localhost:8080
site-name	Covid19
admin-email	devuser@somemail.com
site-locale	en
anon-tracking-enabled	false
\.


--
-- Data for Name: task_history; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.task_history (id, task, db_id, started_at, ended_at, duration, task_details) FROM stdin;
1	sync	1	2021-03-20 16:30:23.985866	2021-03-20 16:30:26.180877	2195	\N
2	sync-timezone	1	2021-03-20 16:30:23.986737	2021-03-20 16:30:24.484292	497	{"timezone-id":"UTC"}
3	sync-tables	1	2021-03-20 16:30:24.484889	2021-03-20 16:30:24.885433	400	{"updated-tables":4,"total-tables":0}
4	sync-fields	1	2021-03-20 16:30:24.885715	2021-03-20 16:30:25.762418	876	{"total-fields":36,"updated-fields":36}
5	sync-fks	1	2021-03-20 16:30:25.762628	2021-03-20 16:30:25.898994	136	{"total-fks":3,"updated-fks":3,"total-failed":0}
6	sync-metabase-metadata	1	2021-03-20 16:30:25.899289	2021-03-20 16:30:26.180646	281	\N
7	analyze	1	2021-03-20 16:30:26.268331	2021-03-20 16:30:30.804219	4535	\N
8	fingerprint-fields	1	2021-03-20 16:30:26.268374	2021-03-20 16:30:30.654352	4385	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":32,"fingerprints-attempted":32}
9	classify-fields	1	2021-03-20 16:30:30.654495	2021-03-20 16:30:30.777251	122	{"fields-classified":32,"fields-failed":0}
10	classify-tables	1	2021-03-20 16:30:30.777381	2021-03-20 16:30:30.804153	26	{"total-tables":4,"tables-classified":4}
11	field values scanning	1	2021-03-20 16:30:30.82445	2021-03-20 16:30:31.835892	1011	\N
12	update-field-values	1	2021-03-20 16:30:30.824515	2021-03-20 16:30:31.835774	1011	{"errors":0,"created":5,"updated":0,"deleted":0}
57	task-history-cleanup	\N	2021-03-20 18:17:16.561	2021-03-20 18:17:16.59	29	\N
58	send-pulses	\N	2021-03-20 18:17:16.623	2021-03-20 18:17:16.704	81	\N
59	field values scanning	3	2021-03-20 18:41:42.985347	2021-03-20 18:41:43.099313	113	\N
60	update-field-values	3	2021-03-20 18:41:42.985383	2021-03-20 18:41:43.099221	113	{"errors":0,"created":1,"updated":0,"deleted":0}
61	sync	1	2021-03-20 18:50:00.022272	2021-03-20 18:50:00.897212	874	\N
62	sync-timezone	1	2021-03-20 18:50:00.022296	2021-03-20 18:50:00.439418	417	{"timezone-id":"UTC"}
63	sync-tables	1	2021-03-20 18:50:00.4395	2021-03-20 18:50:00.480744	41	{"updated-tables":0,"total-tables":4}
64	sync-fields	1	2021-03-20 18:50:00.48086	2021-03-20 18:50:00.686611	205	{"total-fields":36,"updated-fields":0}
65	sync-fks	1	2021-03-20 18:50:00.686814	2021-03-20 18:50:00.703707	16	{"total-fks":3,"updated-fks":0,"total-failed":0}
66	sync-metabase-metadata	1	2021-03-20 18:50:00.703771	2021-03-20 18:50:00.897164	193	\N
67	analyze	1	2021-03-20 18:50:00.912489	2021-03-20 18:50:00.941426	28	\N
68	fingerprint-fields	1	2021-03-20 18:50:00.912511	2021-03-20 18:50:00.929195	16	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":0,"fingerprints-attempted":0}
69	classify-fields	1	2021-03-20 18:50:00.929257	2021-03-20 18:50:00.936825	7	{"fields-classified":0,"fields-failed":0}
70	classify-tables	1	2021-03-20 18:50:00.936891	2021-03-20 18:50:00.94134	4	{"total-tables":4,"tables-classified":0}
71	task-history-cleanup	\N	2021-03-20 19:00:00.04	2021-03-20 19:00:00.045	5	\N
72	send-pulses	\N	2021-03-20 19:00:00.027	2021-03-20 19:00:00.049	22	\N
73	sync	3	2021-03-20 19:00:00.063609	2021-03-20 19:00:00.291783	228	\N
74	sync-timezone	3	2021-03-20 19:00:00.063633	2021-03-20 19:00:00.105312	41	{"timezone-id":"UTC"}
75	sync-tables	3	2021-03-20 19:00:00.106469	2021-03-20 19:00:00.1405	34	{"updated-tables":1,"total-tables":2}
76	sync-fields	3	2021-03-20 19:00:00.140591	2021-03-20 19:00:00.230287	89	{"total-fields":8,"updated-fields":2}
77	sync-fks	3	2021-03-20 19:00:00.230334	2021-03-20 19:00:00.280082	49	{"total-fks":0,"updated-fks":0,"total-failed":0}
78	sync-metabase-metadata	3	2021-03-20 19:00:00.280146	2021-03-20 19:00:00.291745	11	\N
79	analyze	3	2021-03-20 19:00:00.312088	2021-03-20 19:00:00.548338	236	\N
80	fingerprint-fields	3	2021-03-20 19:00:00.312109	2021-03-20 19:00:00.519437	207	{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":5,"fingerprints-attempted":5}
81	classify-fields	3	2021-03-20 19:00:00.519534	2021-03-20 19:00:00.537798	18	{"fields-classified":5,"fields-failed":0}
82	classify-tables	3	2021-03-20 19:00:00.537898	2021-03-20 19:00:00.548255	10	{"total-tables":3,"tables-classified":1}
\.


--
-- Data for Name: view_log; Type: TABLE DATA; Schema: public; Owner: metabase_user
--

COPY public.view_log (id, user_id, model, model_id, "timestamp") FROM stdin;
1	1	card	1	2021-03-20 09:51:03.64301+00
2	1	card	1	2021-03-20 09:52:21.151811+00
3	2	card	2	2021-03-20 19:12:07.258867+00
\.


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.activity_id_seq', 5, true);


--
-- Name: card_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.card_label_id_seq', 1, false);


--
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.collection_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.core_user_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.metabase_database_id_seq', 3, true);


--
-- Name: metabase_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_field_id_seq', 52, true);


--
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_fieldvalues_id_seq', 7, true);


--
-- Name: metabase_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.metabase_table_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.permissions_group_membership_id_seq', 4, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.permissions_id_seq', 6, true);


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

SELECT pg_catalog.setval('public.query_execution_id_seq', 11, true);


--
-- Name: report_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.report_card_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.revision_id_seq', 2, true);


--
-- Name: segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.segment_id_seq', 1, false);


--
-- Name: task_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.task_history_id_seq', 82, true);


--
-- Name: view_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: metabase_user
--

SELECT pg_catalog.setval('public.view_log_id_seq', 3, true);


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
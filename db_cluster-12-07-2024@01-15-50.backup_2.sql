--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE anon;
ALTER ROLE anon WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticated;
ALTER ROLE authenticated WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE authenticator;
ALTER ROLE authenticator WITH NOSUPERUSER NOINHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE dashboard_user;
ALTER ROLE dashboard_user WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB NOLOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE pgbouncer;
ALTER ROLE pgbouncer WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keyholder;
ALTER ROLE pgsodium_keyholder WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keyiduser;
ALTER ROLE pgsodium_keyiduser WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE pgsodium_keymaker;
ALTER ROLE pgsodium_keymaker WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE postgres;
ALTER ROLE postgres WITH NOSUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE service_role;
ALTER ROLE service_role WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB NOLOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_admin;
ALTER ROLE supabase_admin WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;
CREATE ROLE supabase_auth_admin;
ALTER ROLE supabase_auth_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;
CREATE ROLE supabase_read_only_user;
ALTER ROLE supabase_read_only_user WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION BYPASSRLS;
CREATE ROLE supabase_replication_admin;
ALTER ROLE supabase_replication_admin WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN REPLICATION NOBYPASSRLS;
CREATE ROLE supabase_storage_admin;
ALTER ROLE supabase_storage_admin WITH NOSUPERUSER NOINHERIT CREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS;

--
-- User Configurations
--

--
-- User Config "anon"
--

ALTER ROLE anon SET statement_timeout TO '3s';

--
-- User Config "authenticated"
--

ALTER ROLE authenticated SET statement_timeout TO '8s';

--
-- User Config "authenticator"
--

ALTER ROLE authenticator SET session_preload_libraries TO 'safeupdate';
ALTER ROLE authenticator SET statement_timeout TO '8s';
ALTER ROLE authenticator SET lock_timeout TO '8s';

--
-- User Config "postgres"
--

ALTER ROLE postgres SET search_path TO E'\\$user', 'public', 'extensions';

--
-- User Config "supabase_admin"
--

ALTER ROLE supabase_admin SET search_path TO '$user', 'public', 'auth', 'extensions';

--
-- User Config "supabase_auth_admin"
--

ALTER ROLE supabase_auth_admin SET search_path TO 'auth';
ALTER ROLE supabase_auth_admin SET idle_in_transaction_session_timeout TO '60000';

--
-- User Config "supabase_storage_admin"
--

ALTER ROLE supabase_storage_admin SET search_path TO 'storage';


--
-- Role memberships
--

GRANT anon TO authenticator GRANTED BY postgres;
GRANT anon TO postgres GRANTED BY supabase_admin;
GRANT authenticated TO authenticator GRANTED BY postgres;
GRANT authenticated TO postgres GRANTED BY supabase_admin;
GRANT authenticator TO supabase_storage_admin GRANTED BY supabase_admin;
GRANT pg_monitor TO postgres GRANTED BY supabase_admin;
GRANT pg_read_all_data TO postgres GRANTED BY supabase_admin;
GRANT pg_read_all_data TO supabase_read_only_user GRANTED BY postgres;
GRANT pg_signal_backend TO postgres GRANTED BY supabase_admin;
GRANT pgsodium_keyholder TO pgsodium_keymaker GRANTED BY supabase_admin;
GRANT pgsodium_keyholder TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT pgsodium_keyholder TO service_role GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO pgsodium_keyholder GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO pgsodium_keymaker GRANTED BY supabase_admin;
GRANT pgsodium_keyiduser TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT pgsodium_keymaker TO postgres WITH ADMIN OPTION GRANTED BY supabase_admin;
GRANT service_role TO authenticator GRANTED BY postgres;
GRANT service_role TO postgres GRANTED BY supabase_admin;
GRANT supabase_auth_admin TO postgres GRANTED BY supabase_admin;
GRANT supabase_storage_admin TO postgres GRANTED BY supabase_admin;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Debian 15.7-1.pgdg110+1)

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
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.7 (Debian 15.7-1.pgdg110+1)

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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: pgsodium; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA pgsodium;


ALTER SCHEMA pgsodium OWNER TO supabase_admin;

--
-- Name: pgsodium; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgsodium WITH SCHEMA pgsodium;


--
-- Name: EXTENSION pgsodium; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgsodium IS 'Pgsodium is a modern cryptography library for Postgres.';


--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgjwt; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgjwt WITH SCHEMA extensions;


--
-- Name: EXTENSION pgjwt; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgjwt IS 'JSON Web Token API for Postgresql';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: postgres
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

    ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
    ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

    REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
    REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

    GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO postgres;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: postgres
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: postgres
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    RAISE WARNING 'PgBouncer auth request: %', p_usename;

    RETURN QUERY
    SELECT usename::TEXT, passwd::TEXT FROM pg_catalog.pg_shadow
    WHERE usename = p_usename;
END;
$$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO postgres;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
_filename text;
BEGIN
    select string_to_array(name, '/') into _parts;
    select _parts[array_length(_parts,1)] into _filename;
    -- @todo return the last part instead of 2
    return split_part(_filename, '.', 2);
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
    select string_to_array(name, '/') into _parts;
    return _parts[1:array_length(_parts,1)-1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::int) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
  v_order_by text;
  v_sort_order text;
begin
  case
    when sortcolumn = 'name' then
      v_order_by = 'name';
    when sortcolumn = 'updated_at' then
      v_order_by = 'updated_at';
    when sortcolumn = 'created_at' then
      v_order_by = 'created_at';
    when sortcolumn = 'last_accessed_at' then
      v_order_by = 'last_accessed_at';
    else
      v_order_by = 'name';
  end case;

  case
    when sortorder = 'asc' then
      v_sort_order = 'asc';
    when sortorder = 'desc' then
      v_sort_order = 'desc';
    else
      v_sort_order = 'asc';
  end case;

  v_order_by = v_order_by || ' ' || v_sort_order;

  return query execute
    'with folders as (
       select path_tokens[$1] as folder
       from storage.objects
         where objects.name ilike $2 || $3 || ''%''
           and bucket_id = $4
           and array_length(objects.path_tokens, 1) <> $1
       group by folder
       order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

--
-- Name: secrets_encrypt_secret_secret(); Type: FUNCTION; Schema: vault; Owner: supabase_admin
--

CREATE FUNCTION vault.secrets_encrypt_secret_secret() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
		BEGIN
		        new.secret = CASE WHEN new.secret IS NULL THEN NULL ELSE
			CASE WHEN new.key_id IS NULL THEN NULL ELSE pg_catalog.encode(
			  pgsodium.crypto_aead_det_encrypt(
				pg_catalog.convert_to(new.secret, 'utf8'),
				pg_catalog.convert_to((new.id::text || new.description::text || new.created_at::text || new.updated_at::text)::text, 'utf8'),
				new.key_id::uuid,
				new.nonce
			  ),
				'base64') END END;
		RETURN new;
		END;
		$$;


ALTER FUNCTION vault.secrets_encrypt_secret_secret() OWNER TO supabase_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    id_user uuid,
    title text,
    description text,
    tech_name text,
    link text,
    image text
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.activity ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.activity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: certificate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certificate (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    short_description text,
    link text,
    image_path text,
    credential_id text,
    tech_name text,
    pdf_path text,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    is_favorite boolean DEFAULT false NOT NULL
);


ALTER TABLE public.certificate OWNER TO postgres;

--
-- Name: experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experience (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    company_name text,
    job_desc text,
    location text,
    "from" text,
    "to" text,
    image_path text[],
    id_user uuid,
    tech_name text
);


ALTER TABLE public.experience OWNER TO postgres;

--
-- Name: experience_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.experience ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.experience_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: portfolio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolio (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    title text,
    short_description text,
    link text,
    tech_name text,
    image_path text
);


ALTER TABLE public.portfolio OWNER TO postgres;

--
-- Name: portfolio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.portfolio ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.portfolio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: user_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_information (
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    name text DEFAULT 'NOT NULL'::text,
    about text,
    short_about text,
    birthday character varying,
    title_archivement text,
    organizer text,
    id_user uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE public.user_information OWNER TO postgres;

--
-- Name: COLUMN user_information.organizer; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.user_information.organizer IS 'organizer challenge';


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: decrypted_secrets; Type: VIEW; Schema: vault; Owner: supabase_admin
--

CREATE VIEW vault.decrypted_secrets AS
 SELECT secrets.id,
    secrets.name,
    secrets.description,
    secrets.secret,
        CASE
            WHEN (secrets.secret IS NULL) THEN NULL::text
            ELSE
            CASE
                WHEN (secrets.key_id IS NULL) THEN NULL::text
                ELSE convert_from(pgsodium.crypto_aead_det_decrypt(decode(secrets.secret, 'base64'::text), convert_to(((((secrets.id)::text || secrets.description) || (secrets.created_at)::text) || (secrets.updated_at)::text), 'utf8'::name), secrets.key_id, secrets.nonce), 'utf8'::name)
            END
        END AS decrypted_secret,
    secrets.key_id,
    secrets.nonce,
    secrets.created_at,
    secrets.updated_at
   FROM vault.secrets;


ALTER TABLE vault.decrypted_secrets OWNER TO supabase_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
00000000-0000-0000-0000-000000000000	a998600a-5970-4fe5-a0dd-621253dda5d3	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dhinorahmad0@gmail.com","user_id":"750ab6f4-e007-4618-8077-4a6ec001ddd6","user_phone":""}}	2023-11-17 23:09:07.225869+00	
00000000-0000-0000-0000-000000000000	626a5e72-ce70-4792-ad28-958fe14f9cba	{"action":"user_repeated_signup","actor_id":"750ab6f4-e007-4618-8077-4a6ec001ddd6","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-11-21 08:06:56.505378+00	
00000000-0000-0000-0000-000000000000	684d7861-771c-4aee-a40b-24e8425e8620	{"action":"user_repeated_signup","actor_id":"750ab6f4-e007-4618-8077-4a6ec001ddd6","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-11-21 08:07:50.176138+00	
00000000-0000-0000-0000-000000000000	46443cc7-a1eb-4c9e-9f9f-8adbec227465	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dhinorahmad0@gmail.com","user_id":"750ab6f4-e007-4618-8077-4a6ec001ddd6","user_phone":""}}	2023-11-21 08:09:09.374651+00	
00000000-0000-0000-0000-000000000000	c505daf3-78f0-412d-8d80-b43ca5d26f05	{"action":"user_signedup","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dhinorahmad0@gmail.com","user_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","user_phone":""}}	2023-11-21 08:09:22.329763+00	
00000000-0000-0000-0000-000000000000	20cfb238-10a2-4ec0-a07b-646fc68f8d7f	{"action":"user_repeated_signup","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-11-21 08:09:28.084309+00	
00000000-0000-0000-0000-000000000000	036447f1-aa81-4c9c-825b-a963833659fc	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:09:31.060016+00	
00000000-0000-0000-0000-000000000000	1d5ac112-4ba7-4194-91c1-717d310390cf	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:09:50.145652+00	
00000000-0000-0000-0000-000000000000	f4a9a027-3cff-4d02-9d45-efaf207ca82b	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:10:53.535283+00	
00000000-0000-0000-0000-000000000000	ef768287-da3e-4ae5-94d9-8ed63e8e51e9	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:14:27.022616+00	
00000000-0000-0000-0000-000000000000	226a78a9-487e-4f03-8f50-edd0eaa8e41c	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:40:49.367734+00	
00000000-0000-0000-0000-000000000000	d93877f0-4770-4954-a690-df1cc8efc759	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:40:53.58746+00	
00000000-0000-0000-0000-000000000000	16ac83b1-221d-492d-aa26-567a9b199b0f	{"action":"login","actor_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:41:43.978502+00	
00000000-0000-0000-0000-000000000000	fbd125ad-1e5f-439b-a996-83235b29a579	{"action":"user_deleted","actor_id":"00000000-0000-0000-0000-000000000000","actor_username":"service_role","actor_via_sso":false,"log_type":"team","traits":{"user_email":"dhinorahmad0@gmail.com","user_id":"eb92d98f-2ff9-4b9a-8991-500c16fe0acb","user_phone":""}}	2023-11-21 08:43:32.721458+00	
00000000-0000-0000-0000-000000000000	d6675a7a-da6e-4733-8ca0-6a7284d618b9	{"action":"user_confirmation_requested","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"user","traits":{"provider":"email"}}	2023-11-21 08:51:18.414988+00	
00000000-0000-0000-0000-000000000000	ff6eacd8-98ee-4c36-b0f7-6173abfcbb2b	{"action":"user_signedup","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"team"}	2023-11-21 08:51:31.184419+00	
00000000-0000-0000-0000-000000000000	d2e9d78b-5780-4979-881b-afff77a492e7	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:52:13.180716+00	
00000000-0000-0000-0000-000000000000	50b6f479-331f-47c2-98f3-f1eebe290a5b	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:52:32.725938+00	
00000000-0000-0000-0000-000000000000	916f1848-d9f1-4d88-9ee3-5be41f492c13	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:53:29.630257+00	
00000000-0000-0000-0000-000000000000	6295e7cc-4566-4f36-8818-0011928048eb	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:55:46.604614+00	
00000000-0000-0000-0000-000000000000	3490c931-ff8c-4da2-9cfc-c8b2d6b213d5	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-21 08:56:13.651665+00	
00000000-0000-0000-0000-000000000000	6bc89adb-03e0-4d7a-8cb1-8cc0ef7d766f	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:56:48.467114+00	
00000000-0000-0000-0000-000000000000	15ab6eee-d1c5-49af-b8d4-1bf1fcafcaab	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-21 08:57:27.404555+00	
00000000-0000-0000-0000-000000000000	4d5009ee-a154-4c5a-9fd8-d3503b3607a8	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:58:13.868683+00	
00000000-0000-0000-0000-000000000000	b0432555-cd21-47b0-b090-8ba6b0a014f5	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-21 08:58:23.300426+00	
00000000-0000-0000-0000-000000000000	f6e3acd7-a6a1-42c6-9dc1-f96290c078de	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-21 08:58:41.410978+00	
00000000-0000-0000-0000-000000000000	a301b64d-b6ae-44de-9b69-2ea7328cad90	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 10:25:10.624456+00	
00000000-0000-0000-0000-000000000000	c4ae0d8d-542d-4821-86c9-780232d85cf4	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 10:25:10.625068+00	
00000000-0000-0000-0000-000000000000	294b1a44-1709-437c-8ce5-aa5977e33901	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 12:08:08.894958+00	
00000000-0000-0000-0000-000000000000	842f0de5-1578-4ddc-abf9-83433fb34cf1	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 12:08:08.895538+00	
00000000-0000-0000-0000-000000000000	010f5820-337e-4ba7-80e5-f14d4ac68d3d	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 13:08:21.232609+00	
00000000-0000-0000-0000-000000000000	c9b090ab-cb28-4ef2-8863-25e82dc6162f	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 13:08:21.233195+00	
00000000-0000-0000-0000-000000000000	b126718b-9361-4be0-8873-b8ed1e350d27	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 14:06:25.751745+00	
00000000-0000-0000-0000-000000000000	4aa4f6f2-e9ea-4f53-ab66-f03224911bcc	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 14:06:25.753659+00	
00000000-0000-0000-0000-000000000000	5cdcaafb-b2b6-4c72-92a3-c0d8568cf17a	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 15:04:27.550974+00	
00000000-0000-0000-0000-000000000000	874b685e-46ae-4722-8f7c-f5caae6aeb0e	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 15:04:27.551587+00	
00000000-0000-0000-0000-000000000000	e6884f7c-4163-4206-a631-7872db1e4e0c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 16:02:33.225132+00	
00000000-0000-0000-0000-000000000000	2c34c65e-3514-446f-968a-76cc0bac6c49	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 16:02:33.225795+00	
00000000-0000-0000-0000-000000000000	4619d684-dd9f-4ea9-84e2-a6320f72da0d	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 17:15:06.144165+00	
00000000-0000-0000-0000-000000000000	ead947a4-6cfd-40b8-9421-2aded40a3dee	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-21 17:15:06.14484+00	
00000000-0000-0000-0000-000000000000	e11e067f-71c4-40e4-aa33-e2e27777aaf0	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 01:05:19.067355+00	
00000000-0000-0000-0000-000000000000	68050086-3002-44f1-a65d-660a53c02716	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 01:05:19.068023+00	
00000000-0000-0000-0000-000000000000	1762a88e-141f-4763-938b-920c3c0ac74a	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 02:06:08.888028+00	
00000000-0000-0000-0000-000000000000	e63864c8-1156-48ba-88ce-206e89521faa	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 02:06:08.888666+00	
00000000-0000-0000-0000-000000000000	ec60a363-ff7f-4650-a424-ad3942aa260f	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 03:04:25.325009+00	
00000000-0000-0000-0000-000000000000	7df702f6-a295-494f-9ade-09fe78de08d0	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 03:04:25.32571+00	
00000000-0000-0000-0000-000000000000	7e6cb4a0-f835-487c-bb2f-f7a2accbb72d	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 07:23:07.810254+00	
00000000-0000-0000-0000-000000000000	937a36ac-a7c7-4df2-a3f6-af42be990105	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 07:23:07.81085+00	
00000000-0000-0000-0000-000000000000	ec4589b4-01df-4627-8c87-63eb7f725fa7	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 08:41:02.179863+00	
00000000-0000-0000-0000-000000000000	99b999c5-d4df-4fe0-886f-df419a70a5fa	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 08:41:02.180563+00	
00000000-0000-0000-0000-000000000000	51df8283-a5df-413e-a2d6-9347698f7ad6	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 09:40:04.383703+00	
00000000-0000-0000-0000-000000000000	74574fa9-5296-491d-b60b-a00680e5f467	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 09:40:04.384314+00	
00000000-0000-0000-0000-000000000000	647ebea6-4a83-49ee-9a5f-2427d0725498	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 10:38:31.958385+00	
00000000-0000-0000-0000-000000000000	b4c64679-c6da-4d1d-a9a3-4a5805570a18	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 10:38:31.959118+00	
00000000-0000-0000-0000-000000000000	ccc8866a-fd87-4c03-9217-2c638da6479b	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 11:37:01.200333+00	
00000000-0000-0000-0000-000000000000	f9198d5a-3168-4d05-b0fb-9ccdff62bd2a	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 11:37:01.20097+00	
00000000-0000-0000-0000-000000000000	5b5ee9dd-ed0c-41d7-9b35-ef0048ca89f8	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 12:35:05.601816+00	
00000000-0000-0000-0000-000000000000	f6c45e22-4a46-43cc-9b8f-b3d60b65b45c	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 12:35:05.602947+00	
00000000-0000-0000-0000-000000000000	7de9d766-cbe8-4151-be65-2c788ef49afb	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 13:44:34.279661+00	
00000000-0000-0000-0000-000000000000	8f388a0f-bf66-4e1a-8996-4fb499591cb8	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 13:44:34.282011+00	
00000000-0000-0000-0000-000000000000	411369dc-0e63-46c2-abc8-d779d73e8dbc	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 14:42:55.735091+00	
00000000-0000-0000-0000-000000000000	8903473f-023f-4c2b-8351-6c8186aac4a0	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 14:42:55.735711+00	
00000000-0000-0000-0000-000000000000	2b0a42a5-0d64-48cc-a9be-a552bcab48ef	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 15:41:22.421548+00	
00000000-0000-0000-0000-000000000000	e16af026-72e1-4fe8-a5fb-3734a5ee9c55	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 15:41:22.422341+00	
00000000-0000-0000-0000-000000000000	2bff961c-fd36-4bd2-89f3-4dd9f853001b	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 16:45:15.617364+00	
00000000-0000-0000-0000-000000000000	98b315b9-e192-401a-ade5-2f4a289a1e92	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-22 16:45:15.617994+00	
00000000-0000-0000-0000-000000000000	d0264ce2-15fb-4a51-8f12-00e1fec05cc2	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 00:26:38.569479+00	
00000000-0000-0000-0000-000000000000	4a7b7287-cf96-4425-91d3-489295c2d884	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 00:26:38.570144+00	
00000000-0000-0000-0000-000000000000	4ea41b0f-b629-4427-bcf8-5b690ea532c0	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 02:00:37.099541+00	
00000000-0000-0000-0000-000000000000	4f22e290-50a3-481f-b323-8841eac69fb1	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 02:00:37.100225+00	
00000000-0000-0000-0000-000000000000	3b83c796-a844-4679-9696-4546ba4c6ad8	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 02:59:16.679512+00	
00000000-0000-0000-0000-000000000000	4b7efc18-894f-48fe-9ec1-1e593b0422ae	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 02:59:16.680084+00	
00000000-0000-0000-0000-000000000000	13f9d2b7-4303-466e-8093-a92d61b6cd4a	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 08:28:53.637516+00	
00000000-0000-0000-0000-000000000000	d161b0e2-ec19-453b-88eb-13eb43436000	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 08:28:53.638774+00	
00000000-0000-0000-0000-000000000000	6b6b2ca4-36eb-4238-9d1e-237df6011f9f	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 09:27:05.11686+00	
00000000-0000-0000-0000-000000000000	41b0c6e7-8d2e-4a24-8db0-5efdbbb229da	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 09:27:05.119232+00	
00000000-0000-0000-0000-000000000000	e0742b5d-350e-4b70-a0ba-49152fa59494	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 11:44:52.430387+00	
00000000-0000-0000-0000-000000000000	f961e9c2-d162-42ec-b147-c987fa270a4c	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-23 11:44:52.431682+00	
00000000-0000-0000-0000-000000000000	94ca97b5-a273-4a25-a4a5-894dbffe4cf2	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 11:59:20.910678+00	
00000000-0000-0000-0000-000000000000	e5182f9f-11dd-4c61-a88e-c22fd24acc81	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 12:06:28.835373+00	
00000000-0000-0000-0000-000000000000	7a50cdf5-6a53-4f60-a557-673b21a5c1d1	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 12:10:30.970956+00	
00000000-0000-0000-0000-000000000000	5359b1d2-bde8-4fc6-96fb-c6783da5fd20	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 12:11:08.310633+00	
00000000-0000-0000-0000-000000000000	04759909-32ea-4304-94df-3f992de33669	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-23 12:54:12.172159+00	
00000000-0000-0000-0000-000000000000	7ef51603-63eb-4ca3-82de-2028ca31e84c	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 12:56:37.136381+00	
00000000-0000-0000-0000-000000000000	57a71212-5a88-451c-a6dd-163b2023ef5f	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-23 12:57:53.049527+00	
00000000-0000-0000-0000-000000000000	d8b3d10b-0126-4378-b21b-e1e1aab2be47	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 12:58:00.38435+00	
00000000-0000-0000-0000-000000000000	feb6a69c-0804-4061-83ca-d90e925151fb	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-23 13:34:36.393435+00	
00000000-0000-0000-0000-000000000000	8d505382-4565-4529-bf65-e673547dd964	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-23 14:09:00.691532+00	
00000000-0000-0000-0000-000000000000	e5e30458-35dd-4c1a-bc65-2996b9a3168a	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-27 01:10:34.752923+00	
00000000-0000-0000-0000-000000000000	bb2aeee2-24bb-4381-ade4-d6cb0c5acbcf	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2023-11-27 02:01:58.863535+00	
00000000-0000-0000-0000-000000000000	e14687b5-e17b-406a-b90f-76f4bcb04690	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2023-11-27 02:02:07.571186+00	
00000000-0000-0000-0000-000000000000	23d1ed5e-cde7-4528-a08e-a6ab141b5d28	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 03:00:08.995769+00	
00000000-0000-0000-0000-000000000000	d5ff82f1-652b-4ed4-8768-c43d87b0b97e	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 03:00:08.998206+00	
00000000-0000-0000-0000-000000000000	dd86c2f8-795c-4104-bbff-7193fad441cf	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 03:58:19.162266+00	
00000000-0000-0000-0000-000000000000	1579eef2-56c6-4a3b-9d08-d673ade8ef87	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 03:58:19.16427+00	
00000000-0000-0000-0000-000000000000	d029fe55-3ea2-44e0-b94e-6963627f9a60	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 07:20:15.282686+00	
00000000-0000-0000-0000-000000000000	b196b4b5-71d0-4010-b041-7c8c7c24b4b1	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 07:20:15.283992+00	
00000000-0000-0000-0000-000000000000	71789c1d-74a9-4e5c-8b84-8a86e3b332a7	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 08:19:21.35975+00	
00000000-0000-0000-0000-000000000000	b029b791-af81-4534-9f74-f09922ebe360	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 08:19:21.360705+00	
00000000-0000-0000-0000-000000000000	dbe76a62-a6b5-46a8-8e0d-42a39879cd5f	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 09:18:28.876136+00	
00000000-0000-0000-0000-000000000000	760bf388-8960-4f19-a111-be0ad1eabaf2	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 09:18:28.876756+00	
00000000-0000-0000-0000-000000000000	b3fa2d93-ac7e-412a-bf28-a4e794c71111	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 10:16:33.713124+00	
00000000-0000-0000-0000-000000000000	a0a4d8a4-c90a-44d7-a384-d0a702639d24	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 10:16:33.714881+00	
00000000-0000-0000-0000-000000000000	de06e5eb-573e-4f08-8b38-718314de78c8	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 11:15:03.722656+00	
00000000-0000-0000-0000-000000000000	19865939-8328-4c2d-9043-12ad7df4486f	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 11:15:03.724175+00	
00000000-0000-0000-0000-000000000000	da3bb44a-6615-4bb3-a853-868f5142436c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 12:13:06.16656+00	
00000000-0000-0000-0000-000000000000	5069ba6a-41f0-4a07-85b0-3b15d7713001	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 12:13:06.168163+00	
00000000-0000-0000-0000-000000000000	6ef6e54f-6375-4180-b986-3924e4ab1183	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 13:13:18.658139+00	
00000000-0000-0000-0000-000000000000	1a581cbe-cc7c-4355-aae4-26f9821bb6fd	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 13:13:18.658783+00	
00000000-0000-0000-0000-000000000000	82584d1d-a56e-4317-a79b-b12b2dcaadfd	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 14:11:32.51032+00	
00000000-0000-0000-0000-000000000000	e37a3eb3-03be-4194-8d41-672813456889	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 14:11:32.511541+00	
00000000-0000-0000-0000-000000000000	f3590394-f6eb-400a-a58e-3ad60c2506e5	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 15:10:37.956537+00	
00000000-0000-0000-0000-000000000000	7ccdc8d1-f668-48ff-a10b-c16835d895fc	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-27 15:10:37.958474+00	
00000000-0000-0000-0000-000000000000	ad27efed-870f-4f1d-86bb-693241e9ab8b	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 00:51:52.350211+00	
00000000-0000-0000-0000-000000000000	91df58a8-ae79-4599-8a72-5fe395e9667d	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 00:51:52.351903+00	
00000000-0000-0000-0000-000000000000	a98d0881-b54f-46dc-bcf2-ccf3de4ce156	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 01:50:05.370214+00	
00000000-0000-0000-0000-000000000000	b31b76b0-741e-46cb-9fca-a0c10613e1e9	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 01:50:05.372461+00	
00000000-0000-0000-0000-000000000000	fb15796d-d226-4262-ae85-3ec833b3edd0	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 02:48:17.995148+00	
00000000-0000-0000-0000-000000000000	94655f11-623a-4ac9-a1fd-8fdf0fbe55e3	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 02:48:17.996706+00	
00000000-0000-0000-0000-000000000000	2a23f0f8-5e1f-4247-9775-572099ff22e2	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 06:41:10.352651+00	
00000000-0000-0000-0000-000000000000	85b31b87-1b4c-49a7-a3f2-65037aae0641	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 06:41:10.354112+00	
00000000-0000-0000-0000-000000000000	9521f95d-1b56-41e8-88cd-92c6d31c2534	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 07:39:44.18129+00	
00000000-0000-0000-0000-000000000000	c28f8b94-7f0a-4e38-ad1d-7830f621b513	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 07:39:44.183092+00	
00000000-0000-0000-0000-000000000000	965a1562-bb69-445d-bdc2-df9efb75fc83	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 08:37:52.170595+00	
00000000-0000-0000-0000-000000000000	cb784c94-6079-4885-a2f4-8fded8f609e5	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 08:37:52.172902+00	
00000000-0000-0000-0000-000000000000	393a6dc7-af5e-4e97-a859-71d003f9af8b	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 12:19:04.372245+00	
00000000-0000-0000-0000-000000000000	f6a830fd-ddd0-4e11-962f-387306a72106	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 12:19:04.374486+00	
00000000-0000-0000-0000-000000000000	67a586fb-7c82-42f2-88ec-dbe79ef57187	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 13:17:08.805422+00	
00000000-0000-0000-0000-000000000000	da08dbe5-5c27-416d-ab7f-86fa2ad1a4e8	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 13:17:08.807333+00	
00000000-0000-0000-0000-000000000000	737fb19b-16bb-441a-a00e-6017bd9c9ef4	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 14:15:14.424208+00	
00000000-0000-0000-0000-000000000000	cee673c8-24ad-4041-9707-fc9d0368fa2d	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 14:15:14.42543+00	
00000000-0000-0000-0000-000000000000	f2b0a931-582b-4547-9ad7-56e3bec80e05	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 15:39:50.418008+00	
00000000-0000-0000-0000-000000000000	3933cc38-1a2e-4da1-a2eb-97b959bd1a10	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-28 15:39:50.419562+00	
00000000-0000-0000-0000-000000000000	c771de1c-4382-4799-b748-bf43a63295ba	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 00:14:10.065032+00	
00000000-0000-0000-0000-000000000000	d35db926-21ba-4dcc-b444-61060b643194	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 00:14:10.067186+00	
00000000-0000-0000-0000-000000000000	dbebbcba-fae2-43f2-95e2-cae56bcb4854	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 01:43:58.614952+00	
00000000-0000-0000-0000-000000000000	3a6426cb-79f4-437b-8820-8d11a7cce680	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 01:43:58.616128+00	
00000000-0000-0000-0000-000000000000	a3097f18-16e6-4313-abc0-8f23461c3b0e	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 02:45:04.956592+00	
00000000-0000-0000-0000-000000000000	48eb9970-a5d6-4f28-a00e-5e36dd6f0897	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 02:45:04.959374+00	
00000000-0000-0000-0000-000000000000	94fc1adb-eaed-4457-aed0-c193d5c4b651	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 06:36:51.993754+00	
00000000-0000-0000-0000-000000000000	81d3a200-2046-4fac-ab23-0adf629ceed7	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-11-29 06:36:51.996362+00	
00000000-0000-0000-0000-000000000000	9d8f295f-71c6-4c3c-96c5-cdadd2ecaedf	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-12-09 14:31:54.461853+00	
00000000-0000-0000-0000-000000000000	279f0b8d-b74d-4622-80c6-50c140855927	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2023-12-09 14:31:54.468685+00	
00000000-0000-0000-0000-000000000000	580d2811-f901-4df1-b78c-19581d6db6b5	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-01 01:23:17.920603+00	
00000000-0000-0000-0000-000000000000	adea5709-79a9-4cb6-a411-ae55c62c2bff	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-01-02 15:52:42.049559+00	
00000000-0000-0000-0000-000000000000	7ade0b47-b07e-4d27-9498-581b4879759b	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-01-02 15:52:42.05208+00	
00000000-0000-0000-0000-000000000000	87b56fc3-e244-4a5b-ad1a-34697ba899fa	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-01-02 16:13:54.973317+00	
00000000-0000-0000-0000-000000000000	8b399cd4-1643-4706-9195-43401f8b0b67	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-02 16:14:55.118909+00	
00000000-0000-0000-0000-000000000000	ac881024-913c-4cb9-b445-0d4d5f627104	{"action":"logout","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account"}	2024-01-02 16:15:28.168237+00	
00000000-0000-0000-0000-000000000000	972ef045-d91d-4f5e-bf7d-ae7dce60c849	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-01-02 16:16:07.99921+00	
00000000-0000-0000-0000-000000000000	6434b1a3-9f25-418c-b252-2d296772ea3f	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-01-11 09:25:09.172971+00	
00000000-0000-0000-0000-000000000000	10560aad-2556-433c-90df-ba24b69d50ba	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-01-11 09:25:09.178663+00	
00000000-0000-0000-0000-000000000000	95eb01c6-4c44-4cac-8c1d-14ff26e7230b	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-06 02:21:03.37429+00	
00000000-0000-0000-0000-000000000000	e725a823-2bb1-4f98-a79f-7c69e8ed5773	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-06 02:21:03.378428+00	
00000000-0000-0000-0000-000000000000	9ce5bd9c-6540-4a56-ac38-4b831f5400f3	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-02-26 01:52:41.200032+00	
00000000-0000-0000-0000-000000000000	ea381cd1-f500-4ba5-b8b6-c8fb57d30b80	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 08:52:56.579647+00	
00000000-0000-0000-0000-000000000000	c728fc73-65d8-49f6-8418-140fa0a3609b	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 08:52:56.582415+00	
00000000-0000-0000-0000-000000000000	24890c05-fb68-461d-94c8-291a07d6c46c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 13:39:41.556735+00	
00000000-0000-0000-0000-000000000000	9c8bc67c-d26a-4a23-9003-e6053f7e75d7	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 13:39:41.55795+00	
00000000-0000-0000-0000-000000000000	c3e99309-cb7a-47dd-8a19-decfb956de38	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 22:41:02.817049+00	
00000000-0000-0000-0000-000000000000	af172ef6-435f-4f10-bb5d-233642cc0b34	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-26 22:41:02.818492+00	
00000000-0000-0000-0000-000000000000	a482d502-c069-473d-b594-3046ed6382ab	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-28 02:06:29.674656+00	
00000000-0000-0000-0000-000000000000	1abeb03b-0551-4393-8027-4c8f6d9f92d2	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-28 02:06:29.676191+00	
00000000-0000-0000-0000-000000000000	6d49b5fc-b9bd-45eb-8bfe-ac6394138e0c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-28 13:24:04.381828+00	
00000000-0000-0000-0000-000000000000	214f0d00-5a09-4ba3-a8ae-6cabee1a7645	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-02-28 13:24:04.383629+00	
00000000-0000-0000-0000-000000000000	5f25ab27-3608-4fb3-b608-66885e67fc8c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-01 03:13:39.214087+00	
00000000-0000-0000-0000-000000000000	937f502a-cf87-4811-835e-c0e1d3a9f53d	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-01 03:13:39.217728+00	
00000000-0000-0000-0000-000000000000	6d539953-6d45-4471-bb43-f95171fa104d	{"action":"login","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"account","traits":{"provider":"email"}}	2024-03-02 21:37:27.153656+00	
00000000-0000-0000-0000-000000000000	61b1220f-b7f7-4a0c-8ee6-aba71d8fc411	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-04 07:25:13.731868+00	
00000000-0000-0000-0000-000000000000	1f2dd9cf-887b-423c-b026-2fb104cdc1a0	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-04 07:25:13.73404+00	
00000000-0000-0000-0000-000000000000	cd061621-4db6-467d-9368-b5232dfbc96a	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-05 03:28:15.557128+00	
00000000-0000-0000-0000-000000000000	b59081e1-38fb-4591-8bd2-2bd3b2a192a1	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-05 03:28:15.567933+00	
00000000-0000-0000-0000-000000000000	a903573f-7031-4592-80b4-caf9d25b1cb5	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-12 22:55:13.222227+00	
00000000-0000-0000-0000-000000000000	f933ec5c-c72d-45be-b9d5-5a5ceac64b54	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-12 22:55:13.228775+00	
00000000-0000-0000-0000-000000000000	e7cc6f72-25ec-48b9-84d5-5655056b864c	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-27 19:24:57.118634+00	
00000000-0000-0000-0000-000000000000	d56dbc60-aa6a-4e63-8a7e-0c2837093c69	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-03-27 19:24:57.126322+00	
00000000-0000-0000-0000-000000000000	f6324489-43bc-43f4-b04f-44cde85c3de4	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-05 01:15:34.733243+00	
00000000-0000-0000-0000-000000000000	54a21c86-5800-465b-904c-450960faf5db	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-04-05 01:15:34.739346+00	
00000000-0000-0000-0000-000000000000	53084aa6-e79d-47d2-858c-f48c36e4f9ee	{"action":"token_refreshed","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-05 13:03:20.175972+00	
00000000-0000-0000-0000-000000000000	ad3a8203-f7bf-4a63-ab01-4827494891d9	{"action":"token_revoked","actor_id":"b4619160-ce13-4dec-bf0e-258206ad0ada","actor_username":"dhinorahmad0@gmail.com","actor_via_sso":false,"log_type":"token"}	2024-05-05 13:03:20.183381+00	
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
b4619160-ce13-4dec-bf0e-258206ad0ada	b4619160-ce13-4dec-bf0e-258206ad0ada	{"sub": "b4619160-ce13-4dec-bf0e-258206ad0ada", "email": "dhinorahmad0@gmail.com", "email_verified": false, "phone_verified": false}	email	2023-11-21 08:51:18.412796+00	2023-11-21 08:51:18.412831+00	2023-11-21 08:51:18.412831+00	0c415653-63e3-4431-bffc-da24a48f7b67
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
97683099-01e5-4456-8a1d-5c59be1305cb	2024-01-02 16:16:08.007431+00	2024-01-02 16:16:08.007431+00	password	9bda4c3a-7d7b-46e8-9775-a9fa500a6cfc
494fd4b5-d4b9-4385-8af9-96582eb945dc	2024-02-26 01:52:41.223907+00	2024-02-26 01:52:41.223907+00	password	e9e7cf4e-5c9e-488f-a3c8-0dbcef690c3e
e36f9b3a-90bb-49c6-8d18-607bdb127a3f	2024-03-02 21:37:27.176025+00	2024-03-02 21:37:27.176025+00	password	60514f22-bd8e-4a55-b9cf-f23498ee67ec
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
00000000-0000-0000-0000-000000000000	80	VDEc2DCW9HJP12tbSqfdPQ	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-01-02 16:16:08.001608+00	2024-01-11 09:25:09.179351+00	\N	97683099-01e5-4456-8a1d-5c59be1305cb
00000000-0000-0000-0000-000000000000	81	82-rz0kRvJ_AntwKBtnd1A	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-01-11 09:25:09.181534+00	2024-02-06 02:21:03.379055+00	VDEc2DCW9HJP12tbSqfdPQ	97683099-01e5-4456-8a1d-5c59be1305cb
00000000-0000-0000-0000-000000000000	82	zoVru05DmRN2661RW_C8RA	b4619160-ce13-4dec-bf0e-258206ad0ada	f	2024-02-06 02:21:03.380938+00	2024-02-06 02:21:03.380938+00	82-rz0kRvJ_AntwKBtnd1A	97683099-01e5-4456-8a1d-5c59be1305cb
00000000-0000-0000-0000-000000000000	83	7s0cybzYi2RZW1aLVGVKYw	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-26 01:52:41.21568+00	2024-02-26 08:52:56.58306+00	\N	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	84	jJqtDD1GEnxptUbDLWQTVA	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-26 08:52:56.584688+00	2024-02-26 13:39:41.558438+00	7s0cybzYi2RZW1aLVGVKYw	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	85	OI0dU-FVoQkNm1FObjt-Og	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-26 13:39:41.558854+00	2024-02-26 22:41:02.819856+00	jJqtDD1GEnxptUbDLWQTVA	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	86	oYesoNmtOmEchVvFkmOPng	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-26 22:41:02.820226+00	2024-02-28 02:06:29.676672+00	OI0dU-FVoQkNm1FObjt-Og	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	87	wpQqKWLCQcjvELn3HCs0Jg	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-28 02:06:29.67701+00	2024-02-28 13:24:04.384198+00	oYesoNmtOmEchVvFkmOPng	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	88	AUdrkOZfuNB1hv9DemE3Hg	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-02-28 13:24:04.385373+00	2024-03-01 03:13:39.218273+00	wpQqKWLCQcjvELn3HCs0Jg	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	89	_0XTYxnFprHlIIthuIs6Mw	b4619160-ce13-4dec-bf0e-258206ad0ada	f	2024-03-01 03:13:39.219422+00	2024-03-01 03:13:39.219422+00	AUdrkOZfuNB1hv9DemE3Hg	494fd4b5-d4b9-4385-8af9-96582eb945dc
00000000-0000-0000-0000-000000000000	90	P1y9pgkbpvh9xW9EcjaH9g	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-03-02 21:37:27.16858+00	2024-03-04 07:25:13.734658+00	\N	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	91	yL-V-xuNNHMehs9rtAMkdQ	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-03-04 07:25:13.737673+00	2024-03-05 03:28:15.568554+00	P1y9pgkbpvh9xW9EcjaH9g	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	92	Hyyb1GGFGkG1R2BDfN9s8g	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-03-05 03:28:15.56887+00	2024-03-12 22:55:13.2293+00	yL-V-xuNNHMehs9rtAMkdQ	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	93	UUY5oFE09jdkp7-NH7JV-A	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-03-12 22:55:13.238351+00	2024-03-27 19:24:57.127062+00	Hyyb1GGFGkG1R2BDfN9s8g	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	94	TddL2yaCnaoYdlHdaZRr5A	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-03-27 19:24:57.138829+00	2024-04-05 01:15:34.740602+00	UUY5oFE09jdkp7-NH7JV-A	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	95	u5XAJ-pycPv8oAhvUSCj7w	b4619160-ce13-4dec-bf0e-258206ad0ada	t	2024-04-05 01:15:34.745906+00	2024-05-05 13:03:20.184698+00	TddL2yaCnaoYdlHdaZRr5A	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
00000000-0000-0000-0000-000000000000	96	hSGiDFHiZ_S2NC5mLPeLuw	b4619160-ce13-4dec-bf0e-258206ad0ada	f	2024-05-05 13:03:20.190786+00	2024-05-05 13:03:20.190786+00	u5XAJ-pycPv8oAhvUSCj7w	e36f9b3a-90bb-49c6-8d18-607bdb127a3f
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag) FROM stdin;
e36f9b3a-90bb-49c6-8d18-607bdb127a3f	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-03-02 21:37:27.158995+00	2024-05-05 13:03:20.195068+00	\N	aal1	\N	2024-05-05 13:03:20.194978	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36	180.252.117.110	\N
97683099-01e5-4456-8a1d-5c59be1305cb	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-01-02 16:16:07.999905+00	2024-02-06 02:21:03.387272+00	\N	aal1	\N	2024-02-06 02:21:03.38718	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36 Edg/121.0.0.0	180.244.241.187	\N
494fd4b5-d4b9-4385-8af9-96582eb945dc	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-02-26 01:52:41.207592+00	2024-03-01 03:13:39.22112+00	\N	aal1	\N	2024-03-01 03:13:39.221029	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	180.252.123.231	\N
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
00000000-0000-0000-0000-000000000000	b4619160-ce13-4dec-bf0e-258206ad0ada	authenticated	authenticated	dhinorahmad0@gmail.com	$2a$10$uEZSWNRhGNe5Cl7jO9Mflu8olae566Y1zxlVqfKypEHdbi.JCmyWC	2023-11-21 08:51:31.185033+00	\N		2023-11-21 08:51:18.415646+00		\N			\N	2024-03-02 21:37:27.158565+00	{"provider": "email", "providers": ["email"]}	{}	\N	2023-11-21 08:51:18.410442+00	2024-05-05 13:03:20.192153+00	\N	\N			\N		0	\N		\N	f	\N	f
\.


--
-- Data for Name: key; Type: TABLE DATA; Schema: pgsodium; Owner: supabase_admin
--

COPY pgsodium.key (id, status, created, expires, key_type, key_id, key_context, name, associated_data, raw_key, raw_key_nonce, parent_key, comment, user_data) FROM stdin;
\.


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (id, created_at, id_user, title, description, tech_name, link, image) FROM stdin;
26	2023-11-27 02:32:42.147475+00	b4619160-ce13-4dec-bf0e-258206ad0ada	Kampus Merdeka x Dicoding	In website development, you need HTML, CSS, and JavaScript as a foundation. Then, you can use React to create dynamic components. ES6, NPM, Webpack, and AJAX help in project management and data retrieval. The use of Context and Hooks API helps manage state. It is also important to pay attention to accessibility, clean code, and automated testing to build a responsive and efficient website. All of this aims to create a website that is not only interactive, but also responsive, accessible, and has optimal performance.	Front-end React Developer	https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/47077bfb-654b-4505-a048-2b99b8a8cbe1/33a3f410-f1e3-11ec-86db-c625044c9b63	https://avatars.githubusercontent.com/u/22091590?s=280&v=4
27	2023-11-27 02:37:17.120415+00	b4619160-ce13-4dec-bf0e-258206ad0ada	Kampus Merdeka x Ruangguru	Learn Golang with a focus on testing, file manipulation, HTTP Server and Client creation, and Concurrecy concepts. basics of programming, Data Structure, and Algorithms. Understand databases, use PostgreSQL with GORM, testing with GINKO and get to know NoSQL. Learn HTTP client-server, including REST API, routing, error handling, and documentation. Apply Authentication, Authorization, design patterns MVC, and clean code principles. Apply them in projects and learn to deploy to PaaS.	Back-end Golang Developer	https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/d3ff9ffd-0c26-4515-a13b-20bd6609229b/9f52f569-58fb-11ed-b661-c66a6070286b	https://upload.wikimedia.org/wikipedia/commons/7/71/Ruang_Guru_logo.svg
28	2023-11-27 02:38:18.352691+00	b4619160-ce13-4dec-bf0e-258206ad0ada	ID Camp (Indosat Ooredo) 	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum rutrum mi in tristique. In hac habitasse platea dictumst. Suspendisse vel elementum augue. Aliquam feugiat fringilla felis ut viverra. Vivamus sit amet lacinia mauris. Sed leo leo, ultricies sit amet ipsum sed, porttitor rutrum tortor. Proin accumsan turpis sit amet lectus varius consectetur. Cras tempus mi et ante finibus sagittis.	Android Developer	https://idcamp.ioh.co.id/	https://idcamp.ioh.co.id/images/indosat-x-idcamp-logo.png
29	2023-11-27 02:39:17.24051+00	b4619160-ce13-4dec-bf0e-258206ad0ada	Kominfo Digitalent x Hacktiv8 	The training began with an introduction to the Go Language along with the installation and configuration of Go Path & Workspace, continued with variables, commands, arrays, methods & functions to OOP as well as ctrl statements and struct pointers. Continued with the introduction of the concept of Microservices and Web servers and the implementation of web services for APIs with SQL Database support. Until the implementation of Go to JSON & XML data types, continued with Secure your Code & Middleware with the fundamental concept of Pipeline Concurrency. Closed by doing unit testing with testify.	Back-end Golang Developer	https://digitalent.kominfo.go.id/pelatihan/5617	https://ibupediacdn.imgix.net/images/if1l4k3xxg44dkg2p.png
\.


--
-- Data for Name: certificate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certificate (created_at, title, short_description, link, image_path, credential_id, tech_name, pdf_path, id, is_favorite) FROM stdin;
2023-11-28 08:07:20.859777+00	[Kampus Merdeka - Front End React] - Sertifikat Kelulusan		https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/47077bfb-654b-4505-a048-2b99b8a8cbe1/33a3f410-f1e3-11ec-86db-c625044c9b63	image-Certificate_KM_Dicoding-1701158837627l9pv69878		Front End Developer, ReactJS	pdf-Kampus Merdeka - Front End React _ Sertifikat Kelulusan-1701158837627l9pv69878	31158476-94f0-4d38-93e1-408fdd958613	t
2023-11-28 08:19:49.308936+00	[Kampus Merdeka - Front End React] _ Surat Kelulusan-R496X1041		https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/47077bfb-654b-4505-a048-2b99b8a8cbe1/33a3f410-f1e3-11ec-86db-c625044c9b63	image-Certificate_KM_Dicoding_SuratKelulusan-1701159586483ocl5900k2		Front End Developer, ReactJS	pdf-Kampus Merdeka - Front End React _ Surat Kelulusan-R496X1041-1701159586483ocl5900k2	73d35b55-d305-4258-9bb6-030d23fcf1bf	t
2023-11-28 08:36:40.529816+00	[BE Hacktiv8 x Digitalent] - Sertifikat_Dhino Rahmad Kusuma_Web Service with Golang		https://digitalent.kominfo.go.id/pelatihan/5617	image-Certificate_Digitalent_Hacktiv8-1701160597220sitkg1ufo		Microservices, Go, Gin	pdf-BE Hacktiv8 x Digitalent - Sertifikat_Dhino Rahmad Kusuma_Scalable Web Service with Golang-1701160597220sitkg1ufo	db1fd5af-1273-49dd-b840-61c0f156c002	t
2023-11-28 08:27:00.842584+00	[Kampus Merdeka x Ruangguru] - Transkrip Nilai - Dhino Rahmad Kusuma		https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/d3ff9ffd-0c26-4515-a13b-20bd6609229b/9f52f569-58fb-11ed-b661-c66a6070286b	image-Certificate_KM_Ruangguru_Transkrip-1701160017739uqogdsaks		Go, Gin, RESTfull API, MVC	pdf-House BE 3 - Transkrip Nilai - Dhino Rahmad Kusuma-1701160017739uqogdsaks	ab774fb0-12e5-46da-b563-2471645b0992	t
2023-11-28 08:31:42.949187+00	[Kampus Merdeka x Ruangguru] - Sertifikat Back End Developer - Dhino Rahmad Kusuma		https://kampusmerdeka.kemdikbud.go.id/program/studi-independen/browse/d3ff9ffd-0c26-4515-a13b-20bd6609229b/9f52f569-58fb-11ed-b661-c66a6070286b	image-Certificate_KM_Ruangguru-1701160299305m53arwl2b		Go, Gin, RESTfull API, MVC, Postgres 	pdf-House BE 3 - Sertifikat MSIB x RGCAMP Batch 4 - Dhino Rahmad Kusuma-1701160299305m53arwl2b	22b79633-55d2-4ae9-81c0-8b27b578cc02	t
2023-11-29 06:49:41.764013+00	Menjadi React Web Developer Expert		https://www.dicoding.com/certificates/EYX4YLKNOZDL	image-Certificate_Dicoding_ReactDevExpert-17012405785405g0te0px0	EYX4YLKNOZDL	ReactJS, Redux, Cypres, CI/CD	pdf-Dicoding - React Developer Expert-17012405785405g0te0px0	cf8525ab-9aaf-4af6-8ef7-3a4cea7c567c	f
2022-08-14 07:07:21+00	Belajar Dasar Git dengan GitHub		https://www.dicoding.com/certificates/JLX1GEJW6Z72	image-Certificate_Dicoding_GitGithub-1701241638356q50c0nm62	JLX1GEJW6Z72	Git, Github	pdf-Dicoding - Belajar Git dengan Github-1701241638356q50c0nm62	85f8ef26-8bf5-4350-920a-9b85323d4244	f
2022-11-10 06:53:38+00	Menjadi Front-End Web Developer Expert		https://www.dicoding.com/certificates/EYX496R8JPDL	image-Certificate_Dicoding_FrontEndDevExpert-170124081516414kugalto	EYX496R8JPDL	Javascript, Webpack, Jest, PWA, CI/CD	pdf-Dicoding - Front End Web Developer Expert-170124081516414kugalto	c7ad0871-70ac-4c0d-97bf-fbe163402098	f
2024-03-02 21:41:20.964878+00	HackerRank - Problem Solving	It covers basic topics of Data Structures (such as Arrays, Strings) and Algorithms (such as Sorting and Searching).	https://www.hackerrank.com/certificates/b164ce48219a?utm_medium=email&utm_source=mail_template_1393&utm_campaign=hrc_skills_certificate	image-Screenshot from 2024-03-03 04-40-00-1709415669190k9bsu8e44	b164ce48219a	Javascript & Java	pdf-Hackerrank - Problem Solving-1709415669190k9bsu8e44	0290a3d9-a64f-407e-abb9-0ad5236fa47e	f
\.


--
-- Data for Name: experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.experience (id, created_at, company_name, job_desc, location, "from", "to", image_path, id_user, tech_name) FROM stdin;
6	2023-11-27 03:45:40.858426+00	PT. Telkom Indonesia	ReactJs Developer	Jakarta Timur	2023-03-13	2023-06-09	{"experience/image-WhatsApp Image 2023-07-20 at 21.42.49-1701174602070vaxwkfepz",experience/image-IMG_20230609_160656-1701174602070vaxwkfepz,experience/image-IMG_20230609_131114-1701174602070vaxwkfepz}	b4619160-ce13-4dec-bf0e-258206ad0ada	Javascript Developer & ReactJs
7	2023-11-27 10:05:15.589853+00	Dicoding Indonesia	PeerTutor Learning Path Front End Developer	Bandung	2022-09-14	2023-12-31	{"experience/image-Screenshot (101)-17011763930471q9m1ugc5"}	b4619160-ce13-4dec-bf0e-258206ad0ada	ReactJs Developer
\.


--
-- Data for Name: portfolio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.portfolio (id, created_at, title, short_description, link, tech_name, image_path) FROM stdin;
8	2023-11-22 02:07:07.416412+00	Fixiv	DevAndArt adalah aplikasi untuk mencari referensi terkait illustration & manga tempat berkumpulnya artist dan seniman dengan karya yang keren.	https://github.com/dhino12/DevAndArt	Kotlin, Jetpack Compose	portfolio/image-AppCapture-1701139041568dy7n75jsr
9	2023-11-22 02:07:35.560026+00	Spotify-Clone	Spotify-Clone mencoba untuk membuat aplikasi serupa dengan aplikasi streaming musik popular dengan NextJs dan Supabase	https://github.com/dhino12/Spotify-Clone/tree/master	NextJS 13, supabase, tailwind-css	portfolio/image-Spotify-Clone-1701139355064tgpxgrcw6
10	2023-11-28 02:49:17.383548+00	RestoFinder	Mahir menjadi seorang React Developer dengan mempelajari teknik Automation Testing, Redux, Deployment dengan CI/CD, hingga mengetahui praktik terbaik yang ada	https://github.com/dhino12/RestaurantFinder	Javascript, PWA, Webpack, codecept	portfolio/image-RestoFinder-1701139753815p198vubhx
11	2023-11-28 02:55:44.283495+00	FoodApps	Final Submission MADE Dicoding with Kotlin Coroutine and KOIN, aplikasi yang membantu untuk melihat menu resep makanan dan panduan atau langkah-langkah pembuatan lengkap dengan bahan-bahan yang diperlukan	https://github.com/dhino12/project_foodapps	Jetpack Compose, Circle-CI, room, retrofit	portfolio/image-FoodApps-1701140139392wjss1rxdl
12	2023-11-28 07:48:11.303933+00	Note App	Mengembangkan aplikasi catatanku dengan ReactJS dan ESlint	https://github.com/dhino12/Note-App	ReactJS, ESlint	portfolio/image-NoteApp-1701157688715eevx5oo9k
7	2023-11-22 02:02:41.06222+00	ForumApps	Mahir menjadi seorang React Developer dengan mempelajari teknik Automation Testing, Redux, Deployment dengan CI/CD, hingga mengetahui praktik terbaik yang ada.	https://github.com/dhino12/ForumApps	ReactJS + Vite, Cypress, Redux	portfolio/image-ForumApps-17011862826109swbn9xox
13	2024-02-06 02:31:53.278282+00	TaskTrackerPlus	aplikasi pengelolaan tugas yang dirancang untuk membantu mahasiswa dalam mengatur jadwal studi mereka	https://github.com/dhino12/TaskTrackerPlus/	Go,Gorm,Ginkgo,RestfullAPI,JWT,Postgres	portfolio/image-index-17071867115993ftms7x7t
14	2024-02-26 01:54:19.579228+00	Pemilu 2024	Aplikasi quick count pemilu 2024 yang dikembangkan dengan menggunakan Javascript, ini adalah aplikasi unofficial (bukan resmi).	https://pemilu2024.netlify.app/	Javascript,NextJS14,Tailwind	portfolio/image-screencapture-pemilu2024-netlify-app-2024-02-26-08_51_30-1708912456572x4kf9s5ma
4	2023-11-21 14:45:21.183306+00	TelegramBot-AutoForward\n	BOT to gather messages from various Telegram chats (private/public channels, private/public groups, direct chats) and send them to one or multiple chat locations.	https://github.com/dhino12/TelegramBot-AutoForward	Typescript	portfolio/image-telegram-tg-17011373395275jk0ahoow
\.


--
-- Data for Name: user_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_information (created_at, name, about, short_about, birthday, title_archivement, organizer, id_user) FROM stdin;
2023-11-27 02:15:52.145658+00	Dhino Rahmad Kusuma	I am currently a graduate student at Darma Persada University majoring in Informatics Engineering strata 1. I am an Android Developer and Javascript Developer. Able to learn flexibly by reading or watching videos and very interested in doing new things related to technology, and programming. I have internship experience as a Javascript Developer at PT Telkom Indonesia where I was tasked with building a telegram bot that is able to broadcast and forward automatically to many numbers at once, I also rebuilt the nearest telkom device search website with ReactJs.	Fullstack Developer	2023-11-08	\N	\N	b4619160-ce13-4dec-bf0e-258206ad0ada
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id) FROM stdin;
uploads	uploads	\N	2023-11-21 08:59:25.757689+00	2023-11-21 08:59:25.757689+00	t	f	\N	\N	\N
images	images	\N	2023-11-21 13:13:27.675508+00	2023-11-21 13:13:27.675508+00	t	f	\N	\N	\N
pdf	pdf	\N	2023-11-27 11:45:31.48189+00	2023-11-27 11:45:31.48189+00	t	f	\N	\N	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2024-01-26 06:05:53.006015
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2024-01-26 06:05:53.006015
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2024-01-26 06:05:53.006015
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2024-01-26 06:05:53.006015
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2024-01-26 06:05:53.006015
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2024-01-26 06:05:53.006015
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2024-01-26 06:05:53.006015
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2024-01-26 06:05:53.006015
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2024-01-26 06:05:53.006015
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2024-01-26 06:05:53.006015
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2024-01-26 06:05:53.006015
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2024-01-26 06:05:53.006015
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2024-01-26 06:05:53.006015
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2024-01-26 06:05:53.006015
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2024-01-26 06:05:53.006015
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2024-01-26 06:05:53.006015
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2024-01-26 06:05:53.006015
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2024-01-26 06:05:53.006015
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2024-01-26 06:05:53.006015
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2024-01-26 06:05:53.020362
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2024-04-16 15:25:04.866569
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2024-04-16 15:25:04.963363
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2024-04-16 15:25:05.075038
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2024-04-16 15:25:05.169932
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2024-07-02 02:46:18.337618
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id) FROM stdin;
6a7f1431-0a8c-4552-8485-b534fcf00614	images	portfolio/image-telegram-tg-17011373395275jk0ahoow	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 02:09:01.815213+00	2023-11-28 02:09:01.815213+00	2023-11-28 02:09:01.815213+00	{"eTag": "\\"9e207a3a0370b7ca0a2b70549bd89a2c\\"", "size": 31822, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T02:09:02.000Z", "contentLength": 31822, "httpStatusCode": 200}	f8d9bff5-d480-4d04-8d82-00b162b93916	b4619160-ce13-4dec-bf0e-258206ad0ada
878c403b-670b-4a8b-922e-af0f28588bfc	images	certificate/image-Certificate_Dicoding_ReactDevExpert-17012405785405g0te0px0	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:49:40.47347+00	2023-11-29 06:49:40.47347+00	2023-11-29 06:49:40.47347+00	{"eTag": "\\"c2cd5fa98ada1ea710024bbc0c399f12\\"", "size": 313709, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:49:41.000Z", "contentLength": 313709, "httpStatusCode": 200}	e8f9fe3e-44de-465e-9173-1d03801e4629	b4619160-ce13-4dec-bf0e-258206ad0ada
28551c9b-02f2-4c60-adea-c98553deeb59	uploads	b4619160-ce13-4dec-bf0e-258206ad0ada/77ece4b1-b1f8-45c7-9ba4-2c6c226d9833	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-21 09:03:25.492351+00	2023-11-21 09:03:25.492351+00	2023-11-21 09:03:25.492351+00	{"eTag": "\\"67e6073231e7c62bab702e8da683a7d0\\"", "size": 90295, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-21T09:03:26.000Z", "contentLength": 90295, "httpStatusCode": 200}	1c95653b-9d53-4246-b96f-7d6f894cb304	b4619160-ce13-4dec-bf0e-258206ad0ada
3b3079c0-f525-44f3-b71d-dd0764faa736	images	portfolio/image-NoteApp-1701157688715eevx5oo9k	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 07:48:11.137676+00	2023-11-28 07:48:11.137676+00	2023-11-28 07:48:11.137676+00	{"eTag": "\\"6d98810fed6be7e8e579df783c957b2b\\"", "size": 124216, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T07:48:12.000Z", "contentLength": 124216, "httpStatusCode": 200}	7aa849de-23b9-490e-84a6-575b6f41eea2	b4619160-ce13-4dec-bf0e-258206ad0ada
bb9c482a-23c1-4953-b796-12b29c8b4854	images	certificate/image-Certificate_KM_Dicoding-1701158607354f1g4qekrb	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:03:29.900796+00	2023-11-28 08:03:29.900796+00	2023-11-28 08:03:29.900796+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:03:30.000Z", "contentLength": 240447, "httpStatusCode": 200}	441c6684-e833-433b-b691-803ae45dccfe	b4619160-ce13-4dec-bf0e-258206ad0ada
84d6fe75-93c5-4b6e-a06b-5d16815e10cd	images	.emptyFolderPlaceholder	\N	2023-11-21 13:42:23.478428+00	2023-11-21 13:42:23.478428+00	2023-11-21 13:42:23.478428+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-11-21T13:42:24.000Z", "contentLength": 0, "httpStatusCode": 200}	06681562-c1e6-4bf7-92ee-698b20625f48	\N
a280c30e-0013-48ee-b229-655e42fb004e	images	certificate/image-Certificate_KM_Dicoding-1701158758459svvpa1sew	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:06:01.070372+00	2023-11-28 08:06:01.070372+00	2023-11-28 08:06:01.070372+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:06:01.000Z", "contentLength": 240447, "httpStatusCode": 200}	638f88f9-9c08-4de9-a756-3e5cde70268c	b4619160-ce13-4dec-bf0e-258206ad0ada
478b2c37-8c48-426c-abe6-47b895343db2	images	certificate/image-Certificate_KM_Dicoding-1701158769003s4jg4s5jh	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:06:11.136723+00	2023-11-28 08:06:11.136723+00	2023-11-28 08:06:11.136723+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:06:12.000Z", "contentLength": 240447, "httpStatusCode": 200}	36e07a5f-16ac-4800-9b68-601669d37de6	b4619160-ce13-4dec-bf0e-258206ad0ada
5a398475-076f-4708-b56a-6eb92095ad7c	images	experience/.emptyFolderPlaceholder	\N	2023-11-22 16:00:15.280284+00	2023-11-22 16:00:15.280284+00	2023-11-22 16:00:15.280284+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-11-22T16:00:16.000Z", "contentLength": 0, "httpStatusCode": 200}	4a57271c-478e-4942-b73d-97eefb18cde8	\N
35644b91-ba66-46cc-8cf1-5cdd0233a575	images	empty.png	\N	2023-11-23 01:00:18.781965+00	2023-11-23 01:00:18.781965+00	2023-11-23 01:00:18.781965+00	{"eTag": "\\"73afefaed7a4913d9c6a22196aa9ab35\\"", "size": 4602, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-23T01:00:19.000Z", "contentLength": 4602, "httpStatusCode": 200}	20b95d02-6597-402c-a047-9f923be603d3	\N
71e0ea54-08f8-4bd7-a8e1-40cd7ffeed38	images	portfolio/.emptyFolderPlaceholder	\N	2023-11-22 03:50:04.556012+00	2023-11-22 03:50:04.556012+00	2023-11-22 03:50:04.556012+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-11-22T03:50:05.000Z", "contentLength": 0, "httpStatusCode": 200}	88d8ed3b-9714-4500-9212-db79f4f75524	\N
6cf714b2-3b98-4f4f-93b3-cd50ef0d09ab	images	certificate/.emptyFolderPlaceholder	\N	2023-11-22 03:50:15.749296+00	2023-11-22 03:50:15.749296+00	2023-11-22 03:50:15.749296+00	{"eTag": "\\"d41d8cd98f00b204e9800998ecf8427e\\"", "size": 0, "mimetype": "application/octet-stream", "cacheControl": "max-age=3600", "lastModified": "2023-11-22T03:50:16.000Z", "contentLength": 0, "httpStatusCode": 200}	415dd20b-e0ef-4197-b5e9-0928185b84b4	\N
f9e57abc-b79b-458f-aac4-a409a9fea57a	pdf	certificate/pdf-Dicoding - React Developer Expert-17012405785405g0te0px0	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:49:41.606079+00	2023-11-29 06:49:41.606079+00	2023-11-29 06:49:41.606079+00	{"eTag": "\\"7d76930cc077dbddd43b5eb032c7d0bb\\"", "size": 917405, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:49:42.000Z", "contentLength": 917405, "httpStatusCode": 200}	0e8ecb7d-67a9-4b37-8eab-22c6ee5a1d49	b4619160-ce13-4dec-bf0e-258206ad0ada
d32b9fe6-fa64-4730-9bd3-b2356d18e216	images	certificate/image-Certificate_Dicoding_FrontEndDevExpert-170124081516414kugalto	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:53:37.537811+00	2023-11-29 06:53:37.537811+00	2023-11-29 06:53:37.537811+00	{"eTag": "\\"1d21c38e82b6f1b20689d41b3f64a98a\\"", "size": 319589, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:53:38.000Z", "contentLength": 319589, "httpStatusCode": 200}	f06b260c-b9e6-4ce1-9fa5-3b28d26a7257	b4619160-ce13-4dec-bf0e-258206ad0ada
2cbd262b-c9c2-48dc-ba1d-605ee5722b8d	pdf	certificate/pdf-Dicoding - Front End Web Developer Expert-170124081516414kugalto	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:53:38.560747+00	2023-11-29 06:53:38.560747+00	2023-11-29 06:53:38.560747+00	{"eTag": "\\"6b3c730e9e3cc6ee0c7b2f75ee318d51\\"", "size": 933680, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:53:39.000Z", "contentLength": 933680, "httpStatusCode": 200}	09c60af4-5271-422a-bf5b-f76daa803868	b4619160-ce13-4dec-bf0e-258206ad0ada
28d7134b-2e37-4518-b6dc-2f1a50342aab	images	certificate/image-Screenshot from 2024-03-03 04-40-00-1709415669190k9bsu8e44	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-03-02 21:41:11.924963+00	2024-03-02 21:41:11.924963+00	2024-03-02 21:41:11.924963+00	{"eTag": "\\"4903aebfa0668ae2bb2abd3045865fac\\"", "size": 2208683, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2024-03-02T21:41:12.000Z", "contentLength": 2208683, "httpStatusCode": 200}	cfb103c0-e4f7-4c6b-b307-2ef3aff3c5e9	b4619160-ce13-4dec-bf0e-258206ad0ada
c7d24656-c1f0-4614-9941-3efc3bcb2c87	images	portfolio/image-AppCapture-1701139041568dy7n75jsr	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 02:37:35.14831+00	2023-11-28 02:37:35.14831+00	2023-11-28 02:37:35.14831+00	{"eTag": "\\"32f2787d1262ee313d971dc0b82bfc75-3\\"", "size": 13302310, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T02:37:35.000Z", "contentLength": 13302310, "httpStatusCode": 200}	7b94ff73-754a-4d43-a131-1383bc463ab6	b4619160-ce13-4dec-bf0e-258206ad0ada
7309457a-f3ab-4f93-91e7-721f4e4b6615	images	portfolio/image-Spotify-Clone-1701139355064tgpxgrcw6	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 02:42:37.992669+00	2023-11-28 02:42:37.992669+00	2023-11-28 02:42:37.992669+00	{"eTag": "\\"faf015e76dcafd5dac283a815166e786\\"", "size": 580674, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T02:42:38.000Z", "contentLength": 580674, "httpStatusCode": 200}	334c9c1f-8650-4d68-8fcd-89599ddde74b	b4619160-ce13-4dec-bf0e-258206ad0ada
3127dd51-d49b-4a7d-bace-373bc08dd60b	images	portfolio/image-RestoFinder-1701139753815p198vubhx	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 02:49:17.204829+00	2023-11-28 02:49:17.204829+00	2023-11-28 02:49:17.204829+00	{"eTag": "\\"6c9cd9bcea065e85a0cb1d742ae1ab0c\\"", "size": 1640991, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T02:49:18.000Z", "contentLength": 1640991, "httpStatusCode": 200}	1fb7c1cf-b40d-48dc-8deb-b17cee01d98d	b4619160-ce13-4dec-bf0e-258206ad0ada
2009b276-1c65-47ea-bda5-029ed0d8c748	images	portfolio/image-FoodApps-1701140139392wjss1rxdl	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 02:55:44.160141+00	2023-11-28 02:55:44.160141+00	2023-11-28 02:55:44.160141+00	{"eTag": "\\"0a783c594778b9ca6163542dee309dee\\"", "size": 3209962, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T02:55:44.000Z", "contentLength": 3209962, "httpStatusCode": 200}	f134a2ff-27e0-412e-a9d9-0b76391783a5	b4619160-ce13-4dec-bf0e-258206ad0ada
0654c6f2-12c5-4420-81c3-9fc5bb3384b7	images	certificate/image-Certificate_KM_Dicoding-1701158531411dy11jw3n4	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:02:13.871932+00	2023-11-28 08:02:13.871932+00	2023-11-28 08:02:13.871932+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:02:14.000Z", "contentLength": 240447, "httpStatusCode": 200}	846a0eec-4d7e-4a55-bc7e-22178a0863f5	b4619160-ce13-4dec-bf0e-258206ad0ada
951c507b-f2dd-4459-8ba5-2a19d2c6a3bd	images	certificate/image-Certificate_KM_Dicoding-1701158572643q9mcpchrz	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:02:55.042152+00	2023-11-28 08:02:55.042152+00	2023-11-28 08:02:55.042152+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:02:55.000Z", "contentLength": 240447, "httpStatusCode": 200}	b2f6fd04-1edc-47df-b3b1-4525b33d4958	b4619160-ce13-4dec-bf0e-258206ad0ada
ba14900a-d39e-4fe2-96a2-c52dfc82dac4	images	certificate/image-Certificate_KM_Dicoding-17011587777232vic467yg	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:06:19.940839+00	2023-11-28 08:06:19.940839+00	2023-11-28 08:06:19.940839+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:06:20.000Z", "contentLength": 240447, "httpStatusCode": 200}	cf6aaab7-946d-40ba-a596-9382a6e4becf	b4619160-ce13-4dec-bf0e-258206ad0ada
08be07be-3556-4bc2-ab65-9785adaf94ed	images	certificate/image-Certificate_KM_Dicoding-17011587935630d7vp2sp1	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:06:35.716169+00	2023-11-28 08:06:35.716169+00	2023-11-28 08:06:35.716169+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:06:36.000Z", "contentLength": 240447, "httpStatusCode": 200}	f58bfff5-945a-4315-9a39-c633dc17662d	b4619160-ce13-4dec-bf0e-258206ad0ada
1bf9aea9-fd77-4429-ab72-aee1a15b7eee	images	certificate/image-Certificate_Dicoding_GitGithub-1701241638356q50c0nm62	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 07:07:20.633189+00	2023-11-29 07:07:20.633189+00	2023-11-29 07:07:20.633189+00	{"eTag": "\\"43b67c4ac75a5216cd42c8cd153526d1\\"", "size": 316390, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T07:07:21.000Z", "contentLength": 316390, "httpStatusCode": 200}	aaa4c937-112a-4939-b78c-96a9f203d7f7	b4619160-ce13-4dec-bf0e-258206ad0ada
cd86b900-a0ef-42d3-89cb-95360e8f1f64	pdf	certificate/pdf-Kampus Merdeka - Front End React _ Sertifikat Kelulusan-17011587935630d7vp2sp1	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:06:36.442673+00	2023-11-28 08:06:36.442673+00	2023-11-28 08:06:36.442673+00	{"eTag": "\\"1049aedad74c18956c82c5f248157f74\\"", "size": 495387, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:06:37.000Z", "contentLength": 495387, "httpStatusCode": 200}	771b2f08-2600-49cf-93a4-bab673fd4193	b4619160-ce13-4dec-bf0e-258206ad0ada
07057b0d-1816-407c-9202-11fa5eb5118b	images	certificate/image-Certificate_KM_Dicoding-1701158837627l9pv69878	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:07:19.820286+00	2023-11-28 08:07:19.820286+00	2023-11-28 08:07:19.820286+00	{"eTag": "\\"7be6dcb75f9446256cdc40556b59d6da\\"", "size": 240447, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:07:20.000Z", "contentLength": 240447, "httpStatusCode": 200}	11433c27-1e9e-4795-9294-bff903778f30	b4619160-ce13-4dec-bf0e-258206ad0ada
377be69c-9060-444e-baa9-751e52769ecb	pdf	certificate/pdf-Dicoding - Belajar Git dengan Github-1701241638356q50c0nm62	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 07:07:21.804129+00	2023-11-29 07:07:21.804129+00	2023-11-29 07:07:21.804129+00	{"eTag": "\\"e8570e073c05912f7a13195d13fff2d8\\"", "size": 923191, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T07:07:22.000Z", "contentLength": 923191, "httpStatusCode": 200}	003ac94d-94d7-4e2e-b302-a9dedb0413d4	b4619160-ce13-4dec-bf0e-258206ad0ada
86a395be-97bf-4fa7-bae4-e294cb336c87	pdf	certificate/pdf-Kampus Merdeka - Front End React _ Sertifikat Kelulusan-1701158837627l9pv69878	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:07:20.597477+00	2023-11-28 08:07:20.597477+00	2023-11-28 08:07:20.597477+00	{"eTag": "\\"1049aedad74c18956c82c5f248157f74\\"", "size": 495387, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:07:21.000Z", "contentLength": 495387, "httpStatusCode": 200}	f63c57d2-b524-44a9-a795-5b703b8a1390	b4619160-ce13-4dec-bf0e-258206ad0ada
b9f825f5-db23-4b4c-ab44-df50bce00034	images	certificate/image-Certificate_KM_Dicoding_SuratKelulusan-17011594161710vi2k7184	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:16:58.550518+00	2023-11-28 08:16:58.550518+00	2023-11-28 08:16:58.550518+00	{"eTag": "\\"8cd885a11b2add509e876751115170e4\\"", "size": 165204, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:16:59.000Z", "contentLength": 165204, "httpStatusCode": 200}	ecf218cb-040b-463e-bafd-1e74d994b086	b4619160-ce13-4dec-bf0e-258206ad0ada
6fd8daec-04ed-450a-bfb2-9d57ef487e83	pdf	certificate/pdf-Hackerrank - Problem Solving-1709415669190k9bsu8e44	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-03-02 21:41:20.439008+00	2024-03-02 21:41:20.439008+00	2024-03-02 21:41:20.439008+00	{"eTag": "\\"f7ce6bef03f2db8d4e27ca31a48a1e9f-2\\"", "size": 7683641, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2024-03-02T21:41:21.000Z", "contentLength": 7683641, "httpStatusCode": 200}	a23c4711-e487-4651-ac08-3745d143b669	b4619160-ce13-4dec-bf0e-258206ad0ada
65b63279-103c-49a9-b9f7-76fcf85da1e6	images	certificate/image-Certificate_KM_Dicoding_SuratKelulusan-170115943539586usug084	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:17:17.390761+00	2023-11-28 08:17:17.390761+00	2023-11-28 08:17:17.390761+00	{"eTag": "\\"8cd885a11b2add509e876751115170e4\\"", "size": 165204, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:17:18.000Z", "contentLength": 165204, "httpStatusCode": 200}	b75232ad-e266-4462-94c3-76ad52917079	b4619160-ce13-4dec-bf0e-258206ad0ada
f99c2201-deb8-4e56-b39c-75cc49316241	images	certificate/image-Certificate_KM_Dicoding_SuratKelulusan-17011594446106uk50gmz9	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:17:26.704778+00	2023-11-28 08:17:26.704778+00	2023-11-28 08:17:26.704778+00	{"eTag": "\\"8cd885a11b2add509e876751115170e4\\"", "size": 165204, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:17:27.000Z", "contentLength": 165204, "httpStatusCode": 200}	2b601e31-bb53-4f5d-9b6a-1c96ace495e2	b4619160-ce13-4dec-bf0e-258206ad0ada
f130ac1d-d9a3-4e82-81fa-e53d2f4708c4	images	portfolio/image-index-17071867115993ftms7x7t	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-02-06 02:31:52.72248+00	2024-02-06 02:31:52.72248+00	2024-02-06 02:31:52.72248+00	{"eTag": "\\"0f6681bfbe144443c0122424d2eab9c4\\"", "size": 238196, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2024-02-06T02:31:53.000Z", "contentLength": 238196, "httpStatusCode": 200}	c2261e89-491b-4161-a144-02069338af14	b4619160-ce13-4dec-bf0e-258206ad0ada
53ac710a-96e8-443d-885d-788ef6adb0c9	images	certificate/image-Certificate_KM_Dicoding_SuratKelulusan-1701159516699vj5037win	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:18:38.976982+00	2023-11-28 08:18:38.976982+00	2023-11-28 08:18:38.976982+00	{"eTag": "\\"8cd885a11b2add509e876751115170e4\\"", "size": 165204, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:18:39.000Z", "contentLength": 165204, "httpStatusCode": 200}	2295ac82-0283-4833-99cf-6ba23a8a1ba9	b4619160-ce13-4dec-bf0e-258206ad0ada
5aae4a27-0e60-4adf-912b-6de7fa008364	pdf	certificate/pdf-Kampus Merdeka - Front End React _ Surat Kelulusan-R496X1041-1701159516699vj5037win	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:18:39.241858+00	2023-11-28 08:18:39.241858+00	2023-11-28 08:18:39.241858+00	{"eTag": "\\"53420427f76c5a562e55d471dbf3014b\\"", "size": 19987, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:18:40.000Z", "contentLength": 19987, "httpStatusCode": 200}	eb45ae8d-79cb-4156-836e-f2b8f65d2447	b4619160-ce13-4dec-bf0e-258206ad0ada
06661f66-b0dd-4db6-a39e-0fef849bedbc	images	certificate/image-Certificate_KM_Dicoding_SuratKelulusan-1701159586483ocl5900k2	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:19:48.8777+00	2023-11-28 08:19:48.8777+00	2023-11-28 08:19:48.8777+00	{"eTag": "\\"8cd885a11b2add509e876751115170e4\\"", "size": 165204, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:19:49.000Z", "contentLength": 165204, "httpStatusCode": 200}	fc1c2709-8dbc-41c9-922c-231d505d8132	b4619160-ce13-4dec-bf0e-258206ad0ada
5c059787-522e-4eec-ae02-2d9cac29fc55	pdf	certificate/pdf-Kampus Merdeka - Front End React _ Surat Kelulusan-R496X1041-1701159586483ocl5900k2	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:19:49.193365+00	2023-11-28 08:19:49.193365+00	2023-11-28 08:19:49.193365+00	{"eTag": "\\"53420427f76c5a562e55d471dbf3014b\\"", "size": 19987, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:19:50.000Z", "contentLength": 19987, "httpStatusCode": 200}	120451b4-8c6d-4a34-8260-dc7e8acd81cc	b4619160-ce13-4dec-bf0e-258206ad0ada
30ff3d79-5ccf-4641-b664-c7da13a50f17	images	certificate/image-Certificate_KM_Ruangguru_Transkrip-1701160017739uqogdsaks	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:27:00.191247+00	2023-11-28 08:27:00.191247+00	2023-11-28 08:27:00.191247+00	{"eTag": "\\"a50fd9673fc8d551bbf17521fff412d9\\"", "size": 123915, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:27:01.000Z", "contentLength": 123915, "httpStatusCode": 200}	f4bc47ca-1164-4e4d-9222-2dde1a70365e	b4619160-ce13-4dec-bf0e-258206ad0ada
1f595cd4-49f4-42a4-938f-8bbb642aca8b	pdf	certificate/pdf-House BE 3 - Transkrip Nilai - Dhino Rahmad Kusuma-1701160017739uqogdsaks	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:27:00.654432+00	2023-11-28 08:27:00.654432+00	2023-11-28 08:27:00.654432+00	{"eTag": "\\"764ad1959acd48fbed47b8433a175d45\\"", "size": 180936, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:27:01.000Z", "contentLength": 180936, "httpStatusCode": 200}	36ced579-ca21-4468-b9f2-9039892a666a	b4619160-ce13-4dec-bf0e-258206ad0ada
20691197-98f6-47a7-9b6e-ccbf15b22373	images	certificate/image-Certificate_KM_Ruangguru-1701160299305m53arwl2b	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:31:42.210441+00	2023-11-28 08:31:42.210441+00	2023-11-28 08:31:42.210441+00	{"eTag": "\\"0fab48ba458148c3ad45e4d73615b2d7\\"", "size": 482692, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:31:42.000Z", "contentLength": 482692, "httpStatusCode": 200}	06930521-19f4-4a8a-8091-64089ee87509	b4619160-ce13-4dec-bf0e-258206ad0ada
62a5f993-db82-4596-ad71-d3861d29ec62	pdf	certificate/pdf-House BE 3 - Sertifikat MSIB x RGCAMP Batch 4 - Dhino Rahmad Kusuma-1701160299305m53arwl2b	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:31:42.838221+00	2023-11-28 08:31:42.838221+00	2023-11-28 08:31:42.838221+00	{"eTag": "\\"981763d0101f16d254ccefbf75661dba\\"", "size": 369216, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:31:43.000Z", "contentLength": 369216, "httpStatusCode": 200}	f62b8e8f-157e-42fa-a564-219152d21a24	b4619160-ce13-4dec-bf0e-258206ad0ada
a3aa34d5-9b4c-435c-a2ac-952b2e8a5de9	images	certificate/image-Certificate_Digitalent_Hacktiv8-1701160597220sitkg1ufo	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:36:39.720844+00	2023-11-28 08:36:39.720844+00	2023-11-28 08:36:39.720844+00	{"eTag": "\\"e6c97c4cfc47ab20617369a50bf8c42a\\"", "size": 148799, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:36:40.000Z", "contentLength": 148799, "httpStatusCode": 200}	dbb3c30f-0066-4df6-a9a5-9e3a28386687	b4619160-ce13-4dec-bf0e-258206ad0ada
f3ed52c3-8817-4445-bbb6-a77a9c92befc	pdf	certificate/pdf-BE Hacktiv8 x Digitalent - Sertifikat_Dhino Rahmad Kusuma_Scalable Web Service with Golang-1701160597220sitkg1ufo	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 08:36:40.414037+00	2023-11-28 08:36:40.414037+00	2023-11-28 08:36:40.414037+00	{"eTag": "\\"f4b28e294651635fd4187aaf810d71ee\\"", "size": 344951, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T08:36:41.000Z", "contentLength": 344951, "httpStatusCode": 200}	7d60fadf-4920-4c65-a6f2-23ee0dc883ab	b4619160-ce13-4dec-bf0e-258206ad0ada
c87a87fa-57bc-4178-9af0-bc7d3325059f	images	portfolio/image-screencapture-pemilu2024-netlify-app-2024-02-26-08_51_30-1708912456572x4kf9s5ma	b4619160-ce13-4dec-bf0e-258206ad0ada	2024-02-26 01:54:19.101135+00	2024-02-26 01:54:19.101135+00	2024-02-26 01:54:19.101135+00	{"eTag": "\\"0e215c3353f055d8d589601d6bbd9e0c\\"", "size": 233770, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2024-02-26T01:54:20.000Z", "contentLength": 233770, "httpStatusCode": 200}	4dedea6e-fce1-4e3a-9eb9-7860f7e02aa9	b4619160-ce13-4dec-bf0e-258206ad0ada
6b0de3e5-d0e1-4bf8-b3dd-6f1f1db64fc2	images	experience/image-WhatsApp Image 2023-07-20 at 21.42.49-1701174602070vaxwkfepz	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 12:30:04.945623+00	2023-11-28 12:30:04.945623+00	2023-11-28 12:30:04.945623+00	{"eTag": "\\"c982b8f99c2649b5d715a4e97871d91e\\"", "size": 147585, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T12:30:05.000Z", "contentLength": 147585, "httpStatusCode": 200}	dfe6988f-6670-4b43-a7c2-4c71a7bf7658	b4619160-ce13-4dec-bf0e-258206ad0ada
3f030ab2-c4ba-4234-bdd3-2e960080e475	images	experience/image-IMG_20230609_160656-1701174602070vaxwkfepz	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 12:30:08.799208+00	2023-11-28 12:30:08.799208+00	2023-11-28 12:30:08.799208+00	{"eTag": "\\"382f528470fed402d03316636ae826ef\\"", "size": 3981932, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T12:30:09.000Z", "contentLength": 3981932, "httpStatusCode": 200}	ad0a1350-a61d-4012-8814-4bfe0e10a7e1	b4619160-ce13-4dec-bf0e-258206ad0ada
b0e3e071-51b1-4c24-bf78-58bdf2e820bb	images	experience/image-IMG_20230609_131114-1701174602070vaxwkfepz	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 12:30:12.533695+00	2023-11-28 12:30:12.533695+00	2023-11-28 12:30:12.533695+00	{"eTag": "\\"3ce27f4b5aef59e0540bd7f362c303af\\"", "size": 3899735, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T12:30:13.000Z", "contentLength": 3899735, "httpStatusCode": 200}	3805faf2-fd65-4b27-b532-a65c4a7e4208	b4619160-ce13-4dec-bf0e-258206ad0ada
0d47fb64-33a6-4e2a-8d8f-0929123b97c2	images	experience/image-Screenshot (101)-17011763930471q9m1ugc5	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 12:59:56.657486+00	2023-11-28 12:59:56.657486+00	2023-11-28 12:59:56.657486+00	{"eTag": "\\"e568a4d575962850b386322e371555c7\\"", "size": 1227564, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T12:59:57.000Z", "contentLength": 1227564, "httpStatusCode": 200}	f2644b1f-2c58-4196-99c7-b1b6559fee89	b4619160-ce13-4dec-bf0e-258206ad0ada
1fd383c8-39b8-421a-8aa5-82bfffa1b589	images	portfolio/image-ForumApps-17011862826109swbn9xox	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-28 15:44:45.141449+00	2023-11-28 15:44:45.141449+00	2023-11-28 15:44:45.141449+00	{"eTag": "\\"95fab653ba872080aba1420173343496\\"", "size": 252399, "mimetype": "image/jpeg", "cacheControl": "max-age=3600", "lastModified": "2023-11-28T15:44:46.000Z", "contentLength": 252399, "httpStatusCode": 200}	64849f44-ad63-47b4-a782-9c847865f936	b4619160-ce13-4dec-bf0e-258206ad0ada
0856a2a5-7e05-4da2-84ed-9cdc1ca9a06f	images	certificate/image-Certificate_Dicoding_ReactDevExpert-1701240434548i95vc65n6	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:47:16.924465+00	2023-11-29 06:47:16.924465+00	2023-11-29 06:47:16.924465+00	{"eTag": "\\"c2cd5fa98ada1ea710024bbc0c399f12\\"", "size": 313709, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:47:17.000Z", "contentLength": 313709, "httpStatusCode": 200}	2d901d17-c82c-42b3-ac7f-f5d5c0a44636	b4619160-ce13-4dec-bf0e-258206ad0ada
bbdb2470-2466-4d37-8a0e-1a705682194d	pdf	certificate/pdf-Dicoding - React Developer Expert-1701240434548i95vc65n6	b4619160-ce13-4dec-bf0e-258206ad0ada	2023-11-29 06:47:18.02577+00	2023-11-29 06:47:18.02577+00	2023-11-29 06:47:18.02577+00	{"eTag": "\\"7d76930cc077dbddd43b5eb032c7d0bb\\"", "size": 917405, "mimetype": "application/pdf", "cacheControl": "max-age=3600", "lastModified": "2023-11-29T06:47:18.000Z", "contentLength": 917405, "httpStatusCode": 200}	e45293de-964e-4bef-8eb7-d2598386998e	b4619160-ce13-4dec-bf0e-258206ad0ada
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 96, true);


--
-- Name: key_key_id_seq; Type: SEQUENCE SET; Schema: pgsodium; Owner: supabase_admin
--

SELECT pg_catalog.setval('pgsodium.key_key_id_seq', 1, false);


--
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_id_seq', 29, true);


--
-- Name: experience_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.experience_id_seq', 7, true);


--
-- Name: portfolio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.portfolio_id_seq', 14, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: certificate certificate_id_certifi_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_id_certifi_key UNIQUE (id);


--
-- Name: certificate certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certificate
    ADD CONSTRAINT certificate_pkey PRIMARY KEY (id);


--
-- Name: experience experience_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (id);


--
-- Name: portfolio portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio
    ADD CONSTRAINT portfolio_pkey PRIMARY KEY (id);


--
-- Name: user_information user_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_information
    ADD CONSTRAINT user_information_pkey PRIMARY KEY (id_user);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: activity activity_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.user_information(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: experience experience_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.user_information(id_user) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: activity Enable delete access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable delete access for all users" ON public.activity FOR DELETE USING (true);


--
-- Name: user_information Enable delete access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable delete access for all users" ON public.user_information FOR DELETE USING (true);


--
-- Name: activity Enable insert access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable insert access for all users" ON public.activity FOR INSERT WITH CHECK (true);


--
-- Name: user_information Enable insert for authenticated users only; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable insert for authenticated users only" ON public.user_information FOR INSERT TO authenticated WITH CHECK (true);


--
-- Name: activity Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.activity FOR SELECT USING (true);


--
-- Name: user_information Enable read access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable read access for all users" ON public.user_information FOR SELECT USING (true);


--
-- Name: activity Enable update access for all users; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable update access for all users" ON public.activity FOR UPDATE USING (true) WITH CHECK (true);


--
-- Name: user_information Enable update for authenticated users only; Type: POLICY; Schema: public; Owner: postgres
--

CREATE POLICY "Enable update for authenticated users only" ON public.user_information FOR UPDATE TO authenticated USING (true) WITH CHECK (true);


--
-- Name: activity; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.activity ENABLE ROW LEVEL SECURITY;

--
-- Name: user_information; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public.user_information ENABLE ROW LEVEL SECURITY;

--
-- Name: objects All 1ffg0oo_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All 1ffg0oo_0" ON storage.objects FOR SELECT USING (true);


--
-- Name: objects All 1ffg0oo_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All 1ffg0oo_1" ON storage.objects FOR INSERT WITH CHECK (true);


--
-- Name: objects All 1ffg0oo_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All 1ffg0oo_2" ON storage.objects FOR UPDATE USING (true);


--
-- Name: objects All 1ffg0oo_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All 1ffg0oo_3" ON storage.objects FOR DELETE USING (true);


--
-- Name: objects All Image Policies 1ffg0oo_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All Image Policies 1ffg0oo_0" ON storage.objects FOR SELECT USING (true);


--
-- Name: objects All Image Policies 1ffg0oo_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All Image Policies 1ffg0oo_1" ON storage.objects FOR INSERT WITH CHECK (true);


--
-- Name: objects All Image Policies 1ffg0oo_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All Image Policies 1ffg0oo_2" ON storage.objects FOR UPDATE USING (true);


--
-- Name: objects All Image Policies 1ffg0oo_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "All Image Policies 1ffg0oo_3" ON storage.objects FOR DELETE USING (true);


--
-- Name: objects Give users access to own folder 1va6avm_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users access to own folder 1va6avm_0" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'uploads'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Give users access to own folder 1va6avm_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users access to own folder 1va6avm_1" ON storage.objects FOR SELECT USING (((bucket_id = 'uploads'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Give users access to own folder 1va6avm_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users access to own folder 1va6avm_2" ON storage.objects FOR UPDATE USING (((bucket_id = 'uploads'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Give users access to own folder 1va6avm_3; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users access to own folder 1va6avm_3" ON storage.objects FOR DELETE USING (((bucket_id = 'uploads'::text) AND ((auth.uid())::text = (storage.foldername(name))[1])));


--
-- Name: objects Give users authenticated access to folder 2diq_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users authenticated access to folder 2diq_0" ON storage.objects FOR INSERT WITH CHECK (((bucket_id = 'pdf'::text) AND ((storage.foldername(name))[1] = 'private'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Give users authenticated access to folder 2diq_1; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users authenticated access to folder 2diq_1" ON storage.objects FOR UPDATE USING (((bucket_id = 'pdf'::text) AND ((storage.foldername(name))[1] = 'private'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Give users authenticated access to folder 2diq_2; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Give users authenticated access to folder 2diq_2" ON storage.objects FOR DELETE USING (((bucket_id = 'pdf'::text) AND ((storage.foldername(name))[1] = 'private'::text) AND (auth.role() = 'authenticated'::text)));


--
-- Name: objects Read All User 2diq_0; Type: POLICY; Schema: storage; Owner: supabase_storage_admin
--

CREATE POLICY "Read All User 2diq_0" ON storage.objects FOR SELECT USING ((bucket_id = 'pdf'::text));


--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION supabase_realtime OWNER TO postgres;

--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA extensions TO anon;
GRANT USAGE ON SCHEMA extensions TO authenticated;
GRANT USAGE ON SCHEMA extensions TO service_role;
GRANT ALL ON SCHEMA extensions TO dashboard_user;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA realtime TO postgres;


--
-- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT ALL ON SCHEMA storage TO postgres;
GRANT USAGE ON SCHEMA storage TO anon;
GRANT USAGE ON SCHEMA storage TO authenticated;
GRANT USAGE ON SCHEMA storage TO service_role;
GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
GRANT ALL ON SCHEMA storage TO dashboard_user;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;
GRANT ALL ON FUNCTION auth.email() TO postgres;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;
GRANT ALL ON FUNCTION auth.role() TO postgres;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;
GRANT ALL ON FUNCTION auth.uid() TO postgres;


--
-- Name: FUNCTION algorithm_sign(signables text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.algorithm_sign(signables text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


--
-- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


--
-- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


--
-- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


--
-- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


--
-- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


--
-- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


--
-- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: postgres
--

REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM postgres;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


--
-- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT blk_read_time double precision, OUT blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


--
-- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint) TO dashboard_user;


--
-- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


--
-- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


--
-- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


--
-- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


--
-- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


--
-- Name: FUNCTION sign(payload json, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.sign(payload json, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION try_cast_double(inp text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.try_cast_double(inp text) TO dashboard_user;


--
-- Name: FUNCTION url_decode(data text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_decode(data text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_decode(data text) TO dashboard_user;


--
-- Name: FUNCTION url_encode(data bytea); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.url_encode(data bytea) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


--
-- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


--
-- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


--
-- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


--
-- Name: FUNCTION verify(token text, secret text, algorithm text); Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO postgres WITH GRANT OPTION;
GRANT ALL ON FUNCTION extensions.verify(token text, secret text, algorithm text) TO dashboard_user;


--
-- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
--

GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


--
-- Name: FUNCTION lo_export(oid, text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_export(oid, text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_export(oid, text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text) TO supabase_admin;


--
-- Name: FUNCTION lo_import(text, oid); Type: ACL; Schema: pg_catalog; Owner: supabase_admin
--

REVOKE ALL ON FUNCTION pg_catalog.lo_import(text, oid) FROM postgres;
GRANT ALL ON FUNCTION pg_catalog.lo_import(text, oid) TO supabase_admin;


--
-- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: postgres
--

REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;


--
-- Name: FUNCTION crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_decrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea); Type: ACL; Schema: pgsodium; Owner: pgsodium_keymaker
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_encrypt(message bytea, additional bytea, key_uuid uuid, nonce bytea) TO service_role;


--
-- Name: FUNCTION crypto_aead_det_keygen(); Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON FUNCTION pgsodium.crypto_aead_det_keygen() TO service_role;


--
-- Name: FUNCTION can_insert_object(bucketid text, name text, owner uuid, metadata jsonb); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) TO postgres;


--
-- Name: FUNCTION extension(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.extension(name text) TO anon;
GRANT ALL ON FUNCTION storage.extension(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.extension(name text) TO service_role;
GRANT ALL ON FUNCTION storage.extension(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.extension(name text) TO postgres;


--
-- Name: FUNCTION filename(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.filename(name text) TO anon;
GRANT ALL ON FUNCTION storage.filename(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.filename(name text) TO service_role;
GRANT ALL ON FUNCTION storage.filename(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.filename(name text) TO postgres;


--
-- Name: FUNCTION foldername(name text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.foldername(name text) TO anon;
GRANT ALL ON FUNCTION storage.foldername(name text) TO authenticated;
GRANT ALL ON FUNCTION storage.foldername(name text) TO service_role;
GRANT ALL ON FUNCTION storage.foldername(name text) TO dashboard_user;
GRANT ALL ON FUNCTION storage.foldername(name text) TO postgres;


--
-- Name: FUNCTION get_size_by_bucket(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.get_size_by_bucket() TO postgres;


--
-- Name: FUNCTION list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) TO postgres;


--
-- Name: FUNCTION list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) TO postgres;


--
-- Name: FUNCTION search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) TO postgres;


--
-- Name: FUNCTION update_updated_at_column(); Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON FUNCTION storage.update_updated_at_column() TO postgres;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.audit_log_entries TO postgres;
GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.flow_state TO postgres;
GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.identities TO postgres;
GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.instances TO postgres;
GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_challenges TO postgres;
GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.mfa_factors TO postgres;
GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.one_time_tokens TO postgres;
GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.refresh_tokens TO postgres;
GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_providers TO postgres;
GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.saml_relay_states TO postgres;
GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.schema_migrations TO postgres;
GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sessions TO postgres;
GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_domains TO postgres;
GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.sso_providers TO postgres;
GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,UPDATE ON TABLE auth.users TO postgres;
GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


--
-- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


--
-- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: supabase_admin
--

GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


--
-- Name: TABLE decrypted_key; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.decrypted_key TO pgsodium_keyholder;


--
-- Name: TABLE masking_rule; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.masking_rule TO pgsodium_keyholder;


--
-- Name: TABLE mask_columns; Type: ACL; Schema: pgsodium; Owner: supabase_admin
--

GRANT ALL ON TABLE pgsodium.mask_columns TO pgsodium_keyholder;


--
-- Name: TABLE activity; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.activity TO anon;
GRANT ALL ON TABLE public.activity TO authenticated;
GRANT ALL ON TABLE public.activity TO service_role;


--
-- Name: SEQUENCE activity_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.activity_id_seq TO anon;
GRANT ALL ON SEQUENCE public.activity_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.activity_id_seq TO service_role;


--
-- Name: TABLE certificate; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.certificate TO anon;
GRANT ALL ON TABLE public.certificate TO authenticated;
GRANT ALL ON TABLE public.certificate TO service_role;


--
-- Name: TABLE experience; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.experience TO anon;
GRANT ALL ON TABLE public.experience TO authenticated;
GRANT ALL ON TABLE public.experience TO service_role;


--
-- Name: SEQUENCE experience_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.experience_id_seq TO anon;
GRANT ALL ON SEQUENCE public.experience_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.experience_id_seq TO service_role;


--
-- Name: TABLE portfolio; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.portfolio TO anon;
GRANT ALL ON TABLE public.portfolio TO authenticated;
GRANT ALL ON TABLE public.portfolio TO service_role;


--
-- Name: SEQUENCE portfolio_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.portfolio_id_seq TO anon;
GRANT ALL ON SEQUENCE public.portfolio_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.portfolio_id_seq TO service_role;


--
-- Name: TABLE user_information; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.user_information TO anon;
GRANT ALL ON TABLE public.user_information TO authenticated;
GRANT ALL ON TABLE public.user_information TO service_role;


--
-- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.buckets TO anon;
GRANT ALL ON TABLE storage.buckets TO authenticated;
GRANT ALL ON TABLE storage.buckets TO service_role;
GRANT ALL ON TABLE storage.buckets TO postgres;


--
-- Name: TABLE migrations; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.migrations TO anon;
GRANT ALL ON TABLE storage.migrations TO authenticated;
GRANT ALL ON TABLE storage.migrations TO service_role;
GRANT ALL ON TABLE storage.migrations TO postgres;


--
-- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.objects TO anon;
GRANT ALL ON TABLE storage.objects TO authenticated;
GRANT ALL ON TABLE storage.objects TO service_role;
GRANT ALL ON TABLE storage.objects TO postgres;


--
-- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads TO postgres;


--
-- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
--

GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;
GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO postgres;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES  TO postgres WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON SEQUENCES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium GRANT ALL ON TABLES  TO pgsodium_keyholder;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON SEQUENCES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON FUNCTIONS  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: pgsodium_masks; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA pgsodium_masks GRANT ALL ON TABLES  TO pgsodium_keyiduser;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES  TO service_role;


--
-- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
         WHEN TAG IN ('DROP EXTENSION')
   EXECUTE FUNCTION extensions.set_graphql_placeholder();


ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

--
-- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_cron_access();


ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

--
-- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
         WHEN TAG IN ('CREATE FUNCTION')
   EXECUTE FUNCTION extensions.grant_pg_graphql_access();


ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

--
-- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: postgres
--

CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
         WHEN TAG IN ('CREATE EXTENSION')
   EXECUTE FUNCTION extensions.grant_pg_net_access();


ALTER EVENT TRIGGER issue_pg_net_access OWNER TO postgres;

--
-- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
   EXECUTE FUNCTION extensions.pgrst_ddl_watch();


ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
--

CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
   EXECUTE FUNCTION extensions.pgrst_drop_watch();


ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--


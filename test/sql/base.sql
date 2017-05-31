\set ECHO none
--------------------------------------------------------------------------------
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the 
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- Provide unit testing for LINZ BDE SCHEMA using pgTAP
--------------------------------------------------------------------------------
\set QUIET true
\set VERBOSITY terse
\pset format unaligned
\pset tuples_only true

SET client_min_messages TO WARNING;

CREATE EXTENSION postgis;

CREATE SCHEMA _patches;
CREATE EXTENSION dbpatch SCHEMA _patches;

\i sql/01-bde_roles.sql
\i sql/02-bde_schema.sql
\i sql/03-bde_functions.sql
\i sql/04-bde_schema_index.sql
\i sql/05-bde_version.sql
\i sql/99-patches.sql

--BEGIN;


--CREATE EXTENSION pgtap;

--SELECT plan(1);
--SELECT * FROM no_plan();

--SELECT * FROM finish();

--ROLLBACK;


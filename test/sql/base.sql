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

BEGIN;

CREATE EXTENSION pgtap;

SELECT * FROM no_plan();

SELECT has_schema('bde'::name);

-- Test roles existance
SELECT has_role('bde_dba');
SELECT has_role('bde_admin');
SELECT has_role('bde_user');

-- Test tables existance
SELECT has_table('bde'::name, 'cbe_title_parcel_association'::name);
SELECT has_table('bde'::name, 'crs_action'::name);
SELECT has_table('bde'::name, 'crs_action_type'::name);
SELECT has_table('bde'::name, 'crs_adj_obs_change'::name);
SELECT has_table('bde'::name, 'crs_adj_user_coef'::name);
SELECT has_table('bde'::name, 'crs_adjust_coef'::name);
SELECT has_table('bde'::name, 'crs_adjust_method'::name);
SELECT has_table('bde'::name, 'crs_adjustment_run'::name);
SELECT has_table('bde'::name, 'crs_adoption'::name);
SELECT has_table('bde'::name, 'crs_affected_parcl'::name);
SELECT has_table('bde'::name, 'crs_alias'::name);
SELECT has_table('bde'::name, 'crs_appellation'::name);
SELECT has_table('bde'::name, 'crs_comprised_in'::name);
SELECT has_table('bde'::name, 'crs_coordinate'::name);
SELECT has_table('bde'::name, 'crs_coordinate_sys'::name);
SELECT has_table('bde'::name, 'crs_coordinate_tpe'::name);
SELECT has_table('bde'::name, 'crs_cor_precision'::name);
SELECT has_table('bde'::name, 'crs_cord_order'::name);
SELECT has_table('bde'::name, 'crs_datum'::name);
SELECT has_table('bde'::name, 'crs_elect_place'::name);
SELECT has_table('bde'::name, 'crs_ellipsoid'::name);
SELECT has_table('bde'::name, 'crs_enc_share'::name);
SELECT has_table('bde'::name, 'crs_encumbrance'::name);
SELECT has_table('bde'::name, 'crs_encumbrancee'::name);
SELECT has_table('bde'::name, 'crs_estate_share'::name);
SELECT has_table('bde'::name, 'crs_feature_name'::name);
SELECT has_table('bde'::name, 'crs_geodetic_network'::name);
SELECT has_table('bde'::name, 'crs_geodetic_node_network'::name);
SELECT has_table('bde'::name, 'crs_image'::name);
SELECT has_table('bde'::name, 'crs_image_history'::name);
SELECT has_table('bde'::name, 'crs_land_district'::name);
SELECT has_table('bde'::name, 'crs_legal_desc'::name);
SELECT has_table('bde'::name, 'crs_legal_desc_prl'::name);
SELECT has_table('bde'::name, 'crs_line'::name);
SELECT has_table('bde'::name, 'crs_locality'::name);
SELECT has_table('bde'::name, 'crs_maintenance'::name);
SELECT has_table('bde'::name, 'crs_map_grid'::name);
SELECT has_table('bde'::name, 'crs_mark'::name);
SELECT has_table('bde'::name, 'crs_mark_name'::name);
SELECT has_table('bde'::name, 'crs_mark_sup_doc'::name);
SELECT has_table('bde'::name, 'crs_mesh_blk'::name);
SELECT has_table('bde'::name, 'crs_mesh_blk_area'::name);
SELECT has_table('bde'::name, 'crs_mesh_blk_bdry'::name);
SELECT has_table('bde'::name, 'crs_mesh_blk_line'::name);
SELECT has_table('bde'::name, 'crs_mesh_blk_place'::name);
SELECT has_table('bde'::name, 'crs_mrk_phys_state'::name);
SELECT has_table('bde'::name, 'crs_network_plan'::name);
SELECT has_table('bde'::name, 'crs_node'::name);
SELECT has_table('bde'::name, 'crs_node_prp_order'::name);
SELECT has_table('bde'::name, 'crs_node_works'::name);
SELECT has_table('bde'::name, 'crs_nominal_index'::name);
SELECT has_table('bde'::name, 'crs_obs_accuracy'::name);
SELECT has_table('bde'::name, 'crs_obs_elem_type'::name);
SELECT has_table('bde'::name, 'crs_obs_set'::name);
SELECT has_table('bde'::name, 'crs_obs_type'::name);
SELECT has_table('bde'::name, 'crs_observation'::name);
SELECT has_table('bde'::name, 'crs_off_cord_sys'::name);
SELECT has_table('bde'::name, 'crs_office'::name);
SELECT has_table('bde'::name, 'crs_ordinate_adj'::name);
SELECT has_table('bde'::name, 'crs_ordinate_type'::name);
SELECT has_table('bde'::name, 'crs_parcel'::name);
SELECT has_table('bde'::name, 'crs_parcel_bndry'::name);
SELECT has_table('bde'::name, 'crs_parcel_dimen'::name);
SELECT has_table('bde'::name, 'crs_parcel_label'::name);
SELECT has_table('bde'::name, 'crs_parcel_ring'::name);
SELECT has_table('bde'::name, 'crs_programme'::name);
SELECT has_table('bde'::name, 'crs_proprietor'::name);
SELECT has_table('bde'::name, 'crs_reduct_meth'::name);
SELECT has_table('bde'::name, 'crs_reduct_run'::name);
SELECT has_table('bde'::name, 'crs_ref_survey'::name);
SELECT has_table('bde'::name, 'crs_road_ctr_line'::name);
SELECT has_table('bde'::name, 'crs_road_name'::name);
SELECT has_table('bde'::name, 'crs_road_name_asc'::name);
SELECT has_table('bde'::name, 'crs_setup'::name);
SELECT has_table('bde'::name, 'crs_site'::name);
SELECT has_table('bde'::name, 'crs_site_locality'::name);
SELECT has_table('bde'::name, 'crs_stat_act_parcl'::name);
SELECT has_table('bde'::name, 'crs_stat_version'::name);
SELECT has_table('bde'::name, 'crs_statist_area'::name);
SELECT has_table('bde'::name, 'crs_statute'::name);
SELECT has_table('bde'::name, 'crs_statute_action'::name);
SELECT has_table('bde'::name, 'crs_street_address'::name);
SELECT has_table('bde'::name, 'crs_sur_admin_area'::name);
SELECT has_table('bde'::name, 'crs_sur_plan_ref'::name);
SELECT has_table('bde'::name, 'crs_survey'::name);
SELECT has_table('bde'::name, 'crs_survey_image'::name);
SELECT has_table('bde'::name, 'crs_sys_code'::name);
SELECT has_table('bde'::name, 'crs_sys_code_group'::name);
SELECT has_table('bde'::name, 'crs_title'::name);
SELECT has_table('bde'::name, 'crs_title_action'::name);
SELECT has_table('bde'::name, 'crs_title_doc_ref'::name);
SELECT has_table('bde'::name, 'crs_title_estate'::name);
SELECT has_table('bde'::name, 'crs_title_mem_text'::name);
SELECT has_table('bde'::name, 'crs_title_memorial'::name);
SELECT has_table('bde'::name, 'crs_topology_class'::name);
SELECT has_table('bde'::name, 'crs_transact_type'::name);
SELECT has_table('bde'::name, 'crs_ttl_enc'::name);
SELECT has_table('bde'::name, 'crs_ttl_hierarchy'::name);
SELECT has_table('bde'::name, 'crs_ttl_inst'::name);
SELECT has_table('bde'::name, 'crs_ttl_inst_title'::name);
SELECT has_table('bde'::name, 'crs_unit_of_meas'::name);
SELECT has_table('bde'::name, 'crs_user'::name);
SELECT has_table('bde'::name, 'crs_vector'::name);
SELECT has_table('bde'::name, 'crs_vertx_sequence'::name);
SELECT has_table('bde'::name, 'crs_work'::name);

-- Test functions existance
SELECT has_function('bde'::name, 'bde_get_app_specific'::name);
SELECT has_function('bde'::name, 'bde_get_charcode'::name);
SELECT has_function('bde'::name, 'bde_get_dataset'::name);
SELECT has_function('bde'::name, 'bde_get_datasource'::name);
SELECT has_function('bde'::name, 'bde_get_desccode'::name);
SELECT has_function('bde'::name, 'bde_get_district'::name);
SELECT has_function('bde'::name, 'bde_get_mrknodename'::name);
SELECT has_function('bde'::name, 'bde_get_markname'::name);
SELECT has_function('bde'::name, 'bde_get_nodename'::name);
SELECT has_function('bde'::name, 'bde_get_nodename'::name);
SELECT has_function('bde'::name, 'bde_get_nodeorder'::name);
SELECT has_function('bde'::name, 'bde_get_office'::name);
SELECT has_function('bde'::name, 'bde_get_roadname'::name);
SELECT has_function('bde'::name, 'bde_get_trtcode'::name);
SELECT has_function('bde'::name, 'bde_get_username'::name);
SELECT has_function('bde'::name, 'bde_get_useroff'::name);
SELECT has_function('bde'::name, 'bde_write_appellation'::name);
SELECT has_function('bde'::name, 'bde_get_combined_appellation'::name);
SELECT has_function('bde'::name, 'bde_get_par_stat_act'::name);
SELECT has_function('bde'::name, 'bde_getnearnodes'::name);
SELECT has_function('bde'::name, 'bde_drop_idle_connections'::name);
SELECT has_function('bde'::name, 'bde_version'::name);

-- Test indexes existance
SELECT has_index('bde'::name, 'crs_appellation'::name, 'fk_app_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_elect_place'::name, 'shx_epl_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_feature_name'::name, 'shx_fen_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_land_district'::name, 'shx_ldt_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_line'::name, 'shx_lin_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_locality'::name, 'shx_loc_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_map_grid'::name, 'shx_map_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_mark_name'::name, 'fk_mkn_mrk'::name, ARRAY['mrk_id']);
SELECT has_index('bde'::name, 'crs_mesh_blk'::name, 'shx_mbk_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_mesh_blk_line'::name, 'shx_mbl_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_node'::name, 'shx_nod_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_off_cord_sys'::name, 'shx_ocs_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_parcel'::name, 'shx_par_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_parcel_label'::name, 'shx_plb_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_road_ctr_line'::name, 'shx_rcl_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_stat_act_parcl'::name, 'fk_sap_sta'::name, ARRAY['sta_id']);
SELECT has_index('bde'::name, 'crs_stat_act_parcl'::name, 'fk_sap_par'::name, ARRAY['par_id']);
SELECT has_index('bde'::name, 'crs_statist_area'::name, 'shx_stt_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_street_address'::name, 'shx_sad_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_sur_plan_ref'::name, 'shx_spf_shape'::name, ARRAY['shape']);
SELECT has_index('bde'::name, 'crs_sys_code'::name, 'fk_sco_scg'::name, ARRAY['scg_code']);
SELECT has_index('bde'::name, 'crs_sys_code'::name, 'fk_sco_scg_code'::name, ARRAY['scg_code', 'code']);
SELECT has_index('bde'::name, 'crs_vector'::name, 'shx_vct_shape'::name, ARRAY['shape']);


SELECT * FROM finish();

ROLLBACK;


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

-- Test roles existance {
SELECT has_role('bde_dba');
SELECT has_role('bde_admin');
SELECT has_role('bde_user');
-- }

-- Test tables existance and their composition {

SELECT has_table('bde'::name, 'cbe_title_parcel_association'::name);
SELECT columns_are('bde'::name, 'cbe_title_parcel_association'::name,
  ARRAY[
  'last_updated',
  'id',
  'ttl_title_no',
  'par_id',
  'source',
  'status',
  'inserted_date'
  ]);

SELECT has_table('bde'::name, 'crs_action'::name);
SELECT columns_are('bde'::name, 'crs_action'::name,
ARRAY[
  'act_tin_id_orig',
  'flags',
  'mode',
  'ste_id',
  'audit_id',
  'source',
  'tin_id',
  'id',
  'sequence',
  'att_type',
  'system_action',
  'act_id_orig'
  ]);

SELECT has_table('bde'::name, 'crs_action_type'::name);
SELECT columns_are('bde'::name, 'crs_action_type'::name,
ARRAY[
  'type',
  'description',
  'system_action',
  'sob_name',
  'existing_inst',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_adj_obs_change'::name);
SELECT columns_are('bde'::name, 'crs_adj_obs_change'::name,
ARRAY[
  'redundancy_fctr_3',
  'audit_id',
  'v_accuracy',
  'h_max_azimuth',
  'h_min_accuracy',
  'h_max_accuracy',
  'reliability',
  'exclude',
  'summary_std_dev',
  'acc_multiplier',
  'geodetic_class',
  'residual_1',
  'residual_std_dev_1',
  'redundancy_fctr_1',
  'residual_2',
  'residual_std_dev_2',
  'redundancy_fctr_2',
  'residual_3',
  'residual_std_dev_3',
  'summary_residual',
  'adj_id',
  'obn_id',
  'orig_status',
  'proposed_status'
  ]);

SELECT has_table('bde'::name, 'crs_adj_user_coef'::name);
SELECT columns_are('bde'::name, 'crs_adj_user_coef'::name,
ARRAY[
  'adc_id',
  'adj_id',
  'value',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_adjust_coef'::name);
SELECT columns_are('bde'::name, 'crs_adjust_coef'::name,
ARRAY[
  'id',
  'adm_id',
  'default_value',
  'description',
  'sequence',
  'coef_code',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_adjustment_run'::name);
SELECT columns_are('bde'::name, 'crs_adjust_method'::name,
ARRAY[
  'type',
  'id',
  'status',
  'software_used',
  'name',
  'audit_id',
  'description'
  ]);

SELECT has_table('bde'::name, 'crs_adjust_method'::name);
SELECT columns_are('bde'::name, 'crs_adjustment_run'::name,
ARRAY[
  'id',
  'cos_id',
  'usr_id_exec',
  'adjust_datetime',
  'wrk_id',
  'description',
  'sum_sqrd_residuals',
  'redundancy',
  'adm_id',
  'audit_id',
  'preview_datetime',
  'adj_obn_status_decom',
  'adj_nod_status_decom',
  'status'
  ]);

SELECT has_table('bde'::name, 'crs_adoption'::name);
SELECT columns_are('bde'::name, 'crs_adoption'::name,
ARRAY[
  'audit_id',
  'factor_3',
  'factor_2',
  'factor_1',
  'sur_wrk_id_orig',
  'obn_id_orig',
  'obn_id_new'
  ]);

SELECT has_table('bde'::name, 'crs_affected_parcl'::name);
SELECT columns_are('bde'::name, 'crs_affected_parcl'::name,
ARRAY[
  'action',
  'sur_wrk_id',
  'audit_id',
  'par_id'
  ]);

SELECT has_table('bde'::name, 'crs_alias'::name);
SELECT columns_are('bde'::name, 'crs_alias'::name,
ARRAY[
  'prp_id',
  'id',
  'other_names',
  'surname'
  ]);

SELECT has_table('bde'::name, 'crs_appellation'::name);
SELECT columns_are('bde'::name, 'crs_appellation'::name,
ARRAY[
  'second_prcl_value',
  'parcel_type',
  'appellation_value',
  'sub_type',
  'maori_name',
  'survey',
  'part_indicator',
  'status',
  'second_parcel_type',
  'parcel_value',
  'block_number',
  'sub_type_position',
  'other_appellation',
  'act_id_crt',
  'act_tin_id_crt',
  'act_id_ext',
  'act_tin_id_ext',
  'id',
  'audit_id',
  'type',
  'title',
  'par_id'
  ]);

SELECT has_table('bde'::name, 'crs_comprised_in'::name);
SELECT columns_are('bde'::name, 'crs_comprised_in'::name,
ARRAY[
  'wrk_id',
  'limited',
  'id',
  'reference',
  'type'
  ]);

SELECT has_table('bde'::name, 'crs_coordinate'::name);
SELECT columns_are('bde'::name, 'crs_coordinate'::name,
ARRAY[
  'sdc_status',
  'source',
  'value1',
  'value2',
  'value3',
  'wrk_id_created',
  'cor_id',
  'audit_id',
  'id',
  'nod_id',
  'cos_id',
  'ort_type_1',
  'ort_type_2',
  'ort_type_3',
  'status'
  ]);

SELECT has_table('bde'::name, 'crs_coordinate_sys'::name);
SELECT columns_are('bde'::name, 'crs_coordinate_sys'::name,
ARRAY[
  'cot_id',
  'id',
  'dtm_id',
  'cos_id_adjust',
  'name',
  'initial_sta_name',
  'code',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_coordinate_tpe'::name);
SELECT columns_are('bde'::name, 'crs_coordinate_tpe'::name,
ARRAY[
  'category',
  'audit_id',
  'ord_2_max',
  'ord_2_min',
  'ord_1_max',
  'ord_1_min',
  'id',
  'name',
  'dimension',
  'status',
  'ort_type_1',
  'ort_type_2',
  'ort_type_3',
  'data',
  'ord_3_max',
  'ord_3_min'
  ]);

SELECT has_table('bde'::name, 'crs_cord_order'::name);
SELECT columns_are('bde'::name, 'crs_cor_precision'::name,
ARRAY[
  'cor_id',
  'ort_type',
  'decimal_places',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_cor_precision'::name);
SELECT columns_are('bde'::name, 'crs_cord_order'::name,
ARRAY[
  'dtm_id',
  'order_group',
  'error',
  'audit_id',
  'id',
  'display',
  'description'
  ]);

SELECT has_table('bde'::name, 'crs_datum'::name);
SELECT columns_are('bde'::name, 'crs_datum'::name,
ARRAY[
  'type',
  'id',
  'name',
  'dimension',
  'ref_datetime',
  'status',
  'elp_id',
  'ref_datum_code',
  'code',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_elect_place'::name);
SELECT columns_are('bde'::name, 'crs_elect_place'::name,
ARRAY[
  'shape',
  'se_row_id',
  'audit_id',
  'status',
  'location',
  'name',
  'alt_id',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_ellipsoid'::name);
SELECT columns_are('bde'::name, 'crs_ellipsoid'::name,
ARRAY[
  'semi_major_axis',
  'flattening',
  'audit_id',
  'id',
  'name'
  ]);

SELECT has_table('bde'::name, 'crs_enc_share'::name);
SELECT columns_are('bde'::name, 'crs_enc_share'::name,
ARRAY[
  'system_crt',
  'system_ext',
  'id',
  'status',
  'enc_id',
  'act_tin_id_crt',
  'act_id_crt',
  'act_id_ext',
  'act_tin_id_ext'
  ]);

SELECT has_table('bde'::name, 'crs_encumbrancee'::name);
SELECT columns_are('bde'::name, 'crs_encumbrance'::name,
ARRAY[
  'term',
  'id',
  'status',
  'act_tin_id_orig',
  'act_tin_id_crt',
  'act_id_crt',
  'act_id_orig',
  'ind_tan_holder'
  ]);

SELECT has_table('bde'::name, 'crs_encumbrance'::name);
SELECT columns_are('bde'::name, 'crs_encumbrancee'::name,
ARRAY[
  'id',
  'ens_id',
  'status',
  'name',
  'system_ext',
  'usr_id'
  ]);

SELECT has_table('bde'::name, 'crs_estate_share'::name);
SELECT columns_are('bde'::name, 'crs_estate_share'::name,
ARRAY[
  'act_id_ext',
  'act_tin_id_ext',
  'executorship',
  'original_flag',
  'sort_order',
  'system_crt',
  'ett_id',
  'transferee_group',
  'system_ext',
  'share',
  'status',
  'share_memorial',
  'act_tin_id_crt',
  'act_id_crt',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_feature_name'::name);
SELECT columns_are('bde'::name, 'crs_feature_name'::name,
ARRAY[
  'shape',
  'id',
  'audit_id',
  'other_details',
  'status',
  'name',
  'type',
  'se_row_id'
  ]);

SELECT has_table('bde'::name, 'crs_geodetic_network'::name);
SELECT columns_are('bde'::name, 'crs_geodetic_network'::name,
ARRAY[
  'description',
  'code',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_geodetic_node_network'::name);
SELECT columns_are('bde'::name, 'crs_geodetic_node_network'::name,
ARRAY[
  'audit_id',
  'gdn_id',
  'nod_id'
  ]);

SELECT has_table('bde'::name, 'crs_image_history'::name);
SELECT columns_are('bde'::name, 'crs_image'::name,
ARRAY[
  'usr_id_created',
  'barcode_datetime',
  'ims_id',
  'ims_date',
  'pages',
  'centera_id',
  'location',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_image'::name);
SELECT columns_are('bde'::name, 'crs_image_history'::name,
ARRAY[
  'usr_id',
  'centera_id',
  'pages',
  'ims_date',
  'ims_id',
  'img_id',
  'id',
  'centera_datetime'
  ]);

SELECT has_table('bde'::name, 'crs_land_district'::name);
SELECT columns_are('bde'::name, 'crs_land_district'::name,
ARRAY[
  'default',
  'loc_id',
  'off_code',
  'audit_id',
  'se_row_id',
  'usr_tm_id',
  'shape'
  ]);

SELECT has_table('bde'::name, 'crs_legal_desc'::name);
SELECT columns_are('bde'::name, 'crs_legal_desc'::name,
ARRAY[
  'legal_desc_text',
  'ttl_title_no',
  'total_area',
  'type',
  'status',
  'audit_id',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_legal_desc_prl'::name);
SELECT columns_are('bde'::name, 'crs_legal_desc_prl'::name,
ARRAY[
  'audit_id',
  'sur_wrk_id_crt',
  'part_affected',
  'sequence',
  'par_id',
  'share',
  'lgd_id'
  ]);

SELECT has_table('bde'::name, 'crs_line'::name);
SELECT columns_are('bde'::name, 'crs_line'::name,
ARRAY[
  'arc_length',
  'pnx_id_created',
  'dcdb_feature',
  'id',
  'audit_id',
  'se_row_id',
  'shape',
  'boundary',
  'type',
  'description',
  'nod_id_end',
  'nod_id_start',
  'arc_radius',
  'arc_direction'
  ]);

SELECT has_table('bde'::name, 'crs_locality'::name);
SELECT columns_are('bde'::name, 'crs_locality'::name,
ARRAY[
  'shape',
  'id',
  'type',
  'name',
  'loc_id_parent',
  'audit_id',
  'se_row_id'
  ]);

SELECT has_table('bde'::name, 'crs_maintenance'::name);
SELECT columns_are('bde'::name, 'crs_maintenance'::name,
ARRAY[
  'type',
  'status',
  'desc',
  'complete_date',
  'audit_id',
  'mrk_id'
  ]);

SELECT has_table('bde'::name, 'crs_map_grid'::name);
SELECT columns_are('bde'::name, 'crs_map_grid'::name,
ARRAY[
  'major_grid',
  'minor_grid',
  'se_row_id',
  'audit_id',
  'shape'
  ]);

SELECT has_table('bde'::name, 'crs_mark'::name);
SELECT columns_are('bde'::name, 'crs_mark'::name,
ARRAY[
  'id',
  'protection_type',
  'maintenance_level',
  'mrk_id_dist',
  'disturbed',
  'disturbed_date',
  'mrk_id_repl',
  'wrk_id_created',
  'replaced',
  'replaced_date',
  'mark_annotation',
  'audit_id',
  'type',
  'status',
  'nod_id',
  'beacon_type',
  'country',
  'category',
  'desc'
  ]);

SELECT has_table('bde'::name, 'crs_mark_name'::name);
SELECT columns_are('bde'::name, 'crs_mark_name'::name,
ARRAY[
  'mrk_id',
  'type',
  'name',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_mark_sup_doc'::name);
SELECT columns_are('bde'::name, 'crs_mark_sup_doc'::name,
ARRAY[
  'sud_id',
  'mrk_id',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_mesh_blk_area'::name);
SELECT columns_are('bde'::name, 'crs_mesh_blk'::name,
ARRAY[
  'shape',
  'id',
  'alt_id',
  'code',
  'start_datetime',
  'end_datetime',
  'audit_id',
  'se_row_id'
  ]);

SELECT has_table('bde'::name, 'crs_mesh_blk_bdry'::name);
SELECT columns_are('bde'::name, 'crs_mesh_blk_area'::name,
ARRAY[
  'mbk_id',
  'audit_id',
  'alt_id',
  'stt_id'
  ]);

SELECT has_table('bde'::name, 'crs_mesh_blk_line'::name);
SELECT columns_are('bde'::name, 'crs_mesh_blk_bdry'::name,
ARRAY[
  'audit_id',
  'mbk_id',
  'mbl_id',
  'alt_id'
  ]);

SELECT has_table('bde'::name, 'crs_mesh_blk'::name);
SELECT columns_are('bde'::name, 'crs_mesh_blk_line'::name,
ARRAY[
  'shape',
  'line_type',
  'id',
  'audit_id',
  'se_row_id',
  'alt_id',
  'status'
  ]);

SELECT has_table('bde'::name, 'crs_mesh_blk_place'::name);
SELECT columns_are('bde'::name, 'crs_mesh_blk_place'::name,
ARRAY[
  'mbk_id',
  'alt_id',
  'audit_id',
  'epl_id'
  ]);

SELECT has_table('bde'::name, 'crs_mrk_phys_state'::name);
SELECT columns_are('bde'::name, 'crs_mrk_phys_state'::name,
ARRAY[
  'mrk_id',
  'pend_replaced',
  'pend_disturbed',
  'mrk_id_pend_rep',
  'mrk_id_pend_dist',
  'pend_dist_date',
  'pend_repl_date',
  'pend_mark_name',
  'pend_mark_type',
  'pend_mark_ann',
  'description',
  'latest_condition',
  'latest_cond_date',
  'pend_altr_name',
  'pend_bcon_type',
  'pend_hist_name',
  'pend_mrk_desc',
  'pend_othr_name',
  'pend_prot_type',
  'audit_id',
  'ref_datetime',
  'status',
  'existing_mark',
  'condition',
  'type',
  'wrk_id',
  'pend_mark_status'
  ]);

SELECT has_table('bde'::name, 'crs_network_plan'::name);
SELECT columns_are('bde'::name, 'crs_network_plan'::name,
ARRAY[
  'dtm_id',
  'id',
  'type',
  'status',
  'datum_order',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_node'::name);
SELECT columns_are('bde'::name, 'crs_node'::name,
ARRAY[
  'order_group_off',
  'sit_id',
  'alt_id',
  'shape',
  'se_row_id',
  'audit_id',
  'wrk_id_created',
  'id',
  'cos_id_official',
  'type',
  'status'
  ]);

SELECT has_table('bde'::name, 'crs_node_prp_order'::name);
SELECT columns_are('bde'::name, 'crs_node_prp_order'::name,
ARRAY[
  'cor_id',
  'nod_id',
  'dtm_id',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_node_works'::name);
SELECT columns_are('bde'::name, 'crs_node_works'::name,
ARRAY[
  'adopted',
  'nod_id',
  'pend_node_status',
  'wrk_id',
  'audit_id',
  'purpose'
  ]);

SELECT has_table('bde'::name, 'crs_nominal_index'::name);
SELECT columns_are('bde'::name, 'crs_nominal_index'::name,
ARRAY[
  'dlg_id_ext',
  'dlg_id_hst',
  'significance',
  'system_ext',
  'id',
  'ttl_title_no',
  'status',
  'name_type',
  'corporate_name',
  'surname',
  'other_names',
  'prp_id',
  'dlg_id_crt'
  ]);

SELECT has_table('bde'::name, 'crs_obs_accuracy'::name);
SELECT columns_are('bde'::name, 'crs_obs_accuracy'::name,
ARRAY[
  'value_31',
  'obn_id1',
  'obn_id2',
  'value_11',
  'value_12',
  'value_13',
  'value_21',
  'value_22',
  'value_23',
  'value_32',
  'value_33',
  'id',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_obs_elem_type'::name);
SELECT columns_are('bde'::name, 'crs_obs_elem_type'::name,
ARRAY[
  'type',
  'audit_id',
  'format_code',
  'uom_code',
  'description'
  ]);

SELECT has_table('bde'::name, 'crs_observation'::name);
SELECT columns_are('bde'::name, 'crs_obs_set'::name,
ARRAY[
  'audit_id',
  'type',
  'id',
  'reason'
  ]);

SELECT has_table('bde'::name, 'crs_obs_set'::name);
SELECT columns_are('bde'::name, 'crs_obs_type'::name,
ARRAY[
  'time_reqd',
  'type',
  'sub_type',
  'vector_type',
  'oet_type_1',
  'oet_type_2',
  'oet_type_3',
  'description',
  'datum_reqd',
  'trajectory_reqd',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_obs_type'::name);
SELECT columns_are('bde'::name, 'crs_observation'::name,
ARRAY[
  'arc_direction',
  'vct_id',
  'ref_datetime',
  'acc_multiplier',
  'status',
  'geodetic_class',
  'cadastral_class',
  'surveyed_class',
  'value_1',
  'value_2',
  'value_3',
  'arc_radius',
  'rdn_id',
  'obn_id_amendment',
  'code',
  'audit_id',
  'cos_id',
  'obs_id',
  'stp_id_remote',
  'stp_id_local',
  'obt_sub_type',
  'obt_type',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_off_cord_sys'::name);
SELECT columns_are('bde'::name, 'crs_off_cord_sys'::name,
ARRAY[
  'cos_id',
  'description',
  'audit_id',
  'se_row_id',
  'shape',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_office'::name);
SELECT columns_are('bde'::name, 'crs_office'::name,
ARRAY[
  'fax',
  'internet',
  'postal_address',
  'postal_address_prefix',
  'postal_address_suffix',
  'postal_address_town',
  'postal_country',
  'postal_dx_box',
  'postal_postcode',
  'printer_name',
  'telephone',
  'audit_id',
  'name',
  'code',
  'rcs_name',
  'cis_name',
  'alloc_source_table',
  'display_in_dropdowns',
  'display_in_treeview'
  ]);

SELECT has_table('bde'::name, 'crs_ordinate_adj'::name);
SELECT columns_are('bde'::name, 'crs_ordinate_adj'::name,
ARRAY[
  'audit_id',
  'adj_id',
  'coo_id_source',
  'sdc_status_prop',
  'coo_id_output',
  'constraint',
  'rejected',
  'adjust_fixed',
  'cor_id_prop',
  'change_east',
  'change_north',
  'change_height',
  'h_max_accuracy',
  'h_min_accuracy',
  'h_max_azimuth',
  'v_accuracy'
  ]);

SELECT has_table('bde'::name, 'crs_ordinate_type'::name);
SELECT columns_are('bde'::name, 'crs_ordinate_type'::name,
ARRAY[
  'description',
  'audit_id',
  'mandatory',
  'format_code',
  'uom_code',
  'type'
  ]);

SELECT has_table('bde'::name, 'crs_parcel_bndry'::name);
SELECT columns_are('bde'::name, 'crs_parcel'::name,
ARRAY[
  'nonsurvey_def',
  'appellation_date',
  'parcel_intent',
  'img_id',
  'fen_id',
  'toc_code',
  'alt_id',
  'area',
  'ldt_loc_id',
  'id',
  'shape',
  'se_row_id',
  'audit_id',
  'calculated_area',
  'total_area',
  'status'
  ]);

SELECT has_table('bde'::name, 'crs_parcel_dimen'::name);
SELECT columns_are('bde'::name, 'crs_parcel_bndry'::name,
ARRAY[
  'pri_id',
  'reversed',
  'lin_id',
  'sequence',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_parcel_label'::name);
SELECT columns_are('bde'::name, 'crs_parcel_dimen'::name,
ARRAY[
  'audit_id',
  'obn_id',
  'par_id'
  ]);

SELECT has_table('bde'::name, 'crs_parcel'::name);
SELECT columns_are('bde'::name, 'crs_parcel_label'::name,
ARRAY[
  'se_row_id',
  'id',
  'par_id',
  'audit_id',
  'shape'
  ]);

SELECT has_table('bde'::name, 'crs_parcel_ring'::name);
SELECT columns_are('bde'::name, 'crs_parcel_ring'::name,
ARRAY[
  'id',
  'is_ring',
  'pri_id_parent_ring',
  'audit_id',
  'par_id'
  ]);

SELECT has_table('bde'::name, 'crs_programme'::name);
SELECT columns_are('bde'::name, 'crs_programme'::name,
ARRAY[
  'id',
  'status',
  'type',
  'account_id',
  'sched_start',
  'purpose',
  'cost_centre',
  'finance_year_date',
  'usr_id',
  'sched_end',
  'nwp_id',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_proprietor'::name);
SELECT columns_are('bde'::name, 'crs_proprietor'::name,
ARRAY[
  'minor',
  'minor_dob',
  'name_suffix',
  'original_flag',
  'sort_order',
  'system_ext',
  'corporate_name',
  'type',
  'status',
  'ets_id',
  'id',
  'prime_other_names',
  'prime_surname'
  ]);

SELECT has_table('bde'::name, 'crs_reduct_meth'::name);
SELECT columns_are('bde'::name, 'crs_reduct_meth'::name,
ARRAY[
  'id',
  'status',
  'description',
  'name',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_reduct_run'::name);
SELECT columns_are('bde'::name, 'crs_reduct_run'::name,
ARRAY[
  'id',
  'rdm_id',
  'datetime',
  'description',
  'traj_type',
  'usr_id_exec',
  'software_used',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_ref_survey'::name);
SELECT columns_are('bde'::name, 'crs_ref_survey'::name,
ARRAY[
  'sur_wrk_id_new',
  'bearing_corr',
  'audit_id',
  'sur_wrk_id_exist'
  ]);

SELECT has_table('bde'::name, 'crs_road_ctr_line'::name);
SELECT columns_are('bde'::name, 'crs_road_ctr_line'::name,
ARRAY[
  'status',
  'shape',
  'se_row_id',
  'audit_id',
  'non_cadastral_rd',
  'id',
  'alt_id'
  ]);

SELECT has_table('bde'::name, 'crs_road_name_asc'::name);
SELECT columns_are('bde'::name, 'crs_road_name'::name,
ARRAY[
  'sufi',
  'id',
  'alt_id',
  'type',
  'name',
  'location',
  'status',
  'unofficial_flag',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_road_name'::name);
SELECT columns_are('bde'::name, 'crs_road_name_asc'::name,
ARRAY[
  'rna_id',
  'rcl_id',
  'alt_id',
  'priority',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_setup'::name);
SELECT columns_are('bde'::name, 'crs_setup'::name,
ARRAY[
  'type',
  'valid_flag',
  'equipment_type',
  'wrk_id',
  'audit_id',
  'nod_id',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_site_locality'::name);
SELECT columns_are('bde'::name, 'crs_site'::name,
ARRAY[
  'id',
  'type',
  'wrk_id_created',
  'desc',
  'occupier',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_site'::name);
SELECT columns_are('bde'::name, 'crs_site_locality'::name,
ARRAY[
  'loc_id',
  'audit_id',
  'sit_id'
  ]);

SELECT has_table('bde'::name, 'crs_stat_act_parcl'::name);
SELECT columns_are('bde'::name, 'crs_stat_act_parcl'::name,
ARRAY[
  'audit_id',
  'name',
  'purpose',
  'action',
  'status',
  'par_id',
  'sta_id',
  'comments'
  ]);

SELECT has_table('bde'::name, 'crs_statist_area'::name);
SELECT columns_are('bde'::name, 'crs_stat_version'::name,
ARRAY[
  'version',
  'area_class',
  'desc',
  'statute_action',
  'start_date',
  'end_date',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_statute_action'::name);
SELECT columns_are('bde'::name, 'crs_statist_area'::name,
ARRAY[
  'name',
  'name_abrev',
  'code',
  'status',
  'sav_version',
  'sav_area_class',
  'shape',
  'audit_id',
  'se_row_id',
  'alt_id',
  'usr_id_firm_ta',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_statute'::name);
SELECT columns_are('bde'::name, 'crs_statute'::name,
ARRAY[
  'in_force_date',
  'name_and_date',
  'section',
  'repeal_date',
  'type',
  'default',
  'audit_id',
  'id',
  'still_in_force'
  ]);

SELECT has_table('bde'::name, 'crs_stat_version'::name);
SELECT columns_are('bde'::name, 'crs_statute_action'::name,
ARRAY[
  'status',
  'sur_wrk_id_vesting',
  'gazette_year',
  'gazette_page',
  'gazette_type',
  'other_legality',
  'recorded_date',
  'id',
  'audit_id',
  'gazette_notice_id',
  'type',
  'ste_id'
  ]);

SELECT has_table('bde'::name, 'crs_street_address'::name);
SELECT columns_are('bde'::name, 'crs_street_address'::name,
ARRAY[
  'audit_id',
  'house_number',
  'range_low',
  'range_high',
  'status',
  'unofficial_flag',
  'rcl_id',
  'rna_id',
  'alt_id',
  'id',
  'se_row_id',
  'sufi',
  'overridden_mbk_code',
  'mbk_code',
  'shape'
  ]);

SELECT has_table('bde'::name, 'crs_sur_admin_area'::name);
SELECT columns_are('bde'::name, 'crs_sur_admin_area'::name,
ARRAY[
  'sur_wrk_id',
  'audit_id',
  'eed_req_id',
  'xstt_id',
  'stt_id'
  ]);

SELECT has_table('bde'::name, 'crs_sur_plan_ref'::name);
SELECT columns_are('bde'::name, 'crs_sur_plan_ref'::name,
ARRAY[
  'shape',
  'wrk_id',
  'id',
  'se_row_id'
  ]);

SELECT has_table('bde'::name, 'crs_survey_image'::name);
SELECT columns_are('bde'::name, 'crs_survey'::name,
ARRAY[
  'dlr_amnd_date',
  'wrk_id',
  'ldt_loc_id',
  'dataset_series',
  'dataset_id',
  'type_of_dataset',
  'data_source',
  'lodge_order',
  'dataset_suffix',
  'surveyor_data_ref',
  'survey_class',
  'description',
  'usr_id_sol',
  'survey_date',
  'certified_date',
  'registered_date',
  'chf_sur_amnd_date',
  'cadastral_surv_acc',
  'prior_wrk_id',
  'abey_prior_status',
  'fhr_id',
  'pnx_id_submitted',
  'audit_id',
  'usr_id_sol_firm',
  'sig_id',
  'xml_uploaded',
  'xsv_id'
  ]);

SELECT has_table('bde'::name, 'crs_survey'::name);
SELECT columns_are('bde'::name, 'crs_survey_image'::name,
ARRAY[
  'type',
  'sur_wrk_id',
  'img_id',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_sys_code_group'::name);
SELECT columns_are('bde'::name, 'crs_sys_code'::name,
ARRAY[
  'start_date',
  'end_date',
  'audit_id',
  'status',
  'date_value',
  'char_value',
  'num_value',
  'desc',
  'code',
  'scg_code'
  ]);

SELECT has_table('bde'::name, 'crs_sys_code'::name);
SELECT columns_are('bde'::name, 'crs_sys_code_group'::name,
ARRAY[
  'code',
  'audit_id',
  'user_modify_flag',
  'user_create_flag',
  'desc',
  'user_delete_flag',
  'user_view_flag',
  'data_type',
  'group_type'
  ]);

SELECT has_table('bde'::name, 'crs_title_action'::name);
SELECT columns_are('bde'::name, 'crs_title'::name,
ARRAY[
  'ttl_title_no_head_srs',
  'title_no',
  'ldt_loc_id',
  'register_type',
  'ste_id',
  'issue_date',
  'guarantee_status',
  'status',
  'duplicate',
  'duplicate_version',
  'duplicate_status',
  'type',
  'provisional',
  'sur_wrk_id',
  'sur_wrk_id_preallc',
  'ttl_title_no_srs',
  'conversion_reason',
  'protect_start',
  'protect_end',
  'protect_reference',
  'phy_prod_no',
  'dlg_id',
  'alt_id',
  'audit_id',
  'maori_land',
  'no_survivorship'
  ]);

SELECT has_table('bde'::name, 'crs_title_doc_ref'::name);
SELECT columns_are('bde'::name, 'crs_title_action'::name,
ARRAY[
  'audit_id',
  'ttl_title_no',
  'act_tin_id',
  'act_id'
  ]);

SELECT has_table('bde'::name, 'crs_title_estate'::name);
SELECT columns_are('bde'::name, 'crs_title_doc_ref'::name,
ARRAY[
  'type',
  'tin_id',
  'id',
  'reference_no'
  ]);

SELECT has_table('bde'::name, 'crs_title_memorial'::name);
SELECT columns_are('bde'::name, 'crs_title_estate'::name,
ARRAY[
  'type',
  'ttl_title_no',
  'id',
  'tin_id_orig',
  'act_tin_id_ext',
  'share',
  'lgd_id',
  'status',
  'term',
  'original_flag',
  'timeshare_week_no',
  'act_id_ext',
  'purpose',
  'act_tin_id_crt',
  'act_id_crt'
  ]);

SELECT has_table('bde'::name, 'crs_title_mem_text'::name);
SELECT columns_are('bde'::name, 'crs_title_mem_text'::name,
ARRAY[
  'audit_id',
  'col_1_text',
  'col_2_text',
  'col_3_text',
  'col_4_text',
  'std_text',
  'col_5_text',
  'col_6_text',
  'col_7_text',
  'curr_hist_flag',
  'sequence_no',
  'ttm_id'
  ]);

SELECT has_table('bde'::name, 'crs_title'::name);
SELECT columns_are('bde'::name, 'crs_title_memorial'::name,
ARRAY[
  'col_6_size',
  'id',
  'ttl_title_no',
  'mmt_code',
  'act_id_orig',
  'act_tin_id_orig',
  'act_id_crt',
  'act_tin_id_crt',
  'status',
  'user_changed',
  'text_type',
  'register_only_mem',
  'prev_further_reg',
  'curr_hist_flag',
  'default',
  'number_of_cols',
  'col_1_size',
  'col_2_size',
  'col_3_size',
  'col_4_size',
  'col_5_size',
  'col_7_size',
  'act_id_ext',
  'act_tin_id_ext'
  ]);

SELECT has_table('bde'::name, 'crs_topology_class'::name);
SELECT columns_are('bde'::name, 'crs_topology_class'::name,
ARRAY[
  'audit_id',
  'name',
  'type',
  'code'
  ]);

SELECT has_table('bde'::name, 'crs_transact_type'::name);
SELECT columns_are('bde'::name, 'crs_transact_type'::name,
ARRAY[
  'partial_discharge',
  'grp',
  'type',
  'description',
  'category',
  'plan_type',
  'unit_plan',
  'prov_alloc_ct',
  'ct_duplicate_req',
  'register_only_mem',
  'prevents_reg',
  'audit_id',
  'curr',
  'tan_required',
  'creates_tan',
  'electronic',
  'fees_exempt_allw',
  'trt_type_discrg',
  'trt_grp_discrg',
  'sob_name',
  'holder',
  'linked_to',
  'tran_id_reqd',
  'advertise',
  'default_reg_status',
  'a_and_i_required',
  'always_image_button',
  'always_text_button',
  'current_lodge_method',
  'default_lodge_method',
  'dep_plan_instrument',
  'discrg_type',
  'display_sequence',
  'encee_holder',
  'encor_holder',
  'internal_only',
  'internal_request',
  'lead_processor',
  'new_title_instrument',
  'no_title_req',
  'post_reg_default',
  'post_reg_view',
  'request_workflow_assignment',
  'short_name',
  'submitting_firm_only',
  'view_in_search_tree'
  ]);

SELECT has_table('bde'::name, 'crs_ttl_enc'::name);
SELECT columns_are('bde'::name, 'crs_ttl_enc'::name,
ARRAY[
  'act_tin_id_ext',
  'act_id_ext',
  'act_id_crt',
  'act_tin_id_crt',
  'status',
  'enc_id',
  'ttl_title_no',
  'id'
  ]);

SELECT has_table('bde'::name, 'crs_ttl_hierarchy'::name);
SELECT columns_are('bde'::name, 'crs_ttl_hierarchy'::name,
ARRAY[
  'act_id_ext',
  'act_tin_id_ext',
  'id',
  'status',
  'ttl_title_no_prior',
  'ttl_title_no_flw',
  'tdr_id',
  'act_tin_id_crt',
  'act_id_crt'
  ]);

SELECT has_table('bde'::name, 'crs_ttl_inst'::name);
SELECT columns_are('bde'::name, 'crs_ttl_inst'::name,
ARRAY[
  'dlg_id',
  'id',
  'inst_no',
  'trt_grp',
  'trt_type',
  'ldt_loc_id',
  'status',
  'lodged_datetime',
  'priority_no',
  'img_id',
  'pro_id',
  'completion_date',
  'usr_id_approve',
  'tin_id_parent',
  'audit_id',
  'dm_covenant_flag',
  'advertise',
  'image_count',
  'img_id_sec',
  'inst_ldg_type',
  'next_lodge_new_req',
  'next_lodge_prev_req_cnt',
  'reject_resub_no',
  'req_changed',
  'requisition_resub_no',
  'ttin_id',
  'ttin_new_rej'
  ]);

SELECT has_table('bde'::name, 'crs_ttl_inst_title'::name);
SELECT columns_are('bde'::name, 'crs_ttl_inst_title'::name,
ARRAY[
  'tin_id',
  'ttl_title_no',
  'created_by_inst',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_unit_of_meas'::name);
SELECT columns_are('bde'::name, 'crs_unit_of_meas'::name,
ARRAY[
  'code',
  'description',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_user'::name);
SELECT columns_are('bde'::name, 'crs_user'::name,
ARRAY[
  'usr_id_coordinator',
  'corporate_name',
  'contact_title',
  'contact_given_name',
  'contact_surname',
  'email_address',
  'cus_credit_status',
  'cus_account_ref',
  'geo_accr_status',
  'suv_auth_ref',
  'int_employee_code',
  'sup_agency_type',
  'int_max_hold',
  'prob_status',
  'audit_id',
  'login',
  'login_type',
  'id',
  'news_account_no',
  'land_district',
  'cus_acc_credit_lim',
  'cus_acc_balance',
  'linked_tan_firm',
  'usr_id_parent',
  'system_manager',
  'quick_code',
  'scrambled',
  'addr_country',
  'addr_street',
  'addr_town',
  'fax',
  'mobile_phone',
  'phone',
  'postal_address',
  'postal_address_town',
  'postal_country',
  'postal_dx_box',
  'postal_postcode',
  'postal_recipient_prefix',
  'postal_recipient_suffix',
  'preferred_name',
  'single_pref_contact',
  'sup_competency_det',
  'default_theme',
  'type',
  'status',
  'title',
  'given_names',
  'surname',
  'off_code'
  ]);

SELECT has_table('bde'::name, 'crs_vector'::name);
SELECT columns_are('bde'::name, 'crs_vector'::name,
ARRAY[
  'nod_id_end',
  'length',
  'source',
  'id',
  'audit_id',
  'se_row_id',
  'shape',
  'type',
  'nod_id_start'
  ]);

SELECT has_table('bde'::name, 'crs_vertx_sequence'::name);
SELECT columns_are('bde'::name, 'crs_vertx_sequence'::name,
ARRAY[
  'value2',
  'lin_id',
  'sequence',
  'value1',
  'audit_id'
  ]);

SELECT has_table('bde'::name, 'crs_work'::name);
SELECT columns_are('bde'::name, 'crs_work'::name,
ARRAY[
  'usr_id_principal',
  'cel_id',
  'project_name',
  'invoice',
  'external_work_id',
  'view_txn',
  'restricted',
  'lodged_date',
  'authorised_date',
  'usr_id_authorised',
  'validated_date',
  'usr_id_validated',
  'cos_id',
  'data_loaded',
  'run_auto_rules',
  'alt_id',
  'audit_id',
  'usr_id_prin_firm',
  'manual_rules',
  'annotations',
  'trv_id',
  'usr_id_firm',
  'pro_id',
  'con_id',
  'status',
  'trt_type',
  'trt_grp',
  'id'
  ]);

-- }

-- Test functions existance {

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

-- }

-- Test indexes existance {
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
-- }

-- Test bde_write_appellation {
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,null,null,null,null,null),
    '', 'bde_write_appellation 1');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,null,null,null,null,'14'),
    '14', 'bde_write_appellation 2');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,null,null,null,'13','14'),
    '13 Block 14', 'bde_write_appellation 3');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,null,null,'12','13','14'),
    '13 12 Block 14', 'bde_write_appellation 4');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,null,'11','12','13','14'),
    '13 12 Block 14 11', 'bde_write_appellation 5');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,null,'10','11','12','13','14'),
    '13 12 Block 14 11 10', 'bde_write_appellation 6');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,null,'9','10','11','12','13','14'),
    '13 12 Block 14 11 10', 'bde_write_appellation 7');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,null,'8','9','10','11','12','13','14'),
    '13 12 Block 14 Block 8 11 10', 'bde_write_appellation 8');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,null,'7','8','9','10','11','12','13','14'),
    '13 12 Block 14 7 Block 8 11 10',
    'bde_write_appellation 9');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,null,'6','7','8','9','10','11','12','13','14'),
    '13 12 Block 14 6 7 Block 8 11 10',
    'bde_write_appellation 10');
SELECT is(bde.bde_write_appellation
    (null,null,null,null,'5','6','7','8','9','10','11','12','13','14'),
    '13 12 Block 14 5 6 7 Block 8 11 10',
    'bde_write_appellation 11');
SELECT is(bde.bde_write_appellation
    (null,null,null,'4','5','6','7','8','9','10','11','12','13','14'),
    '13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 12');
SELECT is(bde.bde_write_appellation
    (null,null,'3','4','5','6','7','8','9','10','11','12','13','14'),
    '3 share of 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 13');
SELECT is(bde.bde_write_appellation
    (null,'2','3','4','5','6','7','8','9','10','11','12','13','14'),
    '3 share of 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 14');
SELECT is(bde.bde_write_appellation
    ('1','2','3','4','5','6','7','8','9','10','11','12','13','14'),
    '3 share of 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 15');
SELECT is(bde.bde_write_appellation
    ('PART','2','3','4','5','6','7','8','9','10','11','12','13','14'),
    'Part3 share of 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 16');
SELECT is(bde.bde_write_appellation
    ('PART','PART','3','4','5','6','7','8','9','10','11','12','13','14'),
    'Part Part3 share of 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 17');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','4','5','6','7','8','9','10','11','12','13','14'),
    'Part Part 13 12 Block 14 4 5 6 7 Block 8 11 10',
    'bde_write_appellation 18');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','5','6','7','8','9','10','11','12','13','14'),
    'Part Part 13 12 Block 14 5 6 7 Block 8 11 10',
    'bde_write_appellation 19');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','7','8','9','10','11','12','13','14'),
    'Part Part 13 12 Block 14 7 Block 8 11 10',
    'bde_write_appellation 20');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','8','9','10','11','12','13','14'),
    'Part Part 13 12 Block 14 Block 8 11 10',
    'bde_write_appellation 21');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','9','10','11','12','13','14'),
    'Part Part 13 12 Block 14 11 10',
    'bde_write_appellation 22');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','10','11','12','13','14'),
    'Part Part 13 12 Block 14 10 11',
    'bde_write_appellation 23');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','','11','12','13','14'),
    'Part Part 13 12 Block 14 11',
    'bde_write_appellation 24');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','','','12','13','14'),
    'Part Part 13 12 Block 14',
    'bde_write_appellation 25');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','','','','13','14'),
    'Part Part 13 Block 14',
    'bde_write_appellation 26');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','','','','','14'),
    'Part Part 14',
    'bde_write_appellation 27');
SELECT is(bde.bde_write_appellation
    ('PART','PART','1/1','','','','','','PRFX','','','','',''),
    'Part Part',
    'bde_write_appellation 28');
-- }

-- Test bde_get_combined_appellation {

copy bde.crs_appellation from stdin ( delimiter '|' );
1|GNRL|Y|N|CURR|WHOL|\N|SURD|Lower Hawea|SECT|43|\N|\N|V|SUFX|\N|\N|\N|\N|\N|5084|200798
2|GNRL|Y|N|CURR|PART|\N|SURD|Clutha|SECT|3|\N|\N|XXXVI|SUFX|\N|\N|\N|\N|\N|5107|201212
3|GNRL|Y|Y|CURR|WHOL|\N|DP|13918|LOT|32|\N|\N|\N|PRFX|\N|\N|\N|\N|\N|3705368|1399023
4|GNRL|N|Y|CURR|PART|\N|DP|8007|LOT|61|\N|\N|\N|PRFX|\N|\N|\N|\N|\N|3792885|1535355
5|GNRL|Y|Y|CURR|WHOL|\N|DP|2425|LOT|11|\N|\N|VIII|PRFX|\N|\N|\N|\N|\N|3793571|1428424
6|GNRL|Y|Y|CURR|WHOL|\N|DP|28568|LOT|5|\N|\N|\N|PRFX|\N|\N|\N|\N|\N|3824354|1438685
7|GNRL|N|Y|HIST|PART|\N|DP|26040|LOT|2|\N|\N|\N|PRFX|\N|\N|\N|\N|\N|3935083|1689914
7|GNRL|Y|Y|CURR|PART|\N|DP|26042|LOT|2|\N|\N|\N|PRFX|\N|18484652|11189968|\N|\N|7187126|5831252
11|MAOR|Y|N|CURR|WHOL|Maori Reserve 883 (Rakipaoa)|\N|\N|\N|\N|\N|\N|\N|\N|\N|\N|\N|\N|\N|141034|928194
12|MAOR|Y|N|HIST|WHOL|Ohapi|\N|\N|\N|909|\N|\N|\N|\N|\N|16592162|9687268|\N|\N|6832755|5404695
13|MAOR|N|Y|CURR|WHOL|Nuhaka|\N|\N|\N|2E3D6|\N|\N|\N|\N|\N|\N|\N|\N|\N|6910776|5501059
14|MAOR|Y|Y|CURR|WHOL|Torere Pa|\N|\N|\N|12|\N|\N|\N|\N|\N|\N|\N|\N|\N|7117088|5745388
21|PART|Y|Y|CURR|WHOL|\N|DP|181158|LOT|28|\N|\N|\N|PRFX|\N|\N|\N|\N|\N|6740001|5278098
31|OTHR|N|Y|CURR|WHOL|\N|\N|\N|\N|\N|\N|\N|\N|\N|Stopped Road|\N|\N|\N|\N|3000867|289
32|OTHR|N|Y|HIST|PART|\N|\N|\N|\N|\N|\N|\N|\N|\N|Closed Street Block V Lower Kaikorai Survey District|\N|\N|\N|\N|3001281|427
33|OTHR|N|Y|CURR|PART|\N|\N|\N|\N|\N|\N|\N|\N|\N|Section 44 River Sections East Taieri Survey District|\N|\N|\N|\N|3001833|611
34|OTHR|Y|Y|CURR|PART|\N|\N|\N|\N|\N|\N|\N|\N|\N|Closed Road Block II Clutha Survey District|\N|\N|\N|\N|3041661|13887
35|OTHR|Y|Y|CURR|WHOL|\N|\N|\N|\N|\N|\N|\N|\N|\N|Section 102 Irregular Block East Taieri Survey District|\N|\N|\N|\N|3044865|14955
36|OTHR|Y|N|CURR|WHOL|\N|\N|\N|\N|\N|\N|\N|\N|\N|Future Development Accessory Unit 9A Deposited Plan 22767|\N|\N|\N|\N|443|173809
\.

SELECT results_eq($$
	SELECT DISTINCT par_id,
		   bde.bde_get_combined_appellation(par_id, 'N') app_short,
		   bde.bde_get_combined_appellation(par_id, 'Y') app_long
	FROM bde.crs_appellation
	ORDER BY par_id
$$, $$ VALUES
	(1,'43 Block V Lower Hawea','43 Block V Lower Hawea'),
	(2,'Part 3 Block XXXVI Clutha','Part 3 Block XXXVI Clutha'),
	(3,'32 DP 13918','32 13918'),
	(4,'Part 61 DP 8007','Part 61 8007'),
	(5,'11 Block VIII DP 2425','11 Block VIII 2425'),
	(6,'5 DP 28568','5 28568'),
	(7,'Part 2 DP 26042','Part 2 26042'),
	(11,'Maori Reserve 883 (Rakipaoa) Block','Maori Reserve 883 (Rakipaoa) Block'),
	(12,null,null),
	(13,'Nuhaka 2E3D6 Block','Nuhaka 2E3D6 Block'),
	(14,'Torere Pa 12 Block','Torere Pa 12 Block'),
	(21,'28 Block 28 DP 181158','28 Block 28 181158'),
	(31,'Stopped Road','Stopped Road'),
	(32,null,null),
	(33,'Part Section 44 River Sections East Taieri Survey District','Part Section 44 River Sections East Taieri Survey District'),
	(34,'Part Closed Road Block II Clutha Survey District','Part Closed Road Block II Clutha Survey District'),
	(35,'Section 102 Irregular Block East Taieri Survey District','Section 102 Irregular Block East Taieri Survey District'),
	(36,'Future Development Accessory Unit 9A Deposited Plan 22767','Future Development Accessory Unit 9A Deposited Plan 22767')
$$,
	'bde_get_combined_appellation should behave as expected'
);

-- }

SELECT * FROM finish();

ROLLBACK;


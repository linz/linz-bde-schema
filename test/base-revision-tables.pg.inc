
-- WARNING: always update this file whenever test/base.pg is updated

-- Test table_version tables permissions {

-- See https://github.com/linz/linz-bde-schema/issues/170
SELECT sequence_privs_are ( 'table_version'::name, 'revision_id_seq'::name, 'bde_dba'::name, ARRAY['SELECT'] );

-- }

-- Test revision tables existance and their composition {

SELECT has_table('table_version'::name, 'bde_cbe_title_parcel_association_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_cbe_title_parcel_association_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_cbe_title_parcel_association_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_cbe_title_parcel_association_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_cbe_title_parcel_association_revision'::name,
  ARRAY[
  'last_updated',
  'id',
  'ttl_title_no',
  'par_id',
  'source',
  'status',
  'inserted_date'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_action_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_action_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_action_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_action_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_action_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_action_type_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_action_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_action_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_action_type_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_action_type_revision'::name,
ARRAY[
  'type',
  'description',
  'system_action',
  'sob_name',
  'existing_inst',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adj_obs_change_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adj_obs_change_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adj_obs_change_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adj_obs_change_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adj_obs_change_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adj_user_coef_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adj_user_coef_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adj_user_coef_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adj_user_coef_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adj_user_coef_revision'::name,
ARRAY[
  'adc_id',
  'adj_id',
  'value',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adjust_coef_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjust_coef_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjust_coef_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adjust_coef_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adjust_coef_revision'::name,
ARRAY[
  'id',
  'adm_id',
  'default_value',
  'description',
  'sequence',
  'coef_code',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adjustment_run_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjustment_run_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjustment_run_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adjustment_run_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adjust_method_revision'::name,
ARRAY[
  'type',
  'id',
  'status',
  'software_used',
  'name',
  'audit_id',
  'description'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adjust_method_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjust_method_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adjust_method_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adjust_method_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adjustment_run_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_adoption_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_adoption_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_adoption_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_adoption_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_adoption_revision'::name,
ARRAY[
  'audit_id',
  'factor_3',
  'factor_2',
  'factor_1',
  'sur_wrk_id_orig',
  'obn_id_orig',
  'obn_id_new'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_affected_parcl_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_affected_parcl_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_affected_parcl_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_affected_parcl_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_affected_parcl_revision'::name,
ARRAY[
  'action',
  'sur_wrk_id',
  'audit_id',
  'par_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_alias_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_alias_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_alias_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_alias_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_alias_revision'::name,
ARRAY[
  'prp_id',
  'id',
  'other_names',
  'surname'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_appellation_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_appellation_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_appellation_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_appellation_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_appellation_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_comprised_in_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_comprised_in_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_comprised_in_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_comprised_in_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_comprised_in_revision'::name,
ARRAY[
  'wrk_id',
  'limited',
  'id',
  'reference',
  'type'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_coordinate_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_coordinate_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_coordinate_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_coordinate_sys_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_sys_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_sys_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_coordinate_sys_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_coordinate_sys_revision'::name,
ARRAY[
  'cot_id',
  'id',
  'dtm_id',
  'cos_id_adjust',
  'name',
  'initial_sta_name',
  'code',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_coordinate_tpe_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_tpe_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_coordinate_tpe_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_coordinate_tpe_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_coordinate_tpe_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_cord_order_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_cord_order_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_cord_order_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_cord_order_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_cor_precision_revision'::name,
ARRAY[
  'cor_id',
  'ort_type',
  'decimal_places',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_cor_precision_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_cor_precision_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_cor_precision_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_cor_precision_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_cord_order_revision'::name,
ARRAY[
  'dtm_id',
  'order_group',
  'error',
  'audit_id',
  'id',
  'display',
  'description'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_datum_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_datum_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_datum_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_datum_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_datum_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_elect_place_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_elect_place_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_elect_place_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_elect_place_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_elect_place_revision'::name,
ARRAY[
  'shape',
  'se_row_id',
  'audit_id',
  'status',
  'location',
  'name',
  'alt_id',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ellipsoid_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ellipsoid_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ellipsoid_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ellipsoid_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ellipsoid_revision'::name,
ARRAY[
  'semi_major_axis',
  'flattening',
  'audit_id',
  'id',
  'name'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_enc_share_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_enc_share_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_enc_share_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_enc_share_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_enc_share_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_encumbrancee_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_encumbrancee_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_encumbrancee_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_encumbrancee_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_encumbrance_revision'::name,
ARRAY[
  'term',
  'id',
  'status',
  'act_tin_id_orig',
  'act_tin_id_crt',
  'act_id_crt',
  'act_id_orig',
  'ind_tan_holder'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_encumbrance_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_encumbrance_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_encumbrance_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_encumbrance_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_encumbrancee_revision'::name,
ARRAY[
  'id',
  'ens_id',
  'status',
  'name',
  'system_ext',
  'usr_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_estate_share_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_estate_share_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_estate_share_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_estate_share_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_estate_share_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_feature_name_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_feature_name_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_feature_name_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_feature_name_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_feature_name_revision'::name,
ARRAY[
  'shape',
  'id',
  'audit_id',
  'other_details',
  'status',
  'name',
  'type',
  'se_row_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_geodetic_network_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_geodetic_network_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_geodetic_network_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_geodetic_network_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_geodetic_network_revision'::name,
ARRAY[
  'description',
  'code',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_geodetic_node_network_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_geodetic_node_network_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_geodetic_node_network_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_geodetic_node_network_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_geodetic_node_network_revision'::name,
ARRAY[
  'audit_id',
  'gdn_id',
  'nod_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_image_history_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_image_history_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_image_history_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_image_history_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_image_revision'::name,
ARRAY[
  'usr_id_created',
  'barcode_datetime',
  'ims_id',
  'ims_date',
  'pages',
  'centera_id',
  'location',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_image_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_image_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_image_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_image_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_image_history_revision'::name,
ARRAY[
  'usr_id',
  'centera_id',
  'pages',
  'ims_date',
  'ims_id',
  'img_id',
  'id',
  'centera_datetime'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_land_district_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_land_district_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_land_district_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_land_district_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_land_district_revision'::name,
ARRAY[
  'default',
  'loc_id',
  'off_code',
  'audit_id',
  'se_row_id',
  'usr_tm_id',
  'shape'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_legal_desc_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_legal_desc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_legal_desc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_legal_desc_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_legal_desc_revision'::name,
ARRAY[
  'legal_desc_text',
  'ttl_title_no',
  'total_area',
  'type',
  'status',
  'audit_id',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_legal_desc_prl_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_legal_desc_prl_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_legal_desc_prl_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_legal_desc_prl_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_legal_desc_prl_revision'::name,
ARRAY[
  'audit_id',
  'sur_wrk_id_crt',
  'part_affected',
  'sequence',
  'par_id',
  'share',
  'lgd_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_line_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_line_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_line_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_locality_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_locality_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_locality_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_locality_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_locality_revision'::name,
ARRAY[
  'shape',
  'id',
  'type',
  'name',
  'loc_id_parent',
  'audit_id',
  'se_row_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_maintenance_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_maintenance_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_maintenance_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_maintenance_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_maintenance_revision'::name,
ARRAY[
  'type',
  'status',
  'desc',
  'complete_date',
  'audit_id',
  'mrk_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_map_grid_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_map_grid_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_map_grid_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_map_grid_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_map_grid_revision'::name,
ARRAY[
  'major_grid',
  'minor_grid',
  'se_row_id',
  'audit_id',
  'shape'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mark_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mark_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mark_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mark_name_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_name_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_name_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mark_name_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mark_name_revision'::name,
ARRAY[
  'mrk_id',
  'type',
  'name',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mark_sup_doc_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_sup_doc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mark_sup_doc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mark_sup_doc_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mark_sup_doc_revision'::name,
ARRAY[
  'sud_id',
  'mrk_id',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mesh_blk_area_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_area_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_area_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mesh_blk_area_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mesh_blk_revision'::name,
ARRAY[
  'shape',
  'id',
  'alt_id',
  'code',
  'start_datetime',
  'end_datetime',
  'audit_id',
  'se_row_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mesh_blk_bdry_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_bdry_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_bdry_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mesh_blk_bdry_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mesh_blk_area_revision'::name,
ARRAY[
  'mbk_id',
  'audit_id',
  'alt_id',
  'stt_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mesh_blk_line_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mesh_blk_line_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mesh_blk_bdry_revision'::name,
ARRAY[
  'audit_id',
  'mbk_id',
  'mbl_id',
  'alt_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mesh_blk_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mesh_blk_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mesh_blk_line_revision'::name,
ARRAY[
  'shape',
  'line_type',
  'id',
  'audit_id',
  'se_row_id',
  'alt_id',
  'status'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mesh_blk_place_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_place_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mesh_blk_place_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mesh_blk_place_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mesh_blk_place_revision'::name,
ARRAY[
  'mbk_id',
  'alt_id',
  'audit_id',
  'epl_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_mrk_phys_state_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_mrk_phys_state_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_mrk_phys_state_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_mrk_phys_state_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_mrk_phys_state_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_network_plan_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_network_plan_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_network_plan_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_network_plan_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_network_plan_revision'::name,
ARRAY[
  'dtm_id',
  'id',
  'type',
  'status',
  'datum_order',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_node_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_node_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_node_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_node_prp_order_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_prp_order_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_prp_order_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_node_prp_order_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_node_prp_order_revision'::name,
ARRAY[
  'cor_id',
  'nod_id',
  'dtm_id',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_node_works_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_works_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_node_works_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_node_works_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_node_works_revision'::name,
ARRAY[
  'adopted',
  'nod_id',
  'pend_node_status',
  'wrk_id',
  'audit_id',
  'purpose'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_nominal_index_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_nominal_index_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_nominal_index_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_nominal_index_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_nominal_index_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_obs_accuracy_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_accuracy_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_accuracy_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_obs_accuracy_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_obs_accuracy_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_obs_elem_type_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_elem_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_elem_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_obs_elem_type_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_obs_elem_type_revision'::name,
ARRAY[
  'type',
  'audit_id',
  'format_code',
  'uom_code',
  'description'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_observation_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_observation_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_observation_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_observation_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_obs_set_revision'::name,
ARRAY[
  'audit_id',
  'type',
  'id',
  'reason'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_obs_set_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_set_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_set_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_obs_set_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_obs_type_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_obs_type_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_obs_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_obs_type_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_observation_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_off_cord_sys_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_off_cord_sys_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_off_cord_sys_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_off_cord_sys_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_off_cord_sys_revision'::name,
ARRAY[
  'cos_id',
  'description',
  'audit_id',
  'se_row_id',
  'shape',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_office_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_office_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_office_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_office_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_office_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ordinate_adj_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ordinate_adj_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ordinate_adj_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ordinate_adj_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ordinate_adj_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ordinate_type_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ordinate_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ordinate_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ordinate_type_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ordinate_type_revision'::name,
ARRAY[
  'description',
  'audit_id',
  'mandatory',
  'format_code',
  'uom_code',
  'type'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_parcel_bndry_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_bndry_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_bndry_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_parcel_bndry_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_parcel_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_parcel_dimen_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_dimen_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_dimen_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_parcel_dimen_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_parcel_bndry_revision'::name,
ARRAY[
  'pri_id',
  'reversed',
  'lin_id',
  'sequence',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_parcel_label_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_label_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_label_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_parcel_label_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_parcel_dimen_revision'::name,
ARRAY[
  'audit_id',
  'obn_id',
  'par_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_parcel_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_parcel_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_parcel_label_revision'::name,
ARRAY[
  'se_row_id',
  'id',
  'par_id',
  'audit_id',
  'shape'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_parcel_ring_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_ring_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_parcel_ring_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_parcel_ring_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_parcel_ring_revision'::name,
ARRAY[
  'id',
  'is_ring',
  'pri_id_parent_ring',
  'audit_id',
  'par_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_programme_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_programme_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_programme_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_programme_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_programme_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_proprietor_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_proprietor_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_proprietor_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_proprietor_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_proprietor_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_reduct_meth_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_reduct_meth_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_reduct_meth_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_reduct_meth_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_reduct_meth_revision'::name,
ARRAY[
  'id',
  'status',
  'description',
  'name',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_reduct_run_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_reduct_run_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_reduct_run_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_reduct_run_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_reduct_run_revision'::name,
ARRAY[
  'id',
  'rdm_id',
  'datetime',
  'description',
  'traj_type',
  'usr_id_exec',
  'software_used',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ref_survey_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ref_survey_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ref_survey_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ref_survey_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ref_survey_revision'::name,
ARRAY[
  'sur_wrk_id_new',
  'bearing_corr',
  'audit_id',
  'sur_wrk_id_exist'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_road_ctr_line_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_ctr_line_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_ctr_line_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_road_ctr_line_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_road_ctr_line_revision'::name,
ARRAY[
  'status',
  'shape',
  'se_row_id',
  'audit_id',
  'non_cadastral_rd',
  'id',
  'alt_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_road_name_asc_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_name_asc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_name_asc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_road_name_asc_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_road_name_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_road_name_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_name_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_road_name_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_road_name_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_road_name_asc_revision'::name,
ARRAY[
  'rna_id',
  'rcl_id',
  'alt_id',
  'priority',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_setup_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_setup_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_setup_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_setup_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_setup_revision'::name,
ARRAY[
  'type',
  'valid_flag',
  'equipment_type',
  'wrk_id',
  'audit_id',
  'nod_id',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_site_locality_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_site_locality_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_site_locality_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_site_locality_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_site_revision'::name,
ARRAY[
  'id',
  'type',
  'wrk_id_created',
  'desc',
  'occupier',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_site_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_site_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_site_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_site_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_site_locality_revision'::name,
ARRAY[
  'loc_id',
  'audit_id',
  'sit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_stat_act_parcl_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_stat_act_parcl_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_stat_act_parcl_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_stat_act_parcl_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_stat_act_parcl_revision'::name,
ARRAY[
  'audit_id',
  'name',
  'purpose',
  'action',
  'status',
  'par_id',
  'sta_id',
  'comments',
  'img_id',
  'description'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_statist_area_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_statist_area_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_statist_area_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_statist_area_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_stat_version_revision'::name,
ARRAY[
  'version',
  'area_class',
  'desc',
  'statute_action',
  'start_date',
  'end_date',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_statute_action_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_statute_action_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_statute_action_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_statute_action_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_statist_area_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_statute_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_statute_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_statute_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_statute_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_statute_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_stat_version_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_stat_version_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_stat_version_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_stat_version_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_statute_action_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_street_address_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_street_address_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_street_address_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_street_address_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_street_address_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_sur_admin_area_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_sur_admin_area_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_sur_admin_area_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_sur_admin_area_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_sur_admin_area_revision'::name,
ARRAY[
  'sur_wrk_id',
  'audit_id',
  'eed_req_id',
  'xstt_id',
  'stt_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_sur_plan_ref_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_sur_plan_ref_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_sur_plan_ref_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_sur_plan_ref_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_sur_plan_ref_revision'::name,
ARRAY[
  'shape',
  'wrk_id',
  'id',
  'se_row_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_survey_image_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_survey_image_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_survey_image_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_survey_image_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_survey_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_survey_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_survey_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_survey_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_survey_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_survey_image_revision'::name,
ARRAY[
  'type',
  'sur_wrk_id',
  'img_id',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_sys_code_group_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_sys_code_group_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_sys_code_group_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_sys_code_group_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_sys_code_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_sys_code_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_sys_code_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_sys_code_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_sys_code_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_sys_code_group_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_action_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_action_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_action_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_action_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_doc_ref_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_doc_ref_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_doc_ref_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_doc_ref_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_action_revision'::name,
ARRAY[
  'audit_id',
  'ttl_title_no',
  'act_tin_id',
  'act_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_estate_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_estate_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_estate_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_estate_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_doc_ref_revision'::name,
ARRAY[
  'type',
  'tin_id',
  'id',
  'reference_no'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_memorial_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_memorial_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_memorial_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_memorial_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_estate_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_mem_text_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_mem_text_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_mem_text_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_mem_text_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_mem_text_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_title_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_title_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_title_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_title_memorial_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_topology_class_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_topology_class_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_topology_class_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_topology_class_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_topology_class_revision'::name,
ARRAY[
  'audit_id',
  'name',
  'type',
  'code'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_transact_type_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_transact_type_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_transact_type_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_transact_type_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_transact_type_revision'::name,
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
  'view_in_search_tree',
  'user_type_list',
  'user_type_list_flag'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ttl_enc_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_enc_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_enc_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ttl_enc_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ttl_enc_revision'::name,
ARRAY[
  'act_tin_id_ext',
  'act_id_ext',
  'act_id_crt',
  'act_tin_id_crt',
  'status',
  'enc_id',
  'ttl_title_no',
  'id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ttl_hierarchy_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_hierarchy_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_hierarchy_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ttl_hierarchy_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ttl_hierarchy_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ttl_inst_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ttl_inst_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ttl_inst_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ttl_inst_protect_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_protect_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_protect_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ttl_inst_protect_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ttl_inst_protect_revision'::name,
ARRAY[
  'id',
  'tin_id',
  'protect_start',
  'protect_end',
  'protect_reference'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_ttl_inst_title_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_title_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_ttl_inst_title_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_ttl_inst_title_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_ttl_inst_title_revision'::name,
ARRAY[
  'tin_id',
  'ttl_title_no',
  'created_by_inst',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_unit_of_meas_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_unit_of_meas_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_unit_of_meas_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_unit_of_meas_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_unit_of_meas_revision'::name,
ARRAY[
  'code',
  'description',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_user_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_user_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_user_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_user_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_user_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_vector_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_vector_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_vector_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_vector_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_vector_revision'::name,
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
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_vertx_sequence_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_vertx_sequence_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_vertx_sequence_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_vertx_sequence_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_vertx_sequence_revision'::name,
ARRAY[
  'value2',
  'lin_id',
  'sequence',
  'value1',
  'audit_id'
  , '_revision_created', '_revision_expired']);

SELECT has_table('table_version'::name, 'bde_crs_work_revision'::name);
SELECT table_privs_are('table_version'::name, 'bde_crs_work_revision'::name, 'bde_admin'::name, ARRAY['DELETE','INSERT','SELECT','UPDATE']);
SELECT table_privs_are('table_version'::name, 'bde_crs_work_revision'::name, 'bde_user'::name, ARRAY['SELECT']);
SELECT table_owner_is('table_version'::name, 'bde_crs_work_revision'::name, 'bde_dba'::name);
SELECT columns_are('table_version'::name, 'bde_crs_work_revision'::name,
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
  'trv_id',
  'usr_id_firm',
  'pro_id',
  'con_id',
  'status',
  'trt_type',
  'trt_grp',
  'id',
  'ver_datum_code'
  , '_revision_created', '_revision_expired']);

-- }

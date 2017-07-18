--------------------------------------------------------------------------------
--
-- linz-bde-schema
--
-- Copyright 2016 Crown copyright (c)
-- Land Information New Zealand and the New Zealand Government.
-- All rights reserved
--
-- This software is released under the terms of the new BSD license. See the
-- LICENSE file for more information.
--
--------------------------------------------------------------------------------
-- BDE indexes used within the CRS production database
--------------------------------------------------------------------------------
--SET client_min_messages TO NOTICE;
SET search_path = bde, public;


DO $SCHEMA$
BEGIN

IF NOT EXISTS (SELECT * FROM pg_namespace where LOWER(nspname) = 'bde') THEN
    RAISE EXCEPTION 'BDE schema is not installed';
END IF;

DROP TABLE IF EXISTS tmp_bde_index;

CREATE TEMP TABLE tmp_bde_index AS
SELECT relname FROM pg_class c JOIN pg_namespace n ON n.oid=c.relnamespace
WHERE n.nspname='bde' and c.relkind='i';

-------------------------------------------------------------------------------
-- Build core BDE schema indexes required
-------------------------------------------------------------------------------
IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_app_par') THEN
    RAISE NOTICE 'Building fk_app_par';
    CREATE INDEX fk_app_par ON crs_appellation USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_epl_shape') THEN
    RAISE NOTICE 'Building shx_epl_shape';
    CREATE INDEX shx_epl_shape ON crs_elect_place USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_fen_shape') THEN
    RAISE NOTICE 'Building shx_fen_shape';
    CREATE INDEX shx_fen_shape ON crs_feature_name USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_ldt_shape') THEN
    RAISE NOTICE 'Building shx_ldt_shape';
    CREATE INDEX shx_ldt_shape ON crs_land_district USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_lin_shape') THEN
    RAISE NOTICE 'Building shx_lin_shape';
    CREATE INDEX shx_lin_shape ON crs_line USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_loc_shape') THEN
    RAISE NOTICE 'Building shx_loc_shape';
    CREATE INDEX shx_loc_shape ON crs_locality USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_map_shape') THEN
    RAISE NOTICE 'Building shx_map_shape';
    CREATE INDEX shx_map_shape ON crs_map_grid USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_mkn_mrk') THEN
    RAISE NOTICE 'Building fk_mkn_mrk';
    CREATE INDEX fk_mkn_mrk ON crs_mark_name USING btree (mrk_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_mbk_shape') THEN
    RAISE NOTICE 'Building shx_mbk_shape';
    CREATE INDEX shx_mbk_shape ON crs_mesh_blk USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_mbl_shape') THEN
    RAISE NOTICE 'Building shx_mbl_shape';
    CREATE INDEX shx_mbl_shape ON crs_mesh_blk_line USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_nod_shape') THEN
    RAISE NOTICE 'Building shx_nod_shape';
    CREATE INDEX shx_nod_shape ON crs_node USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_ocs_shape') THEN
    RAISE NOTICE 'Building shx_ocs_shape';
    CREATE INDEX shx_ocs_shape ON crs_off_cord_sys USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_par_shape') THEN
    RAISE NOTICE 'Building shx_par_shape';
    CREATE INDEX shx_par_shape ON crs_parcel USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_plb_shape') THEN
    RAISE NOTICE 'Building shx_plb_shape';
    CREATE INDEX shx_plb_shape ON crs_parcel_label USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_rcl_shape') THEN
    RAISE NOTICE 'Building shx_rcl_shape';
    CREATE INDEX shx_rcl_shape ON crs_road_ctr_line USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sap_sta') THEN
    RAISE NOTICE 'Building fk_sap_sta';
    CREATE INDEX fk_sap_sta ON crs_stat_act_parcl USING btree (sta_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sap_par') THEN
    RAISE NOTICE 'Building fk_sap_par';
    CREATE INDEX fk_sap_par ON crs_stat_act_parcl USING btree (par_id);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_stt_shape') THEN
    RAISE NOTICE 'Building shx_stt_shape';
    CREATE INDEX shx_stt_shape ON crs_statist_area USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_sad_shape') THEN
    RAISE NOTICE 'Building shx_sad_shape';
    CREATE INDEX shx_sad_shape ON crs_street_address USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_spf_shape') THEN
    RAISE NOTICE 'Building shx_spf_shape';
    CREATE INDEX shx_spf_shape ON crs_sur_plan_ref USING gist (shape);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sco_scg') THEN
    RAISE NOTICE 'Building fk_sco_scg';
    CREATE INDEX fk_sco_scg ON crs_sys_code USING btree (scg_code);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='fk_sco_scg_code') THEN
    RAISE NOTICE 'Building fk_sco_scg_code';
    CREATE UNIQUE INDEX fk_sco_scg_code ON crs_sys_code USING btree (scg_code, code);
END IF;

IF NOT EXISTS (SELECT relname FROM tmp_bde_index WHERE relname='shx_vct_shape') THEN
    RAISE NOTICE 'Building shx_vct_shape';
    CREATE INDEX shx_vct_shape ON crs_vector USING gist (shape);
END IF;

DROP TABLE IF EXISTS tmp_bde_index;

END;
$SCHEMA$;

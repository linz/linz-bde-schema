# Change Log

All notable changes for the LINZ BDE schema are documented in this file.

## 1.14.1 - 2022-05-02

### Fixed

-   Force pushing changes to origin remote

## 1.14.0 - 2022-03-08

### Added

-   Support for Ubuntu 20.04/LTS

### Enhanced

-   Quality improvements

## 1.13.0 - 2021-01-05

### Added

-   Add support for skipping comments
-   Include 12 tables documeted in DataDictionary-3.22.xml and not the PDF
-   Allos using schema dump to filter xml comments
-   Update schema comments from LDS Full Data dictionary 2.6

### Fixed

-   Fix ordering of tests
-   protect_reference column > VARCHAR(255)

## 1.12.2 - 2020-09-15

### Fixed

-   Updated schema comments

## 1.12.1 - 2020-08-18

### Fixed

-   Enlarge `crs_title` and `crs_ttl_inst_protect` `protect_reference` column to 255 chars (#209)

## 1.12.0 - 2020-08-11

### Enhanced

-   CI: skip upload of "-start" suffixed packages

## 1.11.0 - 2020-07-14

### Added

-   Landonline 3.22 support: new `crs_ttl_inst_protect` table

## 1.10.3 - 2020-06-16

### Fixed

-   Lack of changelog in debian packaging

## 1.10.2 - 2020-05-28

### Fixed

-   Version in Makefile (#193)

## 1.10.1 - 2020-05-27

### Fixed

-   Work around RDS bug with `search_path` (#192)

## 1.10.0 - 2020-05-05

### Changed

-   Landonline 3.21 support (#180):
    -   Add `ver_datum_code` column to `bde.crs_work`

### Enhanced

-   Stop searching for tableversion/dbpatch scripts, not needed anymore
-   Only ALTER table on upgrade if really needed (#186)

## 1.9.0 - 2020-02-11

### Enhanced

-   Grant SELECT on `table_version.revision_id_seq` to `bde_dba` (#170)
-   Grant `bde_user` to `bde_admin` and `bde_admin` to `bde_dba` (#172)

## 1.8.0 - 2019-11-12

### Enhanced

-   Lost tables and permissions now recovered upon schema loading (#165)

### Added

-   Switch --readonly to schema loader (#161)

## 1.7.0 - 2019-10-09

### Added

-   linz-bde-schema-publish script (#149)

## 1.6.2 - 2020-08-26

### Fixed

-   Enlarge `crs_title` `protect_reference` column to 255 chars (#209)

## 1.6.1 - 2019-09-09

### Enhanced

-   Drop confusing output from dbpatch loader preflight call (#146)

## 1.6.0 - 2019-07-29

### Enhanced

-   Use a DO block to bless functions, reducing verbosity of scripts loading

## 1.5.0 - 2019-05-16

### Fixed

-   Work around RDS bug with `search_path` (#139)

### Enhanced

-   Do not change session verbosity during load of enabling scripts (#138)

## 1.4.0 - 2019-05-08

### Changed

-   Do not mass-drop functions during upgades (#123)

### Added

-   Standard output support in `linz-bde-schema-load` (#122)

## 1.3.0 - 2018-10-25

### Changed

-   Landonline 3.19 support (#115):
-   Add `user_type_list_flag` and `user_type_list` cols to `bde.crs_transact_type`

### Enhanced

-   Do not change session variables during load of enabling scripts (#104)
-   Create no revision when versioning empty tables (#110)

## 1.2.1 - 2018-06-18

### Fixed

-   Fix support for extension-less `table_version` usage (#94)

### Enhanced

-   Add tests for upgrading with enabled versioning, both in extension and non-extension flavors of
    `table_version`

## 1.2.0 - 2018-04-11

### Changed

-   Landonline 3.17 support (#80):
-   Remove `tan_required` and `creates_tan` cols from `bde.crs_transact_type`
-   Add `img_id` and `description` cols to `bde.crs_stat_act_parcl`

### Enhanced

-   Have loader create postgis extension in the public schema (#83)
-   Add test for loading schema with `table_version` (#88)
-   Do not try to drop functions in bde schema whose name does not start in `bde_` (#81)
-   Grant CREATE on `table_version` schema to `bde_dba` (#70)

### Fixed

-   Fix 1.0.2 patch to work in presence of `table_version` but unversioned BDE tables (#89)

## 1.1.2 - 2017-12-20

### Fixed

-   Ability to enable schema for non-superuser (#72) ( loading user is granted `bde_dba` role )

## 1.1.1 - 2017-12-11

### Enhanced

-   Robustness and usability improvements in `linz-bde-schema-load`
-   Drop build dependency on postgresql-dev package
-   Add comments for roles

## 1.1.0 - 2017-12-04

### Important changes

-   `bde_dba` role is not granted SUPERUSER anymore (lack of which would forbid
    `COPY TABLE FROM <file>`, used by `linz-bde-uploader` up to version 2.3.x - 2.4.x will work
    fine)

### Added

-   `bde_get_app_specific` function taking `crs_appellation` record
-   `linz-bde-schema-load` script
-   Table comments and scripts to generate them from various sources

### Enhanced

-   `bde_get_combined_appellation` x2 speed up

## 1.0.2 - 2016-09-13

### Fixed

-   Remove annotations column from `bde.crs_work` (Landonline release 3.14)
-   Remove bde indexes that are not core to the running of the application

## 1.0.1 - 2016-05-15

### Fixed

-   Fixed `crs_mesh_blk_line` primary key

## 1.0.0 - 2016-05-03

### Added

-   Initial release of BDE schema (now separated from `linz_bde_uploader` project)

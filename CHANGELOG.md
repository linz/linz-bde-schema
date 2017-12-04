# Change Log

All notable changes for the LINZ BDE schema are documented in this file.

## 1.2.0dev - YYYY-MM-DD

## 1.1.0 - 2017-12-04
### Important changes
- `bde_dba` role is not granted SUPERUSER anymore (lack of which
  would forbid `COPY TABLE FROM <file>`, used by `linz-bde-uploader`
  up to version 2.3.x - 2.4.x will work fine)
### Added
- `bde_get_app_specific` function taking `crs_appellation` record
- `linz-bde-schema-load` script
- Table comments and scripts to generate them from various sources
### Enhanced
- `bde_get_combined_appellation` x2 speed up

## 1.0.2 - 2016-09-13
### Fixed
- Remove annotations column from `bde.crs_work` (Landonline release 3.14)
- Remove bde indexes that are not core to the running of the application

## 1.0.1 - 2016-05-15
### Fixed
- Fixed `crs_mesh_blk_line` primary key

## 1.0.0 - 2016-05-03
### Added
- Initial release of BDE schema (now separated from `linz_bde_uploader` project)

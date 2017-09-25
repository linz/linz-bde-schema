# Change Log

All notable changes for the LINZ BDE schema are documented in this file.

## 1.1.0dev - YYYY-MM-DD
### Added
- `bde_get_app_specific` function taking `crs_appellation` record
- `linz-bde-schema-load` script
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

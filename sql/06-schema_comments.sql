-- Generated by tools/dict2comment.pl on Mon Nov 27 17:01:06 CET 2017
-- From input:
-- LDS Data Dictionary and Data Models - October - 2016 Version 2.3


COMMENT ON TABLE bde.crs_action IS $DESC$
Instruments can be made up of one or more actions.

Actions are used to perform the actual operations of titles transactions.

https://data.linz.govt.nz/table/1702
$DESC$;

COMMENT ON TABLE bde.crs_action_type IS $DESC$
Instruments can be made up of one or more actions.

Actions are used to perform the actual operations of titles transactions. This table contains all the valid action types.

https://data.linz.govt.nz/table/1728
$DESC$;

COMMENT ON TABLE bde.crs_adjust_coef IS $DESC$
Adjustment Coefficient is a set of control parameters used by an Adjustment Method in the Generate Coordinate/Adjustment process.

https://data.linz.govt.nz/table/1704
$DESC$;

COMMENT ON TABLE bde.crs_adjust_method IS $DESC$
Adjustment Method contains information concerning the type of software and procedures used to adjust the parcel fabric.

https://data.linz.govt.nz/table/1705
$DESC$;

COMMENT ON TABLE bde.crs_adjustment_run IS $DESC$
An Adjustment is a mathematical process of generating corrections to Reduced Observations and Coordinates to generate a consistent set of adjusted Coordinates and adjusted Reduced Observations.

The adjusted Reduced Observations are able to be re-generated from the adjusted Coordinates and are therefore not retained. Inputs are, Reduced Observations, Observation Accuracy, Coordinates and constraints which are defined by Adjustment Method and Adjustment Coefficients.  The primary outputs are adjusted Coordinates, Coordinate Accuracy (again in the form of a VCV matrix) and identification of suspect Reduced Observations. The Adjustment entity contains information about the network adjustment process including, the type of adjustment model used, constraints applied, source, etc.

https://data.linz.govt.nz/table/1981
$DESC$;

COMMENT ON TABLE bde.crs_adj_user_coef IS $DESC$
This entity is used to override the default values for an adjustment run.

https://data.linz.govt.nz/table/1703
$DESC$;

COMMENT ON TABLE bde.crs_adoption IS $DESC$
This entity stores the relationship between an observation element and the original observation element that the value was adopted from.

The adoption link has been made at the observation element level to allow for combinations of measured, calculated and adopted values for one observation.

https://data.linz.govt.nz/table/1706
$DESC$;

COMMENT ON TABLE bde.crs_affected_parcl IS $DESC$
An Affected Parcel is a Parcel which is affected by the approval of a survey dataset, including any parcels created by the approval of that survey dataset.

This entity is used to describe the relationship between surveys and parcels.

https://data.linz.govt.nz/table/1707
$DESC$;

COMMENT ON TABLE bde.crs_alias IS $DESC$
Individual proprietors may have one or more alternate names or (aliases).

This entity stores all of the alternate names used by an individual proprietor. Corporate proprietors can not have aliases. IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/1982
$DESC$;

COMMENT ON TABLE bde.crs_appellation IS $DESC$
Appellations are the textual descriptions that describe a parcel.

Every parcel must have at least one appellation.

https://data.linz.govt.nz/table/1590
$DESC$;

COMMENT ON TABLE bde.crs_comprised_in IS $DESC$
This entity contains references entered to show  what the area under survey is comprised in.

https://data.linz.govt.nz/table/1708
$DESC$;

COMMENT ON TABLE bde.crs_coordinate IS $DESC$
A set of numbers which define the position of a node relative to a coordinate system.

Coordinates are either system derived or obtained from an authoritative source.  The form of the coordinates (polar, Cartesian, etc.) depends on the Coordinate Type assigned to a coordinate system. Coordinates of nodes are usually derived from a network adjustment of reduced survey observations. The authoritative coordinate values of a node or mark will update from time to time as new survey data is received and incorporated into the system. Coordinates can be transformed, to be held in different coordinate systems, or adjusted to represent an improvement in the positional accuracy of a node.

https://data.linz.govt.nz/table/2018
$DESC$;

COMMENT ON TABLE bde.crs_cord_order IS $DESC$
This entity contains all of the valid geodetic orders used to define the relative accuracy of coordinates.

https://data.linz.govt.nz/table/1712
$DESC$;

COMMENT ON TABLE bde.crs_cor_precision IS $DESC$
This defines the precision of coordinates that will be displayed depending on the order of the coordinate.

If a record does not exist for a coordinate order/ordinate type combination the default format mask for the ordinate type will be used.

https://data.linz.govt.nz/table/1711
$DESC$;

COMMENT ON TABLE bde.crs_coordinate_sys IS $DESC$
An associate entity that resolves the many-to - many relationships between Datum and Coordinate Type.

Coordinates are expressed in terms of a Coordinate System. For example, Coordinates may be expressed as latitude and longitude (a Coordinate Type) on New Zealand Geodetic Datum 1949 (a Datum). Transformations operate between Coordinate Systems. For example, a transformation may relate Cartesian Coordinates on NZGD49 to Cartesian Coordinates on WGS84.

https://data.linz.govt.nz/table/1709
$DESC$;

COMMENT ON TABLE bde.crs_coordinate_tpe IS $DESC$
This entity contains information about the different forms that coordinates can take within a datum.

For example, Geocentric Cartesian (X, Y, Z); Topocentric Cartesian (East, North, Up): Geodetic (Latitude, Longitude) or (Latitude, Longitude, Height), Astronomic (Latitude, Longitude)  Projection (North, East) in various projections, Orthometric Height, Ellipsoidal Height, Geoid Height, Gravitational Potential, etc.

https://data.linz.govt.nz/table/1710
$DESC$;

COMMENT ON TABLE bde.crs_datum IS $DESC$
A Datum is a complete system for enabling Coordinates to be assigned to Nodes.

A datum is prescribed by the appropriate authority from which it derives its validity. All Coordinates will be in terms of a Datum. A Datum also provides a spatial standard for the alignment of Reduced Observations via a Datum Calibration.  Most Reduced Observations are Datum dependent but there are specific Reduced Observation types which are Datum independent. The Datum entity contains information about the official geodetic Datum used in Land Information NZ databases and other important Datum’s used to spatially reference source data (e.g.. Reduced Observations) or output data or products (e.g.. Coordinates, Digital Cadastral Database, topographic maps, hydrographic charts, etc). The Datum entity includes objects which, strictly, are reference frames rather than datum’s but the distinction is a fine technical point which is of no great consequence. The Datum entity includes vertical reference surfaces such as leveling datum’s, various tidal surfaces including Mean Sea Level, the geoid, datum ellipsoids, etc. For a Datum to maintain accuracy over a significant area it must be geodetic. Examples of non-geodetic datum’s are the Old Cadastral Datum’s. These do not account for the curvature of the earth and therefore can only maintain accuracy over a limited part of the earthʼs surface.

https://data.linz.govt.nz/table/1713
$DESC$;

COMMENT ON TABLE bde.crs_elect_place IS $DESC$
This dataset was removed from the Landonline database in August 2016 and is no longer maintained.

Place names that may potentially be used by an elector to identify their correct electorate.

Deprecated
$DESC$;

COMMENT ON TABLE bde.crs_ellipsoid IS $DESC$
Details of ellipsoid used for a datum.

The ellipsoid represents the curvature of the datum to match the curvature of the earth.

https://data.linz.govt.nz/table/1715
$DESC$;

COMMENT ON TABLE bde.crs_encumbrance IS $DESC$
An encumbrance is an interest in the land (eg, mortgage, lease).

https://data.linz.govt.nz/table/1984
$DESC$;

COMMENT ON TABLE bde.crs_enc_share IS $DESC$
This entity groups the shares in an encumbrance.

It is not the actual share value.

https://data.linz.govt.nz/table/1983
$DESC$;

COMMENT ON TABLE bde.crs_encumbrancee IS $DESC$
An encumbrance on a title may be owned by one or more encumbrancees (whether an encumbrancee exists or not depends on the type of encumbrance).

A lease does not have an encumbrancee because a Computer Interest Register is issued for the leasehold estate. An encumbrancee has an interest in a share in an encumbrance. IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/1985
$DESC$;

COMMENT ON TABLE bde.crs_estate_share IS $DESC$
An estate may be owned in shares by proprietors.

For example John and Bill may each own a 1/2 share in the land. This table contains one row for each share that exists in an estate. IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/2065
$DESC$;

COMMENT ON TABLE bde.crs_land_district IS $DESC$
This entity contains all of the land districts in New Zealand

https://data.linz.govt.nz/layer/2070
$DESC$;

COMMENT ON TABLE bde.crs_legal_desc IS $DESC$
A legal description is a grouping of parcels which is used to determine the textual legal description of a title, or a group of parcels in an easement.

https://data.linz.govt.nz/table/1986
$DESC$;

COMMENT ON TABLE bde.crs_legal_desc_prl IS $DESC$
Contains the list of parcels for a particular legal description.

https://data.linz.govt.nz/table/1717
$DESC$;

COMMENT ON TABLE bde.crs_line IS $DESC$
A Line may be a surveyed or unsurveyed boundary line.

It may also be a topographical feature, or both a topographical and a boundary feature.

https://data.linz.govt.nz/layer/1975
$DESC$;

COMMENT ON TABLE bde.crs_locality IS $DESC$
This entity contains all localities used for searching and planning.

The details within this entity have no legal aspects and are simply used for defining areas of interest.

https://data.linz.govt.nz/layer/1718
$DESC$;

COMMENT ON TABLE bde.crs_maintenance IS $DESC$
This entity defines the maintenance requirements for marks, mark beacons and mark protection.

https://data.linz.govt.nz/table/1988
$DESC$;

COMMENT ON TABLE bde.crs_map_grid IS $DESC$
This will eventually hold an approximate definition of 1:10,000 New Zealand Map Grid (NZMG) sheetlines, and is intended to support electoral functionality within Landonline (Electoral Reports).

https://data.linz.govt.nz/layer/1726
$DESC$;

COMMENT ON TABLE bde.crs_mark IS $DESC$
A Mark (MRK) is a physical monument placed for the purpose of being surveyed.

A survey mark is a node which is occupied by a physical mark. This entity records the information that relates to mark type and maintenance.  Marks connect Land Information NZ databases to the physical world and provide an infrastructure for other spatial systems such as topographic mapping, engineering, etc. Marks can be placed for a number of purposes e.g. geodetic, cadastral survey, boundary. (See Node)

https://data.linz.govt.nz/table/1989
$DESC$;

COMMENT ON TABLE bde.crs_mark_name IS $DESC$
This entity contains the current name, geographic name and any alternative names associated with a mark.

The geographic name of a mark refers to the official feature name in the Geographic Names database which may differ from the name of a mark which is emplaced on or near that feature. A mark may have several alternative names but only one current and geographical name should exist. When a mark is placed as part of a cadastral survey dataset (plan) its identity is in terms of the dataset series and ID number allocated and an abbreviated description of either the mark type or purpose. Marks can also be numbered in sequence in accordance with the mark type e.g.  IS I DP 3456; IS II DP3456.

https://data.linz.govt.nz/table/1991
$DESC$;

COMMENT ON TABLE bde.crs_mrk_phys_state IS $DESC$
This is used to identify the state of the mark, when and by what it was created.

https://data.linz.govt.nz/table/1990
$DESC$;

COMMENT ON TABLE bde.crs_mark_sup_doc IS $DESC$
Associative entity used to relate supporting documents to marks.

https://data.linz.govt.nz/table/1727
$DESC$;

COMMENT ON TABLE bde.crs_node IS $DESC$
Node can be either a physical mark or a virtual point and contains information that relates to the spatial position of that mark, its association to other marks or points, and measurements and/or calculations.

Nodes may be created without being Marks (for example, an unmarked node where an instrument has been setup, a boundary point that is unable to be physically marked because of occupational obstructions etc.).  Similarly, Nodes may be created prior to Reduced Observations being available. Node is the fundamental entity in the structure of topology (shapes/geometry of features/objects) to represent the cadastral survey layer and other layers in graphical form.

https://data.linz.govt.nz/layer/1993
$DESC$;

COMMENT ON TABLE bde.crs_node_prp_order IS $DESC$
This entity contains the proposed order of a node within a datum.

https://data.linz.govt.nz/table/1992
$DESC$;

COMMENT ON TABLE bde.crs_node_works IS $DESC$
An associative entity which resolves the many to many relationship between Works and Node.

https://data.linz.govt.nz/table/1729
$DESC$;

COMMENT ON TABLE bde.crs_nominal_index IS $DESC$
The nominal index is used when searching for titles by registered proprietor.

The actual proprietor table is not used for searching. Proprietors will always be automatically copied into the nominal index, but additional entries can be manually added (or removed). IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/1994
$DESC$;

COMMENT ON TABLE bde.crs_observation IS $DESC$
Observation includes Reduced Observations.

It may include data recorded in the field that impacts on the Observations such as meteorological observations, time of measurement, etc.

https://data.linz.govt.nz/table/1725
$DESC$;

COMMENT ON TABLE bde.crs_obs_accuracy IS $DESC$
Observation Accuracy data is required as an input to a Network Adjustment and also to allow the quality of Observations to be judged.

Observation Accuracy applies to a particular Observation (variance or standard deviation) or pair of Observation (covariances or correlations). The latter case is particularly relevant to the case of GPS baselines resulting from a multi- station adjustment.

https://data.linz.govt.nz/table/1724
$DESC$;

COMMENT ON TABLE bde.crs_obs_elem_type IS $DESC$
This entity contains all of the elements required to define an observation type.

https://data.linz.govt.nz/table/1730
$DESC$;

COMMENT ON TABLE bde.crs_obs_set IS $DESC$
A collection of observations which are related in some way which is useful for administration or to simplify processes.

An example is a set of theodolite directions.  These all have a common orientation uncertainty and are grouped as such in a network adjustment.

https://data.linz.govt.nz/table/1731
$DESC$;

COMMENT ON TABLE bde.crs_obs_type IS $DESC$
This entity defines all of the different types of observations.

Observations are can be split into two types raw or reduced. For raw observations the following subtypes exist: GPS raw data, theodolite pointing, EDM slope observation, level foresight/backsight, meteorological readings, etc. For Reduced Observations the following subtypes exist: GPS baseline, GPS multi-station set, GPS point position, Doppler point position, theodolite direction etc. CRS 1.0 only supports the storage and manipulation of reduced observations.

https://data.linz.govt.nz/table/1732
$DESC$;

COMMENT ON TABLE bde.crs_office IS $DESC$
This entity contains all of the LINZ offices.

https://data.linz.govt.nz/table/2066
$DESC$;

COMMENT ON TABLE bde.crs_off_cord_sys IS $DESC$
This entity defines the extent of the official coordinate systems that are used for the definition of coordinates associated with nodes.

It is mandatory for every coordinate to have one and only one authoritative coordinate in the official coordinate system.

https://data.linz.govt.nz/layer/1733
$DESC$;

COMMENT ON TABLE bde.crs_ordinate_type IS $DESC$
This entity contains all of the ordinate types.

e.g.  X,Y,Z, latitude, longitude, Velocity x, Velocity Y, Velocity Z etc.

https://data.linz.govt.nz/table/1735
$DESC$;

COMMENT ON TABLE bde.crs_parcel IS $DESC$
A Parcel is a polygon or polyhedron consisting of  boundary lines (Features which are boundary features) which may be, or may be capable of being defined by survey, and includes the parcel area and appellation.

Polyhedrons are required in order to define stratum estates and easements.

https://data.linz.govt.nz/layer/1976
$DESC$;

COMMENT ON TABLE bde.crs_parcel_bndry IS $DESC$
This entity records the sequence of lines that define a PRI "Parcel Ring".

In the sequence, a line may or may not be reversed in order for the line to connect to the next line in terms of end nodes. The sequence begins at 1 and is incremented by 1. If the line sequence is a ring (as specified in PRI), the start and end nodes of the sequence must be the same, after the reverse flag has been applied to all lines in the sequence. Not all line sequences for a parcel ring are actually rings, however, as in the case of easement and walkway centreline parcels (i.e. parcels with a topology class of type "LINE"). For polygonal parcels (i.e. rings), the area occupied by the parcel must be on the right-hand side of the boundary at all times; this means that exterior rings will be defined in a clockwise direction (as specified by the coordinates of the nodes/vertices of the lines after reverse flag is applied), whereas interior rings will be defined in an anti-clockwise direction.

https://data.linz.govt.nz/table/1723
$DESC$;

COMMENT ON TABLE bde.crs_parcel_dimen IS $DESC$
This entity creates the link between a parcel and the observations that are the legal dimensions for the parcel.

https://data.linz.govt.nz/table/1995
$DESC$;

COMMENT ON TABLE bde.crs_parcel_label IS $DESC$
This entity stores the location of the spatial label used to annotate parcels.

https://data.linz.govt.nz/layer/1996
$DESC$;

COMMENT ON TABLE bde.crs_parcel_ring IS $DESC$
This entity stores one record for each ring in a polygonal (e.

g. fee simple) parcel or for the line sequence of a lineal (e.g. centreline) parcel. A polygonal parcel may have multiple rings, some of which may be exterior (i.e. polygons) or interior (i.e. holes). If a ring is an inner ring, its parent (i.e. bounding exterior ring) is specified in pri_id_parent_ring; otherwise, this field is NULL. The Parcel Ring record may not actually be a ring in the case of a lineal (e.g. centreline) parcel. The actual sequence of lines that define the ring is contained in the Parcel Boundary (PAB) table.

https://data.linz.govt.nz/table/1997
$DESC$;

COMMENT ON TABLE bde.crs_proprietor IS $DESC$
A proprietor is a person or corporation holding a share in a title.

IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/1998
$DESC$;

COMMENT ON TABLE bde.crs_reduct_meth IS $DESC$
Reduction Method contains information of the type of software and procedures used to generate Reduced Observations from Raw Measurements or other reduced observations.

https://data.linz.govt.nz/table/1736
$DESC$;

COMMENT ON TABLE bde.crs_reduct_run IS $DESC$
A Reduction Run is a mathematical process of reducing raw observations to generate a set of reduced observations (in the case of GPS observations, this results in the generation of baselines).

The Reduction Run entity contains information about the filtering and quality measures applied in relation to the reduction method used.

https://data.linz.govt.nz/table/1737
$DESC$;

COMMENT ON TABLE bde.crs_ref_survey IS $DESC$
The reference to previous survey datasets used in preparing a dataset being lodged.

There will be a number of datasets appropriate to each dataset lodged.

https://data.linz.govt.nz/table/1738
$DESC$;

COMMENT ON TABLE bde.crs_road_ctr_line IS $DESC$
This data is now removed from Landonline.

From October 2016 to March 2017, this dataset will be maintained from data sourced from LINZ’s new Address Information Management System. From April 2017, only the new AIMs sourced complex roads data and schema will be available. Road & Railway centrelines held within Landonline for electoral purposes. These centrelines are required to indicate the presence of an authoritative road or railway name. Named centrelines are not intended to represent the exact location of a road or railway formation. Named centrelines do not indicate the presence of legal access.

https://data.linz.govt.nz/layer/2023
$DESC$;

COMMENT ON TABLE bde.crs_road_name IS $DESC$
This data is now removed from Landonline.

From October 2016 to March 2017, this dataset will be maintained from data sourced from LINZ’s new Address Information Management System. From April 2017, only the new AIMs sourced complex roads data and schema will be available. Authoritative road and railway names.  This entity also stores an indicator to warn when the name has been recorded for electoral purposes, but is known to be unofficial.

https://data.linz.govt.nz/table/2024
$DESC$;

COMMENT ON TABLE bde.crs_road_name_asc IS $DESC$
This data is now removed from Landonline.

From October 2016 to March 2017, this dataset will be maintained from data sourced from LINZ’s new Address Information Management System. From April 2017, only the new AIMs sourced complex roads data and schema will be available. This association table allows more than one road or railway name to be assigned to a centreline. No centreline may have more than 3 current names.

https://data.linz.govt.nz/table/1741
$DESC$;

COMMENT ON TABLE bde.crs_setup IS $DESC$
The Setup entity holds information about a set-up at a Node as a result of a type of Work such as a Survey.

The setup entity forms the link between an observation and the nodes that the observation is between.

https://data.linz.govt.nz/table/1742
$DESC$;

COMMENT ON TABLE bde.crs_site IS $DESC$
A physical location which was selected, according to specifications for the placement and subsequent survey and re-survey of physical geodetic marks (nodes).

A site may consist of a cluster of geodetic marks which have been placed together for various reasons e.g. accommodate terrain irregularities, monitoring of marks, requirements for eccentric marks. Data confirming the selection of the site, such as owner/occupier, access diagram, locality diagram, digital photo etc. is listed. The site may hold information relating to an active maintenance programme.  It can also hold updated information regarding the current status of the initial requirements due to third party input or by survey contracts.

https://data.linz.govt.nz/table/1743
$DESC$;

COMMENT ON TABLE bde.crs_site_locality IS $DESC$
Associative entity that links sites and localities.

https://data.linz.govt.nz/table/1744
$DESC$;

COMMENT ON TABLE bde.crs_statist_area IS $DESC$
Statistical Areas are areas definable as an aggregation of meshblocks.

The areas defined here are those that are required for electoral purposes, e.g. territorial authorities, general electorates, and maori electorates. This unload only contains TA entries, that may be linked to a Survey plan.

https://data.linz.govt.nz/table/2000
$DESC$;

COMMENT ON TABLE bde.crs_stat_version IS $DESC$
A Statistical Area Class, e.

g. Territorial Authority, may have more than one version. Versioning allows both the former and latter versions of statistical area boundary changes to be stored in Landonline.

https://data.linz.govt.nz/table/1999
$DESC$;

COMMENT ON TABLE bde.crs_statute IS $DESC$
A Statute is legislation enacted by Parliament and includes Acts and Regulations.

The contents or provisions of a Statue (Act) are identified in terms of Parts, Sections and Schedules and the Act name. Statutory Regulations are structured in the same way.

https://data.linz.govt.nz/table/1699
$DESC$;

COMMENT ON TABLE bde.crs_statute_action IS $DESC$
A Statutory Action is the action that is authorised by a specific Part or Section of an Act.

https://data.linz.govt.nz/table/1698
$DESC$;

COMMENT ON TABLE bde.crs_stat_act_parcl IS $DESC$
Statutory Actions recorded against specific parcels.

https://data.linz.govt.nz/table/1700
$DESC$;

COMMENT ON TABLE bde.crs_street_address IS $DESC$
This data is now removed from Landonline.

From October 2016 to March 2017, this dataset will be maintained from data sourced from LINZ’s new Address Information Management System. From April 2017, only the new AIMs sourced complex address data and schema will be available. Street Addresses recorded for electoral purposes. Flat numbers using the same "principal address" are usually omitted. Each address has been geocoded in a position that best suits its display within Landonline.

https://data.linz.govt.nz/layer/2054
$DESC$;

COMMENT ON TABLE bde.crs_survey IS $DESC$
Survey provides details that identify the type of survey, the purpose, and who is involved with giving authorization, preparation and taking responsibility for Work when it is lodged with Land Information NZ.

For example :  The Surveyor who generates a survey dataset is responsible for the accuracy, definition and completeness and provides the details of the purpose for carrying out the work.

https://data.linz.govt.nz/table/2001
$DESC$;

COMMENT ON TABLE bde.crs_sur_admin_area IS $DESC$
This entity records the Territorial Authorities required to authorise a survey.

https://data.linz.govt.nz/table/1746
$DESC$;

COMMENT ON TABLE bde.crs_sur_plan_ref IS $DESC$
This is required to spatially position survey plan references for display within Landonline.

The plan reference itself is stored in the Survey table.

https://data.linz.govt.nz/layer/1747
$DESC$;

COMMENT ON TABLE bde.crs_sys_code IS $DESC$
This entity contains a maintainable list of values and parameters etc used for configuring the system.

For a full listing, current as at the time of the original publication of this document, refer to Section 3 of this document. For update to date entries refer to the System Code table.

https://data.linz.govt.nz/table/1648
$DESC$;

COMMENT ON TABLE bde.crs_sys_code_group IS $DESC$
This entity contains all the different groups of system codes.

For update to date entries refer to the System Code Group table.

https://data.linz.govt.nz/table/1593
$DESC$;

COMMENT ON TABLE bde.crs_title IS $DESC$
A title is a record of all estates, encumbrances and easements that affect a piece of land.

This table will also hold Computer Interest Registers (or non-title titles or instruments embodied in the register).

https://data.linz.govt.nz/table/2067
$DESC$;

COMMENT ON TABLE bde.crs_title_action IS $DESC$
Records the titles that are affected by an action.

https://data.linz.govt.nz/table/2002
$DESC$;

COMMENT ON TABLE bde.crs_title_doc_ref IS $DESC$
Stores references to existing title documents or deeds indexes that are affected by instruments.

https://data.linz.govt.nz/table/2004
$DESC$;

COMMENT ON TABLE bde.crs_ttl_enc IS $DESC$
This entity is used to link an encumbrance to the titles it affects.

https://data.linz.govt.nz/table/2010
$DESC$;

COMMENT ON TABLE bde.crs_title_estate IS $DESC$
An estate is a type of ownership of a piece of land e.

g. fee simple estate, leasehold estate. Estates are used to link the proprietor(s) to the title. A title can have more than 1 estate and type.

https://data.linz.govt.nz/table/2068
$DESC$;

COMMENT ON TABLE bde.crs_ttl_hierarchy IS $DESC$
Lists all the prior references for the current title, which may be other prior titles or title document references.

https://data.linz.govt.nz/table/2011
$DESC$;

COMMENT ON TABLE bde.crs_ttl_inst IS $DESC$
A Titles Instrument is a document relating to the transfer of, or other dealing with land.

https://data.linz.govt.nz/table/2012
$DESC$;

COMMENT ON TABLE bde.crs_ttl_inst_title IS $DESC$
Links an instrument to the titles that are affected by the instrument.

https://data.linz.govt.nz/table/2013
$DESC$;

COMMENT ON TABLE bde.crs_title_memorial IS $DESC$
This table contains one row for each current or historical memorial for a title.

All historical memorials for all titles are kept. Current memorials are deleted when they are no longer valid on the title. Note : Titles that existed prior to Landonline only had memorials converted when that title was live and they were current memorials.

https://data.linz.govt.nz/table/2006
$DESC$;

COMMENT ON TABLE bde.crs_title_mem_text IS $DESC$
Contains the actual text of the title memorial.

Note : Titles that existed prior to Landonline only had memorials converted when that title was live and they were current memorials. IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/2007
$DESC$;

COMMENT ON TABLE bde.cbe_title_parcel_association IS $DESC$
This entity is used to associate current titles to current spatial parcels.

https://data.linz.govt.nz/table/2008
$DESC$;

COMMENT ON TABLE bde.crs_transact_type IS $DESC$
This entity contains the different types of transactions managed through workflow, restricted to those used in titles instruments (GRP = ‘TINT’) and survey purpose (GRP = ‘WRKT’).

https://data.linz.govt.nz/table/2009
$DESC$;

COMMENT ON TABLE bde.crs_unit_of_meas IS $DESC$
This entity contains all units of measurement that are accepted into the CRS system.

https://data.linz.govt.nz/table/1748
$DESC$;

COMMENT ON TABLE bde.crs_user IS $DESC$
Landonline user details for surveyors or survey firms who have updated data in Landonline.

IMPORTANT: LINZ would like to remind users that the Privacy Act applies to personal information contained within this dataset, particularly when used in conjunction with other public data. See the LINZ Licence For Personal Data 2.0 Please ensure your use of this data does not breach any conditions of the Act.

https://data.linz.govt.nz/table/2062
$DESC$;

COMMENT ON TABLE bde.crs_vector IS $DESC$
This entity stores the details required to draw and index observations spatially.

Only records with linestring or null geometries are held in this table.

https://data.linz.govt.nz/layer/1979
$DESC$;

COMMENT ON TABLE bde.crs_work IS $DESC$
Provides details of the type of work being undertaken for, or supplied to Land Information NZ which has an impact on the Spatial Record.

https://data.linz.govt.nz/table/2014
$DESC$;

-- Generated by ./xmldict2comment.sh on Thu Nov 30 11:08:11 CET 2017
-- From input: DataDictionary-3.17.zip

COMMENT ON TABLE bde.CRS_TOPOLOGY_CLASS IS $DESC$
[Survey Config] This entity stores the available topology classes.
$DESC$;

COMMENT ON TABLE bde.CRS_IMAGE IS $DESC$
[Common] This entity stores a reference all of the image documents stored within the system.
$DESC$;

COMMENT ON TABLE bde.CRS_VERTX_SEQUENCE IS $DESC$
[Survey] This entity defines the order of points used to construct an irregular line.
$DESC$;

COMMENT ON TABLE bde.CRS_GEODETIC_NODE_NETWORK IS $DESC$
[Survey] Nodes associated with geodetic network.
$DESC$;

COMMENT ON TABLE bde.CRS_NETWORK_PLAN IS $DESC$
[Survey Config] This entity holds information about the graphic view of the proposed design for the various orders of the new Geodetic Datum 2000.  Each Network Plan will be defined as a polygon (see Network Area) and will be produced as a graphic view.  This information is utilized in the definition of the Programme and for the validation of contracted Network schemes.  The graphical representation of these plans will be held as a layer in the spatial component of CRS.
$DESC$;

COMMENT ON TABLE bde.CRS_PROGRAMME IS $DESC$
An annual administrative grouping of contracts, which has been defined
as part of the Geodetic System business plan in association with the
Regional Chief Surveyors and the Surveyor General.

The information held here will relate to the actual contracts, their
monitoring and status and the status of the programme progress.
It will also have links to other business systems such as finance.
Components of this programme will be defined by the Networks plans.
The programme also includes the internal work done by the geodetic staff.
$DESC$;

COMMENT ON TABLE bde.CRS_SURVEY_IMAGE IS $DESC$
[Survey] This entity stores the link between surveys and the images of
plans (as generated from plangen).
$DESC$;

COMMENT ON TABLE bde.CRS_ORDINATE_ADJ IS $DESC$
[Survey] Coordinate Adjustment allows for the identification of the
initial Coordinates used as input to an Adjustment or which were output
from a network Adjustment.  It may also contain quality information
specific to that Coordinate and that Network Adjustment.
$DESC$;

COMMENT ON TABLE bde.CRS_FEATURE_NAME IS $DESC$
[Common] This entity stores all of the names associated with features.
$DESC$;

COMMENT ON TABLE bde.CRS_IMAGE_HISTORY IS $DESC$
[Common] Allows an updated image stored in Centera to be stored,
without losing the prior Centera reference. For example - if a document
is rescanned with better quality settings, the new scan is stored to
Centera and the crs_image row updated with the newly allocated Centera id
(so Landonline now displays the updated scan). This table will then hold
two rows relating to the document image - a row with the Centera id of
the original scan and a row with the Centera id of the updated scan.
$DESC$;

COMMENT ON TABLE bde.CRS_ADJ_OBS_CHANGE IS $DESC$
[Survey] This entity is used to define the observations to be used within
an adjustment and associated inout information.  After the adjustment
has been performed it store changes to observations that will become
effective after the adjustment has been authorised and details about
the quality of the observation.
$DESC$;

COMMENT ON TABLE bde.CRS_GEODETIC_NETWORK IS $DESC$
[Survey Config] Types of geodetic network ( National Reference Frame,
National Deformation Monitoring Network, Regional Deformation Monitoring
Network etc.)
$DESC$;

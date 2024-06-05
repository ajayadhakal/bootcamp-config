# Manifest file downloaded from fusion
externalId: tr-create_asset_hierarchy_ui
name: create_asset_hierarchy_ui
query:
    file: transformation.sql
  /* MAPPING_MODE_ENABLED: false */

  /* {"version":1,"sourceType":"raw","mappings":[{"from":"","to":"externalId","asType":"STRING"},{"from":"","to":"parentExternalId","asType":"STRING"},{"from":"","to":"source","asType":"STRING"},{"from":"","to":"name","asType":"STRING"},{"from":"","to":"description","asType":"STRING"},{"from":"","to":"metadata","asType":"MAP<STRING, STRING>"},{"from":"","to":"dataSetId","asType":"BIGINT"},{"from":"","to":"labels","asType":"ARRAY<STRING>"}]} */

  SELECT
    external_id AS externalId,
    IF(
      parent_external_id = ''
      OR parent_external_id IS NULL,
      '',
      parent_external_id
    ) AS parentExternalId,
    name AS name,
    json_tuple(metadata,'site','type', 'cycle time', 'Function', 'src', 'Machine type') AS (site, type, cycle_time, function, src, machine_type),
    to_metadata(site,type, cycle_time, function, src, machine_type) AS metadata,
    description AS description,
    'from RAW' AS source,
    Dataset_id('src:001:sap:ds') AS dataSetId
  FROM
    `src:001:sap:db`.assets
destination:
  type: asset_hierarchy
ignoreNullFields: true
shared: true
action: upsert
schedule:
  interval: 0 * * * *
  isPaused: false
dataSetExternalId: src:001:sap:ds
# Specify credentials separately like this:
# authentication:
#   read:
#     clientId: ${READ_CLIENT_ID}
#     clientSecret: ${READ_CLIENT_SECRET}
#     tokenUrl: ${READ_TOKEN_URL}
#     cdfProjectName: ${READ_CDF_PROJECT_NAME}
#     # Optional: If idP requires providing the scopes
#     scopes:
#       - ${READ_SCOPES}
#     # Optional: If idP requires providing the audience
#     audience: ${READ_CDF_AUDIENCE}
#   write:
#     clientId: ${WRITE_CLIENT_ID}
#     clientSecret: ${WRITE_CLIENT_SECRET}
#     tokenUrl: ${WRITE_TOKEN_URL}
#     cdfProjectName: ${WRITE_CDF_PROJECT_NAME}
#     # Optional: If idP requires providing the scopes
#     scopes:
#       - ${WRITE_SCOPES}
#     # Optional: If idP requires providing the audience
#     audience: ${WRITE_CDF_AUDIENCE}
# Or together like this:
# authentication:
#   clientId: ${CLIENT_ID}
#   clientSecret: ${CLIENT_SECRET}
#   tokenUrl: ${TOKEN_URL}
#   # Optional: If idP requires providing the scopes
#   cdfProjectName: ${CDF_PROJECT_NAME}
#   scopes:
#    - ${SCOPES}
#   # Optional: If idP requires providing the audience
#   audience: ${AUDIENCE}

# Manifest file downloaded from fusion
externalId: tr-ts_assets_mapping_ui
name: ts_assets_mapping_ui
query: >-
  /* MAPPING_MODE_ENABLED: false */

  /* {"version":1,"sourceType":"raw","mappings":[{"from":"","to":"id","asType":"BIGINT"},{"from":"","to":"name","asType":"STRING"},{"from":"","to":"externalId","asType":"STRING"},{"from":"","to":"metadata","asType":"MAP<STRING, STRING>"},{"from":"","to":"unit","asType":"STRING"},{"from":"","to":"assetId","asType":"BIGINT"},{"from":"","to":"description","asType":"STRING"},{"from":"","to":"securityCategories","asType":"ARRAY<BIGINT>"},{"from":"","to":"isStep","asType":"BOOLEAN"},{"from":"","to":"isString","asType":"BOOLEAN"},{"from":"","to":"dataSetId","asType":"BIGINT"},{"from":"","to":"unitExternalId","asType":"STRING"}]} */

  SELECT ts.externalId AS externalId,
         ast.id AS assetId
  FROM `_cdf`.`timeseries` AS ts

  INNER JOIN `_cdf`.`assets` AS ast ON split(ts.externalId, ":") [0] = ast.externalId
destination:
  type: timeseries
ignoreNullFields: true
shared: true
action: update
dataSetExternalId: src:002:opcua:ds
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

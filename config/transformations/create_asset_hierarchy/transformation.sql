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

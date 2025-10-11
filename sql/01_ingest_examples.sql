CREATE OR REPLACE TABLE `myproj.analytics.stg_events`
PARTITION BY DATE(event_ts)
AS
SELECT * FROM `myproj.raw.events`;
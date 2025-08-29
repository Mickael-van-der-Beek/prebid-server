INSERT INTO
  segments
  (
    id,
    idx,
    is_semantic,
    is_semantic_lookalike,
    is_demographic,
    is_first_id,
    is_third_party_cookie_id,
    is_panel,
    paused_at,
    deletion_date
  )
VALUES
  (
    '81f5de99-9c65-40f8-a149-f4fb641ab82f',
    12348765,
    FALSE,
    FALSE,
    TRUE,
    FALSE,
    TRUE,
    FALSE,
    NULL,
    NULL
  )
;

INSERT INTO
  dim_users
  (
    idx,
    xandr_id,
    first_id
  )
VALUES
  (
    111222333444,
    188852851391655682,
    NULL
  )
;

CREATE TABLE
  segment_ddemo_users_12348765
PARTITION OF
  segment_ddemo_users
FOR VALUES IN
  (
    '12348765'
  )
;
GRANT SELECT ON segment_ddemo_users_12348765 TO rtdp_development;

INSERT INTO
  segment_ddemo_users
  (
    segment_idx,
    user_idx,
    valid
  )
VALUES
  (
    12348765,
    111222333444,
    TRUE
  )
;

CHECKPOINT;

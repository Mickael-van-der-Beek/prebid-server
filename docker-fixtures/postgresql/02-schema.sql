CREATE TABLE
  segments
  (
    id                         UUID          PRIMARY KEY,
    idx                       INTEGER       NOT NULL,
    is_demographic            BOOLEAN       NOT NULL,
    is_first_id               BOOLEAN       NOT NULL,
    is_third_party_cookie_id  BOOLEAN       NOT NULL,
    is_panel                  BOOLEAN       NOT NULL,
    is_semantic               BOOLEAN       NOT NULL,
    is_semantic_lookalike     BOOLEAN       NOT NULL,
    paused_at                 TIMESTAMPTZ,
    deletion_date             TIMESTAMPTZ
  )
;

ALTER TABLE segments REPLICA IDENTITY FULL;

CREATE TABLE
  dim_pages
  (
    idx   INTEGER PRIMARY KEY,
    url   TEXT
  )
;

CREATE TABLE
  dim_users
  (
    idx       BIGINT PRIMARY KEY,
    xandr_id  BIGINT,
    first_id  UUID
  )
;

CREATE TABLE
  segment_ddemo_users
  (
    segment_idx INTEGER,
    user_idx    BIGINT,
    valid       BOOLEAN
  )
PARTITION BY LIST (segment_idx);

ALTER TABLE segment_ddemo_users REPLICA IDENTITY FULL;

CREATE TABLE
  segment_cpanel_pages
  (
    segment_idx INTEGER,
    page_idx    INTEGER
  )
PARTITION BY LIST (segment_idx);

ALTER TABLE segment_cpanel_pages REPLICA IDENTITY FULL;

CREATE TABLE
  segment_csemantic_pages
  (
    segment_idx INTEGER,
    page_idx    INTEGER
  )
PARTITION BY LIST (segment_idx);

ALTER TABLE segment_csemantic_pages REPLICA IDENTITY FULL;

CREATE TABLE
  segment_csemanticll_pages
  (
    segment_idx INTEGER,
    page_idx    INTEGER
  )
PARTITION BY LIST (segment_idx);

ALTER TABLE segment_csemanticll_pages REPLICA IDENTITY FULL;

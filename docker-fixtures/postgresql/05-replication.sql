CREATE PUBLICATION
  rtdp_publication
FOR TABLE
  segments,
  dim_pages,
  dim_users,
  segment_csemantic_pages,
  segment_csemanticll_pages,
  segment_cpanel_pages,
  segment_ddemo_users;

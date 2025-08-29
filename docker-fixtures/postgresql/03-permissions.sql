CREATE ROLE rtdp_development WITH LOGIN REPLICATION PASSWORD 'pdtr';
GRANT CONNECT ON DATABASE rtdp_dev TO rtdp_development;
GRANT USAGE ON SCHEMA public TO rtdp_development;
GRANT SELECT ON dim_users TO rtdp_development;
GRANT SELECT ON dim_pages TO rtdp_development;
GRANT SELECT ON segments TO rtdp_development;
GRANT SELECT ON segment_csemantic_pages TO rtdp_development;
GRANT SELECT ON segment_ddemo_users TO rtdp_development;
GRANT SELECT ON segment_cpanel_pages TO rtdp_development;

CREATE ROLE segment_content_owners;
GRANT CREATE, USAGE ON SCHEMA public TO segment_content_owners;
GRANT SELECT ON segments TO segment_content_owners;
ALTER TABLE segment_csemantic_pages OWNER TO segment_content_owners;
ALTER TABLE segment_csemanticll_pages OWNER TO segment_content_owners;
ALTER TABLE segment_ddemo_users OWNER TO segment_content_owners;
ALTER TABLE segment_cpanel_pages OWNER TO segment_content_owners;
GRANT segment_content_owners TO root;
GRANT segment_content_owners TO rtdp_development;

ALTER SYSTEM SET max_replication_slots TO 10;
ALTER SYSTEM SET wal_level TO 'logical';
ALTER SYSTEM SET synchronous_commit TO 'on';
ALTER SYSTEM SET wal_writer_flush_after TO 0;
ALTER SYSTEM SET wal_writer_delay TO 1;
ALTER SYSTEM SET wal_retrieve_retry_interval TO 300;

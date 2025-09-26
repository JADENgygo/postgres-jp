alter system set logging_collector = 'on';
alter system set log_destination = 'jsonlog';
alter system set log_filename = 'postgresql-%d.log';
alter system set log_truncate_on_rotation = 'on';
alter system set log_min_duration_statement = 1000;
alter system set log_lock_waits = 'on';
select pg_reload_conf();

-- Added a comment to demonstrate a change
-- This is a new comment added on dev branch
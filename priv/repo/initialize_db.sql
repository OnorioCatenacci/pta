-- Create a user specifically to read the database without any ability
-- to modify anything.  Set the password via a separate script (don't want 
-- to store it in version control).

CREATE USER pta_query WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN;

-- Create a user that's allowed to add new data to the db but cannot modify the database in any way
CREATE USER pta_insert WITH NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN;

GRANT pg_read_all_data TO pta_query;
GRANT SELECT ON TABLE venues TO pta_query;
GRANT SELECT ON TABLE performances TO pta_query;

GRANT pg_write_all_data TO pta_insert;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE venues TO pta_insert;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE performances TO pta_insert;

alter session set container = WSO2AM_DB;

CREATE USER gvt IDENTIFIED BY wso2pass
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

grant create session to gvt;
grant dba to gvt;

CREATE TABLESPACE tbsind_gvt;
/
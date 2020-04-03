SET TIMING ON
SET APPINFO ON

PROMPT Enter schema name:
DEFINE SCHEMA_NAME = &&1
PROMPT Enter password:
DEFINE SCHEMA_PASSWORD = &&2

SPOOL INSTALL_LOG.LOG
SET SERVEROUTPUT ON

alter session set "_ORACLE_SCRIPT"=true;

PROMPT ###
PROMPT Executing create_tablespace.sql
PROMPT ###

@create_tablespace.sql &&SCHEMA_NAME

PROMPT ###
PROMPT Executing create_schema.sql
PROMPT ###

@create_schema.sql &&SCHEMA_NAME &&SCHEMA_PASSWORD '&&SCHEMA_NAME._DATA' 

PROMPT ###
PROMPT Executing privilege_schema.sql
PROMPT ###

@privilege_schema.sql &&SCHEMA_NAME

SET SERVEROUTPUT OFF
SPOOL OFF

UNDEFINE SCHEMA_NAME;
UNDEFINE SCHEMA_PASSWORD;
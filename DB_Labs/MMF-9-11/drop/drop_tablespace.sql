DEFINE TABLESPACE_NAME = &&1
DEFINE INDEX_TABLESPACE_NAME = &&2

DROP TABLESPACE &&TABLESPACE_NAME
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

DROP TABLESPACE &&INDEX_TABLESPACE_NAME
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

UNDEFINE TABLESPACE_NAME;
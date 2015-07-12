create table USERS
(
  USERID   NUMBER(3) not null,
  USERNAME VARCHAR2(255) not null,
  PASSWORD VARCHAR2(255) not null,
  FULLNAME VARCHAR2(255),
  EMAIL    VARCHAR2(255),
  LOCALE   CHAR(5),
  TENANT   VARCHAR2(128)
);
alter table USERS
  add constraint PK_USERS primary key (USERID);

create table GROUPS
(
  GROUPID   NUMBER(3) not null,
  GROUPNAME VARCHAR2(255) not null,
  USERID    VARCHAR2(10),
  TENANT    VARCHAR2(128) not null
);

create or replace view objectview as
select
  USERID    as ID,
  USERNAME  as USERNAME,
  FULLNAME  as NAME,
  TENANT      as TENANT,
  '1'    as ISUSER,
  '0'    as ISGROUP
from USERS
union
select
  GROUPID    as ID,
  NULL    as USERNAME,
  GROUPNAME  as NAME,
  TENANT      as TENANT,
  '0'    as ISUSER,
  '1'    as ISGROUP
from GROUPS;
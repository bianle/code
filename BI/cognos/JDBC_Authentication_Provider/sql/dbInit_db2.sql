-- Licensed Materials - Property of IBM
-- IBM Cognos Products: camaaa
-- (C) Copyright IBM Corp. 2011, 2012
-- US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp. 
create table USERS (
	USERID			integer not null ,
	USERNAME		varchar(255) not null ,
	PASSWORD		varchar(255) not null ,
	FULLNAME		varchar(255) ,
	EMAIL			varchar(255) ,
	LOCALE			char(5) ,
	TENANT			varchar(128) ,
	constraint PK_USERS primary key (USERID)
);

create table GROUPS (
	GROUPID			integer not null,
	GROUPNAME		varchar(255) NOT NULL,
	USERID			integer,
	TENANT			varchar(128) not null
);

create view OBJECTVIEW
as
select 
	USERID		as ID,
	USERNAME	as USERNAME,
	FULLNAME	as NAME,
	TENANT      as TENANT,
	1		as ISUSER,
	0		as ISGROUP
from USERS
union
select
	GROUPID		as ID,
	NULL		as USERNAME,
	GROUPNAME	as NAME,
	TENANT      as TENANT,
	0		as ISUSER,
	1		as ISGROUP
from GROUPS;

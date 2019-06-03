-- Input table type: dataset
drop type INPUT_DATA_T;
create type INPUT_DATA_T as table (
	"OUTLOOK" VARCHAR(20),
	"TEMP" INTEGER,
	"HUMIDITY" DOUBLE,
	"WINDY" VARCHAR (10),
	"CLASS" NVARCHAR (20)
);

-- --------------------------------------------------------------------------
-- Create AFL wrappers for the APL function
-- --------------------------------------------------------------------------
-- the AFL wrapper generator needs the signature of the expected stored proc
drop table CREATE_MODEL_AND_TRAIN_SIGNATURE;
create column table CREATE_MODEL_AND_TRAIN_SIGNATURE  like PROCEDURE_SIGNATURE_T;

insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (1, 'HARSHIT','FUNCTION_HEADER_T', 'IN');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (2, 'HARSHIT','OPERATION_CONFIG_T', 'IN');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (3, 'HARSHIT','VARIABLE_DESC_T', 'IN');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (4, 'HARSHIT','VARIABLE_ROLES_T', 'IN');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (5, 'HARSHIT','INPUT_DATA_T', 'IN');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (6, 'HARSHIT','MODEL_BIN_OID_T', 'OUT');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (7, 'HARSHIT','OPERATION_LOG_T', 'OUT');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (8, 'HARSHIT','SUMMARY_T', 'OUT');
insert into CREATE_MODEL_AND_TRAIN_SIGNATURE values (9, 'HARSHIT','INDICATORS_T', 'OUT');

call SYS.AFLLANG_WRAPPER_PROCEDURE_DROP('HARSHIT','APLWRAPPER_CREATE_MODEL_AND_TRAIN');
call SYS.AFLLANG_WRAPPER_PROCEDURE_CREATE('APL_AREA','CREATE_MODEL_AND_TRAIN','HARSHIT', 'APLWRAPPER_CREATE_MODEL_AND_TRAIN', CREATE_MODEL_AND_TRAIN_SIGNATURE);

-- --------------------------------------------------------------------------
-- Create the input/output tables used as arguments for the APL function
-- --------------------------------------------------------------------------
drop table FUNC_HEADER;
create table FUNC_HEADER like FUNCTION_HEADER_T;
insert into FUNC_HEADER values ('Oid', '#42');
insert into FUNC_HEADER values ('LogLevel', '8');
insert into FUNC_HEADER values ('ModelFormat', 'bin');

drop table CREATE_AND_TRAIN_CONFIG;
create table CREATE_AND_TRAIN_CONFIG like OPERATION_CONFIG_T;
insert into CREATE_AND_TRAIN_CONFIG values ('APL/ModelType', 'regression/classification');
insert into CREATE_AND_TRAIN_CONFIG values ('APL/VariableAutoSelection', 'true');
insert into CREATE_AND_TRAIN_CONFIG values ('APL/VariableSelectionBestIteration', 'true');

drop table VARIABLE_DESC;
create table VARIABLE_DESC like VARIABLE_DESC_T;
-- let this table empty to use guess variables

drop table VARIABLE_ROLES;
create table VARIABLE_ROLES like VARIABLE_ROLES_T;
-- variable roles are optional, hence the empty table

drop table MODEL_TRAIN_BIN;
create table MODEL_TRAIN_BIN like MODEL_BIN_OID_T;

drop table OPERATION_LOG;
create table OPERATION_LOG like OPERATION_LOG_T;

drop table SUMMARY;
create table SUMMARY like SUMMARY_T;

drop table INDICATORS;
create table INDICATORS like INDICATORS_T;


-- --------------------------------------------------------------------------
-- Execute the APL function using its AFL wrapper and the actual input/output tables
-- --------------------------------------------------------------------------
call APLWRAPPER_CREATE_MODEL_AND_TRAIN(FUNC_HEADER, CREATE_AND_TRAIN_CONFIG, VARIABLE_DESC, VARIABLE_ROLES, APL_DT_DATA_TBL, MODEL_TRAIN_BIN, OPERATION_LOG, SUMMARY, INDICATORS) with overview;
select * from "HARSHIT"."MODEL_TRAIN_BIN";
select * from "HARSHIT"."OPERATION_LOG";
select * from "HARSHIT"."SUMMARY";
select * from "HARSHIT"."INDICATORS";


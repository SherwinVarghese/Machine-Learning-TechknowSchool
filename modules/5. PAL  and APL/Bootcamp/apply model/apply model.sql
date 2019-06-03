DROP TABLE APL_DT_SCORING_DATA_TBL;
CREATE COLUMN TABLE APL_DT_SCORING_DATA_TBL (
    "OUTLOOK" VARCHAR(20),
	"TEMP" INTEGER,
	"HUMIDITY" DOUBLE,
	"WINDY" VARCHAR(10)
);

INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Overcast', 75, 70, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Rain', 71, 80, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Sunny', 66, 70, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Sunny', 69, 70, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Rain', 65, 70, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Rain', 70, 70, 'Yes');
INSERT INTO APL_DT_SCORING_DATA_TBL VALUES ('Overcast', 70, 70, 'Yes');

drop type INPUT_DATA_T;
create type INPUT_DATA_T as table (
	"OUTLOOK" VARCHAR(20),
	"TEMP" INTEGER,
	"HUMIDITY" DOUBLE,
	"WINDY" VARCHAR (10)
);


-- Ouput table type: dataset
drop type OUTPUT_T;
create type OUTPUT_T as table (
    "KxIndex" INTEGER,
    "CLASS" NVARCHAR(20),
    "rr_CLASS" DOUBLE,
    "decision_rr_CLASS" NVARCHAR(20),
    proba_decision_rr_CLASS DOUBLE
);

-- --------------------------------------------------------------------------
-- Create AFL wrappers for the APL function
-- --------------------------------------------------------------------------
-- the AFL wrapper generator needs the signature of the expected stored proc
drop table APPLY_MODEL_SIGNATURE;
create column table APPLY_MODEL_SIGNATURE  like PROCEDURE_SIGNATURE_T;

insert into APPLY_MODEL_SIGNATURE values (1, 'HARSHIT','FUNCTION_HEADER_T',  'IN');
insert into APPLY_MODEL_SIGNATURE values (2, 'HARSHIT','MODEL_BIN_OID_T',     'IN');
insert into APPLY_MODEL_SIGNATURE values (3, 'HARSHIT','OPERATION_CONFIG_T', 'IN');
insert into APPLY_MODEL_SIGNATURE values (4, 'HARSHIT','INPUT_DATA_T',          'IN');
insert into APPLY_MODEL_SIGNATURE values (5, 'HARSHIT','OUTPUT_T',      'OUT');
insert into APPLY_MODEL_SIGNATURE values (6, 'HARSHIT','OPERATION_LOG_T',    'OUT');

call SYS.AFLLANG_WRAPPER_PROCEDURE_DROP('HARSHIT','APLWRAPPER_APPLY_MODEL');
call SYS.AFLLANG_WRAPPER_PROCEDURE_CREATE('APL_AREA','APPLY_MODEL','HARSHIT', 'APLWRAPPER_APPLY_MODEL', APPLY_MODEL_SIGNATURE);


-- --------------------------------------------------------------------------
-- Create the input/output tables used as arguments for the APL function
-- --------------------------------------------------------------------------
drop table FUNC_HEADER;
create table FUNC_HEADER like FUNCTION_HEADER_T;
insert into FUNC_HEADER values ('Oid', '#42');
insert into FUNC_HEADER values ('LogLevel', '8');
insert into FUNC_HEADER values ('ModelFormat', 'bin');


drop table APPLY_CONFIG;
create table APPLY_CONFIG like OPERATION_CONFIG_T;
insert into APPLY_CONFIG values ('APL/ApplyExtraMode', 'Decision');


drop table APL_APPLY_OUT;
create column table APL_APPLY_OUT like OUTPUT_T;

drop table APPLY_LOG;
create column table APPLY_LOG like OPERATION_LOG_T;

-- --------------------------------------------------------------------------
-- Execute the APL function using its AFL wrapper and the actual input/output tables
-- --------------------------------------------------------------------------
call APLWRAPPER_APPLY_MODEL(FUNC_HEADER, MODEL_TRAIN_BIN, APPLY_CONFIG, APL_DT_SCORING_DATA_TBL, APL_APPLY_OUT, APPLY_LOG) with overview;
select * from "HARSHIT"."APL_APPLY_OUT";
select * from "HARSHIT"."APPLY_LOG";

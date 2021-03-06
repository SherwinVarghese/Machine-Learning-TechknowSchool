DROP TABLE APL_DT_DATA_TBL;
CREATE COLUMN TABLE APL_DT_DATA_TBL (
    "OUTLOOK" VARCHAR(20),
	"TEMP" INTEGER,
	"HUMIDITY" DOUBLE,
	"WINDY" VARCHAR(10),
	"CLASS" VARCHAR(20)
);
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 75, 70, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 80, 90, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 85, 85, 'No', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 72, 95, 'No', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 69, 70, 'No', 'Play');

INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 72, 90, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 83, 78, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 64, 65, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 81, 75, 'No', 'Play');

INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 71, 80, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 65, 70, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 75, 80, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 68, 80, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 70, 96, 'No', 'Play');

INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 75, 70, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 75, 92, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 89, 87, 'No', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 72, 92, 'No', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Sunny', 67, 68, 'No', 'Play');

INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 70, 89, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 81, 76, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 65, 63, 'Yes', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Overcast', 79, 73, 'No', 'Play');

INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 73, 82, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 63, 72, 'Yes', 'Do not Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 74, 81, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 67, 82, 'No', 'Play');
INSERT INTO APL_DT_DATA_TBL VALUES ('Rain', 71, 98, 'No', 'Play');
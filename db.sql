-- public."HOLIDAY" definition

-- Drop table

-- DROP TABLE public."HOLIDAY";

CREATE TABLE public."HOLIDAY" (
	"HOLIDAY_DATE" date NOT NULL,
	"HOLIDAY_NAME" varchar(100) NOT NULL,
	"HOLIDAY_DESCRIPTION" varchar(4000) NULL,
	"CREATED_AT" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT "HOLIDAY_pkey" PRIMARY KEY ("HOLIDAY_DATE")
);


-- public."LEAVE_HISTORY" definition

-- Drop table

-- DROP TABLE public."LEAVE_HISTORY";

CREATE TABLE public."LEAVE_HISTORY" (
	"LEAVE_ID" serial4 NOT NULL,
	"EMPLOYEE_ID" int4 NULL,
	"LEAVE_TYPE" varchar(50) NULL,
	"START_DATE" date NULL,
	"END_DATE" date NULL,
	"APPLY_DATE" timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	"REASON" varchar(255) NULL,
	"STATUS" varchar(20) NULL,
	"APPROVAL_BY" varchar(100) NULL,
	"APPROVAL_DATE" date NULL,
	"DURATION" int4 DEFAULT 22 NULL,
	CONSTRAINT "LEAVE_DATES_VALID" CHECK (("START_DATE" <= "END_DATE")),
	CONSTRAINT "LEAVE_HISTORY_pkey" PRIMARY KEY ("LEAVE_ID")
);

-- Table Triggers

create trigger "CHECK_YEAR_BEFORE_INSERT" before
insert
    on
    public."LEAVE_HISTORY" for each row execute function check_year_before_insert();


-- public."LEAVE_HISTORY" foreign keys

ALTER TABLE public."LEAVE_HISTORY" ADD CONSTRAINT "FK_EMPLOYEE_ID" FOREIGN KEY ("EMPLOYEE_ID") REFERENCES public."EMPLOYEE"("EMPLOYEEID");


-- public."EMPLOYEE" definition

-- Drop table

-- DROP TABLE public."EMPLOYEE";

CREATE TABLE public."EMPLOYEE" (
	"EMPLOYEEID" serial4 NOT NULL,
	"FIRSTNAME" varchar(50) NULL,
	"LASTNAME" varchar(50) NULL,
	"EMAIL" varchar(100) NULL,
	"POSITION" varchar(50) NULL,
	"DEPARTMENT" varchar(50) NULL,
	"DATEOFBIRTH" date NULL,
	"GENDER" varchar(10) NULL,
	"PHONENUMBER" varchar(20) NOT NULL,
	"ADDRESS" varchar(255) NULL,
	"STATUS" varchar(20) NULL,
	"EMPLOYEEPHOTO" bytea NULL,
	"LEAVEBALANCE" numeric(5, 1) NULL,
	"ISADMIN" int2 NULL,
	"ISACTIVE" int2 NULL,
	"OTP" int4 NULL,
	CONSTRAINT "EMPLOYEE_EMAIL_key" UNIQUE ("EMAIL"),
	CONSTRAINT "EMPLOYEE_PHONENUMBER_key" UNIQUE ("PHONENUMBER"),
	CONSTRAINT "EMPLOYEE_pkey" PRIMARY KEY ("EMPLOYEEID")
);
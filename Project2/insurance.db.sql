BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "BillingAccount" (
	"AccountName"	TEXT,
	"StartDate"	INTEGER,
	FOREIGN KEY("AccountName") REFERENCES "Account"("AccountName")
);
CREATE TABLE IF NOT EXISTS "Associate" (
	"AssociateName"	TEXT NOT NULL,
	"AssocSuffix"	TEXT,
	"AssocDOB"	INTEGER,
	"RelationType"	TEXT,
	"RelationTypeDate"	INTEGER,
	PRIMARY KEY("AssociateName")
);
CREATE TABLE IF NOT EXISTS "CompanyCode" (
	"CompanyCode"	INTEGER NOT NULL,
	"CompanyName"	TEXT,
	PRIMARY KEY("CompanyCode")
);
CREATE TABLE IF NOT EXISTS "WritingNumber" (
	"WritingNumber"	INTEGER NOT NULL,
	PRIMARY KEY("WritingNumber")
);
CREATE TABLE IF NOT EXISTS "ManagerContract" (
	"SitCode"	INTEGER NOT NULL,
	"IssueDate"	INTEGER,
	"AssoName"	TEXT,
	"CompanyCode"	INTEGER,
	"WritingNumber"	INTEGER,
	FOREIGN KEY("AssoName") REFERENCES "Associate"("AssociateName"),
	FOREIGN KEY("CompanyCode") REFERENCES "CompanyCode"("CompanyCode"),
	FOREIGN KEY("WritingNumber") REFERENCES "WritingNumber"("WritingNumber"),
	PRIMARY KEY("SitCode")
);
CREATE TABLE IF NOT EXISTS "Account" (
	"AccountName"	TEXT NOT NULL,
	"LocationCity"	TEXT,
	"LocationState"	TEXT,
	"LocationZip"	INTEGER,
	"AliasSource"	TEXT,
	"AliasID"	INTEGER,
	"CompanyCode"	INTEGER,
	FOREIGN KEY("CompanyCode") REFERENCES "CompanyCode"("CompanyCode"),
	PRIMARY KEY("AccountName")
);
CREATE TABLE IF NOT EXISTS "AccountAdmin" (
	"AdminName"	TEXT NOT NULL,
	"AdminAddress"	TEXT,
	"AccountName"	TEXT,
	FOREIGN KEY("AccountName") REFERENCES "Account"("AccountName"),
	PRIMARY KEY("AdminName")
);
CREATE TABLE IF NOT EXISTS "AccountMember" (
	"AccountName"	TEXT,
	"StartDate"	INTEGER,
	FOREIGN KEY("AccountName") REFERENCES "Account"("AccountName")
);
CREATE TABLE IF NOT EXISTS "Customer" (
	"Name"	TEXT NOT NULL,
	"CustSuffix"	TEXT,
	"CustDOB"	INTEGER,
	"ContractNumber"	INTEGER,
	FOREIGN KEY("ContractNumber") REFERENCES "Contract"("ContractNumber"),
	PRIMARY KEY("Name")
);
CREATE TABLE IF NOT EXISTS "ContractBenefit" (
	"ContractNumber"	INTEGER,
	"SeriesName"	TEXT,
	"PlanName"	TEXT,
	FOREIGN KEY("ContractNumber") REFERENCES "Contract"("ContractNumber")
);
CREATE TABLE IF NOT EXISTS "ContractPremium" (
	"PremiumCode"	INTEGER NOT NULL,
	"Commissions"	INTEGER,
	"ProductionCredict"	INTEGER,
	"ContractNumber"	INTEGER,
	FOREIGN KEY("ContractNumber") REFERENCES "Contract"("ContractNumber"),
	PRIMARY KEY("PremiumCode")
);
CREATE TABLE IF NOT EXISTS "Contract" (
	"ContractNumber"	INTEGER NOT NULL,
	"Seller"	TEXT,
	"AccountName"	TEXT,
	"CompanyCode"	INTEGER,
	FOREIGN KEY("AccountName") REFERENCES "Account"("AccountName"),
	FOREIGN KEY("CompanyCode") REFERENCES "CompanyCode"("CompanyCode"),
	PRIMARY KEY("ContractNumber")
);
INSERT INTO "BillingAccount" VALUES ('Samil',815);
INSERT INTO "BillingAccount" VALUES ('Pamela',527);
INSERT INTO "Associate" VALUES ('CC','x',423,'A',707);
INSERT INTO "Associate" VALUES ('VC','y',1118,'B',808);
INSERT INTO "CompanyCode" VALUES (1,'Freeeye');
INSERT INTO "CompanyCode" VALUES (2,'Tatte');
INSERT INTO "CompanyCode" VALUES (3,'Star');
INSERT INTO "WritingNumber" VALUES (33);
INSERT INTO "WritingNumber" VALUES (34);
INSERT INTO "ManagerContract" VALUES (1,708,'CC',3,33);
INSERT INTO "ManagerContract" VALUES (2,809,'VC',2,34);
INSERT INTO "Account" VALUES ('Mary','New York','NY',10002,'kaggle',1,3);
INSERT INTO "Account" VALUES ('Pamela','New York','NY',10003,'kaggle',2,1);
INSERT INTO "Account" VALUES ('Cynthia','Rochester','NY',14086,'kaggle',3,2);
INSERT INTO "Account" VALUES ('Rose','Houston','TX',77494,'kaggle',4,1);
INSERT INTO "Account" VALUES ('Samil','Houston','TX',75034,'kaggle',5,3);
INSERT INTO "AccountAdmin" VALUES ('Nancy','Washington','Mary');
INSERT INTO "AccountAdmin" VALUES ('David','California','Rose');
INSERT INTO "AccountMember" VALUES ('Cynthia',305);
INSERT INTO "AccountMember" VALUES ('Samil',608);
INSERT INTO "AccountMember" VALUES ('Mary',912);
INSERT INTO "AccountMember" VALUES ('Rose',1203);
INSERT INTO "Customer" VALUES ('Ann','ms',101,1);
INSERT INTO "Customer" VALUES ('Bod','mr',1010,2);
INSERT INTO "ContractBenefit" VALUES (1,'6','12');
INSERT INTO "ContractBenefit" VALUES (2,'7','13');
INSERT INTO "ContractPremium" VALUES (1,30000,30,1);
INSERT INTO "ContractPremium" VALUES (2,2400,5,2);
INSERT INTO "Contract" VALUES (1,'Apple','Mary',2);
INSERT INTO "Contract" VALUES (2,'Circle','Samil',1);
COMMIT;
